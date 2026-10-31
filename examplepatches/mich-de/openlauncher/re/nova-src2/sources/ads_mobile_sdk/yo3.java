package ads_mobile_sdk;

import android.content.Context;
import android.os.Bundle;
import b.ed;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.HashMap;

/* loaded from: classes2.dex */
public final class yo3 {

    /* renamed from: h, reason: collision with root package name */
    public static final HashMap f12229h = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final Context f12230a;

    /* renamed from: b, reason: collision with root package name */
    public final wi0 f12231b;

    /* renamed from: c, reason: collision with root package name */
    public final v6 f12232c;

    /* renamed from: d, reason: collision with root package name */
    public final uo3 f12233d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f12234e;

    /* renamed from: f, reason: collision with root package name */
    public ai.y0 f12235f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f12236g = new Object();

    public yo3(Context context, wi0 wi0Var, v6 v6Var, uo3 uo3Var, boolean z11) {
        this.f12230a = context;
        this.f12231b = wi0Var;
        this.f12232c = v6Var;
        this.f12233d = uo3Var;
        this.f12234e = z11;
    }

    public final ai.y0 a() {
        ai.y0 y0Var;
        synchronized (this.f12236g) {
            y0Var = this.f12235f;
        }
        return y0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00a2 A[Catch: Exception -> 0x012d, TryCatch #1 {Exception -> 0x012d, blocks: (B:27:0x005c, B:29:0x0078, B:32:0x0087, B:41:0x009a, B:37:0x0091, B:38:0x0094, B:40:0x0096, B:42:0x009c, B:46:0x00a8, B:45:0x00a2), top: B:93:0x005c }] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x00c7 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ai.y0 a(fm2 fm2Var) throws Throwable {
        Class<?> clsLoadClass;
        FileInputStream fileInputStream;
        ai.y0 y0Var;
        boolean zBooleanValue;
        int iIntValue;
        Throwable th2;
        FileInputStream fileInputStream2;
        byte[] bArrC;
        synchronized (this) {
            try {
                sm2 sm2Var = fm2Var.f3431a;
                if (sm2Var != null) {
                    String strR = sm2Var.r();
                    HashMap map = f12229h;
                    clsLoadClass = (Class) map.get(strR);
                    fileInputStream = null;
                    if (clsLoadClass == null) {
                        try {
                            uo3 uo3Var = this.f12233d;
                            File file = fm2Var.f3432b;
                            uo3Var.getClass();
                            if (uo3.a(file)) {
                                try {
                                    File file2 = fm2Var.f3433c;
                                    if (!file2.exists()) {
                                        file2.mkdirs();
                                    }
                                    clsLoadClass = new DexClassLoader(fm2Var.f3432b.getAbsolutePath(), file2.getAbsolutePath(), null, this.f12230a.getClassLoader()).loadClass("com.google.ccc.abuse.droidguard.DroidGuard");
                                    map.put(strR, clsLoadClass);
                                } catch (ClassNotFoundException e3) {
                                    e = e3;
                                    throw new wo3(e, 2008);
                                } catch (IllegalArgumentException e11) {
                                    e = e11;
                                    throw new wo3(e, 2008);
                                } catch (SecurityException e12) {
                                    e = e12;
                                    throw new wo3(e, 2008);
                                }
                            } else {
                                throw new wo3("VM did not pass signature verification", 2026);
                            }
                        } catch (GeneralSecurityException e13) {
                            throw new wo3(e13, 2026);
                        }
                    }
                } else {
                    throw new wo3("mc", 4010);
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        try {
            Constructor<?> declaredConstructor = clsLoadClass.getDeclaredConstructor(Context.class, String.class, byte[].class, Object.class, Bundle.class, Integer.TYPE);
            Context context = this.f12230a;
            if (fm2Var.f3435e == null) {
                try {
                    fileInputStream2 = new FileInputStream(fm2Var.f3434d);
                } catch (IOException unused) {
                    fileInputStream2 = null;
                } catch (Throwable th4) {
                    th2 = th4;
                }
                try {
                    bArrC = sq.a(fileInputStream2).c();
                    ph.a.l(fileInputStream2);
                } catch (IOException unused2) {
                    ph.a.l(fileInputStream2);
                    bArrC = null;
                    fm2Var.f3435e = bArrC;
                    byte[] bArr = fm2Var.f3435e;
                    Object objNewInstance = declaredConstructor.newInstance(context, "msa-r", bArr != null ? null : Arrays.copyOf(bArr, bArr.length), null, new Bundle(), 2);
                    y0Var = new ai.y0(objNewInstance, this.f12231b, this.f12232c, this.f12234e);
                    synchronized (y0Var) {
                    }
                } catch (Throwable th5) {
                    th2 = th5;
                    fileInputStream = fileInputStream2;
                    ph.a.l(fileInputStream);
                    throw th2;
                }
                fm2Var.f3435e = bArrC;
            }
            byte[] bArr2 = fm2Var.f3435e;
            Object objNewInstance2 = declaredConstructor.newInstance(context, "msa-r", bArr2 != null ? null : Arrays.copyOf(bArr2, bArr2.length), null, new Bundle(), 2);
            y0Var = new ai.y0(objNewInstance2, this.f12231b, this.f12232c, this.f12234e);
            synchronized (y0Var) {
                try {
                    zBooleanValue = ((Boolean) objNewInstance2.getClass().getDeclaredMethod("init", null).invoke(objNewInstance2, null)).booleanValue();
                } catch (Exception e14) {
                    throw new wo3(e14, 2001);
                }
            }
            if (zBooleanValue) {
                synchronized (y0Var) {
                    try {
                        iIntValue = ((Integer) objNewInstance2.getClass().getDeclaredMethod("lcs", null).invoke(objNewInstance2, null)).intValue();
                    } catch (Exception e15) {
                        throw new wo3(e15, 2006);
                    }
                }
                if (iIntValue == 0) {
                    return y0Var;
                }
                throw new wo3(ed.i("ci: ", iIntValue), 4001);
            }
            throw new wo3("init failed", 4000);
        } catch (Exception e16) {
            throw new wo3(e16, 2004);
        }
    }

    public final void a(ai.y0 y0Var) {
        synchronized (this.f12236g) {
            ai.y0 y0Var2 = this.f12235f;
            if (y0Var2 != null) {
                try {
                    y0Var2.a();
                } catch (wo3 e3) {
                    this.f12232c.a(e3.f11353a, -1L, e3);
                }
                this.f12235f = y0Var;
            } else {
                this.f12235f = y0Var;
            }
        }
    }
}
