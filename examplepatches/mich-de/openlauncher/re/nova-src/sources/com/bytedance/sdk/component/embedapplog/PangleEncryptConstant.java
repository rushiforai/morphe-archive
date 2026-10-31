package com.bytedance.sdk.component.embedapplog;

/* loaded from: classes2.dex */
public class PangleEncryptConstant {
    public static final int DECRYPT = 2;
    public static final int ENCRYPT = 1;
    public static final int REASON_BASE64 = 3;
    public static final int REASON_CRYPT = 2;
    public static final int REASON_GZIP = 1;
    public static final int REASON_PARAMS_ERROR = 4;
    public static final int REASON_SO_LOAD_FAIL = 6;
    public static final int UNKNOWN = 0;

    /* loaded from: classes.dex */
    public enum CryptDataScene {
        UNKNOWN(0),
        SETTINGS(1),
        GET_ADS(2),
        APP_LOG(3),
        STATS_LOG(4),
        REWARD_VERIFY(5),
        DISLIKE(6),
        BIDDING_TOKEN(7),
        DUAL_EVENT(8),
        STRATEGY(9),
        REGISTER_STATUS(10),
        COMPLIANCE_STATUS(11),
        JSB_REQUEST(12);

        private final int value;

        CryptDataScene(int i5) {
            this.value = i5;
        }

        public int value() {
            return this.value;
        }
    }
}
