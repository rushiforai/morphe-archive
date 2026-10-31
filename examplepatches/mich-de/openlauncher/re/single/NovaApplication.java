package com.teslacoilsw.launcher;

import a70.d;
import a80.e;
import android.app.Application;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import android.webkit.WebView;
import fz.u;
import h50.q;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import m8.f;
import m8.k;
import mx.g0;
import mx.i0;
import o7.b;
import qp.i;
import qy.a;
import r10.h0;
import t70.g2;
import t70.k0;
import t70.m0;
import t70.y0;
import x7.n;
import y70.o;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003:\u0001\u0006B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0007"}, d2 = {"Lcom/teslacoilsw/launcher/NovaApplication;", "Landroid/app/Application;", "Lm8/f;", "Lo7/b;", "<init>", "()V", "fg/a", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class NovaApplication extends Application implements f, b {

    /* renamed from: g, reason: collision with root package name */
    public static Boolean f45635g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f45636h;

    /* renamed from: i, reason: collision with root package name */
    public static NovaApplication f45637i;

    /* renamed from: j, reason: collision with root package name */
    public static boolean f45638j;

    /* renamed from: a, reason: collision with root package name */
    public u f45639a;

    /* renamed from: b, reason: collision with root package name */
    public final d f45640b = LazyKt.a(new a7.f(this, 20));

    /* renamed from: c, reason: collision with root package name */
    public final d f45641c = LazyKt.a(new q(19));

    /* renamed from: d, reason: collision with root package name */
    public final i0 f45642d = new i0(this);

    /* renamed from: e, reason: collision with root package name */
    public g2 f45643e;

    /* renamed from: f, reason: collision with root package name */
    public final y70.d f45644f;

    static {
        a aVar = new a();
        f45636h = aVar;
        SystemClock.uptimeMillis();
        mc0.b bVar = mc0.d.f76206a;
        bVar.q(aVar);
        bVar.q(new mc0.a());
    }

    public NovaApplication() {
        e eVar = y0.f88884a;
        this.f45644f = k0.a(o.f96819a.plus(m0.d()));
    }

    public final k a() {
        n nVar = new n(this, 8);
        i iVar = new i();
        iVar.i(new h0(this), String.class);
        iVar.h(new r8.a(9), Uri.class);
        iVar.h(new r8.a(8), Uri.class);
        iVar.h(new r8.a(7), Uri.class);
        if (f45638j) {
            Context context = g0.f77088a;
            iVar.h(new r10.b(g0.g(), 0), Uri.class);
            iVar.h(new r10.b(g0.g(), 1), Uri.class);
        }
        nVar.f95151c = iVar.k();
        x8.b bVar = (x8.b) nVar.f95150b;
        nVar.f95150b = new x8.b(bVar.f95280a, bVar.f95281b, bVar.f95282c, bVar.f95283d, bVar.f95284e, bVar.f95285f, bVar.f95286g, false, bVar.f95288i, bVar.f95289j, bVar.f95290k, bVar.f95291l, bVar.f95292m, bVar.n, bVar.o);
        return nVar.e();
    }

    @Override // android.content.ContextWrapper
    public final void attachBaseContext(Context context) {
        super.attachBaseContext(context);
        f45637i = this;
        try {
            if (v4.a.l(this) || Build.VERSION.SDK_INT < 28) {
                return;
            }
            WebView.setDataDirectorySuffix(v4.a.j(this));
        } catch (Throwable th2) {
            v30.d.a(th2.toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006f  */
    @Override // android.app.Application, android.content.ComponentCallbacks
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onConfigurationChanged(android.content.res.Configuration r5) {
        /*
            r4 = this;
            android.content.Context r0 = mx.g0.f77088a
            android.os.LocaleList r0 = mx.g0.f77089b
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L27
            android.os.LocaleList r3 = r5.getLocales()
            boolean r0 = r0.equals(r3)
            if (r0 != 0) goto L27
            android.os.LocaleList r0 = r5.getLocales()
            mx.g0.f77089b = r0
            android.content.Context r0 = mx.g0.f77088a
            if (r0 == 0) goto L26
            android.content.Context r0 = mx.g0.e()
            android.content.Context r0 = r0.createConfigurationContext(r5)
            mx.g0.f77088a = r0
        L26:
            r2 = r1
        L27:
            super.onConfigurationChanged(r5)
            x7.c r5 = g30.b.f57016l
            java.lang.Object r5 = r5.h(r4)
            g30.b r5 = (g30.b) r5
            g30.f r0 = r5.f57019c
            g30.c r0 = r0.c()
            r5.c(r0)
            fz.d0 r0 = mx.g0.f77093f
            r3 = 0
            if (r0 == 0) goto L6f
            fz.u r0 = r4.f45639a
            if (r0 == 0) goto L6f
            fz.d0 r0 = mx.g0.g()
            fz.u r0 = r0.f56214w
            java.lang.Object r0 = r0.f56363e
            gz.f r0 = (gz.f) r0
            int r0 = r0.h()
            tz.o r5 = r5.f57023g
            int r5 = r5.hashCode()
            if (r0 == r5) goto L6f
            fz.u r5 = r4.f45639a
            if (r5 == 0) goto L69
            java.lang.Object r5 = r5.f56363e
            gz.f r5 = (gz.f) r5
            boolean r5 = r5.b()
            if (r5 == 0) goto L6f
            goto L71
        L69:
            java.lang.String r5 = "iconConfig"
            kotlin.jvm.internal.Intrinsics.m(r5)
            throw r3
        L6f:
            if (r2 == 0) goto L86
        L71:
            t70.g2 r5 = r4.f45643e
            if (r5 == 0) goto L78
            r5.c(r3)
        L78:
            mx.e0 r5 = new mx.e0
            r5.<init>(r4, r3, r1)
            r0 = 3
            y70.d r1 = r4.f45644f
            t70.g2 r5 = t70.m0.t(r1, r3, r3, r5, r0)
            r4.f45643e = r5
        L86:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaApplication.onConfigurationChanged(android.content.res.Configuration):void");
    }

    /* JADX WARN: Can't wrap try/catch for region: R(5:34|(3:119|35|(1:37)(2:42|(3:(1:45)(1:(3:47|(2:(1:52)(1:51)|53)|54)(1:(2:57|(2:59|(1:64)(1:68))(2:65|(1:67)(0)))))|69|70)))|115|72|73) */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0214, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0215, code lost:
    
        android.util.Log.e("FirebaseRemoteConfig", "The provided defaults map could not be processed.", r0);
        r0 = com.google.android.gms.tasks.Tasks.d(null);
     */
    /* JADX WARN: Removed duplicated region for block: B:104:0x02bd  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x02d6  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0319  */
    /* JADX WARN: Removed duplicated region for block: B:120:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01e3 A[Catch: IOException -> 0x017a, XmlPullParserException -> 0x017d, TryCatch #4 {IOException -> 0x017a, XmlPullParserException -> 0x017d, blocks: (B:35:0x016d, B:37:0x0173, B:42:0x0180, B:45:0x0192, B:69:0x01e8, B:47:0x0199, B:51:0x01a9, B:52:0x01ad, B:57:0x01ba, B:68:0x01e3, B:62:0x01c9, B:64:0x01d1, B:65:0x01d6, B:67:0x01de), top: B:119:0x016d }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0244  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0290  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x02b1  */
    @Override // android.app.Application
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onCreate() throws org.xmlpull.v1.XmlPullParserException, android.content.res.Resources.NotFoundException, android.content.pm.PackageManager.NameNotFoundException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 807
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.teslacoilsw.launcher.NovaApplication.onCreate():void");
    }
}
