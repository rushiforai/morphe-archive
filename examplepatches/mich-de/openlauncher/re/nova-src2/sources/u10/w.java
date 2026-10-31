package u10;

import android.net.Uri;
import e10.z2;
import java.lang.annotation.Annotation;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class w extends e0 {

    @NotNull
    public static final v Companion = new v();

    /* renamed from: h, reason: collision with root package name */
    public static final KSerializer[] f90426h;

    /* renamed from: c, reason: collision with root package name */
    public final String f90427c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f90428d;

    /* renamed from: e, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.c f90429e;

    /* renamed from: f, reason: collision with root package name */
    public final List f90430f;

    /* renamed from: g, reason: collision with root package name */
    public final Function0 f90431g;

    static {
        t tVar = com.teslacoilsw.launcher.search.hero.c.Companion;
        f90426h = new KSerializer[]{null, null, null, tVar.serializer(), new ArrayListSerializer(tVar.serializer()), new PolymorphicSerializer(Reflection.f71864a.getOrCreateKotlinClass(Function0.class), new Annotation[0])};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(int i5, String str, String str2, Uri uri, com.teslacoilsw.launcher.search.hero.c cVar, List list, Function0 function0) {
        super(str, 0);
        if (11 != (i5 & 11)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 11, u.f90424a.getDescriptor());
        }
        this.f90427c = str2;
        if ((i5 & 4) == 0) {
            this.f90428d = r10.o0.d(z2.v(2131231789, "com.teslacoilsw.launcher"), r10.n0.f85193c);
        } else {
            this.f90428d = uri;
        }
        this.f90429e = cVar;
        if ((i5 & 16) == 0) {
            this.f90430f = EmptyList.f71733a;
        } else {
            this.f90430f = list;
        }
        if ((i5 & 32) == 0) {
            this.f90431g = null;
        } else {
            this.f90431g = function0;
        }
    }

    public static w e(w wVar, String str, com.teslacoilsw.launcher.search.hero.c cVar, List list, int i5) {
        if ((i5 & 1) != 0) {
            str = wVar.f90427c;
        }
        Uri uri = wVar.f90428d;
        if ((i5 & 4) != 0) {
            cVar = wVar.f90429e;
        }
        if ((i5 & 8) != 0) {
            list = wVar.f90430f;
        }
        wVar.getClass();
        return new w(str, uri, cVar, list);
    }

    @Override // u10.e0
    public final String a() {
        return this.f90427c;
    }

    @Override // u10.e0
    public final Uri b() {
        return this.f90428d;
    }

    @Override // u10.e0
    public final Function0 c() {
        return this.f90431g;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return Intrinsics.b(this.f90427c, wVar.f90427c) && Intrinsics.b(this.f90428d, wVar.f90428d) && Intrinsics.b(this.f90429e, wVar.f90429e) && Intrinsics.b(this.f90430f, wVar.f90430f);
    }

    public final int hashCode() {
        int iHashCode = (this.f90428d.hashCode() + (this.f90427c.hashCode() * 31)) * 31;
        com.teslacoilsw.launcher.search.hero.c cVar = this.f90429e;
        return this.f90430f.hashCode() + ((iHashCode + (cVar == null ? 0 : cVar.hashCode())) * 31);
    }

    public final String toString() {
        return "CompositeCard(displayName=" + this.f90427c + ", iconUri=" + this.f90428d + ", featuredContent=" + this.f90429e + ", actions=" + this.f90430f + ")";
    }

    public w(String str, Uri uri, com.teslacoilsw.launcher.search.hero.c cVar, List list) {
        super(b.c0.k("CompositeCard:", str));
        this.f90427c = str;
        this.f90428d = uri;
        this.f90429e = cVar;
        this.f90430f = list;
    }
}
