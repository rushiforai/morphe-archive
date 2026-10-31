package kotlin.reflect.jvm.internal.calls;

import a2.c;
import a70.d;
import b70.g;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlin.reflect.jvm.internal.KotlinReflectionInternalError;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\u001aI\u0010\u0000\u001a\u0002H\u0001\"\b\b\u0000\u0010\u0001*\u00020\u00022\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u0002H\u00010\u00042\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00020\u00062\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tH\u0000¢\u0006\u0002\u0010\u000b\u001a$\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00072\n\u0010\u0011\u001a\u0006\u0012\u0002\b\u00030\u0004H\u0002\u001a\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u0002*\u0004\u0018\u00010\u00022\n\u0010\u0013\u001a\u0006\u0012\u0002\b\u00030\u0004H\u0002¨\u0006\u0014²\u0006\u0014\u0010\u0015\u001a\u00020\u000f\"\b\b\u0000\u0010\u0001*\u00020\u0002X\u008a\u0084\u0002²\u0006\u0014\u0010\u0016\u001a\u00020\u0007\"\b\b\u0000\u0010\u0001*\u00020\u0002X\u008a\u0084\u0002"}, d2 = {"createAnnotationInstance", "T", b.f42142b, "annotationClass", "Ljava/lang/Class;", "values", b.f42142b, b.f42142b, "methods", b.f42142b, "Ljava/lang/reflect/Method;", "(Ljava/lang/Class;Ljava/util/Map;Ljava/util/List;)Ljava/lang/Object;", "throwIllegalArgumentType", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, PendingUpgradeStore.KEY_NAME, "expectedJvmType", "transformKotlinToJvm", "expectedType", "kotlin-reflection", "hashCode", "toString"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class AnnotationConstructorCallerKt {
    @NotNull
    public static final <T> T createAnnotationInstance(@NotNull final Class<T> annotationClass, @NotNull final Map<String, ? extends Object> values, @NotNull final List<Method> methods) {
        Intrinsics.g(annotationClass, "annotationClass");
        Intrinsics.g(values, "values");
        Intrinsics.g(methods, "methods");
        final d dVarA = LazyKt.a(new Function0<Integer>() { // from class: kotlin.reflect.jvm.internal.calls.AnnotationConstructorCallerKt$createAnnotationInstance$hashCode$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final Integer invoke() {
                Iterator<T> it = values.entrySet().iterator();
                int iHashCode = 0;
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    String str = (String) entry.getKey();
                    Object value = entry.getValue();
                    iHashCode += (value instanceof boolean[] ? Arrays.hashCode((boolean[]) value) : value instanceof char[] ? Arrays.hashCode((char[]) value) : value instanceof byte[] ? Arrays.hashCode((byte[]) value) : value instanceof short[] ? Arrays.hashCode((short[]) value) : value instanceof int[] ? Arrays.hashCode((int[]) value) : value instanceof float[] ? Arrays.hashCode((float[]) value) : value instanceof long[] ? Arrays.hashCode((long[]) value) : value instanceof double[] ? Arrays.hashCode((double[]) value) : value instanceof Object[] ? Arrays.hashCode((Object[]) value) : value.hashCode()) ^ (str.hashCode() * Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                }
                return Integer.valueOf(iHashCode);
            }
        });
        final d dVarA2 = LazyKt.a(new Function0<String>() { // from class: kotlin.reflect.jvm.internal.calls.AnnotationConstructorCallerKt$createAnnotationInstance$toString$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            @NotNull
            public final String invoke() throws IOException {
                Class<T> cls = annotationClass;
                Map<String, Object> map = values;
                StringBuilder sb2 = new StringBuilder();
                sb2.append('@');
                sb2.append(cls.getCanonicalName());
                g.e1(map.entrySet(), sb2, ", ", "(", ")", new Function1<Map.Entry<? extends String, ? extends Object>, CharSequence>() { // from class: kotlin.reflect.jvm.internal.calls.AnnotationConstructorCallerKt$createAnnotationInstance$toString$2$1$1
                    @Override // kotlin.jvm.functions.Function1
                    @NotNull
                    public final CharSequence invoke(@NotNull Map.Entry<String, ? extends Object> entry) {
                        String string;
                        Intrinsics.g(entry, "entry");
                        String key = entry.getKey();
                        Object value = entry.getValue();
                        if (value instanceof boolean[]) {
                            string = Arrays.toString((boolean[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof char[]) {
                            string = Arrays.toString((char[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof byte[]) {
                            string = Arrays.toString((byte[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof short[]) {
                            string = Arrays.toString((short[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof int[]) {
                            string = Arrays.toString((int[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof float[]) {
                            string = Arrays.toString((float[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof long[]) {
                            string = Arrays.toString((long[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof double[]) {
                            string = Arrays.toString((double[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else if (value instanceof Object[]) {
                            string = Arrays.toString((Object[]) value);
                            Intrinsics.f(string, "toString(...)");
                        } else {
                            string = value.toString();
                        }
                        return c.g('=', key, string);
                    }
                }, 48);
                String string = sb2.toString();
                Intrinsics.f(string, "toString(...)");
                return string;
            }
        });
        T t6 = (T) Proxy.newProxyInstance(annotationClass.getClassLoader(), new Class[]{annotationClass}, new InvocationHandler(annotationClass, values, dVarA2, dVarA, methods) { // from class: kotlin.reflect.jvm.internal.calls.AnnotationConstructorCallerKt$$Lambda$0
            private final Class arg$0;
            private final Map arg$1;
            private final Lazy arg$2;
            private final Lazy arg$3;
            private final List arg$4;

            {
                this.arg$0 = annotationClass;
                this.arg$1 = values;
                this.arg$2 = dVarA2;
                this.arg$3 = dVarA;
                this.arg$4 = methods;
            }

            @Override // java.lang.reflect.InvocationHandler
            public Object invoke(Object obj, Method method, Object[] objArr) {
                return AnnotationConstructorCallerKt.createAnnotationInstance$lambda$4(this.arg$0, this.arg$1, this.arg$2, this.arg$3, this.arg$4, obj, method, objArr);
            }
        });
        Intrinsics.e(t6, "null cannot be cast to non-null type T of kotlin.reflect.jvm.internal.calls.AnnotationConstructorCallerKt.createAnnotationInstance");
        return t6;
    }

    public static /* synthetic */ Object createAnnotationInstance$default(Class cls, Map map, List list, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            Set setKeySet = map.keySet();
            ArrayList arrayList = new ArrayList(b70.c.u0(setKeySet, 10));
            Iterator it = setKeySet.iterator();
            while (it.hasNext()) {
                arrayList.add(cls.getDeclaredMethod((String) it.next(), null));
            }
            list = arrayList;
        }
        return createAnnotationInstance(cls, map, list);
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00fa A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static final <T> boolean createAnnotationInstance$equals(Class<T> cls, List<Method> list, Map<String, ? extends Object> map, Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        boolean zB;
        boolean z11;
        Annotation annotation = obj instanceof Annotation ? (Annotation) obj : null;
        if (Intrinsics.b(annotation != null ? JvmClassMappingKt.b(JvmClassMappingKt.a(annotation)) : null, cls)) {
            List<Method> list2 = list;
            if ((list2 instanceof Collection) && list2.isEmpty()) {
                z11 = true;
                if (!z11) {
                }
            } else {
                for (Method method : list2) {
                    Object obj2 = map.get(method.getName());
                    Object objInvoke = method.invoke(obj, null);
                    if (obj2 instanceof boolean[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.BooleanArray");
                        zB = Arrays.equals((boolean[]) obj2, (boolean[]) objInvoke);
                    } else if (obj2 instanceof char[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.CharArray");
                        zB = Arrays.equals((char[]) obj2, (char[]) objInvoke);
                    } else if (obj2 instanceof byte[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.ByteArray");
                        zB = Arrays.equals((byte[]) obj2, (byte[]) objInvoke);
                    } else if (obj2 instanceof short[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.ShortArray");
                        zB = Arrays.equals((short[]) obj2, (short[]) objInvoke);
                    } else if (obj2 instanceof int[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.IntArray");
                        zB = Arrays.equals((int[]) obj2, (int[]) objInvoke);
                    } else if (obj2 instanceof float[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.FloatArray");
                        zB = Arrays.equals((float[]) obj2, (float[]) objInvoke);
                    } else if (obj2 instanceof long[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.LongArray");
                        zB = Arrays.equals((long[]) obj2, (long[]) objInvoke);
                    } else if (obj2 instanceof double[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.DoubleArray");
                        zB = Arrays.equals((double[]) obj2, (double[]) objInvoke);
                    } else if (obj2 instanceof Object[]) {
                        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.Array<*>");
                        zB = Arrays.equals((Object[]) obj2, (Object[]) objInvoke);
                    } else {
                        zB = Intrinsics.b(obj2, objInvoke);
                    }
                    if (!zB) {
                        z11 = false;
                        break;
                    }
                }
                z11 = true;
                if (!z11) {
                    return true;
                }
            }
        }
        return false;
    }

    private static final int createAnnotationInstance$lambda$2(Lazy<Integer> lazy) {
        return ((Number) lazy.getValue()).intValue();
    }

    private static final String createAnnotationInstance$lambda$3(Lazy<String> lazy) {
        return (String) lazy.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object createAnnotationInstance$lambda$4(Class annotationClass, Map values, Lazy toString$delegate, Lazy hashCode$delegate, List methods, Object obj, Method method, Object[] objArr) {
        Intrinsics.g(annotationClass, "$annotationClass");
        Intrinsics.g(values, "$values");
        Intrinsics.g(toString$delegate, "$toString$delegate");
        Intrinsics.g(hashCode$delegate, "$hashCode$delegate");
        Intrinsics.g(methods, "$methods");
        String name = method.getName();
        if (name != null) {
            int iHashCode = name.hashCode();
            if (iHashCode != -1776922004) {
                if (iHashCode != 147696667) {
                    if (iHashCode == 1444986633 && name.equals("annotationType")) {
                        return annotationClass;
                    }
                } else if (name.equals("hashCode")) {
                    return Integer.valueOf(createAnnotationInstance$lambda$2(hashCode$delegate));
                }
            } else if (name.equals("toString")) {
                return createAnnotationInstance$lambda$3(toString$delegate);
            }
        }
        if (Intrinsics.b(name, "equals") && objArr != null && objArr.length == 1) {
            Intrinsics.d(objArr);
            return Boolean.valueOf(createAnnotationInstance$equals(annotationClass, methods, values, kotlin.collections.c.U0(objArr)));
        }
        if (values.containsKey(name)) {
            return values.get(name);
        }
        StringBuilder sb2 = new StringBuilder("Method is not supported: ");
        sb2.append(method);
        sb2.append(" (args: ");
        if (objArr == null) {
            objArr = new Object[0];
        }
        sb2.append(kotlin.collections.c.b1(objArr));
        sb2.append(')');
        throw new KotlinReflectionInternalError(sb2.toString());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Void throwIllegalArgumentType(int i5, String str, Class<?> cls) {
        String qualifiedName;
        KClass orCreateKotlinClass = Intrinsics.b(cls, Class.class) ? Reflection.f71864a.getOrCreateKotlinClass(KClass.class) : (cls.isArray() && Intrinsics.b(cls.getComponentType(), Class.class)) ? Reflection.f71864a.getOrCreateKotlinClass(KClass[].class) : JvmClassMappingKt.e(cls);
        if (Intrinsics.b(orCreateKotlinClass.getQualifiedName(), Reflection.f71864a.getOrCreateKotlinClass(Object[].class).getQualifiedName())) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(orCreateKotlinClass.getQualifiedName());
            sb2.append('<');
            Class<?> componentType = JvmClassMappingKt.b(orCreateKotlinClass).getComponentType();
            Intrinsics.f(componentType, "getComponentType(...)");
            sb2.append(JvmClassMappingKt.e(componentType).getQualifiedName());
            sb2.append('>');
            qualifiedName = sb2.toString();
        } else {
            qualifiedName = orCreateKotlinClass.getQualifiedName();
        }
        throw new IllegalArgumentException("Argument #" + i5 + ' ' + str + " is not of the required type " + qualifiedName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Object transformKotlinToJvm(Object obj, Class<?> cls) {
        if (obj instanceof Class) {
            return null;
        }
        if (obj instanceof KClass) {
            obj = JvmClassMappingKt.b((KClass) obj);
        } else if (obj instanceof Object[]) {
            Object[] objArr = (Object[]) obj;
            if (objArr instanceof Class[]) {
                return null;
            }
            if (objArr instanceof KClass[]) {
                KClass[] kClassArr = (KClass[]) obj;
                ArrayList arrayList = new ArrayList(kClassArr.length);
                for (KClass kClass : kClassArr) {
                    arrayList.add(JvmClassMappingKt.b(kClass));
                }
                obj = arrayList.toArray(new Class[0]);
            } else {
                obj = objArr;
            }
        }
        if (cls.isInstance(obj)) {
            return obj;
        }
        return null;
    }
}
