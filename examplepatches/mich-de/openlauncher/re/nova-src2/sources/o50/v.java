package o50;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v implements Comparable {

    /* renamed from: c, reason: collision with root package name */
    public static final v f79594c;

    /* renamed from: d, reason: collision with root package name */
    public static final v f79595d;

    /* renamed from: e, reason: collision with root package name */
    public static final v f79596e;

    /* renamed from: f, reason: collision with root package name */
    public static final v f79597f;

    /* renamed from: g, reason: collision with root package name */
    public static final v f79598g;

    /* renamed from: h, reason: collision with root package name */
    public static final v f79599h;

    /* renamed from: i, reason: collision with root package name */
    public static final v f79600i;

    /* renamed from: j, reason: collision with root package name */
    public static final v f79601j;

    /* renamed from: k, reason: collision with root package name */
    public static final v f79602k;

    /* renamed from: l, reason: collision with root package name */
    public static final v f79603l;

    /* renamed from: m, reason: collision with root package name */
    public static final v f79604m;
    public static final v n;
    public static final List o;

    /* renamed from: p, reason: collision with root package name */
    public static final LinkedHashMap f79605p;

    /* renamed from: a, reason: collision with root package name */
    public final int f79606a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79607b;

    static {
        v vVar = new v(100, "Continue");
        v vVar2 = new v(101, "Switching Protocols");
        v vVar3 = new v(102, "Processing");
        v vVar4 = new v(200, "OK");
        f79594c = vVar4;
        v vVar5 = new v(201, "Created");
        v vVar6 = new v(Sdk.SDKError.Reason.AD_CONSUMED_VALUE, "Accepted");
        v vVar7 = new v(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, "Non-Authoritative Information");
        v vVar8 = new v(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, "No Content");
        f79595d = vVar8;
        v vVar9 = new v(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, "Reset Content");
        v vVar10 = new v(Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, "Partial Content");
        v vVar11 = new v(Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, "Multi-Status");
        v vVar12 = new v(300, "Multiple Choices");
        v vVar13 = new v(301, "Moved Permanently");
        f79596e = vVar13;
        v vVar14 = new v(302, "Found");
        f79597f = vVar14;
        v vVar15 = new v(303, "See Other");
        f79598g = vVar15;
        v vVar16 = new v(Sdk.SDKError.Reason.AD_EXPIRED_VALUE, "Not Modified");
        f79599h = vVar16;
        v vVar17 = new v(Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, "Use Proxy");
        v vVar18 = new v(306, "Switch Proxy");
        v vVar19 = new v(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, "Temporary Redirect");
        f79600i = vVar19;
        v vVar20 = new v(Sdk.SDKError.Reason.AD_WIN_NOTIFICATION_ERROR_VALUE, "Permanent Redirect");
        f79601j = vVar20;
        v vVar21 = new v(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, "Bad Request");
        f79602k = vVar21;
        v vVar22 = new v(TTAdConstant.MATE_IS_NULL_CODE, "Unauthorized");
        v vVar23 = new v(TTAdConstant.AD_ID_IS_NULL_CODE, "Payment Required");
        v vVar24 = new v(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, "Forbidden");
        v vVar25 = new v(TTAdConstant.DEEPLINK_FALLBACK_CODE, "Not Found");
        f79603l = vVar25;
        v vVar26 = new v(TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE, "Method Not Allowed");
        v vVar27 = new v(TTAdConstant.LANDING_PAGE_TYPE_CODE, "Not Acceptable");
        v vVar28 = new v(TTAdConstant.DOWNLOAD_APP_INFO_CODE, "Proxy Authentication Required");
        v vVar29 = new v(TTAdConstant.DOWNLOAD_URL_CODE, "Request Timeout");
        f79604m = vVar29;
        v vVar30 = new v(TTAdConstant.IMAGE_LIST_CODE, "Conflict");
        v vVar31 = new v(TTAdConstant.IMAGE_LIST_SIZE_CODE, "Gone");
        v vVar32 = new v(TTAdConstant.IMAGE_CODE, "Length Required");
        v vVar33 = new v(TTAdConstant.IMAGE_URL_CODE, "Precondition Failed");
        v vVar34 = new v(TTAdConstant.VIDEO_INFO_CODE, "Payload Too Large");
        v vVar35 = new v(TTAdConstant.VIDEO_URL_CODE, "Request-URI Too Long");
        v vVar36 = new v(TTAdConstant.VIDEO_COVER_URL_CODE, "Unsupported Media Type");
        v vVar37 = new v(TTAdConstant.PACKAGE_NAME_CODE, "Requested Range Not Satisfiable");
        v vVar38 = new v(TTAdConstant.DOWNLOAD_URL_AND_PACKAGE_NAME, "Expectation Failed");
        v vVar39 = new v(422, "Unprocessable Entity");
        v vVar40 = new v(423, "Locked");
        v vVar41 = new v(424, "Failed Dependency");
        v vVar42 = new v(425, "Too Early");
        v vVar43 = new v(426, "Upgrade Required");
        v vVar44 = new v(429, "Too Many Requests");
        n = vVar44;
        List listQ = ul.b.Q(vVar, vVar2, vVar3, vVar4, vVar5, vVar6, vVar7, vVar8, vVar9, vVar10, vVar11, vVar12, vVar13, vVar14, vVar15, vVar16, vVar17, vVar18, vVar19, vVar20, vVar21, vVar22, vVar23, vVar24, vVar25, vVar26, vVar27, vVar28, vVar29, vVar30, vVar31, vVar32, vVar33, vVar34, vVar35, vVar36, vVar37, vVar38, vVar39, vVar40, vVar41, vVar42, vVar43, vVar44, new v(431, "Request Header Fields Too Large"), new v(500, "Internal Server Error"), new v(PglCryptUtils.LOAD_SO_FAILED, "Not Implemented"), new v(PglCryptUtils.INPUT_INVALID, "Bad Gateway"), new v(PglCryptUtils.COMPRESS_FAILED, "Service Unavailable"), new v(PglCryptUtils.BASE64_FAILED, "Gateway Timeout"), new v(PglCryptUtils.ENCRYPT_FAILED, "HTTP Version Not Supported"), new v(PglCryptUtils.DECRYPT_FAILED, "Variant Also Negotiates"), new v(PglCryptUtils.UNKNOWN_ERR, "Insufficient Storage"));
        o = listQ;
        List list = listQ;
        int iD0 = b70.k.d0(b70.c.u0(list, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (Object obj : list) {
            linkedHashMap.put(Integer.valueOf(((v) obj).f79606a), obj);
        }
        f79605p = linkedHashMap;
    }

    public v(int i5, String str) {
        this.f79606a = i5;
        this.f79607b = str;
    }

    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(v other) {
        Intrinsics.g(other, "other");
        return this.f79606a - other.f79606a;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof v) && ((v) obj).f79606a == this.f79606a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f79606a);
    }

    public final String toString() {
        return this.f79606a + ' ' + this.f79607b;
    }
}
