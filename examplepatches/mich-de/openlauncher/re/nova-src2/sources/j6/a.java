package j6;

import a7.d;
import android.os.Bundle;
import bn.s0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import w70.i2;
import w70.m1;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s0 f69065a;

    public /* synthetic */ a(s0 s0Var) {
        this.f69065a = s0Var;
    }

    @Override // a7.d
    public final Bundle a() {
        Pair[] pairArr;
        s0 s0Var = this.f69065a;
        for (Map.Entry entry : MapsKt.s0((LinkedHashMap) s0Var.f18282e).entrySet()) {
            s0Var.l((String) entry.getKey(), ((i2) ((m1) entry.getValue())).getValue());
        }
        for (Map.Entry entry2 : MapsKt.s0((LinkedHashMap) s0Var.f18280c).entrySet()) {
            s0Var.l((String) entry2.getKey(), ((d) entry2.getValue()).a());
        }
        LinkedHashMap linkedHashMap = (LinkedHashMap) s0Var.f18279b;
        if (linkedHashMap.isEmpty()) {
            pairArr = new Pair[0];
        } else {
            ArrayList arrayList = new ArrayList(linkedHashMap.size());
            for (Map.Entry entry3 : linkedHashMap.entrySet()) {
                arrayList.add(new Pair((String) entry3.getKey(), entry3.getValue()));
            }
            pairArr = (Pair[]) arrayList.toArray(new Pair[0]);
        }
        return w.b.a((Pair[]) Arrays.copyOf(pairArr, pairArr.length));
    }
}
