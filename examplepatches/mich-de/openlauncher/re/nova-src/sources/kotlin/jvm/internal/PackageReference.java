package kotlin.jvm.internal;

import java.util.Collection;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.KotlinReflectionNotSupportedError;

@SinceKotlin
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/jvm/internal/PackageReference;", "Lkotlin/jvm/internal/ClassBasedDeclarationContainer;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PackageReference implements ClassBasedDeclarationContainer {

    /* renamed from: a, reason: collision with root package name */
    public final Class f71858a;

    public PackageReference(Class jClass, String str) {
        Intrinsics.g(jClass, "jClass");
        this.f71858a = jClass;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof PackageReference) {
            return Intrinsics.b(this.f71858a, ((PackageReference) obj).f71858a);
        }
        return false;
    }

    @Override // kotlin.jvm.internal.ClassBasedDeclarationContainer
    /* renamed from: getJClass, reason: from getter */
    public final Class getF71858a() {
        return this.f71858a;
    }

    @Override // kotlin.reflect.KDeclarationContainer
    public final Collection getMembers() {
        throw new KotlinReflectionNotSupportedError();
    }

    public final int hashCode() {
        return this.f71858a.hashCode();
    }

    public final String toString() {
        return this.f71858a + " (Kotlin reflection is not available)";
    }
}
