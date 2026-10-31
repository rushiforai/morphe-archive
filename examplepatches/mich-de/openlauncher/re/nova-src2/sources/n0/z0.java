package n0;

import java.util.List;

/* loaded from: classes2.dex */
public final class z0 {

    /* renamed from: a, reason: collision with root package name */
    public final List f77537a;

    /* renamed from: b, reason: collision with root package name */
    public final List[] f77538b;

    /* renamed from: c, reason: collision with root package name */
    public int f77539c;

    /* renamed from: d, reason: collision with root package name */
    public int f77540d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f77541e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ a1 f77542f;

    public z0(a1 a1Var, List list) {
        this.f77542f = a1Var;
        this.f77537a = list;
        this.f77538b = new List[list.size()];
        if (list.isEmpty()) {
            j0.b.a("NestedPrefetchController shouldn't be created with no states");
        }
    }
}
