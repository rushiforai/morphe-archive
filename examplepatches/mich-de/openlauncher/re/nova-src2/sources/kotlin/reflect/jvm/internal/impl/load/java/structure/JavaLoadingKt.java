package kotlin.reflect.jvm.internal.impl.load.java.structure;

import b70.g;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class JavaLoadingKt {
    private static final boolean isMethodWithOneObjectParameter(JavaMethod javaMethod) {
        FqName fqName;
        JavaValueParameter javaValueParameter = (JavaValueParameter) g.A1(javaMethod.getValueParameters());
        JavaType type = javaValueParameter != null ? javaValueParameter.getType() : null;
        JavaClassifierType javaClassifierType = type instanceof JavaClassifierType ? (JavaClassifierType) type : null;
        if (javaClassifierType == null) {
            return false;
        }
        JavaClassifier classifier = javaClassifierType.getClassifier();
        return (classifier instanceof JavaClass) && (fqName = ((JavaClass) classifier).getFqName()) != null && Intrinsics.b(fqName.asString(), "java.lang.Object");
    }

    private static final boolean isObjectMethod(JavaMethod javaMethod) {
        String strAsString = javaMethod.getName().asString();
        int iHashCode = strAsString.hashCode();
        if (iHashCode != -1776922004) {
            if (iHashCode == -1295482945) {
                if (strAsString.equals("equals")) {
                    return isMethodWithOneObjectParameter(javaMethod);
                }
                return false;
            }
            if (iHashCode != 147696667 || !strAsString.equals("hashCode")) {
                return false;
            }
        } else if (!strAsString.equals("toString")) {
            return false;
        }
        return javaMethod.getValueParameters().isEmpty();
    }

    public static final boolean isObjectMethodInInterface(@NotNull JavaMember javaMember) {
        Intrinsics.g(javaMember, "<this>");
        return javaMember.getContainingClass().isInterface() && (javaMember instanceof JavaMethod) && isObjectMethod((JavaMethod) javaMember);
    }
}
