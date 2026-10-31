package kotlin.reflect.jvm.internal.impl.load.java;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.util.capitalizeDecapitalize.CapitalizeDecapitalizeKt;
import org.jetbrains.annotations.NotNull;
import r70.j;

/* loaded from: classes5.dex */
public final class JvmAbi {

    @NotNull
    public static final JvmAbi INSTANCE = new JvmAbi();

    @JvmField
    @NotNull
    public static final ClassId JVM_FIELD_ANNOTATION_CLASS_ID;

    @JvmField
    @NotNull
    public static final FqName JVM_FIELD_ANNOTATION_FQ_NAME;

    @NotNull
    private static final ClassId REFLECTION_FACTORY_IMPL;

    @NotNull
    private static final ClassId REPEATABLE_ANNOTATION_CONTAINER_META_ANNOTATION;

    static {
        FqName fqName = new FqName("kotlin.jvm.JvmField");
        JVM_FIELD_ANNOTATION_FQ_NAME = fqName;
        ClassId classId = ClassId.topLevel(fqName);
        Intrinsics.f(classId, "topLevel(...)");
        JVM_FIELD_ANNOTATION_CLASS_ID = classId;
        ClassId classId2 = ClassId.topLevel(new FqName("kotlin.reflect.jvm.internal.ReflectionFactoryImpl"));
        Intrinsics.f(classId2, "topLevel(...)");
        REFLECTION_FACTORY_IMPL = classId2;
        ClassId classIdFromString = ClassId.fromString("kotlin/jvm/internal/RepeatableContainer");
        Intrinsics.f(classIdFromString, "fromString(...)");
        REPEATABLE_ANNOTATION_CONTAINER_META_ANNOTATION = classIdFromString;
    }

    private JvmAbi() {
    }

    @JvmStatic
    @NotNull
    public static final String getterName(@NotNull String propertyName) {
        Intrinsics.g(propertyName, "propertyName");
        if (startsWithIsPrefix(propertyName)) {
            return propertyName;
        }
        return "get" + CapitalizeDecapitalizeKt.capitalizeAsciiOnly(propertyName);
    }

    @JvmStatic
    public static final boolean isGetterName(@NotNull String name) {
        Intrinsics.g(name, "name");
        return j.I0(name, "get", false) || j.I0(name, "is", false);
    }

    @JvmStatic
    public static final boolean isSetterName(@NotNull String name) {
        Intrinsics.g(name, "name");
        return j.I0(name, "set", false);
    }

    @JvmStatic
    @NotNull
    public static final String setterName(@NotNull String propertyName) {
        String strCapitalizeAsciiOnly;
        Intrinsics.g(propertyName, "propertyName");
        StringBuilder sb2 = new StringBuilder("set");
        if (startsWithIsPrefix(propertyName)) {
            strCapitalizeAsciiOnly = propertyName.substring(2);
            Intrinsics.f(strCapitalizeAsciiOnly, "substring(...)");
        } else {
            strCapitalizeAsciiOnly = CapitalizeDecapitalizeKt.capitalizeAsciiOnly(propertyName);
        }
        sb2.append(strCapitalizeAsciiOnly);
        return sb2.toString();
    }

    @JvmStatic
    public static final boolean startsWithIsPrefix(@NotNull String name) {
        Intrinsics.g(name, "name");
        if (j.I0(name, "is", false) && name.length() != 2) {
            char cCharAt = name.charAt(2);
            if (Intrinsics.h(97, cCharAt) > 0 || Intrinsics.h(cCharAt, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) > 0) {
                return true;
            }
        }
        return false;
    }

    @NotNull
    public final ClassId getREPEATABLE_ANNOTATION_CONTAINER_META_ANNOTATION() {
        return REPEATABLE_ANNOTATION_CONTAINER_META_ANNOTATION;
    }
}
