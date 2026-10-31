package c00;

import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ComponentKey f19038a;

    /* renamed from: b, reason: collision with root package name */
    public final String f19039b;

    /* renamed from: c, reason: collision with root package name */
    public final NovaIconSource f19040c;

    /* renamed from: d, reason: collision with root package name */
    public final iz.c f19041d;

    public b(ComponentKey componentKey, String str, NovaIconSource novaIconSource, iz.c cVar) {
        this.f19038a = componentKey;
        this.f19039b = str;
        this.f19040c = novaIconSource;
        this.f19041d = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f19038a, bVar.f19038a) && Intrinsics.b(this.f19039b, bVar.f19039b) && Intrinsics.b(this.f19040c, bVar.f19040c) && Intrinsics.b(this.f19041d, bVar.f19041d);
    }

    public final int hashCode() {
        int i5 = this.f19038a.f21253c * 31;
        String str = this.f19039b;
        int iHashCode = (i5 + (str == null ? 0 : str.hashCode())) * 31;
        NovaIconSource novaIconSource = this.f19040c;
        return this.f19041d.hashCode() + ((iHashCode + (novaIconSource != null ? novaIconSource.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "CustomizedApp(componentKey=" + this.f19038a + ", title=" + this.f19039b + ", iconSource=" + this.f19040c + ", flags=" + this.f19041d + ")";
    }
}
