package app.template.extension.extension;



import android.app.Activity;

import android.app.AlertDialog;
import android.app.ProgressDialog;

import android.content.Intent;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.net.Uri;

import android.graphics.Color;

import android.graphics.Typeface;

import android.graphics.drawable.GradientDrawable;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;



import android.view.Gravity;

import android.view.View;

import android.view.ViewGroup;

import android.widget.LinearLayout;
import android.widget.FrameLayout;

import android.widget.PopupMenu;

import android.widget.ScrollView;

import android.widget.TextView;

import java.util.ArrayList;

import java.util.Collections;



/** Manage saved printer data and open diagnostics. */

public final class CacheSettingsActivity extends Activity {

    private static final int NAVY=0xff182a43, TEAL=0xff00796c, TEXT=0xff212121, MUTED=0xff666666;

    private LinearLayout root;
    private ProgressDialog replayProgress;private AlertDialog replayResult;private boolean replayVisible;
    private final Handler replayHandler=new Handler(Looper.getMainLooper());
    private final ReplayController.Listener replayListener=()->replayHandler.post(this::showReplayState);
    private final Runnable historyListener=()->replayHandler.post(()->{if(replayVisible&&!isFinishing()&&!isDestroyed())render();});

    /** Draw a clear line over the full width of the old value. */
    private static final class StrongStrikeSpan extends android.text.style.ReplacementSpan {
        @Override public int getSize(android.graphics.Paint paint,CharSequence text,int start,int end,android.graphics.Paint.FontMetricsInt fm){return (int)Math.ceil(paint.measureText(text,start,end));}
        @Override public void draw(android.graphics.Canvas canvas,CharSequence text,int start,int end,float x,int top,int y,int bottom,android.graphics.Paint paint){
            canvas.drawText(text,start,end,x,y,paint);float width=paint.measureText(text,start,end),old=paint.getStrokeWidth();
            paint.setStrokeWidth(Math.max(2f,paint.getTextSize()/10f));canvas.drawLine(x,y-paint.getTextSize()*0.32f,x+width,y-paint.getTextSize()*0.32f,paint);paint.setStrokeWidth(old);
        }
    }

    private static final class CacheBar extends View {
        private final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);private int hits,misses;
        CacheBar(android.content.Context context){super(context);}
        void setCounts(int hits,int misses){this.hits=hits;this.misses=misses;invalidate();}
        @Override protected void onDraw(android.graphics.Canvas canvas){super.onDraw(canvas);int total=hits+misses;if(total<=0)return;float width=getWidth(),height=getHeight(),split=width*hits/total,gap=hits>0&&misses>0?Math.min(height/4f,dpGap()):0f;
            if(hits>0){paint.setColor(0xff1aac7a);canvas.drawRoundRect(0,0,Math.max(0,split-gap/2),height,height/2,height/2,paint);}
            if(misses>0){paint.setColor(0xff9d9c96);canvas.drawRoundRect(Math.min(width,split+gap/2),0,width,height,height/2,height/2,paint);}}
        private float dpGap(){return 2f*getResources().getDisplayMetrics().density;}
    }

    private int dp(float value){return (int)(value*getResources().getDisplayMetrics().density+0.5f);}

    private TextView text(String value,int size,int color){TextView t=new TextView(this);t.setText(value);t.setTextSize(size);t.setTextColor(color);return t;}

    private GradientDrawable rounded(int fill,int stroke,int radius){GradientDrawable d=new GradientDrawable();d.setColor(fill);d.setCornerRadius(dp(radius));if(stroke!=0)d.setStroke(dp(1),stroke);return d;}

    @Override public void onCreate(Bundle state){super.onCreate(state);AutoCache.init(getApplicationContext());render();}

    @Override public void onResume(){super.onResume();replayVisible=true;ReplayController.attach(replayListener);HistoryRuntime.addListener(historyListener);if(root!=null)render();showReplayState();}
    @Override public void onPause(){replayVisible=false;ReplayController.detach(replayListener);HistoryRuntime.removeListener(historyListener);if(replayProgress!=null){replayProgress.dismiss();replayProgress=null;}if(replayResult!=null){replayResult.dismiss();replayResult=null;}super.onPause();}

    private void clearPrinter(String ip){new AlertDialog.Builder(this).setTitle("Clear saved printer data?").setMessage("Saved responses and comparison times will be removed. With the cache on, new replies are learned immediately and may be reused during the same preview. Turn the cache off in settings to use only live replies.\n\nExisting diagnostic recordings are kept separately.").setNegativeButton("Cancel",null).setPositiveButton("Clear",(d,w)->{if(!AutoCache.clearPrinter(ip))showClearFailure();render();}).show();}

    private void clearAll(){new AlertDialog.Builder(this).setTitle("Clear all saved printers?").setMessage("Saved responses and comparison times will be removed. With the cache on, new replies are learned immediately and may be reused during the same preview. Turn the cache off in settings to use only live replies.\n\nExisting diagnostic recordings are kept separately.").setNegativeButton("Cancel",null).setPositiveButton("Clear all",(d,w)->{if(!AutoCache.clearAll())showClearFailure();render();}).show();}
    private void showClearFailure(){new AlertDialog.Builder(this).setTitle("Unable to clear saved data").setMessage("Please try again.").setPositiveButton("OK",null).show();}

    private void openFixExplanation(){try{startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://github.com/pholcroft/brother-morphe-patches#how-it-works-and-limitations")));}catch(ActivityNotFoundException e){new AlertDialog.Builder(this).setTitle("Unable to open link").setMessage("No app is available to open the GitHub page.").setPositiveButton("OK",null).show();}}
    private void replay(ActivityBurst burst){
        if(ReplayController.isRunning()){showReplayState();return;}
        if(burst==null||!burst.coverage.requestsComplete){new AlertDialog.Builder(this).setTitle("No complete activity recorded").setMessage("Open a print preview and wait for the options to load, then try again.").setPositiveButton("OK",null).show();return;}
        HistoryRuntime.startReplay(burst.ref,error->replayHandler.post(()->{if(isFinishing()||isDestroyed())return;if(error!=null)new AlertDialog.Builder(this).setTitle("Unable to replay").setMessage(error).setPositiveButton("OK",null).show();else showReplayState();}));
    }
    private void showReplayState(){
        if(!replayVisible||isFinishing()||isDestroyed())return;
        if(ReplayController.isRunning()){
            if(replayProgress==null){replayProgress=new ProgressDialog(this);replayProgress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);replayProgress.setCancelable(false);replayProgress.setButton(DialogInterface.BUTTON_NEGATIVE,"Cancel",(d,w)->{});replayProgress.show();replayProgress.getButton(DialogInterface.BUTTON_NEGATIVE).setOnClickListener(v->{ReplayController.cancel();replayProgress.setMessage("Cancelling...");replayProgress.getButton(DialogInterface.BUTTON_NEGATIVE).setEnabled(false);});}replayProgress.setMax(ReplayController.total());replayProgress.setProgress(ReplayController.completed());if(replayProgress.getButton(DialogInterface.BUTTON_NEGATIVE).isEnabled())replayProgress.setMessage(ReplayController.checkingPrinter()?"Checking printer...":"Replaying printer requests...");return;
        }
        if(replayProgress!=null){replayProgress.dismiss();replayProgress=null;}
        ReplayController.Outcome outcome=ReplayController.peekOutcome();if(outcome==null||replayResult!=null)return;
        AlertDialog.Builder dialog=new AlertDialog.Builder(this).setCancelable(false);
        if(outcome.error!=null)dialog.setTitle("Unable to replay").setMessage(outcome.error);
        else{ReplayEngine.Result result=outcome.result;String summary=(outcome.sequence>0?"Burst #"+outcome.sequence+"\n":"")+String.format(java.util.Locale.ROOT,"Replay time: %.2f s\nRequests replayed: %d\nChanged responses: %d",result.elapsedMs/1000.0,result.completed,result.changes.size());int routine=0;for(ReplayEngine.Change c:result.changes)if(ReplayEngine.isRoutine(c.oid))routine++;if(routine>0)summary+="\nIncludes "+routine+" normally changing uptime value(s)";if(result.uncached>0||result.unsupported>0)summary+="\nNot compared: "+(result.uncached+result.unsupported)+" requests without comparable responses";summary+="\n\nSingle-object SNMP requests were replayed in the order observed by the service. The identity check is excluded from the time. Cached data was not changed.";dialog.setTitle("Uncached replay result").setMessage(summary);if(!result.changes.isEmpty())dialog.setNeutralButton("View differences",(d,w)->{ReplayController.clearOutcome(outcome);replayResult=null;ReplayDiffActivity.setChanges(result.changes);startActivity(new Intent(this,ReplayDiffActivity.class));});}
        dialog.setPositiveButton("Close",(d,w)->{ReplayController.clearOutcome(outcome);replayResult=null;});replayResult=dialog.create();replayResult.show();
    }
    private void printerMenu(View anchor,String ip,ActivityBurst burst){

        PopupMenu menu=new PopupMenu(this,anchor);





        menu.getMenu().add("Measure without cache");
        menu.getMenu().add("Activity history");


        menu.getMenu().add("Clear saved data");

        menu.setOnMenuItemClickListener(item->{

            if(item.getTitle().equals("Measure without cache")){replay(burst);return true;}
            if(item.getTitle().equals("Activity history")){Intent intent=new Intent(this,ActivityHistoryActivity.class);intent.putExtra("printer_ip",ip);intent.putExtra("printer_mac",AutoCache.readString("mac|"+ip,""));startActivity(intent);return true;}

            if(item.getTitle().equals("Clear saved data")){clearPrinter(ip);return true;}

            return false;

        });

        menu.show();

    }

    private View printerCard(String ip){
        final ActivityBurst[] shown={null};
        LinearLayout card=new LinearLayout(this);card.setOrientation(LinearLayout.VERTICAL);card.setPadding(dp(16),dp(14),dp(8),dp(14));card.setBackground(rounded(Color.WHITE,0xffd1d5d8,10));
        LinearLayout header=new LinearLayout(this);header.setOrientation(LinearLayout.HORIZONTAL);header.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout details=new LinearLayout(this);details.setOrientation(LinearLayout.VERTICAL);
        TextView name=text(AutoCache.printerName(ip),17,TEXT);name.setTypeface(null,Typeface.BOLD);details.addView(name);
        String savedMac=AutoCache.readString("mac|"+ip,"");
        TextView address=text(ip+(savedMac.isEmpty()?"":"  ·  "+savedMac)+(AutoCache.hasChangedAddress(ip)?" · Address changed":""),12,MUTED);address.setPadding(0,dp(5),0,0);details.addView(address);
        HistoryRuntime.loadHistory(ip,savedMac,(printer,bursts,error)->replayHandler.post(()->{if(printer!=null&&printer.name!=null&&!printer.name.isEmpty()&&name.isAttachedToWindow())name.setText(printer.name);}));
        header.addView(details,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));
        TextView menu=text("⋮",24,TEXT);menu.setGravity(Gravity.CENTER);menu.setContentDescription("Printer options for "+ip);menu.setOnClickListener(v->printerMenu(v,ip,shown[0]));header.addView(menu,new LinearLayout.LayoutParams(dp(48),dp(48)));card.addView(header);
        LinearLayout activity=new LinearLayout(this);activity.setOrientation(LinearLayout.VERTICAL);activity.setPadding(0,dp(14),dp(8),0);card.addView(activity);
        TextView headline=text("Loading activity...",18,TEXT);activity.addView(headline);
        TextView label=text("",14,MUTED);label.setPadding(0,dp(4),0,0);activity.addView(label);
        TextView comparison=text("",16,TEXT);comparison.setPadding(0,dp(12),0,0);activity.addView(comparison);
        LinearLayout counts=new LinearLayout(this);counts.setOrientation(LinearLayout.HORIZONTAL);counts.setPadding(0,dp(16),0,0);activity.addView(counts);
        LinearLayout hitColumn=new LinearLayout(this);hitColumn.setOrientation(LinearLayout.VERTICAL);hitColumn.setPadding(dp(12),dp(10),dp(12),dp(10));hitColumn.setBackground(rounded(0xfff1f1f1,0,8));LinearLayout.LayoutParams hitParams=new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1);hitParams.rightMargin=dp(5);counts.addView(hitColumn,hitParams);
        LinearLayout hitHeading=new LinearLayout(this);hitHeading.setGravity(Gravity.CENTER_VERTICAL);hitColumn.addView(hitHeading);View hitDot=new View(this);hitDot.setBackground(rounded(0xff1aac7a,0,2));LinearLayout.LayoutParams dotParams=new LinearLayout.LayoutParams(dp(10),dp(10));dotParams.rightMargin=dp(6);hitHeading.addView(hitDot,dotParams);
        TextView hitLabel=text("Cache hits",13,MUTED),hitCount=text("-",26,TEXT);hitCount.setTypeface(null,Typeface.BOLD);hitHeading.addView(hitLabel);hitColumn.addView(hitCount);
        LinearLayout liveColumn=new LinearLayout(this);liveColumn.setOrientation(LinearLayout.VERTICAL);liveColumn.setPadding(dp(12),dp(10),dp(12),dp(10));liveColumn.setBackground(rounded(0xfff1f1f1,0,8));LinearLayout.LayoutParams liveParams=new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1);liveParams.leftMargin=dp(5);counts.addView(liveColumn,liveParams);
        LinearLayout liveHeading=new LinearLayout(this);liveHeading.setGravity(Gravity.CENTER_VERTICAL);liveColumn.addView(liveHeading);View liveDot=new View(this);liveDot.setBackground(rounded(0xff9d9c96,0,2));LinearLayout.LayoutParams liveDotParams=new LinearLayout.LayoutParams(dp(10),dp(10));liveDotParams.rightMargin=dp(6);liveHeading.addView(liveDot,liveDotParams);
        TextView liveLabel=text("Misses",13,MUTED),liveCount=text("-",26,TEXT);liveCount.setTypeface(null,Typeface.BOLD);liveHeading.addView(liveLabel);liveColumn.addView(liveCount);
        CacheBar bar=new CacheBar(this);LinearLayout.LayoutParams barParams=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,dp(9));barParams.topMargin=dp(12);activity.addView(bar,barParams);
        TextView ratio=text("",13,MUTED);ratio.setPadding(0,dp(5),0,0);activity.addView(ratio);
        counts.setVisibility(View.GONE);bar.setVisibility(View.GONE);ratio.setVisibility(View.GONE);
        Runnable load=()->{long generation=AutoCache.generation();HistoryRuntime.loadLatest(ip,AutoCache.readString("mac|"+ip,""),(burst,error)->replayHandler.post(()->{
            if(isFinishing()||isDestroyed()||generation!=AutoCache.generation()||!activity.isAttachedToWindow())return;shown[0]=burst;
            if(error!=null||burst==null){headline.setText(error==null?"No activity recorded":"Activity unavailable");label.setText("");comparison.setText("");counts.setVisibility(View.GONE);bar.setVisibility(View.GONE);ratio.setVisibility(View.GONE);return;}
            BurstSummary.Metrics metrics=BurstSummary.calculate(burst);headline.setTypeface(metrics.complete?Typeface.SERIF:Typeface.DEFAULT);headline.setTextSize(metrics.complete?48:18);headline.setText(metrics.headline());label.setText(metrics.complete?"saved on "+(metrics.hits+metrics.misses)+" requests":"");String comparisonText=metrics.comparison();android.text.SpannableString styled=new android.text.SpannableString(comparisonText);int arrow=comparisonText.indexOf(" → ");if(metrics.complete&&arrow>0)styled.setSpan(new StrongStrikeSpan(),0,arrow,android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);comparison.setText(styled);hitCount.setText(Integer.toString(metrics.hits));liveCount.setText(Integer.toString(metrics.misses));counts.setVisibility(View.VISIBLE);int percent=metrics.cachePercent();if(percent>=0){bar.setCounts(metrics.hits,metrics.misses);bar.setContentDescription(percent+"% of requests served from cache");bar.setVisibility(View.VISIBLE);ratio.setText(percent+"% of requests served from cache");ratio.setVisibility(View.VISIBLE);}else{bar.setVisibility(View.GONE);ratio.setVisibility(View.GONE);}
        }));};
        activity.post(load);activity.postDelayed(load,3500);
        return card;
    }
    private void render(){

        root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(NAVY);

        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);

        root.setOnApplyWindowInsetsListener((v,i)->{v.setPadding(i.getSystemWindowInsetLeft(),i.getSystemWindowInsetTop(),i.getSystemWindowInsetRight(),i.getSystemWindowInsetBottom());return i.consumeSystemWindowInsets();});

        LinearLayout header=new LinearLayout(this);header.setGravity(Gravity.CENTER_VERTICAL);header.setBackgroundColor(NAVY);

        TextView back=text("\u2039",32,Color.WHITE);back.setGravity(Gravity.CENTER);back.setContentDescription("Back");back.setOnClickListener(v->finish());header.addView(back,new LinearLayout.LayoutParams(dp(56),dp(56)));

        TextView title=text("Saved printer data",20,Color.WHITE);title.setTypeface(null,Typeface.BOLD);header.addView(title);root.addView(header);

        ScrollView scroll=new ScrollView(this);scroll.setFillViewport(true);scroll.setBackgroundColor(Color.WHITE);

        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);content.setPadding(dp(16),dp(24),dp(16),dp(20));scroll.addView(content,new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));

        if(!HistoryRuntime.isReady()&&HistoryRuntime.failure()!=null){TextView warning=text("Printer cache is temporarily unavailable. It will retry automatically.",14,MUTED);warning.setPadding(0,0,0,dp(16));content.addView(warning);}
        ArrayList<String> printers=new ArrayList<>(AutoCache.printers());Collections.sort(printers);

        if(printers.isEmpty()){TextView empty=text("No saved printers yet. Open a print preview to start saving responses.",15,MUTED);empty.setPadding(0,0,0,dp(16));content.addView(empty);}

        for(String ip:printers){LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT);params.bottomMargin=dp(12);content.addView(printerCard(ip),params);}


        View separator=new View(this);separator.setBackgroundColor(0xffdadde0);LinearLayout.LayoutParams line=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,dp(1));line.topMargin=dp(20);content.addView(separator,line);

        LinearLayout diagnostics=new LinearLayout(this);diagnostics.setGravity(Gravity.CENTER_VERTICAL);diagnostics.setPadding(0,dp(18),0,dp(18));diagnostics.setContentDescription("Diagnostics: record requests and export CSV");diagnostics.setOnClickListener(v->startActivity(new Intent(this,DiagnosticsActivity.class)));

        LinearLayout labels=new LinearLayout(this);labels.setOrientation(LinearLayout.VERTICAL);TextView dtitle=text("Diagnostics",17,TEXT);dtitle.setTypeface(null,Typeface.BOLD);labels.addView(dtitle);TextView sub=text("Record requests and export CSV",14,MUTED);sub.setPadding(0,dp(3),0,0);labels.addView(sub);diagnostics.addView(labels,new LinearLayout.LayoutParams(0,ViewGroup.LayoutParams.WRAP_CONTENT,1));TextView arrow=text("\u203a",26,TEXT);diagnostics.addView(arrow);content.addView(diagnostics);

        View bottomLine=new View(this);bottomLine.setBackgroundColor(0xffdadde0);content.addView(bottomLine,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,dp(1)));

        root.addView(scroll,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,0,1));

        LinearLayout footer=new LinearLayout(this);footer.setOrientation(LinearLayout.HORIZONTAL);footer.setGravity(Gravity.CENTER_VERTICAL);footer.setBackgroundColor(Color.WHITE);
        if(!printers.isEmpty()){TextView all=text("Clear all saved printers",15,TEAL);all.setTypeface(null,Typeface.BOLD);all.setGravity(Gravity.CENTER_VERTICAL);all.setPadding(dp(24),0,dp(8),0);all.setOnClickListener(v->clearAll());footer.addView(all,new LinearLayout.LayoutParams(0,dp(56),1));}else footer.addView(new View(this),new LinearLayout.LayoutParams(0,dp(56),1));
        FrameLayout infoTouch=new FrameLayout(this);infoTouch.setContentDescription("What is this fix?");infoTouch.setOnClickListener(v->openFixExplanation());
        TextView info=text("i",12,MUTED);info.setTypeface(null,Typeface.BOLD);info.setGravity(Gravity.CENTER);info.setBackground(rounded(Color.WHITE,0xff999999,20));FrameLayout.LayoutParams iconParams=new FrameLayout.LayoutParams(dp(18),dp(18),Gravity.CENTER);infoTouch.addView(info,iconParams);footer.addView(infoTouch,new LinearLayout.LayoutParams(dp(48),dp(56)));root.addView(footer);


        setContentView(root);

    }

}


