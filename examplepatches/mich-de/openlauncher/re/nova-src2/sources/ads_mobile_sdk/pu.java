package ads_mobile_sdk;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class pu {

    /* renamed from: a, reason: collision with root package name */
    public static final pu f8384a;

    /* renamed from: b, reason: collision with root package name */
    public static final pu f8385b;

    /* renamed from: c, reason: collision with root package name */
    public static final pu f8386c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ pu[] f8387d;

    static {
        pu puVar = new pu("BACK_BUTTON", 0);
        f8384a = puVar;
        pu puVar2 = new pu("CLOSE_BUTTON", 1);
        f8385b = puVar2;
        pu puVar3 = new pu("CUSTOM", 2);
        f8386c = puVar3;
        pu[] puVarArr = {puVar, puVar2, puVar3, new pu(NativeAdContent.ViewTag.OTHER, 3), new pu("SWIPE_AWAY", 4)};
        f8387d = puVarArr;
        EnumEntriesKt.a(puVarArr);
    }

    public static pu[] values() {
        return (pu[]) f8387d.clone();
    }
}
