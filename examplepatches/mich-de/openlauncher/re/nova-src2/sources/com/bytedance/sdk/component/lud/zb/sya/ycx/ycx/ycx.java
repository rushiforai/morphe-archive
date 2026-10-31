package com.bytedance.sdk.component.lud.zb.sya.ycx.ycx;

import android.text.TextUtils;
import b.c0;
import com.bytedance.sdk.component.utils.jc;
import com.bytedance.sdk.component.utils.ul;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx {
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private File f24027zb;

    private ycx(int i5, File file) {
        this.ycx = i5;
        this.f24027zb = file;
    }

    private static void dj(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    private void sya(File file) {
        if (file == null) {
            return;
        }
        try {
            ul.zb(file);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "Tv4plBe5T86MT/tcnwWNJ1/nK5wGuA==", Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE);
        }
    }

    public static ycx ycx(int i5, File file) {
        try {
            ycx ycxVar = new ycx(i5, file);
            if (file != null) {
                file.mkdirs();
            }
            return ycxVar;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "VP4omw==", 39);
            return null;
        }
    }

    private List<File> zb(File file) {
        List<File> listYcx = ycx(file);
        if (listYcx == null || listYcx.isEmpty()) {
            return null;
        }
        final HashMap map = new HashMap();
        for (File file2 : listYcx) {
            map.put(file2, Long.valueOf(file2.lastModified()));
        }
        Collections.sort(listYcx, new Comparator<File>() { // from class: com.bytedance.sdk.component.lud.zb.sya.ycx.ycx.ycx.1
            @Override // java.util.Comparator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public int compare(File file3, File file4) {
                if (file3 == null && file4 == null) {
                    return 0;
                }
                if (file3 == null) {
                    return 1;
                }
                if (file4 == null) {
                    return -1;
                }
                return Long.compare(((Long) map.get(file4)).longValue(), ((Long) map.get(file3)).longValue());
            }
        });
        return listYcx;
    }

    private File sya(String str) {
        return new File(this.f24027zb, c0.E(str, ".temp"));
    }

    public synchronized InputStream ycx(String str) {
        FileInputStream fileInputStream;
        if (this.ycx <= 0) {
            return null;
        }
        File fileZb = zb(str);
        if (!fileZb.exists()) {
            return null;
        }
        try {
            try {
                fileInputStream = new FileInputStream(fileZb);
                try {
                    sya(fileZb);
                    return fileInputStream;
                } catch (FileNotFoundException e3) {
                    e = e3;
                    sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "XOs5", 58);
                    jc.ycx(fileInputStream);
                    return null;
                }
            } catch (FileNotFoundException e11) {
                e = e11;
                fileInputStream = null;
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "XOs5", 61);
            return null;
        }
    }

    private File zb(String str) {
        return new File(this.f24027zb, str);
    }

    public synchronized boolean ycx(String str, byte[] bArr) {
        if (this.ycx > 0 && str != null && bArr != null) {
            File fileSya = sya(str);
            FileOutputStream fileOutputStream = null;
            try {
                try {
                    FileOutputStream fileOutputStream2 = new FileOutputStream(fileSya);
                    try {
                        fileOutputStream2.write(bArr);
                        if (fileSya.exists()) {
                            ycx(fileSya, zb(str), true);
                        }
                        jc.ycx(fileOutputStream2);
                        List<File> listYcx = ycx(this.f24027zb);
                        if (listYcx != null) {
                            int size = listYcx.size();
                            int i5 = this.ycx;
                            if (size > i5) {
                                ycx((int) (i5 * 0.7d));
                            }
                        }
                        return true;
                    } catch (FileNotFoundException e3) {
                        e = e3;
                        fileOutputStream = fileOutputStream2;
                        sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "WO8unQY=", 108);
                        File file = this.f24027zb;
                        if (file != null) {
                            file.mkdirs();
                        }
                        jc.ycx(fileOutputStream);
                        List<File> listYcx2 = ycx(this.f24027zb);
                        if (listYcx2 != null) {
                            int size2 = listYcx2.size();
                            int i11 = this.ycx;
                            if (size2 > i11) {
                                ycx((int) (i11 * 0.7d));
                            }
                        }
                        return false;
                    } catch (Throwable th2) {
                        th = th2;
                        fileOutputStream = fileOutputStream2;
                        sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "WO8unQY=", 114);
                        return false;
                    }
                } finally {
                    jc.ycx(null);
                    List<File> listYcx3 = ycx(this.f24027zb);
                    if (listYcx3 != null) {
                        int size3 = listYcx3.size();
                        int i12 = this.ycx;
                        if (size3 > i12) {
                            ycx((int) (i12 * 0.7d));
                        }
                    }
                }
            } catch (FileNotFoundException e11) {
                e = e11;
            } catch (Throwable th3) {
                th = th3;
            }
        }
        return false;
    }

    private List<File> ycx(File file) {
        File[] fileArrListFiles;
        if (file != null) {
            try {
                if (file.exists() && file.isDirectory() && (fileArrListFiles = file.listFiles()) != null && fileArrListFiles.length != 0) {
                    List<File> listAsList = Arrays.asList(fileArrListFiles);
                    ArrayList arrayList = new ArrayList();
                    for (File file2 : listAsList) {
                        if (file2 != null && file2.isFile() && !TextUtils.isEmpty(file2.getName()) && !file2.getName().endsWith(".temp")) {
                            arrayList.add(file2);
                        }
                    }
                    return arrayList;
                }
                return null;
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "XOs5pwa9ZeuJWcN7hR2lOw==", 141);
            }
        }
        return null;
    }

    public synchronized void ycx(int i5) {
        try {
            if (i5 > this.ycx) {
                return;
            }
            List<File> listZb = zb(this.f24027zb);
            if (listZb != null && listZb.size() > i5) {
                while (i5 < listZb.size()) {
                    File file = listZb.get(i5);
                    if (file != null && file.exists()) {
                        file.delete();
                    }
                    i5++;
                }
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6AulAC0bImEQ8RW", "a+8qsQqvYuuSX/Rcjxml", "T/wkmDezWs6aTw==", 162);
        }
    }

    private void ycx(File file, File file2, boolean z11) throws IOException {
        if (z11) {
            dj(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }
}
