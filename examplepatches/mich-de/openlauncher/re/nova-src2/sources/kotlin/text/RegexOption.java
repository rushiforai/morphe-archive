package kotlin.text;

import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0086\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/text/RegexOption;", "Lr70/b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class RegexOption implements r70.b {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ RegexOption[] f72028c;

    /* renamed from: a, reason: collision with root package name */
    public final int f72029a;

    /* renamed from: b, reason: collision with root package name */
    public final int f72030b;

    static {
        RegexOption[] regexOptionArr = {new RegexOption("IGNORE_CASE", 0, 2), new RegexOption("MULTILINE", 1, 8), new RegexOption("LITERAL", 2, 16), new RegexOption("UNIX_LINES", 3, 1), new RegexOption("COMMENTS", 4, 4), new RegexOption("DOT_MATCHES_ALL", 5, 32), new RegexOption("CANON_EQ", 6, 128)};
        f72028c = regexOptionArr;
        EnumEntriesKt.a(regexOptionArr);
    }

    public RegexOption(String str, int i5, int i11) {
        this.f72029a = i11;
        this.f72030b = i11;
    }

    public static RegexOption valueOf(String str) {
        return (RegexOption) Enum.valueOf(RegexOption.class, str);
    }

    public static RegexOption[] values() {
        return (RegexOption[]) f72028c.clone();
    }
}
