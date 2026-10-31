package com.teslacoilsw.launcher.icon;

import aa.g0;
import android.content.Context;
import android.content.pm.LauncherActivityInfo;
import android.graphics.drawable.Drawable;
import android.os.Process;
import b70.h;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.icons.LauncherActivityCachingLogic;
import com.android.launcher3.util.ComponentKey;
import fz.d0;
import java.util.Map;
import jz.i;
import jz.j;
import kotlin.Metadata;
import kotlin.jdk7.AutoCloseableKt;
import mx.k0;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/teslacoilsw/launcher/icon/NovaLauncherActivityCachingLogic;", "Lcom/android/launcher3/icons/LauncherActivityCachingLogic;", "Lfz/d0;", "iconCache", "<init>", "(Lfz/d0;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class NovaLauncherActivityCachingLogic extends LauncherActivityCachingLogic {

    /* renamed from: a, reason: collision with root package name */
    public final d0 f45771a;

    /* renamed from: b, reason: collision with root package name */
    public Map f45772b = h.f17594a;

    public NovaLauncherActivityCachingLogic(@NotNull d0 d0Var) {
        this.f45771a = d0Var;
    }

    @Override // com.android.launcher3.icons.LauncherActivityCachingLogic, ba.d
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final CharSequence d(LauncherActivityInfo launcherActivityInfo) {
        String str;
        c00.b bVar = (c00.b) this.f45772b.get(new ComponentKey(launcherActivityInfo.getComponentName(), launcherActivityInfo.getUser()));
        return (bVar == null || (str = bVar.f19039b) == null) ? launcherActivityInfo.getLabel() : str;
    }

    @Override // com.android.launcher3.icons.LauncherActivityCachingLogic, ba.d
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final BitmapInfo e(Context context, LauncherActivityInfo launcherActivityInfo) {
        Drawable drawableC;
        NovaIconSource novaIconSource;
        d0 d0Var = this.f45771a;
        k0 k0Var = (k0) g0.A(context, d0Var.f56214w);
        c00.b bVar = (c00.b) this.f45772b.get(new ComponentKey(launcherActivityInfo.getComponentName(), launcherActivityInfo.getUser()));
        if (bVar != null) {
            ea.b.a("NovaCachingLogic", "loadIcon '" + new ComponentKey(launcherActivityInfo.getComponentName(), launcherActivityInfo.getUser()) + "' " + bVar);
        }
        if (bVar == null || (novaIconSource = bVar.f19040c) == null || (drawableC = novaIconSource.d(context)) == null) {
            drawableC = d0Var.O().c(launcherActivityInfo, k0Var.f550g);
        }
        if (bVar != null && bVar.f19041d.d()) {
            if (drawableC instanceof i) {
                ((i) drawableC).l();
            } else {
                drawableC = new j(drawableC, false);
            }
        }
        try {
            BitmapInfo bitmapInfoC = k0Var.c(drawableC, (bVar == null || !bVar.f19041d.c()) ? launcherActivityInfo.getUser() : Process.myUserHandle(), launcherActivityInfo.getApplicationInfo().targetSdkVersion);
            AutoCloseableKt.a(k0Var, null);
            return bitmapInfoC;
        } finally {
        }
    }
}
