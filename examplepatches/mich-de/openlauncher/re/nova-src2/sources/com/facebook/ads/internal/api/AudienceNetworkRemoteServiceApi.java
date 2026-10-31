package com.facebook.ads.internal.api;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.IBinder;
import android.os.Message;
import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;
import com.facebook.proguard.annotations.DoNotStripAny;

@Keep
@DoNotStripAny
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface AudienceNetworkRemoteServiceApi {

    @Keep
    @DoNotStripAny
    /* loaded from: classes2.dex */
    public interface HorizonWorldUrlLauncher {
        boolean launchUrl(Context context, Uri uri);
    }

    @Keep
    @DoNotStripAny
    /* loaded from: classes2.dex */
    public interface MessageHandler {
        boolean handleMessage(Message message);
    }

    @Keep
    @DoNotStripAny
    /* loaded from: classes2.dex */
    public interface PackageVerifier {
        String verifyPackage(Context context, Message message, String str);
    }

    IBinder onBind(Intent intent);

    void onCreate();

    void onDestroy();

    void setHorizonWorldUrlLauncher(HorizonWorldUrlLauncher horizonWorldUrlLauncher);

    void setMessageHandler(MessageHandler messageHandler);

    void setPackageVerifier(PackageVerifier packageVerifier);
}
