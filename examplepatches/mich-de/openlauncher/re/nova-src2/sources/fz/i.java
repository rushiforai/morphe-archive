package fz;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class i {

    @NotNull
    public static final h Companion = new h();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f56256c = {null, EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.icon.CornerType", q.values())};

    /* renamed from: d, reason: collision with root package name */
    public static final i f56257d = new i(25, q.f56342d);

    /* renamed from: e, reason: collision with root package name */
    public static final i f56258e = new i(0, q.f56341c);

    /* renamed from: a, reason: collision with root package name */
    public final int f56259a;

    /* renamed from: b, reason: collision with root package name */
    public final q f56260b;

    public /* synthetic */ i(int i5, int i11, q qVar) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, g.f56246a.getDescriptor());
        }
        this.f56259a = i11;
        this.f56260b = qVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f56259a == iVar.f56259a && this.f56260b == iVar.f56260b;
    }

    public final int hashCode() {
        return this.f56260b.hashCode() + (Integer.hashCode(this.f56259a) * 31);
    }

    public final String toString() {
        return "CornerConfig(" + this.f56259a + ", " + this.f56260b + ")";
    }

    public i(int i5, q qVar) {
        this.f56259a = i5;
        this.f56260b = qVar;
    }
}
