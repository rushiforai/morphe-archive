package s90;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;
import org.chromium.net.ApiVersion;
import org.chromium.net.ICronetEngineBuilder;
import org.chromium.net.impl.ImplVersion;

/* loaded from: classes5.dex */
public abstract class v extends ICronetEngineBuilder {
    public static final Pattern n = Pattern.compile("^[0-9\\.]*$");
    public static final int o = e0.b();

    /* renamed from: a, reason: collision with root package name */
    public final e0 f87035a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f87036b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f87037c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f87038d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public boolean f87039e;

    /* renamed from: f, reason: collision with root package name */
    public String f87040f;

    /* renamed from: g, reason: collision with root package name */
    public String f87041g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f87042h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f87043i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f87044j;

    /* renamed from: k, reason: collision with root package name */
    public int f87045k;

    /* renamed from: l, reason: collision with root package name */
    public String f87046l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f87047m;

    public v(Context context) {
        long jUptimeMillis = SystemClock.uptimeMillis();
        Context applicationContext = context.getApplicationContext();
        this.f87036b = applicationContext;
        this.f87035a = d0.a(applicationContext, a0.f86849d);
        try {
            this.f87042h = true;
            this.f87043i = true;
            this.f87044j = false;
            a(0);
            this.f87047m = false;
            this.f87039e = true;
            b(jUptimeMillis, true);
        } catch (Throwable th2) {
            b(jUptimeMillis, false);
            throw th2;
        }
    }

    public final void a(int i5) {
        int i11;
        if (i5 == 0) {
            i11 = 1;
        } else if (i5 != 1) {
            i11 = 3;
            if (i5 != 2) {
                if (i5 != 3) {
                    throw new IllegalArgumentException("Unknown public builder cache mode");
                }
                i11 = 2;
            }
        } else {
            i11 = 4;
        }
        boolean z11 = true;
        if (i11 == 1) {
            z11 = false;
        } else if (i11 != 2 && i11 != 3) {
            if (i11 != 4) {
                throw null;
            }
            z11 = 2;
        }
        if (z11 && this.f87041g == null) {
            throw new IllegalArgumentException("Storage path must be set");
        }
        this.f87045k = i11;
    }

    public final void b(long j11, boolean z11) {
        a0 a0Var = a0.f86849d;
        e0 e0Var = this.f87035a;
        if (o >= 30) {
            return;
        }
        z zVar = new z();
        zVar.f87076e = Boolean.FALSE;
        try {
            zVar.f87073b = 2;
            zVar.f87079h = Process.myUid();
            zVar.f87078g = new c0(ImplVersion.getCronetVersion());
            zVar.f87075d = a0Var;
            zVar.f87077f = new c0(ApiVersion.getCronetVersion());
            zVar.f87072a = getLogCronetInitializationRef();
            zVar.f87076e = Boolean.valueOf(z11);
        } finally {
            zVar.f87074c = (int) (SystemClock.uptimeMillis() - j11);
            e0Var.d(zVar);
        }
    }

    public final y c() {
        int i5;
        int i11;
        boolean z11 = this.f87039e;
        boolean z12 = this.f87042h;
        boolean z13 = this.f87043i;
        boolean z14 = this.f87044j;
        int iF = b.c0.F(this.f87045k);
        if (iF != 0) {
            i5 = 3;
            if (iF != 1) {
                if (iF == 2) {
                    i11 = 2;
                } else {
                    if (iF != 3) {
                        throw new IllegalArgumentException("Unknown internal builder cache mode");
                    }
                    i11 = 1;
                }
            }
            return new y(z11, z12, z13, z14, i11, this.f87046l, this.f87047m, getLogCronetInitializationRef());
        }
        i5 = 0;
        i11 = i5;
        return new y(z11, z12, z13, z14, i11, this.f87046l, this.f87047m, getLogCronetInitializationRef());
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public final String getDefaultUserAgent() {
        int i5;
        Context context = this.f87036b;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(context.getPackageName());
        sb2.append('/');
        synchronized (e0.f86908d) {
            if (e0.f86909e == 0) {
                try {
                    e0.f86909e = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
                } catch (PackageManager.NameNotFoundException unused) {
                    throw new IllegalStateException("Cannot determine package version");
                }
            }
            i5 = e0.f86909e;
        }
        sb2.append(i5);
        sb2.append(" (Linux; U; Android ");
        sb2.append(Build.VERSION.RELEASE);
        sb2.append("; ");
        sb2.append(Locale.getDefault().toString());
        String str = Build.MODEL;
        if (str.length() > 0) {
            sb2.append("; ");
            sb2.append(str);
        }
        String str2 = Build.ID;
        if (str2.length() > 0) {
            sb2.append("; Build/");
            sb2.append(str2);
        }
        sb2.append("; Cronet/");
        sb2.append(ImplVersion.getCronetVersion());
        sb2.append(')');
        return sb2.toString();
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public abstract long getLogCronetInitializationRef();

    @Override // org.chromium.net.ICronetEngineBuilder
    public final Set getSupportedConfigOptions() {
        HashSet hashSet = new HashSet();
        hashSet.add(4);
        return Collections.unmodifiableSet(hashSet);
    }
}
