package fr;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import java.util.Map;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: g, reason: collision with root package name */
    public static volatile UUID f55586g;

    /* renamed from: h, reason: collision with root package name */
    public static final String f55587h;

    /* renamed from: i, reason: collision with root package name */
    public static final ep.c f55588i;

    /* renamed from: a, reason: collision with root package name */
    public final PackageManager f55589a;

    /* renamed from: b, reason: collision with root package name */
    public final PackageInfo f55590b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55591c;

    /* renamed from: d, reason: collision with root package name */
    public final w60.a f55592d;

    /* renamed from: e, reason: collision with root package name */
    public final w60.a f55593e;

    /* renamed from: f, reason: collision with root package name */
    public final w60.a f55594f;

    static {
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        f55586g = uuidRandomUUID;
        f55587h = Build.MANUFACTURER + "_" + Build.BRAND + "_" + Build.MODEL;
        f55588i = new ep.c(21);
    }

    public c(PackageManager packageManager, PackageInfo packageInfo, String str, w60.a aVar, w60.a aVar2) {
        ep.c pluginTypeProvider = f55588i;
        Intrinsics.g(pluginTypeProvider, "pluginTypeProvider");
        this.f55589a = packageManager;
        this.f55590b = packageInfo;
        this.f55591c = str;
        this.f55592d = aVar;
        this.f55593e = aVar2;
        this.f55594f = pluginTypeProvider;
    }

    public abstract b a(a aVar, Map map);
}
