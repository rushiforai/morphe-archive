package z6;

import ab.e0;
import android.database.Cursor;
import b70.h;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.io.IOException;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.collections.builders.MapBuilder;
import kotlin.collections.builders.SetBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import ps.i0;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f98269a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f98270b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f98271c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f98272d;

    public e(String str, Map map, AbstractSet foreignKeys, AbstractSet abstractSet) {
        Intrinsics.g(foreignKeys, "foreignKeys");
        this.f98269a = str;
        this.f98270b = map;
        this.f98271c = foreignKeys;
        this.f98272d = abstractSet;
    }

    /* JADX WARN: Code restructure failed: missing block: B:64:0x01e3, code lost:
    
        r9 = ab.e0.l(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01e7, code lost:
    
        r3.close();
     */
    /* JADX WARN: Finally extract failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final e a(d7.a database, String str) throws IOException {
        Map mapB;
        Intrinsics.g(database, "database");
        Cursor cursorQuery = database.query("PRAGMA table_info(`" + str + "`)");
        try {
            if (cursorQuery.getColumnCount() <= 0) {
                mapB = h.f17594a;
                cursorQuery.close();
            } else {
                int columnIndex = cursorQuery.getColumnIndex(PendingUpgradeStore.KEY_NAME);
                int columnIndex2 = cursorQuery.getColumnIndex(TTConst.TRACK_TYPE);
                int columnIndex3 = cursorQuery.getColumnIndex("notnull");
                int columnIndex4 = cursorQuery.getColumnIndex("pk");
                int columnIndex5 = cursorQuery.getColumnIndex("dflt_value");
                MapBuilder mapBuilder = new MapBuilder();
                while (cursorQuery.moveToNext()) {
                    String name = cursorQuery.getString(columnIndex);
                    String type = cursorQuery.getString(columnIndex2);
                    boolean z11 = cursorQuery.getInt(columnIndex3) != 0;
                    int i5 = cursorQuery.getInt(columnIndex4);
                    String string = cursorQuery.getString(columnIndex5);
                    Intrinsics.f(name, "name");
                    Intrinsics.f(type, "type");
                    mapBuilder.put(name, new a(i5, 2, name, type, string, z11));
                }
                mapB = mapBuilder.b();
                cursorQuery.close();
            }
            cursorQuery = database.query("PRAGMA foreign_key_list(`" + str + "`)");
            try {
                int columnIndex6 = cursorQuery.getColumnIndex("id");
                int columnIndex7 = cursorQuery.getColumnIndex("seq");
                int columnIndex8 = cursorQuery.getColumnIndex("table");
                int columnIndex9 = cursorQuery.getColumnIndex("on_delete");
                int columnIndex10 = cursorQuery.getColumnIndex("on_update");
                List listN = i0.n(cursorQuery);
                cursorQuery.moveToPosition(-1);
                SetBuilder setBuilder = new SetBuilder();
                while (cursorQuery.moveToNext()) {
                    if (cursorQuery.getInt(columnIndex7) == 0) {
                        int i11 = cursorQuery.getInt(columnIndex6);
                        ArrayList arrayList = new ArrayList();
                        ArrayList arrayList2 = new ArrayList();
                        int i12 = columnIndex6;
                        ArrayList arrayList3 = new ArrayList();
                        for (Object obj : listN) {
                            int i13 = columnIndex7;
                            List list = listN;
                            if (((c) obj).f98261a == i11) {
                                arrayList3.add(obj);
                            }
                            columnIndex7 = i13;
                            listN = list;
                        }
                        int i14 = columnIndex7;
                        List list2 = listN;
                        Iterator it = arrayList3.iterator();
                        while (it.hasNext()) {
                            c cVar = (c) it.next();
                            arrayList.add(cVar.f98263c);
                            arrayList2.add(cVar.f98264d);
                        }
                        String string2 = cursorQuery.getString(columnIndex8);
                        Intrinsics.f(string2, "cursor.getString(tableColumnIndex)");
                        String string3 = cursorQuery.getString(columnIndex9);
                        Intrinsics.f(string3, "cursor.getString(onDeleteColumnIndex)");
                        String string4 = cursorQuery.getString(columnIndex10);
                        Intrinsics.f(string4, "cursor.getString(onUpdateColumnIndex)");
                        setBuilder.add(new b(string2, string3, arrayList, string4, arrayList2));
                        columnIndex6 = i12;
                        columnIndex7 = i14;
                        listN = list2;
                    }
                }
                SetBuilder setBuilderL = e0.l(setBuilder);
                cursorQuery.close();
                cursorQuery = database.query("PRAGMA index_list(`" + str + "`)");
                try {
                    int columnIndex11 = cursorQuery.getColumnIndex(PendingUpgradeStore.KEY_NAME);
                    int columnIndex12 = cursorQuery.getColumnIndex("origin");
                    int columnIndex13 = cursorQuery.getColumnIndex("unique");
                    SetBuilder setBuilderL2 = null;
                    if (columnIndex11 == -1 || columnIndex12 == -1 || columnIndex13 == -1) {
                        cursorQuery.close();
                    } else {
                        SetBuilder setBuilder2 = new SetBuilder();
                        while (true) {
                            if (!cursorQuery.moveToNext()) {
                                break;
                            }
                            if ("c".equals(cursorQuery.getString(columnIndex12))) {
                                String name2 = cursorQuery.getString(columnIndex11);
                                boolean z12 = cursorQuery.getInt(columnIndex13) == 1;
                                Intrinsics.f(name2, "name");
                                d dVarO = i0.o(database, name2, z12);
                                if (dVarO == null) {
                                    cursorQuery.close();
                                    break;
                                }
                                setBuilder2.add(dVarO);
                            }
                        }
                    }
                    return new e(str, mapB, setBuilderL, setBuilderL2);
                } finally {
                }
            } catch (Throwable th2) {
                try {
                    throw th2;
                } finally {
                }
            }
        } finally {
            try {
                throw th2;
            } finally {
            }
        }
    }

    public final boolean equals(Object obj) {
        Set set;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        if (!this.f98269a.equals(eVar.f98269a) || !this.f98270b.equals(eVar.f98270b) || !Intrinsics.b(this.f98271c, eVar.f98271c)) {
            return false;
        }
        Set set2 = this.f98272d;
        if (set2 == null || (set = eVar.f98272d) == null) {
            return true;
        }
        return set2.equals(set);
    }

    public final int hashCode() {
        return this.f98271c.hashCode() + ((this.f98270b.hashCode() + (this.f98269a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "TableInfo{name='" + this.f98269a + "', columns=" + this.f98270b + ", foreignKeys=" + this.f98271c + ", indices=" + this.f98272d + AbstractJsonLexerKt.END_OBJ;
    }
}
