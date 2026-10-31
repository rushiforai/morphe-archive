package wv;

import kotlin.enums.EnumEntriesKt;
import vu.q;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final q f94742b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o[] f94743c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f94744d;

    /* renamed from: a, reason: collision with root package name */
    public final String f94745a;

    static {
        o[] oVarArr = {new o("VerificationSuccessful", 0, "Y"), new o("VerificationDenied", 1, "N"), new o("VerificationNotPerformed", 2, "U"), new o("VerificationAttempted", 3, "A"), new o("ChallengeAdditionalAuth", 4, "C"), new o("ChallengeDecoupledAuth", 5, "D"), new o("VerificationRejected", 6, "R"), new o("InformationOnly", 7, "I")};
        f94743c = oVarArr;
        f94744d = EnumEntriesKt.a(oVarArr);
        f94742b = new q();
    }

    public o(String str, int i5, String str2) {
        this.f94745a = str2;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f94743c.clone();
    }
}
