package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f78250b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b0[] f78251c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f78252d;

    /* renamed from: a, reason: collision with root package name */
    public final String f78253a;

    static {
        b0 b0Var = new b0(0, "MAX_AD_CONTENT_RATING_UNSPECIFIED", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f78250b = b0Var;
        b0[] b0VarArr = {b0Var, new b0(1, "MAX_AD_CONTENT_RATING_G", "G"), new b0(2, "MAX_AD_CONTENT_RATING_PG", "PG"), new b0(3, "MAX_AD_CONTENT_RATING_T", "T"), new b0(4, "MAX_AD_CONTENT_RATING_MA", "MA")};
        f78251c = b0VarArr;
        f78252d = EnumEntriesKt.a(b0VarArr);
    }

    public b0(int i5, String str, String str2) {
        this.f78253a = str2;
    }

    public static b0[] values() {
        return (b0[]) f78251c.clone();
    }
}
