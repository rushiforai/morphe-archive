package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.ColorStateList;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.DownloadRequest;

import java.util.List;

/** Live, durable-job progress presentation matching Afterglow's download flow. */
final class DownloadProgressSheet implements DownloadManager.Listener {
    // Leave a quiet interval for accessibility and keep rapid transfer callbacks off the view tree.
    private static final long PROGRESS_UPDATE_MS=1250;
    private final Activity activity;
    private final String jobId;
    private final DownloadManager manager;
    private final VaultViews views;
    private final Dialog dialog;
    private final TextView title, phase, subtitle, error;
    private final ProgressBar progress;
    private final LinearLayout actions;
    private final ImageView thumbnail;
    private long lastBytes, lastSample;
    private double speed;
    private boolean delivering;
    private boolean automaticDeliveryAttempted;
    private boolean renderPending, disposed;
    private long lastRender;
    private DownloadJob.State renderedState;
    private DownloadJob.Phase renderedPhase;
    private String renderedError="", actionState="";
    private final Runnable renderTask=()->{renderPending=false;if(!disposed&&dialogShowing())render();};

    static void show(Activity activity,String jobId) { new DownloadProgressSheet(activity,jobId).show(); }
    private DownloadProgressSheet(Activity activity,String jobId) {
        this.activity=activity;this.jobId=jobId;manager=DownloadManager.get(activity);views=new VaultViews(activity);
        LinearLayout content=views.column();views.pad(content,24,4,24,4);
        thumbnail=new ImageView(activity);thumbnail.setBackground(views.rounded(views.muted,12));thumbnail.setClipToOutline(true);
        thumbnail.setImageDrawable(new VaultViews.Icon("video",views.secondary));
        LinearLayout.LayoutParams imageParams=new LinearLayout.LayoutParams(-1,views.dp(150));content.addView(thumbnail,imageParams);
        views.gap(content,16);title=views.label("Download",18,true);title.setGravity(Gravity.CENTER);title.setMaxLines(2);content.addView(title);
        views.gap(content,16);phase=views.text("Queued",14,views.text,true);phase.setGravity(Gravity.CENTER);content.addView(phase);
        subtitle=views.text("",12,views.secondary,false);subtitle.setGravity(Gravity.CENTER);views.pad(subtitle,0,4,0,0);content.addView(subtitle);
        views.gap(content,16);progress=new ProgressBar(activity,null,android.R.attr.progressBarStyleHorizontal);progress.setMax(1000);progress.setProgressTintList(ColorStateList.valueOf(views.accent));content.addView(progress,new LinearLayout.LayoutParams(-1,views.dp(7)));
        error=views.text("",13,views.secondary,false);error.setGravity(Gravity.CENTER);views.pad(error,0,12,0,0);content.addView(error);
        views.gap(content,14);actions=views.row();actions.setGravity(Gravity.CENTER);content.addView(actions);
        dialog=views.sheet(content);dialog.setOnDismissListener(d->dispose());
        content.addOnAttachStateChangeListener(new android.view.View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(android.view.View v){}
            public void onViewDetachedFromWindow(android.view.View v){dispose();}
        });
    }
    private void show() {manager.addListener(this);dialog.show();render();}
    private boolean dialogShowing(){return dialog!=null&&dialog.isShowing();}
    private void dispose(){disposed=true;VaultViews.MAIN.removeCallbacks(renderTask);renderPending=false;manager.removeListener(this);}
    @Override public void onDownloadsChanged() {VaultViews.MAIN.post(this::scheduleRender);}
    private void scheduleRender(){
        if(disposed||!dialogShowing())return;
        DownloadJob selected=null;for(DownloadJob job:manager.snapshot())if(job.id.equals(jobId)){selected=job;break;}
        boolean changed=selected==null?!"UNAVAILABLE".equals(actionState)
                :selected.state!=renderedState||selected.phase!=renderedPhase
                ||!VaultViews.value(selected.errorMessage,"").equals(renderedError);
        if(renderPending&&!changed)return;
        VaultViews.MAIN.removeCallbacks(renderTask);renderPending=true;
        long wait=changed?0:Math.max(0,PROGRESS_UPDATE_MS-(android.os.SystemClock.elapsedRealtime()-lastRender));
        VaultViews.MAIN.postDelayed(renderTask,wait);
    }
    private void render() {
        if(activity.isFinishing()||activity.isDestroyed()){dialog.dismiss();return;}
        lastRender=android.os.SystemClock.elapsedRealtime();
        List<DownloadJob> jobs=manager.snapshot();DownloadJob selected=null;int queueCount=0,position=0;
        for(DownloadJob job:jobs){if(!terminal(job)){queueCount++;if(job.id.equals(jobId))position=queueCount;}if(job.id.equals(jobId))selected=job;}
        if(selected==null){
            setText(phase,"Download unavailable");setText(subtitle,"");setText(error,"This job is no longer in the queue.");setVisible(error,true);setProgress(false,0);
            if(!"UNAVAILABLE".equals(actionState)){actionState="UNAVAILABLE";actions.removeAllViews();addAction("Close",dialog::dismiss);dialog.setCancelable(true);dialog.setCanceledOnTouchOutside(true);}
            renderedState=null;renderedPhase=null;renderedError="";return;
        }
        final DownloadJob job=selected;setText(title,VaultViews.value(job.request.title,job.request.videoId));
        String thumbnailUrl=job.request.thumbnailUrl;if(thumbnailUrl!=null&&!thumbnailUrl.equals(thumbnail.getTag()))views.thumbnail(thumbnail,thumbnailUrl);
        String state=job.state.name();String prefix=queueCount>1&&position>0?position+" of "+queueCount+" · ":"";
        setText(phase,job.state==DownloadJob.State.WAITING_FOR_DELIVERY?"Saved to Afterglow Vault":prefix+phaseText(job));
        boolean running="RUNNING".equals(state);boolean complete="SUCCEEDED".equals(state);
        boolean saved=complete||job.state==DownloadJob.State.WAITING_FOR_DELIVERY;
        setProgress(!saved&&running&&(job.totalBytes<=0||job.progress<0),saved?1000:(int)Math.round(Math.max(0,Math.min(1,job.progress))*1000));
        long now=android.os.SystemClock.elapsedRealtime();
        if(job.state!=renderedState||job.phase!=renderedPhase||job.bytesTransferred<lastBytes){lastSample=now;lastBytes=job.bytesTransferred;speed=0;}
        else if(running&&lastSample>0&&now-lastSample>=500&&job.bytesTransferred>=lastBytes)speed=(job.bytesTransferred-lastBytes)*1000d/(now-lastSample);
        if(lastSample==0||now-lastSample>=500){lastBytes=job.bytesTransferred;lastSample=now;}
        String detail=job.totalBytes>0?VaultViews.bytes(job.bytesTransferred)+" / "+VaultViews.bytes(job.totalBytes):VaultViews.bytes(job.bytesTransferred);
        if(running&&speed>0){detail+=" · "+VaultViews.bytes((long)speed)+"/s";if(job.totalBytes>job.bytesTransferred)detail+=" · "+VaultViews.duration((long)((job.totalBytes-job.bytesTransferred)/speed*1000))+" left";}
        setText(subtitle,detail);renderedError=VaultViews.value(job.errorMessage,"");setText(error,renderedError);setVisible(error,!renderedError.isEmpty());
        renderedState=job.state;renderedPhase=job.phase;
        String controls=state+(job.state==DownloadJob.State.WAITING_FOR_DELIVERY?":"+job.request.kind:"");
        if(!controls.equals(actionState)){
            actionState=controls;actions.removeAllViews();
            if("WAITING_FOR_DELIVERY".equals(state)) {
                addAction(DownloadUiPolicy.exportLabel(job.request.kind),()->deliver(DownloadRequest.PostAction.SAVE_TO_GALLERY));
                addAction("Share",()->deliver(DownloadRequest.PostAction.SHARE));
                addAction("Keep in Vault",()->deliver(DownloadRequest.PostAction.KEEP));
            } else {
                if("PAUSED".equals(state))addAction("Resume",()->action(()->manager.resume(jobId)));
                else if("RUNNING".equals(state)||"QUEUED".equals(state))addAction("Pause",()->action(()->manager.pause(jobId)));
                else if("FAILED".equals(state)||"CANCELLED".equals(state))addAction("Retry",()->action(()->manager.retry(jobId)));
                if(complete)addAction("Open Vault",()->{dialog.dismiss();DownloadsUi.openVault(activity);});
                if(terminal(job))addAction("Close",dialog::dismiss);
                else addAction("Cancel",()->action(()->manager.cancel(jobId)));
            }
            boolean dismissible=terminal(job)||job.state==DownloadJob.State.WAITING_FOR_DELIVERY;
            dialog.setCancelable(dismissible);dialog.setCanceledOnTouchOutside(dismissible);setActionsEnabled(!delivering);
        }
        if("WAITING_FOR_DELIVERY".equals(state)) {
            if(!automaticDeliveryAttempted&&(job.request.postAction==DownloadRequest.PostAction.SHARE||job.request.postAction==DownloadRequest.PostAction.SAVE_TO_GALLERY)) {
                automaticDeliveryAttempted=true;deliver(job.request.postAction);
            }
        }
    }
    private static void setText(TextView view,String text){if(!text.contentEquals(view.getText()))view.setText(text);}
    private static void setVisible(android.view.View view,boolean visible){int state=visible?android.view.View.VISIBLE:android.view.View.GONE;if(view.getVisibility()!=state)view.setVisibility(state);}
    private void setProgress(boolean indeterminate,int value){if(progress.isIndeterminate()!=indeterminate)progress.setIndeterminate(indeterminate);if(progress.getProgress()!=value)progress.setProgress(value);}
    private void setActionsEnabled(boolean enabled){for(int i=0;i<actions.getChildCount();i++)if(actions.getChildAt(i).isEnabled()!=enabled)actions.getChildAt(i).setEnabled(enabled);}
    private void addAction(String title,Runnable action){TextView button=views.button(title,action);LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,views.dp(44),1);lp.leftMargin=views.dp(4);lp.rightMargin=views.dp(4);actions.addView(button,lp);}
    private void action(Runnable action){DownloadsUi.run(activity,()->action.run());}
    private void deliver(DownloadRequest.PostAction action){
        if(delivering)return;delivering=true;setActionsEnabled(false);
        manager.deliver(jobId,action,(item,message)->{
            delivering=false;setActionsEnabled(true);
            if(message!=null&&!message.isEmpty()) {DownloadsUi.alert(activity,"After download",message);return;}
            if(action==DownloadRequest.PostAction.SHARE&&item!=null&&DownloadsUi.alive(activity)) {
                if(DownloadsUi.launchShare(activity,item))DownloadsUi.run(activity,()->manager.finishDelivery(jobId));
            }
        });
    }
    static boolean terminal(DownloadJob job){String s=job.state.name();return "SUCCEEDED".equals(s)||"FAILED".equals(s)||"CANCELLED".equals(s);}
    static String phaseText(DownloadJob job){
        switch(job.state.name()){
            case "SUCCEEDED":return "Done";case "FAILED":return "Download failed";case "CANCELLED":return "Cancelled";case "PAUSED":return "Paused";case "QUEUED":return "Queued";
        }
        String phase=job.phase.name();String label;
        switch(phase){
            case "RESOLVING":case "PREPARING":case "METADATA":label="Preparing metadata…";break;
            case "EXTRACTION":case "REFRESHING":label="Refreshing download links…";break;
            case "VIDEO_TRANSFER":case "VIDEO":case "DOWNLOADING_VIDEO":label="Downloading video";break;
            case "AUDIO_TRANSFER":case "AUDIO":case "DOWNLOADING_AUDIO":label="Downloading audio";break;
            case "CAPTIONS_TRANSFER":case "CAPTIONS":case "DOWNLOADING_CAPTIONS":label="Downloading captions";break;
            case "THUMBNAIL_TRANSFER":case "THUMBNAIL":case "DOWNLOADING_THUMBNAIL":label="Downloading thumbnail";break;
            case "MUX":case "MUXING":label="Muxing";break;
            case "LIBRARY_MOVE":case "SAVING":case "COMMITTING":label="Saving to Afterglow Vault…";break;
            case "SHARE":label="Waiting for sharing…";break;
            default:label="Downloading";
        }
        return job.progress>0&&job.progress<1?label+" — "+Math.round(job.progress*100)+"%":label;
    }
}
