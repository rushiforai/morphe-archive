package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.Looper;
import android.text.InputType;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import org.json.JSONObject;

/** Destination selection shared by the existing picker, resize step and native upload callbacks. */
public final class MediaUploadHosts {
    private static final String HELP_URL = "https://github.com/areteruhiro/Haiagaru-Morphe/blob/master/docs/upload-hosts/README.md";
    private static volatile Context context;
    private static final int MENU_ID=0x48690107;
    private static final WeakHashMap<MenuItem,WeakReference<Activity>> ACTIVITIES=new WeakHashMap<>();
    private static WeakReference<HaiagaruDialog> capacityDialog=new WeakReference<>(null);
    private static final java.util.Map<EditText,Destination> replyDestinations=java.util.Collections.synchronizedMap(new WeakHashMap<>());
    private static final WeakHashMap<Activity,WeakReference<EditText>> editors=new WeakHashMap<>();
    private static final java.util.Map<EditText,String> editorUrls=java.util.Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile WeakReference<EditText> currentEditor=new WeakReference<>(null);
    private static final ThreadLocal<Destination> activeDestination=new ThreadLocal<>();
    private static final class Destination {
        final String image,video,key;final boolean adult;
        Destination(String image,String video,String key,boolean adult){this.image=image;this.video=video;this.key=key;this.adult=adult;}
        Destination(SharedPreferences p){this(p.getString("imageHost","native"),p.getString("videoHost","native"),p.getString("imgpileApiKey",""),p.getBoolean("imgboxAdult",false));}
    }
    private MediaUploadHosts() {}
    static void init(Context value) { context=value.getApplicationContext(); }
    private static SharedPreferences prefs(Context c) { return c.getSharedPreferences("haiagaru_upload_hosts",0); }
    static void bindEditor(Activity activity,EditText body,String url) {
        if(activity==null||body==null)return;
        String previousUrl=editorUrls.put(body,url);
        if(previousUrl!=null&&!previousUrl.equals(url))replyDestinations.remove(body);
        WeakReference<EditText> previous=editors.get(activity);
        if(previous==null||previous.get()!=body) {
            if(previous!=null)replyDestinations.remove(previous.get());
            editors.put(activity,new WeakReference<>(body));
            body.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View v){}
                public void onViewDetachedFromWindow(View v){
                    replyDestinations.remove(body);
                    if(currentEditor.get()==body)currentEditor=new WeakReference<>(null);
                }
            });
        }
        currentEditor=new WeakReference<>(body);
    }
    static void resumed(Activity activity) {
        WeakReference<EditText> editor=editors.get(activity);
        currentEditor=editor==null?new WeakReference<>(null):editor;
    }
    static void posted(String url) {
        EditText body=currentEditor.get();if(body==null)return;
        String editorUrl=editorUrls.get(body);
        ThreadWatchRules.Target source=editorUrl==null?null:ThreadWatchRules.target(editorUrl),sent=ThreadWatchRules.target(url);
        if(source!=null&&sent!=null&&source.url.equals(sent.url))replyDestinations.remove(body);
    }
    private static File file(Object[] args) throws IOException {
        File found=null;
        if(args!=null) for(Object value:args) if(value instanceof File) {
            if(found!=null) throw new IOException("送信ファイルを特定できません");
            found=(File)value;
        }
        if(found==null || !found.isFile() || found.length()==0) throw new IOException("送信するファイルがありません");
        return found;
    }
    static boolean handles(Object[] args) throws IOException {
        Context c=context;
        if(c==null) return false;
        activeDestination.remove();
        Destination selected=new Destination(prefs(c));
        Destination reply=replyDestinations.get(currentEditor.get());
        if(reply!=null)selected=reply;
        if(MediaUploadPolicy.NATIVE.equals(selected.image)
                &&MediaUploadPolicy.NATIVE.equals(selected.video))return false;
        String mime=MediaUploadPolicy.mime(file(args));
        boolean custom=!MediaUploadPolicy.NATIVE.equals(MediaUploadPolicy.destination(selected.image,selected.video,mime));
        if(custom)activeDestination.set(selected);
        return custom;
    }
    static Object upload(Object[] args,Class<?> responseType) throws Exception {
        if(Looper.myLooper()==Looper.getMainLooper()) throw new IOException("アップロードはバックグラウンドで実行してください");
        Context c=context;
        if(c==null) throw new IOException("アップロード設定を読み込めません");
        File file=file(args); String mime=MediaUploadPolicy.mime(file);
        Destination selected=activeDestination.get();activeDestination.remove();
        if(selected==null)selected=new Destination(prefs(c));
        String provider=MediaUploadPolicy.destination(selected.image,selected.video,mime);
        String key=selected.key;
        MediaUploadPolicy.validate(provider,mime,file.length(),key);
        // Check native return layouts before sending a byte to a third party.
        ImgurWebUpload.nativeResponse(responseType,new JSONObject().put("id","Test").put("deletehash", "")
                .put("link","https://cdn.imgpile.com/f/Test.webp"));
        JSONObject result;
        try {
            result = (MediaUploadPolicy.IMGPILE_WEB.equals(provider) || MediaUploadPolicy.SENDVID.equals(provider))
                    ? new MediaUploadWebClient(new MediaUploadSessions()).upload(provider, file, mime)
                    : new MediaUploadClient().upload(provider,file,mime,key,selected.adult);
        } catch (MediaUploadSizeException tooLarge) {
            throw capacityError();
        }
        MediaUploadManagement.remember(c, result);
        return ImgurWebUpload.nativeResponse(responseType,result);
    }

    public static void showSettings(Activity activity) {
        SharedPreferences p=prefs(activity);
        WeakReference<EditText> editorRef=editors.get(activity);
        EditText editor=editorRef==null?null:editorRef.get();
        Destination reply=editor==null?null:replyDestinations.get(editor);
        Destination initial=reply==null?new Destination(p):reply;
        LinearLayout root=new LinearLayout(activity); root.setOrientation(LinearLayout.VERTICAL);
        int pad=(int)(20*activity.getResources().getDisplayMetrics().density);root.setPadding(pad,pad,pad,pad);
        String[] imageIds={"native","imgbox","imgpile-web","imgpile"},videoIds={"native","imgpile-web","imgpile","sendvid"};
        Spinner image=choice(activity,root,"画像のアップロード先",new String[]{"Imgur（従来の設定）","imgbox（10MB）","imgpile（API不要・100MB）","imgpile API（97MB）"},
                imageIds,initial.image);
        Spinner video=choice(activity,root,"動画のアップロード先",new String[]{"Imgur（従来の設定）","imgpile（API不要・100MB）","imgpile API（97MB）","Sendvid（API不要）"},
                videoIds,initial.video);
        TextView keyLabel=new TextView(activity);keyLabel.setText("imgpile APIキー（サイトのSettingsで発行）");root.addView(keyLabel);
        EditText key=new EditText(activity);key.setSingleLine(true);
        key.setInputType(InputType.TYPE_CLASS_TEXT|InputType.TYPE_TEXT_VARIATION_PASSWORD);
        key.setText(initial.key);key.setHint("APIキーはチャットへ送らないでください");root.addView(key);
        CheckBox adult=new CheckBox(activity);adult.setText("imgboxをAdult Contentとして送信");
        adult.setChecked(initial.adult);root.addView(adult);
        Switch once=new Switch(activity);once.setText("このレスでだけアップロード先を変更する");once.setChecked(reply!=null);
        once.setEnabled(editor!=null&&editor.isAttachedToWindow());root.addView(once);
        TextView onceHelp=new TextView(activity);
        onceHelp.setText(editor==null?"レス限定の変更は書き込み画面から設定できます。":"オンにすると、この書き込み画面の画像・動画すべてに適用します。書き込み完了・画面を閉じると解除し、保存済みのアップロード先は変更しません。");root.addView(onceHelp);
        TextView help=new TextView(activity);
        help.setText("標準添付は選択したサイトへ送信し、URLと標準履歴を自動で登録します。アクセス確認が出る場合は下のWeb画面で確認してください。手動Web送信とは別です。認証情報を含むバックアップは共有しないでください。");root.addView(help);
        Button guide = new Button(activity);guide.setText("使い方・制限を見る（GitHub）");
        guide.setOnClickListener(v -> {
            try {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(HELP_URL))
                        .addCategory(Intent.CATEGORY_BROWSABLE).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.getApplicationContext().startActivity(intent);
            } catch (RuntimeException error) {
                Toast.makeText(activity,"説明ページを開けませんでした。ブラウザの設定を確認してください",Toast.LENGTH_LONG).show();
            }
        });root.addView(guide);
        Button web = new Button(activity);web.setText("imgpile Web送信・履歴／削除（API不要）");
        web.setOnClickListener(v -> MediaUploadWebActivity.open(activity));root.addView(web);
        Button sendvid = new Button(activity);sendvid.setText("Sendvid 動画Web送信（API不要）");
        sendvid.setOnClickListener(v -> MediaUploadWebActivity.open(activity, "sendvid"));root.addView(sendvid);
        Button manage = new Button(activity);manage.setText("imgbox／imgpileのサーバー削除・管理");
        manage.setOnClickListener(v -> MediaUploadManagement.show(activity));root.addView(manage);
        if(ImgurWebUpload.supported(activity)) {
            Button login=new Button(activity);
            login.setText("Imgurにログイン／Webアカウント送信（開発中）");
            login.setOnClickListener(v -> activity.startActivity(new Intent(activity,ImgurWebLoginActivity.class)));
            root.addView(login);
        }
        ScrollView scroll=new ScrollView(activity);scroll.addView(root);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("画像・動画のアップロード先")
                .setView(scroll).setNegativeButton("キャンセル",null).setPositiveButton("適用",null).create();
        dialog.show();
        dialog.getButton(-1).setOnClickListener(v->{
            String i=imageIds[image.getSelectedItemPosition()],m=videoIds[video.getSelectedItemPosition()];
            String api=key.getText().toString().trim();
            if((i.equals("imgpile")||m.equals("imgpile")) && !MediaUploadPolicy.validKey(api)) {
                key.setError("imgpileのAPIキーを入力してください");return;
            }
            if(once.isChecked()) {
                if(editor==null||!editor.isAttachedToWindow()){dialog.dismiss();return;}
                replyDestinations.put(editor,new Destination(i,m,api,adult.isChecked()));
            }
            else {
                if(editor!=null)replyDestinations.remove(editor);
                p.edit().putString("imageHost",i).putString("videoHost",m).putString("imgpileApiKey",api)
                        .putBoolean("imgboxAdult",adult.isChecked()).apply();
            }
            dialog.dismiss();
        });
    }
    static MediaUploadSizeException capacityError() {
        Haiagaru.notifyUploadCapacityError();
        return new MediaUploadSizeException();
    }
    static void showCapacityError(Activity activity) {
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
        HaiagaruDialog previous=capacityDialog.get();
        if(previous!=null&&previous.isShowing())return;
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity)
                .setTitle("ファイルの容量が大きすぎます")
                .setMessage("画像・動画のアップロード先を変更することでアップロードできる可能性があります。\n\n「画像・動画のアップロード先を変更」を開きますか？")
                .setNegativeButton("閉じる",null)
                .setPositiveButton("開く",(d,w)->showSettings(activity)).create();
        capacityDialog=new WeakReference<>(dialog);
        dialog.show();
    }
    private static Spinner choice(Activity a,LinearLayout root,String title,String[] labels,String[] ids,String selected) {
        TextView label=new TextView(a);label.setText(title);root.addView(label);
        Spinner spinner=new Spinner(a);spinner.setAdapter(new ArrayAdapter<>(a,android.R.layout.simple_spinner_dropdown_item,labels));
        for(int i=0;i<ids.length;i++) if(ids[i].equals(selected)) spinner.setSelection(i);
        root.addView(spinner);return spinner;
    }
    public static void addPostingMenu(Object owner,Menu menu) {
        Activity activity=Haiagaru.toolbarActivity(owner);
        if(!Haiagaru.preparePostingMenu(activity,menu,MENU_ID,"showUploadHostMenu")) return;
        MenuItem item=menu.add(Menu.NONE,MENU_ID,Menu.NONE,"アップロード先を変更");
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        ACTIVITIES.put(item,new WeakReference<>(activity));
        item.setOnMenuItemClickListener(v->handlePostingMenu(owner,v));
    }
    public static boolean handlePostingMenu(Object owner,MenuItem item) {
        if(item==null || item.getItemId()!=MENU_ID) return false;
        Activity activity=Haiagaru.toolbarActivity(owner);
        if(activity==null || activity.isFinishing()) return false;
        showSettings(activity);return true;
    }
    public static boolean handlePostingActivityMenu(MenuItem item) {
        if(item==null || item.getItemId()!=MENU_ID) return false;
        WeakReference<Activity> ref=ACTIVITIES.get(item);Activity a=ref==null?null:ref.get();
        if(a==null || a.isFinishing()) return false;
        showSettings(a);return true;
    }
}
