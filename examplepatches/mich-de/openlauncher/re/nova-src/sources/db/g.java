package db;

import ga.h;
import java.util.List;

/* loaded from: classes2.dex */
public final class g extends c implements b {

    /* renamed from: d, reason: collision with root package name */
    public final boolean f49128d;

    public g(h hVar, String str, List list, boolean z11) {
        super(hVar, str, list);
        this.f49128d = z11;
    }

    @Override // db.b
    public final c a() {
        if (this.f49128d) {
            return this;
        }
        return new g(this.f49120a, this.f49121b, this.f49122c, true);
    }

    @Override // db.c
    public final int b() {
        return 3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f49122c.equals(gVar.f49122c) && this.f49120a.equals(gVar.f49120a) && this.f49121b.equals(gVar.f49121b) && this.f49128d == gVar.f49128d;
    }

    public final String toString() {
        return "SearchHeader:" + this.f49120a.f57319x + ":" + this.f49122c.size();
    }
}
