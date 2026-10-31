package com.vungle.ads.internal.util;

import android.webkit.URLUtil;
import com.vungle.ads.AssetFailedToDeleteError;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes4.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static m f47696a = new o40.b(0);

    /* renamed from: b, reason: collision with root package name */
    public static final List f47697b = ul.b.Q(LinkedHashSet.class, HashSet.class, HashMap.class, ArrayList.class, File.class);

    public static final ObjectInputStream a(InputStream inputStream) {
        return new x(inputStream, f47697b);
    }

    public static final void b(File file) throws IOException {
        Intrinsics.g(file, "file");
        try {
            Files.delete(file.toPath());
        } catch (Exception e3) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to delete ");
            sbA.append(file.getName());
            sbA.append(" with error :");
            sbA.append(e3.getMessage());
            new AssetFailedToDeleteError(sbA.toString()).logErrorNoReturnValue$vungle_ads_release();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Not initialized variable reg: 6, insn: 0x002c: MOVE (r5 I:??[OBJECT, ARRAY]) = (r6 I:??[OBJECT, ARRAY]), block:B:11:0x002c */
    /* JADX WARN: Type inference failed for: r4v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v10, types: [java.io.Closeable, java.io.FileInputStream, java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r6v11, types: [com.vungle.ads.internal.util.m] */
    public static final Object c(File file) throws Throwable {
        Closeable closeable;
        Closeable closeable2;
        ObjectInputStream objectInputStreamA;
        Closeable closeable3;
        Intrinsics.g(file, "file");
        ?? Exists = file.exists();
        Closeable closeable4 = null;
        try {
            if (Exists == 0) {
                return null;
            }
            try {
                Exists = new FileInputStream(file);
            } catch (IOException e3) {
                e = e3;
                Exists = 0;
                objectInputStreamA = null;
            } catch (ClassNotFoundException e11) {
                e = e11;
                Exists = 0;
                objectInputStreamA = null;
            } catch (Exception e12) {
                e = e12;
                Exists = 0;
                objectInputStreamA = null;
            } catch (Throwable th2) {
                th = th2;
                closeable2 = null;
                a(closeable2);
                a(closeable4);
                throw th;
            }
            try {
                objectInputStreamA = f47696a.a(Exists);
                try {
                    Object object = objectInputStreamA.readObject();
                    a((Closeable) objectInputStreamA);
                    a((Closeable) Exists);
                    return object;
                } catch (IOException e13) {
                    e = e13;
                    boolean z11 = u.f47714a;
                    t.b("FileUtility", "IOException: " + e.getMessage());
                    closeable3 = Exists;
                    a((Closeable) objectInputStreamA);
                    a(closeable3);
                    try {
                        a(file, (Set) null);
                    } catch (IOException unused) {
                    }
                    return null;
                } catch (ClassNotFoundException e14) {
                    e = e14;
                    boolean z12 = u.f47714a;
                    t.b("FileUtility", "ClassNotFoundException: " + e.getMessage());
                    closeable3 = Exists;
                    a((Closeable) objectInputStreamA);
                    a(closeable3);
                    a(file, (Set) null);
                    return null;
                } catch (Exception e15) {
                    e = e15;
                    boolean z13 = u.f47714a;
                    t.b("FileUtility", "cannot read serializable " + e.getMessage());
                    closeable3 = Exists;
                    a((Closeable) objectInputStreamA);
                    a(closeable3);
                    a(file, (Set) null);
                    return null;
                }
            } catch (IOException e16) {
                e = e16;
                objectInputStreamA = null;
            } catch (ClassNotFoundException e17) {
                e = e17;
                objectInputStreamA = null;
            } catch (Exception e18) {
                e = e18;
                objectInputStreamA = null;
            } catch (Throwable th3) {
                th = th3;
                closeable2 = closeable4;
                closeable4 = Exists;
                a(closeable2);
                a(closeable4);
                throw th;
            }
        } catch (Throwable th4) {
            th = th4;
            closeable4 = closeable;
        }
    }

    public static String d(File file) {
        Intrinsics.g(file, "file");
        if (!file.exists()) {
            return null;
        }
        try {
            return FilesKt.t0(file, Charsets.f72000b);
        } catch (IOException e3) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("IOException: ");
            sbA.append(e3.getMessage());
            t.b("FileUtility", sbA.toString());
            return null;
        } catch (Exception e11) {
            boolean z12 = u.f47714a;
            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("cannot read string ");
            sbA2.append(e11.getMessage());
            t.b("FileUtility", sbA2.toString());
            return null;
        }
    }

    public static /* synthetic */ void a(File file) {
        a(file, (Set) null);
    }

    public static final void a(File file, Set set) {
        if (file != null) {
            try {
                if (file.exists()) {
                    if (file.isDirectory()) {
                        if (set != null && set.contains(file.getName())) {
                            boolean z11 = u.f47714a;
                            t.a("FileUtility", "Skipping deletion of directory: " + file.getName());
                            return;
                        }
                        File[] fileArrListFiles = file.listFiles();
                        if (fileArrListFiles != null) {
                            for (File file2 : fileArrListFiles) {
                                a(file2, set);
                            }
                        }
                    }
                    if (set != null && set.contains(file.getName())) {
                        boolean z12 = u.f47714a;
                        t.a("FileUtility", "Skipping deletion of file: " + file.getName());
                        return;
                    }
                    if (file.delete()) {
                        return;
                    }
                    boolean z13 = u.f47714a;
                    t.a("FileUtility", "Failed to delete file: " + file);
                }
            } catch (Exception e3) {
                boolean z14 = u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to delete file: ");
                sbA.append(e3.getLocalizedMessage());
                t.b("FileUtility", sbA.toString());
            }
        }
    }

    public static void a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException unused) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v13, types: [java.io.ObjectOutputStream] */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    public static final void a(File file, Serializable serializable) throws Throwable {
        Throwable th2;
        ?? objectOutputStream;
        IOException e3;
        FileOutputStream fileOutputStream;
        Closeable closeable;
        Intrinsics.g(file, "file");
        if (file.exists()) {
            b(file);
        }
        if (serializable == null) {
            return;
        }
        FileOutputStream fileOutputStream2 = null;
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (IOException e11) {
            e3 = e11;
            objectOutputStream = 0;
        } catch (Throwable th3) {
            th2 = th3;
            objectOutputStream = 0;
            fileOutputStream = fileOutputStream2;
            fileOutputStream2 = objectOutputStream;
            a(fileOutputStream2);
            a(fileOutputStream);
            throw th2;
        }
        try {
            objectOutputStream = new ObjectOutputStream(fileOutputStream);
            try {
                objectOutputStream.writeObject(serializable);
                objectOutputStream.reset();
                closeable = objectOutputStream;
            } catch (IOException e12) {
                e3 = e12;
                fileOutputStream2 = fileOutputStream;
                objectOutputStream = objectOutputStream;
                try {
                    boolean z11 = u.f47714a;
                    t.b("FileUtility", String.valueOf(e3.getMessage()));
                    fileOutputStream = fileOutputStream2;
                    closeable = objectOutputStream;
                    a(closeable);
                    a(fileOutputStream);
                } catch (Throwable th4) {
                    th2 = th4;
                    fileOutputStream = fileOutputStream2;
                    fileOutputStream2 = objectOutputStream;
                    a(fileOutputStream2);
                    a(fileOutputStream);
                    throw th2;
                }
            } catch (Throwable th5) {
                th2 = th5;
                fileOutputStream2 = objectOutputStream;
                a(fileOutputStream2);
                a(fileOutputStream);
                throw th2;
            }
        } catch (IOException e13) {
            e3 = e13;
            objectOutputStream = 0;
        } catch (Throwable th6) {
            th2 = th6;
            a(fileOutputStream2);
            a(fileOutputStream);
            throw th2;
        }
        a(closeable);
        a(fileOutputStream);
    }

    public static void a(File file, String str) {
        Intrinsics.g(file, "file");
        if (str == null) {
            return;
        }
        try {
            FilesKt.w0(file, str, Charsets.f72000b);
        } catch (IOException e3) {
            boolean z11 = u.f47714a;
            t.b("FileUtility", String.valueOf(e3.getMessage()));
        }
    }

    public static boolean a(String str) {
        if (str == null) {
            return false;
        }
        try {
            if (r70.k.U0(str)) {
                return false;
            }
            x80.w wVarB = null;
            try {
                x80.v vVar = new x80.v();
                vVar.e(null, str);
                wVarB = vVar.b();
            } catch (IllegalArgumentException unused) {
            }
            return wVarB != null;
        } catch (Throwable unused2) {
            return false;
        }
    }

    public static String a(String url, String str) {
        Intrinsics.g(url, "url");
        String strGuessFileName = URLUtil.guessFileName(url, null, str);
        Intrinsics.f(strGuessFileName, "guessFileName(url, null, ext)");
        return strGuessFileName;
    }
}
