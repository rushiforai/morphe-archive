package kotlin.reflect.jvm.internal.impl.load.java.typeEnhancement;

import b70.g;
import b70.n;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.load.java.JvmAnnotationNames;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.types.TypeSystemCommonBackendContext;
import kotlin.reflect.jvm.internal.impl.types.model.KotlinTypeMarker;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class TypeEnhancementUtilsKt {
    @NotNull
    public static final JavaTypeQualifiers computeQualifiersForOverride(@NotNull JavaTypeQualifiers javaTypeQualifiers, @NotNull Collection<JavaTypeQualifiers> superQualifiers, boolean z11, boolean z12, boolean z13) {
        NullabilityQualifier nullabilityQualifierSelect;
        boolean z14;
        Intrinsics.g(javaTypeQualifiers, "<this>");
        Intrinsics.g(superQualifiers, "superQualifiers");
        Collection<JavaTypeQualifiers> collection = superQualifiers;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            NullabilityQualifier nullabilityForErrors = getNullabilityForErrors((JavaTypeQualifiers) it.next());
            if (nullabilityForErrors != null) {
                arrayList.add(nullabilityForErrors);
            }
        }
        NullabilityQualifier nullabilityQualifierSelect2 = select(g.N1(arrayList), getNullabilityForErrors(javaTypeQualifiers), z11);
        if (nullabilityQualifierSelect2 == null) {
            ArrayList arrayList2 = new ArrayList();
            Iterator<T> it2 = collection.iterator();
            while (it2.hasNext()) {
                NullabilityQualifier nullability = ((JavaTypeQualifiers) it2.next()).getNullability();
                if (nullability != null) {
                    arrayList2.add(nullability);
                }
            }
            nullabilityQualifierSelect = select(g.N1(arrayList2), javaTypeQualifiers.getNullability(), z11);
        } else {
            nullabilityQualifierSelect = nullabilityQualifierSelect2;
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator<T> it3 = collection.iterator();
        while (it3.hasNext()) {
            MutabilityQualifier mutability = ((JavaTypeQualifiers) it3.next()).getMutability();
            if (mutability != null) {
                arrayList3.add(mutability);
            }
        }
        MutabilityQualifier mutabilityQualifier = (MutabilityQualifier) select(g.N1(arrayList3), MutabilityQualifier.MUTABLE, MutabilityQualifier.READ_ONLY, javaTypeQualifiers.getMutability(), z11);
        NullabilityQualifier nullabilityQualifier = null;
        if (nullabilityQualifierSelect != null && !z13 && (!z12 || nullabilityQualifierSelect != NullabilityQualifier.NULLABLE)) {
            nullabilityQualifier = nullabilityQualifierSelect;
        }
        boolean z15 = false;
        if (nullabilityQualifier == NullabilityQualifier.NOT_NULL) {
            if (!javaTypeQualifiers.getDefinitelyNotNull()) {
                if (!collection.isEmpty()) {
                    Iterator<T> it4 = collection.iterator();
                    while (it4.hasNext()) {
                        if (((JavaTypeQualifiers) it4.next()).getDefinitelyNotNull()) {
                        }
                    }
                }
                z14 = false;
            }
            z14 = true;
            break;
        }
        z14 = false;
        if (nullabilityQualifier != null && nullabilityQualifierSelect2 != nullabilityQualifierSelect) {
            z15 = true;
        }
        return new JavaTypeQualifiers(nullabilityQualifier, mutabilityQualifier, z14, z15);
    }

    private static final NullabilityQualifier getNullabilityForErrors(JavaTypeQualifiers javaTypeQualifiers) {
        if (javaTypeQualifiers.isNullabilityQualifierForWarning()) {
            return null;
        }
        return javaTypeQualifiers.getNullability();
    }

    public static final boolean hasEnhancedNullability(@NotNull TypeSystemCommonBackendContext typeSystemCommonBackendContext, @NotNull KotlinTypeMarker type) {
        Intrinsics.g(typeSystemCommonBackendContext, "<this>");
        Intrinsics.g(type, "type");
        FqName ENHANCED_NULLABILITY_ANNOTATION = JvmAnnotationNames.ENHANCED_NULLABILITY_ANNOTATION;
        Intrinsics.f(ENHANCED_NULLABILITY_ANNOTATION, "ENHANCED_NULLABILITY_ANNOTATION");
        return typeSystemCommonBackendContext.hasAnnotation(type, ENHANCED_NULLABILITY_ANNOTATION);
    }

    private static final <T> T select(Set<? extends T> set, T t6, T t9, T t10, boolean z11) {
        Set<? extends T> setN1;
        if (!z11) {
            if (t10 != null && (setN1 = g.N1(n.c0(set, t10))) != null) {
                set = setN1;
            }
            return (T) g.z1(set);
        }
        T t11 = set.contains(t6) ? t6 : set.contains(t9) ? t9 : null;
        if (Intrinsics.b(t11, t6) && Intrinsics.b(t10, t9)) {
            return null;
        }
        return t10 == null ? t11 : t10;
    }

    private static final NullabilityQualifier select(Set<? extends NullabilityQualifier> set, NullabilityQualifier nullabilityQualifier, boolean z11) {
        NullabilityQualifier nullabilityQualifier2 = NullabilityQualifier.FORCE_FLEXIBILITY;
        return nullabilityQualifier == nullabilityQualifier2 ? nullabilityQualifier2 : (NullabilityQualifier) select(set, NullabilityQualifier.NOT_NULL, NullabilityQualifier.NULLABLE, nullabilityQualifier, z11);
    }
}
