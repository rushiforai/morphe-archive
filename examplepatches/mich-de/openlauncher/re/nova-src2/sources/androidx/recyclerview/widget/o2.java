package androidx.recyclerview.widget;

import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class o2 {

    /* renamed from: a, reason: collision with root package name */
    public int f15069a;

    /* renamed from: b, reason: collision with root package name */
    public int f15070b;

    /* renamed from: c, reason: collision with root package name */
    public int f15071c;

    /* renamed from: d, reason: collision with root package name */
    public int f15072d;

    /* renamed from: e, reason: collision with root package name */
    public int f15073e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f15074f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f15075g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f15076h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f15077i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f15078j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f15079k;

    /* renamed from: l, reason: collision with root package name */
    public int f15080l;

    /* renamed from: m, reason: collision with root package name */
    public long f15081m;
    public int n;

    public final void a(int i5) {
        if ((this.f15072d & i5) != 0) {
            return;
        }
        throw new IllegalStateException("Layout state should be one of " + Integer.toBinaryString(i5) + " but it is " + Integer.toBinaryString(this.f15072d));
    }

    public final int b() {
        return this.f15075g ? this.f15070b - this.f15071c : this.f15073e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("State{mTargetPosition=");
        sb2.append(this.f15069a);
        sb2.append(", mData=null, mItemCount=");
        sb2.append(this.f15073e);
        sb2.append(", mIsMeasuring=");
        sb2.append(this.f15077i);
        sb2.append(", mPreviousLayoutItemCount=");
        sb2.append(this.f15070b);
        sb2.append(", mDeletedInvisibleItemCountSincePreviousLayout=");
        sb2.append(this.f15071c);
        sb2.append(", mStructureChanged=");
        sb2.append(this.f15074f);
        sb2.append(", mInPreLayout=");
        sb2.append(this.f15075g);
        sb2.append(", mRunSimpleAnimations=");
        sb2.append(this.f15078j);
        sb2.append(", mRunPredictiveAnimations=");
        return a2.c.p(sb2, this.f15079k, AbstractJsonLexerKt.END_OBJ);
    }
}
