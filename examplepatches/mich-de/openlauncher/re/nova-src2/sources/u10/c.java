package u10;

import android.content.ComponentName;
import android.net.Uri;
import android.os.Process;
import b.u4;
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
public final class c extends e0 {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: h, reason: collision with root package name */
    public static final KSerializer[] f90365h = {null, null, null, new ArrayListSerializer(com.teslacoilsw.launcher.search.hero.c.Companion.serializer()), null, new PolymorphicSerializer(Reflection.f71864a.getOrCreateKotlinClass(Function0.class), new Annotation[0])};

    /* renamed from: c, reason: collision with root package name */
    public final String f90366c;

    /* renamed from: d, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.a f90367d;

    /* renamed from: e, reason: collision with root package name */
    public final List f90368e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f90369f;

    /* renamed from: g, reason: collision with root package name */
    public final Function0 f90370g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(int i5, String str, String str2, com.teslacoilsw.launcher.search.hero.a aVar, List list, boolean z11, Function0 function0) {
        super(str, 0);
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, a.f90363a.getDescriptor());
        }
        this.f90366c = str2;
        this.f90367d = aVar;
        if ((i5 & 8) == 0) {
            this.f90368e = EmptyList.f71733a;
        } else {
            this.f90368e = list;
        }
        if ((i5 & 16) == 0) {
            this.f90369f = true;
        } else {
            this.f90369f = z11;
        }
        if ((i5 & 32) == 0) {
            this.f90370g = null;
        } else {
            this.f90370g = function0;
        }
    }

    public static c e(c cVar, com.teslacoilsw.launcher.search.hero.a aVar, List list, boolean z11, int i5) {
        String str = cVar.f90366c;
        if ((i5 & 2) != 0) {
            aVar = cVar.f90367d;
        }
        if ((i5 & 4) != 0) {
            list = cVar.f90368e;
        }
        if ((i5 & 8) != 0) {
            z11 = cVar.f90369f;
        }
        cVar.getClass();
        return new c(str, aVar, list, z11);
    }

    @Override // u10.e0
    public final String a() {
        return this.f90366c;
    }

    @Override // u10.e0
    public final Uri b() {
        com.teslacoilsw.launcher.search.hero.a aVar = this.f90367d;
        String str = aVar.f46241b;
        String str2 = aVar.f46242c;
        long j11 = aVar.f46243d;
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("appIcon");
        builder.authority(new ComponentName(str, str2).flattenToShortString());
        if (j11 != -1 && j11 != ((ja.h) ja.h.f69294h.f95127b).c(Process.myUserHandle())) {
            builder.fragment(String.valueOf(j11));
        }
        return builder.build();
    }

    @Override // u10.e0
    public final Function0 c() {
        return this.f90370g;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f90366c, cVar.f90366c) && Intrinsics.b(this.f90367d, cVar.f90367d) && Intrinsics.b(this.f90368e, cVar.f90368e) && this.f90369f == cVar.f90369f;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f90369f) + u4.c((this.f90367d.hashCode() + (this.f90366c.hashCode() * 31)) * 31, 31, this.f90368e);
    }

    public final String toString() {
        return "AppCard(displayName=" + this.f90366c + ", featuredContent=" + this.f90367d + ", actions=" + this.f90368e + ", suggestions=" + this.f90369f + ")";
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public c(String str, com.teslacoilsw.launcher.search.hero.a aVar, List list, boolean z11) {
        b bVar = Companion;
        String str2 = aVar.f46241b;
        String str3 = aVar.f46242c;
        long j11 = aVar.f46243d;
        bVar.getClass();
        super(b.a(j11, str2, str3));
        this.f90366c = str;
        this.f90367d = aVar;
        this.f90368e = list;
        this.f90369f = z11;
    }

    public c(String str, com.teslacoilsw.launcher.search.hero.a aVar, List list, int i5) {
        this(str, aVar, (i5 & 4) != 0 ? EmptyList.f71733a : list, true);
    }
}
