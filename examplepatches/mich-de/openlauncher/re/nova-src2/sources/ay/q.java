package ay;

import android.net.Uri;
import com.amplitude.core.events.Identify;
import java.io.File;

/* loaded from: classes4.dex */
public final class q extends r {

    /* renamed from: b, reason: collision with root package name */
    public final File f15765b;

    public q(File file) {
        super(Uri.fromFile(file));
        this.f15765b = file;
    }

    @Override // ay.r
    public final void b() {
        this.f15765b.delete();
    }

    @Override // ay.r
    public final long d() {
        try {
            return this.f15765b.lastModified();
        } catch (Exception unused) {
            return 0L;
        }
    }

    @Override // ay.r
    public final void e(String str) {
        File file = this.f15765b;
        file.renameTo(new File(file.getParentFile(), (str + ".novabackup").replace("/", Identify.UNSET_VALUE)));
    }
}
