package io.branch.search.internal;

import android.content.ContentValues;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Ib {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3159g3 f62679a;

    public Ib(@NotNull C3159g3 action) {
        Intrinsics.g(action, "action");
        this.f62679a = action;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [int] */
    public final void a(@NotNull InterfaceC3365s7 db2) {
        ContentValues contentValues;
        String string;
        List<List<Object>> list;
        Intrinsics.g(db2, "db");
        Iterable iterable = this.f62679a.f64554d;
        if (iterable == null) {
            iterable = EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = iterable.iterator();
        while (true) {
            Pair pair = null;
            if (!it.hasNext()) {
                break;
            }
            Ae ae2 = (Ae) it.next();
            String str = ae2.f62043b;
            if (str != null && (list = ae2.f62042a) != null && str.length() != 0) {
                pair = new Pair(str, list);
            }
            if (pair != null) {
                arrayList.add(pair);
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Pair pair2 = (Pair) it2.next();
            String str2 = (String) pair2.f71683a;
            List list2 = (List) pair2.f71684b;
            C3457xe c3457xeCompileStatement = db2.compileStatement(str2);
            try {
                Iterator it3 = list2.iterator();
                while (it3.hasNext()) {
                    c3457xeCompileStatement.a((List) it3.next());
                }
                Unit unit = Unit.f71706a;
                CloseableKt.a(c3457xeCompileStatement, null);
            } finally {
            }
        }
        Map map = this.f62679a.f64560j;
        Map map2 = b70.h.f17594a;
        if (map == null) {
            map = map2;
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("id", key);
            contentValues2.put("version", value);
            if (db2.insert("internal_versions", 5, contentValues2) == -1) {
                throw new RuntimeException("Failed to insert version " + contentValues2);
            }
        }
        Map map3 = this.f62679a.f64555e;
        if (map3 == null) {
            map3 = map2;
        }
        Iterator<Map.Entry<String, Map<String, Object>>> it4 = map3.entrySet().iterator();
        do {
            boolean zHasNext = it4.hasNext();
            String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (!zHasNext) {
                Map map4 = this.f62679a.f64556f;
                if (map4 != null) {
                    map2 = map4;
                }
                for (Map.Entry<String, String> entry2 : map2.entrySet()) {
                    String key2 = entry2.getKey();
                    W3 w32 = (W3) entry2.getValue();
                    db2.a("DELETE FROM internal_setup_teardown WHERE id = ?", new String[]{key2});
                    Iterable<C3440we> iterable2 = w32.f63559a;
                    if (iterable2 == null) {
                        iterable2 = EmptyList.f71733a;
                    }
                    for (C3440we c3440we : iterable2) {
                        ContentValues contentValues3 = new ContentValues();
                        contentValues3.put("id", key2);
                        contentValues3.put("phase", c3440we.f66246b);
                        contentValues3.put("position", c3440we.f66247c);
                        contentValues3.put("query", c3440we.f66245a);
                        String str4 = c3440we.f66248d;
                        if (str4 == null) {
                            str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        contentValues3.put("binds", str4);
                        Boolean bool = c3440we.f66249e;
                        contentValues3.put("repeat_binds", Integer.valueOf((int) (bool != null ? bool.booleanValue() : 0)));
                        if (db2.insert("internal_setup_teardown", 5, contentValues3) == -1) {
                            throw new RuntimeException("Failed to insert teardown query " + contentValues3);
                        }
                    }
                }
                return;
            }
            Map.Entry<String, Map<String, Object>> next = it4.next();
            String key3 = next.getKey();
            Map<String, Object> value2 = next.getValue();
            contentValues = new ContentValues();
            contentValues.put("id", key3);
            contentValues.put("query", String.valueOf(value2.get("query")));
            Object obj = value2.get("binds");
            if (obj != null && (string = obj.toString()) != null) {
                str3 = string;
            }
            contentValues.put("binds", str3);
        } while (db2.insert("internal_queries", 5, contentValues) != -1);
        throw new RuntimeException("Failed to insert version " + contentValues);
    }
}
