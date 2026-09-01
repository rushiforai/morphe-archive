package defpackage;

import com.google.android.gms.internal.play_billing.zzgs;
import com.google.android.recaptcha.internal.zzaej;
import com.google.android.recaptcha.internal.zzaek;
import java.security.GeneralSecurityException;
import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ygf {
    public static /* synthetic */ void a() {
        throw new NoWhenBranchMatchedException();
    }

    public static /* synthetic */ void b(int i, int i2) {
        StringBuilder sb = new StringBuilder(i);
        sb.append((Object) "serialized size must be non-negative, was ");
        sb.append(i2);
        throw new IllegalStateException(sb.toString());
    }

    public static /* synthetic */ void c(int i, int i2, int i3) {
        StringBuilder sb = new StringBuilder(i);
        sb.append((Object) "Length too large: ");
        sb.append(i2);
        sb.append(i3);
        throw new IllegalArgumentException(sb.toString());
    }

    public static /* synthetic */ void d(int i, Object obj, int i2, Object obj2, int i3) {
        StringBuilder sb = new StringBuilder(i);
        sb.append(obj);
        sb.append(i2);
        sb.append(obj2);
        sb.append(i3);
        throw new IndexOutOfBoundsException(sb.toString());
    }

    public static /* synthetic */ void e(Object obj, int i, Object obj2, int i2) {
        StringBuilder sb = new StringBuilder(i);
        sb.append(obj);
        sb.append(i2);
        sb.append(obj2);
        throw new IllegalStateException(sb.toString());
    }

    public static /* synthetic */ void f(String str) {
        throw new IllegalStateException(str);
    }

    public static /* synthetic */ void g() throws zzaej {
        throw new zzaej();
    }

    public static /* synthetic */ void h(int i, int i2) {
        throw new IllegalArgumentException("Length too large: " + i + i2);
    }

    public static /* synthetic */ void i(String str) {
        throw new RuntimeException(str);
    }

    public static /* synthetic */ void j(String str) throws zzaek {
        throw new zzaek(str);
    }

    public static /* synthetic */ void k(String str) throws zzgs {
        throw new zzgs(str);
    }

    public static /* synthetic */ void l(String str) throws GeneralSecurityException {
        throw new GeneralSecurityException(str);
    }
}
