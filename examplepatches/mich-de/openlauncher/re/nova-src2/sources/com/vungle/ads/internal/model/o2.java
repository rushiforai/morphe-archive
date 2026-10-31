package com.vungle.ads.internal.model;

import java.util.LinkedHashMap;

/* loaded from: classes4.dex */
public enum o2 {
    /* JADX INFO: Fake field, exist only in values array */
    ALLOW_ID(0),
    /* JADX INFO: Fake field, exist only in values array */
    DISABLE_ID(1),
    /* JADX INFO: Fake field, exist only in values array */
    LEGACY(2);


    /* renamed from: b, reason: collision with root package name */
    public static final LinkedHashMap f47108b;

    /* renamed from: a, reason: collision with root package name */
    public final int f47110a;

    static {
        o2[] o2VarArrValues = values();
        int iD0 = b70.k.d0(o2VarArrValues.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        for (o2 o2Var : o2VarArrValues) {
            linkedHashMap.put(Integer.valueOf(o2Var.f47110a), o2Var);
        }
        f47108b = linkedHashMap;
    }

    o2(int i5) {
        this.f47110a = i5;
    }
}
