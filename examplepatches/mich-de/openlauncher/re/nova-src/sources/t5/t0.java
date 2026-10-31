package t5;

import android.os.ParcelFileDescriptor;
import androidx.datastore.core.NativeSharedCounter;
import java.io.File;
import java.io.IOException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class t0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f88697j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ w0 f88698k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t0(w0 w0Var, int i5) {
        super(0);
        this.f88697j = i5;
        this.f88698k = w0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws Throwable {
        ParcelFileDescriptor parcelFileDescriptorOpen;
        switch (this.f88697j) {
            case 0:
                w0 w0Var = this.f88698k;
                File file = new File(w0Var.f88732b.getAbsolutePath() + w0Var.f88735e);
                w0.f(w0Var, file);
                return file;
            case 1:
                System.loadLibrary("datastore_shared_counter");
                try {
                    parcelFileDescriptorOpen = ParcelFileDescriptor.open((File) new t0(this.f88698k, 0).invoke(), 939524096);
                } catch (Throwable th2) {
                    th = th2;
                    parcelFileDescriptorOpen = null;
                }
                try {
                    int fd2 = parcelFileDescriptorOpen.getFd();
                    NativeSharedCounter nativeSharedCounter = d1.f88563b;
                    if (nativeSharedCounter.nativeTruncateFile(fd2) != 0) {
                        throw new IOException("Failed to truncate counter file");
                    }
                    long jNativeCreateSharedCounter = nativeSharedCounter.nativeCreateSharedCounter(fd2);
                    if (jNativeCreateSharedCounter < 0) {
                        throw new IOException("Failed to mmap counter file");
                    }
                    d1 d1Var = new d1(jNativeCreateSharedCounter);
                    parcelFileDescriptorOpen.close();
                    return d1Var;
                } catch (Throwable th3) {
                    th = th3;
                    if (parcelFileDescriptorOpen != null) {
                        parcelFileDescriptorOpen.close();
                    }
                    throw th;
                }
            default:
                w0 w0Var2 = this.f88698k;
                File file2 = new File(w0Var2.f88732b.getAbsolutePath() + w0Var2.f88734d);
                w0.f(w0Var2, file2);
                return file2;
        }
    }
}
