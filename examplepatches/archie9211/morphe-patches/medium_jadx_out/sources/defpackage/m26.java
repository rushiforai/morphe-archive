package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m26 {
    public final /* synthetic */ int a;
    public final lr5 b;
    public final lr5 c;
    public final lr5 d;
    public final lr5 e;
    public final Serializable f;

    /* JADX WARN: Multi-variable type inference failed */
    public m26(m26[] m26VarArr) {
        int i = 0;
        this.a = 0;
        this.f = m26VarArr;
        int length = m26VarArr.length;
        lr5[] lr5VarArr = new lr5[length];
        for (int i2 = 0; i2 < length; i2++) {
            lr5VarArr[i2] = ((m26[]) this.f)[i2].b();
        }
        int i3 = 1;
        this.b = new lr5(1, new yse(lr5VarArr, i));
        int length2 = ((m26[]) this.f).length;
        lr5[] lr5VarArr2 = new lr5[length2];
        for (int i4 = 0; i4 < length2; i4++) {
            lr5VarArr2[i4] = ((m26[]) this.f)[i4].d();
        }
        this.c = new lr5(0, new kr5(lr5VarArr2, i));
        int length3 = ((m26[]) this.f).length;
        lr5[] lr5VarArr3 = new lr5[length3];
        for (int i5 = 0; i5 < length3; i5++) {
            lr5VarArr3[i5] = ((m26[]) this.f)[i5].c();
        }
        this.d = new lr5(1, new yse(lr5VarArr3, i3));
        int length4 = ((m26[]) this.f).length;
        lr5[] lr5VarArr4 = new lr5[length4];
        for (int i6 = 0; i6 < length4; i6++) {
            lr5VarArr4[i6] = ((m26[]) this.f)[i6].a();
        }
        this.e = new lr5(0, new kr5(lr5VarArr4, i3));
    }

    public final lr5 a() {
        int i = this.a;
        return this.e;
    }

    public final lr5 b() {
        int i = this.a;
        return this.b;
    }

    public final lr5 c() {
        int i = this.a;
        return this.d;
    }

    public final lr5 d() {
        int i = this.a;
        return this.c;
    }

    public final String toString() {
        int i = this.a;
        Object obj = this.f;
        switch (i) {
            case 0:
                return k80.D0((m26[]) obj, null, "innermostOf(", ")", null, 57);
            default:
                return wgd.t(')', "RectRulers(", (String) obj);
        }
    }

    public m26(String str) {
        this.a = 1;
        this.f = str;
        this.b = new lr5(1, null);
        this.c = new lr5(0, null);
        this.d = new lr5(1, null);
        this.e = new lr5(0, null);
    }
}
