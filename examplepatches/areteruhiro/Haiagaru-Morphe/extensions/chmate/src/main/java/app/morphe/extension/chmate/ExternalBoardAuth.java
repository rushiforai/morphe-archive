package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Context;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.CookieManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ScrollView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;

/** Explicit HTTPS-origin opt-in; native HTTP never receives unrelated WebView cookies. */
public final class ExternalBoardAuth {
    private static volatile Context context;
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    private static final Map<Activity,String> targets = new WeakHashMap<>();
    private static final Map<Activity,WeakReference<android.view.View>> editors = new WeakHashMap<>();
    private static final Map<Activity,WeakReference<EditText>> bodies = new WeakHashMap<>();
    private static final Map<Activity,WeakReference<Object>> owners = new WeakHashMap<>();
    private static final Map<MenuItem,WeakReference<Activity>> menus = new WeakHashMap<>();
    private static final Map<Activity,String> prompted = new WeakHashMap<>();
    private static final Map<Activity,String> challenges = new WeakHashMap<>();
    private static final int MENU = 0x48690061;
    private static volatile WeakReference<Object> nativeJar = new WeakReference<>(null);
    private ExternalBoardAuth() {}
    static SharedPreferences prefs(Context c) { return c.getSharedPreferences("haiagaru.external-board-auth",0); }
    public static void initialize(Context c) { context=c.getApplicationContext(); }
    public static void rememberJar(Object jar) { nativeJar=new WeakReference<>(jar); }
    static Object nativeJar(){return nativeJar.get();}
    static String targetBoard(Object owner){Activity activity=activity(owner);return activity==null?null:BoardCookiePolicy.board(targets.get(activity),null);}
    public static Object parseUrl(String address) { return null; } // Bound at patch time.

    /** Seed the existing native identity before the first authentication request, not afterwards. */
    static void prepareWebSession(Activity activity,String board,String auth,Runnable ready) {
        if(!BoardCookies.beginAuth(activity)){
            Toast.makeText(activity,"他の認証画面を閉じてからお試しください。板ごとのCookieを保護するため同時に開けません。",Toast.LENGTH_LONG).show();activity.finish();return;
        }
        final Object jar=nativeJar.get();
        new Thread(()->{
            ArrayList<String[]> seed=new ArrayList<>();
            try {
                if(jar==null)throw new IllegalStateException("Native cookie jar not initialized");
                for(String address:new String[]{board,auth}) {
                    // Only seed this board's origin, never an unrelated authentication provider.
                    if(!BoardAuthRules.origin(board).equals(BoardAuthRules.origin(address)))continue;
                    Object url=parseUrl(address);if(url==null)continue;
                    java.lang.reflect.Method read=jar.getClass().getDeclaredMethod("haiagaruNativeAuthCookies",url.getClass());
                    read.setAccessible(true);
                    for(Object cookie:BoardCookies.authCookies(board,(List<?>)read.invoke(jar,url),url))seed.add(new String[]{address,cookie.toString()});
                }
            }catch(Exception error){
                activity.runOnUiThread(()->{
                    if(activity.isFinishing())return;
                    new HaiagaruDialog.Builder(activity).setTitle("認証を開始できません")
                        .setMessage("既存のCookieを引き継げなかったため、別のSessionIDで認証を始めないよう停止しました。書き込み画面へ戻ってから再度お試しください。")
                        .setPositiveButton("閉じる",null).show();
                });return;
            }
            activity.runOnUiThread(()->BoardCookies.prepareBrowser(activity,board,auth,()->seedNext(activity,seed,0,ready)));
        },"Haiagaru-auth-session").start();
    }
    private static void seedNext(Activity a,List<String[]> seed,int index,Runnable ready) {
        if(a.isFinishing()||a.isDestroyed())return;
        if(index==seed.size()){ready.run();return;}
        String[] entry=seed.get(index);
        CookieManager.getInstance().setCookie(entry[0],entry[1],accepted->{
            if(Boolean.TRUE.equals(accepted))seedNext(a,seed,index+1,ready);
            else new HaiagaruDialog.Builder(a).setTitle("認証を開始できません")
                    .setMessage("Cookieを引き継げませんでした。既存のSessionIDを保護するため認証を停止しました。")
                    .setPositiveButton("閉じる",null).show();
        });
    }
    public static void resumed(Activity a) {
        if(resumed.get() instanceof ExternalBoardAuthActivity) prompted.remove(a);
        resumed=new WeakReference<>(a);
    }
    static Activity activity(Object owner) {
        if(owner instanceof Activity) return (Activity)owner;
        try { return (Activity)owner.getClass().getMethod("getActivity").invoke(owner); }
        catch(Exception ignored) { return null; }
    }
    public static void target(Object owner, String url) { target(owner,url,null); }
    public static void target(Object owner, String url, EditText body) {
        if(url!=null && url.startsWith("http://")) url="https://"+url.substring(7);
        Activity a=activity(owner);
        if(a!=null && !BoardAuthRules.origin(url).isEmpty()) {
            targets.put(a,url);
            if(body!=null){bodies.put(a,new WeakReference<>(body));owners.put(a,new WeakReference<>(owner));}
            try { editors.put(a,new WeakReference<>((android.view.View)owner.getClass().getMethod("getView").invoke(owner))); }
            catch(Exception ignored) { }
        }
    }
    public static void addPostingMenu(Object owner, Menu menu) {
        BoardCookies.decorateMenu(owner,menu);
        Activity a=activity(owner);
        if(!Haiagaru.preparePostingMenu(a,menu,MENU,"showExternalBoardAuthMenu")) return;
        MenuItem item=menu.add(Menu.NONE,MENU,Menu.NONE,"外部板の認証ページ");
        menus.put(item,new WeakReference<>(a));
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(v->handlePostingMenu(owner,v));
    }
    public static boolean handlePostingMenu(Object owner, MenuItem item) {
        if(BoardCookies.handleMenu(owner,item))return true;
        if(item==null || item.getItemId()!=MENU) return false;
        Activity a=activity(owner);
        if(a==null) return false;
        String board=targets.get(a);
        String challenge=challenges.get(a);
        if(board!=null&&challenge!=null&&BoardChallengeSession.find(challenge,board)!=null)
            openChallenge(a,board,challenge);
        else if(board==null) showBoards(a); else configure(a,board,"");
        return true;
    }
    public static boolean handlePostingActivityMenu(MenuItem item) {
        if(BoardCookies.handleActivityMenu(item))return true;
        WeakReference<Activity> ref=menus.get(item);
        return ref!=null && ref.get()!=null && handlePostingMenu(ref.get(),item);
    }
    public static void addSettingsButton(LinearLayout layout, Activity a) {
        Button button=new Button(a);button.setAllCaps(false);button.setText("外部板の認証ページを設定・開く");
        layout.addView(button);button.setOnClickListener(v->showBoards(a));
        TextView help=new TextView(a);
        help.setText("書き込みで認証・CAPTCHAが要求された場合、エラーから認証ページを開けます。認証先を確認してサイト上で操作し、「認証を反映して戻る」で書き込みへ戻ってください。投稿は自動再送信しません。CAPTCHA側がWebViewに対応しない場合や、フォーム内のトークンを要求する方式はCookie連携だけでは完了できません。認証画面で必要な場合だけサードパーティCookieを許可できます。");
        layout.addView(help);
    }
    private static void showBoards(Activity a) {
        new Thread(()->{
            ArrayList<String> urls=new ArrayList<>(), names=new ArrayList<>();
            try(SQLiteDatabase db=SQLiteDatabase.openDatabase(a.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY);
                Cursor rows=db.rawQuery("SELECT name,server,title FROM boards WHERE is_external<>0 ORDER BY title",null)) {
                while(rows.moveToNext()) {
                    String id=java.net.URLDecoder.decode(rows.getString(0),"UTF-8");
                    String path=id.contains("/") ? id.substring(id.indexOf('/')+1) : id;
                    String url="https://"+rows.getString(1)+"/"+path+"/";
                    if(!BoardAuthRules.origin(url).isEmpty()) {urls.add(url);names.add(rows.getString(2)+"\n"+url);}
                }
                a.runOnUiThread(()->{
                    if(a.isFinishing()) return;
                    new HaiagaruDialog.Builder(a).setTitle("認証する外部板")
                        .setItems(names.toArray(new String[0]),(d,i)->configure(a,urls.get(i),""))
                        .setNeutralButton("URLを指定",(d,w)->configure(a,"",""))
                        .setNegativeButton("閉じる",null).show();
                });
            } catch(Exception error) {
                a.runOnUiThread(()->configure(a,"",""));
            }
        },"Haiagaru-board-auth-list").start();
    }
    static void configure(Activity a,String board,String suggestion) {
        LinearLayout box=new LinearLayout(a);box.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(20*a.getResources().getDisplayMetrics().density);box.setPadding(pad,0,pad,0);
        EditText boardInput=new EditText(a);boardInput.setSingleLine(true);boardInput.setHint("板のURL（https://…/板名/）");boardInput.setText(board);box.addView(boardInput);
        String origin=BoardAuthRules.origin(board);
        EditText auth=new EditText(a);auth.setSingleLine(true);auth.setHint("認証ページのURL（https://…）");
        String stored=prefs(a).getString("url:"+origin,"");
        auth.setText(BoardAuthRules.configuredPage(board,stored,suggestion));box.addView(auth);
        if(!stored.isEmpty()&&auth.getText().length()==0){
            TextView invalid=new TextView(a);
            invalid.setText("保存されていたURLは認証ページではありません。認証画面のURLを指定するか、板を通常のブラウザで開いてください。");box.addView(invalid);
        }
        Button browser=new Button(a);browser.setText("板を通常のブラウザで開く");box.addView(browser);
        browser.setOnClickListener(v->openBrowser(a,boardInput.getText().toString()));
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("外部板の認証")
            .setMessage("サイト上で認証コードなどを入力してください。完了後は書き込み画面へ戻ります。投稿の自動再送信はしません。\n認証URLは板に応じて変更できます。")
            .setView(box).setNegativeButton("キャンセル",null)
            .setNeutralButton("連携を解除",(d,w)->{
                String key=BoardAuthRules.origin(boardInput.getText().toString());
                prefs(a).edit().remove("enabled:"+key).remove("url:"+key).apply();
            }).setPositiveButton("認証ページを開く",null).create();
        dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{
            try {
                String b=BoardAuthRules.validate(boardInput.getText().toString());
                String u=BoardAuthRules.validateAuthPage(auth.getText().toString());
                prefs(a).edit().putString("url:"+BoardAuthRules.origin(b),u).apply();
                a.startActivity(new Intent(a,ExternalBoardAuthActivity.class).putExtra("board",b).putExtra("auth",u));dialog.dismiss();
            }catch(IllegalArgumentException e){auth.setError(e.getMessage());}
        }));dialog.show();
    }
    /** Observe native error UI only; do not parse the draft or intercept a successful post. */
    public static void observe(CharSequence message) {
        if(message==null || !BoardAuthRules.required(message.toString())) return;
        String text=message.toString();
        WeakReference<Activity> source=new WeakReference<>(resumed.get());
        new Handler(Looper.getMainLooper()).postDelayed(()->{
            Activity a=source.get(); if(a==null || a!=resumed.get() || a.isFinishing() || a instanceof ExternalBoardAuthActivity) return;
            WeakReference<android.view.View> editor=editors.get(a);
            if(editor==null || editor.get()==null || !editor.get().isShown()) return;
            String board=targets.get(a);if(board==null) return;
            String fingerprint=errorFingerprint(text);
            if(fingerprint.equals(prompted.get(a))) return;
            String token=BoardChallengeSession.remember(board,text);
            // Later observers can see Html.fromHtml's text-only copy of the same
            // error. Do not replace the original script/form page with that copy.
            String retained=challenges.get(a);
            if(token.isEmpty()&&(text.contains("計算による投稿確認")||text.toLowerCase(java.util.Locale.ROOT).contains("captcha"))&&retained!=null
                    &&BoardChallengeSession.find(retained,board)!=null) return;
            prompted.put(a,fingerprint);
            String previous=challenges.remove(a);
            if(previous!=null)BoardChallengeSession.forget(previous);
            if(!token.isEmpty()){
                challenges.put(a,token);
                BoardChallengeSession.Page page=BoardChallengeSession.find(token,board);
                if(page!=null)page.posted=draftCompletion(a,board);
                new Handler(Looper.getMainLooper()).postDelayed(()->BoardChallengeSession.forget(token),5*60*1000L);
            }
            String suggested=BoardAuthRules.suggested(board,text);
            showError(a,board,suggested,text);
        },400);
    }
    private static Runnable draftCompletion(Activity parent,String target) {
        WeakReference<EditText> input=bodies.get(parent);
        WeakReference<Object> owner=owners.get(parent);
        if(input==null||input.get()==null||owner==null||owner.get()==null)return null;
        byte[] expected=BoardPostResult.fingerprint(input.get().getText());
        WeakReference<Activity> activity=new WeakReference<>(parent);
        return ()->{
            Activity host=activity.get();EditText body=input.get();Object fragment=owner.get();
            if(host==null||body==null||fragment==null||host.isFinishing()||host.isDestroyed()
                    ||!target.equals(targets.get(host))||bodies.get(host)==null||bodies.get(host).get()!=body
                    ||!BoardPostResult.sameDraft(expected,body.getText()))return;
            boolean posting=false;
            for(Class<?> type=host.getClass();type!=null;type=type.getSuperclass())
                if(type.getName().equals("jp.syoboi.a2chMate.activity.ResEditActivity")){posting=true;break;}
            if(!posting)return;
            String previous=body.getText().toString();
            try {
                java.lang.reflect.Method save=fragment.getClass().getMethod("haiagaruSaveExternalDraft");
                body.setText("");
                // The editor is paused behind the browser: persist now rather than
                // depending on a second onPause that may never run before finish.
                save.invoke(fragment);
                host.setResult(Activity.RESULT_OK);
                host.finish();
            }catch(Exception failure){
                if(body.getText().length()==0)body.setText(previous);
                Toast.makeText(host,"投稿は完了しましたが、入力欄の後処理を確認できませんでした。二重送信せず画面を確認してください。",Toast.LENGTH_LONG).show();
            }
        };
    }
    private static String errorFingerprint(String text) {
        try {
            byte[] hash=java.security.MessageDigest.getInstance("SHA-256").digest(text.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            return android.util.Base64.encodeToString(hash,android.util.Base64.NO_WRAP);
        } catch(java.security.NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
    private static void showError(Activity a,String board,String suggested,String raw) {
        // Render HTML as inert text, never as a WebView or clickable link.
        String error=raw;
        if(java.util.regex.Pattern.compile("(?i)<(?:html|body|br|p|div|span|b|strong)\\b").matcher(raw).find()) {
            error=android.text.Html.fromHtml(raw).toString().trim();
        }
        final String readable=error;
        final boolean browserRequired=BoardAuthRules.browserRequired(readable);
        final String challenge=challenges.get(a);
        final BoardChallengeSession.Page page=challenge==null?null:BoardChallengeSession.find(challenge,board);
        final boolean hasChallenge=page!=null;
        if(page!=null&&(page.captcha||page.calculation)){openChallenge(a,board,challenge);return;}
        final String code=BoardAuthRules.code(readable);
        LinearLayout box=new LinearLayout(a);box.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(20*a.getResources().getDisplayMetrics().density);box.setPadding(pad,pad,pad,pad);
        TextView notice=new TextView(a);
        notice.setText(hasChallenge
                ?"サイトから受け取った投稿確認・CAPTCHAページをChMate内で開けます。計算の開始やCAPTCHAの回答・認証はサイトの画面で操作してください。ページには今回の投稿内容が含まれ、認証・送信操作により投稿される場合があります。ChMateからの自動再送信は行いません。"
                :browserRequired
                ?"この板は、通常ブラウザ上で計算による投稿確認を完了する必要があります。ChMateのエラー欄では実行できません。対応ブラウザではアプリ内のブラウザ画面（Custom Tabs）で開きます。非対応の場合は通常のブラウザ画面になります。サイトの手順に従ってください。下書きは自動送信せず、ChMateのCookie・SessionIDも変更しません。ブラウザの認証は別管理で、ChMateへ引き継がれるとは限りません。"
                :"書き込みエラーの内容を確認してください。認証コードはコピーできます。認証後の投稿は自動再送信しません。");
        box.addView(notice);
        TextView content=new TextView(a);content.setText(readable);content.setTextIsSelectable(true);
        content.setPadding(0,pad,0,pad);box.addView(content);
        ScrollView scroll=new ScrollView(a);scroll.addView(box);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(a).setTitle("書き込みエラー・板の認証")
            .setView(scroll).setNegativeButton("後で",null)
            .setNeutralButton(code.isEmpty()?"エラー全文をコピー":"認証コードをコピー",null)
            .setPositiveButton(hasChallenge?"ChMate内で投稿確認":browserRequired?"アプリ内ブラウザ":"認証ページ",(d,w)->{
                if(hasChallenge)openChallenge(a,board,challenge);
                else if(browserRequired)openBrowser(a,board);else configure(a,board,suggested);
            }).create();
        dialog.setOnShowListener(d->dialog.getButton(HaiagaruDialog.BUTTON_NEUTRAL).setOnClickListener(v->{
            ClipboardManager clipboard=(ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE);
            if(clipboard==null) return;
            ClipData clip=ClipData.newPlainText("板の認証",code.isEmpty()?readable:code);
            if(android.os.Build.VERSION.SDK_INT>=24) {
                android.os.PersistableBundle extras=new android.os.PersistableBundle();
                extras.putBoolean("android.content.extra.IS_SENSITIVE",true);clip.getDescription().setExtras(extras);
            }
            clipboard.setPrimaryClip(clip);
            Toast.makeText(a,code.isEmpty()?"エラー全文をコピーしました":"認証コードをコピーしました",Toast.LENGTH_SHORT).show();
        }));
        dialog.show();
    }
    private static void openChallenge(Activity activity,String board,String token) {
        BoardChallengeSession.Page page=BoardChallengeSession.find(token,board);
        if(page==null){
            Toast.makeText(activity,"確認ページの期限が切れました。新しい投稿確認ページを取得してください。",Toast.LENGTH_LONG).show();return;
        }
        if(page.captcha||page.calculation){
            activity.startActivity(new Intent(activity,ExternalBoardAuthActivity.class)
                .putExtra("board",board).putExtra("challenge",token));return;
        }
        new HaiagaruDialog.Builder(activity).setTitle("ChMate内で投稿確認")
            .setMessage("サイトから受け取った今回の投稿確認ページを表示します。ページ上の認証・送信操作は実際の投稿につながる場合があります。計算や送信は自動で開始しません。")
            .setNegativeButton("キャンセル",null)
            .setPositiveButton("確認ページを開く",(d,w)->activity.startActivity(new Intent(activity,ExternalBoardAuthActivity.class)
                .putExtra("board",board).putExtra("challenge",token))).show();
    }
    private static void openBrowser(Activity activity,String board){
        String page=BoardAuthRules.browserPage(board);
        if(page.isEmpty()){Toast.makeText(activity,"板のURLを確認できませんでした",Toast.LENGTH_LONG).show();return;}
        Intent intent=new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(page));
        intent.addCategory(Intent.CATEGORY_BROWSABLE);
        // Same standard Custom Tabs protocol as XPostPreviewTouch.browserIntent.
        // The browser owns scripts, workers and its session; never inject native cookies.
        android.os.Bundle extras=new android.os.Bundle();
        extras.putBinder("android.support.customtabs.extra.SESSION",null);
        intent.putExtras(extras);
        try{
            // An explicit browser intent avoids routing read.cgi back to ChMate.
            Intent probe=new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(BoardAuthRules.origin(page)+"/"));
            probe.addCategory(Intent.CATEGORY_BROWSABLE);
            ArrayList<Intent> browsers=new ArrayList<>();
            for(android.content.pm.ResolveInfo info:activity.getPackageManager().queryIntentActivities(probe,0)){
                if(info.activityInfo==null||activity.getPackageName().equals(info.activityInfo.packageName))continue;
                Intent candidate=new Intent(intent);candidate.setComponent(new android.content.ComponentName(info.activityInfo.packageName,info.activityInfo.name));browsers.add(candidate);
            }
            if(browsers.isEmpty()){Toast.makeText(activity,"通常ブラウザが見つかりません。ブラウザから板を開いてください。",Toast.LENGTH_LONG).show();return;}
            Intent choice=Intent.createChooser(browsers.remove(0),"アプリ内ブラウザで開く");
            if(!browsers.isEmpty())choice.putExtra(Intent.EXTRA_INITIAL_INTENTS,browsers.toArray(new Intent[0]));
            activity.startActivity(choice);
        }catch(android.content.ActivityNotFoundException|SecurityException error){Toast.makeText(activity,"ブラウザを開けませんでした",Toast.LENGTH_LONG).show();}
    }
    public static Object parseCookie(Object url,String cookie) { return null; } // Bound at patch time.
    public static void received(Object url,List<?> cookies) {
        Context c=context;if(c==null || url==null) return;
        String address=url.toString(),origin=BoardAuthRules.origin(address);
        if(origin.isEmpty() || !prefs(c).getBoolean("enabled:"+origin,false)) return;
        try {
            CookieManager manager=CookieManager.getInstance();
            for(Object cookie:cookies) manager.setCookie(address,cookie.toString(),null);
        } catch(Exception ignored) { }
    }
    public static List<?> cookies(List<?> nativeCookies,Object url) {
        if(BoardCookies.active())return BoardCookies.load(nativeCookies,url);
        Context c=context;if(c==null || url==null) return nativeCookies;
        String address=url.toString(), origin=BoardAuthRules.origin(address);
        if(origin.isEmpty() || !prefs(c).getBoolean("enabled:"+origin,false)) return nativeCookies;
        try {
            String header=CookieManager.getInstance().getCookie(address);
            if(header==null || header.isEmpty()) return nativeCookies;
            LinkedHashMap<String,Object> web=new LinkedHashMap<>();
            boolean hasNativeIdentity=false;
            for(Object cookie:nativeCookies)if(BoardAuthRules.identityCookie(cookie.toString().split("=",2)[0]))hasNativeIdentity=true;
            for(String pair:header.split(";")) {
                if(hasNativeIdentity&&BoardAuthRules.identityCookie(pair.trim().split("=",2)[0]))continue;
                Object parsed=parseCookie(url,pair.trim());
                if(parsed!=null) web.put(pair.trim().split("=",2)[0],parsed);
            }
            ArrayList<Object> result=new ArrayList<>();
            for(Object cookie:nativeCookies) if(!web.containsKey(cookie.toString().split("=",2)[0])) result.add(cookie);
            result.addAll(web.values());return result;
        } catch(Exception ignored) { return nativeCookies; }
    }
}
