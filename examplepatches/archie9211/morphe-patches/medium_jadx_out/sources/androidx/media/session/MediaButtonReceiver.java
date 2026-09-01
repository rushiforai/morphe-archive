package androidx.media.session;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Log;
import android.view.KeyEvent;
import com.medium.android.donkey.audio.AudioService;
import com.pairip.VMRunner;
import defpackage.lv8;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class MediaButtonReceiver extends BroadcastReceiver {
    public static PendingIntent a(AudioService audioService, long j) {
        ComponentName componentNameB = b(audioService);
        if (componentNameB == null) {
            Log.w("MediaButtonReceiver", "A unique media button receiver could not be found in the given context, so couldn't build a pending intent.");
            return null;
        }
        int iA = PlaybackStateCompat.a(j);
        if (iA == 0) {
            Log.w("MediaButtonReceiver", "Cannot build a media button pending intent with the given action: " + j);
            return null;
        }
        Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
        intent.setComponent(componentNameB);
        intent.putExtra("android.intent.extra.KEY_EVENT", new KeyEvent(0, iA));
        intent.addFlags(268435456);
        return PendingIntent.getBroadcast(audioService, iA, intent, Build.VERSION.SDK_INT >= 31 ? 33554432 : 0);
    }

    public static ComponentName b(AudioService audioService) {
        Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
        intent.setPackage(audioService.getPackageName());
        List<ResolveInfo> listQueryBroadcastReceivers = audioService.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (listQueryBroadcastReceivers.size() == 1) {
            ActivityInfo activityInfo = listQueryBroadcastReceivers.get(0).activityInfo;
            return new ComponentName(activityInfo.packageName, activityInfo.name);
        }
        if (listQueryBroadcastReceivers.size() <= 1) {
            return null;
        }
        Log.w("MediaButtonReceiver", "More than one BroadcastReceiver that handles android.intent.action.MEDIA_BUTTON was found, returning null.");
        return null;
    }

    public static ComponentName c(Context context, String str) {
        PackageManager packageManager = context.getPackageManager();
        Intent intent = new Intent(str);
        intent.setPackage(context.getPackageName());
        List<ResolveInfo> listQueryIntentServices = packageManager.queryIntentServices(intent, 0);
        if (listQueryIntentServices.size() == 1) {
            ServiceInfo serviceInfo = listQueryIntentServices.get(0).serviceInfo;
            return new ComponentName(serviceInfo.packageName, serviceInfo.name);
        }
        if (listQueryIntentServices.isEmpty()) {
            return null;
        }
        StringBuilder sbU = lv8.u("Expected 1 service that handles ", str, ", found ");
        sbU.append(listQueryIntentServices.size());
        throw new IllegalStateException(sbU.toString());
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("ZpJsTsolnyZp0Giw", new Object[]{this, context, intent});
    }
}
