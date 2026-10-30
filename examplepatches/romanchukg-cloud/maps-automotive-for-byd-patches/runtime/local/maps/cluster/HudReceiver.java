package local.maps.cluster;

import android.content.*;
import android.content.pm.*;
import android.os.Build;
import java.security.MessageDigest;

/** Ordinary application UID, explicit component, no shell/root/system permission. */
final class HudReceiver {
    static final String PACKAGE="com.byd.clusterdebug", ACTION="byd.hud.NAVIGATION";
    private static final ComponentName TARGET=new ComponentName(PACKAGE,PACKAGE+".BroadcastReceiverCAN");
    static String rejection(Context context) {
        if(Build.VERSION.SDK_INT<28)return "android_version";
        if(Build.FINGERPRINT==null||!Build.FINGERPRINT.startsWith(HudCompatibility.FIRMWARE_FAMILY))return "firmware_not_verified";
        try {
            PackageManager pm=context.getPackageManager();
            PackageInfo info=pm.getPackageInfo(PACKAGE,PackageManager.GET_SIGNING_CERTIFICATES);
            ActivityInfo receiver=pm.getReceiverInfo(TARGET,0);
            Signature[] signatures=info.signingInfo==null?new Signature[0]:info.signingInfo.getApkContentsSigners();
            String signer=signatures.length==1?HudPackets.hex(MessageDigest.getInstance("SHA-256").digest(signatures[0].toByteArray())).replace(",","").toLowerCase(java.util.Locale.ROOT):"";
            ApplicationInfo app=info.applicationInfo;
            return HudCompatibility.reject(Build.VERSION.SDK_INT,context.getPackageName(),Build.FINGERPRINT,info.getLongVersionCode(),
                app!=null&&(app.flags&ApplicationInfo.FLAG_SYSTEM)!=0,app!=null&&app.enabled,receiver.enabled,receiver.exported,
                receiver.permission,signatures.length,signer);
        } catch(PackageManager.NameNotFoundException e){return "receiver_metadata_unavailable";}
        catch(Exception e){return "receiver_verification_failed";}
    }
    static void send(Context context,String packet) {
        context.sendBroadcast(new Intent(ACTION).setComponent(TARGET).putExtra("normal",packet).addFlags(Intent.FLAG_RECEIVER_FOREGROUND));
    }
}
