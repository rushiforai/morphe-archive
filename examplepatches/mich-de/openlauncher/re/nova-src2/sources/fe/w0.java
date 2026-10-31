package fe;

import android.net.Uri;
import android.os.Bundle;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class w0 implements e {
    public static final w0 G = new w0(new v0());
    public static final ep.c H = new ep.c(12);
    public final Integer A;
    public final Integer B;
    public final CharSequence C;
    public final CharSequence D;
    public final CharSequence E;
    public final Bundle F;

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f55037a;

    /* renamed from: b, reason: collision with root package name */
    public final CharSequence f55038b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f55039c;

    /* renamed from: d, reason: collision with root package name */
    public final CharSequence f55040d;

    /* renamed from: e, reason: collision with root package name */
    public final CharSequence f55041e;

    /* renamed from: f, reason: collision with root package name */
    public final CharSequence f55042f;

    /* renamed from: g, reason: collision with root package name */
    public final CharSequence f55043g;

    /* renamed from: h, reason: collision with root package name */
    public final q1 f55044h;

    /* renamed from: i, reason: collision with root package name */
    public final q1 f55045i;

    /* renamed from: j, reason: collision with root package name */
    public final byte[] f55046j;

    /* renamed from: k, reason: collision with root package name */
    public final Integer f55047k;

    /* renamed from: l, reason: collision with root package name */
    public final Uri f55048l;

    /* renamed from: m, reason: collision with root package name */
    public final Integer f55049m;
    public final Integer n;
    public final Integer o;

    /* renamed from: p, reason: collision with root package name */
    public final Boolean f55050p;

    /* renamed from: q, reason: collision with root package name */
    public final Integer f55051q;

    /* renamed from: r, reason: collision with root package name */
    public final Integer f55052r;

    /* renamed from: s, reason: collision with root package name */
    public final Integer f55053s;

    /* renamed from: t, reason: collision with root package name */
    public final Integer f55054t;

    /* renamed from: u, reason: collision with root package name */
    public final Integer f55055u;

    /* renamed from: v, reason: collision with root package name */
    public final Integer f55056v;

    /* renamed from: w, reason: collision with root package name */
    public final Integer f55057w;

    /* renamed from: x, reason: collision with root package name */
    public final CharSequence f55058x;

    /* renamed from: y, reason: collision with root package name */
    public final CharSequence f55059y;

    /* renamed from: z, reason: collision with root package name */
    public final CharSequence f55060z;

    public w0(v0 v0Var) {
        this.f55037a = v0Var.f55009a;
        this.f55038b = v0Var.f55010b;
        this.f55039c = v0Var.f55011c;
        this.f55040d = v0Var.f55012d;
        this.f55041e = v0Var.f55013e;
        this.f55042f = v0Var.f55014f;
        this.f55043g = v0Var.f55015g;
        this.f55044h = v0Var.f55016h;
        this.f55045i = v0Var.f55017i;
        this.f55046j = v0Var.f55018j;
        this.f55047k = v0Var.f55019k;
        this.f55048l = v0Var.f55020l;
        this.f55049m = v0Var.f55021m;
        this.n = v0Var.n;
        this.o = v0Var.o;
        this.f55050p = v0Var.f55022p;
        Integer num = v0Var.f55023q;
        this.f55051q = num;
        this.f55052r = num;
        this.f55053s = v0Var.f55024r;
        this.f55054t = v0Var.f55025s;
        this.f55055u = v0Var.f55026t;
        this.f55056v = v0Var.f55027u;
        this.f55057w = v0Var.f55028v;
        this.f55058x = v0Var.f55029w;
        this.f55059y = v0Var.f55030x;
        this.f55060z = v0Var.f55031y;
        this.A = v0Var.f55032z;
        this.B = v0Var.A;
        this.C = v0Var.B;
        this.D = v0Var.C;
        this.E = v0Var.D;
        this.F = v0Var.E;
    }

    public final v0 a() {
        v0 v0Var = new v0();
        v0Var.f55009a = this.f55037a;
        v0Var.f55010b = this.f55038b;
        v0Var.f55011c = this.f55039c;
        v0Var.f55012d = this.f55040d;
        v0Var.f55013e = this.f55041e;
        v0Var.f55014f = this.f55042f;
        v0Var.f55015g = this.f55043g;
        v0Var.f55016h = this.f55044h;
        v0Var.f55017i = this.f55045i;
        v0Var.f55018j = this.f55046j;
        v0Var.f55019k = this.f55047k;
        v0Var.f55020l = this.f55048l;
        v0Var.f55021m = this.f55049m;
        v0Var.n = this.n;
        v0Var.o = this.o;
        v0Var.f55022p = this.f55050p;
        v0Var.f55023q = this.f55052r;
        v0Var.f55024r = this.f55053s;
        v0Var.f55025s = this.f55054t;
        v0Var.f55026t = this.f55055u;
        v0Var.f55027u = this.f55056v;
        v0Var.f55028v = this.f55057w;
        v0Var.f55029w = this.f55058x;
        v0Var.f55030x = this.f55059y;
        v0Var.f55031y = this.f55060z;
        v0Var.f55032z = this.A;
        v0Var.A = this.B;
        v0Var.B = this.C;
        v0Var.C = this.D;
        v0Var.D = this.E;
        v0Var.E = this.F;
        return v0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && w0.class == obj.getClass()) {
            w0 w0Var = (w0) obj;
            if (wf.v.a(this.f55037a, w0Var.f55037a) && wf.v.a(this.f55038b, w0Var.f55038b) && wf.v.a(this.f55039c, w0Var.f55039c) && wf.v.a(this.f55040d, w0Var.f55040d) && wf.v.a(this.f55041e, w0Var.f55041e) && wf.v.a(this.f55042f, w0Var.f55042f) && wf.v.a(this.f55043g, w0Var.f55043g) && wf.v.a(this.f55044h, w0Var.f55044h) && wf.v.a(this.f55045i, w0Var.f55045i) && Arrays.equals(this.f55046j, w0Var.f55046j) && wf.v.a(this.f55047k, w0Var.f55047k) && wf.v.a(this.f55048l, w0Var.f55048l) && wf.v.a(this.f55049m, w0Var.f55049m) && wf.v.a(this.n, w0Var.n) && wf.v.a(this.o, w0Var.o) && wf.v.a(this.f55050p, w0Var.f55050p) && wf.v.a(this.f55052r, w0Var.f55052r) && wf.v.a(this.f55053s, w0Var.f55053s) && wf.v.a(this.f55054t, w0Var.f55054t) && wf.v.a(this.f55055u, w0Var.f55055u) && wf.v.a(this.f55056v, w0Var.f55056v) && wf.v.a(this.f55057w, w0Var.f55057w) && wf.v.a(this.f55058x, w0Var.f55058x) && wf.v.a(this.f55059y, w0Var.f55059y) && wf.v.a(this.f55060z, w0Var.f55060z) && wf.v.a(this.A, w0Var.A) && wf.v.a(this.B, w0Var.B) && wf.v.a(this.C, w0Var.C) && wf.v.a(this.D, w0Var.D) && wf.v.a(this.E, w0Var.E)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f55037a, this.f55038b, this.f55039c, this.f55040d, this.f55041e, this.f55042f, this.f55043g, this.f55044h, this.f55045i, Integer.valueOf(Arrays.hashCode(this.f55046j)), this.f55047k, this.f55048l, this.f55049m, this.n, this.o, this.f55050p, this.f55052r, this.f55053s, this.f55054t, this.f55055u, this.f55056v, this.f55057w, this.f55058x, this.f55059y, this.f55060z, this.A, this.B, this.C, this.D, this.E});
    }
}
