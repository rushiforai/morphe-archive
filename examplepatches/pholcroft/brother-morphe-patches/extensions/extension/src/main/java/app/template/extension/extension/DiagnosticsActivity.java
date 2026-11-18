package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/** Local recording controls for diagnostic requests. */
public final class DiagnosticsActivity extends Activity {
    private static final int EXPORT=42,NAVY=0xff182a43,TEXT=0xff212121,MUTED=0xff666666,RECORDING_RED=0xffad241f;
    private final Handler handler=new Handler(Looper.getMainLooper());
    private TextView status,count,dropped;private Button toggle;private RequestListView requests;
    private int lastCount=-1,lastDropped=-1;private boolean lastRecording,active;
    private final Runnable refresh=new Runnable(){public void run(){if(!active)return;update();handler.postDelayed(this,750);}};
    private int dp(float n){return (int)(n*getResources().getDisplayMetrics().density+0.5f);}
    private TextView text(String value,int size,int color){TextView v=new TextView(this);v.setText(value);v.setTextSize(size);v.setTextColor(color);return v;}
    @Override public void onCreate(Bundle state){super.onCreate(state);requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);render();}
    @Override protected void onResume(){super.onResume();active=true;update();handler.removeCallbacks(refresh);handler.postDelayed(refresh,750);}
    @Override protected void onPause(){active=false;handler.removeCallbacks(refresh);super.onPause();}
    private void render(){
        LinearLayout root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(Color.WHITE);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        root.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});
        LinearLayout header=new LinearLayout(this);header.setGravity(Gravity.CENTER_VERTICAL);header.setBackgroundColor(NAVY);root.addView(header);
        TextView back=text("\u2039",32,Color.WHITE);back.setGravity(Gravity.CENTER);back.setContentDescription("Back");back.setOnClickListener(v->finish());header.addView(back,new LinearLayout.LayoutParams(dp(56),dp(56)));
        TextView title=text("Diagnostic recording",20,Color.WHITE);title.setTypeface(null,Typeface.BOLD);header.addView(title,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
        TextView menu=text("\u22ee",26,Color.WHITE);menu.setGravity(Gravity.CENTER);menu.setContentDescription("Diagnostic options");menu.setOnClickListener(v->showMenu(menu));header.addView(menu,new LinearLayout.LayoutParams(dp(48),dp(56)));
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(20),dp(22),dp(20),0);root.addView(content);
        status=text("",21,TEXT);status.setTypeface(null,Typeface.BOLD);content.addView(status);
        count=text("",15,MUTED);count.setPadding(0,dp(5),0,0);content.addView(count);
        dropped=text("",13,MUTED);content.addView(dropped);
        toggle=new Button(this);toggle.setAllCaps(false);toggle.setOnClickListener(v->{if(Diagnostics.isRecording())Diagnostics.stop();else Diagnostics.start();lastCount=-1;update();});LinearLayout.LayoutParams buttonParams=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT);buttonParams.topMargin=dp(14);content.addView(toggle,buttonParams);
        requests = new RequestListView(this, "Your recorded requests will appear here.");
        LinearLayout.LayoutParams tableParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1);
        tableParams.topMargin = dp(20);
        root.addView(requests, tableParams);
        setContentView(root);
        update();
    }
    private void update(){
        if(status==null)return;int n=Diagnostics.count(),discarded=Diagnostics.dropped();boolean recording=Diagnostics.isRecording();
        if(n==lastCount&&discarded==lastDropped&&recording==lastRecording)return;lastCount=n;lastDropped=discarded;lastRecording=recording;
        status.setText(recording?"Recording":"Stopped");status.setTextColor(recording?RECORDING_RED:TEXT);count.setText(n+(n==1?" request recorded":" requests recorded"));toggle.setText(recording?"Stop recording":"Start recording");
        toggle.setBackgroundTintList(android.content.res.ColorStateList.valueOf(recording ? RECORDING_RED : NAVY));
        toggle.setTextColor(Color.WHITE);
        dropped.setText(discarded>0?discarded+" older requests discarded":"");dropped.setVisibility(discarded>0?View.VISIBLE:View.GONE);
        Diagnostics.RecordingSnapshot snapshot = Diagnostics.snapshot();
        requests.setRows(snapshot.dropped + 1L, snapshot.events.size(), position -> {
            Diagnostics.RecentEvent event = snapshot.events.get(position);
            return new RequestListView.Row(
                    RequestRow.offset((event.startNanos - snapshot.firstStart)),
                    event.millis + " ms", RequestRow.name(event.oid), responseValue(event));
        });
    }

    private static String responseValue(Diagnostics.RecentEvent event) {
        String encoded;
        switch (event.type) {
            case "integer": encoded = "integer:" + event.value; break;
            case "octets_base64": encoded = "octets:" + event.value; break;
            default: return "ErrorRequestNoSuchName".equals(event.state) ? "No such object" : event.state;
        }
        return SnmpValueFormatter.format(encoded.getBytes(StandardCharsets.UTF_8), event.oid);
    }

    private void showMenu(View anchor){PopupMenu popup=new PopupMenu(this,anchor);android.view.MenuItem export=popup.getMenu().add("Export CSV"),clear=popup.getMenu().add("Clear recording"),about=popup.getMenu().add("About diagnostic recording"),share=popup.getMenu().add("How to share");export.setEnabled(Diagnostics.count()>0);clear.setEnabled(Diagnostics.count()>0);popup.setOnMenuItemClickListener(item->{if(item==export)export();else if(item==clear)clear();else if(item==about)about();else if(item==share)share();return true;});popup.show();}
    private void export(){new AlertDialog.Builder(this).setTitle("Export diagnostic recording?").setMessage("The CSV can contain printer addresses, identifiers and responses. Review it before sharing.").setNegativeButton("Cancel",null).setPositiveButton("Export",(d,w)->{Intent i=new Intent(Intent.ACTION_CREATE_DOCUMENT);i.addCategory(Intent.CATEGORY_OPENABLE);i.setType("text/csv");String timestamp=new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss",java.util.Locale.ROOT).format(new java.util.Date());i.putExtra(Intent.EXTRA_TITLE,"printer-diagnostics-"+timestamp+".csv");startActivityForResult(i,EXPORT);}).show();}
    private void clear(){new AlertDialog.Builder(this).setTitle("Clear diagnostic recording?").setMessage("This does not clear saved printer responses.").setNegativeButton("Cancel",null).setPositiveButton("Clear",(d,w)->{Diagnostics.clear();requests.resetExpansion();lastCount=-1;update();}).show();}
    private void about(){new AlertDialog.Builder(this).setTitle("About diagnostic recording").setMessage("While recording, supported SNMP requests go directly to the printer. Stopping restores your usual cache behavior. It does not include discovery, other protocols, every failure or print-job data. Times are measured from the first retained request; durations are request hook times, not print preview time. The list and CSV include all retained requests. Tap a shortened response to expand it, then tap again to copy. A short response copies on the first tap.\n\nRecording continues when you leave this screen so you can open a print preview. It ends when you tap Stop recording or the app process closes. Up to 2,000 recent events are kept in memory. Nothing is sent automatically.").setPositiveButton("Close",null).show();}
    private void share(){new AlertDialog.Builder(this).setTitle("Share diagnostic results").setMessage("Stop recording and export the CSV. Review it first: printer addresses, identifiers and response values may be included. Base64 is encoding, not encryption. You can attach the file to a GitHub issue yourself. Nothing is sent automatically.").setNegativeButton("Close",null).setPositiveButton("Open issues",(d,w)->startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://github.com/pholcroft/brother-morphe-patches/issues")))).show();}
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);if(request!=EXPORT||result!=RESULT_OK||data==null||data.getData()==null)return;
        try(OutputStream out=getContentResolver().openOutputStream(data.getData())){if(out==null)throw new java.io.IOException("No output stream");out.write(Diagnostics.csv().getBytes(StandardCharsets.UTF_8));Toast.makeText(this,"CSV saved. Review it before sharing.",Toast.LENGTH_LONG).show();}catch(Exception error){Toast.makeText(this,"Could not save CSV: "+error.getClass().getSimpleName(),Toast.LENGTH_LONG).show();}}
}
