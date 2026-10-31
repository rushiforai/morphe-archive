package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k implements c {
    public static final /* synthetic */ k[] G;
    public static final /* synthetic */ EnumEntries H;

    /* renamed from: a, reason: collision with root package name */
    public static final k f38780a = new k("VAST_AD_LOAD_INCOMPLETE_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final k f38781b = new k("VAST_AD_LOAD_XML_PARSE_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final k f38782c = new k("VAST_AD_LOAD_NO_XML_TAG_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final k f38783d = new k("VAST_AD_LOAD_NO_ADS_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final k f38784e = new k("VAST_AD_LOAD_WRAPPER_LIMIT_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final k f38785f = new k("VAST_AD_LOAD_WRAPPER_TIMEOUT_ERROR", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final k f38786g = new k("VAST_AD_LOAD_WRAPPER_FETCH_ERROR", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final k f38787h = new k("VAST_AD_LOAD_INLINE_CREATIVES_EMPTY_ERROR", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final k f38788i = new k("VAST_AD_LOAD_INLINE_CREATIVES_NO_LINEAR_ERROR", 8);

    /* renamed from: j, reason: collision with root package name */
    public static final k f38789j = new k("VAST_AD_LOAD_LINEAR_NOT_SUPPORTED_MEDIA_ERROR", 9);

    /* renamed from: k, reason: collision with root package name */
    public static final k f38790k = new k("VAST_AD_LOAD_MEDIA_FILE_CLIENT_HTTP_ERROR", 10);

    /* renamed from: l, reason: collision with root package name */
    public static final k f38791l = new k("VAST_AD_LOAD_MEDIA_FILE_SERVER_HTTP_ERROR", 11);

    /* renamed from: m, reason: collision with root package name */
    public static final k f38792m = new k("VAST_AD_LOAD_MEDIA_FILE_NO_NETWORK_HTTP_ERROR", 12);
    public static final k n = new k("VAST_AD_LOAD_MEDIA_FILE_UNKNOWN_HOST_HTTP_ERROR", 13);
    public static final k o = new k("VAST_AD_LOAD_MEDIA_FILE_SOCKET_HTTP_ERROR", 14);

    /* renamed from: p, reason: collision with root package name */
    public static final k f38793p = new k("VAST_AD_LOAD_MEDIA_FILE_HTTP_DISK_IO_ERROR", 15);

    /* renamed from: q, reason: collision with root package name */
    public static final k f38794q = new k("VAST_AD_LOAD_MEDIA_FILE_HTTP_DISK_SECURITY_ERROR", 16);

    /* renamed from: r, reason: collision with root package name */
    public static final k f38795r = new k("VAST_AD_LOAD_MEDIA_FILE_HTTP_SSL_ERROR", 17);

    /* renamed from: s, reason: collision with root package name */
    public static final k f38796s = new k("VAST_AD_LOAD_MEDIA_TMP_FILE_NOT_RENAMED_DISK_ERROR", 18);

    /* renamed from: t, reason: collision with root package name */
    public static final k f38797t = new k("VAST_AD_LOAD_MEDIA_FILE_NOT_CREATED_DISK_ERROR", 19);

    /* renamed from: u, reason: collision with root package name */
    public static final k f38798u = new k("VAST_AD_LOAD_MEDIA_FILE_NOT_CREATED_SECURITY_DISK_ERROR", 20);

    /* renamed from: v, reason: collision with root package name */
    public static final k f38799v = new k("VAST_AD_LOAD_MEDIA_FILE_NOT_CREATED_IO_DISK_ERROR", 21);

    /* renamed from: w, reason: collision with root package name */
    public static final k f38800w = new k("VAST_AD_LOAD_MEDIA_FILE_NOT_CREATED_UNKNOWN_DISK_ERROR", 22);

    /* renamed from: x, reason: collision with root package name */
    public static final k f38801x = new k("VAST_AD_LOAD_MEDIA_FILE_TIMEOUT_ERROR", 23);

    /* renamed from: y, reason: collision with root package name */
    public static final k f38802y = new k("VAST_AD_LOAD_MEDIA_FILE_TIMEOUT_NOT_ENOUGH_PLAYABLE_ERROR", 24);

    /* renamed from: z, reason: collision with root package name */
    public static final k f38803z = new k("VAST_AD_LOAD_MEDIA_FILE_UNABLE_TO_DETERMINE_TIMEOUT_ERROR", 25);
    public static final k A = new k("VAST_AD_LOAD_MEDIA_NUMBER_PARSE_ERROR", 26);
    public static final k B = new k("VAST_AD_LOAD_MEDIA_FILE_INVALID_URL_ERROR", 27);
    public static final k C = new k("VAST_AD_LOAD_MEDIA_FILE_NOT_FOUND_ERROR", 28);
    public static final k D = new k("VAST_AD_LOAD_MEDIA_FILE_UNKNOWN_MEDIA_FETCH_ERROR", 29);
    public static final k E = new k("VAST_AD_LOAD_MEDIA_FILE_UNKNOWN_ERROR", 30);
    public static final k F = new k("VAST_AD_LOAD_RENDER_AD_LOAD_ERROR", 31);

    static {
        k[] kVarArrB = b();
        G = kVarArrB;
        H = EnumEntriesKt.a(kVarArrB);
    }

    public k(String str, int i5) {
    }

    public static final /* synthetic */ k[] b() {
        return new k[]{f38780a, f38781b, f38782c, f38783d, f38784e, f38785f, f38786g, f38787h, f38788i, f38789j, f38790k, f38791l, f38792m, n, o, f38793p, f38794q, f38795r, f38796s, f38797t, f38798u, f38799v, f38800w, f38801x, f38802y, f38803z, A, B, C, D, E, F};
    }

    @NotNull
    public static EnumEntries<k> c() {
        return H;
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) G.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }

    public final boolean d() {
        return this == f38801x || this == f38802y || this == f38803z;
    }
}
