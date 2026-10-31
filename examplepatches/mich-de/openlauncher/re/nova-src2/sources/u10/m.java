package u10;

import android.net.Uri;
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
public final class m extends e0 {

    @NotNull
    public static final l Companion = new l();

    /* renamed from: i, reason: collision with root package name */
    public static final KSerializer[] f90391i;

    /* renamed from: c, reason: collision with root package name */
    public final String f90392c;

    /* renamed from: d, reason: collision with root package name */
    public final Uri f90393d;

    /* renamed from: e, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.c f90394e;

    /* renamed from: f, reason: collision with root package name */
    public final List f90395f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f90396g;

    /* renamed from: h, reason: collision with root package name */
    public final Function0 f90397h;

    static {
        t tVar = com.teslacoilsw.launcher.search.hero.c.Companion;
        f90391i = new KSerializer[]{null, null, null, tVar.serializer(), new ArrayListSerializer(tVar.serializer()), null, new PolymorphicSerializer(Reflection.f71864a.getOrCreateKotlinClass(Function0.class), new Annotation[0])};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(int i5, String str, String str2, Uri uri, com.teslacoilsw.launcher.search.hero.c cVar, List list, boolean z11, Function0 function0) {
        super(str, 0);
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, k.f90389a.getDescriptor());
        }
        this.f90392c = str2;
        this.f90393d = uri;
        this.f90394e = cVar;
        if ((i5 & 16) == 0) {
            this.f90395f = EmptyList.f71733a;
        } else {
            this.f90395f = list;
        }
        if ((i5 & 32) == 0) {
            this.f90396g = true;
        } else {
            this.f90396g = z11;
        }
        if ((i5 & 64) == 0) {
            this.f90397h = null;
        } else {
            this.f90397h = function0;
        }
    }

    @Override // u10.e0
    public final String a() {
        return this.f90392c;
    }

    @Override // u10.e0
    public final Uri b() {
        return this.f90393d;
    }

    @Override // u10.e0
    public final Function0 c() {
        return this.f90397h;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f90392c, mVar.f90392c) && Intrinsics.b(this.f90393d, mVar.f90393d) && Intrinsics.b(this.f90394e, mVar.f90394e) && Intrinsics.b(this.f90395f, mVar.f90395f) && this.f90396g == mVar.f90396g;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f90396g) + u4.c((this.f90394e.hashCode() + ((this.f90393d.hashCode() + (this.f90392c.hashCode() * 31)) * 31)) * 31, 31, this.f90395f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BranchHeroCard(displayName=");
        sb2.append(this.f90392c);
        sb2.append(", iconUri=");
        sb2.append(this.f90393d);
        sb2.append(", featuredContent=");
        sb2.append(this.f90394e);
        sb2.append(", actions=");
        sb2.append(this.f90395f);
        sb2.append(", suggestions=");
        return a80.m.k(sb2, this.f90396g, ")");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(String str, Uri uri, n nVar) {
        super(b.c0.k("BranchHeroCard:", str));
        EmptyList emptyList = EmptyList.f71733a;
        this.f90392c = str;
        this.f90393d = uri;
        this.f90394e = nVar;
        this.f90395f = emptyList;
        this.f90396g = true;
    }
}
