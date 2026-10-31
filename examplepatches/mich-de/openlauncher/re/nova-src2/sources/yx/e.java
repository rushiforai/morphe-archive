package yx;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e f97692a;

    /* renamed from: b, reason: collision with root package name */
    public static final e f97693b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f97694c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ e[] f97695d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f97696e;

    static {
        e eVar = new e("NONE", 0);
        f97692a = eVar;
        e eVar2 = new e("NOVA", 1);
        f97693b = eVar2;
        e eVar3 = new e(NativeAdContent.ViewTag.OTHER, 2);
        f97694c = eVar3;
        e[] eVarArr = {eVar, eVar2, eVar3};
        f97695d = eVarArr;
        f97696e = EnumEntriesKt.a(eVarArr);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f97695d.clone();
    }
}
