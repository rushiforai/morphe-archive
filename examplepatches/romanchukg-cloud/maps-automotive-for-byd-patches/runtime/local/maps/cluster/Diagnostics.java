package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.ContextThemeWrapper;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import javax.net.ssl.HttpsURLConnection;

/** Own structured events only. No logcat, account files, locations or screenshots. */
final class Diagnostics {
    static final String VERSION=BuildInfo.VERSION;
    private static final String BASE="https://diagnostics.localcharge.app";
    private static Application app;
    private static Handler work;
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static DiagnosticQueue queue;
    private static final ArrayDeque<JSONObject> events=new ArrayDeque<>();
    private static boolean noticeVisible, truncated;
    static boolean noticePending(){return noticeVisible;}
    private static long lastSource;
    private static String sourceMode="",lastFailure="";
    private static long lastFailureAt;
    private static GuidanceFrame lastGuidance;
    private static final String NOTICE="Uploads are disabled in this laboratory build. In public builds, technical reports go to our diagnostics server and a limited summary is published in public GitHub Issues. Reports exclude routes, coordinates, road names, account data and screenshots. You can turn automatic reports off in Support. Manual reports remain available.";
    static synchronized void install(Application value) {
        if(work!=null)return;
        app=value;
        HandlerThread thread=new HandlerThread("maps-support");thread.start();work=new Handler(thread.getLooper()) {
            public void dispatchMessage(Message message) {
                try {super.dispatchMessage(message);}catch(RuntimeException ignored) { /* Support must not break navigation. */ }
            }
        };
        work.post(()->{
            SharedPreferences prefs=app.getSharedPreferences("local_support_diagnostics",Context.MODE_PRIVATE);
            queue=new DiagnosticQueue(new DiagnosticQueue.Storage(){
                public String read(){return prefs.getString("outbox","{}");}
                public boolean write(String value){return prefs.edit().putString("outbox",value).commit();}
            },Diagnostics::request);
            record("lifecycle",DiagnosticQueue.object("state","started"));
        });
        work.postDelayed(new Runnable(){public void run(){
            try{if(queue!=null)queue.tick(System.currentTimeMillis());}catch(Exception ignored){}
            work.postDelayed(this,10000);
        }},3000);
    }
    static void resumed(Activity activity) {
        if(work==null)return;
        work.post(()->{if(!queue.informed())main.post(()->showNotice(activity));});
    }
    private static boolean alive(Activity a){return !a.isFinishing()&&!a.isDestroyed();}
    private static Context theme(Activity a){return new ContextThemeWrapper(a,android.R.style.Theme_DeviceDefault_Dialog_Alert);}
    private static LinearLayout panel(Context c){LinearLayout p=new LinearLayout(c);p.setOrientation(LinearLayout.VERTICAL);int n=(int)(20*c.getResources().getDisplayMetrics().density);p.setPadding(n,n,n,n);return p;}
    private static TextView text(Context c,String s){TextView v=new TextView(c);v.setText(s);v.setTextSize(16);v.setPadding(0,8,0,12);return v;}
    private static Button button(Context c,String s){Button b=new Button(c);b.setText(s);b.setAllCaps(false);return b;}
    private static void toast(Activity a,String s){main.post(()->{if(alive(a))Toast.makeText(a,s,Toast.LENGTH_LONG).show();});}
    private static void showNotice(Activity a) {
        if(!alive(a)||noticeVisible)return;
        noticeVisible=true;Context c=theme(a);LinearLayout p=panel(c);p.addView(text(c,NOTICE));
        CheckBox check=new CheckBox(c);check.setText("Automatically send diagnostics");check.setChecked(false);p.addView(check);
        AlertDialog dialog=new AlertDialog.Builder(c).setTitle("Diagnostics").setView(p).setPositiveButton("Continue",null).create();
        dialog.setOnDismissListener(d->noticeVisible=false);dialog.show();
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{
            boolean enabled=check.isChecked();dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            work.post(()->{boolean ok=queue.choice(enabled);main.post(()->{if(!alive(a))return;if(ok)dialog.dismiss();else{dialog.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);toast(a,"Could not save your choice. Please try again.");}});});
        });
    }
    static void show(Activity a) {
        if(work==null)return;
        work.post(()->{
            boolean informed=queue.informed(),automatic=queue.automatic();String summary=queue.summary(),issue=queue.issue();JSONArray pending=queue.entries();
            main.post(()->{
                if(!alive(a))return;
                Context c=theme(a);LinearLayout p=panel(c);p.addView(text(c,NOTICE));
                Switch toggle=new Switch(c);toggle.setText("Automatically send diagnostics");toggle.setChecked(informed&&automatic);toggle.setEnabled(informed);p.addView(toggle);
                if(!informed){Button review=button(c,"Review diagnostics choice");review.setOnClickListener(v->showNotice(a));p.addView(review);}
                TextView status=text(c,summary);p.addView(status);
                p.addView(text(c,clusterStats()));
                toggle.setOnCheckedChangeListener((v,on)->{
                    work.post(()->{if(on){if(!queue.choice(true))toast(a,"Could not save your choice.");}else if(!queue.stopAutomatic())toast(a,"Could not save your choice.");});
                });
                Button send=button(c,"Send diagnostics");send.setOnClickListener(v->selectProblem(a));p.addView(send);
                Button export=button(c,"Export diagnostics");export.setOnClickListener(v->work.post(()->{JSONObject report=report("manual","other","unknown","unknown","unknown");main.post(()->share(a,report));}));p.addView(export);
                Button refresh=button(c,"Refresh report status");refresh.setOnClickListener(v->work.post(()->{queue.tick(System.currentTimeMillis());String value=queue.summary();main.post(()->status.setText(value));}));p.addView(refresh);
                if(!issue.isEmpty()) {Button open=button(c,"Open GitHub issue");open.setOnClickListener(v->{try{a.startActivity(new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(issue)));}catch(Exception e){toast(a,"No browser is available.");}});p.addView(open);}
                for(int i=0;i<pending.length();i++) {
                    JSONObject e=pending.optJSONObject(i);String key=e.optString("key");
                    Button cancel=button(c,(e.optBoolean("automatic")?"Automatic":"Manual")+" report: "+e.optString("status")+" — Cancel / remove");
                    cancel.setOnClickListener(v->work.post(()->{queue.cancel(key);queue.tick(System.currentTimeMillis());toast(a,queue.summary());}));p.addView(cancel);
                }
                p.addView(text(c,"Pending reports survive restarts. Retries run while Maps is running. Open Support again to see updated status."));
                ScrollView scroll=new ScrollView(c);scroll.addView(p);
                new AlertDialog.Builder(c).setTitle("Support").setView(scroll).setPositiveButton("Done",null).show();
            });
        });
    }
    private static Spinner spinner(Context c,String[] values) {
        Spinner s=new Spinner(c);s.setAdapter(new ArrayAdapter<String>(c,android.R.layout.simple_spinner_dropdown_item,values));return s;
    }
    private static void selectProblem(Activity a) {
        Context c=theme(a);LinearLayout p=panel(c);
        String[] categories={"hud","cluster_map","wheel_buttons","navigation","other"};
        p.addView(text(c,"Problem"));Spinner category=spinner(c,new String[]{"HUD","Instrument cluster map","Wheel buttons","Navigation","Other"});p.addView(category);
        String[] answers={"unknown","yes","no"};
        p.addView(text(c,"Turn guidance visible on instrument cluster?"));Spinner cluster=spinner(c,answers);p.addView(cluster);
        p.addView(text(c,"Turn guidance visible on HUD?"));Spinner hud=spinner(c,answers);p.addView(hud);
        p.addView(text(c,"Stock navigation displays guidance on HUD?"));Spinner stock=spinner(c,answers);p.addView(stock);
        ScrollView scroll=new ScrollView(c);scroll.addView(p);
        new AlertDialog.Builder(c).setTitle("Send diagnostics").setView(scroll).setNegativeButton("Cancel",null).setPositiveButton("Preview",(d,w)->{
            String cat=categories[category.getSelectedItemPosition()],cl=answers[cluster.getSelectedItemPosition()],hu=answers[hud.getSelectedItemPosition()],st=answers[stock.getSelectedItemPosition()];
            work.post(()->{JSONObject report=report("manual",cat,cl,hu,st);main.post(()->preview(a,report));});
        }).show();
    }
    private static void preview(Activity a,JSONObject report) {
        if(!alive(a))return;
        Context c=theme(a);LinearLayout p=panel(c);p.addView(text(c,"Sending creates a public GitHub Issue. Review the exact technical report below. No GitHub account is required."));
        TextView body=text(c,pretty(report));body.setTextSize(12);body.setTextIsSelectable(true);p.addView(body);ScrollView scroll=new ScrollView(c);scroll.addView(p);
        AlertDialog d=new AlertDialog.Builder(c).setTitle("Public report preview").setView(scroll).setNegativeButton("Cancel",null).setNeutralButton("Export",(dialog,w)->share(a,report)).setPositiveButton("Send",null).create();d.show();
        d.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{d.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);work.post(()->{
            boolean ok=queue.enqueue(report,false,System.currentTimeMillis());
            main.post(()->{if(!alive(a))return;if(ok){d.dismiss();toast(a,"Report saved. Open Support to check delivery.");}else{d.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(true);toast(a,"Report could not be saved. Remove a pending report or export it.");}});
            if(ok)queue.tick(System.currentTimeMillis());
        });});
    }
    private static String pretty(JSONObject value){try{return value.toString(2);}catch(JSONException e){return value.toString();}}
    private static void share(Activity a,JSONObject report) {
        if(!alive(a))return;
        try{a.startActivity(Intent.createChooser(new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_SUBJECT,"Google Maps for BYD diagnostics").putExtra(Intent.EXTRA_TEXT,pretty(report)+"\n\n"+clusterStats()),"Export diagnostics"));}
        catch(Exception e){toast(a,"No app is available to export diagnostics.");}
    }
    /** 54F: local only, never inside the uploaded report (the server contract rejects unregistered event types). */
    private static String clusterStats(){return "Cluster stats (local, not uploaded): "+ClusterStats.snapshot(SystemClock.elapsedRealtime());}
    private static void record(String type,JSONObject data) {
        long now=SystemClock.elapsedRealtime();
        while(!events.isEmpty()&&(events.size()>=100||now-events.peekFirst().optLong("time")>600000)){events.removeFirst();truncated=true;}
        events.addLast(DiagnosticQueue.object("time",now,"type",type,"data",data));
    }
    static void failure(String stage,String code) {
        if(work==null)return;
        work.post(()->{try{
            long now=SystemClock.elapsedRealtime();String marker=stage+":"+code;
            if(marker.equals(lastFailure)&&now-lastFailureAt<30000)return;lastFailure=marker;lastFailureAt=now;
            record("failure",DiagnosticQueue.object("stage",stage,"code",code));
            if(queue.informed()&&queue.automatic())queue.enqueue(report("automatic",stage.equals("projection")?"cluster_map":"navigation","unknown","unknown","unknown"),true,System.currentTimeMillis());
        }catch(Exception ignored){}});
    }
    static void source(boolean guiding,int providers,long age) {
        if(work==null)return;
        work.post(()->{String mode=guiding?"GUIDING":"OFF";long now=SystemClock.elapsedRealtime();if(mode.equals(sourceMode)&&now-lastSource<30000)return;sourceMode=mode;lastSource=now;
            record("navigation_source",DiagnosticQueue.object("mode",mode,"providers",DiagnosticPolicy.bounded(providers,0,100),"age_ms",Math.max(0,Math.min(86400000,age))));});
    }
    static void guidance(GuidanceFrame frame,boolean sent) {
        if(work==null)return;
        work.post(()->{String reason=frame==null?"end":frame.equals(lastGuidance)?"keepalive":"changed";lastGuidance=frame;record("guidance_send",DiagnosticQueue.object("outcome",sent?"sent":"failed","icon",frame==null?-1:DiagnosticPolicy.bounded(frame.icon,-1,100),
            "turn_meters",frame==null?-1:DiagnosticPolicy.bounded(frame.turnMeters,-1,1000000),"route_meters",frame==null?-1:DiagnosticPolicy.bounded(frame.routeMeters,-1,100000000),
            "route_seconds",frame==null?-1:DiagnosticPolicy.bounded(frame.routeSeconds,-1,31536000),"reason",reason));});
    }
    private static JSONObject report(String origin,String category,String cluster,String hud,String stock) {
        long now=SystemClock.elapsedRealtime(),start=now;JSONArray output=new JSONArray();
        while(!events.isEmpty()&&now-events.peekFirst().optLong("time")>600000){events.removeFirst();truncated=true;}
        if(!events.isEmpty())start=events.peekFirst().optLong("time");
        for(JSONObject e:events)output.put(DiagnosticQueue.object("elapsed_ms",Math.max(0,Math.min(600000,e.optLong("time")-start)),"type",e.optString("type"),"data",e.optJSONObject("data")));
        ClusterSettings.State s=ClusterSettings.state();
        return DiagnosticReport.create(VERSION,origin,category,cluster,hud,stock,Build.VERSION.SDK_INT,
            Build.VERSION.RELEASE,Build.MANUFACTURER,Build.MODEL,Build.DISPLAY,s!=null&&s.mapEnabled,
            s!=null&&s.vehicleGuidance,(int)Math.min(600,(now-start+999)/1000),truncated,output);
    }
    private static DiagnosticQueue.Reply request(String method,String path,String body,String key,String token) throws Exception {
        if(BuildInfo.VERSION.startsWith("patch-lab."))throw new java.io.IOException("Uploads disabled in laboratory build");
        if(!path.equals("/")&&!path.equals("/v1/reports")&&!path.matches("/v1/reports/[0-9a-f-]{36}"))throw new IllegalArgumentException();
        HttpsURLConnection c=(HttpsURLConnection)new URL(BASE+path).openConnection();
        try {
            c.setInstanceFollowRedirects(false);c.setRequestMethod(method);c.setConnectTimeout(10000);c.setReadTimeout(10000);c.setUseCaches(false);
            c.setRequestProperty("Accept","application/json");
            if(token!=null)c.setRequestProperty("X-Report-Token",token);
            if(key!=null)c.setRequestProperty("Idempotency-Key",key);
            if(body!=null){byte[] bytes=body.getBytes(StandardCharsets.UTF_8);if(bytes.length>DiagnosticPolicy.MAX_REPORT)throw new IllegalArgumentException();c.setDoOutput(true);c.setRequestProperty("Content-Type","application/json");c.setFixedLengthStreamingMode(bytes.length);try(OutputStream out=c.getOutputStream()){out.write(bytes);}}
            int status=c.getResponseCode();long retry=0;
            String after=c.getHeaderField("Retry-After");try{if(after!=null)retry=Math.min(86400,Long.parseLong(after))*1000;}catch(NumberFormatException ignored){}
            InputStream stream=status>=400?c.getErrorStream():c.getInputStream();JSONObject result=new JSONObject();
            if(stream!=null)try(InputStream in=stream;ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] buffer=new byte[2048];int n;while((n=in.read(buffer))!=-1){if(out.size()+n>16384)throw new IOException();out.write(buffer,0,n);}
                if(out.size()>0)result=new JSONObject(new String(out.toByteArray(),StandardCharsets.UTF_8));
            }
            return new DiagnosticQueue.Reply(status,result,retry);
        } finally {c.disconnect();}
    }
}
