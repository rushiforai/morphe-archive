package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.net.Uri;
import android.os.*;
import android.view.View;
import android.webkit.*;
import android.widget.*;
import java.io.IOException;
import java.net.URI;
import java.util.*;

/** Entry is placed in ChMate's existing board settings, not in a parallel settings menu. */
public final class SiteBoardSettingsActivity extends Activity {
    private SiteBoardGateway gateway;private LinearLayout rows;
    @Override protected void onCreate(Bundle state){super.onCreate(state);gateway=SiteBoardGateway.get(this);setTitle("板の追加");render();
        if(state==null&&getIntent().getBooleanExtra("authenticateAnimanch",false))for(SiteBoardProtocol.Board board:gateway.boards.values())if(board.kind.equals("animanch")){authenticate(board);break;}
    }
    private void render(){
        ScrollView scroll=new ScrollView(this);rows=new LinearLayout(this);rows.setOrientation(LinearLayout.VERTICAL);int gap=(int)(16*getResources().getDisplayMetrics().density);rows.setPadding(gap,gap,gap,gap);scroll.addView(rows);setContentView(scroll);
        Button back=new Button(this);back.setText("掲示板設定へ戻る");back.setOnClickListener(v->finish());rows.addView(back);
        TextView help=new TextView(this);help.setText("標準の「掲示板設定」にある「エッヂ」「オルグ板」「爆サイ」「ふたば」「あにまん」で「使用する」をオンにし、「板一覧を取得/更新」を押してください。板一覧に追加されます。これらのサイト設定は初期ONです。\nここでは認証や個別の板・スレURLの手動登録を行えます。新規スレ・画像添付は対応準備中です。");rows.addView(help);
        Button add=new Button(this);add.setText("板・スレのURLを登録");add.setOnClickListener(v->add());rows.addView(add);
        Button listLimit=new Button(this);listLimit.setText("スレ一覧の表示件数（ふたば・爆サイ／板別）");listLimit.setOnClickListener(v->selectListLimitBoard());rows.addView(listLimit);
        Button menu=new Button(this);menu.setText("板一覧から追加");menu.setOnClickListener(v->new AlertDialog.Builder(this).setTitle("掲示板を選択").setItems(new String[]{"爆サイ","ふたば","あにまん"},(d,n)->{
            String kind=new String[]{"bakusai","futaba","animanch"}[n];if(n==0)new AlertDialog.Builder(this).setTitle("爆サイの地域").setItems(SiteBoardMenuProtocol.REGION_NAMES,(r,index)->loadMenu(kind,index)).setNegativeButton("キャンセル",null).show();else loadMenu(kind,0);
        }).setNegativeButton("キャンセル",null).show());rows.addView(menu);
        Set<String> hosts=new HashSet<>();List<String> futaba=new ArrayList<>();
        for(String key:new TreeSet<>(gateway.boards.keySet())){
            SiteBoardProtocol.Board selected=gateway.boards.get(key);if(selected.kind.equals("futaba"))futaba.add(key);
            if(!hosts.add(selected.host))continue;Button auth=new Button(this);auth.setText("認証："+selected.host);auth.setOnClickListener(v->authenticate(selected));rows.addView(auth);
        }
        if(!futaba.isEmpty()){Button password=new Button(this);password.setText("ふたばの削除キーを設定");password.setOnClickListener(v->{String[] labels=new String[futaba.size()];for(int n=0;n<labels.length;n++)labels[n]=gateway.names.get(futaba.get(n));new AlertDialog.Builder(this).setTitle("板を選択").setItems(labels,(d,index)->password(gateway.boards.get(futaba.get(index)))).setNegativeButton("キャンセル",null).show();});rows.addView(password);}
    }
    private void selectListLimitBoard(){
        List<String> keys=new ArrayList<>();List<String> labels=new ArrayList<>();
        for(String key:gateway.boards.keySet()){
            SiteBoardProtocol.Board board=gateway.boards.get(key);
            if(board==null||!(board.kind.equals("futaba")||board.kind.equals("bakusai")))continue;
            keys.add(key);labels.add(gateway.names.getOrDefault(key,board.url)+"（"+gateway.listLimit(key)+"件）\n"+board.url);
        }
        if(keys.isEmpty()){message("ふたば・爆サイの板を追加してください");return;}
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
        EditText query=new EditText(this);query.setSingleLine(true);query.setHint("板名・URLで検索");content.addView(query);
        ListView list=new ListView(this);ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,new ArrayList<>(labels));list.setAdapter(adapter);
        content.addView(list,new LinearLayout.LayoutParams(-1,(int)(360*getResources().getDisplayMetrics().density)));
        query.addTextChangedListener(new android.text.TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){adapter.getFilter().filter(s);}public void afterTextChanged(android.text.Editable e){}});
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle("表示件数を設定する板").setView(content).setNegativeButton("閉じる",null).create();
        list.setOnItemClickListener((parent,view,position,id)->{
            String label=adapter.getItem(position);int selected=labels.indexOf(label);if(selected<0)return;
            dialog.dismiss();editListLimit(keys.get(selected));
        });dialog.show();
    }
    private void editListLimit(String key){
        SiteBoardProtocol.Board board=gateway.boards.get(key);if(board==null)return;
        EditText count=new EditText(this);count.setInputType(android.text.InputType.TYPE_CLASS_NUMBER);count.setSingleLine(true);
        count.setText(String.valueOf(gateway.listLimit(key)));count.setSelectAllOnFocus(true);
        LinearLayout content=new LinearLayout(this);content.setPadding(24,16,24,8);content.setOrientation(LinearLayout.VERTICAL);
        TextView help=new TextView(this);help.setText("スレ一覧に表示する最大件数（1〜500件）。実際の取得数は掲示板の公開ページ数によります。");content.addView(help);content.addView(count);
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle(gateway.names.getOrDefault(key,board.url)).setView(content).setNegativeButton("キャンセル",null).setPositiveButton("保存",null).create();
        dialog.setOnShowListener(ignored->dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(button->{
            try{gateway.listLimit(key,Integer.parseInt(count.getText().toString().trim()));dialog.dismiss();}
            catch(Exception error){count.setError("1〜500の数値を入力してください");}
        }));dialog.show();
    }
    private void loadMenu(String kind,int region){
        ProgressDialog loading=ProgressDialog.show(this,"板一覧","取得しています…",true,true);
        new Thread(()->{try{List<SiteBoardMenuProtocol.Choice> choices=gateway.menu(kind,region);runOnUiThread(()->{boolean show=loading.isShowing();loading.dismiss();if(show&&!isFinishing()&&!isDestroyed())showMenu(choices);});}
            catch(Exception failure){runOnUiThread(()->{boolean show=loading.isShowing();loading.dismiss();if(show&&!isFinishing()&&!isDestroyed())message("板一覧を取得できませんでした。"+failure.getMessage());});}},"Haiagaru-board-menu").start();
    }
    private void showMenu(List<SiteBoardMenuProtocol.Choice> choices){
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);EditText query=new EditText(this);query.setHint("板名で検索");query.setSingleLine(true);content.addView(query);
        ListView list=new ListView(this);ArrayAdapter<SiteBoardMenuProtocol.Choice> adapter=new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,new ArrayList<>(choices));list.setAdapter(adapter);content.addView(list,new LinearLayout.LayoutParams(-1,(int)(360*getResources().getDisplayMetrics().density)));
        query.addTextChangedListener(new android.text.TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){adapter.getFilter().filter(s);}public void afterTextChanged(android.text.Editable s){}});
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle("追加する板を選択（"+choices.size()+"板）").setView(content).setNegativeButton("キャンセル",null).create();
        list.setOnItemClickListener((parent,view,position,id)->{SiteBoardMenuProtocol.Choice choice=adapter.getItem(position);if(choice==null)return;try{gateway.register(choice.url,choice.name);dialog.dismiss();finish();}catch(IOException failure){message(failure.getMessage());}});dialog.show();
    }
    private AlertDialog boardSettings(String key,String thread){
        SiteBoardProtocol.Board board=gateway.boards.get(key);if(board==null)return null;
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);int gap=(int)(24*getResources().getDisplayMetrics().density);content.setPadding(gap,0,gap,0);
        TextView address=new TextView(this);address.setText("掲示板のURL\n"+board.url);address.setTextIsSelectable(true);content.addView(address);
        TextView count=new TextView(this);count.setText("板の数\n1");count.setPadding(0,gap,0,gap);content.addView(count);
        Switch use=new Switch(this);use.setText("使用する");use.setChecked(gateway.boardEnabled(key));content.addView(use);
        Button open=new Button(this);open.setText(thread==null?"板を開く":"スレを開く");open.setEnabled(gateway.boardEnabled(key));content.addView(open);
        Button auth=new Button(this);auth.setText("認証");auth.setOnClickListener(v->authenticate(board));content.addView(auth);
        if(board.kind.equals("futaba")){Button password=new Button(this);password.setText("削除キー");password.setOnClickListener(v->password(board));content.addView(password);}
        ScrollView scroll=new ScrollView(this);scroll.addView(content);
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle(gateway.names.get(key)).setView(scroll).setPositiveButton("閉じる",null).create();
        use.setOnCheckedChangeListener((button,on)->{try{gateway.boardEnabled(key,on);open.setEnabled(gateway.boardEnabled(key));render();}catch(IOException error){use.setOnCheckedChangeListener(null);use.setChecked(gateway.boardEnabled(key));dialog.dismiss();render();message(error.getMessage());}});
        open.setOnClickListener(v->{dialog.dismiss();open(key,thread);});dialog.show();return dialog;
    }
    private void add(){
        LinearLayout form=new LinearLayout(this);form.setOrientation(LinearLayout.VERTICAL);EditText name=new EditText(this);name.setHint("板の表示名");form.addView(name);
        EditText url=new EditText(this);url.setHint("https://… の板またはスレURL");url.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_URI);form.addView(url);
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle("追加掲示板を登録").setView(form).setNegativeButton("キャンセル",null).setPositiveButton("登録",null).create();
        dialog.setOnShowListener(v->dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(button->{
            try{gateway.register(url.getText().toString(),name.getText().toString());dialog.dismiss();finish();}
            catch(IOException error){url.setError(error.getMessage());}
        }));dialog.show();
    }
    private void open(String key,String thread){try{
        String address=gateway.nativeUrl(key,thread);startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(address)).setClassName(this,thread==null?"jp.syoboi.a2chMate.activity.ThreadListActivity":"jp.syoboi.a2chMate.activity.ResListActivity"));
    }catch(Exception error){message("開けませんでした。"+error.getMessage());}}
    private void password(SiteBoardProtocol.Board board){
        EditText key=new EditText(this);key.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD);key.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(12)});
        key.setText(gateway.prefs.getString("password:"+board.url,""));
        new AlertDialog.Builder(this).setTitle("ふたばの削除キー").setMessage("今後この板へ返信するときに送信します。12文字以内で指定してください。").setView(key).setNegativeButton("キャンセル",null)
                .setPositiveButton("保存",(d,w)->gateway.prefs.edit().putString("password:"+board.url,key.getText().toString()).apply()).show();
    }
    private void authenticate(SiteBoardProtocol.Board board){
        WebView web=new WebView(this);web.getSettings().setJavaScriptEnabled(true);web.getSettings().setDomStorageEnabled(true);web.getSettings().setAllowFileAccess(false);web.getSettings().setAllowContentAccess(false);web.getSettings().setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);CookieManager.getInstance().setAcceptThirdPartyCookies(web,false);
        web.setWebViewClient(new WebViewClient(){@Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){
            Uri uri=request.getUrl();if(SiteAuthenticationPolicy.allow(board.host,uri.toString(),request.isForMainFrame()))return false;
            if(request.isForMainFrame()&&"https".equals(uri.getScheme()))try{startActivity(new Intent(Intent.ACTION_VIEW,uri));}catch(RuntimeException ignored){}return true;
        }});
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);TextView info=new TextView(this);info.setText("この掲示板の認証を行ってください。「認証情報を利用」を押すと、このサイトのCookieだけを閲覧・返信に利用します。");content.addView(info);content.addView(web,new LinearLayout.LayoutParams(-1,(int)(420*getResources().getDisplayMetrics().density)));
        AlertDialog dialog=new AlertDialog.Builder(this).setTitle(board.host+"の認証").setView(content).setNegativeButton("閉じる",null).setPositiveButton("認証情報を利用",(d,w)->{
            gateway.prefs.edit().putBoolean("cookies:"+board.host,true).putString("browserUa",web.getSettings().getUserAgentString()).apply();CookieManager.getInstance().flush();
        }).create();dialog.setOnDismissListener(d->new Handler(Looper.getMainLooper()).post(web::destroy));dialog.show();web.loadUrl(board.url);
    }
    private void message(String text){new AlertDialog.Builder(this).setMessage(text).setPositiveButton("閉じる",null).show();}
}
