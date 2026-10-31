package dx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public static final u f49794a;

    /* renamed from: b, reason: collision with root package name */
    public static final u f49795b;

    /* renamed from: c, reason: collision with root package name */
    public static final u f49796c;

    /* renamed from: d, reason: collision with root package name */
    public static final u f49797d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ u[] f49798e;

    static {
        u uVar = new u("Native", 0);
        f49794a = uVar;
        u uVar2 = new u("Banner", 1);
        f49795b = uVar2;
        u uVar3 = new u(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.E, 2);
        f49796c = uVar3;
        u uVar4 = new u("Rewarded", 3);
        f49797d = uVar4;
        u[] uVarArr = {uVar, uVar2, uVar3, uVar4};
        f49798e = uVarArr;
        EnumEntriesKt.a(uVarArr);
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f49798e.clone();
    }
}
