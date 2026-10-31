package mi;

import androidx.recyclerview.widget.n0;
import b.c0;
import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: g, reason: collision with root package name */
    public static final a f76401g = new a(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50, 56, "320x50_mb");

    /* renamed from: h, reason: collision with root package name */
    public static final a f76402h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f76403i;

    /* renamed from: a, reason: collision with root package name */
    public final int f76404a;

    /* renamed from: b, reason: collision with root package name */
    public final int f76405b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f76406c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f76407d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f76408e;

    /* renamed from: f, reason: collision with root package name */
    public final String f76409f;

    static {
        new a(468, 60);
        new a(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 100);
        new a(728, 90);
        f76402h = new a(300, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
        f76403i = new a(-3, -4, 56, "320x50_mb");
    }

    public a(int i5, int i11, int i12, String str) {
        str = (i12 & 4) != 0 ? null : str;
        boolean z11 = (i12 & 8) == 0;
        boolean z12 = (i12 & 16) == 0;
        boolean z13 = (i12 & 32) == 0;
        this.f76404a = i5;
        this.f76405b = i11;
        this.f76406c = z11;
        this.f76407d = z12;
        this.f76408e = z13;
        if (str == null) {
            str = i5 + "x" + i11 + "_as";
        }
        this.f76409f = str;
        if (i5 < 0 && i5 != -3) {
            throw new IllegalArgumentException(c0.h(i5, "Invalid width for AdSize: ").toString());
        }
        if (i11 < 0 && i11 != -4) {
            throw new IllegalArgumentException(c0.h(i11, "Invalid height for AdSize: ").toString());
        }
        if (z12 && z11) {
            throw new IllegalArgumentException("AdSize cannot be both inline and anchored adaptive");
        }
        if (z12 && z13) {
            throw new IllegalArgumentException("AdSize cannot be both inline and large anchored adaptive");
        }
        if (z11 && z13) {
            throw new IllegalArgumentException("AdSize cannot be both anchored and large anchored adaptive");
        }
        if (z12 && i11 < 1) {
            throw new IllegalArgumentException("An inline AdSize must have a positive height");
        }
    }

    public final boolean a() {
        return this.f76404a == -3 && this.f76405b == -4;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f76404a == aVar.f76404a && this.f76405b == aVar.f76405b && Intrinsics.b(this.f76409f, aVar.f76409f);
    }

    public final int hashCode() {
        return Objects.hash(this.f76409f, Boolean.valueOf(a()));
    }

    public final String toString() {
        return u4.m(this.f76409f, " ", a() ? "fluid" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public a(int i5, int i11) {
        this(i5, i11, 56, null);
    }
}
