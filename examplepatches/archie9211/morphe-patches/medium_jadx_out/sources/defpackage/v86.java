package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import org.chromium.net.impl.ImplVersion;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v86 extends oi2 {
    public static final AtomicLong C = new AtomicLong(0);

    @Override // defpackage.oi2, defpackage.d46
    public final long L() {
        long jG = this.t.G();
        AtomicLong atomicLong = C;
        atomicLong.compareAndSet(0L, jG);
        return atomicLong.get();
    }

    @Override // defpackage.d46
    public final d46 d0(String str) {
        this.A = str;
        return this;
    }

    @Override // defpackage.d46
    public final x54 v() {
        int i;
        if (this.w == null) {
            Context context = this.u;
            StringBuilder sb = new StringBuilder();
            sb.append(context.getPackageName());
            sb.append('/');
            synchronized (rx0.j) {
                i = rx0.k;
                if (i == 0) {
                    try {
                        i = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
                        rx0.k = i;
                    } catch (PackageManager.NameNotFoundException unused) {
                        throw new IllegalStateException("Cannot determine package version");
                    }
                }
            }
            sb.append(i);
            sb.append(" (Linux; U; Android ");
            sb.append(Build.VERSION.RELEASE);
            sb.append("; ");
            sb.append(Locale.getDefault().toString());
            String str = Build.MODEL;
            if (str.length() > 0) {
                sb.append("; ");
                sb.append(str);
            }
            String str2 = Build.ID;
            if (str2.length() > 0) {
                sb.append("; Build/");
                sb.append(str2);
            }
            sb.append("; Cronet/");
            sb.append(ImplVersion.getCronetVersion());
            sb.append(')');
            this.w = sb.toString();
        }
        return new u86(this);
    }
}
