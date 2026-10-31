package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import b.c0;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.concurrent.Callable;
import xk.v0;

/* loaded from: classes.dex */
public abstract class d13 {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f2146a = {"com.android.", "com.google.", "com.chrome.", "com.nest.", "com.waymo.", "com.waze", "com.waze."};

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f2147b;

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f2148c;

    static {
        String str = Build.HARDWARE;
        f2147b = new String[]{"media", (str.equals("goldfish") || str.equals("ranchu")) ? "androidx.test.services.storage.runfiles" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b};
        f2148c = new String[]{com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "com.google.android.apps.docs.storage.legacy"};
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(final Context context, ParcelFileDescriptor parcelFileDescriptor, Uri uri, c13 c13Var) throws IOException, ErrnoException {
        File dataDir;
        String canonicalPath = new File(uri.getPath()).getCanonicalPath();
        try {
            StructStat structStatFstat = Os.fstat(parcelFileDescriptor.getFileDescriptor());
            try {
                StructStat structStatLstat = Os.lstat(canonicalPath);
                if (OsConstants.S_ISLNK(structStatLstat.st_mode)) {
                    throw new FileNotFoundException(c0.k("Can't open file: ", canonicalPath));
                }
                if (structStatFstat.st_dev != structStatLstat.st_dev || structStatFstat.st_ino != structStatLstat.st_ino) {
                    throw new FileNotFoundException(c0.k("Can't open file: ", canonicalPath));
                }
                if (!canonicalPath.startsWith("/proc/") && !canonicalPath.startsWith("/data/misc/")) {
                    c13Var.getClass();
                    v0 v0Var = c13Var.f1625c;
                    xk.l0 l0VarListIterator = v0Var.listIterator(0);
                    if (l0VarListIterator.hasNext()) {
                        l0VarListIterator.next().getClass();
                        throw new ClassCastException();
                    }
                    File dataDir2 = context.getDataDir();
                    if (dataDir2 != null) {
                        String canonicalPath2 = dataDir2.getCanonicalPath();
                        if (!canonicalPath2.endsWith("/")) {
                            canonicalPath2 = canonicalPath2.concat("/");
                        }
                        if (!canonicalPath.startsWith(canonicalPath2)) {
                            Context contextCreateDeviceProtectedStorageContext = context.createDeviceProtectedStorageContext();
                            if (contextCreateDeviceProtectedStorageContext == null || (dataDir = contextCreateDeviceProtectedStorageContext.getDataDir()) == null) {
                                final int i5 = 0;
                                try {
                                    File[] fileArr = (File[]) new Callable() { // from class: b.c1
                                        @Override // java.util.concurrent.Callable
                                        public final Object call() {
                                            switch (i5) {
                                                case 0:
                                                    return context.getExternalFilesDirs(null);
                                                default:
                                                    return context.getExternalCacheDirs();
                                            }
                                        }
                                    }.call();
                                    int length = fileArr.length;
                                    int i11 = 0;
                                    while (true) {
                                        if (i11 >= length) {
                                            final int i12 = 1;
                                            try {
                                                for (File file : (File[]) new Callable() { // from class: b.c1
                                                    @Override // java.util.concurrent.Callable
                                                    public final Object call() {
                                                        switch (i12) {
                                                            case 0:
                                                                return context.getExternalFilesDirs(null);
                                                            default:
                                                                return context.getExternalCacheDirs();
                                                        }
                                                    }
                                                }.call()) {
                                                    if (file != null) {
                                                        String canonicalPath3 = file.getCanonicalPath();
                                                        if (!canonicalPath3.endsWith("/")) {
                                                            canonicalPath3 = canonicalPath3.concat("/");
                                                        }
                                                        if (!canonicalPath.startsWith(canonicalPath3)) {
                                                        }
                                                    }
                                                }
                                                return;
                                            } catch (NullPointerException e3) {
                                                throw e3;
                                            } catch (Exception e11) {
                                                throw new RuntimeException(e11);
                                            }
                                        }
                                        File file2 = fileArr[i11];
                                        if (file2 != null) {
                                            String canonicalPath4 = file2.getCanonicalPath();
                                            if (!canonicalPath4.endsWith("/")) {
                                                canonicalPath4 = canonicalPath4.concat("/");
                                            }
                                            if (canonicalPath.startsWith(canonicalPath4)) {
                                                break;
                                            }
                                        }
                                        i11++;
                                    }
                                } catch (NullPointerException e12) {
                                    throw e12;
                                } catch (Exception e13) {
                                    throw new RuntimeException(e13);
                                }
                            } else {
                                String canonicalPath5 = dataDir.getCanonicalPath();
                                if (!canonicalPath5.endsWith("/")) {
                                    canonicalPath5 = canonicalPath5.concat("/");
                                }
                                if (!canonicalPath.startsWith(canonicalPath5)) {
                                }
                            }
                        }
                    } else {
                        String canonicalPath6 = Environment.getDataDirectory().getCanonicalPath();
                        if (!canonicalPath6.endsWith("/")) {
                            canonicalPath6 = canonicalPath6.concat("/");
                        }
                        if (!canonicalPath.startsWith(canonicalPath6)) {
                        }
                    }
                }
                throw new FileNotFoundException("Can't open file: ".concat(canonicalPath));
            } catch (ErrnoException e14) {
                throw new IOException(e14);
            }
        } catch (ErrnoException e15) {
            throw new IOException(e15);
        }
    }
}
