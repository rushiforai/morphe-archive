package e.e.a;
import android.app.AlertDialog;import android.content.*;import android.content.res.ColorStateList;import android.net.Uri;import android.os.*;import android.preference.*;import android.util.TypedValue;import android.view.*;import android.widget.*;import java.io.*;import java.text.SimpleDateFormat;import java.util.*;
/** Follow-up behavior preserving native playback and comment data. */
public final class Followup173 {
 private static final int DOCK_ID=0x00fa1731;
 private static final String SUGGESTIONS="search_suggestions_enabled";
 private static final String COMMENT_LIMIT="comment_fetch_limit";
 public static View findControls(ListView list,Object tag){View root=list.getParent() instanceof View?(View)list.getParent():list;return root.findViewWithTag(tag);}
 public static void pinControls(ListView list,View controls){
  if(!(list.getParent() instanceof RelativeLayout))return;
  RelativeLayout parent=(RelativeLayout)list.getParent();
  ViewGroup old=(ViewGroup)controls.getParent();if(old!=null)old.removeView(controls);
  controls.setId(DOCK_ID);
  RelativeLayout.LayoutParams dock=new RelativeLayout.LayoutParams(-1,-2);
  int title=list.getResources().getIdentifier("titlebar","id",list.getContext().getPackageName());
  if(title!=0)dock.addRule(RelativeLayout.BELOW,title);else dock.addRule(RelativeLayout.ALIGN_PARENT_TOP);
  parent.addView(controls,dock);
  RelativeLayout.LayoutParams rows=(RelativeLayout.LayoutParams)list.getLayoutParams();rows.addRule(RelativeLayout.BELOW,DOCK_ID);list.setLayoutParams(rows);
  ThemeChoice.background(controls);
 }
 public static void centerComment(TextView text){
  text.setGravity(Gravity.LEFT|Gravity.CENTER_VERTICAL);
  text.setTextSize(13);
  text.setIncludeFontPadding(false);
  if(text.getLayoutParams() instanceof RelativeLayout.LayoutParams){RelativeLayout.LayoutParams p=(RelativeLayout.LayoutParams)text.getLayoutParams();p.addRule(RelativeLayout.CENTER_VERTICAL);p.addRule(RelativeLayout.ALIGN_PARENT_TOP,0);text.setLayoutParams(p);}
 }
 public static void followBottom(ListView list,int position){
  if(list.getHeight()<=0||list.getAdapter()==null||position<0||position>=list.getCount())return;
  View row=list.getChildAt(position-list.getFirstVisiblePosition());int bottom=list.getHeight()-list.getPaddingBottom();
  if(row!=null&&Math.abs(row.getBottom()-bottom)<=1)return;
  if(row==null)row=list.getAdapter().getView(position,null,list);
  int width=Math.max(1,list.getWidth()-list.getPaddingLeft()-list.getPaddingRight());
  row.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
  list.setSelectionFromTop(position,bottom-list.getPaddingTop()-row.getMeasuredHeight());
 }
 public static boolean suggestionsEnabled(Context c){return PreferenceManager.getDefaultSharedPreferences(c).getBoolean(SUGGESTIONS,true);}
 private static PreferenceGroup parent(PreferenceGroup root,Preference target){
  for(int i=0;i<root.getPreferenceCount();i++){Preference p=root.getPreference(i);if(p==target)return root;if(p instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)p,target);if(found!=null)return found;}}return null;
 }
 private static void insertAfter(PreferenceGroup group,Preference anchor,Preference item){
  List<Preference> ordered=new ArrayList<Preference>();for(int i=0;i<group.getPreferenceCount();i++){Preference p=group.getPreference(i);if(p!=item)ordered.add(p);}
  ordered.add(ordered.indexOf(anchor)+1,item);group.removeAll();for(int i=0;i<ordered.size();i++){ordered.get(i).setOrder(i);group.addPreference(ordered.get(i));}
 }
 public static void settings(PreferenceActivity activity){
  PreferenceScreen root=activity.getPreferenceScreen();Preference startup=activity.findPreference("startup_screen");
  Preference size=activity.findPreference("comment_size_percent");
  if(size!=null&&activity.findPreference("comment_bold")==null){CheckBoxPreference bold=new CheckBoxPreference(activity);bold.setKey("comment_bold");bold.setTitle(UiStrings.translate("コメントを太字にする"));bold.setSummary(UiStrings.translate("次の再生から反映されます"));bold.setDefaultValue(Boolean.FALSE);PreferenceGroup group=parent(root,size);if(group!=null)insertAfter(group,size,bold);}
  if(startup!=null&&activity.findPreference(SUGGESTIONS)==null){CheckBoxPreference toggle=new CheckBoxPreference(activity);toggle.setKey(SUGGESTIONS);toggle.setTitle(UiStrings.translate("検索サジェスト"));toggle.setSummary(UiStrings.translate("検索入力時に候補を表示します"));toggle.setDefaultValue(Boolean.TRUE);toggle.setChecked(suggestionsEnabled(activity));PreferenceGroup group=parent(root,startup);if(group!=null)insertAfter(group,startup,toggle);}
  Preference tap=activity.findPreference("videolist_tap"),link=activity.findPreference("intent_type");
  if(tap!=null&&link!=null){PreferenceGroup old=parent(root,tap),target=parent(root,link);if(old!=null&&target!=null){old.removePreference(tap);insertAfter(target,link,tap);if(old!=target&&old.getPreferenceCount()==0){PreferenceGroup outer=parent(root,old);if(outer!=null)outer.removePreference(old);}}}
  Preference cast=activity.findPreference("comment_cast_min");if(cast!=null)cast.setSummary(UiStrings.translate("動作を安定させるため表示するコメント量を少なくしフレームレートを低く制限します。"));
  Preference old=activity.findPreference("comment_limit_extended");
  if(old!=null){PreferenceGroup group=parent(root,old);if(group!=null){int position=0;for(;position<group.getPreferenceCount();position++)if(group.getPreference(position)==old)break;group.removePreference(old);Preference slider=new Preference(activity);slider.setKey(COMMENT_LIMIT);slider.setTitle(UiStrings.translate("コメント取得数"));slider.setSummary(limitSummary(savedLimit(activity)));slider.setOnPreferenceClickListener(clicked->{showLimit(activity,clicked);return true;});List<Preference> items=new ArrayList<Preference>();for(int i=0;i<group.getPreferenceCount();i++)items.add(group.getPreference(i));items.add(Math.min(position,items.size()),slider);group.removeAll();for(int i=0;i<items.size();i++){items.get(i).setOrder(i);group.addPreference(items.get(i));}}}
  translatePreferences(root);
 }
 private static void translatePreferences(PreferenceGroup group){
  for(int i=0;i<group.getPreferenceCount();i++){Preference p=group.getPreference(i);if(p.getTitle()!=null)p.setTitle(UiStrings.translate(p.getTitle().toString()));if(p.getSummary()!=null)p.setSummary(UiStrings.translate(p.getSummary().toString()));if(p instanceof ListPreference){ListPreference l=(ListPreference)p;CharSequence[] entries=l.getEntries();if(entries!=null){CharSequence[] translated=new CharSequence[entries.length];for(int j=0;j<entries.length;j++)translated[j]=UiStrings.translate(entries[j].toString());l.setEntries(translated);}}if(p instanceof PreferenceGroup)translatePreferences((PreferenceGroup)p);}
 }
 private static int savedLimit(Context context){SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(context);return prefs.getInt(COMMENT_LIMIT,0);}
 private static String limitSummary(int limit){
  if(limit==0)return UiStrings.translate("標準（追加取得なし）");
  return UiStrings.translate("取得数：")+limit+UiStrings.translate("件。")+UiStrings.translate("次回の再生から反映されます。追加取得数は動画やログイン状態により異なります。");
 }

 public static int legacyTotal(SharedPreferences prefs,int original){int limit=prefs.getInt("legacy_comment_limit",prefs.getBoolean("comment_limit_extended",false)?2000:0);return limit==0?original:Math.max(100,Math.min(2000,limit));}
 public static int legacyPerMinute(SharedPreferences prefs,int original){int limit=prefs.getInt("legacy_comment_limit",prefs.getBoolean("comment_limit_extended",false)?2000:0);return limit==0?original:Math.max(10,Math.min(200,limit/10));}
 private static void showLimit(PreferenceActivity activity,Preference preference){
  Context c=PlaybackSession.dialogContext(activity);LinearLayout box=new LinearLayout(c);box.setOrientation(LinearLayout.VERTICAL);int pad=(int)(24*c.getResources().getDisplayMetrics().density);box.setPadding(pad,pad,pad,pad);
  TextView value=new TextView(c);value.setGravity(Gravity.CENTER);box.addView(value,new LinearLayout.LayoutParams(-1,-2));SeekBar bar=new SeekBar(c);bar.setMax(20);bar.setProgress(savedLimit(activity)/500);box.addView(bar,new LinearLayout.LayoutParams(-1,-2));
  TypedValue color=new TypedValue();if(c.getTheme().resolveAttribute(0x7f03005e,color,true)){int tint=color.resourceId==0?color.data:c.getResources().getColor(color.resourceId);if(bar.getProgressDrawable()!=null)bar.getProgressDrawable().setColorFilter(tint,android.graphics.PorterDuff.Mode.SRC_IN);if(bar.getThumb()!=null)bar.getThumb().setColorFilter(tint,android.graphics.PorterDuff.Mode.SRC_IN);}
  value.setText(bar.getProgress()==0?UiStrings.translate("標準（追加取得なし）"):bar.getProgress()*500+UiStrings.translate("件"));
  bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar s,int progress,boolean user){value.setText(progress==0?UiStrings.translate("標準（追加取得なし）"):progress*500+UiStrings.translate("件"));}public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}});
  AlertDialog dialog=new AlertDialog.Builder(c).setTitle(UiStrings.translate("コメント取得数")).setView(box).setPositiveButton(UiStrings.translate("OK"),(d,which)->{int limit=bar.getProgress()*500;PreferenceManager.getDefaultSharedPreferences(activity).edit().putInt(COMMENT_LIMIT,limit).apply();preference.setSummary(limitSummary(limit));}).setNegativeButton(UiStrings.translate("キャンセル"),null).create();dialog.show();PlaybackSession.styleDialog(dialog);
 }
 public static void saveLog(final Context context,final String content){
  AlertDialog dialog=new AlertDialog.Builder(PlaybackSession.dialogContext(context)).setTitle(UiStrings.translate("デバッグログの保存")).setMessage(UiStrings.translate("デバッグログをDownloadフォルダに保存しますか？")).setPositiveButton(UiStrings.translate("保存"),(d,which)->writeLog(context,content)).setNegativeButton(UiStrings.translate("キャンセル"),null).create();dialog.show();PlaybackSession.styleDialog(dialog);
 }
 private static void writeLog(final Context context,final String content){
  final Context app=context.getApplicationContext();
  new Thread(new Runnable(){public void run(){
   String name="nicoid-re_log_"+new SimpleDateFormat("yyyyMMddHHmmss",Locale.US).format(new Date())+".txt";Uri created=null;String message;
   try{
    if(Build.VERSION.SDK_INT>=29){ContentValues values=new ContentValues();values.put("_display_name",name);values.put("mime_type","text/plain");values.put("relative_path","Download/");values.put("is_pending",1);created=app.getContentResolver().insert(Uri.parse("content://media/external/downloads"),values);if(created==null)throw new IOException("Cannot create download");OutputStream stream=app.getContentResolver().openOutputStream(created);if(stream==null)throw new IOException("Cannot open download");try{stream.write(content.getBytes("UTF-8"));}finally{stream.close();}values.clear();values.put("is_pending",0);app.getContentResolver().update(created,values,null,null);
    }else{File folder=Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("Cannot create Download folder");File file=new File(folder,name);if(!file.createNewFile())throw new IOException("Log already exists");OutputStream stream=new FileOutputStream(file);try{stream.write(content.getBytes("UTF-8"));}finally{stream.close();}app.sendBroadcast(new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE,Uri.fromFile(file)));}
    message=UiStrings.translate("Downloadに保存しました")+": "+name;
   }catch(Exception error){if(created!=null)try{app.getContentResolver().delete(created,null,null);}catch(Exception ignored){}message=UiStrings.translate("ログを保存できませんでした");}
   final String toast=message;new Handler(Looper.getMainLooper()).post(new Runnable(){public void run(){Toast.makeText(app,toast,Toast.LENGTH_LONG).show();}});
  }},"nicoid-log-save").start();
 }
}
