package ga;

import aa.d0;
import aa.g0;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import cl.l0;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import mx.c0;
import mx.k0;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final f f57281a;

    /* renamed from: b, reason: collision with root package name */
    public final LauncherActivityInfo f57282b;

    /* renamed from: c, reason: collision with root package name */
    public final String f57283c;

    /* renamed from: d, reason: collision with root package name */
    public final String f57284d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f57285e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f57286f;

    /* renamed from: g, reason: collision with root package name */
    public final String f57287g;

    /* renamed from: h, reason: collision with root package name */
    public final String f57288h;

    public d(a aVar, LauncherActivityInfo launcherActivityInfo, boolean z11, String str, String str2) {
        this(aVar, launcherActivityInfo, null, null, null, z11, str, str2);
    }

    public final boolean a(Context context, d0 d0Var, String str) {
        j jVar;
        Intent.ShortcutIconResource shortcutIconResource;
        NovaIconSource novaIconSource;
        BitmapInfo bitmapInfoM;
        String str2 = this.f57283c;
        String str3 = this.f57287g;
        f fVar = this.f57281a;
        if (fVar == null) {
            throw new IllegalStateException("loadWorkspaceIcon should only be use for a ItemInfoWithIcon: " + fVar);
        }
        g0 g0VarW = g0.w(context);
        try {
            if (fVar.f57303q.a() && !TextUtils.isEmpty(str3)) {
                fVar.f57307u = l0.x(str3);
            }
            boolean zA = fVar.f57303q.a();
            byte[] bArr = this.f57285e;
            if (zA && bArr != null && str.equals(this.f57288h)) {
                try {
                    fVar.f57304r = g0VarW.h(BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
                    g0VarW.D();
                    return true;
                } catch (Exception unused) {
                }
            }
            if (fVar.f57307u == null && fVar.f57290b == 1 && (fVar instanceof j)) {
                j jVar2 = (j) fVar;
                c0 c0VarC = c0.c(jVar2.f57322x);
                if (c0VarC != null) {
                    jVar2.f57304r = ((fz.d0) d0Var).M(c0VarC);
                    g0VarW.D();
                    return true;
                }
                boolean zIsEmpty = TextUtils.isEmpty(str2);
                String str4 = this.f57284d;
                if (!zIsEmpty || !TextUtils.isEmpty(str4)) {
                    Intent.ShortcutIconResource shortcutIconResource2 = new Intent.ShortcutIconResource();
                    jVar2.f57323y = shortcutIconResource2;
                    shortcutIconResource2.packageName = str2;
                    shortcutIconResource2.resourceName = str4;
                    BitmapInfo bitmapInfoF = g0VarW.f(shortcutIconResource2);
                    if (bitmapInfoF != null) {
                        jVar2.f57304r = bitmapInfoF;
                        g0VarW.D();
                        return true;
                    }
                }
            }
            if (fVar.f57303q.a() && (novaIconSource = fVar.f57307u) != null && (bitmapInfoM = ((k0) g0VarW).M(novaIconSource, fVar.o, !fVar.f57303q.d(), !fVar.f57303q.c())) != null) {
                fVar.f57304r = bitmapInfoM;
                ya.b bVar = new ya.b(context, new vk.j(new String[]{Integer.toString(fVar.f57289a)}));
                bVar.l(fVar.f57304r, fVar.o);
                bVar.k("customIconLoadedState", str);
                bVar.a();
                g0VarW.D();
                return true;
            }
            if ((fVar instanceof j) && (shortcutIconResource = (jVar = (j) fVar).f57323y) != null) {
                if (shortcutIconResource.packageName == null) {
                    Intent intent = new Intent("android.intent.action.MAIN", (Uri) null);
                    intent.addCategory("android.intent.category.LAUNCHER");
                    intent.setComponent(ComponentName.unflattenFromString(jVar.f57323y.resourceName));
                    LauncherActivityInfo launcherActivityInfoResolveActivity = ((LauncherApps) context.getSystemService(LauncherApps.class)).resolveActivity(intent, jVar.o);
                    j jVar3 = new j();
                    jVar3.f57322x = intent;
                    if (launcherActivityInfoResolveActivity != null) {
                        d0Var.r(jVar3, launcherActivityInfoResolveActivity, false);
                        if (!jVar3.f57304r.e()) {
                            jVar.f57304r = jVar3.f57304r;
                            g0VarW.D();
                            return true;
                        }
                    }
                }
                BitmapInfo bitmapInfoK = ((k0) g0VarW).K(jVar.f57323y, !jVar.f57303q.d());
                if (bitmapInfoK != null) {
                    jVar.f57304r = bitmapInfoK;
                    g0VarW.D();
                    return true;
                }
            }
            if (bArr == null) {
                g0VarW.D();
                return false;
            }
            try {
                fVar.f57304r = g0VarW.h(BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
                g0VarW.D();
                return true;
            } catch (Exception e3) {
                Log.e("IconRequestInfo", "Failed to decode byte array for info " + fVar, e3);
                g0VarW.D();
                return false;
            }
        } catch (Throwable th2) {
            try {
                g0VarW.D();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public d(f fVar, LauncherActivityInfo launcherActivityInfo, String str, String str2, byte[] bArr, boolean z11, String str3, String str4) {
        this.f57281a = fVar;
        this.f57282b = launcherActivityInfo;
        this.f57283c = str;
        this.f57284d = str2;
        this.f57285e = bArr;
        this.f57286f = z11;
        this.f57287g = str3;
        this.f57288h = str4;
    }
}
