package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;

import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.DownloadRequest;
import app.afterglow.extension.downloads.LibraryItem;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Public UI boundary used by the native player button, settings, and Control Center. */
public final class DownloadsUi {
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor();
    private DownloadsUi() {}
    public static void openDownloadSheet(Activity activity,DownloadRequest request) {
        if(activity==null)return;
        activity.runOnUiThread(()->{
            if(!alive(activity))return;
            if(request==null||request.videoId==null||request.videoId.isEmpty()) {alert(activity,"No video","Couldn't identify the current video.");return;}
            DownloadSheet.show(activity,request.copy());
        });
    }
    public static void openVault(Activity activity) {
        if(activity==null)return;
        activity.runOnUiThread(()->{if(alive(activity))activity.startActivity(new Intent(activity,VaultActivity.class));});
    }
    public static void openProgress(Activity activity,String jobId) {
        if(activity==null)return;activity.runOnUiThread(()->{if(alive(activity))DownloadProgressSheet.show(activity,jobId);});
    }
    public static void openItem(Activity activity,LibraryItem item) {
        if(item==null)return;
        if(item.isMissing()){missing(activity,item);return;}
        activity.startActivity(new Intent(activity,VaultPlayerActivity.class).putExtra(VaultPlayerActivity.EXTRA_ITEM_ID,item.id));
    }
    public static void openItemExternally(Activity activity,LibraryItem item) {
        if(item==null)return;
        try {
            Uri uri=DownloadManager.get(activity).library().uriForItem(item.id);
            if(uri==null||item.isMissing()){missing(activity,item);return;}
            Intent intent=new Intent(Intent.ACTION_VIEW).setDataAndType(uri,VaultViews.value(item.mimeType,"application/octet-stream"));
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);intent.setClipData(ClipData.newRawUri(item.title,uri));
            activity.startActivity(Intent.createChooser(intent,"Open In…"));
        }catch(ActivityNotFoundException error){alert(activity,"Open Media","No installed app can open this file. Use Share to send it to another app.");}
        catch(Exception error){failure(activity,"Couldn't open media",error);}
    }
    public static void shareItem(Activity activity,LibraryItem item) {
        launchShare(activity,item);
    }
    static boolean launchShare(Activity activity,LibraryItem item) {
        try {
            Uri uri=DownloadManager.get(activity).library().uriForItem(item.id);
            if(uri==null||item.isMissing()){missing(activity,item);return false;}
            Intent intent=new Intent(Intent.ACTION_SEND).setType(VaultViews.value(item.mimeType,"application/octet-stream"));
            intent.putExtra(Intent.EXTRA_STREAM,uri).putExtra(Intent.EXTRA_TITLE,item.title);
            intent.setClipData(ClipData.newRawUri(item.title,uri));intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            activity.startActivity(Intent.createChooser(intent,"Share"));
            return true;
        }catch(Exception error){failure(activity,"Couldn't share media",error);return false;}
    }
    static void openWatchUrl(Activity activity,String videoId) {
        Uri uri=Uri.parse("https://www.youtube.com/watch?v="+Uri.encode(videoId));
        Intent intent=new Intent(Intent.ACTION_VIEW,uri);
        try{activity.startActivity(Intent.createChooser(intent,"Open In…"));}catch(ActivityNotFoundException error){alert(activity,"Open In…","No app is available to open this video link.");}
    }
    private static void missing(Activity activity,LibraryItem item) {
        AlertDialog.Builder alert=new AlertDialog.Builder(activity).setTitle("Missing File")
                .setMessage("The saved file is no longer available. Its Vault details are still retained.").setNegativeButton("Close",null);
        if(item.videoId!=null&&!item.videoId.isEmpty())alert.setPositiveButton("Redownload",(d,w)->openDownloadSheet(activity,new DownloadRequest(item.videoId)));
        alert.show();
    }
    interface Task {void run() throws Exception;}
    static void run(Activity activity,Task task) {WORK.execute(()->{try{task.run();}catch(Exception error){failure(activity,"Afterglow Vault",error);}});}
    static void failure(Activity activity,String title,Throwable error) {
        // Resolver and provider exceptions may contain signed URLs. The engine supplies its
        // own safe error text; unexpected UI failures log the exception type only.
        DebugLog.write("vault-ui",title+" failed ("+error.getClass().getSimpleName()+")");
        VaultViews.MAIN.post(()->alert(activity,title,"The action couldn't be completed. Please try again."));
    }
    static void alert(Activity activity,String title,String message) {if(alive(activity))new AlertDialog.Builder(activity).setTitle(title).setMessage(message).setPositiveButton("OK",null).show();}
    static boolean alive(Activity activity){return activity!=null&&!activity.isFinishing()&&!activity.isDestroyed();}
}
