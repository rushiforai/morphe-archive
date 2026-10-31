package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class b0 extends a0 {

    /* renamed from: d, reason: collision with root package name */
    public static final Map f32397d;

    /* renamed from: c, reason: collision with root package name */
    public final di f32398c;

    static {
        EnumMap enumMap = new EnumMap(di.class);
        for (di diVar : di.values()) {
            b0[] b0VarArr = new b0[10];
            for (int i5 = 0; i5 < 10; i5++) {
                b0VarArr[i5] = new b0(i5, diVar, ei.f32515e);
            }
            enumMap.put((EnumMap) diVar, (di) b0VarArr);
        }
        f32397d = Collections.unmodifiableMap(enumMap);
    }

    public b0(int i5, di diVar, ei eiVar) {
        super(eiVar, i5);
        fb.b(diVar, "format char");
        this.f32398c = diVar;
        if (eiVar.a()) {
            return;
        }
        int i11 = diVar.f32482a;
        i11 = eiVar.c() ? i11 & 65503 : i11;
        StringBuilder sb2 = new StringBuilder("%");
        eiVar.d(sb2);
        sb2.append((char) i11);
    }

    @Override // com.google.android.gms.internal.measurement.a0
    public final void f(xg xgVar, Object obj) throws IOException {
        xgVar.c(obj, this.f32398c, (ei) this.f32363b);
    }
}
