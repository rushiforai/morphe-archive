package z2;

import java.io.Serializable;

/* loaded from: classes2.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98131a;

    /* renamed from: b, reason: collision with root package name */
    public final p f98132b;

    /* renamed from: c, reason: collision with root package name */
    public final p f98133c;

    /* renamed from: d, reason: collision with root package name */
    public final p f98134d;

    /* renamed from: e, reason: collision with root package name */
    public final p f98135e;

    /* renamed from: f, reason: collision with root package name */
    public final Serializable f98136f;

    public q(String str) {
        this.f98131a = 1;
        this.f98136f = str;
        this.f98132b = new p(null, 1);
        this.f98133c = new p(null, 0);
        this.f98134d = new p(null, 1);
        this.f98135e = new p(null, 0);
    }

    public final p a() {
        switch (this.f98131a) {
        }
        return this.f98135e;
    }

    public final p b() {
        switch (this.f98131a) {
        }
        return this.f98132b;
    }

    public final p c() {
        switch (this.f98131a) {
        }
        return this.f98134d;
    }

    public final p d() {
        switch (this.f98131a) {
        }
        return this.f98133c;
    }

    public final String toString() {
        switch (this.f98131a) {
            case 0:
                return kotlin.collections.c.O0((q[]) this.f98136f, null, "innermostOf(", ")", null, 57);
            default:
                String str = (String) this.f98136f;
                return str != null ? h6.c1.m(')', "RectRulers(", str) : super.toString();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public q(q[] qVarArr) {
        this.f98131a = 0;
        this.f98136f = qVarArr;
        int length = qVarArr.length;
        p[] pVarArr = new p[length];
        for (int i5 = 0; i5 < length; i5++) {
            pVarArr[i5] = ((q[]) this.f98136f)[i5].b();
        }
        this.f98132b = new p(new z1(pVarArr, 0), 1);
        int length2 = ((q[]) this.f98136f).length;
        p[] pVarArr2 = new p[length2];
        for (int i11 = 0; i11 < length2; i11++) {
            pVarArr2[i11] = ((q[]) this.f98136f)[i11].d();
        }
        this.f98133c = new p(new o(pVarArr2, 0), 0);
        int length3 = ((q[]) this.f98136f).length;
        p[] pVarArr3 = new p[length3];
        for (int i12 = 0; i12 < length3; i12++) {
            pVarArr3[i12] = ((q[]) this.f98136f)[i12].c();
        }
        this.f98134d = new p(new z1(pVarArr3, 1), 1);
        int length4 = ((q[]) this.f98136f).length;
        p[] pVarArr4 = new p[length4];
        for (int i13 = 0; i13 < length4; i13++) {
            pVarArr4[i13] = ((q[]) this.f98136f)[i13].a();
        }
        this.f98135e = new p(new o(pVarArr4, 1), 0);
    }
}
