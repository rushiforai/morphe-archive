package app.morphe.extension.chmate;
import android.app.*;import android.content.*;import android.net.Uri;import android.os.*;import android.view.View;import android.widget.*;import android.text.Editable;import android.text.TextWatcher;import java.util.*;

/** All incoming links are resolved against real controls and confirmed before a user action is applied. */
public final class SettingLinkActivity extends HaiagaruComposeActivity {
 private final ArrayList<SettingLinkEntry> entries=new ArrayList<>();private final Handler handler=new Handler(Looper.getMainLooper());
 private SettingLinkRequest request;private LinearLayout root,list;private TextView status;private EditText search;private boolean applied;
 private String[] categories;
 @Override public void onCreate(Bundle state){super.onCreate(state);applied=state!=null&&state.getBoolean("applied",false);
  try{if(getIntent().getData()!=null)request=SettingLinkRequest.parse(getIntent().getData().toString());}
  catch(IllegalArgumentException invalid){error(invalid.getMessage());return;}
  root=new LinearLayout(this);root.setOrientation(1);int pad=(int)(16*getResources().getDisplayMetrics().density);root.setPadding(pad,pad,pad,pad);
  Button close=new Button(this);close.setText("閉じる");close.setOnClickListener(v->finish());root.addView(close);
  status=new TextView(this);status.setText("設定項目を読み込んでいます…");root.addView(status);
  HaiagaruUi.showModel(this,request==null?"設定リンクを作成":"設定リンク",root);
  categories=request!=null&&!request.category.isEmpty()?new String[]{request.category}:Arrays.stream(SettingsSections.Category.values()).map(Enum::name).toArray(String[]::new);
  handler.post(()->load(0));
 }
 private void load(int index){if(isFinishing()||isDestroyed())return;
  if(index<categories.length){try{entries.addAll(SettingLinkCatalog.category(this,categories[index]));}catch(RuntimeException failure){android.util.Log.w("Haiagaru","Setting link category unavailable: "+categories[index],failure);}
   handler.postDelayed(()->load(index+1),16);return;}
  if(request==null){catalog();return;}
  ArrayList<SettingLinkEntry> found=new ArrayList<>();for(SettingLinkEntry entry:entries)if(entry.matches(request))found.add(entry);
  if(found.size()!=1){error(found.isEmpty()?"この版・構成では対応する設定が見つかりません。":"同名の設定が複数あります。カテゴリ付きのリンクを作成してください。");return;}
  SettingLinkEntry entry=found.get(0);
  if(request.value==null){openSetting(entry);return;}
  if(!entry.toggle()){error("この設定はオン／オフする項目ではありません。「設定を開く」リンクを使用してください。");return;}
  if(applied){status.setText("設定リンクを適用しました："+entry.label);return;}
  CompoundButton control=(CompoundButton)entry.control;
  status.setText(entry.label+"\n現在："+(control.isChecked()?"オン":"オフ")+" → 変更後："+(request.value?"オン":"オフ")+"\n\n「適用」を押すまで設定は変更しません。");
  Button open=new Button(this);open.setText("設定を開く");open.setOnClickListener(v->openSetting(entry));root.addView(open);
  Button apply=new Button(this);apply.setText("適用");root.addView(apply);apply.setEnabled(entry.available());
  if(!entry.available())status.append("\nこの項目は現在変更できません。設定画面で親の項目などを確認してください。");
  apply.setOnClickListener(v->{if(!entry.available())return;
   if(control.isChecked()!=request.value)control.performClick();
   if(control.isChecked()!=request.value){status.append("\n変更できませんでした。設定画面を確認してください。");return;}
   applied=true;apply.setEnabled(false);status.setText(entry.label+"を"+(request.value?"オン":"オフ")+"にしました。\n反映方法は元の設定画面の説明に従ってください。");
  });
 }
 private void catalog(){
  status.setText("設定を選び、「設定を開く」またはオン／オフのリンクをコピーできます。数値・文字列・選択肢・操作ボタンは「設定を開く」に対応します。");
  search=new EditText(this);search.setSingleLine(true);search.setHint("設定名で検索");root.addView(search);
  ScrollView scroll=new ScrollView(this);list=new LinearLayout(this);list.setOrientation(1);scroll.addView(list);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
  search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){render();}public void afterTextChanged(Editable e){}});render();
 }
 private void render(){list.removeAllViews();String query=search.getText().toString();int count=0;
  for(SettingLinkEntry entry:entries){if(!SettingsSections.matches(entry.label+" "+entry.category,query))continue;
   if(count++>=60){TextView more=new TextView(this);more.setText("設定名を入力して絞り込んでください。");list.addView(more);break;}
   Button button=new Button(this);button.setAllCaps(false);button.setText(entry.label+"\n"+SettingsSections.Category.valueOf(entry.category).ja);button.setOnClickListener(v->copyActions(entry));list.addView(button);
  }
 }
 private void copyActions(SettingLinkEntry entry){String[] actions=entry.toggle()?new String[]{"設定を開く","オンにする","オフにする"}:new String[]{"設定を開く"};
  new HaiagaruDialog.Builder(this).setTitle(entry.label).setItems(actions,(d,index)->{
   SettingLinkRequest link=new SettingLinkRequest(entry.label,entry.category,index==0?null:index==1);
   new HaiagaruDialog.Builder(this).setTitle("リンクの形式").setItems(new String[]{"設定リンクURL","書き込み用の文字列","AndroidインテントURL"},(dialog,format)->{
    String text=format==0?link.url():format==1?link.command():new Intent(Intent.ACTION_VIEW,Uri.parse(link.url())).setPackage(getPackageName()).toUri(Intent.URI_INTENT_SCHEME);
    ClipboardManager clipboard=(ClipboardManager)getSystemService(CLIPBOARD_SERVICE);clipboard.setPrimaryClip(ClipData.newPlainText("Haiagaru設定リンク",text));Toast.makeText(this,"設定リンクをコピーしました",Toast.LENGTH_SHORT).show();
   }).setNegativeButton("キャンセル",null).show();
  }).setNegativeButton("キャンセル",null).show();
 }
 private void openSetting(SettingLinkEntry entry){startActivity(new Intent(this,HaiagaruSettingsActivity.class).putExtra("haiagaru.settings.search",entry.label));finish();}
 private void error(String text){new HaiagaruDialog.Builder(this).setTitle("設定リンクを開けません").setMessage(text).setPositiveButton("閉じる",(d,w)->finish()).setOnCancelListener(d->finish()).show();}
 @Override public void onSaveInstanceState(Bundle out){out.putBoolean("applied",applied);super.onSaveInstanceState(out);}
 @Override public void onDestroy(){handler.removeCallbacksAndMessages(null);entries.clear();if(applied)Haiagaru.settingsClosed();super.onDestroy();}
}
