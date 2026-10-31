package a0;

import android.util.Log;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import x8.p;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f57a;

    public b(int i5) {
        switch (i5) {
            case 1:
                this.f57a = new LinkedHashMap();
                break;
            default:
                this.f57a = new LinkedHashMap(0, 0.75f, true);
                break;
        }
    }

    public void a(y6.a... migrations) {
        Intrinsics.g(migrations, "migrations");
        for (y6.a aVar : migrations) {
            int i5 = aVar.f96732a;
            int i11 = aVar.f96733b;
            Integer numValueOf = Integer.valueOf(i5);
            LinkedHashMap linkedHashMap = this.f57a;
            Object treeMap = linkedHashMap.get(numValueOf);
            if (treeMap == null) {
                treeMap = new TreeMap();
                linkedHashMap.put(numValueOf, treeMap);
            }
            TreeMap treeMap2 = (TreeMap) treeMap;
            if (treeMap2.containsKey(Integer.valueOf(i11))) {
                Log.w("ROOM", "Overriding migration " + treeMap2.get(Integer.valueOf(i11)) + " with " + aVar);
            }
            treeMap2.put(Integer.valueOf(i11), aVar);
        }
    }

    public b(p pVar) {
        this.f57a = MapsKt.u0(pVar.f95366a);
    }
}
