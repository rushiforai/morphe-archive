package fa;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.graphics.Bitmap;
import android.util.SparseArray;
import coil.memory.MemoryCache$Key;
import com.google.android.gms.internal.measurement.v6;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jf.util.ExceptionWithContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class t {

    /* renamed from: a, reason: collision with root package name */
    public int f54485a;

    /* renamed from: b, reason: collision with root package name */
    public Object f54486b;

    public /* synthetic */ t(Object obj, int i5) {
        this.f54486b = obj;
        this.f54485a = i5;
    }

    public static t d(File file) throws JSONException, IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ya.l0.b(fileInputStream, byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            fileInputStream.close();
            JSONObject jSONObject = new JSONObject(new String(byteArray));
            t tVar = new t(jSONObject.getInt("version"), 0);
            for (int i5 = tVar.f54485a - 1; i5 > 0; i5--) {
                if (jSONObject.has("downgrade_to_" + i5)) {
                    JSONArray jSONArray = jSONObject.getJSONArray("downgrade_to_" + i5);
                    int length = jSONArray.length();
                    String[] strArr = new String[length];
                    for (int i11 = 0; i11 < length; i11++) {
                        strArr[i11] = jSONArray.getString(i11);
                    }
                    ((SparseArray) tVar.f54486b).put(i5, strArr);
                }
            }
            return tVar;
        } catch (Throwable th2) {
            try {
                fileInputStream.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public Object a() {
        Object[] objArr = (Object[]) this.f54486b;
        int i5 = this.f54485a;
        if (i5 <= 0) {
            return null;
        }
        int i11 = i5 - 1;
        Object obj = objArr[i11];
        Intrinsics.e(obj, "null cannot be cast to non-null type T of androidx.core.util.Pools.SimplePool");
        objArr[i11] = null;
        this.f54485a--;
        return obj;
    }

    public void b() {
        WeakReference weakReferenceA;
        this.f54485a = 0;
        Iterator it = ((LinkedHashMap) this.f54486b).values().iterator();
        while (it.hasNext()) {
            ArrayList arrayList = (ArrayList) it.next();
            if (arrayList.size() <= 1) {
                v8.e eVar = (v8.e) b70.g.Y0(arrayList);
                if (((eVar == null || (weakReferenceA = eVar.a()) == null) ? null : (Bitmap) weakReferenceA.get()) == null) {
                    it.remove();
                }
            } else {
                int size = arrayList.size();
                int i5 = 0;
                for (int i11 = 0; i11 < size; i11++) {
                    int i12 = i11 - i5;
                    if (((v8.e) arrayList.get(i12)).a().get() == null) {
                        arrayList.remove(i12);
                        i5++;
                    }
                }
                if (arrayList.isEmpty()) {
                    it.remove();
                }
            }
        }
    }

    public void c(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        ArrayList arrayList = new ArrayList();
        for (int i12 = i5 - 1; i12 >= i11; i12--) {
            String[] strArr = (String[]) ((SparseArray) this.f54486b).get(i12);
            if (strArr == null) {
                throw new SQLiteException(b.c0.h(i12, "Downgrade path not supported to version "));
            }
            Collections.addAll(arrayList, strArr);
        }
        la.a aVar = new la.a(sQLiteDatabase);
        try {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                sQLiteDatabase.execSQL((String) it.next());
            }
            aVar.a();
            aVar.close();
        } catch (Throwable th2) {
            try {
                aVar.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public int e(int i5) {
        int i11 = this.f54485a - 1;
        return i11 >= 0 ? ((int[]) this.f54486b)[i11] : i5;
    }

    public int f() {
        int[] iArr = (int[]) this.f54486b;
        int i5 = this.f54485a - 1;
        this.f54485a = i5;
        return iArr[i5];
    }

    public void g(int i5) {
        int[] iArrCopyOf = (int[]) this.f54486b;
        if (this.f54485a >= iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, iArrCopyOf.length * 2);
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f54486b = iArrCopyOf;
        }
        int i11 = this.f54485a;
        this.f54485a = i11 + 1;
        iArrCopyOf[i11] = i5;
    }

    public int h(int i5) {
        int i11;
        int i12;
        int i13;
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i14 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        if (i5 != 1) {
            if (i5 == 2) {
                i12 = bArr[i14] & 255;
                i13 = bArr[i14 + 1] << 8;
            } else if (i5 == 3) {
                i12 = (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8);
                i13 = bArr[i14 + 2] << 16;
            } else {
                if (i5 != 4) {
                    throw new ExceptionWithContext(null, "Invalid size %d for sized int at offset 0x%x", Integer.valueOf(i5), Integer.valueOf(this.f54485a));
                }
                i12 = (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16);
                i13 = bArr[i14 + 3] << 24;
            }
            i11 = i13 | i12;
        } else {
            i11 = bArr[i14];
        }
        this.f54485a = i14 + i5;
        return i11;
    }

    public long i(int i5) {
        int i11;
        int i12;
        int i13;
        long j11;
        long j12;
        long j13;
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i14 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        switch (i5) {
            case 1:
                i11 = bArr[i14];
                j11 = i11;
                this.f54485a = i14 + i5;
                return j11;
            case 2:
                i12 = bArr[i14] & 255;
                i13 = bArr[i14 + 1] << 8;
                i11 = i13 | i12;
                j11 = i11;
                this.f54485a = i14 + i5;
                return j11;
            case 3:
                i12 = (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8);
                i13 = bArr[i14 + 2] << 16;
                i11 = i13 | i12;
                j11 = i11;
                this.f54485a = i14 + i5;
                return j11;
            case 4:
                j12 = (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16);
                j13 = bArr[i14 + 3] << 24;
                j11 = j12 | j13;
                this.f54485a = i14 + i5;
                return j11;
            case 5:
                j12 = (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16) | ((255 & bArr[i14 + 3]) << 24);
                j13 = bArr[i14 + 4] << 32;
                j11 = j12 | j13;
                this.f54485a = i14 + i5;
                return j11;
            case 6:
                j11 = (bArr[i14 + 5] << 40) | ((bArr[i14 + 4] & 255) << 32) | (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16) | ((bArr[i14 + 3] & 255) << 24);
                this.f54485a = i14 + i5;
                return j11;
            case 7:
                j11 = ((bArr[i14 + 4] & 255) << 32) | (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16) | ((bArr[i14 + 3] & 255) << 24) | ((255 & bArr[i14 + 5]) << 40) | (bArr[i14 + 6] << 48);
                this.f54485a = i14 + i5;
                return j11;
            case 8:
                j12 = ((bArr[i14 + 4] & 255) << 32) | (bArr[i14] & 255) | ((bArr[i14 + 1] & 255) << 8) | ((bArr[i14 + 2] & 255) << 16) | ((bArr[i14 + 3] & 255) << 24) | ((bArr[i14 + 5] & 255) << 40) | ((bArr[i14 + 6] & 255) << 48);
                j13 = bArr[i14 + 7] << 56;
                j11 = j12 | j13;
                this.f54485a = i14 + i5;
                return j11;
            default:
                throw new ExceptionWithContext(null, "Invalid size %d for sized long at offset 0x%x", Integer.valueOf(i5), Integer.valueOf(this.f54485a));
        }
    }

    public int j(int i5) {
        int i11;
        int i12;
        byte b11;
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i13 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        if (i5 != 1) {
            if (i5 == 2) {
                i12 = (bArr[i13] & 255) << 16;
                b11 = bArr[i13 + 1];
            } else if (i5 == 3) {
                i12 = ((bArr[i13] & 255) << 8) | ((bArr[i13 + 1] & 255) << 16);
                b11 = bArr[i13 + 2];
            } else {
                if (i5 != 4) {
                    throw new ExceptionWithContext(null, "Invalid size %d for sized, right extended int at offset 0x%x", Integer.valueOf(i5), Integer.valueOf(this.f54485a));
                }
                i12 = (bArr[i13] & 255) | ((bArr[i13 + 1] & 255) << 8) | ((bArr[i13 + 2] & 255) << 16);
                b11 = bArr[i13 + 3];
            }
            i11 = (b11 << 24) | i12;
        } else {
            i11 = bArr[i13] << 24;
        }
        this.f54485a = i13 + i5;
        return i11;
    }

    public long k(int i5) {
        long j11;
        long j12;
        byte b11;
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i11 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        switch (i5) {
            case 1:
                j11 = bArr[i11] << 56;
                this.f54485a = i11 + i5;
                return j11;
            case 2:
                j12 = (bArr[i11] & 255) << 48;
                b11 = bArr[i11 + 1];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 3:
                j12 = ((bArr[i11] & 255) << 40) | ((255 & bArr[i11 + 1]) << 48);
                b11 = bArr[i11 + 2];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 4:
                j12 = ((bArr[i11] & 255) << 32) | ((bArr[i11 + 1] & 255) << 40) | ((255 & bArr[i11 + 2]) << 48);
                b11 = bArr[i11 + 3];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 5:
                j12 = ((bArr[i11 + 1] & 255) << 32) | ((bArr[i11] & 255) << 24) | ((bArr[i11 + 2] & 255) << 40) | ((255 & bArr[i11 + 3]) << 48);
                b11 = bArr[i11 + 4];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 6:
                j12 = ((bArr[i11 + 2] & 255) << 32) | ((bArr[i11] & 255) << 16) | ((bArr[i11 + 1] & 255) << 24) | ((bArr[i11 + 3] & 255) << 40) | ((255 & bArr[i11 + 4]) << 48);
                b11 = bArr[i11 + 5];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 7:
                j12 = ((bArr[i11 + 3] & 255) << 32) | ((bArr[i11] & 255) << 8) | ((bArr[i11 + 1] & 255) << 16) | ((bArr[i11 + 2] & 255) << 24) | ((bArr[i11 + 4] & 255) << 40) | ((255 & bArr[i11 + 5]) << 48);
                b11 = bArr[i11 + 6];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            case 8:
                j12 = ((bArr[i11 + 4] & 255) << 32) | (bArr[i11] & 255) | ((bArr[i11 + 1] & 255) << 8) | ((bArr[i11 + 2] & 255) << 16) | ((bArr[i11 + 3] & 255) << 24) | ((bArr[i11 + 5] & 255) << 40) | ((255 & bArr[i11 + 6]) << 48);
                b11 = bArr[i11 + 7];
                j11 = j12 | (b11 << 56);
                this.f54485a = i11 + i5;
                return j11;
            default:
                throw new ExceptionWithContext(null, "Invalid size %d for sized, right extended long at offset 0x%x", Integer.valueOf(i5), Integer.valueOf(this.f54485a));
        }
    }

    public int l(int i5) {
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i11 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        int i12 = 0;
        if (i5 != 1) {
            if (i5 != 2) {
                if (i5 != 3) {
                    if (i5 != 4) {
                        throw new ExceptionWithContext(null, "Invalid size %d for sized uint at offset 0x%x", Integer.valueOf(i5), Integer.valueOf(this.f54485a));
                    }
                    byte b11 = bArr[i11 + 3];
                    if (b11 < 0) {
                        throw new ExceptionWithContext(null, "Encountered valid sized uint that is out of range at offset 0x%x", Integer.valueOf(this.f54485a));
                    }
                    i12 = b11 << 24;
                }
                i12 |= (bArr[i11 + 2] & 255) << 16;
            }
            i12 |= (bArr[i11 + 1] & 255) << 8;
        }
        int i13 = (bArr[i11] & 255) | i12;
        this.f54485a = i11 + i5;
        return i13;
    }

    public int m(boolean z11) {
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i5 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        int i12 = b11 & 255;
        if (i12 > 127) {
            int i13 = i5 + 2;
            byte b12 = bArr[i11];
            int i14 = b12 & 255;
            int i15 = ((b12 & AbstractJsonLexerKt.TC_INVALID) << 7) | (b11 & AbstractJsonLexerKt.TC_INVALID);
            if (i14 > 127) {
                int i16 = i5 + 3;
                byte b13 = bArr[i13];
                int i17 = b13 & 255;
                i12 = ((b13 & AbstractJsonLexerKt.TC_INVALID) << 14) | i15;
                if (i17 > 127) {
                    i11 = i5 + 4;
                    byte b14 = bArr[i16];
                    int i18 = b14 & 255;
                    i12 |= (b14 & AbstractJsonLexerKt.TC_INVALID) << 21;
                    if (i18 > 127) {
                        int i19 = i5 + 5;
                        byte b15 = bArr[i11];
                        if (b15 < 0) {
                            throw new ExceptionWithContext(null, "Invalid uleb128 integer encountered at offset 0x%x", Integer.valueOf(this.f54485a));
                        }
                        if ((b15 & 15) > 7 && !z11) {
                            throw new ExceptionWithContext(null, "Encountered valid uleb128 that is out of range at offset 0x%x", Integer.valueOf(this.f54485a));
                        }
                        i12 |= b15 << 28;
                        i11 = i19;
                    }
                } else {
                    i11 = i16;
                }
            } else {
                i12 = i15;
                i11 = i13;
            }
        }
        this.f54485a = i11;
        return i12;
    }

    public boolean n(Object instance) {
        boolean z11;
        Object[] objArr = (Object[]) this.f54486b;
        Intrinsics.g(instance, "instance");
        int i5 = this.f54485a;
        int i11 = 0;
        while (true) {
            if (i11 >= i5) {
                z11 = false;
                break;
            }
            if (objArr[i11] == instance) {
                z11 = true;
                break;
            }
            i11++;
        }
        if (z11) {
            throw new IllegalStateException("Already in the pool!");
        }
        int i12 = this.f54485a;
        if (i12 >= objArr.length) {
            return false;
        }
        objArr[i12] = instance;
        this.f54485a = i12 + 1;
        return true;
    }

    public synchronized void o(MemoryCache$Key memoryCache$Key, Bitmap bitmap, Map map, int i5) {
        try {
            LinkedHashMap linkedHashMap = (LinkedHashMap) this.f54486b;
            Object arrayList = linkedHashMap.get(memoryCache$Key);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(memoryCache$Key, arrayList);
            }
            ArrayList arrayList2 = (ArrayList) arrayList;
            int iIdentityHashCode = System.identityHashCode(bitmap);
            v8.e eVar = new v8.e(iIdentityHashCode, new WeakReference(bitmap), map, i5);
            int size = arrayList2.size();
            int i11 = 0;
            while (true) {
                if (i11 >= size) {
                    arrayList2.add(eVar);
                    break;
                }
                v8.e eVar2 = (v8.e) arrayList2.get(i11);
                if (i5 < eVar2.d()) {
                    i11++;
                } else if (eVar2.c() == iIdentityHashCode && eVar2.a().get() == bitmap) {
                    arrayList2.set(i11, eVar);
                } else {
                    arrayList2.add(i11, eVar);
                }
            }
            int i12 = this.f54485a;
            this.f54485a = i12 + 1;
            if (i12 >= 10) {
                b();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003f A[PHI: r3
      0x003f: PHI (r3v2 int) = (r3v1 int), (r3v4 int) binds: [B:5:0x0017, B:9:0x0023] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void p() {
        v6 v6Var = (v6) this.f54486b;
        v6Var.getClass();
        int i5 = this.f54485a;
        byte[] bArr = (byte[]) v6Var.f33136b;
        int i11 = i5 + 1;
        if (bArr[i5] < 0) {
            int i12 = i5 + 2;
            if (bArr[i11] < 0) {
                i11 = i5 + 3;
                if (bArr[i12] < 0) {
                    i12 = i5 + 4;
                    if (bArr[i11] < 0) {
                        i11 = i5 + 5;
                        if (bArr[i12] < 0) {
                            throw new ExceptionWithContext(null, "Invalid uleb128 integer encountered at offset 0x%x", Integer.valueOf(this.f54485a));
                        }
                    } else {
                        i11 = i12;
                    }
                }
            }
        }
        this.f54485a = i11;
    }

    public t(char c11, int i5) {
        switch (i5) {
            case 5:
                this.f54486b = new LinkedHashMap();
                break;
            default:
                this.f54486b = new int[10];
                break;
        }
    }

    public t(int i5, int i11) {
        switch (i11) {
            case 1:
                this.f54485a = i5;
                return;
            case 6:
                if (i5 > 0) {
                    this.f54486b = new Object[i5];
                    return;
                }
                throw new IllegalArgumentException("The max pool size must be > 0");
            default:
                this.f54486b = new SparseArray();
                this.f54485a = i5;
                return;
        }
    }
}
