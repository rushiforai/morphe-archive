package db;

import ga.h;
import java.util.List;

/* loaded from: classes.dex */
public final class d extends c {

    /* renamed from: d, reason: collision with root package name */
    public final int f49123d;

    public d(h hVar, String str, List list, int i5) {
        super(hVar, str, list);
        this.f49123d = i5;
    }

    @Override // db.c
    public final int b() {
        return 4;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f49122c.equals(dVar.f49122c) && this.f49120a.equals(dVar.f49120a) && this.f49121b.equals(dVar.f49121b) && this.f49123d == dVar.f49123d;
    }

    public final String toString() {
        return "Content:" + this.f49120a.f57319x + ":" + this.f49122c.size() + " maxSpanSizeInCells: " + this.f49123d;
    }
}
