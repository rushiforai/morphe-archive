package bg;

import android.content.Context;
import androidx.recyclerview.widget.n0;
import b.c0;
import b.d0;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: f, reason: collision with root package name */
    public static final c f17872f;

    /* renamed from: g, reason: collision with root package name */
    public static final c f17873g;

    /* renamed from: h, reason: collision with root package name */
    public static final c f17874h;

    /* renamed from: a, reason: collision with root package name */
    public final int f17875a;

    /* renamed from: b, reason: collision with root package name */
    public final int f17876b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f17877c;

    /* renamed from: d, reason: collision with root package name */
    public final int f17878d;

    /* renamed from: e, reason: collision with root package name */
    public final String f17879e;

    static {
        int i5 = 56;
        f17872f = new c(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50, i5, "320x50_mb");
        new c(468, 60);
        new c(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 100);
        f17873g = new c(728, 90);
        f17874h = new c(300, n0.DEFAULT_SWIPE_ANIMATION_DURATION);
        int i11 = -3;
        new c(i11, -4, i5, "fluid");
        int i12 = 0;
        new c(i11, i12, i5, "search_v2");
        new c(i12, i12, i5, "invalid");
        new c(160, 600, i5, "160x600_as");
    }

    public c(int i5, int i11, String str, boolean z11, boolean z12, int i12) {
        this.f17875a = i5;
        this.f17876b = i11;
        this.f17877c = z12;
        this.f17878d = i12;
        if (str == null) {
            str = i5 + "x" + i11 + "_as";
        }
        this.f17879e = str;
        if (i5 < 0 && i5 != -3) {
            throw new IllegalArgumentException(c0.h(i5, "Invalid width for AdSize: ").toString());
        }
        if (i11 < 0 && i11 != -4) {
            throw new IllegalArgumentException(c0.h(i11, "Invalid height for AdSize: ").toString());
        }
        if (z11 && z12) {
            throw new IllegalArgumentException("AdSize cannot be both inline and anchored adaptive");
        }
        if (z12 && i11 < 1) {
            throw new IllegalArgumentException("An inline AdSize must have a positive height");
        }
    }

    public final int a(Context context) {
        Intrinsics.g(context, "context");
        int i5 = this.f17876b;
        if (i5 == -4 || i5 == -3) {
            return -1;
        }
        return (int) d0.a(context, i5);
    }

    public final int b(Context context) {
        Intrinsics.g(context, "context");
        int i5 = this.f17875a;
        if (i5 == -4 || i5 == -3) {
            return -1;
        }
        return (int) d0.a(context, i5);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f17875a == cVar.f17875a && this.f17876b == cVar.f17876b && Intrinsics.b(this.f17879e, cVar.f17879e);
    }

    public final int hashCode() {
        return this.f17879e.hashCode();
    }

    public final String toString() {
        return this.f17879e;
    }

    public /* synthetic */ c(int i5, int i11, int i12, String str) {
        this(i5, i11, (i12 & 4) != 0 ? null : str, (i12 & 8) == 0, false, -1);
    }

    public c(int i5, int i11) {
        this(i5, i11, 56, null);
    }
}
