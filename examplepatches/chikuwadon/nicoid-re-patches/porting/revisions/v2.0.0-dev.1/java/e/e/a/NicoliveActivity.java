package e.e.a;

import android.app.*;import android.content.*;import android.content.pm.ActivityInfo;import android.content.res.Configuration;import android.graphics.Color;import android.net.Uri;import android.os.*;import android.preference.PreferenceManager;import android.text.TextUtils;import android.view.*;import android.view.inputmethod.InputMethodManager;import android.widget.*;import java.time.Instant;import java.time.LocalDate;import java.time.format.DateTimeFormatter;import java.util.*;import org.json.*;

/** Native live hub and viewer. Video-only screens retain their existing model and engine. */
public class NicoliveActivity extends Activity implements NicoliveService.Observer {
 NicoliveBrowser browser;NicoliveService service;boolean bound,watching,fullscreen,info,atBottom=true,loading,resumeLoad;int loadToken,hubTab,category,newComments,feedPosition,feedOffset;long observedCount;String requested="",query="",draft="",pendingDraft="";NicoliveData.Program renderedProgram;long renderedViews=Long.MIN_VALUE,renderedComments=Long.MIN_VALUE;LinearLayout root,header,body,viewerPane,details,tabs,composer;TextView heading,status,title,owner,stats,information;ListView feed,chat;Button latest,login;EditText input,searchInput;CheckBox anonymous;ImageButton send;NicolivePlayerFrame playerFrame;FeedAdapter feedAdapter;ChatAdapter chatAdapter;final ArrayList<NicoliveData.Program> programs=new ArrayList<NicoliveData.Program>();final ArrayList<NicoliveData.Chat> comments=new ArrayList<NicoliveData.Chat>();
 final NicoliveListGestures listGestures=new NicoliveListGestures();
 LinearLayout categoryTabs,nowPlayingBar;
 static final int TIMETABLE=3;
 private static final int RANKING=4;
 private static final int RESERVATIONS=5;
 private static final int FOLLOWING=1;
 private static final DateTimeFormatter PROGRAM_TIME=DateTimeFormatter.ofPattern("M/d HH:mm",Locale.JAPAN);
 private static final DateTimeFormatter TIMETABLE_TIME=DateTimeFormatter.ofPattern("HH:mm");
 private static final int[] HUB_TABS={0,RANKING,TIMETABLE,FOLLOWING,2,RESERVATIONS};
 private static final String[] HUB_LABELS={"放送中","ランキング","番組表","フォロー","履歴","予約リスト"};
 private static final String START_TAB="nicolive_start_tab",
  LAST_TAB="nicolive_last_tab", FLOAT_REFRESH="nicolive_float_refresh", START_TIME="nicolive_start_time",
  TAP_BEHAVIOR="nicolive_tap_behavior"; // 0: usual viewer, 1: keep the hub and show popup
 private String pendingPopupId="",deniedProgramId="";
 private static final DateTimeFormatter DATE_TAB=DateTimeFormatter.ofPattern("M/d(E)",Locale.JAPAN);
 private boolean timetableOnAir;
 private AlertDialog exitDialog;
 private LocalDate timetableDay=LocalDate.now(NicoliveCatalog.JAPAN);
 private Button sortButton;
 private ImageButton bottomRefresh;
 private int followFilter;
 private final Set<String> reserving=new HashSet<>();
 private boolean rankingUsers=true;
 private NicoliveCatalog.Broadcast rankingState=NicoliveCatalog.Broadcast.LIVE;
 private NicoliveCatalog.Sort liveSort,timetableSort;
 private boolean recentReady;
 private final LinkedHashMap<String,NicoliveData.Program> pendingRecent=new LinkedHashMap<>();


 @Override public boolean dispatchTouchEvent(MotionEvent event) {
  if (!watching && listGestures.handle(this,feed,event)) return true;
  return super.dispatchTouchEvent(event);
 }

 final ServiceConnection connection=new ServiceConnection(){public void onServiceConnected(ComponentName name,IBinder binder){service=((NicoliveService.LocalBinder)binder).service();service.observe(NicoliveActivity.this);if(service!=null&&watching&&playerFrame!=null){service.returnToFrame(playerFrame);}if(service!=null&&!pendingPopupId.isEmpty())activateRequestedPopup();refreshAccount();changed();}public void onServiceDisconnected(ComponentName name){service=null;bound=false;}};
 @Override protected void onCreate(Bundle state){DynamicTheme.apply(this);super.onCreate(state);UiTheme191.activity(this);getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);browser=new NicoliveBrowser();
  android.content.SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(this);
  liveSort=NicoliveCatalog.Sort.restore(prefs.getString("nicolive_live_sort",""),NicoliveCatalog.Sort.NEWEST);
  timetableSort=NicoliveCatalog.Sort.restore(prefs.getString("nicolive_timetable_sort",""),NicoliveCatalog.Sort.OLDEST);
  int startTab=prefs.getInt(START_TAB,0);
  hubTab=validHubTab(startTab==-1?prefs.getInt(LAST_TAB,0):startTab);
  if(state!=null){timetableOnAir=state.getBoolean("timetableOnAir");draft=state.getString("draft","");query=state.getString("query","");hubTab=validHubTab(state.getInt("hubTab",hubTab));category=state.getInt("category",0);try{timetableDay=LocalDate.parse(state.getString("timetableDay",timetableDay.toString()));}catch(java.time.DateTimeException ignored){}requested=state.getString("program","");}
  if(state==null){String id=fromIntent(getIntent());if(id!=null)requested=id;}if(!requested.isEmpty())watch(requested);else hub();
 }
 String fromIntent(Intent intent){if(intent==null)return null;String id=NicoliveData.id(intent.getStringExtra("program"));return id!=null?id:NicoliveData.id(intent.getDataString());}
 @Override protected void onNewIntent(Intent intent){super.onNewIntent(intent);setIntent(intent);String id=fromIntent(intent);if(id!=null)watch(id);}
 @Override protected void onStart(){super.onStart();if(!watching){browser.resumeImages();if(resumeLoad){resumeLoad=false;if(loading)load();}}if(watching||NicoliveService.active!=null)bind();}
 @Override protected void onStop(){ExitModeOptions.clear(this);resumeLoad=!watching&&loading;browser.pauseImages();if(input!=null)draft=input.getText().toString();unbind();super.onStop();}
 @Override protected void onResume(){super.onResume();refreshAccount();updateNowPlaying();}
 void refreshAccount(){if(!watching||service==null||service.program==null||service.program.loggedIn||service.session==null)return;String cookie=NicoliveBrowser.cookie(this);if(cookie.contains("user_session=")&&!cookie.equals(service.session.accountCookie))service.open(service.id);}
 @Override protected void onDestroy(){unbind();if(browser!=null)browser.close();super.onDestroy();}
 @Override protected void onSaveInstanceState(Bundle state){if(input!=null)draft=input.getText().toString();state.putString("draft",draft);state.putString("query",query);state.putInt("hubTab",hubTab);state.putInt("category",category);state.putBoolean("timetableOnAir",timetableOnAir);state.putString("timetableDay",timetableDay.toString());state.putString("program",watching?requested:"");super.onSaveInstanceState(state);}
 @Override public void onConfigurationChanged(Configuration config){super.onConfigurationChanged(config);if(watching){if(input!=null)draft=input.getText().toString();fullscreen=config.orientation==Configuration.ORIENTATION_LANDSCAPE;updateViewerLayout();}else hub();}
 void bind(){if(bound)return;bound=bindService(new Intent(this,NicoliveService.class),connection,BIND_AUTO_CREATE);}
 void unbind(){if(service!=null){service.unobserve(this);if(playerFrame!=null)service.detach(playerFrame);}if(bound){try{unbindService(connection);}catch(Exception ignored){}bound=false;}service=null;}
 void base(){renderedProgram=null;renderedViews=renderedComments=Long.MIN_VALUE;root=new NicoliveSwipeLayout(this,step->{if(watching){if(!fullscreen){info=step>0;showPane();}}else moveCategory(step);});DynamicTheme.background(root);root.setFitsSystemWindows(true);setContentView(root);header=NicoliveUi.row(this);root.addView(header,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,48)));body=NicoliveUi.column(this);root.addView(body,new LinearLayout.LayoutParams(-1,0,1));}
 void hub(){boolean keepRecent=watching&&recentFeed()&&recentReady;browser.resumeImages();watching=false;fullscreen=false;getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN|WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);if(service!=null&&playerFrame!=null)service.detach(playerFrame);playerFrame=null;input=null;chat=null;base();
  ImageButton back=NicoliveUi.icon(this,"back","戻る");header.addView(back);back.setOnClickListener(v->exitHub());String screenTitle=hubTab==RESERVATIONS?"タイムシフト予約リスト":"生放送";heading=NicoliveUi.text(this,screenTitle,18);header.addView(heading,new LinearLayout.LayoutParams(0,-1,1));ImageButton menu=NicoliveUi.icon(this,"more","ニコ生メニュー");menu.setTag("nicoid-live-menu");header.addView(menu);menu.setOnClickListener(v->showHubMenu());
  searchInput=null;
  if(hubTab==0){
   LinearLayout searchRow=NicoliveUi.row(this);
   searchRow.setBackground(NicoliveUi.panel(this,10));
   searchInput=NicoliveUi.input(this,"番組名 / lv番号 / URL");
   searchInput.setBackground(null);
   searchInput.setPadding(NicoliveUi.dp(this,12),0,0,0);
   searchInput.setTextSize(14);
   searchInput.setText(query);
   searchInput.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
   searchRow.addView(searchInput,new LinearLayout.LayoutParams(0,-1,1));
   ImageButton search=NicoliveUi.icon(this,"search","検索 / 番組を開く");
   searchRow.addView(search,new LinearLayout.LayoutParams(NicoliveUi.dp(this,44),-1));
   search.setOnClickListener(v->searchValue(searchInput.getText().toString()));
   searchInput.setOnEditorActionListener((v,action,event)->{
    if(action!=android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH)return false;
    searchValue(searchInput.getText().toString());
    return true;
   });
   LinearLayout.LayoutParams searchLayout=new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,42));
   searchLayout.setMargins(NicoliveUi.dp(this,10),NicoliveUi.dp(this,4),NicoliveUi.dp(this,10),NicoliveUi.dp(this,2));
   body.addView(searchRow,searchLayout);
  }
  categoryTabs=null;
  if(hubTab==0){
   categoryTabs=NicoliveUi.row(this);
   String[] kinds={"すべて","ユーザー","公式","チャンネル"};
   for(int i=0;i<kinds.length;i++){
    final int selected=i;
    Button button=NicoliveUi.button(this,kinds[i]);
    button.setTextSize(12);
    button.setPadding(0,0,0,0);
    NicoliveUi.selected(button,selected==category);
    categoryTabs.addView(button,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,40),1));
    button.setOnClickListener(v->selectCategory(selected));
   }
   body.addView(categoryTabs);
  }
  if(hubTab==TIMETABLE)body.addView(timetableControls());
  if(hubTab==FOLLOWING)body.addView(followControls());
  status=NicoliveUi.text(this,"",13);
  status.setPadding(NicoliveUi.dp(this,12),0,NicoliveUi.dp(this,12),0);
  status.setMaxLines(2);
  status.setEllipsize(TextUtils.TruncateAt.END);
  status.setTextColor(DynamicTheme.secondaryTextColor(status));
  LinearLayout summary=NicoliveUi.row(this);
  summary.addView(status,new LinearLayout.LayoutParams(0,-1,1));
  if(hubTab==0||hubTab==TIMETABLE){
   sortButton=NicoliveUi.button(this,"");
   sortButton.setTag("nicoid-live-sort");
   sortButton.setMaxLines(1);
   sortButton.setEllipsize(TextUtils.TruncateAt.END);
   updateSortLabel();
   summary.addView(sortButton,new LinearLayout.LayoutParams(-2,-1));
   sortButton.setOnClickListener(this::showSort);
  }
  if(hubTab==RANKING)addRankingControls(summary);
  body.addView(summary,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,36)));
  FrameLayout listArea=new FrameLayout(this);
  body.addView(listArea,new LinearLayout.LayoutParams(-1,0,1));
  feed=new ListView(this);
  feed.setDivider(null);
  feed.setCacheColorHint(Color.TRANSPARENT);
  feed.setClipToPadding(false);
  feedAdapter=new FeedAdapter();
  feed.setAdapter(feedAdapter);
  listArea.addView(feed,new FrameLayout.LayoutParams(-1,-1));
  feed.setOnItemClickListener((parent,view,pos,row)->{
   if(pos>=feedAdapter.getCount())return;
   NicoliveData.Program selected=(NicoliveData.Program)feedAdapter.getItem(pos);
   if((hubTab==TIMETABLE||hubTab==FOLLOWING||hubTab==RANKING||hubTab==RESERVATIONS)&&!selected.onAir())openTimetableProgram(selected.id);
   else openSelectedProgram(selected.id);
  });
  feed.setOnItemLongClickListener((parent,view,pos,row)->{
   if(pos>=feedAdapter.getCount())return false;
   NicoliveData.Program program=(NicoliveData.Program)feedAdapter.getItem(pos);
   if(hubTab==2){confirmHistoryRemoval(program);return true;}
   if(hubTab==RESERVATIONS){confirmReservationRemoval(program);return true;}
   if(!program.scheduled())return false;
   confirmReservation(program);
   return true;
  });
  bottomRefresh=NicoliveUi.icon(this,"refresh","一覧を更新");
  bottomRefresh.setTag("nicoid-live-bottom-refresh");
  android.graphics.drawable.GradientDrawable circle=new android.graphics.drawable.GradientDrawable();
  circle.setShape(android.graphics.drawable.GradientDrawable.OVAL);
  circle.setColor(UiDialogs.surface(this));
  bottomRefresh.setBackground(circle);
  int padding=NicoliveUi.dp(this,14);
  bottomRefresh.setPadding(padding,padding,padding,padding);
  int size=NicoliveUi.dp(this,58);
  FrameLayout.LayoutParams refreshLayout=new FrameLayout.LayoutParams(size,size,Gravity.BOTTOM|Gravity.RIGHT);
  refreshLayout.setMargins(0,0,padding,padding);
  listArea.addView(bottomRefresh,refreshLayout);
  bottomRefresh.setOnClickListener(v->refreshFeed());
  updateHubDisplayOptions();

  nowPlayingBar=NicoliveUi.row(this);
  Button resume=NicoliveUi.button(this,"再生中の生放送に戻る");
  nowPlayingBar.addView(resume,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,48),1));
  resume.setOnClickListener(v->{NicoliveService playing=activeBroadcast();if(playing!=null)watch(playing.id);});
  ImageButton close=NicoliveUi.icon(this,"close","再生中の生放送を閉じる");
  close.setTag("nicoid-live-close-broadcast");
  nowPlayingBar.addView(close);
  close.setOnClickListener(v->{
   NicoliveService playing=activeBroadcast();
   if(playing!=null)playing.stopPlayback();
   updateNowPlaying();
  });
  body.addView(nowPlayingBar,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,48)));
  body.addView(hubNavigation());
  updateNowPlaying();
  if(keepRecent){
   loading=false;
   pendingRecent.clear();
   updateRecentStatus("");
   feed.setSelectionFromTop(feedPosition,feedOffset);
  }else{
   if(!recentFeed())programs.clear();
   load();
  }
 }

 private SharedPreferences prefs(){
  return PreferenceManager.getDefaultSharedPreferences(this);
 }

 private static int validHubTab(int value){
  for(int tab:HUB_TABS)if(tab==value)return tab;
  return 0;
 }

 private void showHubMenu(){
  AlertDialog menu=UiDialogs.builder(this).setTitle("ニコ生")
   .setItems(new String[]{"現在の一覧を更新","ニコ生の設定","公式サイトで開く"},(dialog,which)->{
    switch(which){
     case 0: refreshFeed(); break;
     case 1: showHubSettings(); break;
     case 2: openBrowser(officialPage()); break;
    }
   }).create();
  NicoliveUi.dialog(menu);
  Window window=menu.getWindow();
  if(window!=null){
   window.setGravity(Gravity.TOP|Gravity.END);
   WindowManager.LayoutParams layout=window.getAttributes();
   layout.y=NicoliveUi.dp(this,48);
   window.setAttributes(layout);
   window.setLayout(Math.min(getResources().getDisplayMetrics().widthPixels,NicoliveUi.dp(this,288)),
    ViewGroup.LayoutParams.WRAP_CONTENT);
  }
 }

 private void showHubSettings(){
  SharedPreferences preferences=prefs();
  LinearLayout options=NicoliveUi.column(UiTheme191.context(this));
  options.setBackgroundColor(Color.TRANSPARENT);
  int inset=NicoliveUi.dp(this,20);
  options.setPadding(inset,0,inset,0);
  CheckBox refresh=settingSwitch(options,"右下に更新ボタンを表示",preferences.getBoolean(FLOAT_REFRESH,true));
  Button exitChoice=settingChoiceRow(options,refresh.getCompoundPaddingStart());
  Button launch=settingChoiceRow(options,refresh.getCompoundPaddingStart());
  Button time=settingChoiceRow(options,refresh.getCompoundPaddingStart());
  Button tap=settingChoiceRow(options,refresh.getCompoundPaddingStart());
  String[] startOptions=Arrays.copyOf(HUB_LABELS,HUB_LABELS.length+1);
  startOptions[HUB_LABELS.length]="前回開いたタブ";
  int saved=preferences.getInt(START_TAB,0);
  int current=0;
  for(int i=0;i<HUB_TABS.length;i++)if(HUB_TABS[i]==saved)current=i;
  if(saved==-1)current=HUB_LABELS.length;
  int[] selections={current,preferences.getBoolean(START_TIME,false)?1:0,
   Math.max(0,Math.min(1,preferences.getInt(TAP_BEHAVIOR,0))),
   ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY)};
  String[] timeOptions={"経過時間","放送開始時刻"};
  bindSettingChoice(launch,"最初に開くタブ",startOptions,selections,0);
  bindSettingChoice(time,"放送中の時刻表示",timeOptions,selections,1);
  bindSettingChoice(tap,"タップ時の動作",new String[]{"通常再生","ポップアップ再生"},selections,2);
  showChoiceValue(exitChoice,"ニコ生を閉じるときの確認",ExitModeOptions.labels(this)[selections[3]]);
  exitChoice.setOnClickListener(v->NicoliveUi.dialog(UiDialogs.builder(this)
   .setTitle("ニコ生を閉じるときの確認")
   .setSingleChoiceItems(ExitModeOptions.labels(this),selections[3],(dialog,which)->{
    selections[3]=which;
    showChoiceValue(exitChoice,"ニコ生を閉じるときの確認",ExitModeOptions.labels(this)[which]);
    dialog.dismiss();
   }).setNegativeButton(android.R.string.cancel,null).create()));
  ScrollView scroll=new ScrollView(options.getContext());
  scroll.addView(options);
  NicoliveUi.dialog(UiDialogs.builder(this).setTitle("ニコ生の設定").setView(scroll)
   .setNegativeButton(android.R.string.cancel,null)
   .setPositiveButton("適用",(dialog,which)->{
    int start=selections[0]==HUB_TABS.length?-1:HUB_TABS[selections[0]];
    preferences.edit().putInt(ExitModeOptions.LIVE_KEY,selections[3])
     .putBoolean(FLOAT_REFRESH,refresh.isChecked()).putInt(START_TAB,start)
     .putBoolean(START_TIME,selections[1]==1).putInt(TAP_BEHAVIOR,selections[2]).apply();
    updateHubDisplayOptions();
   }).create());
 }

 private CheckBox settingSwitch(LinearLayout options,String label,boolean checked){
  CheckBox check=new CheckBox(options.getContext());
  check.setText(label);
  check.setMinHeight(NicoliveUi.dp(this,48));
  check.setChecked(checked);
  options.addView(check,new LinearLayout.LayoutParams(-1,-2));
  return check;
 }

 private void updateHubDisplayOptions(){
  boolean show=prefs().getBoolean(FLOAT_REFRESH,true);
  bottomRefresh.setVisibility(show?View.VISIBLE:View.GONE);
  feed.setPadding(0,0,0,show?NicoliveUi.dp(this,62):0);
  feedAdapter.notifyDataSetChanged();
 }

 private Button settingChoiceRow(LinearLayout options,int startPadding){
  Button button=NicoliveUi.button(options.getContext(),"");
  button.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);
  button.setTextSize(14);
  button.setMinHeight(NicoliveUi.dp(this,48));
  button.setPaddingRelative(startPadding,0,0,0);
  options.addView(button,new LinearLayout.LayoutParams(-1,-2));
  return button;
 }

 private void showChoiceValue(Button button,String label,String value){
  android.text.SpannableString text=new android.text.SpannableString(label+" / "+value);
  text.setSpan(new android.text.style.ForegroundColorSpan(DynamicTheme.textColor(button)),
   0,label.length()+3,android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
  text.setSpan(new android.text.style.ForegroundColorSpan(settingValueColor(button.getContext())),
   label.length()+3,text.length(),android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
  button.setText(text);
 }

 private int settingValueColor(Context context){
  int accent=NicoliveUi.accent(context);
  float surface=Color.luminance(UiDialogs.surface(this));
  int target=surface>.179f?0:255;
  int color=accent;
  // Keep the theme hue and adjust its lightness only when needed against the dialog surface.
  for(int step=1;step<=32;step++){
   float luminance=Color.luminance(color);
   if((Math.max(luminance,surface)+.05f)/(Math.min(luminance,surface)+.05f)>=4.5f)break;
   color=Color.rgb((Color.red(accent)*(32-step)+target*step)/32,
    (Color.green(accent)*(32-step)+target*step)/32,
    (Color.blue(accent)*(32-step)+target*step)/32);
  }
  return color;
 }

 private void bindSettingChoice(Button button,String label,String[] choices,int[] selections,int index){
  showChoiceValue(button,label,choices[selections[index]]);
  button.setOnClickListener(v->NicoliveUi.dialog(UiDialogs.builder(this).setTitle(label)
   .setSingleChoiceItems(choices,selections[index],(dialog,which)->{
    selections[index]=which;
    showChoiceValue(button,label,choices[which]);
    dialog.dismiss();
   }).setNegativeButton(android.R.string.cancel,null).create()));
 }

 String officialPage(){
  switch(hubTab){
   case RANKING: return NicoliveCatalog.rankingUrl(rankingState);
   case TIMETABLE:
    return timetableOnAir?"https://live.nicovideo.jp/timetable":NicoliveCatalog.timetableUrl(timetableDay);
   case FOLLOWING:
    return NicoliveCatalog.followUrl(followFilter==0?NicoliveCatalog.Broadcast.LIVE:
     NicoliveCatalog.Broadcast.values()[followFilter-1]);
   case 2: return "https://www.nicovideo.jp/my/history/live";
   case RESERVATIONS: return "https://www.nicovideo.jp/my/timeshift-reservations";
   default: return query.isEmpty()?"https://live.nicovideo.jp/recent":
    "https://live.nicovideo.jp/search?keyword="+Uri.encode(query);
  }
 }

 private void exitHub(){
  int mode=ExitModeOptions.mode(this,ExitModeOptions.LIVE_KEY);
  if(mode==ExitModeOptions.NONE){ExitModeOptions.clear(this);finish();return;}
  if(mode==ExitModeOptions.DOUBLE_BACK){
   if(ExitModeOptions.doubleBack(this,"もう一度戻るとニコ生を閉じます"))finish();
   return;
  }
  ExitModeOptions.clear(this);
  if(exitDialog!=null&&exitDialog.isShowing())return;
  exitDialog=UiDialogs.builder(this).setTitle("ニコ生を閉じますか？")
   .setMessage("通常のニコ動画面に戻ります")
   .setNegativeButton(android.R.string.cancel,null)
   .setPositiveButton("戻る",(dialog,which)->finish()).create();
  NicoliveUi.dialog(exitDialog);
 }

 private LinearLayout hubNavigation(){
  LinearLayout navigation=NicoliveUi.row(this);
  navigation.setTag("nicoid-live-navigation");
  navigation.setBackground(NicoliveUi.panel(this,10));
  String[] icons={"live","ranking","calendar","people","history","schedule"};
  for(int index=0;index<HUB_TABS.length;index++){
   final int destination=HUB_TABS[index];
   View button=NicoliveUi.navigationButton(this,HUB_LABELS[index],icons[index],hubTab==destination);
   if(destination==RESERVATIONS)button.setContentDescription("タイムシフト予約リスト");
   navigation.addView(button,new LinearLayout.LayoutParams(0,-1,1));
   button.setOnClickListener(v->{
    if(hubTab==destination)return;
    recentReady=false;
    hubTab=destination;
    prefs().edit().putInt(LAST_TAB,destination).apply();
    query="";
    feedPosition=0;
    feedOffset=0;
    hub();
   });
  }
  LinearLayout.LayoutParams layout=new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,50));
  layout.setMargins(NicoliveUi.dp(this,8),0,NicoliveUi.dp(this,8),NicoliveUi.dp(this,4));
  navigation.setLayoutParams(layout);
  return navigation;
 }

 private NicoliveCatalog.Sort activeSort(){
  return hubTab==TIMETABLE?timetableSort:liveSort;
 }

 private void updateSortLabel(){
  sortButton.setText(activeSort().label+" ▾");
  sortButton.setContentDescription("並べ替え / "+activeSort().label);
 }

 private void showSort(View anchor){
  PopupMenu menu=new PopupMenu(this,anchor);
  for(NicoliveCatalog.Sort sort:NicoliveCatalog.Sort.values()){
   menu.getMenu().add(0,sort.ordinal(),sort.ordinal(),sort.label).setCheckable(true).setChecked(sort==activeSort());
  }
  menu.getMenu().setGroupCheckable(0,true,true);
  menu.setOnMenuItemClickListener(item->{
   selectSort(NicoliveCatalog.Sort.values()[item.getItemId()]);
   return true;
  });
  menu.show();
 }

 void selectSort(NicoliveCatalog.Sort sort){
  if(sort==activeSort())return;
  boolean timetable=hubTab==TIMETABLE;
  if(timetable)timetableSort=sort;
  else liveSort=sort;
  PreferenceManager.getDefaultSharedPreferences(this).edit()
   .putString(timetable?"nicolive_timetable_sort":"nicolive_live_sort",sort.name()).apply();
  feedPosition=0;
  feedOffset=0;
  updateSortLabel();
  if(recentFeed()){recentReady=false;load();}
  else{
   feedAdapter.notifyDataSetChanged();
   feed.setSelection(0);
  }
 }

 private NicoliveService activeBroadcast(){
  NicoliveService live=NicoliveService.active;
  if(live==null||live.stopped||live.terminal||live.id.isEmpty())return null;
  return live;
 }

 void updateNowPlaying(){
  if(!watching&&nowPlayingBar!=null)nowPlayingBar.setVisibility(activeBroadcast()==null?View.GONE:View.VISIBLE);
 }

 void refreshFeed(){
  feedPosition=0;
  feedOffset=0;
  browser.refresh();
  load();
 }

 void moveCategory(int step){
  if(hubTab==0)selectCategory(Math.max(0,Math.min(3,category+step)));
  else if(hubTab==FOLLOWING)selectFollow(Math.max(0,Math.min(3,followFilter+step)));
  else if(hubTab==TIMETABLE)moveTimetable(step);
 }

 void selectCategory(int selected){
  if(categoryTabs==null)return;
  if(category==selected)return;
  category=selected;
  for(int index=0;index<categoryTabs.getChildCount();index++){
   NicoliveUi.selected((Button)categoryTabs.getChildAt(index),index==category);
  }
  feedPosition=0;
  feedOffset=0;
  feedAdapter.notifyDataSetChanged();
  feed.setSelection(0);
  if(recentFeed())updateRecentStatus(loading?"取得中…":"");
 }

 void load(){if(watching)return;final int token=++loadToken;loading=true;status.setText("取得中…");
  if(recentFeed()){
   pendingRecent.clear();
   if(!recentReady){
    programs.clear();
    feedAdapter.notifyDataSetChanged();
   }
   updateRecentStatus("取得中…");
   loadRecentPage(token,0,NicoliveBrowser.cookie(this),false);
   return;
  }
  if(hubTab==TIMETABLE){loadTimetable(token);return;}
  if(hubTab==RANKING){loadRanking(token);return;}
  if(hubTab==RESERVATIONS){loadReservations(token);return;}
  if(hubTab==FOLLOWING){loadFollowing(token);return;}
  if(hubTab==2){programs.clear();try{JSONArray history=new JSONArray(PreferenceManager.getDefaultSharedPreferences(this).getString("nicolive_history","[]"));for(int i=0;i<history.length();i++){JSONObject p=history.optJSONObject(i);NicoliveData.Program value=p==null?null:NicoliveData.Program.listing(p);if(value!=null)programs.add(value);}}catch(Exception ignored){}loading=false;status.setText(programs.isEmpty()?"視聴履歴はありません":"視聴履歴");feedAdapter.notifyDataSetChanged();return;}
  String url="https://live.nicovideo.jp/search?keyword="+Uri.encode(query);
  browser.load(url,NicoliveBrowser.cookie(this),new NicoliveBrowser.Result(){
   public void done(String html){
    if(!currentLoad(token))return;
    try{
     programs.clear();
     for(NicoliveData.Program program:NicoliveData.listings(html))if(program.onAir())programs.add(program);
     String label=programs.isEmpty()?"放送中の番組が見つかりません":"放送中 "+programs.size()+"件 / "+query;
     showResults(label);
    }catch(Exception invalid){error();}
   }
   public void error(){if(currentLoad(token))showResults("一覧を取得できませんでした");}
  });
 }
 private boolean recentFeed(){
  return hubTab==0&&query.isEmpty();
 }

 private boolean currentLoad(int token){
  return token==loadToken&&!watching&&!isFinishing();
 }

 private void loadRecentPage(int token,int page,String cookie,boolean officialUnavailable){
  browser.load(NicoliveCatalog.recentUrl(page,liveSort),cookie,new NicoliveBrowser.Result(){
   @Override public void done(String data){
    if(!currentLoad(token))return;
    try{
     NicoliveCatalog.Page result=NicoliveCatalog.recent(data,page);
     addLivePrograms(result.programs);
     if(page==0){
      loadOfficialNow(token,cookie,result.more);
     }else if(result.more){
      loadRecentPage(token,page+1,cookie,officialUnavailable);
     }else{
      String note=officialUnavailable?"公式番組の補完に失敗":"";
     finishRecent(note,true);
     }
    }catch(JSONException invalid){error();}
   }
   @Override public void error(){
    if(currentLoad(token))finishRecent("取得が途中で止まりました / 更新で再試行",false);
   }
  });
 }

 private void loadOfficialNow(int token,String cookie,boolean more){
  if(!recentReady)publishRecent();
  LocalDate today=LocalDate.now(NicoliveCatalog.JAPAN);
  browser.load(NicoliveCatalog.timetableUrl(today),cookie,new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{addLivePrograms(NicoliveCatalog.timetable(html,today));}
    catch(Exception invalid){error();return;}
    proceed(false);
   }
   @Override public void error(){if(currentLoad(token))proceed(true);}
   private void proceed(boolean unavailable){
    if(more)loadRecentPage(token,1,cookie,unavailable);
    else {
     String note=unavailable?"公式番組の補完に失敗":"";
     finishRecent(note,true);
    }
   }
  });
 }

 private void addLivePrograms(List<NicoliveData.Program> page){
  for(NicoliveData.Program program:page)if(program.onAir())pendingRecent.putIfAbsent(program.id,program);
 }

 private void publishRecent(){
  programs.clear();
  programs.addAll(pendingRecent.values());
  feedAdapter.notifyDataSetChanged();
 }

 private void finishRecent(String note,boolean complete){
  loading=false;
  if(complete||!recentReady)publishRecent();
  if(complete)recentReady=true;
  pendingRecent.clear();
  updateRecentStatus(note);
 }

 private void updateRecentStatus(String note){
  String count="放送中 "+feedAdapter.getCount()+"件";
  status.setText(note.isEmpty()?count:count+" / "+note);
 }

 private void showResults(String label){
  loading=false;
  status.setText(label);
  feedAdapter.notifyDataSetChanged();
  feed.setSelectionFromTop(feedPosition,feedOffset);
 }

 private LinearLayout followControls(){
  LinearLayout row=NicoliveUi.row(this);
  String[] labels={"概要","放送中","放送予定","放送終了"};
  for(int i=0;i<labels.length;i++){
   int selected=i;
   Button button=NicoliveUi.button(this,labels[i]);
   NicoliveUi.selected(button,i==followFilter);
   row.addView(button,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,40),1));
   button.setOnClickListener(v->selectFollow(selected));
  }
  return row;
 }

 private void selectFollow(int filter){
  if(followFilter==filter)return;
  followFilter=filter;
  feedPosition=feedOffset=0;
  hub();
 }

 private void confirmHistoryRemoval(NicoliveData.Program program){
  NicoliveUi.dialog(UiDialogs.builder(this).setTitle("視聴履歴を削除")
   .setMessage(program.title+"\nこの端末の視聴履歴から削除しますか？")
   .setPositiveButton("削除",(dialog,which)->{
    try{
     SharedPreferences preferences=prefs();
     JSONArray entries=new JSONArray(preferences.getString("nicolive_history","[]"));
     JSONArray retained=new JSONArray();
     for(int i=0;i<entries.length();i++){
      JSONObject saved=entries.optJSONObject(i);
      if(saved==null||!program.id.equals(saved.optString("nicoliveProgramId")))retained.put(entries.opt(i));
     }
     if(!preferences.edit().putString("nicolive_history",retained.toString()).commit()){
      Toast.makeText(this,"視聴履歴を保存できませんでした",Toast.LENGTH_LONG).show();return;
     }
     if(hubTab==2&&!watching){programs.removeIf(p->program.id.equals(p.id));showResults(programs.isEmpty()?"視聴履歴はありません":"視聴履歴");}
    }catch(JSONException e){Toast.makeText(this,"視聴履歴を削除できませんでした",Toast.LENGTH_LONG).show();}
   }).setNegativeButton("キャンセル",null).create());
 }

 private void confirmReservationRemoval(NicoliveData.Program program){
  String cookie=NicoliveBrowser.cookie(this);
  if(cookie.isEmpty()){Toast.makeText(this,"予約の取消にはログインが必要です",Toast.LENGTH_SHORT).show();return;}
  if(reserving.contains(program.id))return;
  NicoliveUi.dialog(UiDialogs.builder(this).setTitle("タイムシフト予約を削除")
   .setMessage(program.title+"\n予約を取り消しますか？")
   .setPositiveButton("予約を削除",(dialog,which)->{
    if(!reserving.add(program.id))return;
    browser.cancelReservation(program.id,cookie,new NicoliveBrowser.Result(){
     public void done(String ignored){
      reserving.remove(program.id);
      if(isFinishing()||isDestroyed())return;
      Toast.makeText(NicoliveActivity.this,"タイムシフト予約を取り消しました",Toast.LENGTH_SHORT).show();
      refreshReservationsAfterWrite();
     }
     public void error(){
      reserving.remove(program.id);
      if(!isFinishing()&&!isDestroyed())Toast.makeText(NicoliveActivity.this,
       "予約を取り消せませんでした / 通信状態と予約を確認してください",Toast.LENGTH_LONG).show();
     }
    });
   }).setNegativeButton("キャンセル",null).create());
 }

 private void refreshReservationsAfterWrite(){
  if(hubTab!=RESERVATIONS||watching)return;
  if(browser.imagesPaused){loading=true;resumeLoad=true;}
  else load();
 }
 private void loadReservations(int token){
  String cookie=NicoliveBrowser.cookie(this);
  if(cookie.isEmpty()){showResults("タイムシフト予約を見るにはログインしてください");return;}
  browser.load(NicoliveCatalog.reservationsUrl(),cookie,new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{
     List<NicoliveData.Program> result=NicoliveCatalog.reservations(html);
     programs.clear();
     programs.addAll(result);
     String label=programs.isEmpty()?"タイムシフト予約はありません":programs.size()+"件";
     showResults(label);
    }catch(Exception invalid){error();}
   }
   @Override public void error(){if(currentLoad(token))showResults("予約リストを取得できませんでした / ログイン状態を確認してください");}
  });
 }

 private void confirmReservation(NicoliveData.Program program){
  String cookie=NicoliveBrowser.cookie(this);
  if(cookie.isEmpty()){Toast.makeText(this,"タイムシフト予約にはログインが必要です",Toast.LENGTH_SHORT).show();return;}
  if(reserving.contains(program.id))return;
  AlertDialog dialog=UiDialogs.builder(this).setTitle("タイムシフト予約").setMessage(program.title)
    .setPositiveButton("予約する",(d,which)->{
     if(!reserving.add(program.id))return;
     browser.reserve(program.id,cookie,new NicoliveBrowser.Result(){
      @Override public void done(String ignored){
       reserving.remove(program.id);
       if(isFinishing())return;
       Toast.makeText(NicoliveActivity.this,"タイムシフトを予約しました",Toast.LENGTH_SHORT).show();
       refreshReservationsAfterWrite();
      }
      @Override public void error(){
       reserving.remove(program.id);
       if(!isFinishing())Toast.makeText(NicoliveActivity.this,"予約できませんでした / 予約条件や予約リストを確認してください",Toast.LENGTH_LONG).show();
      }
     });
    }).setNegativeButton("キャンセル",null).create();
  NicoliveUi.dialog(dialog);
 }

 private void loadFollowing(int token){
  String cookie=NicoliveBrowser.cookie(this);
  if(cookie.isEmpty()){showResults("フォロー中の番組を見るにはログインしてください");return;}
  loadFollowPage(token,cookie,followFilter==0?0:followFilter-1,new LinkedHashMap<>(),false);
 }

 private void loadFollowPage(int token,String cookie,int index,LinkedHashMap<String,NicoliveData.Program> followed,boolean failed){
  NicoliveCatalog.Broadcast state=NicoliveCatalog.Broadcast.values()[index];
  browser.load(NicoliveCatalog.followUrl(state),cookie,new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{
     List<NicoliveData.Program> items=NicoliveCatalog.followed(html);
     if(items==null){programs.clear();showResults("フォロー中の番組を見るにはログインしてください");return;}
     for(NicoliveData.Program item:items)if(followFilter==0||state.matches(item))followed.putIfAbsent(item.id,item);
     proceed(failed);
    }catch(Exception invalid){error();}
   }
   @Override public void error(){if(currentLoad(token))proceed(true);}
   private void proceed(boolean unavailable){
    if(followFilter==0&&index+1<NicoliveCatalog.Broadcast.values().length){
     loadFollowPage(token,cookie,index+1,followed,unavailable);
     return;
    }
    if(followed.isEmpty()||unavailable){
     loadFollowHome(token,cookie,followed,unavailable);
     return;
    }
    showFollowing(followed,false);
   }
  });
 }

 private void loadFollowHome(int token,String cookie,LinkedHashMap<String,NicoliveData.Program> followed,boolean partial){
  browser.load("https://live.nicovideo.jp/",cookie,new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{
     List<NicoliveData.Program> items=NicoliveCatalog.followed(html);
     if(items==null){showResults("フォロー中の番組を見るにはログインしてください");return;}
     for(NicoliveData.Program item:items){
      if(followFilter==0||NicoliveCatalog.Broadcast.values()[followFilter-1].matches(item))followed.putIfAbsent(item.id,item);
     }
     showFollowing(followed,partial);
    }catch(Exception invalid){error();}
   }
   @Override public void error(){if(currentLoad(token))showFollowing(followed,true);}
  });
 }

 private void showFollowing(Map<String,NicoliveData.Program> followed,boolean unavailable){
  programs.clear();
  programs.addAll(followed.values());
  programs.sort(Comparator.comparingInt((NicoliveData.Program p)->p.onAir()?0:p.ended()?2:1)
    .thenComparingLong(p->p.onAir()||p.ended()?-p.begin:p.begin));
  String count=programs.isEmpty()?"フォロー中の番組はありません":programs.size()+"件";
  if(unavailable)count=programs.isEmpty()?"フォロー一覧を取得できませんでした":count+" / 一部の一覧を取得できませんでした";
  showResults(count);
 }

 private void addRankingControls(LinearLayout row){
  Button providers=NicoliveUi.button(this,rankingUsers?"ユーザー ▾":"公式・CH ▾");
  providers.setOnClickListener(v->{
   PopupMenu menu=new PopupMenu(this,providers);
   menu.getMenu().add(0,1,0,"ユーザー番組");
   menu.getMenu().add(0,2,1,"公式・チャンネル番組");
   menu.setOnMenuItemClickListener(item->{
    boolean users=item.getItemId()==1;
    if(rankingUsers!=users){rankingUsers=users;feedPosition=feedOffset=0;hub();}
    return true;
   });
   menu.show();
  });
  row.addView(providers);
  Button options=NicoliveUi.button(this,rankingState.label+" ▾");
  options.setContentDescription("ランキングの対象 / "+rankingState.label);
  options.setOnClickListener(v->{
   NicoliveCatalog.Broadcast[] states=NicoliveCatalog.Broadcast.values();
   String[] labels=new String[states.length];
   for(int i=0;i<states.length;i++)labels[i]=states[i].label;
   AlertDialog dialog=UiDialogs.builder(this).setTitle("ランキングの対象")
     .setSingleChoiceItems(labels,rankingState.ordinal(),(d,which)->{
      d.dismiss();
      if(rankingState!=states[which]){rankingState=states[which];feedPosition=feedOffset=0;hub();}
     }).setNegativeButton("閉じる",null).create();
   NicoliveUi.dialog(dialog);
  });
  row.addView(options);
 }

 private void loadRanking(int token){
  NicoliveCatalog.Broadcast state=rankingState;
  boolean users=rankingUsers;
  browser.load(NicoliveCatalog.rankingUrl(state),NicoliveBrowser.cookie(this),new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{
     List<NicoliveData.Program> ranked=NicoliveCatalog.ranking(html,state,users);
     programs.clear();
     programs.addAll(ranked);
     String label=ranked.isEmpty()?"対象の番組はありません":ranked.size()+"件";
     showResults(label);
    }catch(Exception invalid){error();}
   }
   @Override public void error(){if(currentLoad(token))showResults("ランキングを取得できませんでした");}
  });
 }

 private HorizontalScrollView timetableControls(){
  HorizontalScrollView scroll=new HorizontalScrollView(this);
  scroll.setHorizontalScrollBarEnabled(false);
  scroll.setTag("nicoid-live-timetable-dates");
  LinearLayout row=NicoliveUi.row(this);
  scroll.addView(row);
  LocalDate today=LocalDate.now(NicoliveCatalog.JAPAN);
  LocalDate first=today.minusDays(7),last=today.plusDays(7);
  if(timetableDay.isBefore(first)||timetableDay.isAfter(last))timetableDay=today;
  for(LocalDate day=first;!day.isAfter(last);day=day.plusDays(1)){
   if(day.equals(today))addDateTab(row,"放送中",today,true);
   addDateTab(row,day.equals(today)?"今日":DATE_TAB.format(day),day,false);
  }
  scroll.post(()->{
   for(int i=0;i<row.getChildCount();i++){
    View tab=row.getChildAt(i);
    if(tab.isSelected()){scroll.scrollTo(tab.getLeft()+(tab.getWidth()-scroll.getWidth())/2,0);break;}
   }
  });
  return scroll;
 }

 private void addDateTab(LinearLayout row,String label,LocalDate day,boolean onAir){
  Button tab=NicoliveUi.button(this,label);
  tab.setSingleLine(true);
  tab.setMinWidth(NicoliveUi.dp(this,60));
  NicoliveUi.selected(tab,timetableOnAir==onAir&&(onAir||timetableDay.equals(day)));
  row.addView(tab,new LinearLayout.LayoutParams(-2,NicoliveUi.dp(this,42)));
  tab.setOnClickListener(v->selectTimetableDay(day,onAir));
 }

 private void moveTimetable(int step){
  LocalDate today=LocalDate.now(NicoliveCatalog.JAPAN);
  if(timetableOnAir){
   selectTimetableDay(step<0?today.minusDays(1):today,false);
  }else if((step<0&&timetableDay.equals(today))||(step>0&&timetableDay.equals(today.minusDays(1)))){
   selectTimetableDay(today,true);
  }else if(!timetableDay.plusDays(step).isBefore(today.minusDays(7))&&
           !timetableDay.plusDays(step).isAfter(today.plusDays(7))){
   selectTimetableDay(timetableDay.plusDays(step),false);
  }
 }

 private void selectTimetableDay(LocalDate day,boolean onAir){
  if(day.equals(timetableDay)&&onAir==timetableOnAir)return;
  timetableDay=day;
  timetableOnAir=onAir;
  feedPosition=feedOffset=0;
  hub();
 }

 private void loadTimetable(int token){
  programs.clear();
  feedAdapter.notifyDataSetChanged();
  LocalDate today=LocalDate.now(NicoliveCatalog.JAPAN);
  LocalDate date=timetableOnAir?today:timetableDay;
  loadTimetableDate(token,date,NicoliveBrowser.cookie(this),timetableOnAir,false,
    false,new LinkedHashMap<>());
 }

 private void loadTimetableDate(int token,LocalDate date,String cookie,boolean onAir,
                                boolean previous,boolean failed,LinkedHashMap<String,NicoliveData.Program> results){
  browser.load(NicoliveCatalog.timetableUrl(date),cookie,new NicoliveBrowser.Result(){
   @Override public void done(String html){
    if(!currentLoad(token))return;
    try{
     for(NicoliveData.Program program:NicoliveCatalog.timetable(html,date)){
      if(!onAir||program.onAir())results.putIfAbsent(program.id,program);
     }
    }catch(Exception invalid){error();return;}
    if(onAir&&!previous){loadTimetableDate(token,date.minusDays(1),cookie,true,true,false,results);return;}
    showTimetableResults(results,failed);
   }
   @Override public void error(){
    if(!currentLoad(token))return;
    if(onAir&&!previous){loadTimetableDate(token,date.minusDays(1),cookie,true,true,true,results);return;}
    showTimetableResults(results,true);
   }
  });
 }

 private void showTimetableResults(Map<String,NicoliveData.Program> results,boolean failed){
  programs.addAll(results.values());
  String count="公式・チャンネル "+programs.size()+"件";
  if(programs.isEmpty())showResults(failed?"番組表を取得できませんでした":"番組はありません");
  else showResults(failed?count+" / 一部取得できませんでした":count);
 }

 private void openTimetableProgram(String id){
  openBrowser("https://live.nicovideo.jp/watch/"+id);
 }

 private void openBrowser(String url){
  Intent browserIntent=new Intent(Intent.ACTION_VIEW,Uri.parse(url));
  browserIntent.setSelector(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_APP_BROWSER));
  try{startActivity(browserIntent);}
  catch(ActivityNotFoundException unavailable){Toast.makeText(this,"ブラウザを開けませんでした",Toast.LENGTH_SHORT).show();}
 }

 void openSelectedProgram(String id){
  if(prefs().getInt(TAP_BEHAVIOR,0)==1)openPopupFromHub(id);
  else watch(id);
 }

 void openPopupFromHub(String id){
  if(Build.VERSION.SDK_INT<28){Toast.makeText(this,"生放送はAndroid 9以降で利用できます",Toast.LENGTH_LONG).show();return;}
  if(!android.provider.Settings.canDrawOverlays(this)){
   Toast.makeText(this,"ポップアップ再生には重ねて表示する権限が必要です",Toast.LENGTH_LONG).show();
   startActivity(new Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,Uri.parse("package:"+getPackageName())));
   return;
  }
  requested=id;pendingPopupId=id;deniedProgramId="";
  Intent start=new Intent(this,NicoliveService.class).putExtra("program",id);
  startForegroundService(start);
  if(service!=null&&!service.stopped)activateRequestedPopup();
  else bind();
  updateNowPlaying();
 }

 void activateRequestedPopup(){
  if(service==null||pendingPopupId.isEmpty())return;
  String id=pendingPopupId;pendingPopupId="";
  if(service.stopped)return;
  if(!id.equals(service.id)||service.terminal)service.open(id);
  service.showPopup();
  if(service.popup==null)Toast.makeText(this,"ポップアップを開始できませんでした",Toast.LENGTH_LONG).show();
  updateNowPlaying();
 }

 void showWatchRestriction(NicoliveData.Program program){
  if(program==null||program.canWatch||program.id.equals(deniedProgramId)||isFinishing())return;
  deniedProgramId=program.id;
  String requirement=program.accessLabel();
  String message=(requirement.isEmpty()?"この番組":requirement+"の番組")+"は現在のアカウントで視聴できません。";
  if(!program.loggedIn)message+="\nログインが必要な場合があります。";
  else message+="\n視聴権・購入状況・チャンネル会員資格を確認してください。";
  NicoliveUi.dialog(UiDialogs.builder(this).setTitle("視聴条件の確認")
   .setMessage(message)
   .setPositiveButton("公式サイトで確認",(dialog,which)->openTimetableProgram(program.id))
   .setNegativeButton("閉じる",null).create());
 }

 void searchValue(String text){String value=text.trim(),id=NicoliveData.id(value);((InputMethodManager)getSystemService(INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(root.getWindowToken(),0);if(id!=null)watch(id);else{if(!query.equals(value)){recentReady=false;programs.clear();feedAdapter.notifyDataSetChanged();}query=value;feedPosition=0;feedOffset=0;if(hubTab!=0){hubTab=0;hub();}else load();}}
 void watch(String id){ExitModeOptions.clear(this);pendingPopupId="";if(!id.equals(requested))deniedProgramId="";if(!watching&&feed!=null){feedPosition=feed.getFirstVisiblePosition();feedOffset=feed.getChildCount()>0?feed.getChildAt(0).getTop():0;}browser.pauseImages();if(Build.VERSION.SDK_INT<28){Toast.makeText(this,"生放送はAndroid 9以降で利用できます",Toast.LENGTH_LONG).show();return;}boolean same=id.equals(requested);if(!same){draft="";pendingDraft="";if(input!=null)input.setText("");}requested=id;watching=true;info=false;atBottom=true;newComments=0;observedCount=0;++loadToken;viewer();Intent start=new Intent(this,NicoliveService.class).putExtra("program",id);startForegroundService(start);bind();if(service!=null&&!service.stopped){if(!id.equals(service.id)||service.terminal)service.open(id);service.returnToFrame(playerFrame);changed();}}
 void viewer(){if(playerFrame!=null&&viewerPane!=null&&playerFrame.getParent()==body){updateViewerLayout();return;}NicolivePlayerFrame old=playerFrame;if(service!=null&&old!=null)service.detach(old);base();header.setVisibility(fullscreen?View.GONE:View.VISIBLE);root.setFitsSystemWindows(!fullscreen);if(fullscreen)getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);else getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
  ImageButton back=NicoliveUi.icon(this,"back","番組一覧に戻る");header.addView(back);back.setOnClickListener(v->{if(input!=null)draft=input.getText().toString();hub();});heading=NicoliveUi.text(this,"生放送",16);header.addView(heading,new LinearLayout.LayoutParams(0,-1,1));ImageButton popup=NicoliveUi.icon(this,"popup","ポップアップ");header.addView(popup);popup.setOnClickListener(v->popup());ImageButton reconnect=NicoliveUi.icon(this,"refresh","再接続");header.addView(reconnect);reconnect.setOnClickListener(v->{if(service!=null)service.reconnect();});
  playerFrame=new NicolivePlayerFrame(this,false);int videoHeight=fullscreen?-1:Math.round(getResources().getDisplayMetrics().widthPixels/(16f/9));body.addView(playerFrame,new LinearLayout.LayoutParams(-1,videoHeight));if(service!=null){service.returnToFrame(playerFrame);}viewerPane=NicoliveUi.column(this);body.addView(viewerPane,new LinearLayout.LayoutParams(-1,0,1));
  details=NicoliveUi.column(this);details.setPadding(NicoliveUi.dp(this,12),NicoliveUi.dp(this,5),NicoliveUi.dp(this,12),NicoliveUi.dp(this,5));title=NicoliveUi.text(this,"番組情報を取得中…",15);title.setMaxLines(2);title.setEllipsize(TextUtils.TruncateAt.END);details.addView(title);owner=NicoliveUi.text(this,"",12);details.addView(owner);stats=NicoliveUi.text(this,"",11);stats.setTextColor(DynamicTheme.secondaryTextColor(stats));details.addView(stats);viewerPane.addView(details);status=NicoliveUi.text(this,"接続中…",12);status.setTextColor(NicoliveUi.accent(this));status.setPadding(NicoliveUi.dp(this,12),0,NicoliveUi.dp(this,12),0);viewerPane.addView(status,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,30)));
  tabs=NicoliveUi.row(this);for(final String name:new String[]{"コメント","番組情報"}){Button b=NicoliveUi.button(this,name);tabs.addView(b,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,40),1));b.setOnClickListener(v->{info=name.equals("番組情報");showPane();});}viewerPane.addView(tabs);
  FrameLayout content=new FrameLayout(this);viewerPane.addView(content,new LinearLayout.LayoutParams(-1,0,1));chat=new ListView(this);chat.setDivider(null);chat.setCacheColorHint(Color.TRANSPARENT);chatAdapter=new ChatAdapter();chat.setAdapter(chatAdapter);content.addView(chat,new FrameLayout.LayoutParams(-1,-1));chat.setOnScrollListener(new AbsListView.OnScrollListener(){public void onScrollStateChanged(AbsListView list,int state){if(state!=SCROLL_STATE_IDLE)atBottom=false;else{boolean nearBottom=chat.getLastVisiblePosition()>=comments.size()-2;atBottom=nearBottom;if(atBottom){newComments=0;if(latest!=null)latest.setVisibility(View.GONE);}}}public void onScroll(AbsListView v,int first,int count,int total){}});chat.setOnItemLongClickListener((parent,v,position,row)->{commentMenu(comments.get(position));return true;});
  information=NicoliveUi.text(this,"",14);information.setGravity(Gravity.TOP);information.setPadding(NicoliveUi.dp(this,12),NicoliveUi.dp(this,10),NicoliveUi.dp(this,12),0);information.setVisibility(View.GONE);ScrollView infoScroll=new ScrollView(this);infoScroll.setTag("infoScroll");infoScroll.addView(information);infoScroll.setVisibility(View.GONE);content.addView(infoScroll,new FrameLayout.LayoutParams(-1,-1));
  latest=NicoliveUi.button(this,"最新コメントへ");latest.setVisibility(View.GONE);viewerPane.addView(latest,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,40)));latest.setOnClickListener(v->{atBottom=true;newComments=0;latest.setVisibility(View.GONE);chat.setSelection(Math.max(0,comments.size()-1));});
  composer=NicoliveUi.row(this);anonymous=new CheckBox(this);anonymous.setText("匿名");anonymous.setTextSize(12);anonymous.setTextColor(DynamicTheme.textColor(anonymous));anonymous.setButtonTintList(android.content.res.ColorStateList.valueOf(NicoliveUi.accent(this)));anonymous.setChecked(PreferenceManager.getDefaultSharedPreferences(this).getBoolean("nicolive_anonymous",true));anonymous.setOnCheckedChangeListener((b,checked)->PreferenceManager.getDefaultSharedPreferences(this).edit().putBoolean("nicolive_anonymous",checked).apply());composer.addView(anonymous,new LinearLayout.LayoutParams(NicoliveUi.dp(this,70),NicoliveUi.dp(this,48)));input=NicoliveUi.input(this,"コメントを入力…");input.setText(draft);input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(150)});composer.addView(input,new LinearLayout.LayoutParams(0,NicoliveUi.dp(this,48),1));send=NicoliveUi.icon(this,"send","コメントを送信");composer.addView(send);send.setOnClickListener(v->send());viewerPane.addView(composer);login=NicoliveUi.button(this,"ログインしてコメントする");viewerPane.addView(login,new LinearLayout.LayoutParams(-1,NicoliveUi.dp(this,44)));login.setOnClickListener(v->{try{startActivity(new Intent().setClassName(this,"com.sauzask.nicoid.ModernLoginActivity"));}catch(Exception e){Toast.makeText(this,"ログイン画面を開けませんでした",Toast.LENGTH_SHORT).show();}});showPane();body.getViewTreeObserver().addOnGlobalLayoutListener(()->fitViewer());updateViewerLayout();if(service!=null)changed();
 }
 void updateViewerLayout(){if(playerFrame==null||viewerPane==null)return;
  header.setVisibility(fullscreen?View.GONE:View.VISIBLE);viewerPane.setVisibility(fullscreen?View.GONE:View.VISIBLE);root.setFitsSystemWindows(!fullscreen);
  if(fullscreen)getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);else getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  ViewGroup.LayoutParams lp=playerFrame.getLayoutParams();lp.height=fullscreen?-1:Math.round(getResources().getDisplayMetrics().widthPixels/(16f/9));playerFrame.setLayoutParams(lp);playerFrame.fullscreen(fullscreen);showPane();if(!fullscreen){fitViewer();changed();}
 }
 void fitViewer(){if(fullscreen||!watching||playerFrame==null||body.getHeight()<=0||details==null)return;boolean compact=body.getHeight()<NicoliveUi.dp(this,480);details.setVisibility(compact?View.GONE:View.VISIBLE);int fixed=0;for(View v:new View[]{details,status,tabs,composer,login,latest})if(v!=null&&v.getVisibility()!=View.GONE)fixed+=v.getHeight();int height=Math.min(Math.round(body.getWidth()/(16f/9)),Math.max(NicoliveUi.dp(this,72),body.getHeight()-fixed-NicoliveUi.dp(this,64)));ViewGroup.LayoutParams lp=playerFrame.getLayoutParams();if(lp.height!=height){lp.height=height;playerFrame.setLayoutParams(lp);}}
 void showPane(){if(chat==null)return;for(int i=0;i<tabs.getChildCount();i++)NicoliveUi.selected((Button)tabs.getChildAt(i),info?i==1:i==0);chat.setVisibility(info?View.GONE:View.VISIBLE);View scroll=root.findViewWithTag("infoScroll");if(scroll!=null)scroll.setVisibility(info?View.VISIBLE:View.GONE);information.setVisibility(info?View.VISIBLE:View.GONE);}
 @Override public void changed(){updateNowPlaying();if(service==null)return;if(service.program!=null&&!service.program.canWatch)showWatchRestriction(service.program);if(service.stopped){if(watching)hub();unbind();return;}if(!watching)return;if(!service.id.equals(requested))return;if(playerFrame!=null)playerFrame.updateControls();NicoliveData.Program p=service.program;if(p!=null){if(renderedProgram!=p){title.setText(p.title);owner.setText(p.owner);information.setText(p.title+"\n\n"+p.owner+"\n\n"+p.description);}if(renderedProgram!=p||renderedViews!=p.views||renderedComments!=p.comments){stats.setText(NicoliveUi.statistics(this,p.views,p.comments));stats.setContentDescription("来場 "+p.views+"、コメント "+p.comments);renderedViews=p.views;renderedComments=p.comments;}renderedProgram=p;}else if(renderedProgram!=null){renderedProgram=null;title.setText("");owner.setText("");information.setText("");stats.setText("");stats.setContentDescription(null);}String statusText=service.status+(!service.commentsConnected&&service.playing()?" / コメント未接続":"");if(!statusText.contentEquals(status.getText()))status.setText(statusText);
  boolean canPost=p!=null&&p.loggedIn&&p.onAir()&&!service.terminal;composer.setVisibility(canPost?View.VISIBLE:View.GONE);login.setVisibility(p!=null&&!p.loggedIn&&!service.terminal?View.VISIBLE:View.GONE);input.setEnabled(canPost);send.setEnabled(canPost&&service.session!=null&&!service.session.posting);
  if(observedCount==service.deliveredCount&&comments.size()==service.history.size())return;int first=chat.getFirstVisiblePosition(),top=chat.getChildCount()>0?chat.getChildAt(0).getTop():0;NicoliveData.Chat anchor=first>=0&&first<comments.size()?comments.get(first):null;comments.clear();comments.addAll(service.history);chatAdapter.notifyDataSetChanged();if(atBottom)chat.setSelection(Math.max(0,comments.size()-1));else{int position=anchor==null?-1:comments.indexOf(anchor);if(position>=0)chat.setSelectionFromTop(position,top);int delta=(int)Math.max(0,Math.min(9999,service.deliveredCount-observedCount));newComments=Math.min(9999,newComments+delta);if(newComments>0){latest.setText("新着 "+newComments+"件 / 最新コメントへ");latest.setVisibility(View.VISIBLE);}}observedCount=service.deliveredCount;
 }
 void send(){String text=input.getText().toString();if(text.codePointCount(0,text.length())>75){Toast.makeText(this,"コメントは75文字以内で入力してください",Toast.LENGTH_SHORT).show();return;}if(service!=null&&service.send(text,anonymous.isChecked())){pendingDraft=text;send.setEnabled(false);}else Toast.makeText(this,"現在は投稿できません。再生・接続状態を確認してください",Toast.LENGTH_SHORT).show();}
 @Override public void posted(boolean success,String message){if(success){if(input!=null&&pendingDraft.equals(input.getText().toString()))input.setText("");draft="";pendingDraft="";}else Toast.makeText(this,message,Toast.LENGTH_LONG).show();changed();}
 void commentMenu(final NicoliveData.Chat c){AlertDialog d=UiDialogs.builder(this).setTitle("コメント").setItems(new String[]{"本文をコピー","このユーザーをNGに登録","この本文をNGワードに登録"},(dialog,which)->{if(which==0){((android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("コメント",c.text));}else if(service!=null){if(which==1)service.ng.addUser(c.user);else service.ng.addWord(c.text);service.history.removeIf(item->service.ng.blocked(item));playerFrame.comments.clear();changed();}}).create();NicoliveUi.dialog(d);}
 void popup(){if(service==null)return;if(!android.provider.Settings.canDrawOverlays(this)){startActivity(new Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,Uri.parse("package:"+getPackageName())));Toast.makeText(this,"許可後にポップアップボタンを押してください",Toast.LENGTH_LONG).show();return;}service.showPopup();if(service.popup!=null){if(input!=null)draft=input.getText().toString();hub();}}
 void toggleFullscreen(){fullscreen=!fullscreen;setRequestedOrientation(fullscreen?ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE:ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);if(input!=null)draft=input.getText().toString();updateViewerLayout();}
 void playerSettings(){if(service==null)return;final ArrayList<String> choices=new ArrayList<String>(service.qualities);ArrayList<String> labels=new ArrayList<String>();for(String q:choices)labels.add((q.equals(service.selected)?"✓  ":"　 ")+NicoliveData.qualityLabel(q));labels.add("再接続");labels.add("ポップアップ");labels.add("生放送のNG設定");AlertDialog d=UiDialogs.builder(this).setTitle("画質と設定").setItems(labels.toArray(new String[0]),(dialog,which)->{if(service==null)return;int count=choices.size();if(which<count)service.selectQuality(choices.get(which));else if(which==count)service.reconnect();else if(which==count+1)popup();else ngSettings();}).create();NicoliveUi.dialog(d);}
 void ngSettings(){if(service==null)return;final Set<String> users=new HashSet<String>(service.ng.prefs.getStringSet("nicolive_ng_users",Collections.<String>emptySet())),words=new HashSet<String>(service.ng.prefs.getStringSet("nicolive_ng_words",Collections.<String>emptySet()));final ArrayList<String> keys=new ArrayList<String>(),types=new ArrayList<String>();for(String s:users){keys.add(s);types.add("ユーザー: "+s);}for(String s:words){keys.add(s);types.add("ワード: "+s);}final boolean[] remove=new boolean[keys.size()];AlertDialog d=UiDialogs.builder(this).setTitle("生放送のNG設定").setMultiChoiceItems(types.toArray(new String[0]),remove,(dialog,which,checked)->remove[which]=checked).setPositiveButton("選択を削除",(dialog,which)->{for(int i=0;i<keys.size();i++)if(remove[i]){if(types.get(i).startsWith("ユーザー: "))users.remove(keys.get(i));else words.remove(keys.get(i));}if(service==null)return;service.ng.prefs.edit().putStringSet("nicolive_ng_users",users).putStringSet("nicolive_ng_words",words).apply();service.ng.reload();}).setNegativeButton("閉じる",null).create();NicoliveUi.dialog(d);}
 @Override public void onBackPressed(){if(fullscreen){toggleFullscreen();return;}if(watching){if(input!=null)draft=input.getText().toString();hub();return;}exitHub();}
 String programLabel(NicoliveData.Program p){String type=p.provider.equals("official")?"公式":p.provider.equals("channel")?"CH":p.provider.equals("user")||p.provider.equals("community")?"ユーザー":"生放送";if(hubTab==2)return "視聴履歴 / "+type;if(hubTab==TIMETABLE&&!timetableOnAir&&p.begin>0){String time=TIMETABLE_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));String state=p.onAir()?"放送中":p.ended()?"放送終了":"放送予定";return type+" / "+time+" / "+state;}if(!p.onAir()){String state=p.ended()?"放送終了":"放送予定";if(p.begin>0)state+=" / "+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN));return type+" / "+state;}if(p.begin>0&&prefs().getBoolean(START_TIME,false))return type+" / "+PROGRAM_TIME.format(Instant.ofEpochSecond(p.begin).atZone(NicoliveCatalog.JAPAN))+" 開始";long minutes=p.begin>0?Math.max(0,(System.currentTimeMillis()/1000-p.begin)/60):-1;return type+" / "+(minutes<0?"放送中":minutes<60?minutes+"分経過":minutes/60+"時間"+minutes%60+"分経過");}
 final class FeedAdapter extends BaseAdapter {
  final ArrayList<NicoliveData.Program> visible=new ArrayList<NicoliveData.Program>();
  FeedAdapter(){filter();}
  void filter(){visible.clear();for(NicoliveData.Program p:programs)if(hubTab!=0||category==0||category==1&&(p.provider.equals("community")||p.provider.equals("user"))||category==2&&p.provider.equals("official")||category==3&&p.provider.equals("channel"))visible.add(p);if(hubTab==0||hubTab==TIMETABLE)visible.sort(activeSort().comparator);}
  @Override public void notifyDataSetChanged(){filter();super.notifyDataSetChanged();}
  public int getCount(){return visible.size();}public Object getItem(int p){return visible.get(p);}public long getItemId(int p){return p;}
  public View getView(int pos,View convert,ViewGroup parent){NicoliveData.Program p=(NicoliveData.Program)getItem(pos);LinearLayout row=convert instanceof LinearLayout?(LinearLayout)convert:NicoliveUi.row(NicoliveActivity.this);
   if(row.getChildCount()==0){row.setPadding(NicoliveUi.dp(NicoliveActivity.this,8),NicoliveUi.dp(NicoliveActivity.this,2),NicoliveUi.dp(NicoliveActivity.this,8),NicoliveUi.dp(NicoliveActivity.this,2));row.setMinimumHeight(NicoliveUi.dp(NicoliveActivity.this,88));FrameLayout artwork=new FrameLayout(NicoliveActivity.this);
   // The shared preference is applied on each row bind, including recycled views.
   artwork.setBackground(NicoliveUi.panel(NicoliveActivity.this,4));
   ImageView image=new ImageView(NicoliveActivity.this);
   image.setScaleType(ImageView.ScaleType.CENTER_CROP);
   artwork.addView(image,new FrameLayout.LayoutParams(-1,-1));
   TextView badge=NicoliveUi.text(NicoliveActivity.this,"",10);
   badge.setTextColor(Color.WHITE);
   badge.setTypeface(android.graphics.Typeface.DEFAULT,android.graphics.Typeface.BOLD);
   int space=NicoliveUi.dp(NicoliveActivity.this,4);
   badge.setPadding(space,0,space,0);
   FrameLayout.LayoutParams badgeLayout=new FrameLayout.LayoutParams(-2,NicoliveUi.dp(NicoliveActivity.this,17),Gravity.TOP|Gravity.LEFT);
   badgeLayout.setMargins(space,space,0,0);
   artwork.addView(badge,badgeLayout);
   TextView entitlement=NicoliveUi.text(NicoliveActivity.this,"",10);
   entitlement.setTextColor(Color.WHITE);
   entitlement.setTypeface(android.graphics.Typeface.DEFAULT,android.graphics.Typeface.BOLD);
   entitlement.setPadding(space,0,space,0);
   FrameLayout.LayoutParams entitlementLayout=new FrameLayout.LayoutParams(-2,NicoliveUi.dp(NicoliveActivity.this,17),Gravity.TOP|Gravity.LEFT);
   entitlementLayout.setMargins(space,space,0,0);
   artwork.addView(entitlement,entitlementLayout);
   int thumb=Math.max(NicoliveUi.dp(NicoliveActivity.this,112),Math.min(NicoliveUi.dp(NicoliveActivity.this,160),Math.round(getResources().getDisplayMetrics().widthPixels*.36f)));
   row.addView(artwork,new LinearLayout.LayoutParams(thumb,Math.round(thumb/(16f/9))));
   LinearLayout copy=NicoliveUi.column(NicoliveActivity.this);copy.setPadding(NicoliveUi.dp(NicoliveActivity.this,8),0,0,0);TextView kind=NicoliveUi.text(NicoliveActivity.this,"",11);kind.setTextColor(DynamicTheme.secondaryTextColor(kind));copy.addView(kind);TextView text=NicoliveUi.text(NicoliveActivity.this,"",14);text.setMaxLines(2);text.setEllipsize(TextUtils.TruncateAt.END);copy.addView(text);TextView byline=NicoliveUi.text(NicoliveActivity.this,"",12);byline.setSingleLine(true);byline.setEllipsize(TextUtils.TruncateAt.END);byline.setTextColor(DynamicTheme.secondaryTextColor(byline));copy.addView(byline);TextView meta=NicoliveUi.text(NicoliveActivity.this,"",11);meta.setTextColor(DynamicTheme.secondaryTextColor(meta));copy.addView(meta);row.addView(copy,new LinearLayout.LayoutParams(0,-2,1));}
   FrameLayout artwork=(FrameLayout)row.getChildAt(0);
   ThumbnailCorners.applyFrame(artwork);
   ImageView thumbnail=(ImageView)artwork.getChildAt(0);
   TextView badge=(TextView)artwork.getChildAt(1);
   boolean live=p.onAir(),scheduled=p.scheduled();
   badge.setVisibility(live||scheduled?View.VISIBLE:View.GONE);
   if(live||scheduled){
    badge.setText(live?"LIVE":"放送予定");
    android.graphics.drawable.GradientDrawable chip=new android.graphics.drawable.GradientDrawable();
    chip.setCornerRadius(NicoliveUi.dp(NicoliveActivity.this,3));
    chip.setColor(live?0xffbf2537:0xff21669a);
    badge.setBackground(chip);
   }
   TextView entitlement=(TextView)artwork.getChildAt(2);
   String access=p.accessLabel();
   entitlement.setVisibility(access.isEmpty()?View.GONE:View.VISIBLE);
   if(!access.isEmpty()){
    entitlement.setText(access);
    android.graphics.drawable.GradientDrawable tag=new android.graphics.drawable.GradientDrawable();
    tag.setCornerRadius(NicoliveUi.dp(NicoliveActivity.this,3));
    tag.setColor(0xd9252525);
    entitlement.setBackground(tag);
    FrameLayout.LayoutParams tagLayout=(FrameLayout.LayoutParams)entitlement.getLayoutParams();
    int accessLabelOffset=live||scheduled?25:4;
    tagLayout.topMargin=NicoliveUi.dp(NicoliveActivity.this,accessLabelOffset);
    entitlement.setLayoutParams(tagLayout);
   }
   if(hubTab==2)browser.historyImage(p,thumbnail);else browser.image(p.thumbnail,thumbnail);
   LinearLayout copy=(LinearLayout)row.getChildAt(1);((TextView)copy.getChildAt(0)).setText(hubTab==RANKING?(pos+1)+"位 / "+programLabel(p):programLabel(p));((TextView)copy.getChildAt(1)).setText(p.title);((TextView)copy.getChildAt(2)).setText(p.owner);TextView stats=(TextView)copy.getChildAt(3);
   if(scheduled){
    stats.setText(p.reservations<0?"":String.format(Locale.JAPAN,"タイムシフト予約 %,d",p.reservations));
    stats.setContentDescription(null);
   }else{
    stats.setText(NicoliveUi.statistics(NicoliveActivity.this,p.views,p.comments));
    stats.setContentDescription("来場 "+p.views+"、コメント "+p.comments);
   }
   return row;}
 }
 final class ChatAdapter extends BaseAdapter {public int getCount(){return comments.size();}public Object getItem(int p){return comments.get(p);}public long getItemId(int p){return p;}public View getView(int pos,View convert,ViewGroup parent){NicoliveData.Chat c=comments.get(pos);LinearLayout row=convert instanceof LinearLayout?(LinearLayout)convert:NicoliveUi.row(NicoliveActivity.this);if(row.getChildCount()==0){row.setPadding(NicoliveUi.dp(NicoliveActivity.this,12),NicoliveUi.dp(NicoliveActivity.this,5),NicoliveUi.dp(NicoliveActivity.this,12),NicoliveUi.dp(NicoliveActivity.this,5));TextView text=NicoliveUi.text(NicoliveActivity.this,"",13);row.addView(text,new LinearLayout.LayoutParams(0,-2,1));TextView time=NicoliveUi.text(NicoliveActivity.this,"",11);time.setTextColor(DynamicTheme.secondaryTextColor(time));row.addView(time);}((TextView)row.getChildAt(0)).setText(c.text);((TextView)row.getChildAt(1)).setText(NicoliveUi.time(c.vpos/100));return row;}}
}
