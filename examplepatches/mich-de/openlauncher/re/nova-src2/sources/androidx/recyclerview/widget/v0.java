package androidx.recyclerview.widget;

import android.view.View;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public f1 f15147a;

    /* renamed from: b, reason: collision with root package name */
    public int f15148b;

    /* renamed from: c, reason: collision with root package name */
    public int f15149c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f15150d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f15151e;

    public v0() {
        d();
    }

    public final void a() {
        this.f15149c = this.f15150d ? this.f15147a.g() : this.f15147a.k();
    }

    public final void b(int i5, View view) {
        if (this.f15150d) {
            this.f15149c = this.f15147a.m() + this.f15147a.b(view);
        } else {
            this.f15149c = this.f15147a.e(view);
        }
        this.f15148b = i5;
    }

    public final void c(int i5, View view) {
        int iM = this.f15147a.m();
        if (iM >= 0) {
            b(i5, view);
            return;
        }
        this.f15148b = i5;
        if (!this.f15150d) {
            int iE = this.f15147a.e(view);
            int iK = iE - this.f15147a.k();
            this.f15149c = iE;
            if (iK > 0) {
                int iG = (this.f15147a.g() - Math.min(0, (this.f15147a.g() - iM) - this.f15147a.b(view))) - (this.f15147a.c(view) + iE);
                if (iG < 0) {
                    this.f15149c -= Math.min(iK, -iG);
                    return;
                }
                return;
            }
            return;
        }
        int iG2 = (this.f15147a.g() - iM) - this.f15147a.b(view);
        this.f15149c = this.f15147a.g() - iG2;
        if (iG2 > 0) {
            int iC = this.f15149c - this.f15147a.c(view);
            int iK2 = this.f15147a.k();
            int iMin = iC - (Math.min(this.f15147a.e(view) - iK2, 0) + iK2);
            if (iMin < 0) {
                this.f15149c = Math.min(iG2, -iMin) + this.f15149c;
            }
        }
    }

    public final void d() {
        this.f15148b = -1;
        this.f15149c = Integer.MIN_VALUE;
        this.f15150d = false;
        this.f15151e = false;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AnchorInfo{mPosition=");
        sb2.append(this.f15148b);
        sb2.append(", mCoordinate=");
        sb2.append(this.f15149c);
        sb2.append(", mLayoutFromEnd=");
        sb2.append(this.f15150d);
        sb2.append(", mValid=");
        return a2.c.p(sb2, this.f15151e, AbstractJsonLexerKt.END_OBJ);
    }
}
