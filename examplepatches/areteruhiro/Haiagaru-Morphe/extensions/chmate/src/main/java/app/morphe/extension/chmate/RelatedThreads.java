package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.text.Html;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.concurrent.*;

/** Supplements only an explicitly opened native next-thread search. No polling or posting. */
public final class RelatedThreads {
    public static final String KEY="relatedNextThreadSearch";
    private static final String PREFS="io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final ExecutorService IO=Executors.newSingleThreadExecutor();
    private static final Map<Object,Boolean> OPEN=Collections.synchronizedMap(new WeakHashMap<>());
    private RelatedThreads(){}
    public static void addSettings(android.widget.LinearLayout root,Activity a){
        android.widget.Switch s=new android.widget.Switch(a);s.setText("エッヂの次スレ検索に関連スレ候補も表示");
        s.setChecked(a.getSharedPreferences(PREFS,0).getBoolean(KEY,false));root.addView(s);
        s.setOnCheckedChangeListener((v,on)->a.getSharedPreferences(PREFS,0).edit().putBoolean(KEY,on).apply());
        TextView note=new TextView(a);note.setText("次スレ検索を開くと、同じ板・7日以内に作成された新しいスレから、共通語を含む候補も探します。板一覧から元スレが消えている場合は「関連・次スレ候補」と表示します。候補は推測で、自動移動しません。");note.setTextSize(13);root.addView(note);
    }
    public static void onSearch(Object fragment){
        Activity a=Haiagaru.toolbarActivity(fragment);
        if(a==null||a.isFinishing()||!a.getSharedPreferences(PREFS,0).getBoolean(KEY,false)||OPEN.containsKey(fragment))return;
        try {
            Bundle args=(Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);
            if(args==null||args.getInt("actMode",0)!=1)return;
            String url=args.getString("relUrl"),title=args.getString(Intent.EXTRA_SUBJECT);
            RelatedThreadRules.Source source=RelatedThreadRules.source(url);
            if(source==null||title==null||title.trim().isEmpty())return;
            OPEN.put(fragment,true);
            IO.execute(()->load(a,fragment,source,title));
        } catch(Exception e){android.util.Log.w("Haiagaru","Related search arguments unavailable",e);}
    }
    private static String fetch(RelatedThreadRules.Source source)throws Exception {
        HttpURLConnection c=(HttpURLConnection)new URL(source.origin+"/"+source.board+"/subject.txt").openConnection();
        c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setInstanceFollowRedirects(false);
        try {
            if(c.getResponseCode()!=200)throw new IOException("HTTP "+c.getResponseCode());
            try(InputStream in=c.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] buffer=new byte[8192];int n;
                while((n=in.read(buffer))!=-1){if(out.size()+n>4*1024*1024)throw new IOException("Subject too large");out.write(buffer,0,n);}
                String type=c.getContentType();
                java.util.regex.Matcher charset=java.util.regex.Pattern.compile("charset\\s*=\\s*[\"']?([^;\\s\"']+)",java.util.regex.Pattern.CASE_INSENSITIVE).matcher(type==null?"":type);
                Charset encoding=Charset.forName(charset.find()?charset.group(1):"MS932");
                String text=new String(out.toByteArray(),encoding);
                if(!text.matches("(?s).*\\d{9,11}\\.dat<>.*"))throw new IOException("Invalid subject response");
                return text;
            }
        }finally{c.disconnect();}
    }
    private static boolean attached(Object f,Activity a){
        try{return !a.isFinishing()&&!a.isDestroyed()&&(Boolean)f.getClass().getMethod("isAdded").invoke(f)
                &&(Boolean)f.getClass().getMethod("isResumed").invoke(f)
                &&a==f.getClass().getMethod("getActivity").invoke(f);}
        catch(Exception e){return false;}
    }
    private static void load(Activity a,Object fragment,RelatedThreadRules.Source source,String title){
        try {
            String subject=fetch(source);List<RelatedThreadRules.Row> rows=RelatedThreadRules.candidates(subject,title,source.id);
            boolean missing=!RelatedThreadRules.listed(subject,source.id);
            a.runOnUiThread(()->{
                if(!attached(fragment,a)||!a.getSharedPreferences(PREFS,0).getBoolean(KEY,false)){OPEN.remove(fragment);return;}
                String[] labels=new String[rows.size()];for(int i=0;i<labels.length;i++)labels[i]=Html.fromHtml(rows.get(i).title).toString();
                HaiagaruDialog.Builder dialog=new HaiagaruDialog.Builder(a).setTitle(missing?"関連・次スレ候補":"次スレ検索・関連候補")
                        .setNegativeButton("標準の検索結果に戻る",(d,w)->{});
                if(rows.isEmpty())dialog.setMessage("関連候補は見つかりませんでした。標準の検索結果も確認できます。");
                else dialog.setItems(labels,(d,index)->{
                    Intent intent=new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(source.origin+"/test/read.cgi/"+source.board+"/"+rows.get(index).id+"/"));
                    intent.setClassName(a, "jp.syoboi.a2chMate.activity.ResListActivity");
                    try{a.startActivity(intent);}catch(Exception e){Toast.makeText(a,"スレを開けませんでした",Toast.LENGTH_LONG).show();}
                });
                dialog.setOnDismissListener(d->OPEN.remove(fragment)).show();
            });
        }catch(Exception error){a.runOnUiThread(()->{OPEN.remove(fragment);if(attached(fragment,a))Toast.makeText(a,"関連候補を取得できませんでした。標準の検索結果を確認してください",Toast.LENGTH_LONG).show();});}
    }
}
