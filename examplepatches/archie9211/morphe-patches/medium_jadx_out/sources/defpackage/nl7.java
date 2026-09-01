package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.media.browse.MediaBrowser;
import android.os.Bundle;
import android.os.Messenger;
import android.os.Process;
import android.support.v4.media.session.MediaSessionCompat$Token;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class nl7 {
    public final Context a;
    public final MediaBrowser b;
    public final Bundle c;
    public final ll7 d = new ll7(this);
    public final y70 e = new y70(0);
    public gg5 f;
    public Messenger g;
    public MediaSessionCompat$Token h;

    public nl7(Context context, ComponentName componentName, ing ingVar) {
        this.a = context;
        Bundle bundle = new Bundle();
        this.c = bundle;
        bundle.putInt("extra_client_version", 1);
        bundle.putInt("extra_calling_pid", Process.myPid());
        ingVar.b = this;
        this.b = new MediaBrowser(context, componentName, (ml7) ingVar.a, bundle);
    }
}
