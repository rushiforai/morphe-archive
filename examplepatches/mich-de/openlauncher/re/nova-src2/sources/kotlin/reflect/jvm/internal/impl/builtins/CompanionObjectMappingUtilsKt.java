package kotlin.reflect.jvm.internal.impl.builtins;

import b70.g;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.resolve.DescriptorUtils;
import kotlin.reflect.jvm.internal.impl.resolve.descriptorUtil.DescriptorUtilsKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class CompanionObjectMappingUtilsKt {
    public static final boolean isMappedIntrinsicCompanionObject(@NotNull CompanionObjectMapping companionObjectMapping, @NotNull ClassDescriptor classDescriptor) {
        Intrinsics.g(companionObjectMapping, "<this>");
        Intrinsics.g(classDescriptor, "classDescriptor");
        if (!DescriptorUtils.isCompanionObject(classDescriptor)) {
            return false;
        }
        Set<ClassId> classIds = companionObjectMapping.getClassIds();
        ClassId classId = DescriptorUtilsKt.getClassId(classDescriptor);
        return g.O0(classIds, classId != null ? classId.getOuterClassId() : null);
    }
}
