package kotlin.reflect.jvm.internal.impl.builtins;

import b70.c;
import b70.g;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.builtins.StandardNames;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class CompanionObjectMapping {

    @NotNull
    public static final CompanionObjectMapping INSTANCE = new CompanionObjectMapping();

    @NotNull
    private static final Set<ClassId> classIds;

    static {
        Set<PrimitiveType> set = PrimitiveType.NUMBER_TYPES;
        ArrayList arrayList = new ArrayList(c.u0(set, 10));
        Iterator<T> it = set.iterator();
        while (it.hasNext()) {
            arrayList.add(StandardNames.getPrimitiveFqName((PrimitiveType) it.next()));
        }
        FqName safe = StandardNames.FqNames.string.toSafe();
        Intrinsics.f(safe, "toSafe(...)");
        ArrayList arrayListU1 = g.u1(arrayList, safe);
        FqName safe2 = StandardNames.FqNames._boolean.toSafe();
        Intrinsics.f(safe2, "toSafe(...)");
        ArrayList arrayListU12 = g.u1(arrayListU1, safe2);
        FqName safe3 = StandardNames.FqNames._enum.toSafe();
        Intrinsics.f(safe3, "toSafe(...)");
        ArrayList arrayListU13 = g.u1(arrayListU12, safe3);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator it2 = arrayListU13.iterator();
        while (it2.hasNext()) {
            linkedHashSet.add(ClassId.topLevel((FqName) it2.next()));
        }
        classIds = linkedHashSet;
    }

    private CompanionObjectMapping() {
    }

    @NotNull
    public final Set<ClassId> allClassesWithIntrinsicCompanions() {
        return classIds;
    }

    @NotNull
    public final Set<ClassId> getClassIds() {
        return classIds;
    }
}
