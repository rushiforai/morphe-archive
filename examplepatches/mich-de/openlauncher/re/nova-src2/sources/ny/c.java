package ny;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ c[] f78679a;

    static {
        c[] cVarArr = {new c("BodyLarge", 0), new c("BodyMedium", 1), new c("BodySmall", 2), new c("DisplayLarge", 3), new c("DisplayMedium", 4), new c("DisplaySmall", 5), new c("HeadlineLarge", 6), new c("HeadlineMedium", 7), new c("HeadlineSmall", 8), new c("LabelLarge", 9), new c("LabelMedium", 10), new c("LabelSmall", 11), new c("TitleLarge", 12), new c("TitleMedium", 13), new c("TitleSmall", 14)};
        f78679a = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f78679a.clone();
    }
}
