package sy;

import ab.e0;
import android.graphics.Path;
import b.u4;
import fz.i;
import fz.p;
import fz.q;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class c extends e0 {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: h, reason: collision with root package name */
    public static final c f87826h;

    /* renamed from: i, reason: collision with root package name */
    public static final c f87827i;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f87828c;

    /* renamed from: d, reason: collision with root package name */
    public final p f87829d;

    /* renamed from: e, reason: collision with root package name */
    public final int f87830e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f87831f;

    /* renamed from: g, reason: collision with root package name */
    public final Path f87832g;

    static {
        q qVar = q.f56341c;
        f87826h = new c(false, new p(new i(0, qVar), null, 14), 0, false);
        f87827i = new c(true, new p(new i(20, qVar), null, 14), 8, false);
    }

    public c(boolean z11, p pVar, int i5, boolean z12) {
        this.f87828c = z11;
        this.f87829d = pVar;
        this.f87830e = i5;
        this.f87831f = z12;
        this.f87832g = new Path();
    }

    public static c Z(c cVar, boolean z11, p pVar, int i5, boolean z12, int i11) {
        if ((i11 & 1) != 0) {
            z11 = cVar.f87828c;
        }
        if ((i11 & 2) != 0) {
            pVar = cVar.f87829d;
        }
        if ((i11 & 4) != 0) {
            i5 = cVar.f87830e;
        }
        if ((i11 & 8) != 0) {
            z12 = cVar.f87831f;
        }
        cVar.getClass();
        return new c(z11, pVar, i5, z12);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f87828c == cVar.f87828c && Intrinsics.b(this.f87829d, cVar.f87829d) && this.f87830e == cVar.f87830e && this.f87831f == cVar.f87831f;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f87831f) + u4.a(this.f87830e, (this.f87829d.hashCode() + (Boolean.hashCode(this.f87828c) * 31)) * 31, 31);
    }

    public final String toString() {
        return "DockBackground(enabled=" + this.f87828c + ", cornerConfig=" + this.f87829d + ", horizontalPaddingDp=" + this.f87830e + ", drawUnderNavBar=" + this.f87831f + ")";
    }

    public c(int i5, boolean z11, p pVar, int i11, boolean z12) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, a.f87825a.getDescriptor());
        }
        this.f87828c = z11;
        this.f87829d = pVar;
        this.f87830e = i11;
        this.f87831f = z12;
        this.f87832g = new Path();
    }
}
