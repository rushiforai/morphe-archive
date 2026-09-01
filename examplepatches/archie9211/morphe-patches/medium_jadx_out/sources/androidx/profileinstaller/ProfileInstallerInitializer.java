package androidx.profileinstaller;

import android.content.Context;
import android.os.Build;
import android.view.Choreographer;
import defpackage.rw;
import defpackage.u16;
import defpackage.zi5;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ProfileInstallerInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return Collections.EMPTY_LIST;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        if (Build.VERSION.SDK_INT < 24) {
            return new zi5(21);
        }
        Choreographer.getInstance().postFrameCallback(new rw(this, context.getApplicationContext()));
        return new zi5(21);
    }
}
