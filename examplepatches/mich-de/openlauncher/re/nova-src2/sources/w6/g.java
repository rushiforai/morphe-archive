package w6;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.AssetFileDescriptor;
import android.os.Build;
import d4.l;
import java.io.File;
import java.io.IOException;
import vf.u;

/* loaded from: classes2.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final l f93820a = new l();

    /* renamed from: b, reason: collision with root package name */
    public static final Object f93821b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static u f93822c = null;

    public static long a(Context context) {
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        return Build.VERSION.SDK_INT >= 33 ? e.a(packageManager, context).lastUpdateTime : packageManager.getPackageInfo(context.getPackageName(), 0).lastUpdateTime;
    }

    public static u b() {
        u uVar = new u();
        f93822c = uVar;
        f93820a.m(uVar);
        return f93822c;
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x00f6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:109:0x00a8 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void c(Context context, boolean z11) {
        int i5;
        boolean z12;
        int i11;
        long length;
        File file;
        f fVarA;
        f fVar;
        int i12;
        AssetFileDescriptor assetFileDescriptorOpenFd;
        if (z11 || f93822c == null) {
            synchronized (f93821b) {
                if (z11) {
                    i5 = 0;
                    assetFileDescriptorOpenFd = context.getAssets().openFd("dexopt/baseline.prof");
                    if (assetFileDescriptorOpenFd.getLength() <= 0) {
                    }
                    assetFileDescriptorOpenFd.close();
                    i11 = Build.VERSION.SDK_INT;
                    if (i11 >= 28) {
                        File file2 = new File(new File("/data/misc/profiles/ref/", context.getPackageName()), "primary.prof");
                        long length2 = file2.length();
                        if (file2.exists()) {
                            File file3 = new File(new File("/data/misc/profiles/cur/0/", context.getPackageName()), "primary.prof");
                            length = file3.length();
                            if (file3.exists()) {
                                long jA = a(context);
                                file = new File(context.getFilesDir(), "profileInstalled");
                                if (file.exists()) {
                                }
                                if (fVarA == null) {
                                    if (z12) {
                                    }
                                }
                                if (z11) {
                                    i5 = 2;
                                }
                                if (fVarA != null) {
                                    i5 = 3;
                                }
                                fVar = new f(jA, length, 1, i5);
                                if (fVarA != null) {
                                    fVar.b(file);
                                }
                                b();
                                return;
                            }
                        }
                    }
                    b();
                    return;
                }
                if (f93822c != null) {
                    return;
                }
                i5 = 0;
                try {
                    assetFileDescriptorOpenFd = context.getAssets().openFd("dexopt/baseline.prof");
                    try {
                        z12 = assetFileDescriptorOpenFd.getLength() <= 0;
                        assetFileDescriptorOpenFd.close();
                    } finally {
                    }
                } catch (IOException unused) {
                    z12 = false;
                }
                i11 = Build.VERSION.SDK_INT;
                if (i11 >= 28 && i11 != 30) {
                    File file22 = new File(new File("/data/misc/profiles/ref/", context.getPackageName()), "primary.prof");
                    long length22 = file22.length();
                    boolean z13 = !file22.exists() && length22 > 0;
                    File file32 = new File(new File("/data/misc/profiles/cur/0/", context.getPackageName()), "primary.prof");
                    length = file32.length();
                    boolean z14 = !file32.exists() && length > 0;
                    try {
                        long jA2 = a(context);
                        file = new File(context.getFilesDir(), "profileInstalled");
                        if (file.exists()) {
                            fVarA = null;
                        } else {
                            try {
                                fVarA = f.a(file);
                            } catch (IOException unused2) {
                                b();
                                return;
                            }
                        }
                        if (fVarA == null && fVarA.f93818c == jA2 && (i12 = fVarA.f93817b) != 2) {
                            i5 = i12;
                        } else if (z12) {
                            i5 = 327680;
                        } else if (z13) {
                            i5 = 1;
                        } else if (z14) {
                            i5 = 2;
                        }
                        if (z11 && z14 && i5 != 1) {
                            i5 = 2;
                        }
                        if (fVarA != null && fVarA.f93817b == 2 && i5 == 1 && length22 < fVarA.f93819d) {
                            i5 = 3;
                        }
                        fVar = new f(jA2, length, 1, i5);
                        if (fVarA != null || !fVarA.equals(fVar)) {
                            try {
                                fVar.b(file);
                            } catch (IOException unused3) {
                            }
                        }
                        b();
                        return;
                    } catch (PackageManager.NameNotFoundException unused4) {
                        b();
                        return;
                    }
                }
                b();
                return;
            }
        }
    }
}
