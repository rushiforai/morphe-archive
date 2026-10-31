package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class hq {

    /* renamed from: a, reason: collision with root package name */
    public static final hq f4478a;

    /* renamed from: b, reason: collision with root package name */
    public static final hq f4479b;

    /* renamed from: c, reason: collision with root package name */
    public static final hq f4480c;

    /* renamed from: d, reason: collision with root package name */
    public static final hq f4481d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ hq[] f4482e;

    static {
        hq hqVar = new hq("PRODUCTION", 0);
        f4478a = hqVar;
        hq hqVar2 = new hq("DEVELOPMENT", 1);
        f4479b = hqVar2;
        hq hqVar3 = new hq("INTEGRATION_TEST", 2);
        f4480c = hqVar3;
        hq hqVar4 = new hq("ROBOLECTRIC_TEST", 3);
        f4481d = hqVar4;
        hq[] hqVarArr = {hqVar, hqVar2, hqVar3, hqVar4};
        f4482e = hqVarArr;
        EnumEntriesKt.a(hqVarArr);
    }

    public static hq[] values() {
        return (hq[]) f4482e.clone();
    }
}
