package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.*;
import android.widget.*;

/** Explicit, read-only folder grants and URL-to-image associations. */
public final class LocalImageArchiveActivity extends Activity {
    private TextView status,primary,extra;private String pendingUrl;
    private final Handler handler=new Handler(Looper.getMainLooper());
    private final Runnable update=new Runnable(){public void run(){if(status!=null)status.setText(LocalImageArchive.status());handler.postDelayed(this,1000);}};
    @Override protected void onCreate(Bundle state){
        super.onCreate(state);LocalImageArchive.initialize(this);if(state!=null)pendingUrl=state.getString("pendingUrl");
        LinearLayout body=new LinearLayout(this);body.setOrientation(LinearLayout.VERTICAL);
        int pad=Math.round(16*getResources().getDisplayMetrics().density);body.setPadding(pad,pad,pad,pad);
        body.setOnApplyWindowInsetsListener((view,insets)->{body.setPadding(pad+insets.getSystemWindowInsetLeft(),pad+insets.getSystemWindowInsetTop(),pad+insets.getSystemWindowInsetRight(),pad+insets.getSystemWindowInsetBottom());return insets;});
        ScrollView scroll=new ScrollView(this);scroll.addView(body);setContentView(scroll);body.requestApplyInsets();
        TextView title=new TextView(this);title.setText("保存済み画像から表示");title.setTextSize(20);body.addView(title);
        Switch enabled=new Switch(this);enabled.setText("ローカルの保存画像も検索する");enabled.setChecked(LocalImageArchive.prefs(this).getBoolean("enabled",true));body.addView(enabled);
        enabled.setOnCheckedChangeListener((button,on)->{LocalImageArchive.prefs(this).edit().putBoolean("enabled",on).apply();LocalImageArchive.reset();});
        TextView help=new TextView(this);help.setText("ネット上で削除された画像も、アプリの画像キャッシュや保存画像が残っていれば表示します。Download/Haiagaruなどの既定フォルダに加え、検索するフォルダを指定できます。画像は移動・複製・削除しません。\n\n名前を変更した画像は、元URLと画像内容の対応が記録されていれば探せます。導入前に名前を変更した画像など、対応情報がない場合は下の「画像と元URLを関連付ける」を利用してください。");body.addView(help);
        primary=new TextView(this);body.addView(primary);button(body,"既定の画像保存フォルダを指定",()->pickFolder(701));
        button(body,"既定フォルダの指定を解除",()->{LocalImageArchive.prefs(this).edit().remove("tree0").apply();LocalImageArchive.reset();labels();});
        extra=new TextView(this);body.addView(extra);button(body,"追加の検索フォルダを指定",()->pickFolder(702));
        button(body,"追加フォルダの指定を解除",()->{LocalImageArchive.prefs(this).edit().remove("tree1").apply();LocalImageArchive.reset();labels();});
        button(body,"保存画像の索引を更新",()->LocalImageArchive.scan(true));
        button(body,"画像と元URLを関連付ける",()->{
            EditText url=new EditText(this);url.setSingleLine(true);url.setHint("https://… 元の画像URL");
            new HaiagaruDialog.Builder(this).setTitle("元画像のURL").setView(url).setNegativeButton("キャンセル",null).setPositiveButton("保存画像を選ぶ",(dialog,which)->{
                String value=url.getText().toString().trim();
                try{java.net.URI parsed=java.net.URI.create(value);if(parsed.getHost()==null||parsed.getUserInfo()!=null||!("http".equalsIgnoreCase(parsed.getScheme())||"https".equalsIgnoreCase(parsed.getScheme())))throw new IllegalArgumentException();}
                catch(RuntimeException invalid){Toast.makeText(this,"画像のhttp／https URLを入力してください",Toast.LENGTH_LONG).show();return;}
                pendingUrl=value;
                Intent choose=new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE)
                        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
                startActivityForResult(choose,703);
            }).show();
        });
        status=new TextView(this);body.addView(status);button(body,"閉じる",this::finish);labels();LocalImageArchive.scan(false);
    }
    private void button(LinearLayout body,String label,Runnable action){Button button=new Button(this);button.setText(label);button.setOnClickListener(view->action.run());body.addView(button);}
    private void labels(){
        primary.setText("既定フォルダ："+folder("tree0","自動検索（Download/Haiagaru等）"));
        extra.setText("追加フォルダ："+folder("tree1","未指定"));
    }
    private String folder(String key,String fallback){String value=LocalImageArchive.prefs(this).getString(key,"");if(value.isEmpty())return fallback;try{return android.provider.DocumentsContract.getTreeDocumentId(Uri.parse(value));}catch(Exception invalid){return "再選択してください";}}
    private void pickFolder(int request){Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);startActivityForResult(intent,request);}
    @Override protected void onSaveInstanceState(Bundle out){super.onSaveInstanceState(out);out.putString("pendingUrl",pendingUrl);}
    @Override protected void onResume(){super.onResume();handler.removeCallbacks(update);handler.post(update);}
    @Override protected void onPause(){handler.removeCallbacks(update);super.onPause();}
    @Override protected void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);if(result!=RESULT_OK||data==null||data.getData()==null)return;
        Uri uri=data.getData();if(!"content".equals(uri.getScheme()))return;
        try{getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}
        catch(Exception denied){Toast.makeText(this,"画像・フォルダの読み取り権限を取得できませんでした",Toast.LENGTH_LONG).show();return;}
        if(request==701||request==702){LocalImageArchive.prefs(this).edit().putString(request==701?"tree0":"tree1",uri.toString()).apply();LocalImageArchive.reset();labels();}
        else if(request==703&&pendingUrl!=null){String source=pendingUrl;pendingUrl=null;status.setText("画像を関連付けています…");
            new Thread(()->{String message;try{LocalImageArchive.associate(source,uri);message="関連付けました。スレを開き直すと反映されます。";}
                catch(Exception failure){message="関連付けできませんでした。画像・権限・ファイルサイズを確認してください。";}
                String text=message;runOnUiThread(()->{if(!isFinishing())Toast.makeText(this,text,Toast.LENGTH_LONG).show();});},"Haiagaru-image-association").start();
        }
    }
}
