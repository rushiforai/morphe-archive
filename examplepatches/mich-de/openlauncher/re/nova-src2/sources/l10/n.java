package l10;

import android.net.Uri;
import e10.y2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import mx.c0;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class n {

    @NotNull
    public static final m Companion = new m();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f74433c = {EnumsKt.createSimpleEnumSerializer("com.teslacoilsw.launcher.NovaAction", c0.values()), null};

    /* renamed from: d, reason: collision with root package name */
    public static final x7.n f74434d;

    /* renamed from: e, reason: collision with root package name */
    public static final x7.n f74435e;

    /* renamed from: f, reason: collision with root package name */
    public static final x7.n f74436f;

    /* renamed from: a, reason: collision with root package name */
    public final c0 f74437a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f74438b;

    static {
        Uri uri = Uri.EMPTY;
        f74434d = new x7.n(m.a(2131231774, false), m.a(2131231775, false), m.a(2131231776, false), m.a(2131231777, false));
        f74435e = new x7.n(m.a(2131231769, false), m.a(2131231770, false), m.a(2131231771, false), m.a(2131231772, false));
        f74436f = new x7.n(m.a(2131231778, false), m.a(2131231764, false), m.a(2131231765, false), m.a(2131231766, false));
    }

    public /* synthetic */ n(int i5, c0 c0Var, Uri uri) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, l.f74432a.getDescriptor());
        }
        this.f74437a = c0Var;
        if ((i5 & 2) == 0) {
            this.f74438b = null;
        } else {
            this.f74438b = uri;
        }
    }

    public final Uri a(w wVar) {
        x7.n nVar;
        Uri uri = this.f74438b;
        if (uri != null) {
            return uri;
        }
        c0 c0Var = this.f74437a;
        int iOrdinal = c0Var.ordinal();
        if (iOrdinal == 8) {
            return f74434d.i(wVar);
        }
        if (iOrdinal == 9) {
            Companion.getClass();
            y2.f51877a.getClass();
            int iOrdinal2 = ((e10.p) y2.p1().l()).ordinal();
            if (iOrdinal2 == 0) {
                nVar = new x7.n(m.a(2131231760, false), m.a(2131231761, false), m.a(2131231762, false), m.a(2131231763, false));
            } else {
                if (iOrdinal2 != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                nVar = new x7.n(m.a(2131231767, false), m.a(2131231768, false), m.a(2131231767, false), m.a(2131231768, false));
            }
            return nVar.i(wVar);
        }
        if (iOrdinal == 16) {
            return q.f74441c;
        }
        if (iOrdinal == 20) {
            return q.f74443e;
        }
        if (iOrdinal == 22) {
            return f74435e.i(wVar);
        }
        if (iOrdinal == 24) {
            return f74436f.i(wVar);
        }
        Companion.getClass();
        int iOrdinal3 = c0Var.ordinal();
        if (iOrdinal3 == 0) {
            return m.a(2131231267, false);
        }
        if (iOrdinal3 == 1) {
            return m.a(2131231753, true);
        }
        if (iOrdinal3 == 8) {
            return m.a(2131231774, false);
        }
        if (iOrdinal3 != 9) {
            return iOrdinal3 != 12 ? iOrdinal3 != 16 ? iOrdinal3 != 22 ? iOrdinal3 != 24 ? m.a(2131231759, true) : q.f74440b : m.a(2131231769, false) : m.a(2131231145, false) : m.a(2131231759, true);
        }
        y2.f51877a.getClass();
        return m.a(y2.n(), false);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f74437a == nVar.f74437a && Intrinsics.b(this.f74438b, nVar.f74438b);
    }

    public final int hashCode() {
        int iHashCode = this.f74437a.hashCode() * 31;
        Uri uri = this.f74438b;
        return iHashCode + (uri == null ? 0 : uri.hashCode());
    }

    public final String toString() {
        e10.w wVar = e10.w.f51855b;
        wVar.getClass();
        return wVar.encodeToString(Companion.serializer(), this);
    }

    public /* synthetic */ n(c0 c0Var) {
        this(c0Var, null);
    }

    public n(c0 c0Var, Uri uri) {
        this.f74437a = c0Var;
        this.f74438b = uri;
    }
}
