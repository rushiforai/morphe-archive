package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class u {

    /* renamed from: b, reason: collision with root package name */
    public static final u f56039b;

    /* renamed from: c, reason: collision with root package name */
    public static final u f56040c;

    /* renamed from: d, reason: collision with root package name */
    public static final u f56041d;

    /* renamed from: e, reason: collision with root package name */
    public static final u f56042e;

    /* renamed from: f, reason: collision with root package name */
    public static final u f56043f;

    /* renamed from: g, reason: collision with root package name */
    public static final u f56044g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ u[] f56045h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56046i;

    /* renamed from: a, reason: collision with root package name */
    public final String f56047a;

    static {
        u uVar = new u("LINK_GLOBAL_HOLD_BACK", 0, "link_global_holdback");
        f56039b = uVar;
        u uVar2 = new u("LINK_GLOBAL_HOLD_BACK_AA", 1, "link_global_holdback_aa");
        f56040c = uVar2;
        u uVar3 = new u("LINK_AB_TEST", 2, "link_ab_test");
        f56041d = uVar3;
        u uVar4 = new u("OCS_MOBILE_HORIZONTAL_MODE_ANDROID_AA", 3, "ocs_mobile_horizontal_mode_android_aa");
        f56042e = uVar4;
        u uVar5 = new u("OCS_MOBILE_HORIZONTAL_MODE_AA", 4, "ocs_mobile_horizontal_mode_aa");
        f56043f = uVar5;
        u uVar6 = new u("OCS_MOBILE_HORIZONTAL_MODE", 5, "ocs_mobile_horizontal_mode");
        f56044g = uVar6;
        u[] uVarArr = {uVar, uVar2, uVar3, uVar4, uVar5, uVar6};
        f56045h = uVarArr;
        f56046i = EnumEntriesKt.a(uVarArr);
    }

    public u(String str, int i5, String str2) {
        this.f56047a = str2;
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f56045h.clone();
    }
}
