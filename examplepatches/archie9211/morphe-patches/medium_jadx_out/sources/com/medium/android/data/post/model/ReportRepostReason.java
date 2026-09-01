package com.medium.android.data.post.model;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000b¨\u0006\f"}, d2 = {"Lcom/medium/android/data/post/model/ReportRepostReason;", "", "apiValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getApiValue", "()Ljava/lang/String;", "HARASSMENT", "RULES_VIOLATION", "SPAM", "AI_GENERATED_CONTENT", "data_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReportRepostReason {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ReportRepostReason[] $VALUES;
    private final String apiValue;
    public static final ReportRepostReason HARASSMENT = new ReportRepostReason("HARASSMENT", 0, "Harassment");
    public static final ReportRepostReason RULES_VIOLATION = new ReportRepostReason("RULES_VIOLATION", 1, "InappropriateContent");
    public static final ReportRepostReason SPAM = new ReportRepostReason("SPAM", 2, "Spam");
    public static final ReportRepostReason AI_GENERATED_CONTENT = new ReportRepostReason("AI_GENERATED_CONTENT", 3, "AIGenerated");

    private static final /* synthetic */ ReportRepostReason[] $values() {
        return new ReportRepostReason[]{HARASSMENT, RULES_VIOLATION, SPAM, AI_GENERATED_CONTENT};
    }

    static {
        ReportRepostReason[] reportRepostReasonArr$values = $values();
        $VALUES = reportRepostReasonArr$values;
        $ENTRIES = rv8.x(reportRepostReasonArr$values);
    }

    private ReportRepostReason(String str, int i, String str2) {
        this.apiValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ReportRepostReason valueOf(String str) {
        return (ReportRepostReason) Enum.valueOf(ReportRepostReason.class, str);
    }

    public static ReportRepostReason[] values() {
        return (ReportRepostReason[]) $VALUES.clone();
    }

    public final String getApiValue() {
        return this.apiValue;
    }
}
