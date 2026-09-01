package androidx.emoji2.text;

import android.content.Context;
import androidx.lifecycle.ProcessLifecycleInitializer;
import defpackage.iy6;
import defpackage.m50;
import defpackage.mp;
import defpackage.nz4;
import defpackage.u16;
import defpackage.wx6;
import defpackage.yw3;
import defpackage.zw3;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class EmojiCompatInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return Collections.singletonList(ProcessLifecycleInitializer.class);
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        nz4 nz4Var = new nz4(new mp(context, 2));
        nz4Var.a = 1;
        if (yw3.k == null) {
            synchronized (yw3.j) {
                try {
                    if (yw3.k == null) {
                        yw3.k = new yw3(nz4Var);
                    }
                } finally {
                }
            }
        }
        c(context);
        return Boolean.TRUE;
    }

    public final void c(Context context) {
        Object objV;
        m50 m50VarZ = m50.z(context);
        m50VarZ.getClass();
        synchronized (m50.f) {
            try {
                objV = ((HashMap) m50VarZ.b).get(ProcessLifecycleInitializer.class);
                if (objV == null) {
                    objV = m50VarZ.v(ProcessLifecycleInitializer.class, new HashSet());
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        wx6 lifecycle = ((iy6) objV).getLifecycle();
        lifecycle.a(new zw3(this, lifecycle));
    }
}
