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
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/** Activity history for one verified printer. */
public final class ActivityHistoryActivity extends Activity {
    private static final int EXPORT=76;
    private final Handler main=new Handler(Looper.getMainLooper());
    private LinearLayout content;
    private int dp(float n){return (int)(n*getResources().getDisplayMetrics().density+0.5f);}
    private TextView text(String value,int size,int color){TextView view=new TextView(this);view.setText(value);view.setTextSize(size);view.setTextColor(color);return view;}
    @Override public void onCreate(Bundle state){super.onCreate(state);setTitle("Activity history");
        ScrollView scroll=new ScrollView(this);getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);scroll.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(20),dp(20),dp(20),dp(20));content.setBackgroundColor(Color.WHITE);scroll.addView(content);setContentView(scroll);
        content.addView(text("Loading activity...",16,0xff666666));loadHistory();
    }
    private void loadHistory(){HistoryRuntime.loadHistory(getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),(printer,bursts,error)->main.post(()->{if(isFinishing()||isDestroyed())return;showHistory(printer,bursts,error);}));}
    private void clearHistory(){new AlertDialog.Builder(this).setTitle("Delete activity history?").setMessage("All recorded bursts and replay results for this printer will be deleted. Saved printer responses will be kept.").setNegativeButton("Cancel",null).setPositiveButton("Delete all",(d,w)->{
        HistoryRuntime.clearHistory(getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),error->main.post(()->{if(isFinishing()||isDestroyed())return;if(error!=null)new AlertDialog.Builder(this).setTitle("Unable to delete history").setMessage(error).setPositiveButton("OK",null).show();loadHistory();}));
    }).show();}
    private void showHistory(PrinterRecord printer,List<ActivityBurst> bursts,String error){
        content.removeAllViews();if(error!=null){content.addView(text(error,16,0xff666666));return;}
        if(printer!=null){TextView heading=text(printer.name==null?"Saved printer":printer.name,20,0xff212121);heading.setTypeface(null,Typeface.BOLD);content.addView(heading);}
        if(bursts==null||bursts.isEmpty()){content.addView(text("No saved activity yet.",16,0xff666666));return;}
        Button export=new Button(this);export.setAllCaps(false);export.setText("Export activity history");export.setOnClickListener(v->exportHistory());content.addView(export,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        Button clear=new Button(this);clear.setAllCaps(false);clear.setText("Delete all activity");clear.setOnClickListener(v->clearHistory());content.addView(clear,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        for(ActivityBurst burst:bursts){Button button=new Button(this);String when=DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.MEDIUM).format(new Date(burst.startedWallMillis));
            button.setAllCaps(false);button.setText(String.format(Locale.ROOT,"Burst #%d · %.2f s · %d requests\n%s%s",burst.ref.sequence,burst.elapsedNanos/1000000000.0,burst.requests().size(),when,burst.coverage.requestsComplete?"":" · Incomplete"));
            button.setOnClickListener(v->showBurst(burst));content.addView(button,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));}
    }
    private void exportHistory(){Intent intent=new Intent(Intent.ACTION_CREATE_DOCUMENT);intent.addCategory(Intent.CATEGORY_OPENABLE);intent.setType("application/json");String timestamp=new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss",Locale.ROOT).format(new Date());intent.putExtra(Intent.EXTRA_TITLE,"printer-activity-"+timestamp+".json");startActivityForResult(intent,EXPORT);}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=EXPORT||result!=RESULT_OK||data==null||data.getData()==null)return;
        HistoryRuntime.exportHistory(getApplicationContext(),data.getData(),getIntent().getStringExtra("printer_ip"),getIntent().getStringExtra("printer_mac"),error->main.post(()->{if(isFinishing()||isDestroyed())return;android.widget.Toast.makeText(this,error==null?"Activity saved. Review it before sharing.":error,android.widget.Toast.LENGTH_LONG).show();}));
    }
    private void showBurst(ActivityBurst burst){
        String message=String.format(Locale.ROOT,"Activity: %.2f s\nRequests: %d",burst.elapsedNanos/1000000000.0,burst.requests().size());
        AlertDialog.Builder dialog=new AlertDialog.Builder(this).setTitle("Burst #"+burst.ref.sequence).setMessage(message).setNegativeButton("Close",null);
        if(burst.coverage.requestsComplete)dialog.setPositiveButton("Measure without cache",(d,w)->startReplay(burst.ref));
        dialog.show();
    }
    private void startReplay(ActivityBurst.Ref ref){
        HistoryRuntime.startReplay(ref,error->main.post(()->{if(isFinishing()||isDestroyed())return;if(error!=null)new AlertDialog.Builder(this).setTitle("Unable to replay").setMessage(error).setPositiveButton("OK",null).show();else finish();}));
    }
}
