package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.Network;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import android.widget.Button;
import android.widget.TextView;
import android.widget.LinearLayout;
import java.io.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.*;

/** Optional confirmation before the native submit entry; no HTTP or draft writes. */
public final class PostingIpWarning {
    static final String KEY="ipPostWarningNetworks";
    static boolean supported(Context context){
        try{String v=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
            return "0.8.10.191 dev".equals(v)||"0.8.10.226 dev".equals(v)||"0.8.10.242 dev".equals(v);
        }catch(Exception e){return false;}
    }
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final Map<Object,Binding> bindings=new WeakHashMap<>();
    private static final Set<Object> pending=Collections.newSetFromMap(new WeakHashMap<>());
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(2,2,30,TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(8),r->new Thread(r,"Haiagaru-IP-warning"));
    private static final class Binding {
        final WeakReference<Object> fragment,model;final WeakReference<Activity> activity;final String version;
        Binding(Object f,Object m,Activity a,String v){fragment=new WeakReference<>(f);model=new WeakReference<>(m);activity=new WeakReference<>(a);version=v;}
    }
    private static final class State {
        final String url;final int route;final File dat;final boolean cellular;final Network network;
        State(String u,int r,File f,boolean c,Network n){url=u;route=r;dat=f;cellular=c;network=n;}
        boolean same(State other){return other!=null&&url.equals(other.url)&&route==other.route&&cellular==other.cellular&&(cellular||Objects.equals(network,other.network));}
    }
    static void editor(Object fragment,Object model){
        Activity a=ExternalBoardAuth.activity(fragment);if(a==null)return;
        try{
            String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
            if(!version.equals("0.8.10.191 dev")&&!version.equals("0.8.10.226 dev")&&!version.equals("0.8.10.242 dev"))return;
            bindings.put(version.contains("242")?model:fragment,new Binding(fragment,model,a,version));
        }catch(Exception e){android.util.Log.w("Haiagaru","IP warning editor registration failed",e);}
    }
    private static Object field(Object o,String name)throws Exception{return NativeFields.find(o.getClass(),name).get(o);}
    private static Object call(Object o,String name)throws Exception{Method m=o.getClass().getDeclaredMethod(name);m.setAccessible(true);return m.invoke(o);}
    private static int selected(Activity a){return a.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getInt(KEY,0)&3;}
    private static int route(Activity a,boolean cellular,Network network){
        if(cellular)return 2;
        ConnectivityManager cm=(ConnectivityManager)a.getSystemService(Context.CONNECTIVITY_SERVICE);
        if(cm==null)return 0;
        if(android.os.Build.VERSION.SDK_INT>=23){
            NetworkCapabilities caps=cm.getNetworkCapabilities(network);
            if(caps==null||caps.hasTransport(NetworkCapabilities.TRANSPORT_VPN))return 0;
            if(caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))return 1;
            if(caps.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))return 2;
        }else{
            android.net.NetworkInfo info=cm.getActiveNetworkInfo();if(info!=null&&info.isConnected()){
                if(info.getType()==ConnectivityManager.TYPE_WIFI)return 1;
                if(info.getType()==ConnectivityManager.TYPE_MOBILE)return 2;
            }
        }return 0;
    }
    private static State state(Binding b)throws Exception{
        Activity a=b.activity.get();Object f=b.fragment.get(),m=b.model.get();if(a==null||f==null||m==null)return null;
        if(!Boolean.TRUE.equals(f.getClass().getMethod("isAdded").invoke(f))||f.getClass().getMethod("getView").invoke(f)==null)return null;
        boolean old=b.version.contains("191"),middle=b.version.contains("226");
        Object mode=field(m,old?"o":middle?"r":"x");
        if(!(mode instanceof Enum)||((Enum<?>)mode).name().equals("Thread"))return null;
        Object target=field(m,old?"w":middle?"P":"T");if(target==null)return null;
        String url=(String)call(target,old?"i":middle?"G":"A");if(url==null)return null;
        Object id=field(target,middle?"c":"e");if(!(id instanceof Number))return null;
        String board=RefreshTargets.nativeBoard(target,b.version).toString();
        if(board.contains("/")||board.contains("\\")||board.contains(".."))throw new IOException("Invalid native board key");
        Object transport=call(old?f:m,old?"j":middle?"c":"b");
        boolean cellular=transport instanceof Enum&&((Enum<?>)transport).name().equals("CELLULAR");
        ConnectivityManager cm=(ConnectivityManager)a.getSystemService(Context.CONNECTIVITY_SERVICE);
        Network network=cm!=null&&android.os.Build.VERSION.SDK_INT>=23?cm.getActiveNetwork():null;
        return new State(url,route(a,cellular,network),new File(new File(HaiagaruSyncSnapshot.externalRoot(a),"dat"),board+"_"+((Number)id).longValue()+".dat"),cellular,network);
    }
    /** 1=IP visible, 0=no indication in available headers, -1=unavailable. Bounded disk-only read. */
    static int inspect(File dat){
        if(!dat.isFile())return -1;
        try(Reader reader=new BufferedReader(new InputStreamReader(new FileInputStream(dat),Charset.forName("MS932")))){
            StringBuilder line=new StringBuilder();int count=0,rows=0,ch;boolean any=false;
            while(count++<262144&&(ch=reader.read())!=-1){
                if(ch=='\n'){
                    String[] fields=line.toString().split("<>",8);line.setLength(0);
                    if(fields.length>=4){any=true;int offset=fields.length>=7&&fields[0].matches("[0-9]{1,7}")?1:0;
                        String name=org.jsoup.parser.Parser.unescapeEntities(fields[offset],false);
                        if(PostingIpRules.exposes(name,rows==0?fields[3+offset]:null))return 1;}
                    if(++rows>=32)break;
                }else line.append((char)ch);
            }
            if(rows==0&&line.length()>0){String[] fields=line.toString().split("<>",8);if(fields.length>=4){any=true;int offset=fields.length>=7&&fields[0].matches("[0-9]{1,7}")?1:0;if(PostingIpRules.exposes(fields[offset],fields[3+offset]))return 1;}}
            return any?0:-1;
        }catch(Exception e){return -1;}
    }
    public static boolean intercept(Object owner){
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null||context.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getInt(KEY,0)==0)return false;
        Binding b=bindings.get(owner);if(b==null){Toast.makeText(context,"IP表示の確認情報がありません。書き込み画面を開き直してください（未送信）。",Toast.LENGTH_LONG).show();return true;}
        Activity a=b.activity.get();if(a==null||a.isFinishing()||a.isDestroyed())return true;
        if(pending.contains(owner))return true;
        try{
            State s=state(b);if(s==null||!PostingIpRules.warn(selected(a),s.route))return false;
            pending.add(owner);
            IO.execute(()->{int result=inspect(s.dat);MAIN.post(()->checked(owner,b,s,result));});
        }catch(Exception e){pending.remove(owner);Toast.makeText(a,"IP表示の確認を開始できません。書き込みは送信していません。",Toast.LENGTH_LONG).show();android.util.Log.w("Haiagaru","IP warning failed",e);}
        return true;
    }
    private static void checked(Object owner,Binding b,State s,int result){
        Activity a=b.activity.get();if(a==null||a.isFinishing()||a.isDestroyed()){pending.remove(owner);return;}
        try{
            State current=state(b);if(current==null){pending.remove(owner);return;}
            if(!s.same(current)){pending.remove(owner);if(!intercept(owner))submit(owner);return;}
            if(result==0||!PostingIpRules.warn(selected(a),s.route)){pending.remove(owner);submit(owner);return;}
            String network=s.route==1?"Wi-Fi":s.route==2?"モバイル回線":"回線不明（VPNなど）";
            String message=result==1?"このスレッドはIPアドレスが表示されます。":"保存済みのレスからIP表示の有無を確認できません。IPアドレスが公開される可能性があります。";
            LinearLayout body=new LinearLayout(a);body.setOrientation(LinearLayout.VERTICAL);
            TextView description=new TextView(a);description.setText(message+"\n\n使用回線："+network+"\nこの回線で書き込みますか？");body.addView(description);
            TextView ip=new TextView(a);ip.setText("IPを確認する場合は、外部サービス ipify.org に接続します。取得したIPは参考値で、投稿先に記録されるIPと異なる場合があります。");body.addView(ip);
            Button lookup=new Button(a);lookup.setText("送信元IPを確認");body.addView(lookup);
            lookup.setOnClickListener(v->{lookup.setEnabled(false);ip.setText("選択した回線のIPを確認しています…");
                try{IO.execute(()->{String value;try{value=PostingPublicIp.fetch(a.getApplicationContext(),s.cellular,s.network);}catch(Exception e){value="IPを取得できませんでした。確認先・回線の接続状態を確認してください。";}
                    final String text=value;MAIN.post(()->{if(!pending.contains(owner)||a.isFinishing()||a.isDestroyed())return;
                        try{ip.setText(s.same(state(b))?"確認時点の参考IP\n"+text+"\n投稿先に記録されるIPは、IPv4／IPv6・VPN・プロキシ・回線の変更で異なる場合があります。":"回線または投稿先が変更されました。確認画面を閉じてやり直してください。");}catch(Exception e){ip.setText("回線を再確認できませんでした。");}lookup.setEnabled(true);});});}
                catch(RejectedExecutionException e){ip.setText("他のIP確認が終了してから再度お試しください。");lookup.setEnabled(true);}});
            new HaiagaruDialog.Builder(a).setTitle("書き込み前のIP表示確認")
                .setView(body)
                .setNegativeButton("戻る",(d,w)->pending.remove(owner))
                .setPositiveButton("書き込む",(d,w)->{pending.remove(owner);try{State latest=state(b);if(latest==null)return;if(s.same(latest))submit(owner);else if(!intercept(owner))submit(owner);}catch(Exception e){failed(a,e);}})
                .setOnCancelListener(d->pending.remove(owner)).show();
        }catch(Exception e){pending.remove(owner);failed(a,e);}
    }
    private static void submit(Object owner)throws Exception{owner.getClass().getMethod("haiagaruIpConfirmed").invoke(owner);}
    private static void failed(Activity a,Exception e){Toast.makeText(a,"送信処理を開始できませんでした。本文を確認して再度お試しください。",Toast.LENGTH_LONG).show();android.util.Log.w("Haiagaru","IP confirmation continuation failed",e);}
    private PostingIpWarning(){}
}
