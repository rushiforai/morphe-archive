package hn;

import b.c0;
import b00.z0;
import com.google.gson.JsonIOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Map f59893a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f59894b;

    /* renamed from: c, reason: collision with root package name */
    public final List f59895c;

    public c(Map map, boolean z11, List list) {
        this.f59893a = map;
        this.f59894b = z11;
        this.f59895c = list;
    }

    public static String a(Class cls) {
        int modifiers = cls.getModifiers();
        if (Modifier.isInterface(modifiers)) {
            return "Interfaces can't be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: ".concat(cls.getName());
        }
        if (!Modifier.isAbstract(modifiers)) {
            return null;
        }
        return "Abstract classes can't be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: " + cls.getName() + "\nSee " + lb0.b.s("r8-abstract-class");
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x0103  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final p b(mn.a aVar, boolean z11) throws NoSuchMethodException, SecurityException {
        final String str;
        p z0Var;
        final Type type = aVar.f76505b;
        Class cls = aVar.f76504a;
        Map map = this.f59893a;
        if (map.get(type) != null) {
            throw new ClassCastException();
        }
        if (map.get(cls) != null) {
            throw new ClassCastException();
        }
        final int i5 = 1;
        final int i11 = 0;
        gl.l lVar = null;
        p pVar = EnumSet.class.isAssignableFrom(cls) ? new p() { // from class: hn.b
            @Override // hn.p
            public final Object a() {
                switch (i11) {
                    case 0:
                        Type type2 = type;
                        if (!(type2 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                        }
                        Type type3 = ((ParameterizedType) type2).getActualTypeArguments()[0];
                        if (type3 instanceof Class) {
                            return EnumSet.noneOf((Class) type3);
                        }
                        throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                    default:
                        Type type4 = type;
                        if (!(type4 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                        }
                        Type type5 = ((ParameterizedType) type4).getActualTypeArguments()[0];
                        if (type5 instanceof Class) {
                            return new EnumMap((Class) type5);
                        }
                        throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                }
            }
        } : cls == EnumMap.class ? new p() { // from class: hn.b
            @Override // hn.p
            public final Object a() {
                switch (i5) {
                    case 0:
                        Type type2 = type;
                        if (!(type2 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                        }
                        Type type3 = ((ParameterizedType) type2).getActualTypeArguments()[0];
                        if (type3 instanceof Class) {
                            return EnumSet.noneOf((Class) type3);
                        }
                        throw new JsonIOException("Invalid EnumSet type: " + type2.toString());
                    default:
                        Type type4 = type;
                        if (!(type4 instanceof ParameterizedType)) {
                            throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                        }
                        Type type5 = ((ParameterizedType) type4).getActualTypeArguments()[0];
                        if (type5 instanceof Class) {
                            return new EnumMap((Class) type5);
                        }
                        throw new JsonIOException("Invalid EnumMap type: " + type4.toString());
                }
            }
        } : null;
        if (pVar != null) {
            return pVar;
        }
        h.e(this.f59895c);
        int i12 = 12;
        if (Modifier.isAbstract(cls.getModifiers())) {
            z0Var = null;
        } else {
            try {
                Constructor declaredConstructor = cls.getDeclaredConstructor(null);
                ul.b bVar = kn.c.f71660a;
                try {
                    declaredConstructor.setAccessible(true);
                    str = null;
                } catch (Exception e3) {
                    str = "Failed making constructor '" + kn.c.b(declaredConstructor) + "' accessible; either increase its visibility or write a custom InstanceCreator or TypeAdapter for its declaring type: " + e3.getMessage() + kn.c.e(e3);
                }
                z0Var = str != null ? new p() { // from class: hn.a
                    @Override // hn.p
                    public final Object a() {
                        switch (i5) {
                            case 0:
                                throw new JsonIOException(str);
                            case 1:
                                throw new JsonIOException(str);
                            case 2:
                                throw new JsonIOException(str);
                            default:
                                throw new JsonIOException(str);
                        }
                    }
                } : new z0(declaredConstructor, i12);
            } catch (NoSuchMethodException unused) {
            }
        }
        if (z0Var != null) {
            return z0Var;
        }
        int i13 = 13;
        if (Collection.class.isAssignableFrom(cls)) {
            if (cls.isAssignableFrom(ArrayList.class)) {
                lVar = new gl.l(i13);
            } else if (cls.isAssignableFrom(LinkedHashSet.class)) {
                lVar = new gl.l(14);
            } else if (cls.isAssignableFrom(TreeSet.class)) {
                lVar = new gl.l(15);
            } else if (cls.isAssignableFrom(ArrayDeque.class)) {
                lVar = new gl.l(16);
            }
        } else if (Map.class.isAssignableFrom(cls)) {
            if (cls.isAssignableFrom(o.class)) {
                if (type instanceof ParameterizedType) {
                    Type[] actualTypeArguments = ((ParameterizedType) type).getActualTypeArguments();
                    if (actualTypeArguments.length != 0 && h.g(actualTypeArguments[0]) == String.class) {
                    }
                }
                lVar = new gl.l(8);
            } else if (cls.isAssignableFrom(LinkedHashMap.class)) {
                lVar = new gl.l(9);
            } else if (cls.isAssignableFrom(TreeMap.class)) {
                lVar = new gl.l(10);
            } else if (cls.isAssignableFrom(ConcurrentHashMap.class)) {
                lVar = new gl.l(11);
            } else if (cls.isAssignableFrom(ConcurrentSkipListMap.class)) {
                lVar = new gl.l(i12);
            }
        }
        if (lVar != null) {
            return lVar;
        }
        final String strA = a(cls);
        if (strA != null) {
            return new p() { // from class: hn.a
                @Override // hn.p
                public final Object a() {
                    switch (i11) {
                        case 0:
                            throw new JsonIOException(strA);
                        case 1:
                            throw new JsonIOException(strA);
                        case 2:
                            throw new JsonIOException(strA);
                        default:
                            throw new JsonIOException(strA);
                    }
                }
            };
        }
        if (!z11) {
            final String str2 = "Unable to create instance of " + cls + "; Register an InstanceCreator or a TypeAdapter for this type.";
            final int i14 = 2;
            return new p() { // from class: hn.a
                @Override // hn.p
                public final Object a() {
                    switch (i14) {
                        case 0:
                            throw new JsonIOException(str2);
                        case 1:
                            throw new JsonIOException(str2);
                        case 2:
                            throw new JsonIOException(str2);
                        default:
                            throw new JsonIOException(str2);
                    }
                }
            };
        }
        if (this.f59894b) {
            return new z0(cls, i13);
        }
        final String strE = "Unable to create instance of " + cls + "; usage of JDK Unsafe is disabled. Registering an InstanceCreator or a TypeAdapter for this type, adding a no-args constructor, or enabling usage of JDK Unsafe may fix this problem.";
        if (cls.getDeclaredConstructors().length == 0) {
            strE = c0.E(strE, " Or adjust your R8 configuration to keep the no-args constructor of the class.");
        }
        final int i15 = 3;
        return new p() { // from class: hn.a
            @Override // hn.p
            public final Object a() {
                switch (i15) {
                    case 0:
                        throw new JsonIOException(strE);
                    case 1:
                        throw new JsonIOException(strE);
                    case 2:
                        throw new JsonIOException(strE);
                    default:
                        throw new JsonIOException(strE);
                }
            }
        };
    }

    public final String toString() {
        return this.f59893a.toString();
    }
}
