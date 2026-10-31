package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum f50 implements b.e5 {
    UNKNOWN(0),
    URL_PHISHING(1),
    URL_MALWARE(2),
    URL_UNWANTED(3),
    CLIENT_SIDE_PHISHING_URL(4),
    CLIENT_SIDE_MALWARE_URL(5),
    DANGEROUS_DOWNLOAD_RECOVERY(6),
    DANGEROUS_DOWNLOAD_WARNING(7),
    OCTAGON_AD(8),
    OCTAGON_AD_SB_MATCH(9),
    DANGEROUS_DOWNLOAD_BY_API(10),
    OCTAGON_IOS_AD(11),
    PASSWORD_PROTECTION_PHISHING_URL(12),
    DANGEROUS_DOWNLOAD_OPENED(13),
    AD_SAMPLE(14),
    URL_SUSPICIOUS(15),
    BILLING(16),
    APK_DOWNLOAD(17),
    BLOCKED_AD_DRIVE_BY_DOWNLOAD(18),
    BLOCKED_AD_REDIRECT(19),
    BLOCKED_AD_POPUP(20),
    HASH_PREFIX_REAL_TIME_EXPERIMENT(21),
    PHISHY_SITE_INTERACTIONS(22),
    WARNING_SHOWN(23),
    NOTIFICATION_PERMISSION_ACCEPTED(24),
    DANGEROUS_DOWNLOAD_AUTO_DELETED(25),
    DANGEROUS_DOWNLOAD_PROFILE_CLOSED(26),
    URL_REALTIME_AND_HASH_REALTIME_DISCREPANCY(27),
    EXTERNAL_APP_REDIRECT(28),
    DANGEROUS_DOWNLOAD_WARNING_ANDROID(29),
    SERVICE_WORKER_BEHAVIOR(30),
    OCTAGON_AD_UNTRUSTED_DOMAIN(31);


    /* renamed from: a, reason: collision with root package name */
    public final int f3204a;

    f50(int i5) {
        this.f3204a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f3204a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(f50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f3204a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
