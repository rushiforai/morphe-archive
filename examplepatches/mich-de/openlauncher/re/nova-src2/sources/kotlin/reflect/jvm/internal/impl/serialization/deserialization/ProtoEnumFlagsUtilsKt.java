package kotlin.reflect.jvm.internal.impl.serialization.deserialization;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.CallableMemberDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.DescriptorVisibilities;
import kotlin.reflect.jvm.internal.impl.descriptors.DescriptorVisibility;
import kotlin.reflect.jvm.internal.impl.metadata.ProtoBuf;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class ProtoEnumFlagsUtilsKt {

    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;
        public static final /* synthetic */ int[] $EnumSwitchMapping$1;
        public static final /* synthetic */ int[] $EnumSwitchMapping$2;

        static {
            int[] iArr = new int[ProtoBuf.MemberKind.values().length];
            try {
                iArr[ProtoBuf.MemberKind.DECLARATION.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[ProtoBuf.MemberKind.FAKE_OVERRIDE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[ProtoBuf.MemberKind.DELEGATION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[ProtoBuf.MemberKind.SYNTHESIZED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            $EnumSwitchMapping$0 = iArr;
            int[] iArr2 = new int[CallableMemberDescriptor.Kind.values().length];
            try {
                iArr2[CallableMemberDescriptor.Kind.DECLARATION.ordinal()] = 1;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr2[CallableMemberDescriptor.Kind.FAKE_OVERRIDE.ordinal()] = 2;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr2[CallableMemberDescriptor.Kind.DELEGATION.ordinal()] = 3;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                iArr2[CallableMemberDescriptor.Kind.SYNTHESIZED.ordinal()] = 4;
            } catch (NoSuchFieldError unused8) {
            }
            $EnumSwitchMapping$1 = iArr2;
            int[] iArr3 = new int[ProtoBuf.Visibility.values().length];
            try {
                iArr3[ProtoBuf.Visibility.INTERNAL.ordinal()] = 1;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                iArr3[ProtoBuf.Visibility.PRIVATE.ordinal()] = 2;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                iArr3[ProtoBuf.Visibility.PRIVATE_TO_THIS.ordinal()] = 3;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                iArr3[ProtoBuf.Visibility.PROTECTED.ordinal()] = 4;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                iArr3[ProtoBuf.Visibility.PUBLIC.ordinal()] = 5;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                iArr3[ProtoBuf.Visibility.LOCAL.ordinal()] = 6;
            } catch (NoSuchFieldError unused14) {
            }
            $EnumSwitchMapping$2 = iArr3;
        }
    }

    @NotNull
    public static final DescriptorVisibility descriptorVisibility(@NotNull ProtoEnumFlags protoEnumFlags, @Nullable ProtoBuf.Visibility visibility) {
        Intrinsics.g(protoEnumFlags, "<this>");
        switch (visibility == null ? -1 : WhenMappings.$EnumSwitchMapping$2[visibility.ordinal()]) {
            case 1:
                DescriptorVisibility INTERNAL = DescriptorVisibilities.INTERNAL;
                Intrinsics.f(INTERNAL, "INTERNAL");
                return INTERNAL;
            case 2:
                DescriptorVisibility PRIVATE = DescriptorVisibilities.PRIVATE;
                Intrinsics.f(PRIVATE, "PRIVATE");
                return PRIVATE;
            case 3:
                DescriptorVisibility PRIVATE_TO_THIS = DescriptorVisibilities.PRIVATE_TO_THIS;
                Intrinsics.f(PRIVATE_TO_THIS, "PRIVATE_TO_THIS");
                return PRIVATE_TO_THIS;
            case 4:
                DescriptorVisibility PROTECTED = DescriptorVisibilities.PROTECTED;
                Intrinsics.f(PROTECTED, "PROTECTED");
                return PROTECTED;
            case 5:
                DescriptorVisibility PUBLIC = DescriptorVisibilities.PUBLIC;
                Intrinsics.f(PUBLIC, "PUBLIC");
                return PUBLIC;
            case 6:
                DescriptorVisibility LOCAL = DescriptorVisibilities.LOCAL;
                Intrinsics.f(LOCAL, "LOCAL");
                return LOCAL;
            default:
                DescriptorVisibility PRIVATE2 = DescriptorVisibilities.PRIVATE;
                Intrinsics.f(PRIVATE2, "PRIVATE");
                return PRIVATE2;
        }
    }

    @NotNull
    public static final CallableMemberDescriptor.Kind memberKind(@NotNull ProtoEnumFlags protoEnumFlags, @Nullable ProtoBuf.MemberKind memberKind) {
        Intrinsics.g(protoEnumFlags, "<this>");
        int i5 = memberKind == null ? -1 : WhenMappings.$EnumSwitchMapping$0[memberKind.ordinal()];
        return i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? CallableMemberDescriptor.Kind.DECLARATION : CallableMemberDescriptor.Kind.SYNTHESIZED : CallableMemberDescriptor.Kind.DELEGATION : CallableMemberDescriptor.Kind.FAKE_OVERRIDE : CallableMemberDescriptor.Kind.DECLARATION;
    }
}
