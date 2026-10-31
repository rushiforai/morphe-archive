package bh;

import android.content.ContentProviderClient;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.os.IInterface;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import b.i8;
import com.google.android.gms.dynamite.DynamiteModule$DynamiteLoaderClassLoader;
import com.google.android.gms.dynamite.DynamiteModule$LoadingException;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import pg.p;
import sg.w;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public static final i8 f17892b;

    /* renamed from: c, reason: collision with root package name */
    public static final lm.e f17893c;

    /* renamed from: d, reason: collision with root package name */
    public static final i8 f17894d;

    /* renamed from: e, reason: collision with root package name */
    public static final lm.e f17895e;

    /* renamed from: f, reason: collision with root package name */
    public static Boolean f17896f = null;

    /* renamed from: g, reason: collision with root package name */
    public static String f17897g = null;

    /* renamed from: h, reason: collision with root package name */
    public static boolean f17898h = false;

    /* renamed from: i, reason: collision with root package name */
    public static int f17899i = -1;

    /* renamed from: j, reason: collision with root package name */
    public static Boolean f17900j;

    /* renamed from: k, reason: collision with root package name */
    public static final ThreadLocal f17901k = new ThreadLocal();

    /* renamed from: l, reason: collision with root package name */
    public static final i f17902l = new i(0);

    /* renamed from: m, reason: collision with root package name */
    public static final lm.e f17903m = new lm.e(13);
    public static l n;
    public static m o;

    /* renamed from: a, reason: collision with root package name */
    public final Context f17904a;

    static {
        int i5 = 14;
        f17892b = new i8(i5);
        f17893c = new lm.e(i5);
        int i11 = 15;
        f17894d = new i8(i11);
        f17895e = new lm.e(i11);
    }

    public e(Context context) {
        this.f17904a = context;
    }

    public static int a(Context context, String str) throws NoSuchFieldException, ClassNotFoundException {
        try {
            ClassLoader classLoader = context.getApplicationContext().getClassLoader();
            StringBuilder sb2 = new StringBuilder(str.length() + 61);
            sb2.append("com.google.android.gms.dynamite.descriptors.");
            sb2.append(str);
            sb2.append(".ModuleDescriptor");
            Class<?> clsLoadClass = classLoader.loadClass(sb2.toString());
            Field declaredField = clsLoadClass.getDeclaredField("MODULE_ID");
            Field declaredField2 = clsLoadClass.getDeclaredField("MODULE_VERSION");
            if (w.k(declaredField.get(null), str)) {
                return declaredField2.getInt(null);
            }
            String strValueOf = String.valueOf(declaredField.get(null));
            StringBuilder sb3 = new StringBuilder(strValueOf.length() + 50 + str.length() + 1);
            sb3.append("Module descriptor id '");
            sb3.append(strValueOf);
            sb3.append("' didn't match expected id '");
            sb3.append(str);
            sb3.append("'");
            Log.e("DynamiteModule", sb3.toString());
            return 0;
        } catch (ClassNotFoundException unused) {
            StringBuilder sb4 = new StringBuilder(str.length() + 45);
            sb4.append("Local module descriptor class for ");
            sb4.append(str);
            sb4.append(" not found.");
            Log.w("DynamiteModule", sb4.toString());
            return 0;
        } catch (Exception e3) {
            Log.e("DynamiteModule", "Failed to load module descriptor class: ".concat(String.valueOf(e3.getMessage())));
            return 0;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02eb A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:136:0x02f1 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:139:0x02fa A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00c3 A[Catch: all -> 0x00b8, TRY_LEAVE, TryCatch #9 {all -> 0x00b8, blocks: (B:5:0x0042, B:9:0x00b1, B:16:0x00bd, B:19:0x00c3, B:31:0x00ec, B:119:0x0286, B:120:0x0290, B:128:0x029f, B:130:0x02c7, B:132:0x02d7, B:142:0x0303, B:143:0x030a, B:123:0x0293, B:124:0x0294, B:125:0x029b, B:144:0x030b, B:145:0x032b, B:146:0x032c, B:147:0x0379), top: B:166:0x0042 }] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00e9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static e c(Context context, d dVar, String str) throws DynamiteModule$LoadingException {
        Context context2;
        int i5;
        e eVar;
        int i11;
        Context context3;
        ah.b bVarV;
        m mVar;
        boolean z11;
        ah.b bVarV2;
        Context applicationContext = context.getApplicationContext();
        if (applicationContext == null) {
            throw new DynamiteModule$LoadingException("null application Context");
        }
        ThreadLocal threadLocal = f17901k;
        j jVar = (j) threadLocal.get();
        j jVar2 = new j();
        threadLocal.set(jVar2);
        i iVar = f17902l;
        Long l9 = (Long) iVar.get();
        long jLongValue = l9.longValue();
        try {
            iVar.set(Long.valueOf(SystemClock.uptimeMillis()));
            c cVarA = dVar.a(context, str, f17903m);
            int i12 = cVarA.f17889a;
            int i13 = cVarA.f17890b;
            StringBuilder sb2 = new StringBuilder(str.length() + 26 + String.valueOf(i12).length() + 19 + str.length() + 1 + String.valueOf(i13).length());
            sb2.append("Considering local module ");
            sb2.append(str);
            sb2.append(":");
            sb2.append(i12);
            sb2.append(" and remote module ");
            sb2.append(str);
            sb2.append(":");
            sb2.append(i13);
            Log.i("DynamiteModule", sb2.toString());
            int i14 = cVarA.f17891c;
            if (i14 != 0) {
                if (i14 != -1) {
                    if (i14 == 1 || cVarA.f17890b != 0) {
                        if (i14 != -1) {
                            Log.i("DynamiteModule", "Selected local version of ".concat(str));
                            e eVar2 = new e(applicationContext);
                            if (jLongValue == 0) {
                                iVar.remove();
                            } else {
                                iVar.set(l9);
                            }
                            Cursor cursor = jVar2.f17908a;
                            if (cursor != null) {
                                cursor.close();
                            }
                            threadLocal.set(jVar);
                            return eVar2;
                        }
                        if (i14 != 1) {
                            StringBuilder sb3 = new StringBuilder(String.valueOf(i14).length() + 36);
                            sb3.append("VersionPolicy returned invalid code:");
                            sb3.append(i14);
                            throw new DynamiteModule$LoadingException(sb3.toString());
                        }
                        try {
                            try {
                                i11 = cVarA.f17890b;
                            } catch (DynamiteModule$LoadingException e3) {
                                e = e3;
                                context2 = context;
                                String message = e.getMessage();
                                StringBuilder sb4 = new StringBuilder(String.valueOf(message).length() + 30);
                                sb4.append("Failed to load remote module: ");
                                sb4.append(message);
                                Log.w("DynamiteModule", sb4.toString());
                                i5 = cVarA.f17889a;
                                if (i5 != 0 || dVar.a(context2, str, new k(i5, false)).f17891c != -1) {
                                    throw new DynamiteModule$LoadingException("Remote load failed. No local fallback found.", e);
                                }
                                Log.i("DynamiteModule", "Selected local version of ".concat(str));
                                eVar = new e(applicationContext);
                                return eVar;
                            }
                        } catch (DynamiteModule$LoadingException e11) {
                            e = e11;
                            context2 = i12;
                            String message2 = e.getMessage();
                            StringBuilder sb42 = new StringBuilder(String.valueOf(message2).length() + 30);
                            sb42.append("Failed to load remote module: ");
                            sb42.append(message2);
                            Log.w("DynamiteModule", sb42.toString());
                            i5 = cVarA.f17889a;
                            if (i5 != 0) {
                            }
                            throw new DynamiteModule$LoadingException("Remote load failed. No local fallback found.", e);
                        }
                        try {
                            try {
                                try {
                                    synchronized (e.class) {
                                        try {
                                            if (!e(context)) {
                                                throw new DynamiteModule$LoadingException("Remote loading disabled");
                                            }
                                            Boolean bool = f17896f;
                                            if (bool == null) {
                                                throw new DynamiteModule$LoadingException("Failed to determine which loading route to use.");
                                            }
                                            if (bool.booleanValue()) {
                                                StringBuilder sb5 = new StringBuilder(str.length() + 40 + String.valueOf(i11).length());
                                                sb5.append("Selected remote version of ");
                                                sb5.append(str);
                                                sb5.append(", version >= ");
                                                sb5.append(i11);
                                                Log.i("DynamiteModule", sb5.toString());
                                                synchronized (e.class) {
                                                    mVar = o;
                                                }
                                                if (mVar == null) {
                                                    throw new DynamiteModule$LoadingException("DynamiteLoaderV2 was not cached.");
                                                }
                                                j jVar3 = (j) threadLocal.get();
                                                if (jVar3 == null || jVar3.f17908a == null) {
                                                    throw new DynamiteModule$LoadingException("No result cursor");
                                                }
                                                Context applicationContext2 = context.getApplicationContext();
                                                Cursor cursor2 = jVar3.f17908a;
                                                new ah.d(null);
                                                synchronized (e.class) {
                                                    z11 = f17899i >= 2;
                                                }
                                                if (z11) {
                                                    bVarV2 = mVar.W(new ah.d(applicationContext2), str, i11, new ah.d(cursor2));
                                                } else {
                                                    Log.w("DynamiteModule", "Dynamite loader version < 2, falling back to loadModule2");
                                                    bVarV2 = mVar.V(new ah.d(applicationContext2), str, i11, new ah.d(cursor2));
                                                }
                                                Context context4 = (Context) ah.d.V(bVarV2);
                                                if (context4 == null) {
                                                    throw new DynamiteModule$LoadingException("Failed to get module context");
                                                }
                                                eVar = new e(context4);
                                            } else {
                                                StringBuilder sb6 = new StringBuilder(str.length() + 40 + String.valueOf(i11).length());
                                                sb6.append("Selected remote version of ");
                                                sb6.append(str);
                                                sb6.append(", version >= ");
                                                sb6.append(i11);
                                                Log.i("DynamiteModule", sb6.toString());
                                                l lVarH = h(context);
                                                if (lVarH == null) {
                                                    throw new DynamiteModule$LoadingException("Failed to create IDynamiteLoader.");
                                                }
                                                int iZ = lVarH.Z();
                                                if (iZ >= 3) {
                                                    j jVar4 = (j) threadLocal.get();
                                                    if (jVar4 == null) {
                                                        throw new DynamiteModule$LoadingException("No cached result cursor holder");
                                                    }
                                                    bVarV = lVarH.b0(new ah.d(context), str, i11, new ah.d(jVar4.f17908a));
                                                } else if (iZ == 2) {
                                                    Log.w("DynamiteModule", "IDynamite loader version = 2");
                                                    bVarV = lVarH.X(new ah.d(context), str, i11);
                                                } else {
                                                    Log.w("DynamiteModule", "Dynamite loader version < 2, falling back to createModuleContext");
                                                    bVarV = lVarH.V(new ah.d(context), str, i11);
                                                }
                                                Object objV = ah.d.V(bVarV);
                                                if (objV == null) {
                                                    throw new DynamiteModule$LoadingException("Failed to load remote module.");
                                                }
                                                eVar = new e((Context) objV);
                                            }
                                            return eVar;
                                        } catch (Throwable th2) {
                                            th = th2;
                                            throw th;
                                        }
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                }
                            } catch (RemoteException e12) {
                                e = e12;
                                throw new DynamiteModule$LoadingException("Failed to load remote module.", e);
                            } catch (DynamiteModule$LoadingException e13) {
                                throw e13;
                            } catch (Throwable th4) {
                                th = th4;
                                context3 = i12;
                                p.g(context3, th);
                                throw new DynamiteModule$LoadingException("Failed to load remote module.", th);
                            }
                        } catch (RemoteException e14) {
                            e = e14;
                            throw new DynamiteModule$LoadingException("Failed to load remote module.", e);
                        } catch (DynamiteModule$LoadingException e15) {
                            throw e15;
                        } catch (Throwable th5) {
                            th = th5;
                            context3 = context;
                            p.g(context3, th);
                            throw new DynamiteModule$LoadingException("Failed to load remote module.", th);
                        }
                    }
                } else if (cVarA.f17889a != 0) {
                    i14 = -1;
                    if (i14 == 1) {
                    }
                    if (i14 != -1) {
                    }
                }
            }
            int i15 = cVarA.f17889a;
            int i16 = cVarA.f17890b;
            StringBuilder sb7 = new StringBuilder(str.length() + 46 + String.valueOf(i15).length() + 23 + String.valueOf(i16).length() + 1);
            sb7.append("No acceptable module ");
            sb7.append(str);
            sb7.append(" found. Local version is ");
            sb7.append(i15);
            sb7.append(" and remote version is ");
            sb7.append(i16);
            sb7.append(".");
            throw new DynamiteModule$LoadingException(sb7.toString());
        } finally {
            if (jLongValue == 0) {
                f17902l.remove();
            } else {
                f17902l.set(l9);
            }
            Cursor cursor3 = jVar2.f17908a;
            if (cursor3 != null) {
                cursor3.close();
            }
            f17901k.set(jVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0185  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0188 A[Catch: all -> 0x00f4, TRY_ENTER, TRY_LEAVE, TryCatch #8 {all -> 0x00f4, blocks: (B:4:0x0006, B:64:0x00e9, B:66:0x00ef, B:74:0x011d, B:104:0x0188, B:112:0x019d, B:130:0x01fc, B:131:0x01ff, B:125:0x01f3, B:72:0x00fa, B:133:0x0201, B:5:0x0007, B:8:0x000e, B:9:0x002a, B:62:0x00e6, B:22:0x004e, B:45:0x00a5, B:48:0x00a8, B:55:0x00c0, B:63:0x00e8, B:61:0x00c6), top: B:143:0x0006, inners: #5, #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:112:0x019d A[Catch: all -> 0x00f4, TRY_ENTER, TRY_LEAVE, TryCatch #8 {all -> 0x00f4, blocks: (B:4:0x0006, B:64:0x00e9, B:66:0x00ef, B:74:0x011d, B:104:0x0188, B:112:0x019d, B:130:0x01fc, B:131:0x01ff, B:125:0x01f3, B:72:0x00fa, B:133:0x0201, B:5:0x0007, B:8:0x000e, B:9:0x002a, B:62:0x00e6, B:22:0x004e, B:45:0x00a5, B:48:0x00a8, B:55:0x00c0, B:63:0x00e8, B:61:0x00c6), top: B:143:0x0006, inners: #5, #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00b4 A[Catch: all -> 0x003b, TryCatch #11 {, blocks: (B:10:0x002b, B:12:0x0037, B:52:0x00bd, B:17:0x0040, B:19:0x0047, B:21:0x004d, B:26:0x0054, B:28:0x0058, B:31:0x0061, B:33:0x0069, B:36:0x0070, B:43:0x009c, B:44:0x00a4, B:39:0x0077, B:41:0x007d, B:42:0x008e, B:47:0x00a7, B:50:0x00aa, B:51:0x00b4, B:18:0x0043), top: B:147:0x002b, inners: #12 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int d(Context context, String str, boolean z11) {
        Field declaredField;
        Throwable th2;
        RemoteException remoteException;
        Cursor cursor;
        try {
            synchronized (e.class) {
                Boolean bool = f17896f;
                boolean z12 = true;
                Cursor cursor2 = null;
                int iW = 0;
                if (bool == null) {
                    try {
                        declaredField = context.getApplicationContext().getClassLoader().loadClass(DynamiteModule$DynamiteLoaderClassLoader.class.getName()).getDeclaredField("sClassLoader");
                    } catch (ClassNotFoundException | IllegalAccessException | NoSuchFieldException e3) {
                        String string = e3.toString();
                        StringBuilder sb2 = new StringBuilder(string.length() + 30);
                        sb2.append("Failed to load module via V2: ");
                        sb2.append(string);
                        Log.w("DynamiteModule", sb2.toString());
                        bool = Boolean.FALSE;
                    }
                    synchronized (declaredField.getDeclaringClass()) {
                        ClassLoader classLoader = (ClassLoader) declaredField.get(null);
                        if (classLoader == ClassLoader.getSystemClassLoader()) {
                            bool = Boolean.FALSE;
                        } else if (classLoader != null) {
                            try {
                                g(classLoader);
                            } catch (DynamiteModule$LoadingException unused) {
                            }
                            bool = Boolean.TRUE;
                        } else {
                            if (!e(context)) {
                                return 0;
                            }
                            if (!f17898h) {
                                Boolean bool2 = Boolean.TRUE;
                                if (bool2.equals(null)) {
                                    declaredField.set(null, ClassLoader.getSystemClassLoader());
                                    bool = Boolean.FALSE;
                                } else {
                                    try {
                                        int iF = f(context, str, z11, true);
                                        String str2 = f17897g;
                                        if (str2 != null && !str2.isEmpty()) {
                                            ClassLoader classLoaderN0 = g.n0();
                                            if (classLoaderN0 == null) {
                                                if (Build.VERSION.SDK_INT >= 29) {
                                                    a.i();
                                                    String str3 = f17897g;
                                                    w.h(str3);
                                                    classLoaderN0 = a.f(ClassLoader.getSystemClassLoader(), str3);
                                                } else {
                                                    String str4 = f17897g;
                                                    w.h(str4);
                                                    classLoaderN0 = new h(ClassLoader.getSystemClassLoader(), str4);
                                                }
                                            }
                                            g(classLoaderN0);
                                            declaredField.set(null, classLoaderN0);
                                            f17896f = bool2;
                                            return iF;
                                        }
                                        return iF;
                                    } catch (DynamiteModule$LoadingException unused2) {
                                        declaredField.set(null, ClassLoader.getSystemClassLoader());
                                        bool = Boolean.FALSE;
                                    }
                                }
                            }
                        }
                        f17896f = bool;
                    }
                }
                if (bool.booleanValue()) {
                    try {
                        return f(context, str, z11, false);
                    } catch (DynamiteModule$LoadingException e11) {
                        String message = e11.getMessage();
                        StringBuilder sb3 = new StringBuilder(String.valueOf(message).length() + 42);
                        sb3.append("Failed to retrieve remote module version: ");
                        sb3.append(message);
                        Log.w("DynamiteModule", sb3.toString());
                        return 0;
                    }
                }
                l lVarH = h(context);
                if (lVarH != null) {
                    try {
                        try {
                            int iZ = lVarH.Z();
                            if (iZ >= 3) {
                                ThreadLocal threadLocal = f17901k;
                                j jVar = (j) threadLocal.get();
                                if (jVar == null || (cursor = jVar.f17908a) == null) {
                                    Cursor cursor3 = (Cursor) ah.d.V(lVarH.a0(new ah.d(context), str, z11, ((Long) f17902l.get()).longValue()));
                                    if (cursor3 != null) {
                                        try {
                                            if (cursor3.moveToFirst()) {
                                                int i5 = cursor3.getInt(0);
                                                if (i5 <= 0) {
                                                    cursor2 = cursor3;
                                                    if (cursor2 != null) {
                                                        cursor2.close();
                                                    }
                                                    iW = i5;
                                                } else {
                                                    j jVar2 = (j) threadLocal.get();
                                                    if (jVar2 == null || jVar2.f17908a != null) {
                                                        z12 = false;
                                                    } else {
                                                        jVar2.f17908a = cursor3;
                                                    }
                                                    if (!z12) {
                                                    }
                                                    if (cursor2 != null) {
                                                    }
                                                    iW = i5;
                                                }
                                            } else {
                                                Log.w("DynamiteModule", "Failed to retrieve remote module version.");
                                                if (cursor3 != null) {
                                                    cursor3.close();
                                                }
                                            }
                                        } catch (RemoteException e12) {
                                            remoteException = e12;
                                            cursor2 = cursor3;
                                            String message2 = remoteException.getMessage();
                                            StringBuilder sb4 = new StringBuilder(String.valueOf(message2).length() + 42);
                                            sb4.append("Failed to retrieve remote module version: ");
                                            sb4.append(message2);
                                            Log.w("DynamiteModule", sb4.toString());
                                            if (cursor2 != null) {
                                                cursor2.close();
                                            }
                                            return iW;
                                        } catch (Throwable th3) {
                                            th2 = th3;
                                            cursor2 = cursor3;
                                            if (cursor2 == null) {
                                                throw th2;
                                            }
                                            cursor2.close();
                                            throw th2;
                                        }
                                    } else {
                                        Log.w("DynamiteModule", "Failed to retrieve remote module version.");
                                        if (cursor3 != null) {
                                        }
                                    }
                                } else {
                                    iW = cursor.getInt(0);
                                }
                            } else if (iZ == 2) {
                                Log.w("DynamiteModule", "IDynamite loader version = 2, no high precision latency measurement.");
                                iW = lVarH.Y(new ah.d(context), str, z11);
                            } else {
                                Log.w("DynamiteModule", "IDynamite loader version < 2, falling back to getModuleVersion2");
                                iW = lVarH.W(new ah.d(context), str, z11);
                            }
                        } catch (RemoteException e13) {
                            remoteException = e13;
                        }
                    } catch (Throwable th4) {
                        th2 = th4;
                    }
                }
                return iW;
            }
        } catch (Throwable th5) {
            p.g(context, th5);
            throw th5;
        }
    }

    public static boolean e(Context context) {
        ApplicationInfo applicationInfo;
        Boolean bool = Boolean.TRUE;
        if (bool.equals(null) || bool.equals(f17900j)) {
            return true;
        }
        boolean z11 = false;
        if (f17900j == null) {
            ProviderInfo providerInfoResolveContentProvider = context.getPackageManager().resolveContentProvider("com.google.android.gms.chimera", Build.VERSION.SDK_INT >= 29 ? 268435456 : 0);
            if (pg.c.f82562b.b(context, 10000000) == 0 && providerInfoResolveContentProvider != null && "com.google.android.gms".equals(providerInfoResolveContentProvider.packageName)) {
                z11 = true;
            }
            f17900j = Boolean.valueOf(z11);
            if (z11 && (applicationInfo = providerInfoResolveContentProvider.applicationInfo) != null && (applicationInfo.flags & Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE) == 0) {
                Log.i("DynamiteModule", "Non-system-image GmsCore APK, forcing V1");
                f17898h = true;
            }
        }
        if (!z11) {
            Log.e("DynamiteModule", "Invalid GmsCore APK, remote loading disabled.");
        }
        return z11;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:124:0x00e7 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x013a A[PHI: r3
      0x013a: PHI (r3v4 boolean) = (r3v3 boolean), (r3v6 boolean) binds: [B:58:0x00f1, B:83:0x0137] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int f(Context context, String str, boolean z11, boolean z12) throws Throwable {
        Exception exc;
        Throwable th2;
        Cursor cursorQuery;
        MatrixCursor matrixCursor;
        boolean z13;
        try {
            try {
                boolean z14 = true;
                Uri uriBuild = new Uri.Builder().scheme("content").authority("com.google.android.gms.chimera").path(true != z11 ? "api" : "api_force_staging").appendPath(str).appendQueryParameter("requestStartUptime", String.valueOf(((Long) f17902l.get()).longValue())).build();
                ContentProviderClient contentProviderClientAcquireUnstableContentProviderClient = context.getContentResolver().acquireUnstableContentProviderClient(uriBuild);
                boolean z15 = false;
                if (contentProviderClientAcquireUnstableContentProviderClient != null) {
                    try {
                        cursorQuery = contentProviderClientAcquireUnstableContentProviderClient.query(uriBuild, null, null, null, null);
                    } catch (RemoteException unused) {
                    } catch (Throwable th3) {
                        contentProviderClientAcquireUnstableContentProviderClient.release();
                        throw th3;
                    }
                    if (cursorQuery != null) {
                        try {
                            int count = cursorQuery.getCount();
                            int columnCount = cursorQuery.getColumnCount();
                            matrixCursor = new MatrixCursor(cursorQuery.getColumnNames(), count);
                            for (int i5 = 0; i5 < count; i5++) {
                                if (!cursorQuery.moveToPosition(i5)) {
                                    throw new RemoteException("Cursor read incomplete (ContentProvider dead?)");
                                }
                                Object[] objArr = new Object[columnCount];
                                for (int i11 = 0; i11 < columnCount; i11++) {
                                    int type = cursorQuery.getType(i11);
                                    if (type == 0) {
                                        objArr[i11] = null;
                                    } else if (type == 1) {
                                        objArr[i11] = Long.valueOf(cursorQuery.getLong(i11));
                                    } else if (type == 2) {
                                        objArr[i11] = Double.valueOf(cursorQuery.getDouble(i11));
                                    } else if (type == 3) {
                                        objArr[i11] = cursorQuery.getString(i11);
                                    } else {
                                        if (type != 4) {
                                            throw new RemoteException("Unknown column type");
                                        }
                                        objArr[i11] = cursorQuery.getBlob(i11);
                                    }
                                }
                                matrixCursor.addRow(objArr);
                            }
                            cursorQuery.close();
                            contentProviderClientAcquireUnstableContentProviderClient.release();
                            if (matrixCursor != null) {
                                try {
                                    if (matrixCursor.moveToFirst()) {
                                        int i12 = matrixCursor.getInt(0);
                                        if (i12 > 0) {
                                            synchronized (e.class) {
                                                try {
                                                    f17897g = matrixCursor.getString(2);
                                                    int columnIndex = matrixCursor.getColumnIndex("loaderVersion");
                                                    if (columnIndex >= 0) {
                                                        f17899i = matrixCursor.getInt(columnIndex);
                                                    }
                                                    int columnIndex2 = matrixCursor.getColumnIndex("disableStandaloneDynamiteLoader2");
                                                    if (columnIndex2 >= 0) {
                                                        z13 = matrixCursor.getInt(columnIndex2) != 0;
                                                        f17898h = z13;
                                                    } else {
                                                        z13 = false;
                                                    }
                                                } finally {
                                                }
                                            }
                                            j jVar = (j) f17901k.get();
                                            if (jVar == null || jVar.f17908a != null) {
                                                z14 = false;
                                            } else {
                                                jVar.f17908a = matrixCursor;
                                            }
                                            z15 = z13;
                                            matrixCursor = z14 ? null : matrixCursor;
                                        }
                                        if (z12 && z15) {
                                            throw new DynamiteModule$LoadingException("forcing fallback to container DynamiteLoader impl");
                                        }
                                        if (matrixCursor != null) {
                                            matrixCursor.close();
                                        }
                                        return i12;
                                    }
                                } catch (Exception e3) {
                                    exc = e3;
                                    if (exc instanceof DynamiteModule$LoadingException) {
                                        throw exc;
                                    }
                                    String message = exc.getMessage();
                                    StringBuilder sb2 = new StringBuilder(String.valueOf(message).length() + 25);
                                    sb2.append("V2 version check failed: ");
                                    sb2.append(message);
                                    throw new DynamiteModule$LoadingException(sb2.toString(), exc);
                                } catch (Throwable th4) {
                                    th2 = th4;
                                    matrixCursor = matrixCursor;
                                    if (matrixCursor == null) {
                                        throw th2;
                                    }
                                    matrixCursor.close();
                                    throw th2;
                                }
                            }
                            Log.w("DynamiteModule", "Failed to retrieve remote module version.");
                            throw new DynamiteModule$LoadingException("Failed to connect to dynamite module ContentResolver.");
                        } catch (Throwable th5) {
                            try {
                                cursorQuery.close();
                                throw th5;
                            } catch (Throwable th6) {
                                th5.addSuppressed(th6);
                                throw th5;
                            }
                        }
                    }
                    contentProviderClientAcquireUnstableContentProviderClient.release();
                }
                matrixCursor = null;
                if (matrixCursor != null) {
                }
                Log.w("DynamiteModule", "Failed to retrieve remote module version.");
                throw new DynamiteModule$LoadingException("Failed to connect to dynamite module ContentResolver.");
            } catch (Throwable th7) {
                th2 = th7;
            }
        } catch (Exception e11) {
            exc = e11;
        }
    }

    public static void g(ClassLoader classLoader) throws DynamiteModule$LoadingException {
        try {
            m mVar = null;
            IBinder iBinder = (IBinder) classLoader.loadClass("com.google.android.gms.dynamiteloader.DynamiteLoaderV2").getConstructor(null).newInstance(null);
            if (iBinder != null) {
                IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamite.IDynamiteLoaderV2");
                mVar = iInterfaceQueryLocalInterface instanceof m ? (m) iInterfaceQueryLocalInterface : new m(iBinder, "com.google.android.gms.dynamite.IDynamiteLoaderV2", 0);
            }
            o = mVar;
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e3) {
            throw new DynamiteModule$LoadingException("Failed to instantiate dynamite loader", e3);
        }
    }

    public static l h(Context context) {
        l lVar;
        synchronized (e.class) {
            l lVar2 = n;
            if (lVar2 != null) {
                return lVar2;
            }
            try {
                IBinder iBinder = (IBinder) context.createPackageContext("com.google.android.gms", 3).getClassLoader().loadClass("com.google.android.gms.chimera.container.DynamiteLoaderImpl").newInstance();
                if (iBinder == null) {
                    lVar = null;
                } else {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamite.IDynamiteLoader");
                    lVar = iInterfaceQueryLocalInterface instanceof l ? (l) iInterfaceQueryLocalInterface : new l(iBinder);
                }
                if (lVar != null) {
                    n = lVar;
                    return lVar;
                }
            } catch (Exception e3) {
                String message = e3.getMessage();
                StringBuilder sb2 = new StringBuilder(String.valueOf(message).length() + 45);
                sb2.append("Failed to load IDynamiteLoader from GmsCore: ");
                sb2.append(message);
                Log.e("DynamiteModule", sb2.toString());
            }
            return null;
        }
    }

    public final IBinder b(String str) throws DynamiteModule$LoadingException {
        try {
            return (IBinder) this.f17904a.getClassLoader().loadClass(str).newInstance();
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e3) {
            throw new DynamiteModule$LoadingException("Failed to instantiate module class: ".concat(str), e3);
        }
    }
}
