package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d {

    /* renamed from: b, reason: collision with root package name */
    public static final d f55924b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f55925c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f55926d;

    /* renamed from: e, reason: collision with root package name */
    public static final d f55927e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ d[] f55928f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55929g;

    /* renamed from: a, reason: collision with root package name */
    public final String f55930a;

    static {
        d dVar = new d("OnSession", 0, "on_session");
        f55924b = dVar;
        d dVar2 = new d("OffSession", 1, "off_session");
        f55925c = dVar2;
        d dVar3 = new d("Blank", 2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f55926d = dVar3;
        d dVar4 = new d("None", 3, "none");
        f55927e = dVar4;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4};
        f55928f = dVarArr;
        f55929g = EnumEntriesKt.a(dVarArr);
    }

    public d(String str, int i5, String str2) {
        this.f55930a = str2;
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f55928f.clone();
    }
}
