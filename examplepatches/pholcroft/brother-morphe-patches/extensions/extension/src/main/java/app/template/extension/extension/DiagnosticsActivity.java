package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/** Explicit, local-only controls for collecting and exporting diagnostic events. */
public final class DiagnosticsActivity extends Activity {
    private static final int EXPORT=42;
    private LinearLayout content;
    @Override public void onCreate(Bundle state){super.onCreate(state);render();}
    @Override public void onResume(){super.onResume();if(content!=null)render();}
    private TextView text(String value,int size){TextView t=new TextView(this);t.setText(value);t.setTextSize(size);t.setPadding(0,10,0,10);return t;}
    private Button button(String label,Runnable run){Button b=new Button(this);b.setText(label);b.setOnClickListener(v->run.run());return b;}
    private void render(){
        ScrollView scroll=new ScrollView(this);content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);
        int p=(int)(20*getResources().getDisplayMetrics().density);content.setPadding(p,p,p,p);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        scroll.setClipToPadding(false);scroll.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});
        scroll.addView(content,new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));setContentView(scroll);
        content.addView(text("Advanced · diagnostic recording",22));
        TextView attribution=text("Unofficial community patch · Not affiliated with Brother",12);attribution.setTextColor(0xff666666);attribution.setTypeface(null,2);content.addView(attribution);
        content.addView(text("Record supported printer requests and responses while you open a preview. Nothing is sent automatically. Recording stays in memory until the app closes; at most 2,000 recent events are kept.",15));
        content.addView(text("A CSV can contain printer addresses, identifiers and response data. Review it before sharing. Captured byte strings are Base64 encoded, not encrypted.",14));
        content.addView(text("Records individual SNMP GETs handled by the cache hook. Discovery, other protocols, some failures and print-job data are not recorded. Durations are hook timings, not screen-to-preview time.",14));
        content.addView(text((Diagnostics.isRecording()?"Recording":"Stopped")+" · "+Diagnostics.count()+" events · "+Diagnostics.dropped()+" older events discarded",16));
        content.addView(button(Diagnostics.isRecording()?"Stop recording":"Start recording",()->{if(Diagnostics.isRecording()){Diagnostics.stop();}else Diagnostics.start();render();}));
        content.addView(button("Refresh list",this::render));
        content.addView(button("Export CSV",()->{Intent i=new Intent(Intent.ACTION_CREATE_DOCUMENT);i.addCategory(Intent.CATEGORY_OPENABLE);i.setType("text/csv");String timestamp=new java.text.SimpleDateFormat("yyyy-MM-dd_HH-mm-ss",java.util.Locale.ROOT).format(new java.util.Date());i.putExtra(Intent.EXTRA_TITLE,"printer-diagnostics-"+timestamp+".csv");startActivityForResult(i,EXPORT);}));
        content.addView(button("Clear recording",()->new AlertDialog.Builder(this).setTitle("Clear diagnostic recording?").setMessage("This does not clear saved printer responses.").setNegativeButton("Cancel",null).setPositiveButton("Clear",(d,w)->{Diagnostics.clear();render();}).show()));
        content.addView(button("How to share diagnostics",()->new AlertDialog.Builder(this).setTitle("Share diagnostic results").setMessage("Stop recording and export the CSV. Review it first: printer addresses, identifiers and response values may be included. Then open the contribution guide or create a GitHub issue and attach the file yourself. Nothing is sent automatically.").setNegativeButton("Close",null).setNeutralButton("Read guide",(d,w)->startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://github.com/pholcroft/brother-morphe-patches/blob/main/CAPTURING-PRINTER-TRAFFIC.md")))).setPositiveButton("Open issues",(d,w)->startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://github.com/pholcroft/brother-morphe-patches/issues")))).show()));
        content.addView(text("Recent events (up to 100; full recording is in CSV)",16));
        String recent=Diagnostics.recent();content.addView(text(recent.isEmpty()?"No events recorded yet.":recent,12));
    }
    @Override protected void onActivityResult(int request,int result,Intent data){super.onActivityResult(request,result,data);
        if(request!=EXPORT||result!=RESULT_OK||data==null||data.getData()==null)return;
        try(OutputStream out=getContentResolver().openOutputStream(data.getData())){
            if(out==null)throw new java.io.IOException("No output stream");out.write(Diagnostics.csv().getBytes(StandardCharsets.UTF_8));Toast.makeText(this,"CSV saved. Review it before sharing.",Toast.LENGTH_LONG).show();
        }catch(Exception error){Toast.makeText(this,"Could not save CSV: "+error.getClass().getSimpleName(),Toast.LENGTH_LONG).show();}
    }
}
