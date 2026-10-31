package q3;

import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b0 implements Comparable {

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f83528b;

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f83529c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f83530d;

    /* renamed from: e, reason: collision with root package name */
    public static final b0 f83531e;

    /* renamed from: f, reason: collision with root package name */
    public static final b0 f83532f;

    /* renamed from: g, reason: collision with root package name */
    public static final b0 f83533g;

    /* renamed from: h, reason: collision with root package name */
    public static final b0 f83534h;

    /* renamed from: i, reason: collision with root package name */
    public static final b0 f83535i;

    /* renamed from: j, reason: collision with root package name */
    public static final b0 f83536j;

    /* renamed from: k, reason: collision with root package name */
    public static final b0 f83537k;

    /* renamed from: l, reason: collision with root package name */
    public static final List f83538l;

    /* renamed from: a, reason: collision with root package name */
    public final int f83539a;

    static {
        b0 b0Var = new b0(100);
        b0 b0Var2 = new b0(200);
        b0 b0Var3 = new b0(300);
        b0 b0Var4 = new b0(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE);
        f83528b = b0Var4;
        b0 b0Var5 = new b0(500);
        f83529c = b0Var5;
        b0 b0Var6 = new b0(600);
        f83530d = b0Var6;
        b0 b0Var7 = new b0(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE);
        b0 b0Var8 = new b0(800);
        b0 b0Var9 = new b0(900);
        f83531e = b0Var3;
        f83532f = b0Var4;
        f83533g = b0Var5;
        f83534h = b0Var6;
        f83535i = b0Var7;
        f83536j = b0Var8;
        f83537k = b0Var9;
        f83538l = ul.b.Q(b0Var, b0Var2, b0Var3, b0Var4, b0Var5, b0Var6, b0Var7, b0Var8, b0Var9);
    }

    public b0(int i5) {
        this.f83539a = i5;
        boolean z11 = false;
        if (1 <= i5 && i5 < 1001) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        s3.a.a("Font weight can be in range [1, 1000]. Current value: " + i5);
    }

    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(b0 b0Var) {
        return Intrinsics.h(this.f83539a, b0Var.f83539a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof b0) {
            return this.f83539a == ((b0) obj).f83539a;
        }
        return false;
    }

    public final int hashCode() {
        return this.f83539a;
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("FontWeight(weight="), this.f83539a, ')');
    }
}
