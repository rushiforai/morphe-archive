package ou;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class p0 {

    /* renamed from: a, reason: collision with root package name */
    public static final p0 f80954a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ p0[] f80955b;

    static {
        p0 p0Var = new p0("Buy", 0);
        p0 p0Var2 = new p0("Book", 1);
        p0 p0Var3 = new p0(TTContentsEventConstants.ContentsEventName.EVENT_NAME_CHECK_OUT, 2);
        p0 p0Var4 = new p0("Donate", 3);
        p0 p0Var5 = new p0("Order", 4);
        p0 p0Var6 = new p0("Pay", 5);
        f80954a = p0Var6;
        p0[] p0VarArr = {p0Var, p0Var2, p0Var3, p0Var4, p0Var5, p0Var6, new p0("Subscribe", 6), new p0("Plain", 7)};
        f80955b = p0VarArr;
        EnumEntriesKt.a(p0VarArr);
    }

    public static p0 valueOf(String str) {
        return (p0) Enum.valueOf(p0.class, str);
    }

    public static p0[] values() {
        return (p0[]) f80955b.clone();
    }
}
