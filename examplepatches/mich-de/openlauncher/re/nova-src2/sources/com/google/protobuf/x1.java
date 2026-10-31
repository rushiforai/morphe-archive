package com.google.protobuf;

import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class x1 {

    /* renamed from: c, reason: collision with root package name */
    public static final x1 f35001c = new x1();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f35003b = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final h1 f35002a = new h1();

    public final b2 a(Class cls) {
        b2 b2VarB;
        Class cls2;
        a1.a(cls, "messageType");
        ConcurrentHashMap concurrentHashMap = this.f35003b;
        b2 b2Var = (b2) concurrentHashMap.get(cls);
        if (b2Var != null) {
            return b2Var;
        }
        h1 h1Var = this.f35002a;
        h1Var.getClass();
        Class cls3 = c2.f34831a;
        if (!n0.class.isAssignableFrom(cls) && (cls2 = c2.f34831a) != null && !cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Message classes must extend GeneratedMessage or GeneratedMessageLite");
        }
        z1 z1VarA = ((g1) h1Var.f34871a).a(cls);
        int i5 = z1VarA.f35013d;
        o1 o1Var = z1VarA.f35010a;
        if ((i5 & 2) == 2) {
            if (n0.class.isAssignableFrom(cls)) {
                b2VarB = s1.k(c2.f34833c, a0.f34806a, o1Var);
            } else {
                f2 f2Var = c2.f34832b;
                z zVar = a0.f34807b;
                if (zVar == null) {
                    throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
                }
                b2VarB = s1.k(f2Var, zVar, o1Var);
            }
        } else if (n0.class.isAssignableFrom(cls)) {
            z zVar2 = null;
            t1 t1Var = u1.f34984b;
            d1 d1Var = e1.f34848b;
            h2 h2Var = c2.f34833c;
            if (b.c0.F(z1VarA.a()) != 1) {
                zVar2 = a0.f34806a;
            }
            z zVar3 = zVar2;
            k1 k1Var = l1.f34892b;
            if (!(z1VarA instanceof z1)) {
                int[] iArr = r1.f34947p;
                z1VarA.getClass();
                throw new ClassCastException();
            }
            b2VarB = r1.B(z1VarA, t1Var, d1Var, h2Var, zVar3, k1Var);
        } else {
            z zVar4 = null;
            t1 t1Var2 = u1.f34983a;
            d1 d1Var2 = e1.f34847a;
            f2 f2Var2 = c2.f34832b;
            if (b.c0.F(z1VarA.a()) != 1 && (zVar4 = a0.f34807b) == null) {
                throw new IllegalStateException("Protobuf runtime is not correctly loaded.");
            }
            z zVar5 = zVar4;
            k1 k1Var2 = l1.f34891a;
            if (!(z1VarA instanceof z1)) {
                int[] iArr2 = r1.f34947p;
                z1VarA.getClass();
                throw new ClassCastException();
            }
            b2VarB = r1.B(z1VarA, t1Var2, d1Var2, f2Var2, zVar5, k1Var2);
        }
        b2 b2Var2 = (b2) concurrentHashMap.putIfAbsent(cls, b2VarB);
        return b2Var2 != null ? b2Var2 : b2VarB;
    }
}
