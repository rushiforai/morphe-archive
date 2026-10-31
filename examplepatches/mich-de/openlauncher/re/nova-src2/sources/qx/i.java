package qx;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final o7.a f84509a;

    /* renamed from: b, reason: collision with root package name */
    public static final i f84510b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f84511c;

    /* renamed from: d, reason: collision with root package name */
    public static final i f84512d;

    /* renamed from: e, reason: collision with root package name */
    public static final i f84513e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i[] f84514f;

    static {
        i iVar = new i("NONE", 0);
        f84510b = iVar;
        i iVar2 = new i("NATIVE", 1);
        f84511c = iVar2;
        i iVar3 = new i(NativeAdContent.ViewTag.AD_ICON, 2);
        f84512d = iVar3;
        i iVar4 = new i("ICON_ROW", 3);
        f84513e = iVar4;
        i[] iVarArr = {iVar, iVar2, iVar3, iVar4};
        f84514f = iVarArr;
        EnumEntriesKt.a(iVarArr);
        f84509a = new o7.a(4);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f84514f.clone();
    }
}
