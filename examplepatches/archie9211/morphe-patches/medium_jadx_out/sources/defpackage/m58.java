package defpackage;

import android.os.ParcelFileDescriptor;
import androidx.datastore.core.NativeSharedCounter;
import java.io.File;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m58 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ p58 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m58(p58 p58Var, int i) {
        super(0);
        this.a = i;
        this.b = p58Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws Throwable {
        ParcelFileDescriptor parcelFileDescriptorOpen;
        int i = this.a;
        p58 p58Var = this.b;
        switch (i) {
            case 0:
                File file = new File(p58Var.b.getAbsolutePath() + p58Var.e);
                p58.f(file);
                return file;
            case 1:
                System.loadLibrary("datastore_shared_counter");
                try {
                    parcelFileDescriptorOpen = ParcelFileDescriptor.open((File) new m58(p58Var, 0).invoke(), 939524096);
                    try {
                        int fd = parcelFileDescriptorOpen.getFd();
                        NativeSharedCounter nativeSharedCounter = m6c.b;
                        if (nativeSharedCounter.nativeTruncateFile(fd) != 0) {
                            throw new IOException("Failed to truncate counter file");
                        }
                        long jNativeCreateSharedCounter = nativeSharedCounter.nativeCreateSharedCounter(fd);
                        if (jNativeCreateSharedCounter < 0) {
                            throw new IOException("Failed to mmap counter file");
                        }
                        m6c m6cVar = new m6c(jNativeCreateSharedCounter);
                        parcelFileDescriptorOpen.close();
                        return m6cVar;
                    } catch (Throwable th) {
                        th = th;
                        if (parcelFileDescriptorOpen != null) {
                            parcelFileDescriptorOpen.close();
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    parcelFileDescriptorOpen = null;
                }
                break;
            default:
                File file2 = new File(p58Var.b.getAbsolutePath() + p58Var.d);
                p58.f(file2);
                return file2;
        }
    }
}
