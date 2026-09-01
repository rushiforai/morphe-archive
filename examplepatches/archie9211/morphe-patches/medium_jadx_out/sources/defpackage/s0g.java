package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum s0g {
    GET_BILLING_CONFIG(29, "getBillingConfig"),
    IS_BILLING_PROGRAM_AVAILABLE_ASYNC(33, "isIndirectBillingProgramAvailable"),
    CREATE_BILLING_PROGRAM_REPORTING_DETAILS_ASYNC(35, "createIndirectBillingReportingDetails"),
    GET_BILLING_CHOICE_INFO_ASYNC(40, "getBillingChoiceInfo");

    public final String a;
    public final int b;

    s0g(int i, String str) {
        this.a = str;
        this.b = i;
    }
}
