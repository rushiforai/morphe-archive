package androidx.work;

import android.content.Context;
import defpackage.d87;
import defpackage.m7f;
import defpackage.pkf;
import defpackage.r32;
import defpackage.u16;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class WorkManagerInitializer implements u16 {
    public static final String a = d87.k("WrkMgrInitializer");

    @Override // defpackage.u16
    public final List a() {
        return Collections.EMPTY_LIST;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        d87.h().d(a, "Initializing WorkManager with default configuration.");
        r32 r32Var = new r32(new pkf());
        context.getClass();
        m7f.h(context, r32Var);
        m7f m7fVarF = m7f.f(context);
        m7fVarF.getClass();
        return m7fVarF;
    }
}
