package fp;

import b.u4;
import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import cp.z;
import java.io.IOException;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes4.dex */
public final class f extends z {

    /* renamed from: e, reason: collision with root package name */
    public static final a f55499e = new a(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55500a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f55501b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f55502c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f55503d;

    public f(cp.m mVar, z zVar, Type type) {
        this.f55500a = 2;
        this.f55501b = mVar;
        this.f55502c = zVar;
        this.f55503d = type;
    }

    @Override // cp.z
    public final Object b(kp.a aVar) throws IOException {
        switch (this.f55500a) {
            case 0:
                if (aVar.f0() == 9) {
                    aVar.V();
                    return null;
                }
                String strD0 = aVar.d0();
                Enum r02 = (Enum) ((HashMap) this.f55501b).get(strD0);
                return r02 == null ? (Enum) ((HashMap) this.f55502c).get(strD0) : r02;
            case 1:
                int iF0 = aVar.f0();
                if (iF0 == 9) {
                    aVar.V();
                    return null;
                }
                Map map = (Map) ((ep.p) this.f55503d).a();
                if (iF0 == 1) {
                    aVar.a();
                    while (aVar.p()) {
                        aVar.a();
                        Object objB = ((z) ((f) this.f55501b).f55502c).b(aVar);
                        if (map.put(objB, ((z) ((f) this.f55502c).f55502c).b(aVar)) != null) {
                            throw new JsonSyntaxException(u4.h(objB, "duplicate key: "));
                        }
                        aVar.e();
                    }
                    aVar.e();
                } else {
                    aVar.b();
                    while (aVar.p()) {
                        br.c.f18430a.getClass();
                        int iD = aVar.f72092g;
                        if (iD == 0) {
                            iD = aVar.d();
                        }
                        if (iD == 13) {
                            aVar.f72092g = 9;
                        } else if (iD == 12) {
                            aVar.f72092g = 8;
                        } else {
                            if (iD != 14) {
                                throw aVar.n0("a name");
                            }
                            aVar.f72092g = 10;
                        }
                        Object objB2 = ((z) ((f) this.f55501b).f55502c).b(aVar);
                        if (map.put(objB2, ((z) ((f) this.f55502c).f55502c).b(aVar)) != null) {
                            throw new JsonSyntaxException(u4.h(objB2, "duplicate key: "));
                        }
                    }
                    aVar.f();
                }
                return map;
            default:
                return ((z) this.f55502c).b(aVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x004f  */
    /* JADX WARN: Type inference failed for: r1v5, types: [java.lang.reflect.Type] */
    @Override // cp.z
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(kp.b bVar, Object obj) {
        switch (this.f55500a) {
            case 0:
                Enum r62 = (Enum) obj;
                bVar.S(r62 == null ? null : (String) ((HashMap) this.f55503d).get(r62));
                return;
            case 1:
                Map map = (Map) obj;
                f fVar = (f) this.f55502c;
                if (map == null) {
                    bVar.p();
                    return;
                }
                bVar.c();
                for (Map.Entry entry : map.entrySet()) {
                    bVar.h(String.valueOf(entry.getKey()));
                    fVar.c(bVar, entry.getValue());
                }
                bVar.f();
                return;
            default:
                z zVar = (z) this.f55502c;
                ?? r12 = (Type) this.f55503d;
                Class<?> cls = (obj == null || !((r12 instanceof Class) || (r12 instanceof TypeVariable))) ? r12 : obj.getClass();
                if (cls != r12) {
                    z zVarC = ((cp.m) this.f55501b).c(new jp.a(cls));
                    if (zVarC instanceof l) {
                        z zVar2 = zVar;
                        while (zVar2 instanceof cp.l) {
                            z zVar3 = ((cp.l) zVar2).f47753a;
                            if (zVar3 == null) {
                                throw new IllegalStateException("Adapter for type with cyclic dependency has been used before dependency has been resolved");
                            }
                            if (zVar3 != zVar2) {
                                zVar2 = zVar3;
                            } else if (zVar2 instanceof l) {
                            }
                        }
                        if (zVar2 instanceof l) {
                        }
                    } else {
                        zVar = zVarC;
                    }
                }
                zVar.c(bVar, obj);
                return;
        }
    }

    public f(c cVar, f fVar, f fVar2, ep.p pVar) {
        this.f55500a = 1;
        this.f55501b = fVar;
        this.f55502c = fVar2;
        this.f55503d = pVar;
    }

    public f(Class cls) throws SecurityException {
        this.f55500a = 0;
        this.f55501b = new HashMap();
        this.f55502c = new HashMap();
        this.f55503d = new HashMap();
        try {
            Field[] declaredFields = cls.getDeclaredFields();
            int i5 = 0;
            for (Field field : declaredFields) {
                if (field.isEnumConstant()) {
                    declaredFields[i5] = field;
                    i5++;
                }
            }
            Field[] fieldArr = (Field[]) Arrays.copyOf(declaredFields, i5);
            AccessibleObject.setAccessible(fieldArr, true);
            for (Field field2 : fieldArr) {
                Enum r42 = (Enum) field2.get(null);
                String strName = r42.name();
                String string = r42.toString();
                dp.b bVar = (dp.b) field2.getAnnotation(dp.b.class);
                if (bVar != null) {
                    strName = bVar.value();
                    for (String str : bVar.alternate()) {
                        ((HashMap) this.f55501b).put(str, r42);
                    }
                }
                ((HashMap) this.f55501b).put(strName, r42);
                ((HashMap) this.f55502c).put(string, r42);
                ((HashMap) this.f55503d).put(r42, strName);
            }
        } catch (IllegalAccessException e3) {
            throw new AssertionError(e3);
        }
    }
}
