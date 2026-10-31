package com.pgl.ssdk;

import android.content.Context;
import androidx.recyclerview.widget.u1;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.nio.charset.Charset;

/* loaded from: classes4.dex */
public class af {
    /* JADX WARN: Removed duplicated region for block: B:31:0x00df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static synchronized String a(Context context) {
        String strA;
        try {
            String str = context.getFilesDir().getAbsolutePath() + "/dic";
            if (new File(str).exists()) {
                a("chmod 777 ".concat(String.valueOf(str)));
                String strA2 = a(str);
                a("chmod 600 ".concat(String.valueOf(str)));
                if (strA2 != null && strA2.length() > 0) {
                    return strA2;
                }
            }
            InputStream inputStreamOpen = context.getResources().getAssets().open("dic");
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            while (true) {
                int i5 = inputStreamOpen.read(bArr, 0, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                if (i5 == -1) {
                    break;
                }
                a(bArr, i5, "dic".getBytes(Charset.forName("UTF-8")));
                byteArrayOutputStream.write(bArr, 0, i5);
            }
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            fileOutputStream.write(byteArrayOutputStream.toByteArray());
            fileOutputStream.close();
            a("chmod 777 ".concat(String.valueOf(str)));
            strA = a(str);
            if (strA == null || strA.length() == 0) {
                RandomAccessFile randomAccessFile = new RandomAccessFile(str, "rw");
                randomAccessFile.seek(16L);
                randomAccessFile.write(new byte[]{2});
                randomAccessFile.close();
                strA = a(str);
            }
            a("chmod 600 ".concat(String.valueOf(str)));
        } catch (Throwable unused) {
            strA = "0[<!>]EXCEPTION[<!>]";
        }
        if (strA != null) {
            try {
                if (strA.length() == 0) {
                    strA = "0[<!>]ERROR[<!>]";
                }
            } finally {
            }
        }
        return strA;
    }

    private static String a(BufferedInputStream bufferedInputStream) throws IOException {
        int i5;
        if (bufferedInputStream == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        byte[] bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        StringBuilder sb2 = new StringBuilder();
        do {
            try {
                i5 = bufferedInputStream.read(bArr);
                if (i5 > 0) {
                    sb2.append(new String(bArr, 0, i5));
                }
            } catch (Exception unused) {
            }
        } while (i5 >= 4096);
        return sb2.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x006a A[PHI: r0 r1
      0x006a: PHI (r0v4 java.lang.String) = (r0v8 java.lang.String), (r0v7 java.lang.String), (r0v7 java.lang.String) binds: [B:33:0x0067, B:38:0x006a, B:8:0x0039] A[DONT_GENERATE, DONT_INLINE]
      0x006a: PHI (r1v6 java.lang.Process) = (r1v5 java.lang.Process), (r1v8 java.lang.Process), (r1v8 java.lang.Process) binds: [B:33:0x0067, B:38:0x006a, B:8:0x0039] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0051 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x004c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0064 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x005f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String a(String str) throws Throwable {
        Process processExec;
        BufferedInputStream bufferedInputStream;
        BufferedOutputStream bufferedOutputStream;
        BufferedOutputStream bufferedOutputStream2 = null;
        strA = null;
        String strA = null;
        try {
            processExec = Runtime.getRuntime().exec("sh");
            try {
                bufferedOutputStream = new BufferedOutputStream(processExec.getOutputStream());
                try {
                    bufferedInputStream = new BufferedInputStream(processExec.getInputStream());
                } catch (Exception unused) {
                    bufferedInputStream = null;
                } catch (Throwable th2) {
                    th = th2;
                    bufferedInputStream = null;
                }
            } catch (Exception unused2) {
                bufferedOutputStream = null;
                bufferedInputStream = null;
                if (bufferedOutputStream != null) {
                    try {
                        bufferedOutputStream.close();
                    } catch (IOException unused3) {
                    }
                }
                if (bufferedInputStream != null) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException unused4) {
                    }
                }
                if (processExec != null) {
                    processExec.destroy();
                }
                return strA;
            } catch (Throwable th3) {
                th = th3;
                bufferedInputStream = null;
                if (bufferedOutputStream2 != null) {
                    try {
                        bufferedOutputStream2.close();
                    } catch (IOException unused5) {
                    }
                }
                if (bufferedInputStream != null) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException unused6) {
                    }
                }
                if (processExec != null) {
                    throw th;
                }
                processExec.destroy();
                throw th;
            }
        } catch (Exception unused7) {
            processExec = null;
        } catch (Throwable th4) {
            th = th4;
            processExec = null;
        }
        try {
            bufferedOutputStream.write(str.getBytes());
            bufferedOutputStream.write(10);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
            processExec.waitFor();
            strA = a(bufferedInputStream);
            try {
                bufferedOutputStream.close();
            } catch (IOException unused8) {
            }
            try {
                bufferedInputStream.close();
            } catch (IOException unused9) {
            }
        } catch (Exception unused10) {
            if (bufferedOutputStream != null) {
            }
            if (bufferedInputStream != null) {
            }
            if (processExec != null) {
            }
            return strA;
        } catch (Throwable th5) {
            th = th5;
            bufferedOutputStream2 = bufferedOutputStream;
            if (bufferedOutputStream2 != null) {
            }
            if (bufferedInputStream != null) {
            }
            if (processExec != null) {
            }
        }
        processExec.destroy();
        return strA;
    }

    private static void a(byte[] bArr, int i5, byte[] bArr2) {
        for (int i11 = 0; i11 < i5; i11++) {
            bArr[i11] = (byte) (bArr[i11] ^ bArr2[i11 % bArr2.length]);
        }
    }
}
