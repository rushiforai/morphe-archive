package kotlin.reflect.jvm.internal.impl.descriptors.runtime.components;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import r70.j;

/* loaded from: classes5.dex */
public final class ReflectKotlinClassFinderKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final String toRuntimeFqName(ClassId classId) {
        String strAsString = classId.getRelativeClassName().asString();
        Intrinsics.f(strAsString, "asString(...)");
        String strE0 = j.E0(strAsString, '.', '$');
        if (classId.getPackageFqName().isRoot()) {
            return strE0;
        }
        return classId.getPackageFqName() + '.' + strE0;
    }
}
