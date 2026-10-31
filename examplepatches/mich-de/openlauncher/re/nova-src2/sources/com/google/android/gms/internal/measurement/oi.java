package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
public final class oi extends c {

    /* renamed from: b, reason: collision with root package name */
    public final Map f32940b;

    public oi(h hVar, h hVar2) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        d(linkedHashMap, hVar);
        d(linkedHashMap, hVar2);
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            if (((th) entry.getKey()).f33094c) {
                entry.setValue(Collections.unmodifiableList((List) entry.getValue()));
            }
        }
        this.f32940b = Collections.unmodifiableMap(linkedHashMap);
    }

    public static void d(LinkedHashMap linkedHashMap, h hVar) {
        for (int i5 = 0; i5 < hVar.a(); i5++) {
            th thVarH = hVar.h(i5);
            Object obj = linkedHashMap.get(thVarH);
            boolean z11 = thVarH.f33094c;
            Class cls = thVarH.f33093b;
            if (z11) {
                List arrayList = (List) obj;
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    linkedHashMap.put(thVarH, arrayList);
                }
                arrayList.add(cls.cast(hVar.i(i5)));
            } else {
                linkedHashMap.put(thVarH, cls.cast(hVar.i(i5)));
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final void a(ki kiVar, fi fiVar) {
        for (Map.Entry entry : this.f32940b.entrySet()) {
            th thVar = (th) entry.getKey();
            Object value = entry.getValue();
            if (thVar.f33094c) {
                kiVar.b(thVar, ((List) value).iterator(), fiVar);
            } else {
                kiVar.a(thVar, value, fiVar);
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final int b() {
        return this.f32940b.size();
    }

    @Override // com.google.android.gms.internal.measurement.c
    public final Set c() {
        return this.f32940b.keySet();
    }
}
