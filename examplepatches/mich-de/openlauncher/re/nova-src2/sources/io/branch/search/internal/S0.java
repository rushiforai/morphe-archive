package io.branch.search.internal;

import android.database.Cursor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.json.JsonElement;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class S0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63314a;

    public S0(@NotNull String prefix) {
        Intrinsics.g(prefix, "prefix");
        this.f63314a = prefix;
    }

    @NotNull
    public final LinkedHashMap a(@NotNull Cursor cur) {
        Intrinsics.g(cur, "cur");
        String[] columnNames = cur.getColumnNames();
        Intrinsics.f(columnNames, "columnNames");
        ArrayList arrayList = new ArrayList();
        for (String columnName : columnNames) {
            Intrinsics.f(columnName, "columnName");
            if (r70.j.I0(columnName, this.f63314a, false)) {
                arrayList.add(columnName);
            }
        }
        int iD0 = b70.k.d0(b70.c.u0(arrayList, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String columnName2 = (String) it.next();
            Intrinsics.f(columnName2, "columnName");
            String strSubstring = columnName2.substring(4);
            Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            int columnIndex = cur.getColumnIndex(columnName2);
            linkedHashMap.put(strSubstring, (columnIndex == -1 || cur.isNull(columnIndex)) ? null : cur.getString(columnIndex));
        }
        KSerializer<List<JsonElement>> kSerializer = Zd.f63839a;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            if (entry.getValue() != null) {
                linkedHashMap2.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0065, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean b(@NotNull Cursor cur) {
        Intrinsics.g(cur, "cur");
        String[] columnNames = cur.getColumnNames();
        Intrinsics.f(columnNames, "columnNames");
        int length = columnNames.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            String columnName = columnNames[i5];
            Intrinsics.f(columnName, "columnName");
            if (r70.j.I0(columnName, this.f63314a, false)) {
                String[] columnNames2 = cur.getColumnNames();
                Intrinsics.f(columnNames2, "columnNames");
                ArrayList arrayList = new ArrayList();
                for (String columnName2 : columnNames2) {
                    Intrinsics.f(columnName2, "columnName");
                    if (!r70.j.I0(columnName2, this.f63314a, false)) {
                        arrayList.add(columnName2);
                    }
                }
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    if (cur.getType(cur.getColumnIndex((String) it.next())) != 0) {
                    }
                }
                return true;
            }
            i5++;
        }
    }
}
