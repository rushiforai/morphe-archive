package aq;

import com.squareup.moshi.JsonDataException;
import h6.c1;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract class m0 {

    /* renamed from: a, reason: collision with root package name */
    public static final f f15502a = new f(5);

    /* renamed from: b, reason: collision with root package name */
    public static final j0 f15503b = new j0(1);

    /* renamed from: c, reason: collision with root package name */
    public static final j0 f15504c = new j0(2);

    /* renamed from: d, reason: collision with root package name */
    public static final j0 f15505d = new j0(3);

    /* renamed from: e, reason: collision with root package name */
    public static final j0 f15506e = new j0(4);

    /* renamed from: f, reason: collision with root package name */
    public static final j0 f15507f = new j0(5);

    /* renamed from: g, reason: collision with root package name */
    public static final j0 f15508g = new j0(6);

    /* renamed from: h, reason: collision with root package name */
    public static final j0 f15509h = new j0(7);

    /* renamed from: i, reason: collision with root package name */
    public static final j0 f15510i = new j0(8);

    /* renamed from: j, reason: collision with root package name */
    public static final j0 f15511j = new j0(0);

    public static Type a(Type type) {
        if (!Collection.class.isAssignableFrom(Collection.class)) {
            throw new IllegalArgumentException();
        }
        Type typeH = bq.e.h(type, Collection.class, bq.e.d(type, Collection.class, Collection.class), new LinkedHashSet());
        if (typeH instanceof WildcardType) {
            typeH = ((WildcardType) typeH).getUpperBounds()[0];
        }
        return typeH instanceof ParameterizedType ? ((ParameterizedType) typeH).getActualTypeArguments()[0] : Object.class;
    }

    public static boolean b(Type type, Type type2) {
        if (type == type2) {
            return true;
        }
        if (type instanceof Class) {
            return type2 instanceof GenericArrayType ? b(((Class) type).getComponentType(), ((GenericArrayType) type2).getGenericComponentType()) : type.equals(type2);
        }
        if (type instanceof ParameterizedType) {
            if (!(type2 instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType parameterizedType = (ParameterizedType) type;
            ParameterizedType parameterizedType2 = (ParameterizedType) type2;
            return b(parameterizedType.getOwnerType(), parameterizedType2.getOwnerType()) && parameterizedType.getRawType().equals(parameterizedType2.getRawType()) && Arrays.equals(parameterizedType instanceof bq.c ? ((bq.c) parameterizedType).f18419c : parameterizedType.getActualTypeArguments(), parameterizedType2 instanceof bq.c ? ((bq.c) parameterizedType2).f18419c : parameterizedType2.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            if (type2 instanceof Class) {
                return b(((Class) type2).getComponentType(), ((GenericArrayType) type).getGenericComponentType());
            }
            if (type2 instanceof GenericArrayType) {
                return b(((GenericArrayType) type).getGenericComponentType(), ((GenericArrayType) type2).getGenericComponentType());
            }
            return false;
        }
        if (type instanceof WildcardType) {
            if (!(type2 instanceof WildcardType)) {
                return false;
            }
            WildcardType wildcardType = (WildcardType) type;
            WildcardType wildcardType2 = (WildcardType) type2;
            return Arrays.equals(wildcardType.getUpperBounds(), wildcardType2.getUpperBounds()) && Arrays.equals(wildcardType.getLowerBounds(), wildcardType2.getLowerBounds());
        }
        if (!(type instanceof TypeVariable) || !(type2 instanceof TypeVariable)) {
            return false;
        }
        TypeVariable typeVariable = (TypeVariable) type;
        TypeVariable typeVariable2 = (TypeVariable) type2;
        return typeVariable.getGenericDeclaration() == typeVariable2.getGenericDeclaration() && typeVariable.getName().equals(typeVariable2.getName());
    }

    public static String c(int i5, int[] iArr, String[] strArr, int[] iArr2) {
        StringBuilder sb2 = new StringBuilder("$");
        for (int i11 = 0; i11 < i5; i11++) {
            int i12 = iArr[i11];
            if (i12 == 1 || i12 == 2) {
                sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                sb2.append(iArr2[i11]);
                sb2.append(AbstractJsonLexerKt.END_LIST);
            } else if (i12 == 3 || i12 == 4 || i12 == 5) {
                sb2.append('.');
                String str = strArr[i11];
                if (str != null) {
                    sb2.append(str);
                }
            }
        }
        return sb2.toString();
    }

    public static Class d(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            return (Class) ((ParameterizedType) type).getRawType();
        }
        if (type instanceof GenericArrayType) {
            return Array.newInstance((Class<?>) d(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        }
        if (type instanceof TypeVariable) {
            return Object.class;
        }
        if (type instanceof WildcardType) {
            return d(((WildcardType) type).getUpperBounds()[0]);
        }
        throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type " + (type == null ? AbstractJsonLexerKt.NULL : type.getClass().getName()));
    }

    public static bq.c f(Class cls, Type... typeArr) {
        if (typeArr.length != 0) {
            return new bq.c(null, cls, typeArr);
        }
        throw new IllegalArgumentException(c1.r(cls, "Missing type arguments for "));
    }

    public static int g(u uVar, String str, int i5, int i11) {
        int iL = uVar.l();
        if (iL >= i5 && iL <= i11) {
            return iL;
        }
        String strE = uVar.e();
        StringBuilder sbV = b.c0.v("Expected ", iL, str, " but was ", " at path ");
        sbV.append(strE);
        throw new JsonDataException(sbV.toString());
    }

    public abstract Object e();
}
