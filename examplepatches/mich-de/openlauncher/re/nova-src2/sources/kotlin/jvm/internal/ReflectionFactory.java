package kotlin.jvm.internal;

import java.util.List;
import kotlin.reflect.KClass;
import kotlin.reflect.KClassifier;
import kotlin.reflect.KDeclarationContainer;
import kotlin.reflect.KFunction;
import kotlin.reflect.KMutableProperty0;
import kotlin.reflect.KMutableProperty1;
import kotlin.reflect.KMutableProperty2;
import kotlin.reflect.KProperty0;
import kotlin.reflect.KProperty1;
import kotlin.reflect.KProperty2;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeParameter;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.KVariance;

/* loaded from: classes.dex */
public class ReflectionFactory {
    private static final String KOTLIN_JVM_FUNCTIONS = "kotlin.jvm.functions.";

    public KFunction function(FunctionReference functionReference) {
        return functionReference;
    }

    public KClass getOrCreateKotlinClass(Class cls) {
        return new ClassReference(cls);
    }

    public KDeclarationContainer getOrCreateKotlinPackage(Class cls, String str) {
        return new PackageReference(cls, str);
    }

    public KType mutableCollectionType(KType kType) {
        TypeReference typeReference = (TypeReference) kType;
        KClassifier classifier = kType.getF71875a();
        List<KTypeProjection> arguments = kType.getF71876b();
        typeReference.getClass();
        return new TypeReference(classifier, arguments, typeReference.f71877c | 2);
    }

    public KMutableProperty0 mutableProperty0(MutablePropertyReference0 mutablePropertyReference0) {
        return mutablePropertyReference0;
    }

    public KMutableProperty1 mutableProperty1(MutablePropertyReference1 mutablePropertyReference1) {
        return mutablePropertyReference1;
    }

    public KMutableProperty2 mutableProperty2(MutablePropertyReference2 mutablePropertyReference2) {
        return mutablePropertyReference2;
    }

    public KProperty0 property0(PropertyReference0 propertyReference0) {
        return propertyReference0;
    }

    public KProperty1 property1(PropertyReference1 propertyReference1) {
        return propertyReference1;
    }

    public KProperty2 property2(PropertyReference2 propertyReference2) {
        return propertyReference2;
    }

    public String renderLambdaToString(Lambda lambda) {
        return renderLambdaToString((FunctionBase) lambda);
    }

    public void setUpperBounds(KTypeParameter kTypeParameter, List upperBounds) {
        TypeParameterReference typeParameterReference = (TypeParameterReference) kTypeParameter;
        typeParameterReference.getClass();
        Intrinsics.g(upperBounds, "upperBounds");
        if (typeParameterReference.f71872c == null) {
            typeParameterReference.f71872c = upperBounds;
            return;
        }
        throw new IllegalStateException(("Upper bounds of type parameter '" + typeParameterReference + "' have already been initialized.").toString());
    }

    public KType typeOf(KClassifier classifier, List arguments, boolean z11) {
        Intrinsics.g(classifier, "classifier");
        Intrinsics.g(arguments, "arguments");
        return new TypeReference(classifier, arguments, z11 ? 1 : 0);
    }

    public KTypeParameter typeParameter(Object obj, String str, KVariance kVariance, boolean z11) {
        return new TypeParameterReference(obj, kVariance);
    }

    public String renderLambdaToString(FunctionBase functionBase) {
        String string = functionBase.getClass().getGenericInterfaces()[0].toString();
        return string.startsWith(KOTLIN_JVM_FUNCTIONS) ? string.substring(21) : string;
    }
}
