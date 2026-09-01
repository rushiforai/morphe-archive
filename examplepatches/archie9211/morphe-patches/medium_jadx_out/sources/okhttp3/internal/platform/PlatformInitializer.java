package okhttp3.internal.platform;

import android.content.Context;
import defpackage.c92;
import defpackage.ea9;
import defpackage.ey3;
import defpackage.u16;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lokhttp3/internal/platform/PlatformInitializer;", "Lu16;", "Lea9;", "<init>", "()V", "okhttp"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PlatformInitializer implements u16 {
    @Override // defpackage.u16
    public final List a() {
        return ey3.a;
    }

    @Override // defpackage.u16
    public final Object b(Context context) {
        context.getClass();
        ea9 ea9Var = ea9.a;
        Object obj = ea9.a;
        c92 c92Var = obj != null ? (c92) obj : null;
        if (c92Var != null) {
            c92Var.a(context);
        }
        return ea9.a;
    }
}
