package ads_mobile_sdk;

import androidx.recyclerview.widget.u1;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.concurrent.ExecutorService;

/* loaded from: classes.dex */
public final class j11 {

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f5081a;

    /* renamed from: b, reason: collision with root package name */
    public final String f5082b;

    /* renamed from: c, reason: collision with root package name */
    public final long f5083c;

    public j11(ExecutorService executorService, String str, long j11) {
        this.f5081a = executorService;
        this.f5082b = str;
        this.f5083c = j11;
    }

    public static byte[] a(HttpURLConnection httpURLConnection, int i5) throws IOException {
        InputStream inputStream = i5 < 400 ? httpURLConnection.getInputStream() : httpURLConnection.getErrorStream();
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                if (inputStream == null) {
                    byte[] bArr = new byte[0];
                    byteArrayOutputStream.close();
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    return bArr;
                }
                byte[] bArr2 = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
                while (true) {
                    int i11 = inputStream.read(bArr2);
                    if (i11 == -1) {
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        byteArrayOutputStream.close();
                        inputStream.close();
                        return byteArray;
                    }
                    byteArrayOutputStream.write(bArr2, 0, i11);
                }
            } finally {
            }
        } catch (Throwable th2) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (Throwable th3) {
                    th2.addSuppressed(th3);
                }
            }
            throw th2;
        }
    }
}
