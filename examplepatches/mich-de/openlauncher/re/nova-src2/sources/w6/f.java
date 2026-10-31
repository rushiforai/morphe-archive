package w6;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f93816a;

    /* renamed from: b, reason: collision with root package name */
    public final int f93817b;

    /* renamed from: c, reason: collision with root package name */
    public final long f93818c;

    /* renamed from: d, reason: collision with root package name */
    public final long f93819d;

    public f(long j11, long j12, int i5, int i11) {
        this.f93816a = i5;
        this.f93817b = i11;
        this.f93818c = j11;
        this.f93819d = j12;
    }

    public static f a(File file) throws IOException {
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream(file));
        try {
            f fVar = new f(dataInputStream.readLong(), dataInputStream.readLong(), dataInputStream.readInt(), dataInputStream.readInt());
            dataInputStream.close();
            return fVar;
        } finally {
        }
    }

    public final void b(File file) throws IOException {
        file.delete();
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(file));
        try {
            dataOutputStream.writeInt(this.f93816a);
            dataOutputStream.writeInt(this.f93817b);
            dataOutputStream.writeLong(this.f93818c);
            dataOutputStream.writeLong(this.f93819d);
            dataOutputStream.close();
        } catch (Throwable th2) {
            try {
                dataOutputStream.close();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof f)) {
            f fVar = (f) obj;
            if (this.f93817b == fVar.f93817b && this.f93818c == fVar.f93818c && this.f93816a == fVar.f93816a && this.f93819d == fVar.f93819d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Objects.hash(Integer.valueOf(this.f93817b), Long.valueOf(this.f93818c), Integer.valueOf(this.f93816a), Long.valueOf(this.f93819d));
    }
}
