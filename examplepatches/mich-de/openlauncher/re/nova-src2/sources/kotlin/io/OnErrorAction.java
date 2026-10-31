package kotlin.io;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/io/OnErrorAction;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class OnErrorAction {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ OnErrorAction[] f71834a;

    static {
        OnErrorAction[] onErrorActionArr = {new OnErrorAction("SKIP", 0), new OnErrorAction("TERMINATE", 1)};
        f71834a = onErrorActionArr;
        EnumEntriesKt.a(onErrorActionArr);
    }

    public static OnErrorAction valueOf(String str) {
        return (OnErrorAction) Enum.valueOf(OnErrorAction.class, str);
    }

    public static OnErrorAction[] values() {
        return (OnErrorAction[]) f71834a.clone();
    }
}
