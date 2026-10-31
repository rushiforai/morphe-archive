package app.local.extension.curve;

import android.Manifest;
import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.os.*;
import android.view.*;
import android.widget.*;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Native Curve controls, three steps, and a single durable background batch. */
public final class BatchGbitActivity extends AppCompatActivity {
    private final ExecutorService io=Executors.newSingleThreadExecutor();
    private final Handler main=new Handler(Looper.getMainLooper());
    private final Set<String> selected=new LinkedHashSet<>();
    private final Map<String,CompoundButton> selectionChecks=new LinkedHashMap<>();
    private BatchCardCarousel cardCarousel;
    private JSONArray rows=new JSONArray();
    private Map<String,String> cards=new LinkedHashMap<>();
    private String account,card;
    private JSONObject batch;
    private LinearLayout content;
    private LinearLayout cardSummary;
    private String progressId;
    private TextView progressSummary,progressMessage;
    private ProgressBar progressBar;
    private final Map<String,TextView> outcomeViews=new LinkedHashMap<>();
    private TextView description,error;
    private Button primary,secondary;
    private int ageDays;
    private int step=1;
    private boolean busy;
    static final String EXTRA_BATCH_ID="morphe_batch_id";
    private final Runnable poll=new Runnable() { public void run() { if(step==3 && !busy && (BatchGbitService.running || !terminalBatch())) refreshProgress(); main.postDelayed(this,1500); } };
    public static boolean isIncluded() { return false; }
    int res(String name,String kind) { int id=getResources().getIdentifier(name,kind,getPackageName()); if(id==0) throw new IllegalStateException("Missing Curve resource: "+name); return id; }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            BatchCurve.call(getOnBackPressedDispatcher(),"d",new androidx.activity.OnBackPressedCallback(true) {
                @Override public void handleOnBackPressed() { back(); }
            },this);
        } catch(Exception e) { throw new IllegalStateException("Curve Back dispatcher changed",e); }
        setContentView(res("morphe_batch_gbit","layout"));
        content=findViewById(res("morphe_batch_content","id")); description=findViewById(res("morphe_batch_description","id"));
        error=findViewById(res("morphe_batch_error","id")); primary=findViewById(res("morphe_batch_primary","id")); secondary=findViewById(res("morphe_batch_secondary","id"));
        ((Toolbar)findViewById(res("morphe_batch_toolbar","id"))).setNavigationOnClickListener(v->back());
        if(state!=null) selected.addAll(state.getStringArrayList("selection")==null?Collections.emptyList():state.getStringArrayList("selection"));
        work(()-> {
            account=BatchCurve.account(); cards=BatchCurve.cards();
            synchronized(BatchGbitService.LOCK) {
                batch=new BatchStore(this).recover(account,getIntent().getStringExtra(EXTRA_BATCH_ID));
                if(batch!=null && !BatchGbitService.running) {
                    try { BatchGbitService.publishStatus(this,batch); } catch(Exception unavailable) { /* Notification access must not block the screen. */ }
                }
            }
            boolean existing=BatchStore.showResults(batch,getIntent().getStringExtra(EXTRA_BATCH_ID));
            if(existing) { step=3; getIntent().putExtra(EXTRA_BATCH_ID,batch.getString("id")); }
            if(!existing) {
                requireEnabled();
                rows=BatchCurve.purchases(BatchCurve.history());
                if(rows.length()>0) {
                    Integer days=null;
                    for(int i=0;i<rows.length() && days==null;i++) {
                        BatchCurve.checkInterrupted();
                        try {
                            Object limits=BatchCurve.call(BatchCurve.options(account,rows.getJSONObject(i).getString("id")),"getLimits");
                            days=((Number)BatchCurve.call(limits,"getDaysElapsed")).intValue();
                        } catch(InterruptedException cancelled) { throw cancelled; }
                        catch(java.io.IOException | TimeoutException offline) { throw offline; }
                        catch(Exception unavailable) { /* A single unavailable purchase must not hide the history. */ }
                    }
                    if(days!=null) {
                        if(days<1 || days>120) throw new Exception("Curve returned an unsupported transaction age limit.");
                        JSONArray allowed=new JSONArray();
                        for(int i=0;i<rows.length();i++) if(!Instant.parse(rows.getJSONObject(i).getString("date")).isBefore(Instant.now().minus(Duration.ofDays(days)))) allowed.put(rows.getJSONObject(i));
                        rows=allowed; ageDays=days;
                    }

                }
            }
            Set<String> visible=new HashSet<>();
            for(int i=0;i<rows.length();i++) visible.add(rows.getJSONObject(i).getString("id"));
            selected.retainAll(visible);
        },()-> { if(step==3) renderProgress(); else renderSelection(); });
    }
    private interface Task { void run() throws Exception; }
    private void work(Task task,Runnable done) {
        if(busy) return; busy=true;
        if(step!=3) { primary.setEnabled(false); secondary.setEnabled(false); }
        error.setText("");
        io.execute(()-> {
            Exception failure=null; try { task.run(); } catch(Exception e) { failure=e; }
            final Exception result=failure;
            main.post(()-> { if(isDestroyed() || isFinishing()) return; busy=false; secondary.setEnabled(true); if(result==null) done.run(); else { error.setText(result.getMessage()==null?"Could not load Curve data. Try again.":result.getMessage()); primary.setText("Try again"); primary.setEnabled(true); primary.setOnClickListener(v->recreate()); } });
        });
    }
    private TextView text(String value) {
        return text(content,value);
    }
    private TextView text(LinearLayout parent,String value) {
        TextView t=(TextView)getLayoutInflater().inflate(res("morphe_batch_text","layout"),parent,false); t.setText(value); parent.addView(t); return t;
    }
    private void row(String id,String title,String subtitle) {
        View v=getLayoutInflater().inflate(res("morphe_batch_row","layout"),content,false);
        ((TextView)v.findViewById(res("txtTitle","id"))).setText(title);
        ((TextView)v.findViewById(res("txtSubtitle","id"))).setText(subtitle);
        CompoundButton c=v.findViewById(res("swiCheck","id")); c.setSaveEnabled(false); c.setChecked(selected.contains(id)); c.setContentDescription(title+", "+subtitle);
        selectionChecks.put(id,c);
        View.OnClickListener toggle=w->{
            if(!busy) { if(selected.contains(id)) selected.remove(id); else selected.add(id); updateSelectionButtons(); }
            c.setChecked(selected.contains(id));
        };
        c.setOnClickListener(toggle); v.setOnClickListener(toggle); content.addView(v);
    }
    private void renderSelection() {
        step=1; content.removeAllViews(); selectionChecks.clear(); description.setText("Move several purchases to one payment card. "+(ageDays>0?"Showing the last "+ageDays+" days allowed by your plan.":"Showing up to 120 days. Your plan’s age limit could not be confirmed.")+" Curve checks eligibility before you start.");
        if(rows.length()==0) text("No outgoing purchases available. Already moved purchases are excluded.");
        String previous="";
        for(int i=0;i<rows.length();i++) try {
            JSONObject r=rows.getJSONObject(i); String id=r.getString("id");
            String day=Instant.parse(r.getString("date")).atZone(ZoneId.systemDefault()).toLocalDate().format(DateTimeFormatter.ofPattern("d MMM yyyy"));
            if(!day.equals(previous)) { text(day); previous=day; }
            row(id,r.getString("title"),(unavailable.containsKey(id)?unavailable.get(id)+" · ":"")+r.getString("display")+" · "+cards.getOrDefault(r.getString("source"),"Payment card"));
        } catch(JSONException e) { error.setText("Could not display a purchase."); }
        primary.setOnClickListener(v->prepareCards());
        secondary.setOnClickListener(v-> {
            if(selected.size()==rows.length()) selected.clear(); else for(int i=0;i<rows.length();i++) selected.add(rows.optJSONObject(i).optString("id"));
            for(Map.Entry<String,CompoundButton> entry:selectionChecks.entrySet()) entry.getValue().setChecked(selected.contains(entry.getKey()));
            updateSelectionButtons();
        });
        updateSelectionButtons();
    }
    private void updateSelectionButtons() {
        primary.setText("Choose card · "+selected.size()+" selected"); primary.setEnabled(!selected.isEmpty());
        secondary.setText(selected.size()==rows.length()?"Clear selection":"Select all"); secondary.setEnabled(rows.length()>0);
    }
    private final Map<String,String> unavailable=new LinkedHashMap<>();
    private final Map<String,List<JSONObject>> quotes=new LinkedHashMap<>();
    private final Map<String,Integer> supported=new LinkedHashMap<>();
    private void prepareCards() {
        description.setText("Checking selected purchases with Curve…");
        work(()-> {
            BatchCurve.account(account); quotes.clear(); supported.clear(); unavailable.clear();
            for(String c:cards.keySet()) { quotes.put(c,new ArrayList<>()); supported.put(c,0); }
            for(int i=0;i<rows.length();i++) {
                BatchCurve.checkInterrupted();
                JSONObject r=rows.getJSONObject(i); if(!selected.contains(r.getString("id"))) continue;
                Object options;
                try { options=BatchCurve.options(account,r.getString("id")); }
                catch(InterruptedException cancelled) { throw cancelled; }
                catch(java.io.IOException | TimeoutException offline) { throw offline; }
                catch(Exception e) { unavailable.put(r.getString("id"),"Unavailable: "+e.getMessage()); continue; }
                for(String c:cards.keySet()) {
                    BatchCurve.checkInterrupted();
                    try { JSONObject q=BatchCurve.quote(BatchCurve.option(options,c)); quotes.get(c).add(q); supported.put(c,supported.get(c)+1); }
                    catch(InterruptedException cancelled) { throw cancelled; }
                    catch(Exception unavailable) { quotes.get(c).add(null); }
                }
            }
        },()-> { if(unavailable.isEmpty()) renderCards(); else { renderSelection(); error.setText("Some selected purchases are unavailable. Uncheck the marked purchases, then choose a card again."); } });
    }
    private void renderCards() {
        step=2; content.removeAllViews(); description.setText("Choose one card for "+selected.size()+(selected.size()==1?" purchase.":" purchases.")+" Each purchase can only be moved once.");
        Set<String> available=new HashSet<>();
        for(String id:cards.keySet()) if(supported.getOrDefault(id,0)==selected.size()) available.add(id);
        try {
            cardCarousel=new BatchCardCarousel(this,cards,available,card,id->{ if(!busy) { card=id; updateCardSelection(); } });
        } catch(Exception e) { throw new IllegalStateException("Curve card carousel changed",e); }
        content.addView(cardCarousel,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        cardSummary=new LinearLayout(this); cardSummary.setOrientation(LinearLayout.VERTICAL); content.addView(cardSummary);
        primary.setText("Move "+selected.size()+(selected.size()==1?" purchase":" purchases")); primary.setOnClickListener(v->startBatch());
        secondary.setText("Change selection"); secondary.setOnClickListener(v->renderSelection());
        updateCardSelection();
    }
    private void updateCardSelection() {
        cardSummary.removeAllViews();
        if(card!=null && supported.getOrDefault(card,0)==selected.size()) {
            Map<String,java.math.BigDecimal> totals=new LinkedHashMap<>();
            for(JSONObject q:quotes.get(card)) try {
                JSONObject a=q.getJSONObject("charge"); String currency=a.getString("currency"); totals.put(currency,totals.getOrDefault(currency,java.math.BigDecimal.ZERO).add(java.math.BigDecimal.valueOf(a.getLong("minor"),a.getInt("exponent"))));
            } catch(JSONException e) { throw new IllegalStateException(e); }
            text(cardSummary,"Charge to "+cards.get(card)); for(Map.Entry<String,java.math.BigDecimal> t:totals.entrySet()) text(cardSummary,t.getValue().toPlainString()+" "+t.getKey());
            int n=0;
            for(int i=0;i<rows.length();i++) { JSONObject r=rows.optJSONObject(i); if(!selected.contains(r.optString("id"))) continue;
                JSONObject q=quotes.get(card).get(n++); String fees="No additional fees quoted";
                JSONArray f=q.optJSONArray("fees"); if(f.length()>0) { fees="Fees: "; for(int j=0;j<f.length();j++) fees+=BatchCurve.display(f.optJSONObject(j).optJSONObject("amount"))+" "; }
                text(cardSummary,r.optString("title")+" · "+BatchCurve.display(q.optJSONObject("charge"))+"\n"+fees);
            }
        } else text(cardSummary,"Select a card available for every selected purchase. Go back to change your selection if no card is available.");
        primary.setEnabled(card!=null && supported.getOrDefault(card,0)==selected.size());
    }
    private void startBatch() {
        try { requireEnabled(); } catch(Exception disabled) { error.setText(disabled.getMessage()); return; }
        if(Build.VERSION.SDK_INT>=33 && checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)!=PackageManager.PERMISSION_GRANTED) { requestPermissions(new String[]{Manifest.permission.POST_NOTIFICATIONS},7241); return; }
        if(!getSystemService(NotificationManager.class).areNotificationsEnabled()) { error.setText("Enable Curve notifications in Android settings to follow background progress."); return; }
        final JSONObject request;
        try {
            final String confirmedCard=card;
            JSONArray chosen=new JSONArray(); int index=0;
            for(int i=0;i<rows.length();i++) if(selected.contains(rows.getJSONObject(i).getString("id"))) chosen.put(new JSONObject(rows.getJSONObject(i).toString()).put("quote",new JSONObject(quotes.get(confirmedCard).get(index++).toString())));
            request=new JSONObject().put("id",UUID.randomUUID().toString()).put("account",account).put("card",confirmedCard).put("cardName",cards.get(confirmedCard)).put("status","ready").put("rows",chosen);
        } catch(Exception e) { error.setText("Check your selection and card again."); return; }
        NotificationChannel channel=getSystemService(NotificationManager.class).getNotificationChannel("morphe_batch_gbit");
        if(channel!=null && channel.getImportance()==NotificationManager.IMPORTANCE_NONE) { error.setText("Enable the Batch Go Back in Time notification channel in Android settings first."); return; }
        work(()-> {
            BatchCurve.account(request.getString("account"));
            synchronized(BatchGbitService.LOCK) {
                requireEnabled();
                JSONObject old=new BatchStore(this).read();
                if(BatchGbitService.running || old!=null && !BatchStore.isTerminal(old)) throw new Exception("Review the existing batch first.");
                batch=request;
                new BatchStore(this).save(batch);
            }
        },()-> {
            try { startForegroundService(new Intent(this,BatchGbitService.class).putExtra("batch",batch.getString("id"))); getIntent().putExtra(EXTRA_BATCH_ID,batch.getString("id")); step=3; renderProgress(); }
            catch(Exception e) { error.setText("Could not start background work. Reopen Batch GBIT to review."); }
        });
    }
    private void refreshProgress() {
        work(()-> { BatchCurve.account(account); JSONObject current=new BatchStore(this).recover(account,getIntent().getStringExtra(EXTRA_BATCH_ID)); BatchStore.showResults(current,getIntent().getStringExtra(EXTRA_BATCH_ID)); batch=current; },this::renderProgress);
    }
    private boolean terminalBatch() {
        try { return batch!=null && BatchStore.isTerminal(batch); }
        catch(JSONException e) { return false; }
    }
    private void updateText(TextView view,String value) {
        if(!value.contentEquals(view.getText())) view.setText(value);
    }
    private void renderProgress() {
        JSONArray r=batch.optJSONArray("rows"); String id=batch.optString("id");
        if(step!=3 || progressSummary==null || !id.equals(progressId)) {
            content.removeAllViews(); outcomeViews.clear(); progressId=id;
            progressSummary=text("");
            progressBar=new ProgressBar(this,null,android.R.attr.progressBarStyleHorizontal); content.addView(progressBar);
            progressMessage=text("");
            for(int i=0;i<r.length();i++) outcomeViews.put(r.optJSONObject(i).optString("id"),text(""));
        }
        step=3; int moved=0;
        for(int i=0;i<r.length();i++) if(r.optJSONObject(i).optString("state").equals("moved")) moved++;
        boolean active=BatchGbitService.running && !terminalBatch();
        updateText(description,active?"Moving purchases. You can leave Curve and follow the notification.":batch.optString("status").equals("complete")?"Batch complete.":"Batch paused. Review the results before continuing.");
        updateText(progressSummary,moved+" of "+r.length()+" moved to "+batch.optString("cardName"));
        progressBar.setMax(r.length()); progressBar.setProgress(moved);
        updateText(progressMessage,batch.optString("message")); progressMessage.setVisibility(batch.optString("message").isEmpty()?View.GONE:View.VISIBLE);
        for(int i=0;i<r.length();i++) { JSONObject row=r.optJSONObject(i); String s=row.optString("state"); updateText(outcomeViews.get(row.optString("id")),row.optString("title")+" · "+row.optString("display")+"\n"+(s.equals("moved")?"Moved":s.equals("inflight")?"Processing":s.equals("review")?"Needs review":s.equals("failed")?"Rejected by Curve":"Not started")); }
        primary.setText("Close"); primary.setEnabled(true); primary.setOnClickListener(v->finish());
        boolean terminal=false;
        try { terminal=BatchStore.isTerminal(batch); } catch(JSONException e) { error.setText("Could not read saved outcomes."); }
        final boolean reviewed=terminal;
        secondary.setText(active?"Stop after current transaction":reviewed?"New batch":"Refresh outcomes");
        secondary.setEnabled(!reviewed || PatchSettings.isBatchEnabled());
        secondary.setOnClickListener(v->{ if(active) startService(new Intent(this,BatchGbitService.class).setAction("stop")); else if(reviewed) newBatch(); else reconcile(); });
    }
    private void newBatch() {
        selected.clear(); card=null; getIntent().removeExtra(EXTRA_BATCH_ID); recreate();
    }
    private static void requireEnabled() throws Exception {
        if(!PatchSettings.isBatchEnabled()) throw new Exception("Batch GBIT is turned off. Enable it in Patches to start a new batch.");
    }
    private void reconcile() {
        work(()-> {
            BatchCurve.account(account); List<?> fresh=BatchCurve.history();
            synchronized(BatchGbitService.LOCK) {
            if(BatchGbitService.running) throw new Exception("The batch is still running.");
            JSONObject current=new BatchStore(this).recover(account,getIntent().getStringExtra(EXTRA_BATCH_ID));
            BatchStore.showResults(current,getIntent().getStringExtra(EXTRA_BATCH_ID)); batch=current; JSONArray r=batch.getJSONArray("rows");
            for(int i=0;i<r.length();i++) {
                JSONObject row=r.getJSONObject(i); if(!row.getString("state").equals("review")) continue;
                for(Object tx:fresh) if(row.getString("id").equals(BatchCurve.call(tx,"getId")) && BatchCurve.call(tx,"getGbitDate")!=null && batch.getString("card").equals(BatchCurve.call(tx,"getCardId"))) row.put("state","moved");
            }
            if(BatchStore.unresolved(batch)) batch.put("message","Some outcomes remain uncertain. Check these purchases in Curve before attempting another move. Refresh again after their status updates.");
            else {
                boolean complete=true;
                for(int i=0;i<r.length();i++) if(!r.getJSONObject(i).getString("state").equals("moved")) complete=false;
                batch.put("status",complete?"complete":"archived").put("message","Confirmed moves are saved. Start a new batch to select any remaining purchases.");
            }
            new BatchStore(this).save(batch);
            }
        },this::renderProgress);
    }
    private void back() { if(busy) { finish(); return; } if(step==2) renderSelection(); else finish(); }
    @Override protected void onResume() { super.onResume(); if(step==3 && !busy) refreshProgress(); main.postDelayed(poll,1500); }
    @Override protected void onPause() { main.removeCallbacks(poll); super.onPause(); }
    @Override protected void onDestroy() { main.removeCallbacks(poll); io.shutdownNow(); super.onDestroy(); }
    @Override public void onSaveInstanceState(Bundle out) { super.onSaveInstanceState(out); out.putStringArrayList("selection",new ArrayList<>(selected)); }
}
