package f7;

import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: d, reason: collision with root package name */
    public static final HashMap f54340d = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final File f54341a;

    /* renamed from: b, reason: collision with root package name */
    public final Lock f54342b;

    /* renamed from: c, reason: collision with root package name */
    public FileChannel f54343c;

    public a(File file, String str) {
        Lock lock;
        this.f54341a = file != null ? new File(file, str.concat(".lck")) : null;
        HashMap map = f54340d;
        synchronized (map) {
            try {
                Object reentrantLock = map.get(str);
                if (reentrantLock == null) {
                    reentrantLock = new ReentrantLock();
                    map.put(str, reentrantLock);
                }
                lock = (Lock) reentrantLock;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f54342b = lock;
    }

    public final void a(boolean z11) throws IOException {
        this.f54342b.lock();
        if (z11) {
            File file = this.f54341a;
            try {
                if (file == null) {
                    throw new IOException("No lock directory was provided.");
                }
                File parentFile = file.getParentFile();
                if (parentFile != null) {
                    parentFile.mkdirs();
                }
                FileChannel channel = new FileOutputStream(file).getChannel();
                channel.lock();
                this.f54343c = channel;
            } catch (IOException e3) {
                this.f54343c = null;
                Log.w("SupportSQLiteLock", "Unable to grab file lock.", e3);
            }
        }
    }

    public final void b() throws IOException {
        try {
            FileChannel fileChannel = this.f54343c;
            if (fileChannel != null) {
                fileChannel.close();
            }
        } catch (IOException unused) {
        }
        this.f54342b.unlock();
    }
}
