package l10;

import b.c9;
import b.u4;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import mx.c0;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class w {

    @NotNull
    public static final v Companion = new v();

    /* renamed from: e, reason: collision with root package name */
    public static final KSerializer[] f74461e;

    /* renamed from: f, reason: collision with root package name */
    public static final w f74462f;

    /* renamed from: g, reason: collision with root package name */
    public static final w f74463g;

    /* renamed from: a, reason: collision with root package name */
    public final t f74464a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f74465b;

    /* renamed from: c, reason: collision with root package name */
    public final List f74466c;

    /* renamed from: d, reason: collision with root package name */
    public final List f74467d;

    static {
        l lVar = l.f74432a;
        f74461e = new KSerializer[]{null, null, new ArrayListSerializer(lVar), new ArrayListSerializer(lVar)};
        t.Companion.getClass();
        t tVar = t.f74453g;
        List listP = ul.b.P(new n(c0.APP_SEARCH, null));
        EmptyList emptyList = EmptyList.f71733a;
        f74462f = new w(tVar, false, listP, emptyList);
        tz.c.Companion.getClass();
        f74463g = new w(new t(false, false, 0, 0.0f, new tz.v(0, 0, 0, 0, 0)), false, emptyList, emptyList);
    }

    public /* synthetic */ w(int i5, t tVar, boolean z11, List list, List list2) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, u.f74460a.getDescriptor());
        }
        this.f74464a = tVar;
        this.f74465b = z11;
        this.f74466c = list;
        this.f74467d = list2;
    }

    public static w a(w wVar, t tVar, boolean z11, List list, List list2, int i5) {
        if ((i5 & 1) != 0) {
            tVar = wVar.f74464a;
        }
        if ((i5 & 2) != 0) {
            z11 = wVar.f74465b;
        }
        if ((i5 & 4) != 0) {
            list = wVar.f74466c;
        }
        if ((i5 & 8) != 0) {
            list2 = wVar.f74467d;
        }
        wVar.getClass();
        return new w(tVar, z11, list, list2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return Intrinsics.b(this.f74464a, wVar.f74464a) && this.f74465b == wVar.f74465b && Intrinsics.b(this.f74466c, wVar.f74466c) && Intrinsics.b(this.f74467d, wVar.f74467d);
    }

    public final int hashCode() {
        return this.f74467d.hashCode() + u4.c(c9.f(this.f74464a.hashCode() * 31, 31, this.f74465b), 31, this.f74466c);
    }

    public final String toString() {
        return "QsbConfig(bg=" + this.f74464a + ", monochrome=" + this.f74465b + ", startActions=" + this.f74466c + ", endActions=" + this.f74467d + ")";
    }

    public w(t tVar, boolean z11, List list, List list2) {
        this.f74464a = tVar;
        this.f74465b = z11;
        this.f74466c = list;
        this.f74467d = list2;
    }
}
