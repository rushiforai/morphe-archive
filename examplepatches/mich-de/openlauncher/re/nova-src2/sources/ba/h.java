package ba;

import aa.d0;
import android.content.ComponentName;
import android.content.pm.PackageInfo;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.SparseBooleanArray;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Stack;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: f, reason: collision with root package name */
    public static final Object f17757f = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final d0 f17759b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayMap f17760c = new ArrayMap();

    /* renamed from: d, reason: collision with root package name */
    public final SparseBooleanArray f17761d = new SparseBooleanArray();

    /* renamed from: e, reason: collision with root package name */
    public boolean f17762e = true;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f17758a = new HashMap();

    public h(d0 d0Var) {
        this.f17759b = d0Var;
        d0Var.f559e.removeCallbacksAndMessages(f17757f);
        for (PackageInfo packageInfo : d0Var.f557c.getInstalledPackages(UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
            this.f17758a.put(packageInfo.packageName, packageInfo);
        }
    }

    public final void a() {
        StringBuilder sb2 = new StringBuilder("rowid IN (");
        SparseBooleanArray sparseBooleanArray = this.f17761d;
        int size = sparseBooleanArray.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            if (sparseBooleanArray.valueAt(i11)) {
                if (i5 > 0) {
                    sb2.append(", ");
                }
                sb2.append(sparseBooleanArray.keyAt(i11));
                i5++;
            }
        }
        sb2.append(')');
        if (i5 > 0) {
            this.f17759b.f561g.a(sb2.toString(), null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:93:0x0187 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(ArrayList arrayList, d dVar, f fVar) throws Throwable {
        HashMap map;
        Iterator it;
        long j11;
        Set set;
        HashMap map2 = new HashMap();
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = arrayList.get(i5);
            UserHandle userHandleI = dVar.i(obj);
            HashMap map3 = (HashMap) map2.get(userHandleI);
            if (map3 == null) {
                map3 = new HashMap();
                map2.put(userHandleI, map3);
            }
            map3.put(dVar.m(obj), obj);
        }
        Iterator it2 = map2.entrySet().iterator();
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            UserHandle userHandle = (UserHandle) entry.getKey();
            HashMap map4 = (HashMap) entry.getValue();
            Set set2 = (Set) this.f17760c.get(userHandle);
            if (set2 == null) {
                set2 = Collections.EMPTY_SET;
            }
            d0 d0Var = this.f17759b;
            long jD = d0Var.f570r.d(userHandle);
            Stack stack = new Stack();
            try {
                c cVar = d0Var.f561g;
                String[] strArr = {Long.toString(jD)};
                Cursor cursorQuery = cVar.f17739a.getReadableDatabase().query("icons", new String[]{"rowid", "componentName", "lastUpdated", "version", "system_state"}, "profileId = ? ", strArr, null, null, null);
                try {
                    int columnIndex = cursorQuery.getColumnIndex("componentName");
                    int columnIndex2 = cursorQuery.getColumnIndex("lastUpdated");
                    int columnIndex3 = cursorQuery.getColumnIndex("version");
                    int columnIndex4 = cursorQuery.getColumnIndex("rowid");
                    int columnIndex5 = cursorQuery.getColumnIndex("system_state");
                    while (cursorQuery.moveToNext()) {
                        int i11 = columnIndex;
                        ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(cursorQuery.getString(columnIndex));
                        it = it2;
                        try {
                            PackageInfo packageInfo = (PackageInfo) this.f17758a.get(componentNameUnflattenFromString.getPackageName());
                            int i12 = cursorQuery.getInt(columnIndex4);
                            int i13 = columnIndex4;
                            SparseBooleanArray sparseBooleanArray = this.f17761d;
                            if (packageInfo != null) {
                                set = set2;
                                if ((packageInfo.applicationInfo.flags & 16777216) != 0) {
                                    columnIndex = i11;
                                    it2 = it;
                                    columnIndex4 = i13;
                                    set2 = set;
                                } else {
                                    long j12 = cursorQuery.getLong(columnIndex2);
                                    int i14 = cursorQuery.getInt(columnIndex3);
                                    int i15 = columnIndex3;
                                    Object objRemove = map4.remove(componentNameUnflattenFromString);
                                    map = map4;
                                    try {
                                        if (i14 == packageInfo.versionCode) {
                                            j11 = jD;
                                            try {
                                                if (j12 == packageInfo.lastUpdateTime && TextUtils.equals(cursorQuery.getString(columnIndex5), d0Var.l(packageInfo.packageName))) {
                                                    if (!this.f17762e) {
                                                        sparseBooleanArray.put(i12, false);
                                                    }
                                                }
                                                columnIndex = i11;
                                                it2 = it;
                                                columnIndex4 = i13;
                                                set2 = set;
                                                columnIndex3 = i15;
                                                map4 = map;
                                                jD = j11;
                                            } catch (Throwable th2) {
                                                th = th2;
                                                Throwable th3 = th;
                                                if (cursorQuery != null) {
                                                }
                                                throw th3;
                                            }
                                        } else {
                                            j11 = jD;
                                        }
                                        if (objRemove != null) {
                                            stack.add(objRemove);
                                        } else if (this.f17762e) {
                                            d0Var.A(componentNameUnflattenFromString, userHandle);
                                            sparseBooleanArray.put(i12, true);
                                        }
                                        columnIndex = i11;
                                        it2 = it;
                                        columnIndex4 = i13;
                                        set2 = set;
                                        columnIndex3 = i15;
                                        map4 = map;
                                        jD = j11;
                                    } catch (Throwable th4) {
                                        th = th4;
                                        j11 = jD;
                                        Throwable th32 = th;
                                        if (cursorQuery != null) {
                                            try {
                                                cursorQuery.close();
                                            } catch (Throwable th5) {
                                                th32.addSuppressed(th5);
                                            }
                                        }
                                        throw th32;
                                    }
                                }
                            } else if (set2.contains(componentNameUnflattenFromString.getPackageName())) {
                                columnIndex = i11;
                                it2 = it;
                                columnIndex4 = i13;
                            } else {
                                set = set2;
                                if (this.f17762e) {
                                    d0Var.A(componentNameUnflattenFromString, userHandle);
                                    sparseBooleanArray.put(i12, true);
                                }
                                columnIndex = i11;
                                it2 = it;
                                columnIndex4 = i13;
                                set2 = set;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            map = map4;
                        }
                    }
                    map = map4;
                    it = it2;
                    j11 = jD;
                    try {
                        cursorQuery.close();
                    } catch (SQLiteException unused) {
                    }
                } catch (Throwable th7) {
                    th = th7;
                    map = map4;
                    it = it2;
                }
            } catch (SQLiteException unused2) {
                map = map4;
                it = it2;
                j11 = jD;
            }
            if (!map.isEmpty() || !stack.isEmpty()) {
                Stack stack2 = new Stack();
                stack2.addAll(map.values());
                new g(this, j11, userHandle, stack2, stack, dVar, fVar).a();
            }
            it2 = it;
        }
        this.f17762e = false;
    }
}
