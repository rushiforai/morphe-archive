package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/** Activity history for one verified printer. */
public final class ActivityHistoryActivity extends Activity {
    private static final int EXPORT=76, EXPORT_BURST=77;
    private final Handler main=new Handler(Looper.getMainLooper());
    private LinearLayout content;
    private boolean viewingRequests;private boolean historyAvailable;private ActivityBurst.Ref selectedRef;
    private int dp(float n){return (int)(n*getResources().getDisplayMetrics().density+0.5f);}
    private TextView text(String value,int size,int color){TextView view=new TextView(this);view.setText(value);view.setTextSize(size);view.setTextColor(color);return view;}
    @Override public void onCreate(Bundle state){super.onCreate(state);requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);setTitle("Activity history");
        if(state!=null&&state.containsKey("burst_id")){
            selectedRef=new ActivityBurst.Ref(state.getString("printer_id"),state.getString("burst_id"),state.getLong("burst_sequence"));viewingRequests=true;
            HistoryRuntime.loadBurst(selectedRef,(burst,error)->main.post(()->{if(isFinishing()||isDestroyed())return;if(burst==null){viewingRequests=false;selectedRef=null;showHistoryScreen();}else showRequests(burst);}));
        }else showHistoryScreen();
    }
    @Override protected void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);if(viewingRequests&&selectedRef!=null){state.putString("printer_id",selectedRef.printerId);state.putString("burst_id",selectedRef.burstId);state.putLong("burst_sequence",selectedRef.sequence);}}
    @Override public void onBackPressed(){if(viewingRequests){viewingRequests=false;selectedRef=null;showHistoryScreen();}else super.onBackPressed();}
    private void showHistoryScreen(){
        historyAvailable=false;
        LinearLayout root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(Color.WHITE);getWindow().setStatusBarColor(0xff182a43);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        root.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});
        LinearLayout header=new LinearLayout(this);header.setGravity(android.view.Gravity.CENTER_VERTICAL);header.setBackgroundColor(0xff182a43);root.addView(header);
        TextView back=text("\u2039",32,Color.WHITE);back.setGravity(android.view.Gravity.CENTER);back.setContentDescription("Back");back.setOnClickListener(v->onBackPressed());header.addView(back,new LinearLayout.LayoutParams(dp(56),dp(56)));
        TextView title=text("Activity history",20,Color.WHITE);title.setTypeface(null,Typeface.BOLD);header.addView(title,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
        TextView menu=text("\u22ee",26,Color.WHITE);menu.setGravity(android.view.Gravity.CENTER);menu.setContentDescription("History options");menu.setOnClickListener(v->{android.widget.PopupMenu popup=new android.widget.PopupMenu(this,menu);android.view.MenuItem export=popup.getMenu().add("Export activity history"),clear=popup.getMenu().add("Delete all activity"),clearPrinter=popup.getMenu().add("Clear saved printer data");export.setEnabled(historyAvailable);clear.setEnabled(historyAvailable);popup.setOnMenuItemClickListener(item->{if(item==export)exportHistory();else if(item==clear)clearHistory();else if(item==clearPrinter)clearPrinter();return true;});popup.show();});header.addView(menu,new LinearLayout.LayoutParams(dp(48),dp(56)));
        ScrollView scroll=new ScrollView(this);content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(20),dp(20),dp(20),dp(20));content.setBackgroundColor(Color.WHITE);scroll.addView(content);root.addView(scroll,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,0,1));setContentView(root);
        content.addView(text("Loading activity...",16,0xff666666));loadHistory();
    }
    private void loadHistory(){HistoryRuntime.loadHistory(getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),(printer,bursts,error)->main.post(()->{if(isFinishing()||isDestroyed()||viewingRequests)return;showHistory(printer,bursts,error);}));}
    private void clearPrinter(){new AlertDialog.Builder(this).setTitle("Clear saved printer data?").setMessage("This removes saved responses and activity history for this printer. Responses will be learned again the next time you print. Diagnostic recordings are kept separately.").setNegativeButton("Cancel",null).setPositiveButton("Clear",(d,w)->{if(AutoCache.clearPrinter(getIntent().getStringExtra("printer_ip")))finish();else new AlertDialog.Builder(this).setTitle("Unable to clear saved data").setMessage("Please try again.").setPositiveButton("OK",null).show();}).show();}
    private void clearHistory(){new AlertDialog.Builder(this).setTitle("Delete activity history?").setMessage("All recorded bursts and replay results for this printer will be deleted. Saved printer responses will be kept.").setNegativeButton("Cancel",null).setPositiveButton("Delete all",(d,w)->{
        HistoryRuntime.clearHistory(getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),error->main.post(()->{if(isFinishing()||isDestroyed())return;if(error!=null)new AlertDialog.Builder(this).setTitle("Unable to delete history").setMessage(error).setPositiveButton("OK",null).show();loadHistory();}));
    }).show();}
    private void showHistory(PrinterRecord printer,List<ActivityBurst> bursts,String error){
        content.removeAllViews();historyAvailable=error==null&&bursts!=null&&!bursts.isEmpty();if(error!=null){content.addView(text(error,16,0xff666666));return;}
        if(printer!=null){String printerName=printer.name==null||printer.name.isEmpty()?"Saved printer":printer.name;TextView heading=text(printerName,20,0xff212121);heading.setTypeface(null,Typeface.BOLD);heading.setPadding(0,0,0,dp(12));content.addView(heading);}
        if(!historyAvailable){TextView empty=text("No saved activity yet.",16,0xff666666);empty.setPadding(0,dp(8),0,0);content.addView(empty);return;}
        for(ActivityBurst burst:bursts){
            LinearLayout row=new LinearLayout(this);row.setOrientation(LinearLayout.HORIZONTAL);row.setGravity(android.view.Gravity.CENTER_VERTICAL);row.setPadding(0,dp(12),0,dp(12));row.setOnClickListener(v->showRequests(burst));
            LinearLayout labels=new LinearLayout(this);labels.setOrientation(LinearLayout.VERTICAL);TextView name=text("Burst #"+burst.ref.sequence,17,0xff212121);name.setTypeface(null,Typeface.BOLD);labels.addView(name);
            String when=DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM).format(new Date(burst.startedWallMillis));labels.addView(text(when,14,0xff343c47));
            labels.addView(text(String.format(Locale.ROOT,"%.2f s · %d requests%s",burst.elapsedNanos/1000000000.0,burst.requests().size(),burst.coverage.requestsComplete?"":" · Incomplete"),14,0xff666666));row.addView(labels,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
            TextView arrow=text("\u203a",26,0xff212121);arrow.setGravity(android.view.Gravity.CENTER);row.addView(arrow,new LinearLayout.LayoutParams(dp(32),ViewGroup.LayoutParams.MATCH_PARENT));content.addView(row,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
            android.view.View divider=new android.view.View(this);divider.setBackgroundColor(0xffd9dfe2);content.addView(divider,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,dp(1)));
        }
    }

    private void exportHistory(){Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT);intent.addCategory(Intent.CATEGORY_OPENABLE);intent.setType("application/json");String timestamp=new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss",Locale.ROOT).format(new Date());intent.putExtra(Intent.EXTRA_TITLE,"printer-activity-"+timestamp+".json");startActivityForResult(intent,EXPORT);}
    private void exportBurst(ActivityBurst.Ref ref){Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT);intent.addCategory(Intent.CATEGORY_OPENABLE);intent.setType("application/json");String timestamp=new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss",Locale.ROOT).format(new Date());intent.putExtra(Intent.EXTRA_TITLE,"printer-activity-burst-"+ref.sequence+"-"+timestamp+".json");startActivityForResult(intent,EXPORT_BURST);}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if((request!=EXPORT&&request!=EXPORT_BURST)||result!=RESULT_OK||data==null||data.getData()==null)return;
        HistoryRuntime.ReplayCallback callback=error->main.post(()->{if(isFinishing()||isDestroyed())return;android.widget.Toast.makeText(this,error==null?"Activity saved. Review it before sharing.":error,android.widget.Toast.LENGTH_LONG).show();});
        if(request==EXPORT_BURST){if(selectedRef==null){callback.complete("This activity is no longer available.");return;}HistoryRuntime.exportBurst(getApplicationContext(),data.getData(),selectedRef,callback);}
        else HistoryRuntime.exportHistory(getApplicationContext(),data.getData(),getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),callback);
    }
    private void showRequests(ActivityBurst burst){
        viewingRequests=true;selectedRef=burst.ref;
        LinearLayout root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(Color.WHITE);getWindow().setStatusBarColor(0xff182a43);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() & ~android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        root.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});
        LinearLayout header=new LinearLayout(this);header.setGravity(android.view.Gravity.CENTER_VERTICAL);header.setBackgroundColor(0xff182a43);root.addView(header);
        TextView back=text("\u2039",32,Color.WHITE);back.setGravity(android.view.Gravity.CENTER);back.setContentDescription("Back");back.setOnClickListener(v->onBackPressed());header.addView(back,new LinearLayout.LayoutParams(dp(56),dp(64)));
        LinearLayout labels=new LinearLayout(this);labels.setOrientation(LinearLayout.VERTICAL);TextView title=text("Request activity",20,Color.WHITE);title.setTypeface(null,Typeface.BOLD);labels.addView(title);labels.addView(text("Burst #"+burst.ref.sequence+" · Estimated uncached",13,Color.WHITE));header.addView(labels,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
        TextView menu=text("\u22ee",26,Color.WHITE);menu.setGravity(android.view.Gravity.CENTER);menu.setContentDescription("Activity options");menu.setOnClickListener(v->{android.widget.PopupMenu popup=new android.widget.PopupMenu(this,menu);popup.getMenu().add("Export activity");popup.setOnMenuItemClickListener(item->{exportBurst(burst.ref);return true;});popup.show();});header.addView(menu,new LinearLayout.LayoutParams(dp(48),dp(64)));
        List<RequestRecord> requests = burst.requests();
        long[] durations = RequestTimeline.durations(requests);
        long[] offsets = RequestTimeline.offsets(durations);
        RequestListView table = new RequestListView(this, "No requests recorded.");
        table.setRows(1, requests.size(), position -> {
            RequestRecord request = requests.get(position);
            return new RequestListView.Row(RequestRow.offset(offsets[position]),
                    RequestRow.duration(durations[position], request.cached),
                    RequestRow.name(request.oid), RequestRow.response(request));
        });
        table.setOnRowLongClick(position -> showRequest(requests.get(position)));
        root.addView(table, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(root);
    }
    private void showRequest(RequestRecord request){OidDictionary.Entry entry=OidDictionary.lookup(request.oid);String name=entry==null?"Unknown request":entry.name;
        String description=entry==null?"This identifier has not been described in the dictionary yet.":entry.description+"\n\nMIB name: "+entry.symbol;
        String value=SnmpValueFormatter.format(request.response(),request.oid);
        String details=String.format(Locale.ROOT,"%s\n\nOID: %s\nSource: %s\nTime from burst start: %.3f s\nDuration: %.3f s\nOutcome: %s\n\nRecorded response: %s",description,request.oid,request.cached?"Cache":"Printer",request.startNanos/1e9,(request.endNanos-request.startNanos)/1e9,request.outcome.name(),value);
        new AlertDialog.Builder(this).setTitle(name).setMessage(details).setPositiveButton("Close",null).show();
    }
}
