package v30;

import android.os.Bundle;
import android.util.Log;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f92051a = {"apple-touch-icon-precomposed.png", "apple-touch-icon.png", "favicon.png", "favicon.ico"};

    /* renamed from: b, reason: collision with root package name */
    public static final char[] f92052b = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public static void a(String str) {
        Log.e("TeslaCoil", str);
    }

    public static char[] b(byte[] bArr) {
        char[] cArr = new char[bArr.length << 1];
        int i5 = 0;
        for (byte b11 : bArr) {
            int i11 = i5 + 1;
            char[] cArr2 = f92052b;
            cArr[i5] = cArr2[(b11 & 240) >>> 4];
            i5 += 2;
            cArr[i11] = cArr2[b11 & 15];
        }
        return cArr;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:25:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String c(InputStream inputStream) throws IOException {
        StringBuffer stringBuffer;
        DataInputStream dataInputStream = new DataInputStream(inputStream);
        try {
            if (dataInputStream.available() > 0) {
                stringBuffer = new StringBuffer(dataInputStream.readLine());
                while (dataInputStream.available() > 0) {
                    try {
                        stringBuffer.append("\n");
                        stringBuffer.append(dataInputStream.readLine());
                    } catch (Exception e3) {
                        e = e3;
                        Log.e("TeslaUtil", e.getMessage());
                        if (stringBuffer == null) {
                        }
                    }
                }
            } else {
                stringBuffer = null;
            }
            dataInputStream.close();
        } catch (Exception e11) {
            e = e11;
            stringBuffer = null;
        }
        if (stringBuffer == null) {
            return stringBuffer.toString();
        }
        return null;
    }

    public static String d(String str) throws IOException {
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(str), 1024);
            String property = System.getProperty("line.separator");
            StringBuffer stringBuffer = new StringBuffer(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    bufferedReader.close();
                    return stringBuffer.toString();
                }
                stringBuffer.append(line);
                stringBuffer.append(property);
            }
        } catch (FileNotFoundException unused) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } catch (IOException e3) {
            Log.w("TeslaUtil", "slurp " + e3.toString());
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
    }

    public static String e(Bundle bundle) {
        StringBuilder sb2 = new StringBuilder();
        if (bundle.size() > 0) {
            sb2.append("[ ");
            for (String str : bundle.keySet()) {
                Object obj = bundle.get(str);
                if (obj instanceof Object[]) {
                    sb2.append(str);
                    sb2.append("=");
                    sb2.append(Arrays.toString((Object[]) obj));
                } else {
                    sb2.append(str);
                    sb2.append("=");
                    sb2.append(obj);
                }
                sb2.append("; ");
            }
            sb2.append("]");
        }
        return sb2.toString();
    }
}
