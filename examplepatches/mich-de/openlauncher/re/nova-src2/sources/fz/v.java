package fz;

import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: j, reason: collision with root package name */
    public static final v f56366j = new v(1.0f, 100, 0, 0, d.f56189j, false, false, false, 384);

    /* renamed from: a, reason: collision with root package name */
    public final float f56367a;

    /* renamed from: b, reason: collision with root package name */
    public final int f56368b;

    /* renamed from: c, reason: collision with root package name */
    public final int f56369c;

    /* renamed from: d, reason: collision with root package name */
    public final int f56370d;

    /* renamed from: e, reason: collision with root package name */
    public final d f56371e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f56372f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f56373g;

    /* renamed from: h, reason: collision with root package name */
    public final f f56374h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f56375i;

    public v(float f11, int i5, int i11, int i12, d dVar, boolean z11, boolean z12, f fVar, boolean z13) {
        this.f56367a = f11;
        this.f56368b = i5;
        this.f56369c = i11;
        this.f56370d = i12;
        this.f56371e = dVar;
        this.f56372f = z11;
        this.f56373g = z12;
        this.f56374h = fVar;
        this.f56375i = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return Float.compare(this.f56367a, vVar.f56367a) == 0 && this.f56368b == vVar.f56368b && this.f56369c == vVar.f56369c && this.f56370d == vVar.f56370d && Intrinsics.b(this.f56371e, vVar.f56371e) && this.f56372f == vVar.f56372f && this.f56373g == vVar.f56373g && Intrinsics.b(this.f56374h, vVar.f56374h) && this.f56375i == vVar.f56375i;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f56375i) + ((this.f56374h.hashCode() + c9.f(c9.f((this.f56371e.hashCode() + u4.a(this.f56370d, u4.a(this.f56369c, u4.a(this.f56368b, Float.hashCode(this.f56367a) * 31, 31), 31), 31)) * 31, 31, this.f56372f), 31, this.f56373g)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IconNormalizationResult(scale=");
        sb2.append(this.f56367a);
        sb2.append(", size=");
        sb2.append(this.f56368b);
        sb2.append(", horizontalOffset=");
        b.c0.A(sb2, this.f56369c, ", verticalOffset=", this.f56370d, ", shape=");
        sb2.append(this.f56371e);
        sb2.append(", canAddShadow=");
        sb2.append(this.f56372f);
        sb2.append(", canRemoveShadow=");
        sb2.append(this.f56373g);
        sb2.append(", cornerColors=");
        sb2.append(this.f56374h);
        sb2.append(", fullFrame=");
        return a80.m.k(sb2, this.f56375i, ")");
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    public /* synthetic */ v(float r11, int r12, int r13, int r14, fz.d r15, boolean r16, boolean r17, boolean r18, int r19) {
        /*
            r10 = this;
            fz.f r8 = new fz.f
            r0 = 0
            r8.<init>(r0, r0, r0, r0)
            r1 = r19
            r1 = r1 & 256(0x100, float:3.59E-43)
            if (r1 == 0) goto L18
            r9 = r0
            r1 = r11
            r2 = r12
            r3 = r13
            r4 = r14
            r5 = r15
            r6 = r16
            r7 = r17
            r0 = r10
            goto L24
        L18:
            r9 = r18
            r0 = r10
            r1 = r11
            r2 = r12
            r3 = r13
            r4 = r14
            r5 = r15
            r6 = r16
            r7 = r17
        L24:
            r0.<init>(r1, r2, r3, r4, r5, r6, r7, r8, r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: fz.v.<init>(float, int, int, int, fz.d, boolean, boolean, boolean, int):void");
    }
}
