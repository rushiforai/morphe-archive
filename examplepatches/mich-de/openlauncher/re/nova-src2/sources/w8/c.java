package w8;

import android.graphics.Bitmap;
import androidx.compose.ui.node.LayoutNode;
import c9.g;
import c9.o;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;
import r70.i;
import r70.j;
import x80.g0;
import x80.h0;
import x80.u;
import x80.w;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f94103a;

    /* renamed from: b, reason: collision with root package name */
    public final b f94104b;

    /* renamed from: c, reason: collision with root package name */
    public final Date f94105c;

    /* renamed from: d, reason: collision with root package name */
    public final String f94106d;

    /* renamed from: e, reason: collision with root package name */
    public final Date f94107e;

    /* renamed from: f, reason: collision with root package name */
    public final String f94108f;

    /* renamed from: g, reason: collision with root package name */
    public final Date f94109g;

    /* renamed from: h, reason: collision with root package name */
    public final long f94110h;

    /* renamed from: i, reason: collision with root package name */
    public final long f94111i;

    /* renamed from: j, reason: collision with root package name */
    public final String f94112j;

    /* renamed from: k, reason: collision with root package name */
    public final int f94113k;

    public c(h0 h0Var, b bVar) {
        int i5;
        this.f94103a = h0Var;
        this.f94104b = bVar;
        this.f94113k = -1;
        if (bVar != null) {
            this.f94110h = bVar.f94099c;
            this.f94111i = bVar.f94100d;
            u uVar = bVar.f94102f;
            int size = uVar.size();
            for (int i11 = 0; i11 < size; i11++) {
                String strC = uVar.c(i11);
                if (j.B0(strC, "Date", true)) {
                    String strB = uVar.b("Date");
                    this.f94105c = strB != null ? c90.c.a(strB) : null;
                    this.f94106d = uVar.e(i11);
                } else if (j.B0(strC, "Expires", true)) {
                    String strB2 = uVar.b("Expires");
                    this.f94109g = strB2 != null ? c90.c.a(strB2) : null;
                } else if (j.B0(strC, "Last-Modified", true)) {
                    String strB3 = uVar.b("Last-Modified");
                    this.f94107e = strB3 != null ? c90.c.a(strB3) : null;
                    this.f94108f = uVar.e(i11);
                } else if (j.B0(strC, "ETag", true)) {
                    this.f94112j = uVar.e(i11);
                } else if (j.B0(strC, "Age", true)) {
                    String strE = uVar.e(i11);
                    Bitmap.Config[] configArr = g.f19862a;
                    Long lV0 = i.v0(strE);
                    if (lV0 != null) {
                        long jLongValue = lV0.longValue();
                        i5 = jLongValue > 2147483647L ? LayoutNode.NotPlacedPlaceOrder : jLongValue < 0 ? 0 : (int) jLongValue;
                    } else {
                        i5 = -1;
                    }
                    this.f94113k = i5;
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00d5  */
    /* JADX WARN: Type inference failed for: r6v0, types: [java.lang.Object, kotlin.Lazy] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final d a() {
        b bVar;
        long jMax;
        Date date;
        w wVar;
        long time;
        long j11;
        int i5;
        h0 h0Var = this.f94103a;
        u uVar = h0Var.f95511c;
        w wVar2 = h0Var.f95509a;
        b bVar2 = this.f94104b;
        if (bVar2 == null) {
            return new d(h0Var, null);
        }
        ?? r62 = bVar2.f94097a;
        if (wVar2.f95634j && !bVar2.f94101e) {
            return new d(h0Var, null);
        }
        x80.g gVar = (x80.g) r62.getValue();
        if (h0Var.a().f95492b || ((x80.g) r62.getValue()).f95492b || Intrinsics.b(bVar2.f94102f.b("Vary"), "*")) {
            return new d(h0Var, null);
        }
        x80.g gVarA = h0Var.a();
        if (!gVarA.f95491a) {
            String str = "If-Modified-Since";
            if (uVar.b("If-Modified-Since") == null && uVar.b("If-None-Match") == null) {
                long time2 = this.f94111i;
                Date date2 = this.f94105c;
                if (date2 != null) {
                    bVar = bVar2;
                    jMax = Math.max(0L, time2 - date2.getTime());
                } else {
                    bVar = bVar2;
                    jMax = 0;
                }
                long millis = 0;
                int i11 = this.f94113k;
                if (i11 != -1) {
                    date = date2;
                    wVar = wVar2;
                    jMax = Math.max(jMax, TimeUnit.SECONDS.toMillis(i11));
                } else {
                    date = date2;
                    wVar = wVar2;
                }
                long time3 = this.f94110h;
                long jLongValue = jMax + (time2 - time3) + (((Number) o.f19882a.invoke()).longValue() - time2);
                int i12 = ((x80.g) r62.getValue()).f95493c;
                Date date3 = this.f94107e;
                if (i12 != -1) {
                    time = TimeUnit.SECONDS.toMillis(i12);
                } else {
                    Date date4 = this.f94109g;
                    if (date4 != null) {
                        if (date != null) {
                            time2 = date.getTime();
                        }
                        time = date4.getTime() - time2;
                        if (time <= 0) {
                            time = 0;
                        }
                    } else if (date3 != null && wVar.i() == null) {
                        if (date != null) {
                            time3 = date.getTime();
                        }
                        long time4 = time3 - date3.getTime();
                        if (time4 > 0) {
                            time = time4 / 10;
                        }
                    }
                }
                int i13 = gVarA.f95493c;
                if (i13 != -1) {
                    j11 = jLongValue;
                    time = Math.min(time, TimeUnit.SECONDS.toMillis(i13));
                } else {
                    j11 = jLongValue;
                }
                int i14 = gVarA.f95499i;
                long millis2 = i14 != -1 ? TimeUnit.SECONDS.toMillis(i14) : 0L;
                if (!gVar.f95497g && (i5 = gVarA.f95498h) != -1) {
                    millis = TimeUnit.SECONDS.toMillis(i5);
                }
                if (!gVar.f95491a && j11 + millis2 < time + millis) {
                    return new d(null, bVar);
                }
                b bVar3 = bVar;
                String str2 = this.f94112j;
                if (str2 != null) {
                    str = "If-None-Match";
                } else if (date3 != null) {
                    str2 = this.f94108f;
                    Intrinsics.d(str2);
                } else {
                    if (date == null) {
                        return new d(h0Var, null);
                    }
                    str2 = this.f94106d;
                    Intrinsics.d(str2);
                }
                g0 g0VarB = h0Var.b();
                g0VarB.a(str, str2);
                return new d(g0VarB.b(), bVar3);
            }
        }
        return new d(h0Var, null);
    }
}
