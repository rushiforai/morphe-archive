package x80;

import androidx.compose.ui.node.LayoutNode;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {
    public static final g n = new g(true, false, -1, -1, false, false, false, -1, -1, false, false, false, null);
    public static final g o;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f95491a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f95492b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95493c;

    /* renamed from: d, reason: collision with root package name */
    public final int f95494d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f95495e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f95496f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f95497g;

    /* renamed from: h, reason: collision with root package name */
    public final int f95498h;

    /* renamed from: i, reason: collision with root package name */
    public final int f95499i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f95500j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f95501k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f95502l;

    /* renamed from: m, reason: collision with root package name */
    public String f95503m;

    static {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        Intrinsics.g(timeUnit, "timeUnit");
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        long seconds = timeUnit.toSeconds(LayoutNode.NotPlacedPlaceOrder);
        if (seconds <= 2147483647L) {
            i5 = (int) seconds;
        }
        o = new g(false, false, -1, -1, false, false, false, i5, -1, true, false, false, null);
    }

    public g(boolean z11, boolean z12, int i5, int i11, boolean z13, boolean z14, boolean z15, int i12, int i13, boolean z16, boolean z17, boolean z18, String str) {
        this.f95491a = z11;
        this.f95492b = z12;
        this.f95493c = i5;
        this.f95494d = i11;
        this.f95495e = z13;
        this.f95496f = z14;
        this.f95497g = z15;
        this.f95498h = i12;
        this.f95499i = i13;
        this.f95500j = z16;
        this.f95501k = z17;
        this.f95502l = z18;
        this.f95503m = str;
    }

    public final String toString() {
        String str = this.f95503m;
        if (str != null) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.f95491a) {
            sb2.append("no-cache, ");
        }
        if (this.f95492b) {
            sb2.append("no-store, ");
        }
        int i5 = this.f95493c;
        if (i5 != -1) {
            sb2.append("max-age=");
            sb2.append(i5);
            sb2.append(", ");
        }
        int i11 = this.f95494d;
        if (i11 != -1) {
            sb2.append("s-maxage=");
            sb2.append(i11);
            sb2.append(", ");
        }
        if (this.f95495e) {
            sb2.append("private, ");
        }
        if (this.f95496f) {
            sb2.append("public, ");
        }
        if (this.f95497g) {
            sb2.append("must-revalidate, ");
        }
        int i12 = this.f95498h;
        if (i12 != -1) {
            sb2.append("max-stale=");
            sb2.append(i12);
            sb2.append(", ");
        }
        int i13 = this.f95499i;
        if (i13 != -1) {
            sb2.append("min-fresh=");
            sb2.append(i13);
            sb2.append(", ");
        }
        if (this.f95500j) {
            sb2.append("only-if-cached, ");
        }
        if (this.f95501k) {
            sb2.append("no-transform, ");
        }
        if (this.f95502l) {
            sb2.append("immutable, ");
        }
        if (sb2.length() == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        sb2.delete(sb2.length() - 2, sb2.length());
        String string = sb2.toString();
        Intrinsics.f(string, "StringBuilder().apply(builderAction).toString()");
        this.f95503m = string;
        return string;
    }
}
