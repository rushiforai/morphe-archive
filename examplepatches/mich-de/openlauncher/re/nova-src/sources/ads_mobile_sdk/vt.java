package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum vt implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    HYPERACTIVE_BUCKET(0),
    /* JADX INFO: Fake field, exist only in values array */
    REAL_USER_MONITORING(1),
    /* JADX INFO: Fake field, exist only in values array */
    ADSENSE(2),
    /* JADX INFO: Fake field, exist only in values array */
    GPT_PROD_IMPL_CONTEXT(4),
    /* JADX INFO: Fake field, exist only in values array */
    GENOTYPE_OBSERVER(6),
    /* JADX INFO: Fake field, exist only in values array */
    CLIENT_AGE(7),
    /* JADX INFO: Fake field, exist only in values array */
    UNITY_GMA_SDK(8),
    /* JADX INFO: Fake field, exist only in values array */
    GENERATE_BID_LOSS(9),
    /* JADX INFO: Fake field, exist only in values array */
    SCORE_ADS(10),
    /* JADX INFO: Fake field, exist only in values array */
    GPT_LOADER(11),
    /* JADX INFO: Fake field, exist only in values array */
    GPT_LOADER_FOR_NON_GPT_TESTS(18),
    GMA_SDK(12),
    /* JADX INFO: Fake field, exist only in values array */
    GPT_PUB_CONSOLE(14),
    /* JADX INFO: Fake field, exist only in values array */
    ADSHIELD(15),
    /* JADX INFO: Fake field, exist only in values array */
    IMA(16),
    /* JADX INFO: Fake field, exist only in values array */
    HYPERACTIVE_BUCKET(17),
    /* JADX INFO: Fake field, exist only in values array */
    REAL_USER_MONITORING(19),
    /* JADX INFO: Fake field, exist only in values array */
    HYPERACTIVE_BUCKET(20),
    /* JADX INFO: Fake field, exist only in values array */
    UNITY_GMA_SDK(21),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f10892a;

    vt(int i5) {
        this.f10892a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f10892a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(vt.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        if (this != UNRECOGNIZED) {
            sbM.append(" number=");
            sbM.append(getNumber());
        }
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
