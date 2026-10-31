package vm;

import android.content.Context;
import android.database.AbstractWindowedCursor;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Parcelable;
import android.util.Log;
import androidx.room.t;
import b00.z0;
import bm.k;
import bm.o;
import java.io.IOException;
import java.util.ListIterator;
import java.util.Map;
import kotlin.Unit;
import kotlin.collections.builders.ListBuilder;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import ll.i;
import r70.j;
import t5.g;
import x80.r0;

/* loaded from: classes.dex */
public abstract class d {
    public static final long a(float f11, float f12) {
        return (Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32);
    }

    public static long b(boolean z11, int i5, int i11, long j11, long j12, int i12, boolean z12, long j13, long j14, long j15, long j16) {
        fq.c.o(i11, "backoffPolicy");
        if (j16 != Long.MAX_VALUE && z12) {
            if (i12 != 0) {
                long j17 = j12 + 900000;
                if (j16 < j17) {
                    return j17;
                }
            }
            return j16;
        }
        if (z11) {
            long jScalb = i11 == 2 ? j11 * i5 : (long) Math.scalb(j11, i5 - 1);
            if (jScalb > 18000000) {
                jScalb = 18000000;
            }
            return j12 + jScalb;
        }
        if (z12) {
            long j18 = i12 == 0 ? j12 + j13 : j12 + j15;
            return (j14 == j15 || i12 != 0) ? j18 : (j15 - j14) + j18;
        }
        if (j12 == -1) {
            return Long.MAX_VALUE;
        }
        return j12 + j13;
    }

    public static bm.b c(String str, String str2) {
        a aVar = new a(str, str2);
        bm.a aVarB = bm.b.b(a.class);
        aVarB.f18057b = 1;
        aVarB.f18062g = new z0(aVar, 1);
        return aVarB.b();
    }

    public static final void d(d7.a db2) throws IOException {
        Intrinsics.g(db2, "db");
        ListBuilder listBuilderW = ul.b.w();
        Cursor cursorQuery = db2.query("SELECT name FROM sqlite_master WHERE type = 'trigger'");
        while (cursorQuery.moveToNext()) {
            try {
                listBuilderW.add(cursorQuery.getString(0));
            } finally {
            }
        }
        Unit unit = Unit.f71706a;
        cursorQuery.close();
        ListIterator listIterator = ul.b.m(listBuilderW).listIterator(0);
        while (true) {
            c70.a aVar = (c70.a) listIterator;
            if (!aVar.hasNext()) {
                return;
            }
            String triggerName = (String) aVar.next();
            Intrinsics.f(triggerName, "triggerName");
            if (j.I0(triggerName, "room_fts_content_sync_", false)) {
                db2.execSQL("DROP TRIGGER IF EXISTS ".concat(triggerName));
            }
        }
    }

    public static final Object e(g gVar, Function2 function2, ContinuationImpl continuationImpl) {
        return gVar.a(new y5.c(function2, null, 1), continuationImpl);
    }

    public static boolean f(Object obj, Map map) {
        if (map == obj) {
            return true;
        }
        if (obj instanceof Map) {
            return map.entrySet().equals(((Map) obj).entrySet());
        }
        return false;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static r0 g(String javaName) {
        Intrinsics.g(javaName, "javaName");
        int iHashCode = javaName.hashCode();
        if (iHashCode != 79201641) {
            if (iHashCode != 79923350) {
                switch (iHashCode) {
                    case -503070503:
                        if (javaName.equals("TLSv1.1")) {
                            return r0.TLS_1_1;
                        }
                        break;
                    case -503070502:
                        if (javaName.equals("TLSv1.2")) {
                            return r0.TLS_1_2;
                        }
                        break;
                    case -503070501:
                        if (javaName.equals("TLSv1.3")) {
                            return r0.TLS_1_3;
                        }
                        break;
                }
            } else if (javaName.equals("TLSv1")) {
                return r0.TLS_1_0;
            }
        } else if (javaName.equals("SSLv3")) {
            return r0.SSL_3_0;
        }
        throw new IllegalArgumentException("Unexpected TLS version: ".concat(javaName));
    }

    public static bm.b h(String str, i iVar) {
        bm.a aVarB = bm.b.b(a.class);
        aVarB.f18057b = 1;
        aVarB.a(k.b(Context.class));
        aVarB.f18062g = new o(3, str, iVar);
        return aVarB.b();
    }

    public static Object i(Bundle bundle, String str, Class cls) {
        if (Build.VERSION.SDK_INT >= 34) {
            return w4.b.a(bundle, str, cls);
        }
        Parcelable parcelable = bundle.getParcelable(str);
        if (cls.isInstance(parcelable)) {
            return parcelable;
        }
        return null;
    }

    public static void j(Object obj, String str) {
        Log.e(obj.getClass().getSimpleName(), str);
    }

    public static final String k(int i5, String str) {
        if (i5 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return Uri.parse("android.resource://" + str + "/" + i5).toString();
    }

    public static final Cursor l(androidx.room.o db2, t tVar, boolean z11) throws IOException {
        Intrinsics.g(db2, "db");
        Cursor cursorQuery = db2.query(tVar, (CancellationSignal) null);
        if (z11 && (cursorQuery instanceof AbstractWindowedCursor)) {
            AbstractWindowedCursor abstractWindowedCursor = (AbstractWindowedCursor) cursorQuery;
            int count = abstractWindowedCursor.getCount();
            if ((abstractWindowedCursor.hasWindow() ? abstractWindowedCursor.getWindow().getNumRows() : count) < count) {
                try {
                    MatrixCursor matrixCursor = new MatrixCursor(cursorQuery.getColumnNames(), cursorQuery.getCount());
                    while (cursorQuery.moveToNext()) {
                        Object[] objArr = new Object[cursorQuery.getColumnCount()];
                        int columnCount = cursorQuery.getColumnCount();
                        for (int i5 = 0; i5 < columnCount; i5++) {
                            int type = cursorQuery.getType(i5);
                            if (type == 0) {
                                objArr[i5] = null;
                            } else if (type == 1) {
                                objArr[i5] = Long.valueOf(cursorQuery.getLong(i5));
                            } else if (type == 2) {
                                objArr[i5] = Double.valueOf(cursorQuery.getDouble(i5));
                            } else if (type == 3) {
                                objArr[i5] = cursorQuery.getString(i5);
                            } else {
                                if (type != 4) {
                                    throw new IllegalStateException();
                                }
                                objArr[i5] = cursorQuery.getBlob(i5);
                            }
                        }
                        matrixCursor.addRow(objArr);
                    }
                    cursorQuery.close();
                    return matrixCursor;
                } finally {
                }
            }
        }
        return cursorQuery;
    }
}
