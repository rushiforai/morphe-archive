package ads_mobile_sdk;

import b.cd;
import b.e9;
import b.t2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;

/* loaded from: classes2.dex */
public final class a41 extends cu0 {
    private static final a41 DEFAULT_INSTANCE;

    /* renamed from: c, reason: collision with root package name */
    public static final int f830c = 1;

    /* renamed from: d, reason: collision with root package name */
    public static final int f831d = 2;

    /* renamed from: e, reason: collision with root package name */
    public static final int f832e = 3;

    /* renamed from: f, reason: collision with root package name */
    public static final int f833f = 13;

    /* renamed from: g, reason: collision with root package name */
    public static final int f834g = 4;

    /* renamed from: h, reason: collision with root package name */
    public static final int f835h = 5;

    /* renamed from: i, reason: collision with root package name */
    public static final int f836i = 6;

    /* renamed from: j, reason: collision with root package name */
    public static final int f837j = 12;

    /* renamed from: k, reason: collision with root package name */
    public static final int f838k = 15;

    /* renamed from: l, reason: collision with root package name */
    public static final int f839l = 7;

    /* renamed from: m, reason: collision with root package name */
    public static final int f840m = 8;
    public static final int n = 14;
    public static final int o = 9;

    /* renamed from: p, reason: collision with root package name */
    public static final int f841p = 10;

    /* renamed from: q, reason: collision with root package name */
    public static final int f842q = 11;
    private int bitField0_;
    private int bucketSize_;
    private int elementMaxLength_;
    private boolean excludeFalse_;
    private boolean excludeTrue_;
    private int maxLength_;
    private int maxSize_;
    private double multiplyingFactor_;
    private int round_;
    private int type_;
    private e9 path_ = in2.f4887e;
    private String urlKey_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String arraySeparator_ = ",";
    private String keyValueSeparator_ = "=";
    private String itemSeparator_ = "&";
    private String captureGroup_ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        a41 a41Var = new a41();
        DEFAULT_INSTANCE = a41Var;
        cu0.a(a41.class, a41Var);
    }

    public final int A() {
        return this.round_;
    }

    public final int B() {
        int i5 = this.type_;
        int i11 = 1;
        if (i5 != 0) {
            if (i5 != 1) {
                i11 = 3;
                if (i5 != 2) {
                    i11 = i5 != 3 ? 0 : 4;
                }
            } else {
                i11 = 2;
            }
        }
        if (i11 == 0) {
            return 5;
        }
        return i11;
    }

    public final String C() {
        return this.urlKey_;
    }

    public final boolean D() {
        return (this.bitField0_ & 64) != 0;
    }

    public final boolean E() {
        return (this.bitField0_ & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0;
    }

    public final boolean F() {
        return (this.bitField0_ & 4) != 0;
    }

    public final boolean G() {
        return (this.bitField0_ & 256) != 0;
    }

    public final boolean H() {
        return (this.bitField0_ & 128) != 0;
    }

    public final boolean I() {
        return (this.bitField0_ & 32) != 0;
    }

    @Override // ads_mobile_sdk.cu0
    public final Object a(int i5, cu0 cu0Var) {
        int iA = t2.a(i5);
        if (iA == 2) {
            return new ps2(DEFAULT_INSTANCE, "\u0004\u000f\u0000\u0001\u0001\u000f\u000f\u0000\u0001\u0000\u0001Ț\u0002ለ\u0000\u0003ဌ\u0001\u0004ဇ\u0003\u0005ဇ\u0004\u0006ဋ\u0005\u0007ဋ\b\bለ\t\tለ\u000b\nለ\f\u000bለ\r\fဋ\u0006\rဋ\u0002\u000eဋ\n\u000fက\u0007", new Object[]{"bitField0_", "path_", "urlKey_", "type_", "excludeTrue_", "excludeFalse_", "round_", "maxSize_", "arraySeparator_", "keyValueSeparator_", "itemSeparator_", "captureGroup_", "bucketSize_", "maxLength_", "elementMaxLength_", "multiplyingFactor_"});
        }
        if (iA == 3) {
            return new a41();
        }
        if (iA != 4) {
            return null;
        }
        return new cd(DEFAULT_INSTANCE);
    }

    public final String o() {
        return this.arraySeparator_;
    }

    public final int p() {
        return this.bucketSize_;
    }

    public final String q() {
        return this.captureGroup_;
    }

    public final int r() {
        return this.elementMaxLength_;
    }

    public final boolean s() {
        return this.excludeFalse_;
    }

    public final boolean t() {
        return this.excludeTrue_;
    }

    public final String u() {
        return this.itemSeparator_;
    }

    public final String v() {
        return this.keyValueSeparator_;
    }

    public final int w() {
        return this.maxLength_;
    }

    public final int x() {
        return this.maxSize_;
    }

    public final double y() {
        return this.multiplyingFactor_;
    }

    public final e9 z() {
        return this.path_;
    }
}
