package zw;

import a80.m;
import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Locale;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class c implements java.io.Serializable {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: t, reason: collision with root package name */
    public static final KSerializer[] f98772t = {null, null, null, null, null, null, null, null, null, null, null, h.Companion.serializer(), f.Companion.serializer(), j.Companion.serializer(), null, null, null, null};

    /* renamed from: a, reason: collision with root package name */
    public final String f98773a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f98774b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f98775c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f98776d;

    /* renamed from: e, reason: collision with root package name */
    public final String f98777e;

    /* renamed from: f, reason: collision with root package name */
    public final String f98778f;

    /* renamed from: g, reason: collision with root package name */
    public final String f98779g;

    /* renamed from: h, reason: collision with root package name */
    public final String f98780h;

    /* renamed from: i, reason: collision with root package name */
    public final String f98781i;

    /* renamed from: j, reason: collision with root package name */
    public final String f98782j;

    /* renamed from: k, reason: collision with root package name */
    public final String f98783k;

    /* renamed from: l, reason: collision with root package name */
    public final h f98784l;

    /* renamed from: m, reason: collision with root package name */
    public final f f98785m;
    public final j n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f98786p;

    /* renamed from: q, reason: collision with root package name */
    public final Function2 f98787q;

    /* renamed from: r, reason: collision with root package name */
    public final long f98788r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f98789s;

    public c(String siteKey, boolean z11, boolean z12, boolean z13, String str, String str2, String str3, String str4, String str5, String str6, String locale, h size, f orientation, j theme, String str7, String str8, Function2 function2, long j11, boolean z14) {
        Intrinsics.g(siteKey, "siteKey");
        Intrinsics.g(locale, "locale");
        Intrinsics.g(size, "size");
        Intrinsics.g(orientation, "orientation");
        Intrinsics.g(theme, "theme");
        this.f98773a = siteKey;
        this.f98774b = z11;
        this.f98775c = z12;
        this.f98776d = z13;
        this.f98777e = str;
        this.f98778f = str2;
        this.f98779g = str3;
        this.f98780h = str4;
        this.f98781i = str5;
        this.f98782j = str6;
        this.f98783k = locale;
        this.f98784l = size;
        this.f98785m = orientation;
        this.n = theme;
        this.o = str7;
        this.f98786p = str8;
        this.f98787q = function2;
        this.f98788r = j11;
        this.f98789s = z14;
    }

    public static c a(c cVar) {
        h hVar = h.f98795b;
        String siteKey = cVar.f98773a;
        boolean z11 = cVar.f98774b;
        boolean z12 = cVar.f98776d;
        String str = cVar.f98777e;
        String jsSrc = cVar.f98778f;
        String str2 = cVar.f98779g;
        String str3 = cVar.f98780h;
        String str4 = cVar.f98781i;
        String str5 = cVar.f98782j;
        String locale = cVar.f98783k;
        f orientation = cVar.f98785m;
        j theme = cVar.n;
        String str6 = cVar.o;
        String str7 = cVar.f98786p;
        Function2 function2 = cVar.f98787q;
        long j11 = cVar.f98788r;
        boolean z13 = cVar.f98789s;
        Intrinsics.g(siteKey, "siteKey");
        Intrinsics.g(jsSrc, "jsSrc");
        Intrinsics.g(locale, "locale");
        Intrinsics.g(orientation, "orientation");
        Intrinsics.g(theme, "theme");
        return new c(siteKey, z11, false, z12, str, jsSrc, str2, str3, str4, str5, locale, hVar, orientation, theme, str6, str7, function2, j11, z13);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f98773a, cVar.f98773a) && this.f98774b == cVar.f98774b && this.f98775c == cVar.f98775c && this.f98776d == cVar.f98776d && Intrinsics.b(this.f98777e, cVar.f98777e) && Intrinsics.b(this.f98778f, cVar.f98778f) && Intrinsics.b(this.f98779g, cVar.f98779g) && Intrinsics.b(this.f98780h, cVar.f98780h) && Intrinsics.b(this.f98781i, cVar.f98781i) && Intrinsics.b(this.f98782j, cVar.f98782j) && Intrinsics.b(this.f98783k, cVar.f98783k) && this.f98784l == cVar.f98784l && this.f98785m == cVar.f98785m && this.n == cVar.n && Intrinsics.b(this.o, cVar.o) && Intrinsics.b(this.f98786p, cVar.f98786p) && Intrinsics.b(this.f98787q, cVar.f98787q) && Duration.d(this.f98788r, cVar.f98788r) && this.f98789s == cVar.f98789s;
    }

    public final int hashCode() {
        int iF = c9.f(c9.f(c9.f(this.f98773a.hashCode() * 31, 31, this.f98774b), 31, this.f98775c), 31, this.f98776d);
        String str = this.f98777e;
        int iE = c0.e((iF + (str == null ? 0 : str.hashCode())) * 31, 31, this.f98778f);
        String str2 = this.f98779g;
        int iHashCode = (iE + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f98780h;
        int iHashCode2 = (iHashCode + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f98781i;
        int iHashCode3 = (iHashCode2 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f98782j;
        int iHashCode4 = (this.n.hashCode() + ((this.f98785m.hashCode() + ((this.f98784l.hashCode() + c0.e((iHashCode3 + (str5 == null ? 0 : str5.hashCode())) * 31, 31, this.f98783k)) * 31)) * 31)) * 31;
        String str6 = this.o;
        int iHashCode5 = (iHashCode4 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f98786p;
        int iHashCode6 = (iHashCode5 + (str7 == null ? 0 : str7.hashCode())) * 31;
        Function2 function2 = this.f98787q;
        int iHashCode7 = function2 != null ? function2.hashCode() : 0;
        Duration.Companion companion = Duration.f72038b;
        return Boolean.hashCode(this.f98789s) + c0.d((iHashCode6 + iHashCode7) * 31, 31, this.f98788r);
    }

    public final String toString() {
        String strR = Duration.r(this.f98788r);
        StringBuilder sb2 = new StringBuilder("HCaptchaConfig(siteKey=");
        sb2.append(this.f98773a);
        sb2.append(", sentry=");
        sb2.append(this.f98774b);
        sb2.append(", loading=");
        m.s(sb2, this.f98775c, ", hideDialog=", this.f98776d, ", rqdata=");
        c0.D(sb2, this.f98777e, ", jsSrc=", this.f98778f, ", endpoint=");
        c0.D(sb2, this.f98779g, ", reportapi=", this.f98780h, ", assethost=");
        c0.D(sb2, this.f98781i, ", imghost=", this.f98782j, ", locale=");
        sb2.append(this.f98783k);
        sb2.append(", size=");
        sb2.append(this.f98784l);
        sb2.append(", orientation=");
        sb2.append(this.f98785m);
        sb2.append(", theme=");
        sb2.append(this.n);
        sb2.append(", host=");
        c0.D(sb2, this.o, ", customTheme=", this.f98786p, ", retryPredicate=");
        sb2.append(this.f98787q);
        sb2.append(", tokenExpiration=");
        sb2.append(strR);
        sb2.append(", disableHardwareAcceleration=");
        return m.k(sb2, this.f98789s, ")");
    }

    public /* synthetic */ c(int i5, String str, boolean z11, boolean z12, boolean z13, String str2, String str3, String str4, String str5, String str6, String str7, String str8, h hVar, f fVar, j jVar, String str9, String str10, Duration duration, boolean z14) {
        long jG;
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, a.f98771a.getDescriptor());
        }
        this.f98773a = str;
        if ((i5 & 2) == 0) {
            this.f98774b = true;
        } else {
            this.f98774b = z11;
        }
        if ((i5 & 4) == 0) {
            this.f98775c = true;
        } else {
            this.f98775c = z12;
        }
        if ((i5 & 8) == 0) {
            this.f98776d = false;
        } else {
            this.f98776d = z13;
        }
        if ((i5 & 16) == 0) {
            this.f98777e = null;
        } else {
            this.f98777e = str2;
        }
        if ((i5 & 32) == 0) {
            this.f98778f = "https://js.hcaptcha.com/1/api.js";
        } else {
            this.f98778f = str3;
        }
        if ((i5 & 64) == 0) {
            this.f98779g = null;
        } else {
            this.f98779g = str4;
        }
        if ((i5 & 128) == 0) {
            this.f98780h = null;
        } else {
            this.f98780h = str5;
        }
        if ((i5 & 256) == 0) {
            this.f98781i = null;
        } else {
            this.f98781i = str6;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f98782j = null;
        } else {
            this.f98782j = str7;
        }
        if ((i5 & 1024) == 0) {
            this.f98783k = Locale.getDefault().getLanguage();
        } else {
            this.f98783k = str8;
        }
        if ((i5 & 2048) == 0) {
            this.f98784l = h.f98795b;
        } else {
            this.f98784l = hVar;
        }
        this.f98785m = (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0 ? f.f98792b : fVar;
        this.n = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0 ? j.f98798b : jVar;
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = null;
        } else {
            this.o = str9;
        }
        if ((32768 & i5) == 0) {
            this.f98786p = null;
        } else {
            this.f98786p = str10;
        }
        this.f98787q = null;
        if ((65536 & i5) == 0) {
            Duration.Companion companion = Duration.f72038b;
            jG = DurationKt.g(120, DurationUnit.f72046e);
        } else {
            jG = duration.f72041a;
        }
        this.f98788r = jG;
        if ((i5 & SQLiteDatabase.OPEN_SHAREDCACHE) == 0) {
            this.f98789s = true;
        } else {
            this.f98789s = z14;
        }
    }
}
