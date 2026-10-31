package sx;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f87746a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f87747b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f87748c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ b[] f87749d;

    static {
        b bVar = new b("NATIVE", 0);
        f87746a = bVar;
        b bVar2 = new b("BANNER", 1);
        f87747b = bVar2;
        b bVar3 = new b(NativeAdContent.ViewTag.AD_ICON, 2);
        f87748c = bVar3;
        b[] bVarArr = {bVar, bVar2, bVar3, new b("INTERSTITIAL", 3), new b("REWARDED", 4), new b("REWARDED_INTERSTITIAL", 5), new b("APP_OPEN", 6)};
        f87749d = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f87749d.clone();
    }
}
