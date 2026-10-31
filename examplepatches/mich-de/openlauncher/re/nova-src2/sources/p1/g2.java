package p1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class g2 implements Iterable, KMappedMarker {

    /* renamed from: b, reason: collision with root package name */
    public int f81428b;

    /* renamed from: d, reason: collision with root package name */
    public int f81430d;

    /* renamed from: e, reason: collision with root package name */
    public int f81431e;

    /* renamed from: g, reason: collision with root package name */
    public boolean f81433g;

    /* renamed from: h, reason: collision with root package name */
    public int f81434h;

    /* renamed from: j, reason: collision with root package name */
    public HashMap f81436j;

    /* renamed from: k, reason: collision with root package name */
    public z.c0 f81437k;

    /* renamed from: a, reason: collision with root package name */
    public int[] f81427a = new int[0];

    /* renamed from: c, reason: collision with root package name */
    public Object[] f81429c = new Object[0];

    /* renamed from: f, reason: collision with root package name */
    public final Object f81432f = new Object();

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f81435i = new ArrayList();

    public final int b(a aVar) {
        if (this.f81433g) {
            u.c("Use active SlotWriter to determine anchor location instead");
        }
        if (!aVar.a()) {
            o1.a("Anchor refers to a group that was removed");
        }
        return aVar.f81379a;
    }

    public final void c() {
        this.f81436j = new HashMap();
    }

    public final f2 d() {
        if (this.f81433g) {
            throw new IllegalStateException("Cannot read while a writer is pending");
        }
        this.f81431e++;
        return new f2(this);
    }

    public final k2 e() {
        if (this.f81433g) {
            u.c("Cannot start a writer when another writer is pending");
        }
        if (this.f81431e > 0) {
            u.c("Cannot start a writer when a reader is pending");
        }
        this.f81433g = true;
        this.f81434h++;
        return new k2(this);
    }

    public final boolean f(a aVar) {
        int iE;
        return aVar.a() && (iE = i2.e(this.f81435i, aVar.f81379a, this.f81428b)) >= 0 && Intrinsics.b(this.f81435i.get(iE), aVar);
    }

    public final s0 g(int i5) {
        int i11;
        ArrayList arrayList;
        int iE;
        HashMap map = this.f81436j;
        if (map != null) {
            if (this.f81433g) {
                u.c("use active SlotWriter to crate an anchor for location instead");
            }
            a aVar = (i5 < 0 || i5 >= (i11 = this.f81428b) || (iE = i2.e((arrayList = this.f81435i), i5, i11)) < 0) ? null : (a) arrayList.get(iE);
            if (aVar != null) {
                return (s0) map.get(aVar);
            }
        }
        return null;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new r0(this, 0, this.f81428b);
    }
}
