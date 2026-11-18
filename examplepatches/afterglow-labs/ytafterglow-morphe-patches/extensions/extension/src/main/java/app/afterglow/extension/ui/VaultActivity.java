package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.DownloadLibrary;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.DownloadRequest;
import app.afterglow.extension.downloads.LibraryItem;
import app.afterglow.extension.settings.AfterglowPrefs;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Full Afterglow Vault: summary, durable queue, library rails, imports, and repair. */
public final class VaultActivity extends Activity implements DownloadManager.Listener {
    private static final int IMPORT_FILES=0x7a71,IMPORT_GALLERY=0x7a72;
    private DownloadManager manager;
    private DownloadLibrary library;
    private VaultViews views;
    private final VaultQuery query=new VaultQuery();
    private List<LibraryItem> items=new ArrayList<>();
    private LinearLayout summarySlot,queueSlot,librarySlot,storageSlot,controls;
    private EditText search;
    private boolean repairing,allQueue,refreshingMetadata,initialActionsStarted;
    private int importing;
    private String operationMessage="";
    private SharedPreferences uiPrefs;
    private boolean renderedLoaded,renderedWritable;
    private String renderedRecovery="";
    private final Map<String,QueueRow> queueRows=new LinkedHashMap<>();
    private LinearLayout queueContainer;
    private TextView queueEmpty,queueMore;
    private String queueStructure="",renderedQueueState="";
    private boolean started,refreshPending;
    private long lastRefresh;
    private final Runnable refreshTask=()->{refreshPending=false;if(started&&DownloadsUi.alive(this))refresh();};

    @Override protected void onCreate(Bundle state){
        super.onCreate(state);requestWindowFeature(Window.FEATURE_NO_TITLE);
        manager=DownloadManager.get(this);library=manager.library();uiPrefs=getSharedPreferences("afterglow_vault_ui",MODE_PRIVATE);
        query.sort=bounded(uiPrefs.getInt("sort",0),VaultQuery.SORTS.length);query.group=bounded(uiPrefs.getInt("group",1),VaultQuery.GROUPS.length);
        if(state!=null){query.search=state.getString("search","");query.videos=state.getBoolean("videos");query.audio=state.getBoolean("audio");query.favorites=state.getBoolean("favorites");query.missing=state.getBoolean("missing");query.recent=state.getBoolean("recent");query.channel=state.getString("channel","");query.collection=state.getString("collection","");query.quality=state.getString("quality","");}
        buildFrame();refresh();
    }
    @Override protected void onStart(){super.onStart();started=true;manager.addListener(this);refresh();}
    @Override protected void onStop(){started=false;VaultViews.MAIN.removeCallbacks(refreshTask);refreshPending=false;manager.removeListener(this);super.onStop();}
    @Override public void onConfigurationChanged(Configuration config){super.onConfigurationChanged(config);buildFrame();refresh();}
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);state.putString("search",query.search);state.putBoolean("videos",query.videos);state.putBoolean("audio",query.audio);state.putBoolean("favorites",query.favorites);state.putBoolean("missing",query.missing);state.putBoolean("recent",query.recent);state.putString("channel",query.channel);state.putString("collection",query.collection);state.putString("quality",query.quality);}
    @Override public void onDownloadsChanged(){VaultViews.MAIN.post(this::scheduleRefresh);}
    private void scheduleRefresh(){
        if(!started||!DownloadsUi.alive(this))return;
        boolean changed=library.snapshot()!=items||renderedLoaded!=manager.isLoaded()||renderedWritable!=library.isWritable()
                ||!renderedRecovery.equals(manager.recoveryMessage())||!renderedQueueState.equals(queueState(manager.snapshot()));
        if(refreshPending&&!changed)return;
        VaultViews.MAIN.removeCallbacks(refreshTask);refreshPending=true;
        VaultViews.MAIN.postDelayed(refreshTask,changed?0:Math.max(0,1250-(android.os.SystemClock.elapsedRealtime()-lastRefresh)));
    }
    private static String queueState(List<DownloadJob> jobs){StringBuilder key=new StringBuilder();for(DownloadJob job:jobs)key.append(job.id).append(':').append(job.state).append(':').append(job.phase).append(':').append(job.errorMessage).append('|');return key.toString();}
    private static int bounded(int value,int length){return Math.max(0,Math.min(length-1,value));}
    private void buildFrame(){
        queueRows.clear();queueContainer=null;queueStructure="";renderedQueueState="";
        views=new VaultViews(this);LinearLayout root=views.column();root.setBackground(views.palette.gradient==null?new android.graphics.drawable.ColorDrawable(views.background):views.palette.pageBackground());root.setFitsSystemWindows(true);
        LinearLayout bar=views.row();views.pad(bar,12,3,12,3);bar.setMinimumHeight(views.dp(54));
        TextView done=views.button("Done",this::finish);bar.addView(done,new LinearLayout.LayoutParams(views.dp(58),-2));
        TextView title=views.label("Afterglow Vault",17,true);title.setGravity(Gravity.CENTER);bar.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        TextView add=views.button("+",this::importMenu);add.setTextSize(25);add.setContentDescription("Import Media");bar.addView(add,new LinearLayout.LayoutParams(views.dp(48),-2));root.addView(bar);
        ScrollView scroll=new ScrollView(this);scroll.setFillViewport(true);LinearLayout body=views.column();views.pad(body,14,8,14,24);scroll.addView(body);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        summarySlot=views.column();body.addView(summarySlot);
        body.addView(views.heading("Queue","Active and pending downloads"));queueSlot=views.column();body.addView(queueSlot);
        body.addView(views.heading("Library","Search, combine filters, sort, and group"));
        search=new EditText(this);search.setSingleLine(true);search.setTextSize(14);search.setTextColor(views.text);search.setHintTextColor(views.secondary);search.setHint("Search Vault");search.setBackground(views.rounded(views.palette.searchFieldFill,10));views.pad(search,12,9,12,9);search.setText(query.search);
        search.setInputType(InputType.TYPE_CLASS_TEXT);search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);search.setContentDescription("Search Vault");body.addView(search,new LinearLayout.LayoutParams(-1,views.dp(44)));
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int count,int after){}public void onTextChanged(CharSequence s,int start,int before,int count){query.search=s.toString();renderLibrary();}public void afterTextChanged(Editable e){}});
        search.setOnEditorActionListener((v,id,event)->{search.clearFocus();((android.view.inputmethod.InputMethodManager)getSystemService(INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(search.getWindowToken(),0);return true;});
        views.gap(body,8);controls=views.column();body.addView(controls);views.gap(body,12);librarySlot=views.column();body.addView(librarySlot);
        body.addView(views.heading("Storage & Repair","Space, missing files, and recovered media"));storageSlot=views.column();body.addView(storageSlot);
        setContentView(root);getWindow().setStatusBarColor(views.background);getWindow().setNavigationBarColor(views.background);
        if(android.os.Build.VERSION.SDK_INT>=30&&getWindow().getInsetsController()!=null)getWindow().getInsetsController().setSystemBarsAppearance(views.palette.dark?0:android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS|android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS,android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS|android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
    }
    private void refresh(){
        VaultViews.MAIN.removeCallbacks(refreshTask);refreshPending=false;lastRefresh=android.os.SystemClock.elapsedRealtime();
        List<LibraryItem> latest=library.snapshot();boolean changed=latest!=items||librarySlot.getChildCount()==0||renderedLoaded!=manager.isLoaded()||renderedWritable!=library.isWritable()||!renderedRecovery.equals(manager.recoveryMessage());items=latest;
        renderedLoaded=manager.isLoaded();renderedWritable=library.isWritable();renderedRecovery=manager.recoveryMessage();
        renderQueue();
        // Queue byte updates must not rebuild library rails, reset their scroll, or restart artwork.
        if(changed){renderSummary();renderControls();renderLibrary();renderStorage();}
        if(manager.isLoaded()&&!initialActionsStarted){
            initialActionsStarted=true;manager.resumePending();
            if(library.isWritable()){scan(false);if(AfterglowPrefs.getBool("downloadRefreshMetadata"))refreshMetadata(false);}
        }
    }
    private void renderSummary(){
        summarySlot.removeAllViews();long bytes=0;int favorite=0,video=0,audio=0,missing=0;for(LibraryItem i:items){bytes+=Math.max(0,i.fileSize);if(i.favorite)favorite++;if(i.kind==DownloadRequest.Kind.VIDEO)video++;if(i.audioOnly)audio++;if(i.isMissing())missing++;}
        LinearLayout card=views.card(14);card.addView(views.label("Afterglow Vault",20,true));TextView description=views.text(VaultViews.bytes(bytes)+" stored · "+favorite+" favorite"+(favorite==1?"":"s")+" · downloads, imports, and collections.",12,views.secondary,false);views.pad(description,0,3,0,0);card.addView(description);views.gap(card,12);
        LinearLayout metrics=views.row();String[] names={"Media","Videos","Audio","Missing"};int[] counts={items.size(),video,audio,missing};for(int n=0;n<4;n++){LinearLayout pill=views.column();pill.setGravity(Gravity.CENTER);pill.setBackground(views.rounded(views.muted,7));TextView count=views.text(String.valueOf(counts[n]),13,n==3&&counts[n]>0?0xffe05252:views.text,true);pill.addView(count);pill.addView(views.text(names[n],9,views.secondary,true));LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,views.dp(38),1);if(n>0)lp.leftMargin=views.dp(8);metrics.addView(pill,lp);}card.addView(metrics);summarySlot.addView(card);
        String recovery=library.recoveryMessage();if(recovery!=null&&!recovery.isEmpty()){views.gap(summarySlot,8);LinearLayout notice=views.card(12);notice.addView(views.label(library.isWritable()?"Vault Recovered":"Vault Index Error",14,true));notice.addView(views.text(recovery,12,views.secondary,false));summarySlot.addView(notice);}
        if(manager.isLoaded()&&!manager.recoveryMessage().isEmpty()){views.gap(summarySlot,8);summarySlot.addView(views.text(manager.recoveryMessage(),12,views.secondary,false));}
        if(!operationMessage.isEmpty()||importing>0){views.gap(summarySlot,8);summarySlot.addView(views.text(importing>0?"Importing "+importing+" file"+(importing==1?"":"s")+"…":operationMessage,12,views.secondary,false));}
    }
    private void renderQueue(){
        List<DownloadJob> snapshot=manager.snapshot();renderedQueueState=queueState(snapshot);
        List<DownloadJob> visible=new ArrayList<>();for(DownloadJob job:snapshot)if(job.state!=DownloadJob.State.SUCCEEDED&&job.state!=DownloadJob.State.CANCELLED)visible.add(job);
        if(queueContainer==null){
            queueContainer=views.card(10);queueSlot.addView(queueContainer);
            queueEmpty=views.text("Queue is clear. New downloads appear here with pause, resume, retry, and cancel controls.",12,views.secondary,false);
            queueMore=views.button("",()->{allQueue=!allQueue;renderQueue();});
        }
        int limit=allQueue?visible.size():Math.min(6,visible.size());StringBuilder structure=new StringBuilder(allQueue?"all|":"six|");
        Set<String> ids=new LinkedHashSet<>();for(int n=0;n<limit;n++){DownloadJob job=visible.get(n);ids.add(job.id);structure.append(job.id).append('|');QueueRow row=queueRows.get(job.id);if(row==null){row=new QueueRow(job.id);queueRows.put(job.id,row);}row.update(job);}
        queueRows.keySet().retainAll(ids);structure.append(visible.size()>6);
        if(!queueStructure.equals(structure.toString())){
            queueStructure=structure.toString();queueContainer.removeAllViews();
            if(visible.isEmpty())queueContainer.addView(queueEmpty);
            for(int n=0;n<limit;n++){queueContainer.addView(queueRows.get(visible.get(n).id).root);if(n<limit-1)views.gap(queueContainer,7);}
            if(visible.size()>6)queueContainer.addView(queueMore);
        }
        updateText(queueMore,allQueue?"Show Less":"+ "+(visible.size()-6)+" more queued");
    }
    private static void updateText(TextView view,String text){if(!text.contentEquals(view.getText()))view.setText(text);}
    private final class QueueRow {
        final String id;final LinearLayout root=views.column(),actions=views.row();final TextView title,phase;final ProgressBar progress;
        DownloadJob.State state;
        QueueRow(String id){
            this.id=id;views.pad(root,10,9,10,9);root.setBackground(views.rounded(views.muted,7));
            title=views.label("",13,true);title.setMaxLines(1);title.setEllipsize(TextUtils.TruncateAt.END);root.addView(title);
            phase=views.text("",11,views.secondary,false);root.addView(phase);
            progress=new ProgressBar(VaultActivity.this,null,android.R.attr.progressBarStyleHorizontal);progress.setMax(1000);progress.setProgressTintList(ColorStateList.valueOf(views.accent));root.addView(progress,new LinearLayout.LayoutParams(-1,views.dp(5)));root.addView(actions);
        }
        void update(DownloadJob job){
            updateText(title,VaultViews.value(job.request.title,job.request.videoId));updateText(phase,DownloadProgressSheet.phaseText(job));
            int value=Math.max(0,(int)(job.progress*1000));boolean indeterminate=job.state==DownloadJob.State.RUNNING&&job.progress<0;
            if(progress.getProgress()!=value)progress.setProgress(value);if(progress.isIndeterminate()!=indeterminate)progress.setIndeterminate(indeterminate);
            if(state==job.state)return;state=job.state;phase.setTextColor(state==DownloadJob.State.FAILED?0xffe05252:views.secondary);actions.removeAllViews();
            if(state==DownloadJob.State.QUEUED||state==DownloadJob.State.RUNNING)queueButton(actions,"Pause",()->manager.pause(id));
            if(state==DownloadJob.State.PAUSED)queueButton(actions,"Resume",()->manager.resume(id));
            if(state==DownloadJob.State.FAILED)queueButton(actions,"Retry",()->manager.retry(id));
            if(!job.isTerminal())queueButton(actions,"Cancel",()->manager.cancel(id));
            TextView details=views.button(state==DownloadJob.State.WAITING_FOR_DELIVERY?"Finish":"Details",()->DownloadsUi.openProgress(VaultActivity.this,id));actions.addView(details,new LinearLayout.LayoutParams(0,views.dp(40),1));
        }
    }
    private void queueButton(LinearLayout row,String label,DownloadsUi.Task action){TextView button=views.button(label,()->DownloadsUi.run(this,action));LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,views.dp(40),1);lp.rightMargin=views.dp(7);row.addView(button,lp);}
    private void renderControls(){controls.removeAllViews();LinearLayout first=views.row();control(first,"Import",this::importMenu);control(first,query.filterCount()>0?"Filters ("+query.filterCount()+")":"Filters",this::filterMenu);controls.addView(first);views.gap(controls,7);LinearLayout second=views.row();control(second,"Sort: "+VaultQuery.SORTS[query.sort],()->modeMenu(false));control(second,"Group: "+VaultQuery.GROUPS[query.group],()->modeMenu(true));controls.addView(second);}
    private void control(LinearLayout row,String label,Runnable action){LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,views.dp(40),1);if(row.getChildCount()>0)lp.leftMargin=views.dp(7);row.addView(views.button(label,action),lp);}
    private void renderLibrary(){
        if(librarySlot==null)return;librarySlot.removeAllViews();Map<String,List<LibraryItem>> sections=query.sections(items,System.currentTimeMillis());
        if(sections.isEmpty()){LinearLayout empty=views.card(22);TextView title=views.label(!manager.isLoaded()?"Loading Vault…":!library.isWritable()?"Vault could not be loaded":query.constrained()?"No matches in Vault":"No media in Vault yet",17,true);title.setGravity(Gravity.CENTER);empty.addView(title);views.gap(empty,7);TextView detail=views.text(!manager.isLoaded()?"Loading your saved media.":!library.isWritable()?"Your media was kept. Check free storage and reopen Vault.":query.constrained()?"Try clearing a filter or searching another title, channel, collection, quality, or format.":"Downloads and imported media will appear here with thumbnails and collections.",13,views.secondary,false);detail.setGravity(Gravity.CENTER);empty.addView(detail);librarySlot.addView(empty);return;}
        for(Map.Entry<String,List<LibraryItem>> section:sections.entrySet()){
            TextView title=views.label(section.getKey()+"  "+section.getValue().size(),13,true);views.pad(title,0,0,0,8);librarySlot.addView(title);
            HorizontalScrollView rail=new HorizontalScrollView(this);rail.setHorizontalScrollBarEnabled(false);rail.setClipToPadding(false);LinearLayout cards=views.row();cards.setGravity(Gravity.TOP);rail.addView(cards);
            int width=Math.max(views.dp(210),Math.min(views.dp(320),(int)(getResources().getDisplayMetrics().widthPixels*0.72f)));
            for(LibraryItem item:section.getValue()){View card=mediaCard(item,width);LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(width,-2);if(cards.getChildCount()>0)lp.leftMargin=views.dp(12);cards.addView(card,lp);}
            librarySlot.addView(rail);views.gap(librarySlot,18);
        }
    }
    private View mediaCard(LibraryItem item,int width){
        LinearLayout card=views.column();card.setBackground(views.clickable(views.surface,8));card.setClipToOutline(true);card.setElevation(views.dp(2));
        FrameLayout imageFrame=new FrameLayout(this);imageFrame.setBackgroundColor(views.muted);int height=Math.max(views.dp(118),Math.min(views.dp(180),width*9/16));
        ImageView icon=new ImageView(this);icon.setImageDrawable(new VaultViews.Icon(item.audioOnly?"audio":item.kind==DownloadRequest.Kind.CAPTIONS?"captions":item.kind==DownloadRequest.Kind.THUMBNAIL?"thumbnail":"play",views.secondary));FrameLayout.LayoutParams iconLp=new FrameLayout.LayoutParams(views.dp(38),views.dp(38),Gravity.CENTER);imageFrame.addView(icon,iconLp);
        ImageView thumbnail=new ImageView(this);imageFrame.addView(thumbnail,new FrameLayout.LayoutParams(-1,-1));views.thumbnail(thumbnail,item.thumbnailUrl);
        TextView badge=views.pill((item.favorite?"★ ":"")+VaultQuery.media(item.kind).toUpperCase(java.util.Locale.ROOT));FrameLayout.LayoutParams badgeLp=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.START);badgeLp.leftMargin=views.dp(8);badgeLp.topMargin=views.dp(8);imageFrame.addView(badge,badgeLp);
        if(item.durationMs>0){TextView duration=views.pill(VaultViews.duration(item.durationMs));FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(-2,-2,Gravity.BOTTOM|Gravity.END);lp.rightMargin=views.dp(8);lp.bottomMargin=views.dp(8);imageFrame.addView(duration,lp);}
        card.addView(imageFrame,new LinearLayout.LayoutParams(-1,height));LinearLayout description=views.column();views.pad(description,10,8,10,8);TextView title=views.label(VaultViews.value(item.title,"Untitled"),13.6f,true);title.setLines(2);title.setEllipsize(TextUtils.TruncateAt.END);description.addView(title);views.gap(description,5);TextView meta=views.text(metadata(item),10.6f,views.secondary,false);meta.setLines(2);meta.setEllipsize(TextUtils.TruncateAt.END);description.addView(meta);card.addView(description);
        card.setContentDescription(item.title+", "+metadata(item));card.setOnClickListener(v->DownloadsUi.openItem(this,item));card.setOnLongClickListener(v->{itemActions(item);return true;});
        card.setAccessibilityDelegate(new View.AccessibilityDelegate(){@Override public void onInitializeAccessibilityNodeInfo(View host,android.view.accessibility.AccessibilityNodeInfo info){super.onInitializeAccessibilityNodeInfo(host,info);info.setHintText("Long press for actions");}});
        return card;
    }
    private static String metadata(LibraryItem item){List<String> parts=new ArrayList<>();if(item.isMissing())parts.add("Missing file");if(!item.collectionName.isEmpty())parts.add(item.collectionName);else if(!item.channelName.isEmpty())parts.add(item.channelName);if(!item.sourceQuality.isEmpty())parts.add(item.sourceQuality);else if(!item.formatSummary.isEmpty())parts.add(item.formatSummary);if(item.fileSize>0)parts.add(VaultViews.bytes(item.fileSize));return parts.isEmpty()?VaultQuery.media(item.kind):TextUtils.join(" · ",parts);}
    private void renderStorage(){
        storageSlot.removeAllViews();long used=0;int missing=0;for(LibraryItem i:items){used+=Math.max(0,i.fileSize);if(i.isMissing())missing++;}long available=getFilesDir().getUsableSpace();
        LinearLayout card=views.card(12);card.addView(views.text(VaultViews.bytes(used)+" used · "+VaultViews.bytes(available)+" available · "+missing+" missing",12.5f,available<1024L*1024*1024?0xffcf791f:views.text,true));views.gap(card,5);card.addView(views.text(available<1024L*1024*1024?"Storage is low. Remove unwanted media or move files before starting large downloads.":"Repair marks missing entries, restores unindexed media in the Vault folder, and refreshes file sizes.",11,views.secondary,false));views.gap(card,10);TextView repair=views.button(repairing?"Repairing…":"Scan & Repair",()->scan(true));repair.setEnabled(!repairing);card.addView(repair);TextView metadata=views.button(refreshingMetadata?"Refreshing…":"Refresh Metadata",()->refreshMetadata(true));metadata.setEnabled(!refreshingMetadata);card.addView(metadata);storageSlot.addView(card);
    }
    private void scan(boolean report){if(repairing)return;repairing=true;if(storageSlot!=null)renderStorage();library.reconcile((result,error)->{repairing=false;if(!DownloadsUi.alive(this))return;if(error!=null&&!error.isEmpty())DownloadsUi.alert(this,"Scan & Repair",error);else if(report)operationMessage="Scan complete. Vault files and metadata are up to date.";refresh();renderSummary();renderStorage();});}
    private void refreshMetadata(boolean report){if(refreshingMetadata)return;refreshingMetadata=true;if(storageSlot!=null)renderStorage();library.refreshMetadata((result,error)->{refreshingMetadata=false;if(!DownloadsUi.alive(this))return;if(error!=null&&!error.isEmpty()){if(report)DownloadsUi.alert(this,"Refresh Metadata",error);}else if(report)operationMessage="Missing metadata refreshed. Saved titles are unchanged.";refresh();renderSummary();renderStorage();});}
    private void modeMenu(boolean grouping){String[] options=grouping?VaultQuery.GROUPS:VaultQuery.SORTS;int selected=grouping?query.group:query.sort;new AlertDialog.Builder(this).setTitle(grouping?"Group Library":"Sort Library").setSingleChoiceItems(options,selected,(dialog,index)->{if(grouping)query.group=index;else query.sort=index;uiPrefs.edit().putInt("group",query.group).putInt("sort",query.sort).apply();dialog.dismiss();renderControls();renderLibrary();}).setNegativeButton("Cancel",null).show();}
    private void filterMenu(){String[] titles={checked("Videos",query.videos),checked("Audio",query.audio),checked("Favorites",query.favorites),checked("Missing Files",query.missing),"Channel…","Collection…","Quality…",checked("Added in Last 30 Days",query.recent),"Clear All Filters"};new AlertDialog.Builder(this).setTitle("Filter Library").setItems(titles,(d,index)->{switch(index){case 0:query.videos=!query.videos;break;case 1:query.audio=!query.audio;break;case 2:query.favorites=!query.favorites;break;case 3:query.missing=!query.missing;break;case 4:valueFilter("Channel");return;case 5:valueFilter("Collection");return;case 6:valueFilter("Quality");return;case 7:query.recent=!query.recent;break;case 8:query.clear();break;}renderControls();renderLibrary();}).setNegativeButton("Cancel",null).show();}
    private static String checked(String title,boolean active){return(active?"✓ ":"")+title;}
    private void valueFilter(String type){Set<String> unique=new java.util.TreeSet<>(String.CASE_INSENSITIVE_ORDER);for(LibraryItem i:items){String value=type.equals("Channel")?i.channelName:type.equals("Collection")?i.collectionName:i.sourceQuality;if(!value.isEmpty())unique.add(value);}List<String> values=new ArrayList<>();values.add("All");values.addAll(unique);new AlertDialog.Builder(this).setTitle(type).setItems(values.toArray(new String[0]),(d,index)->{String value=index==0?"":values.get(index);switch(type){case "Channel":query.channel=value;break;case "Collection":query.collection=value;break;default:query.quality=value;}renderControls();renderLibrary();}).setNegativeButton("Cancel",null).show();}
    private void importMenu(){new AlertDialog.Builder(this).setTitle("Import Media").setItems(new String[]{"Import from Files","Import from Gallery"},(d,index)->chooseImport(index==1)).setNegativeButton("Cancel",null).show();}
    private void chooseImport(boolean gallery){Intent intent=new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType(gallery?"video/*":"*/*");if(!gallery)intent.putExtra(Intent.EXTRA_MIME_TYPES,new String[]{"video/*","audio/*","image/*","text/vtt","application/x-subrip","text/plain","application/octet-stream"});intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE,true);intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);try{startActivityForResult(intent,gallery?IMPORT_GALLERY:IMPORT_FILES);}catch(ActivityNotFoundException e){DownloadsUi.alert(this,"Import Media","A document picker is not available on this device.");}}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if((request!=IMPORT_FILES&&request!=IMPORT_GALLERY)||result!=RESULT_OK||data==null)return;Set<Uri> uris=new LinkedHashSet<>();ClipData clips=data.getClipData();if(clips!=null)for(int i=0;i<clips.getItemCount();i++)uris.add(clips.getItemAt(i).getUri());if(data.getData()!=null)uris.add(data.getData());importing+=uris.size();renderSummary();for(Uri uri:uris){try{getContentResolver().takePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(SecurityException ignored){}library.importMedia(uri,"","Imported",(item,error)->{try{getContentResolver().releasePersistableUriPermission(uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(SecurityException ignored){}importing=Math.max(0,importing-1);if(!DownloadsUi.alive(this))return;if(error!=null&&!error.isEmpty())DownloadsUi.alert(this,"Import Failed",error);else operationMessage="Imported into Afterglow Vault.";refresh();renderSummary();});}}
    private void itemActions(LibraryItem item){List<String> actions=new ArrayList<>(Arrays.asList("Play","Share",item.favorite?"Remove Favorite":"Add to Favorites","Details","Rename","Move to Collection",DownloadUiPolicy.exportLabel(item.kind)));if(!item.videoId.isEmpty())actions.add("Redownload");actions.add("Remove from Vault");new AlertDialog.Builder(this).setTitle(item.title).setItems(actions.toArray(new String[0]),(d,index)->{switch(actions.get(index)){case "Play":DownloadsUi.openItem(this,item);break;case "Share":DownloadsUi.shareItem(this,item);break;case "Add to Favorites":case "Remove Favorite":library.setFavorite(item.id,!item.favorite,this::mutationResult);break;case "Details":details(item);break;case "Rename":textPrompt("Rename",item.title,value->library.rename(item.id,value,this::mutationResult));break;case "Move to Collection":collections(item);break;case "Save a Copy":case "Save to Gallery":library.exportToMediaStore(item.id,(uri,error)->{if(error!=null&&!error.isEmpty())DownloadsUi.alert(this,"Save to Gallery",error);else if(DownloadsUi.alive(this))Toast.makeText(this,"Saved a copy",Toast.LENGTH_SHORT).show();});break;case "Redownload":DownloadsUi.openDownloadSheet(this,new DownloadRequest(item.videoId));break;case "Remove from Vault":remove(item);break;}}).setNegativeButton("Cancel",null).show();}
    private void mutationResult(LibraryItem item,String error){if(!DownloadsUi.alive(this))return;if(error!=null&&!error.isEmpty())DownloadsUi.alert(this,"Afterglow Vault",error);refresh();}
    private void remove(LibraryItem item){new AlertDialog.Builder(this).setTitle("Remove from Vault?").setMessage(item.title+" and its saved file will be removed.").setNegativeButton("Cancel",null).setPositiveButton("Remove",(d,w)->library.delete(item.id,true,this::mutationResult)).show();}
    private void collections(LibraryItem item){LinkedHashSet<String> values=new LinkedHashSet<>(Arrays.asList("Favorites","Watch Later","Imported","Music","Downloaded"));for(LibraryItem i:items)if(!i.collectionName.isEmpty())values.add(i.collectionName);List<String> options=new ArrayList<>(values);options.add("Custom…");options.add("Clear Collection");new AlertDialog.Builder(this).setTitle("Move to Collection").setItems(options.toArray(new String[0]),(d,index)->{String value=options.get(index);if(value.equals("Custom…"))textPrompt("Custom Collection",item.collectionName,name->library.setCollection(item.id,name,this::mutationResult));else library.setCollection(item.id,value.equals("Clear Collection")?"":value,this::mutationResult);}).setNegativeButton("Cancel",null).show();}
    private interface TextResult{void accept(String text);}
    private void textPrompt(String title,String current,TextResult result){EditText input=new EditText(this);input.setSingleLine(true);input.setText(current);LinearLayout container=views.column();views.pad(container,20,4,20,4);container.addView(input);new AlertDialog.Builder(this).setTitle(title).setView(container).setNegativeButton("Cancel",null).setPositiveButton("Save",(d,w)->result.accept(input.getText().toString().trim())).show();}
    private void details(LibraryItem item){List<String> detail=new ArrayList<>();detail.add(VaultQuery.media(item.kind));if(!item.channelName.isEmpty())detail.add("Channel: "+item.channelName);if(!item.collectionName.isEmpty())detail.add("Collection: "+item.collectionName);if(!item.sourceQuality.isEmpty())detail.add("Source quality: "+item.sourceQuality);if(item.height>0)detail.add("Resolution: "+item.height+"p");if(!item.formatSummary.isEmpty())detail.add("Format: "+item.formatSummary);detail.add("Size: "+VaultViews.bytes(item.fileSize));if(item.durationMs>0)detail.add("Duration: "+VaultViews.duration(item.durationMs));detail.add("Added: "+DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.SHORT).format(new Date(item.createdAt)));if(item.lastPlayedAt>0)detail.add("Last played: "+DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.SHORT).format(new Date(item.lastPlayedAt)));detail.add("File status: "+(item.isMissing()?"Missing":item.repairState==LibraryItem.RepairState.RECOVERED_ORPHAN?"Recovered orphan":"Healthy"));detail.add("File: "+item.relativePath);DownloadsUi.alert(this,item.title,TextUtils.join("\n",detail));}
}
