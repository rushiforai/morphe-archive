package kotlin.reflect.jvm.internal.impl.load.java.components;

import java.util.Collections;
import java.util.List;
import kotlin.reflect.jvm.internal.impl.descriptors.CallableMemberDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ValueParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaMethod;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public interface SignaturePropagator {
    public static final SignaturePropagator DO_NOTHING = new SignaturePropagator() { // from class: kotlin.reflect.jvm.internal.impl.load.java.components.SignaturePropagator.1
        private static /* synthetic */ void $$$reportNull$$$0(int i5) {
            Object[] objArr = new Object[3];
            switch (i5) {
                case 1:
                    objArr[0] = "owner";
                    break;
                case 2:
                    objArr[0] = "returnType";
                    break;
                case 3:
                    objArr[0] = "valueParameters";
                    break;
                case 4:
                    objArr[0] = "typeParameters";
                    break;
                case 5:
                    objArr[0] = "descriptor";
                    break;
                case 6:
                    objArr[0] = "signatureErrors";
                    break;
                default:
                    objArr[0] = "method";
                    break;
            }
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/SignaturePropagator$1";
            if (i5 == 5 || i5 == 6) {
                objArr[2] = "reportSignatureErrors";
            } else {
                objArr[2] = "resolvePropagatedSignature";
            }
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
        }

        @Override // kotlin.reflect.jvm.internal.impl.load.java.components.SignaturePropagator
        public void reportSignatureErrors(@NotNull CallableMemberDescriptor callableMemberDescriptor, @NotNull List<String> list) {
            if (callableMemberDescriptor == null) {
                $$$reportNull$$$0(5);
            }
            if (list == null) {
                $$$reportNull$$$0(6);
            }
            throw new UnsupportedOperationException("Should not be called");
        }

        @Override // kotlin.reflect.jvm.internal.impl.load.java.components.SignaturePropagator
        @NotNull
        public PropagatedSignature resolvePropagatedSignature(@NotNull JavaMethod javaMethod, @NotNull ClassDescriptor classDescriptor, @NotNull KotlinType kotlinType, @Nullable KotlinType kotlinType2, @NotNull List<ValueParameterDescriptor> list, @NotNull List<TypeParameterDescriptor> list2) {
            if (javaMethod == null) {
                $$$reportNull$$$0(0);
            }
            if (classDescriptor == null) {
                $$$reportNull$$$0(1);
            }
            if (kotlinType == null) {
                $$$reportNull$$$0(2);
            }
            if (list == null) {
                $$$reportNull$$$0(3);
            }
            if (list2 == null) {
                $$$reportNull$$$0(4);
            }
            return new PropagatedSignature(kotlinType, kotlinType2, list, list2, Collections.EMPTY_LIST, false);
        }
    };

    public static class PropagatedSignature {
        private final boolean hasStableParameterNames;
        private final KotlinType receiverType;
        private final KotlinType returnType;
        private final List<String> signatureErrors;
        private final List<TypeParameterDescriptor> typeParameters;
        private final List<ValueParameterDescriptor> valueParameters;

        private static /* synthetic */ void $$$reportNull$$$0(int i5) {
            String str = (i5 == 4 || i5 == 5 || i5 == 6 || i5 == 7) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
            Object[] objArr = new Object[(i5 == 4 || i5 == 5 || i5 == 6 || i5 == 7) ? 2 : 3];
            switch (i5) {
                case 1:
                    objArr[0] = "valueParameters";
                    break;
                case 2:
                    objArr[0] = "typeParameters";
                    break;
                case 3:
                    objArr[0] = "signatureErrors";
                    break;
                case 4:
                case 5:
                case 6:
                case 7:
                    objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/components/SignaturePropagator$PropagatedSignature";
                    break;
                default:
                    objArr[0] = "returnType";
                    break;
            }
            if (i5 == 4) {
                objArr[1] = "getReturnType";
            } else if (i5 == 5) {
                objArr[1] = "getValueParameters";
            } else if (i5 == 6) {
                objArr[1] = "getTypeParameters";
            } else if (i5 != 7) {
                objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/SignaturePropagator$PropagatedSignature";
            } else {
                objArr[1] = "getErrors";
            }
            if (i5 != 4 && i5 != 5 && i5 != 6 && i5 != 7) {
                objArr[2] = "<init>";
            }
            String str2 = String.format(str, objArr);
            if (i5 != 4 && i5 != 5 && i5 != 6 && i5 != 7) {
                throw new IllegalArgumentException(str2);
            }
            throw new IllegalStateException(str2);
        }

        public PropagatedSignature(@NotNull KotlinType kotlinType, @Nullable KotlinType kotlinType2, @NotNull List<ValueParameterDescriptor> list, @NotNull List<TypeParameterDescriptor> list2, @NotNull List<String> list3, boolean z11) {
            if (kotlinType == null) {
                $$$reportNull$$$0(0);
            }
            if (list == null) {
                $$$reportNull$$$0(1);
            }
            if (list2 == null) {
                $$$reportNull$$$0(2);
            }
            if (list3 == null) {
                $$$reportNull$$$0(3);
            }
            this.returnType = kotlinType;
            this.receiverType = kotlinType2;
            this.valueParameters = list;
            this.typeParameters = list2;
            this.signatureErrors = list3;
            this.hasStableParameterNames = z11;
        }

        @NotNull
        public List<String> getErrors() {
            List<String> list = this.signatureErrors;
            if (list == null) {
                $$$reportNull$$$0(7);
            }
            return list;
        }

        @Nullable
        public KotlinType getReceiverType() {
            return this.receiverType;
        }

        @NotNull
        public KotlinType getReturnType() {
            KotlinType kotlinType = this.returnType;
            if (kotlinType == null) {
                $$$reportNull$$$0(4);
            }
            return kotlinType;
        }

        @NotNull
        public List<TypeParameterDescriptor> getTypeParameters() {
            List<TypeParameterDescriptor> list = this.typeParameters;
            if (list == null) {
                $$$reportNull$$$0(6);
            }
            return list;
        }

        @NotNull
        public List<ValueParameterDescriptor> getValueParameters() {
            List<ValueParameterDescriptor> list = this.valueParameters;
            if (list == null) {
                $$$reportNull$$$0(5);
            }
            return list;
        }

        public boolean hasStableParameterNames() {
            return this.hasStableParameterNames;
        }
    }

    void reportSignatureErrors(@NotNull CallableMemberDescriptor callableMemberDescriptor, @NotNull List<String> list);

    @NotNull
    PropagatedSignature resolvePropagatedSignature(@NotNull JavaMethod javaMethod, @NotNull ClassDescriptor classDescriptor, @NotNull KotlinType kotlinType, @Nullable KotlinType kotlinType2, @NotNull List<ValueParameterDescriptor> list, @NotNull List<TypeParameterDescriptor> list2);
}
