package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Dialog;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import app.afterglow.extension.downloads.DownloadCatalog;
import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.DownloadRequest;
import app.afterglow.extension.settings.AfterglowPrefs;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/** Two rows of three actions and the compact 58dp picker from the iOS download flow. */
final class DownloadSheet implements DownloadManager.Listener {
    private final Activity activity;
    private final DownloadRequest seed;
    private final DownloadManager manager;
    private final VaultViews views;
    private final LinearLayout content;
    private final Dialog dialog;
    private DownloadCatalog catalog;
    private String error;
    private boolean loading=true;

    static void show(Activity activity,DownloadRequest request){new DownloadSheet(activity,request).show();}
    private DownloadSheet(Activity activity,DownloadRequest request){
        this.activity=activity;seed=request;manager=DownloadManager.get(activity);views=new VaultViews(activity);
        content=views.column();views.pad(content,16,0,16,0);dialog=views.sheet(content);dialog.setOnDismissListener(d->manager.removeListener(this));build();
        content.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View v){}
            public void onViewDetachedFromWindow(View v){manager.removeListener(DownloadSheet.this);}
        });
    }
    private void show(){manager.addListener(this);dialog.show();load();}
    private void load(){
        loading=true;error=null;build();
        manager.inspect(seed.videoId,(result,message)->{
            if(!dialog.isShowing()||!DownloadsUi.alive(activity))return;
            loading=false;catalog=result;error=message;build();
        });
    }
    @Override public void onDownloadsChanged(){VaultViews.MAIN.post(()->{if(dialog.isShowing())build();});}
    private void build(){
        content.removeAllViews();
        String channel=catalog==null?seed.channelName:catalog.channelName;
        String title=catalog==null?seed.title:catalog.title;
        TextView channelView=views.text(VaultViews.value(channel,""),13,views.secondary,true);views.pad(channelView,4,0,4,0);content.addView(channelView);
        TextView titleView=views.label(VaultViews.value(title,seed.videoId),17,false);titleView.setMaxLines(2);views.pad(titleView,4,2,4,0);content.addView(titleView);
        int queued=0;for(DownloadJob job:manager.snapshot())if(!job.isTerminal())queued++;
        TextView status=views.text(loading?"Loading formats…":queued>0?queued+(queued==1?" download active or queued":" downloads active or queued"):"",12,views.accent,true);
        views.pad(status,4,6,4,0);status.setMinHeight(views.dp(22));if(queued>0)status.setOnClickListener(v->{dialog.dismiss();DownloadsUi.openVault(activity);});content.addView(status);
        views.gap(content,12);
        String[] titles={"Video","Audio","Captions","Thumbnail","Details","Open In…"};String[] symbols={"video","audio","captions","thumbnail","details","external"};
        for(int row=0;row<2;row++){
            LinearLayout line=views.row();for(int col=0;col<3;col++){
                int action=row*3+col;boolean enabled=action>=4||!options(action).isEmpty();
                String chip=action==1&&catalog!=null&&!catalog.audio.isEmpty()&&catalog.audio.get(0).estimatedBytes>0
                        ?VaultViews.bytes(catalog.audio.get(0).estimatedBytes):null;
                View tile=tile(titles[action],symbols[action],chip,enabled,()->choose(action));
                LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(0,views.dp(100),1);if(col>0)lp.leftMargin=views.dp(10);line.addView(tile,lp);
            }content.addView(line);if(row==0)views.gap(content,10);
        }
        String unavailable=error;
        if(!loading&&catalog!=null&&catalog.videos.isEmpty()&&catalog.audio.isEmpty()&&(unavailable==null||unavailable.isEmpty()))
            unavailable="Video and audio formats are unavailable. Try again.";
        if(unavailable!=null&&!unavailable.isEmpty()){
            views.gap(content,10);TextView message=views.text(unavailable,12,views.secondary,false);content.addView(message);
            content.addView(views.button("Retry",this::load));
        }
        views.gap(content,4);
    }
    private View tile(String title,String symbol,String chip,boolean enabled,Runnable action){
        LinearLayout tile=views.column();tile.setGravity(Gravity.CENTER);tile.setBackground(views.clickable(views.muted,14));views.pad(tile,6,10,6,8);
        ImageView icon=new ImageView(activity);icon.setImageDrawable(new VaultViews.Icon(symbol,views.text));tile.addView(icon,new LinearLayout.LayoutParams(views.dp(32),views.dp(32)));
        views.gap(tile,8);TextView name=views.label(title,13,false);name.setGravity(Gravity.CENTER);tile.addView(name);
        if(chip!=null&&!chip.isEmpty()){TextView detail=views.text(chip,10,views.secondary,false);detail.setGravity(Gravity.CENTER);detail.setMaxLines(1);tile.addView(detail);}
        tile.setEnabled(enabled);tile.setAlpha(enabled?1f:0.38f);tile.setContentDescription(title+(enabled?"":" unavailable"));if(enabled)tile.setOnClickListener(v->action.run());return tile;
    }
    private List<DownloadCatalog.Option> options(int action){if(catalog==null)return Collections.emptyList();switch(action){case 0:return catalog.videos;case 1:return catalog.audio;case 2:return catalog.captions;case 3:return catalog.thumbnails;default:return Collections.emptyList();}}
    private void choose(int action){
        if(action==4){copyDetails();dialog.dismiss();return;}if(action==5){dialog.dismiss();DownloadsUi.openWatchUrl(activity,seed.videoId);return;}
        List<DownloadCatalog.Option> choices=options(action);if(choices.isEmpty())return;dialog.dismiss();
        if(action==3&&choices.size()==1){enqueue(choices.get(0).request);return;}
        if(action==1){
            List<DownloadCatalog.Option> tracks=audioTracks(null);
            if(AfterglowPrefs.getInt("downloadAudioTrackMode")!=1||tracks.size()<2){enqueue(choices.get(0).request);return;}
            choices=tracks;
        }
        String title=action==0?VaultViews.value(catalog.title,"Video quality"):action==1?"Audio track":action==2?"Captions":"Thumbnail";
        showPicker(title,action==0?"video":action==1?"audio":action==2?"captions":"thumbnail",choices,this::selected);
    }
    private interface Selection {void choose(DownloadRequest request);}
    private void showPicker(String title,String symbol,List<DownloadCatalog.Option> options,Selection selection){
        LinearLayout body=views.column();views.pad(body,16,2,16,4);TextView header=views.pickerText(title,18,views.text,true);header.setMaxLines(2);views.pad(header,4,0,4,12);body.addView(header);
        final Dialog picker=views.sheet(body);
        for(DownloadCatalog.Option option:options){body.addView(views.pickerRow(option.label,option.detail,symbol,()->{picker.dismiss();selection.choose(option.request);}));views.gap(body,3);}
        picker.show();
    }
    private List<DownloadCatalog.Option> audioTracks(DownloadRequest video){return DownloadUiPolicy.audioTracks(catalog,video);}
    private void selected(DownloadRequest selection){
        if(selection.kind==DownloadRequest.Kind.VIDEO&&selection.audioItag>0&&AfterglowPrefs.getInt("downloadAudioTrackMode")==1){
            List<DownloadCatalog.Option> tracks=audioTracks(selection);
            if(tracks.size()>1){showPicker("Audio track","audio",tracks,audio->{
                enqueue(DownloadUiPolicy.withAudio(selection,audio));
            });return;}
        }
        enqueue(selection);
    }
    private void enqueue(DownloadRequest selection){
        DownloadRequest request=selection.copy();
        DownloadsUi.run(activity,()->{DownloadJob duplicate=manager.findDuplicate(request);VaultViews.MAIN.post(()->{
            if(!DownloadsUi.alive(activity))return;
            if(duplicate!=null){
                AlertDialog.Builder choice=new AlertDialog.Builder(activity).setTitle("Download already exists")
                    .setMessage(duplicate.outputItemId!=null&&!duplicate.outputItemId.isEmpty()?"That exact format is already in Afterglow Vault.":"That exact format is already active or queued.")
                    .setNegativeButton("Keep Existing",(d,w)->DownloadsUi.openProgress(activity,duplicate.id))
                    .setPositiveButton("Add Another Version",(d,w)->enqueueNow(request,true));
                if(duplicate.outputItemId!=null&&!duplicate.outputItemId.isEmpty()&&manager.library().item(duplicate.outputItemId)!=null)
                    choice.setNeutralButton("Replace Existing",(d,w)->DownloadsUi.run(activity,()->{String id=manager.enqueueReplacement(request,duplicate.outputItemId);VaultViews.MAIN.post(()->{if(DownloadsUi.alive(activity))DownloadProgressSheet.show(activity,id);});}));
                choice.show();
            }
            else enqueueNow(request,false);
        });});
    }
    private void enqueueNow(DownloadRequest request,boolean another){
        DownloadsUi.run(activity,()->{String id=manager.enqueue(request,another);VaultViews.MAIN.post(()->{if(DownloadsUi.alive(activity))DownloadProgressSheet.show(activity,id);});});
    }
    private void copyDetails(){
        String text=DownloadUiPolicy.details(catalog,seed);
        ClipboardManager clipboard=(ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);
        if(clipboard==null){DownloadsUi.alert(activity,"Details","The clipboard is unavailable.");return;}
        clipboard.setPrimaryClip(ClipData.newPlainText("Video details",text));Toast.makeText(activity,"Copied to clipboard",Toast.LENGTH_SHORT).show();
    }
}
