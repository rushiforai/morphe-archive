package androidx.recyclerview.widget;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class y2 {

    /* renamed from: a, reason: collision with root package name */
    public int f15187a;

    /* renamed from: b, reason: collision with root package name */
    public int f15188b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f15189c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f15190d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f15191e;

    /* renamed from: f, reason: collision with root package name */
    public int[] f15192f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ StaggeredGridLayoutManager f15193g;

    public y2(StaggeredGridLayoutManager staggeredGridLayoutManager) {
        this.f15193g = staggeredGridLayoutManager;
        a();
    }

    public final void a() {
        this.f15187a = -1;
        this.f15188b = Integer.MIN_VALUE;
        this.f15189c = false;
        this.f15190d = false;
        this.f15191e = false;
        int[] iArr = this.f15192f;
        if (iArr != null) {
            Arrays.fill(iArr, -1);
        }
    }
}
