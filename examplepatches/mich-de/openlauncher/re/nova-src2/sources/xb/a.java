package xb;

import android.content.Context;
import android.media.MediaDataSource;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.io.File;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.concurrent.ConcurrentHashMap;
import yb.b;

/* loaded from: classes2.dex */
public final class a extends MediaDataSource {

    /* renamed from: e, reason: collision with root package name */
    public static final ConcurrentHashMap f95748e = new ConcurrentHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final b f95749a;

    /* renamed from: b, reason: collision with root package name */
    public long f95750b = -2147483648L;

    /* renamed from: c, reason: collision with root package name */
    public final Context f95751c;

    /* renamed from: d, reason: collision with root package name */
    public final com.bykv.vk.openvk.ycx.ycx.ycx.sya.a f95752d;

    public a(Context context, com.bykv.vk.openvk.ycx.ycx.ycx.sya.a aVar) {
        this.f95751c = context;
        this.f95752d = aVar;
        this.f95749a = new b(aVar);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f95752d.dy();
        b bVar = this.f95749a;
        if (bVar != null) {
            try {
                if (!bVar.f97234h) {
                    bVar.f97236j.close();
                }
                File file = bVar.f97230d;
                if (file != null) {
                    file.setLastModified(System.currentTimeMillis());
                }
                File file2 = bVar.f97231e;
                if (file2 != null) {
                    file2.setLastModified(System.currentTimeMillis());
                }
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEY=", "WOIihgY=", 296);
            }
            bVar.f97234h = true;
        }
        f95748e.remove(this.f95752d.wie());
    }

    @Override // android.media.MediaDataSource
    public final long getSize() {
        if (this.f95750b == -2147483648L) {
            long j11 = -1;
            if (this.f95751c == null || TextUtils.isEmpty(this.f95752d.dy())) {
                return -1L;
            }
            b bVar = this.f95749a;
            if (bVar.f97231e.exists()) {
                bVar.f97228b = bVar.f97231e.length();
            } else {
                synchronized (bVar.f97229c) {
                    int i5 = 0;
                    while (bVar.f97228b == -2147483648L && !bVar.f97234h) {
                        try {
                            i5 += 15;
                            try {
                                bVar.f97229c.wait(5L);
                                if (i5 > 20000) {
                                    break;
                                }
                            } catch (InterruptedException e3) {
                                sya.ycx(e3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5O1kmNAq89Se0o2wC9as+F", "duspnAKYZtCORthciCGsKULNLJYLuUDKkEY=", "V+sjkhe0", 354);
                                throw new IOException("total length InterruptException");
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
                this.f95750b = j11;
            }
            j11 = bVar.f97228b;
            this.f95750b = j11;
        }
        return this.f95750b;
    }

    @Override // android.media.MediaDataSource
    public final int readAt(long j11, byte[] bArr, int i5, int i11) throws IOException {
        b bVar = this.f95749a;
        bVar.getClass();
        try {
            int i12 = -1;
            if (j11 != bVar.f97228b) {
                int i13 = 0;
                int i14 = 0;
                do {
                    if (!bVar.f97234h) {
                        synchronized (bVar.f97229c) {
                            try {
                                File file = bVar.f97231e;
                                if (j11 < (file.exists() ? file.length() : bVar.f97230d.length())) {
                                    bVar.f97236j.seek(j11);
                                    i14 = bVar.f97236j.read(bArr, i5, i11);
                                } else {
                                    i13 += 33;
                                    bVar.f97238l = j11;
                                    bVar.f97229c.wait(33L);
                                    bVar.f97238l = -1L;
                                }
                            } finally {
                            }
                        }
                        if (i14 > 0) {
                            i12 = i14;
                        } else if (bVar.f97237k.ycx() && bVar.f97233g != -100 && (!bVar.f97235i || bVar.f97228b == -1)) {
                            throw new IOException();
                        }
                    }
                } while (i13 < 20000);
                throw new SocketTimeoutException();
            }
            int length = bArr.length;
            return i12;
        } catch (Throwable th2) {
            if (th2 instanceof IOException) {
                throw th2;
            }
            throw new IOException();
        }
    }
}
