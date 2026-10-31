package ads_mobile_sdk;

/* loaded from: classes2.dex */
public final class ad implements b.x5 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f923b;

    /* renamed from: a, reason: collision with root package name */
    public static final ad f922a = new ad(0);
    public static final ad a$1 = new ad(1);
    public static final ad a$2 = new ad(2);
    public static final ad a$3 = new ad(3);
    public static final ad a$4 = new ad(4);
    public static final ad a$5 = new ad(5);
    public static final ad a$6 = new ad(6);
    public static final ad a$7 = new ad(7);
    public static final ad a$8 = new ad(8);
    public static final ad a$9 = new ad(9);
    public static final ad a$10 = new ad(10);
    public static final ad a$11 = new ad(11);
    public static final ad a$12 = new ad(12);
    public static final ad a$13 = new ad(13);
    public static final ad a$14 = new ad(14);
    public static final ad a$15 = new ad(15);
    public static final ad a$16 = new ad(16);
    public static final ad a$17 = new ad(17);
    public static final ad a$18 = new ad(18);
    public static final ad a$19 = new ad(19);
    public static final ad a$20 = new ad(20);
    public static final ad a$21 = new ad(21);
    public static final ad a$22 = new ad(22);
    public static final ad a$23 = new ad(23);
    public static final ad a$24 = new ad(24);

    public /* synthetic */ ad(int i5) {
        this.f923b = i5;
    }

    @Override // b.x5
    public final boolean a(int i5) {
        dd ddVar;
        s30 s30Var;
        switch (this.f923b) {
            case 0:
                if (a80.m._a(i5) != 0) {
                }
                break;
            case 1:
                if (a80.m._a$1(i5) != 0) {
                }
                break;
            case 2:
                switch (i5) {
                    case 0:
                        ddVar = dd.NETWORK_INTERFACE_UNSPECIFIED;
                        break;
                    case 1:
                        ddVar = dd.NETWORK_INTERFACE_NOT_SET;
                        break;
                    case 2:
                        ddVar = dd.NETWORK_INTERFACE_ERROR;
                        break;
                    case 3:
                        ddVar = dd.NETWORK_INTERFACE_WIFI;
                        break;
                    case 4:
                        ddVar = dd.NETWORK_INTERFACE_CELLULAR;
                        break;
                    case 5:
                        ddVar = dd.NETWORK_INTERFACE_ETHERNET;
                        break;
                    case 6:
                        ddVar = dd.NETWORK_INTERFACE_LOOPBACK;
                        break;
                    case 7:
                        ddVar = dd.NETWORK_INTERFACE_OTHER;
                        break;
                    case 8:
                        ddVar = dd.NETWORK_INTERFACE_NO_CONNECTION;
                        break;
                    default:
                        ddVar = null;
                        break;
                }
                if (ddVar != null) {
                }
                break;
            case 3:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4) {
                }
                break;
            case 4:
                if (fk.a(i5) != null) {
                }
                break;
            case 5:
                switch (i5) {
                }
            case 6:
                if (a80.m._a$2(i5) != 0) {
                }
                break;
            case 7:
                if (i5 == 0 || i5 == 1 || i5 == 2) {
                }
                break;
            case 8:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3) {
                }
                break;
            case 9:
                switch (i5) {
                }
            case 10:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? null : n30.TAILORED_WARNING_SUSPICIOUS : n30.TAILORED_WARNING_SUSPICIOUS_BASE : n30.TAILORED_WARNING_CT_ACCOUNT_INFO : n30.TAILORED_WARNING_CT : n30.TAILORED_WARNING_CT_BASE : n30.UNSPECIFIED) != null) {
                }
                break;
            case 11:
                switch (i5) {
                }
            case 12:
                switch (i5) {
                }
            case 13:
                if (i5 == 0 || i5 == 1 || i5 == 2) {
                }
                break;
            case 14:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3) {
                }
                break;
            case 15:
                if ((i5 != 0 ? i5 != 1 ? null : pc.FALLBACK_TIMEOUT : pc.FALLBACK_NONE) != null) {
                }
                break;
            case 16:
                if (i5 != 200 && i5 != 201 && i5 != 0 && i5 != 1 && i5 != 2 && i5 != 3 && i5 != 4 && i5 != 5) {
                    switch (i5) {
                    }
                }
                break;
            case 17:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4) {
                }
                break;
            case 18:
                switch (i5) {
                    case 0:
                        s30Var = s30.SAFE;
                        break;
                    case 1:
                        s30Var = s30.DANGEROUS;
                        break;
                    case 2:
                        s30Var = s30.UNCOMMON;
                        break;
                    case 3:
                        s30Var = s30.POTENTIALLY_UNWANTED;
                        break;
                    case 4:
                        s30Var = s30.DANGEROUS_HOST;
                        break;
                    case 5:
                        s30Var = s30.UNKNOWN;
                        break;
                    case 6:
                        s30Var = s30.PLAY_POLICY_VIOLATION_SEVERE;
                        break;
                    case 7:
                        s30Var = s30.PLAY_POLICY_VIOLATION_OTHER;
                        break;
                    case 8:
                        s30Var = s30.DANGEROUS_ACCOUNT_COMPROMISE;
                        break;
                    case 9:
                        s30Var = s30.PENDING;
                        break;
                    case 10:
                        s30Var = s30.PLAY_POLICY_VIOLATION_TREATMENT_ON_DEVICE;
                        break;
                    case 11:
                        s30Var = s30.HIGH_RISK_BLOCK;
                        break;
                    case 12:
                        s30Var = s30.HIGH_RISK_WARN;
                        break;
                    case 13:
                        s30Var = s30.PROBABLY_BAD;
                        break;
                    case 14:
                    case 17:
                    default:
                        s30Var = null;
                        break;
                    case 15:
                        s30Var = s30.VERDICT_UNSPECIFIED;
                        break;
                    case 16:
                        s30Var = s30.VERIFIER_APP_VERIFICATION_FAILED;
                        break;
                    case 18:
                        s30Var = s30.VERIFIER_APP_VERIFICATION_INCONCLUSIVE_SYSTEM_ERROR;
                        break;
                    case 19:
                        s30Var = s30.VERIFIER_APP_VERIFICATION_INCONCLUSIVE_NETWORK_ERROR;
                        break;
                    case 20:
                        s30Var = s30.UNCOMMON_APP;
                        break;
                    case 21:
                        s30Var = s30.UNVERIFIED_FEATURE_ONE_INSTALL_ATTEMPT;
                        break;
                    case 22:
                        s30Var = s30.DPC_NOT_ALLOWLISTED;
                        break;
                    case 23:
                        s30Var = s30.FEATURE_ONE_HARMFUL_CONTENT;
                        break;
                    case 24:
                        s30Var = s30.SAFE_VERDICT_STALE;
                        break;
                }
                if (s30Var != null) {
                }
                break;
            case 19:
                switch (i5) {
                }
            case 20:
                if ((i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 3 ? null : vs.UNKNOWN : vs.BROTLI : vs.GZIP : vs.NONE) != null) {
                }
                break;
            case 21:
                if (wg2.a(i5) != null) {
                }
                break;
            case 22:
                if (i5 == 0 || i5 == 1 || i5 == 2 || i5 == 3) {
                }
                break;
            case 23:
                switch (i5) {
                }
            default:
                switch (i5) {
                }
        }
        return true;
    }
}
