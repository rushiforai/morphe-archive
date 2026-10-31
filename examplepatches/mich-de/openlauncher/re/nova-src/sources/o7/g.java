package o7;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final String f79664b = r.e("Data");

    /* renamed from: c, reason: collision with root package name */
    public static final g f79665c;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f79666a;

    static {
        g gVar = new g(new HashMap());
        c(gVar);
        f79665c = gVar;
    }

    public g(g gVar) {
        this.f79666a = new HashMap(gVar.f79666a);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:4|(5:55|5|56|6|(2:8|9))|49|16|53|20|33|34) */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0037, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0038, code lost:
    
        android.util.Log.e(r1, "Error in Data#fromByteArray: ", r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x003f, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0040, code lost:
    
        android.util.Log.e(r1, "Error in Data#fromByteArray: ", r8);
     */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0033 A[EXC_TOP_SPLITTER, PHI: r4
      0x0033: PHI (r4v7 java.io.ObjectInputStream) = (r4v6 java.io.ObjectInputStream), (r4v8 java.io.ObjectInputStream) binds: [B:31:0x0052, B:7:0x001d] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x005d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static g a(byte[] bArr) throws Throwable {
        Throwable th2;
        ObjectInputStream objectInputStream;
        Throwable e3;
        String str = f79664b;
        if (bArr.length > 10240) {
            throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized");
        }
        HashMap map = new HashMap();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ObjectInputStream objectInputStream2 = null;
        try {
            try {
                objectInputStream = new ObjectInputStream(byteArrayInputStream);
                try {
                    for (int i5 = objectInputStream.readInt(); i5 > 0; i5--) {
                        map.put(objectInputStream.readUTF(), objectInputStream.readObject());
                    }
                } catch (IOException e11) {
                    e3 = e11;
                    Log.e(str, "Error in Data#fromByteArray: ", e3);
                    if (objectInputStream != null) {
                        objectInputStream.close();
                    }
                    byteArrayInputStream.close();
                    return new g(map);
                } catch (ClassNotFoundException e12) {
                    e3 = e12;
                    Log.e(str, "Error in Data#fromByteArray: ", e3);
                    if (objectInputStream != null) {
                    }
                    byteArrayInputStream.close();
                    return new g(map);
                }
            } catch (Throwable th3) {
                th2 = th3;
                if (0 != 0) {
                    try {
                        objectInputStream2.close();
                    } catch (IOException e13) {
                        Log.e(str, "Error in Data#fromByteArray: ", e13);
                    }
                }
                try {
                    byteArrayInputStream.close();
                    throw th2;
                } catch (IOException e14) {
                    Log.e(str, "Error in Data#fromByteArray: ", e14);
                    throw th2;
                }
            }
        } catch (IOException e15) {
            e = e15;
            Throwable th4 = e;
            objectInputStream = null;
            e3 = th4;
            Log.e(str, "Error in Data#fromByteArray: ", e3);
            if (objectInputStream != null) {
            }
            byteArrayInputStream.close();
            return new g(map);
        } catch (ClassNotFoundException e16) {
            e = e16;
            Throwable th42 = e;
            objectInputStream = null;
            e3 = th42;
            Log.e(str, "Error in Data#fromByteArray: ", e3);
            if (objectInputStream != null) {
            }
            byteArrayInputStream.close();
            return new g(map);
        } catch (Throwable th5) {
            th2 = th5;
            if (0 != 0) {
            }
            byteArrayInputStream.close();
            throw th2;
        }
        objectInputStream.close();
        byteArrayInputStream.close();
        return new g(map);
    }

    public static byte[] c(g gVar) throws Throwable {
        ObjectOutputStream objectOutputStream;
        String str = f79664b;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ObjectOutputStream objectOutputStream2 = null;
        try {
            try {
                objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e3) {
            e = e3;
        }
        try {
            objectOutputStream.writeInt(gVar.f79666a.size());
            for (Map.Entry entry : gVar.f79666a.entrySet()) {
                objectOutputStream.writeUTF((String) entry.getKey());
                objectOutputStream.writeObject(entry.getValue());
            }
            try {
                objectOutputStream.close();
            } catch (IOException e11) {
                Log.e(str, "Error in Data#toByteArray: ", e11);
            }
            try {
                byteArrayOutputStream.close();
            } catch (IOException e12) {
                Log.e(str, "Error in Data#toByteArray: ", e12);
            }
            if (byteArrayOutputStream.size() <= 10240) {
                return byteArrayOutputStream.toByteArray();
            }
            throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized");
        } catch (IOException e13) {
            e = e13;
            objectOutputStream2 = objectOutputStream;
            Log.e(str, "Error in Data#toByteArray: ", e);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            if (objectOutputStream2 != null) {
                try {
                    objectOutputStream2.close();
                } catch (IOException e14) {
                    Log.e(str, "Error in Data#toByteArray: ", e14);
                }
            }
            try {
                byteArrayOutputStream.close();
            } catch (IOException e15) {
                Log.e(str, "Error in Data#toByteArray: ", e15);
            }
            return byteArray;
        } catch (Throwable th3) {
            th = th3;
            objectOutputStream2 = objectOutputStream;
            if (objectOutputStream2 != null) {
                try {
                    objectOutputStream2.close();
                } catch (IOException e16) {
                    Log.e(str, "Error in Data#toByteArray: ", e16);
                }
            }
            try {
                byteArrayOutputStream.close();
                throw th;
            } catch (IOException e17) {
                Log.e(str, "Error in Data#toByteArray: ", e17);
                throw th;
            }
        }
    }

    public final String b(String str) {
        Object obj = this.f79666a.get(str);
        if (obj instanceof String) {
            return (String) obj;
        }
        return null;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (obj != null && g.class == obj.getClass()) {
                HashMap map = ((g) obj).f79666a;
                HashMap map2 = this.f79666a;
                Set<String> setKeySet = map2.keySet();
                if (setKeySet.equals(map.keySet())) {
                    for (String str : setKeySet) {
                        Object obj2 = map2.get(str);
                        Object obj3 = map.get(str);
                        if (!((obj2 == null || obj3 == null) ? obj2 == obj3 : ((obj2 instanceof Object[]) && (obj3 instanceof Object[])) ? Arrays.deepEquals((Object[]) obj2, (Object[]) obj3) : obj2.equals(obj3))) {
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }

    public final int hashCode() {
        return this.f79666a.hashCode() * 31;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Data {");
        HashMap map = this.f79666a;
        if (!map.isEmpty()) {
            for (String str : map.keySet()) {
                sb2.append(str);
                sb2.append(" : ");
                Object obj = map.get(str);
                if (obj instanceof Object[]) {
                    sb2.append(Arrays.toString((Object[]) obj));
                } else {
                    sb2.append(obj);
                }
                sb2.append(", ");
            }
        }
        sb2.append("}");
        return sb2.toString();
    }

    public g(HashMap map) {
        this.f79666a = new HashMap(map);
    }
}
