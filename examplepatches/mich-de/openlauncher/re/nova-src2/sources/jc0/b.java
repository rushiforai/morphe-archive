package jc0;

import java.util.Map;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class b extends dc0.b {

    /* renamed from: d, reason: collision with root package name */
    public final x60.b f69434d;

    public b(String str, x60.b bVar) {
        super(str);
        this.f69434d = bVar;
    }

    @Override // dc0.b, x60.e
    public final Map a() {
        return null;
    }

    @Override // dc0.b, x60.e
    public final x60.b b() {
        return this.f69434d;
    }

    @Override // dc0.b
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b.class != obj.getClass()) {
            return false;
        }
        b bVar = (b) obj;
        return Objects.equals(this.f69434d, bVar.f69434d) && Objects.equals(this.f49218b, bVar.f49218b);
    }

    public final int hashCode() {
        String str = this.f49218b;
        int iHashCode = 31 + (str == null ? 0 : str.hashCode());
        int i5 = (iHashCode * 31) + iHashCode;
        x60.b bVar = this.f69434d;
        return i5 + (bVar != null ? Objects.hashCode(((f) bVar).f69452a) : 0);
    }

    @Override // dc0.b
    public final x60.f k() {
        return fc0.e.f54605b;
    }

    @Override // dc0.b
    public final x60.e q() {
        return this;
    }

    public b(String str, String str2, x60.b bVar) {
        super(str);
        this.f49217a = str2;
        this.f69434d = bVar;
    }
}
