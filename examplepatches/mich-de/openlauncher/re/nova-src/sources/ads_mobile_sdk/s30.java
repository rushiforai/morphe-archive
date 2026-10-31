package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum s30 implements b.e5 {
    SAFE(0),
    DANGEROUS(1),
    UNCOMMON(2),
    POTENTIALLY_UNWANTED(3),
    DANGEROUS_HOST(4),
    UNKNOWN(5),
    PLAY_POLICY_VIOLATION_SEVERE(6),
    PLAY_POLICY_VIOLATION_OTHER(7),
    DANGEROUS_ACCOUNT_COMPROMISE(8),
    PENDING(9),
    PLAY_POLICY_VIOLATION_TREATMENT_ON_DEVICE(10),
    HIGH_RISK_BLOCK(11),
    HIGH_RISK_WARN(12),
    PROBABLY_BAD(13),
    VERDICT_UNSPECIFIED(15),
    VERIFIER_APP_VERIFICATION_FAILED(16),
    VERIFIER_APP_VERIFICATION_INCONCLUSIVE_SYSTEM_ERROR(18),
    VERIFIER_APP_VERIFICATION_INCONCLUSIVE_NETWORK_ERROR(19),
    UNCOMMON_APP(20),
    UNVERIFIED_FEATURE_ONE_INSTALL_ATTEMPT(21),
    DPC_NOT_ALLOWLISTED(22),
    FEATURE_ONE_HARMFUL_CONTENT(23),
    SAFE_VERDICT_STALE(24);


    /* renamed from: a, reason: collision with root package name */
    public final int f9406a;

    s30(int i5) {
        this.f9406a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f9406a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(s30.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f9406a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
