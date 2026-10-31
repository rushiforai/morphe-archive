package c6;

import android.media.MediaDataSource;
import java.io.IOException;

/* loaded from: classes2.dex */
public final class a extends MediaDataSource {

    /* renamed from: a, reason: collision with root package name */
    public long f19704a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f19705b;

    public a(f fVar) {
        this.f19705b = fVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }

    @Override // android.media.MediaDataSource
    public final long getSize() {
        return -1L;
    }

    @Override // android.media.MediaDataSource
    public final int readAt(long j11, byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        if (j11 < 0) {
            return -1;
        }
        try {
            long j12 = this.f19704a;
            f fVar = this.f19705b;
            if (j12 != j11) {
                if (j12 >= 0 && j11 >= j12 + fVar.f19708a.available()) {
                    return -1;
                }
                fVar.b(j11);
                this.f19704a = j11;
            }
            if (i11 > fVar.f19708a.available()) {
                i11 = fVar.f19708a.available();
            }
            int i12 = fVar.read(bArr, i5, i11);
            if (i12 >= 0) {
                this.f19704a += i12;
                return i12;
            }
        } catch (IOException unused) {
        }
        this.f19704a = -1L;
        return -1;
    }
}
