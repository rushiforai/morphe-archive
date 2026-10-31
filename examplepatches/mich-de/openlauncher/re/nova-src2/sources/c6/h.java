package c6;

import android.system.ErrnoException;
import android.system.Os;
import java.io.FileDescriptor;

/* loaded from: classes2.dex */
public abstract class h {
    public static void a(FileDescriptor fileDescriptor) throws ErrnoException {
        Os.close(fileDescriptor);
    }

    public static FileDescriptor b(FileDescriptor fileDescriptor) throws ErrnoException {
        return Os.dup(fileDescriptor);
    }

    public static long c(FileDescriptor fileDescriptor, long j11, int i5) throws ErrnoException {
        return Os.lseek(fileDescriptor, j11, i5);
    }
}
