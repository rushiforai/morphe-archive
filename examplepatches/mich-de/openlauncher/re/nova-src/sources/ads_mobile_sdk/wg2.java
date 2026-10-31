package ads_mobile_sdk;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;

/* loaded from: classes2.dex */
public enum wg2 implements b.e5 {
    USER_POPULATION_UNSPECIFIED(0),
    CARTER_SB_CHROME_INTERSTITIAL(1),
    GMAIL_PHISHY_JOURNEY(2),
    DOWNLOAD_RELATED_POPULATION_MIN(1000),
    RISKY_DOWNLOADER(1001),
    INFREQUENT_DOWNLOADER(1002),
    REGULAR_DOWNLOADER(BackupConstant.SCENE_CLOSED_WITHOUT_SHOW),
    BOTLIKE_DOWNLOADER(1004),
    DOCUMENT_DOWNLOADER(1005),
    HIGHLY_TECHNICAL_DOWNLOADER(1006),
    LOW_DOWNLOAD_WARNING_CLICK_THROUGH_RATE(1007),
    HIGH_DOWNLOAD_WARNING_CLICK_THROUGH_RATE(1008),
    SPAM_PING_SENDER(1009),
    RFA_TRUSTED(TTAdConstant.IMAGE_MODE_1010),
    DOWNLOAD_RELATED_POPULATION_MAX(1999);


    /* renamed from: a, reason: collision with root package name */
    public final int f11287a;

    wg2(int i5) {
        this.f11287a = i5;
    }

    public static wg2 a(int i5) {
        if (i5 == 0) {
            return USER_POPULATION_UNSPECIFIED;
        }
        if (i5 == 1) {
            return CARTER_SB_CHROME_INTERSTITIAL;
        }
        if (i5 == 2) {
            return GMAIL_PHISHY_JOURNEY;
        }
        if (i5 == 1999) {
            return DOWNLOAD_RELATED_POPULATION_MAX;
        }
        switch (i5) {
            case 1000:
                return DOWNLOAD_RELATED_POPULATION_MIN;
            case 1001:
                return RISKY_DOWNLOADER;
            case 1002:
                return INFREQUENT_DOWNLOADER;
            case BackupConstant.SCENE_CLOSED_WITHOUT_SHOW /* 1003 */:
                return REGULAR_DOWNLOADER;
            case 1004:
                return BOTLIKE_DOWNLOADER;
            case 1005:
                return DOCUMENT_DOWNLOADER;
            case 1006:
                return HIGHLY_TECHNICAL_DOWNLOADER;
            case 1007:
                return LOW_DOWNLOAD_WARNING_CLICK_THROUGH_RATE;
            case 1008:
                return HIGH_DOWNLOAD_WARNING_CLICK_THROUGH_RATE;
            case 1009:
                return SPAM_PING_SENDER;
            case TTAdConstant.IMAGE_MODE_1010 /* 1010 */:
                return RFA_TRUSTED;
            default:
                return null;
        }
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f11287a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "<" + wg2.class.getName() + '@' + Integer.toHexString(System.identityHashCode(this)) + " number=" + this.f11287a + " name=" + name() + '>';
    }
}
