package w9;

import androidx.room.o;
import java.util.HashSet;
import o9.g3;

/* loaded from: classes.dex */
public final class b extends a {

    /* renamed from: c, reason: collision with root package name */
    public int f94118c;

    /* renamed from: d, reason: collision with root package name */
    public final HashSet f94119d = new HashSet();

    @Override // w9.a
    public final int b() {
        return this.f94118c;
    }

    public final void d(a aVar) {
        if (aVar == null) {
            return;
        }
        int size = aVar.f94116a.size() + this.f94118c;
        this.f94118c = size;
        this.f94118c = g3.c(size, 0, o.MAX_BIND_PARAMETER_CNT);
        this.f94119d.add(aVar);
    }

    public final boolean e() {
        return this.f94118c > 0;
    }
}
