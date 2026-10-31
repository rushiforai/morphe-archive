package db;

import ga.h;
import java.util.List;

/* loaded from: classes.dex */
public final class f extends c implements b {

    /* renamed from: d, reason: collision with root package name */
    public final int f49125d;

    /* renamed from: e, reason: collision with root package name */
    public final int f49126e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f49127f;

    public f(h hVar, String str, List list, boolean z11) {
        super(hVar, str, list);
        int iCount = (int) list.stream().filter(new e(0)).count();
        this.f49125d = iCount;
        this.f49126e = Math.max(0, list.size() - iCount);
        this.f49127f = z11;
    }

    @Override // db.b
    public final c a() {
        if (this.f49127f) {
            return this;
        }
        return new f(this.f49120a, this.f49121b, this.f49122c, true);
    }

    @Override // db.c
    public final int b() {
        return 2;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f49122c.equals(fVar.f49122c) && this.f49120a.equals(fVar.f49120a) && this.f49121b.equals(fVar.f49121b) && this.f49127f == fVar.f49127f;
    }

    public final String toString() {
        return "Header:" + this.f49120a.f57319x + ":" + this.f49122c.size();
    }
}
