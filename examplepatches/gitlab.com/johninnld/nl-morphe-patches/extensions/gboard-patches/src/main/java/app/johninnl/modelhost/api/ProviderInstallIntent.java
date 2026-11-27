package app.johninnl.modelhost.api;
import android.content.*;
import android.net.Uri;
/** The normal Android installer still owns source approval and final installation confirmation. */
public final class ProviderInstallIntent {
    private ProviderInstallIntent(){}
    public static Intent create(Context context,VerifiedApk apk){
        Uri uri=new Uri.Builder().scheme("content").authority(context.getPackageName()+".local-model-host-apks").appendPath(apk.file.getName()).build();
        Intent intent=new Intent(Intent.ACTION_VIEW).setDataAndType(uri,"application/vnd.android.package-archive").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        if(!(context instanceof android.app.Activity))intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.setClipData(ClipData.newRawUri("Verified Local Model Host APK",uri));return intent;
    }
}
