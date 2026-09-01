package defpackage;

import com.medium.proto.event.MembershipBillingFrequency;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ew7 {
    public static final ew7 MONTHLY;
    public static final ew7 YEARLY;
    public static final /* synthetic */ ew7[] b;
    public static final /* synthetic */ i04 c;
    public final MembershipBillingFrequency a;

    static {
        ew7 ew7Var = new ew7("YEARLY", 0, MembershipBillingFrequency.YEARLY);
        YEARLY = ew7Var;
        ew7 ew7Var2 = new ew7("MONTHLY", 1, MembershipBillingFrequency.MONTHLY);
        MONTHLY = ew7Var2;
        ew7[] ew7VarArr = {ew7Var, ew7Var2};
        b = ew7VarArr;
        c = new i04(ew7VarArr);
    }

    public ew7(String str, int i, MembershipBillingFrequency membershipBillingFrequency) {
        this.a = membershipBillingFrequency;
    }

    public static g04 getEntries() {
        return c;
    }

    public static ew7 valueOf(String str) {
        return (ew7) Enum.valueOf(ew7.class, str);
    }

    public static ew7[] values() {
        return (ew7[]) b.clone();
    }

    public final MembershipBillingFrequency getValue() {
        return this.a;
    }
}
