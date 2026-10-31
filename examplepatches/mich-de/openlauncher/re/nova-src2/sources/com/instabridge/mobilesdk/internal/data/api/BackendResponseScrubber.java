package com.instabridge.mobilesdk.internal.data.api;

import com.amplitude.android.TrackingOptions;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntProgression;
import kotlin.text.Charsets;
import m90.g;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import r70.k;
import r70.l;
import x80.a0;
import x80.h0;
import x80.k0;
import x80.v;
import x80.w;

@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\b\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0006\u001a\u00020\u0005*\u00020\u0004H\u0002¢\u0006\u0004\b\u0006\u0010\u0007J!\u0010\u000b\u001a\u00020\u0005*\u00020\b2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00040\tH\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u0015\u0010\u000e\u001a\u00020\u0005*\u0004\u0018\u00010\rH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u0015\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\b¢\u0006\u0004\b\u0011\u0010\u0012J!\u0010\u0014\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0010\u001a\u00020\b2\b\u0010\u0013\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0019\u0010\u001d\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0013\u001a\u00020\u001aH\u0000¢\u0006\u0004\b\u001b\u0010\u001cR\u0014\u0010\u001f\u001a\u00020\u001e8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001f\u0010 R\u0014\u0010\"\u001a\u00020!8\u0002X\u0082T¢\u0006\u0006\n\u0004\b\"\u0010#R\u001a\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00040\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b$\u0010%R\u001a\u0010&\u001a\b\u0012\u0004\u0012\u00020\u00040\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b&\u0010%R\u001a\u0010(\u001a\b\u0012\u0004\u0012\u00020\u00040'8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b(\u0010)R\u001a\u0010*\u001a\b\u0012\u0004\u0012\u00020\u00040\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b*\u0010%R\u0014\u0010+\u001a\u00020\u001e8\u0002X\u0082T¢\u0006\u0006\n\u0004\b+\u0010 R\u0014\u0010,\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b,\u0010-R\u0014\u0010.\u001a\u00020\u00048\u0002X\u0082T¢\u0006\u0006\n\u0004\b.\u0010-¨\u0006/"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/BackendResponseScrubber;", b.f42142b, "<init>", "()V", b.f42142b, b.f42142b, "looksLikeIdentifier", "(Ljava/lang/String;)Z", "Lx80/w;", b.f42142b, "allowed", "isAllowedBy", "(Lx80/w;Ljava/util/Set;)Z", "Lx80/a0;", "isProbablyText", "(Lx80/a0;)Z", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "scrubUrl", "(Lx80/w;)Ljava/lang/String;", "body", "scrubResponseBody", "(Lx80/w;Ljava/lang/String;)Ljava/lang/String;", "Lx80/h0;", "request", "scrubRequestBody", "(Lx80/h0;)Ljava/lang/String;", "Lx80/k0;", "readBodySnapshot$mobile_sdk_release", "(Lx80/k0;)Ljava/lang/String;", "readBodySnapshot", b.f42142b, "MAX_BODY_CHARS", "I", b.f42142b, "MAX_REQUEST_BODY_BYTES", "J", "RESPONSE_BODY_ALLOWED_PATHS", "Ljava/util/Set;", "REQUEST_BODY_ALLOWED_PATHS", b.f42142b, "REQUEST_BODY_DENIED_PREFIXES", "Ljava/util/List;", "QUERY_ALLOWED", "MIN_IDENTIFIER_DIGITS", "IDENTIFIER_PUNCTUATION", "Ljava/lang/String;", "REDACTED", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BackendResponseScrubber {

    @NotNull
    private static final String IDENTIFIER_PUNCTUATION = "+-.() ";
    private static final int MAX_BODY_CHARS = 512;
    private static final long MAX_REQUEST_BODY_BYTES = 512;
    private static final int MIN_IDENTIFIER_DIGITS = 7;

    @NotNull
    private static final String REDACTED = "<redacted>";

    @NotNull
    public static final BackendResponseScrubber INSTANCE = new BackendResponseScrubber();

    @NotNull
    private static final Set<String> RESPONSE_BODY_ALLOWED_PATHS = c.f1(new String[]{"/v1/local-sim/prices-v3", "/v1/local-sim/enable-offer-v2", "/v1/prices"});

    @NotNull
    private static final Set<String> REQUEST_BODY_ALLOWED_PATHS = EmptySet.f71734a;

    @NotNull
    private static final List<String> REQUEST_BODY_DENIED_PREFIXES = ul.b.Q("/v1/local-sim/port-in", "/v1/local-sim/verification", "/v1/client/signin", "/v1/brand/signin", "/v1/purchases", "/api3/users", "/users");

    @NotNull
    private static final Set<String> QUERY_ALLOWED = c.f1(new String[]{"planType", TrackingOptions.AMP_TRACKING_OPTION_REGION, "provider", "variant", "isOnboarding", "cancellationWinback", "packageId", "segmentByRegion", "acceptBonusPackage", "acceptPayAsYouGoPackage", "acceptUnlimitedPackage", "acceptPendingPackage", "withToken", TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "version", "locale", "_method"});
    public static final int $stable = 8;

    private BackendResponseScrubber() {
    }

    private final boolean isAllowedBy(w wVar, Set<String> set) {
        if (set.isEmpty()) {
            return false;
        }
        String strB1 = k.b1(wVar.c(), "/");
        return set.contains(strB1.length() != 0 ? strB1 : "/");
    }

    private final boolean isProbablyText(a0 a0Var) {
        if (a0Var != null) {
            String str = a0Var.f95400c;
            if (a0Var.f95399b.equals("text") || str.equals("json") || j.A0(str, "+json", false) || str.equals("x-www-form-urlencoded")) {
                return true;
            }
        }
        return false;
    }

    private final boolean looksLikeIdentifier(String str) {
        int length = str.length();
        int i5 = 0;
        int i11 = 0;
        while (true) {
            if (i5 < length) {
                char cCharAt = str.charAt(i5);
                if (Character.isDigit(cCharAt)) {
                    i11++;
                } else if (!k.L0(IDENTIFIER_PUNCTUATION, cCharAt)) {
                    break;
                }
                i5++;
            } else if (i11 >= 7) {
                return true;
            }
        }
        return false;
    }

    @Nullable
    public final String readBodySnapshot$mobile_sdk_release(@NotNull k0 body) {
        a0 a0VarContentType;
        Charset charsetA;
        Intrinsics.g(body, "body");
        try {
            a0VarContentType = body.contentType();
        } catch (Throwable unused) {
        }
        if (body.isDuplex() || body.isOneShot() || !isProbablyText(a0VarContentType)) {
            return null;
        }
        long jContentLength = body.contentLength();
        if (jContentLength >= 0 && jContentLength <= MAX_REQUEST_BODY_BYTES) {
            g gVar = new g();
            body.writeTo(gVar);
            if (gVar.f76126b > MAX_REQUEST_BODY_BYTES) {
                return null;
            }
            if (a0VarContentType == null || (charsetA = a0VarContentType.a(Charsets.f72000b)) == null) {
                charsetA = Charsets.f72000b;
            }
            return gVar.Q(charsetA);
        }
        return null;
    }

    @Nullable
    public final String scrubRequestBody(@NotNull h0 request) {
        k0 k0Var;
        Intrinsics.g(request, "request");
        w wVar = request.f95509a;
        List<String> list = REQUEST_BODY_DENIED_PREFIXES;
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                if (j.I0(wVar.c(), (String) it.next(), false)) {
                    return null;
                }
            }
        }
        if (isAllowedBy(wVar, REQUEST_BODY_ALLOWED_PATHS) && (k0Var = request.f95512d) != null) {
            return readBodySnapshot$mobile_sdk_release(k0Var);
        }
        return null;
    }

    @Nullable
    public final String scrubResponseBody(@NotNull w url, @Nullable String body) {
        Intrinsics.g(url, "url");
        if (body == null || body.length() == 0 || !isAllowedBy(url, RESPONSE_BODY_ALLOWED_PATHS)) {
            return null;
        }
        return l.G1(512, body);
    }

    @NotNull
    public final String scrubUrl(@NotNull w url) {
        List listUnmodifiableList;
        Intrinsics.g(url, "url");
        v vVarG = url.g();
        int i5 = 0;
        for (Object obj : url.f95630f) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            if (INSTANCE.looksLikeIdentifier((String) obj)) {
                String strB = x80.b.b(REDACTED, 0, 0, 251, " \"<>^`{}|/\\?#");
                if (strB.equals(".") || strB.equalsIgnoreCase("%2e") || v.d(strB)) {
                    throw new IllegalArgumentException("unexpected path segment: ".concat(REDACTED).toString());
                }
                vVarG.f95621f.set(i5, strB);
            }
            i5 = i11;
        }
        vVarG.f95622g = null;
        for (String name : url.k()) {
            if (QUERY_ALLOWED.contains(name)) {
                Intrinsics.g(name, "name");
                List list = url.f95631g;
                if (list == null) {
                    listUnmodifiableList = EmptyList.f71733a;
                } else {
                    ArrayList arrayList = new ArrayList();
                    IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, list.size()), 2);
                    int i12 = intProgressionL0.f71906a;
                    int i13 = intProgressionL0.f71907b;
                    int i14 = intProgressionL0.f71908c;
                    if ((i14 > 0 && i12 <= i13) || (i14 < 0 && i13 <= i12)) {
                        while (true) {
                            if (name.equals(list.get(i12))) {
                                arrayList.add(list.get(i12 + 1));
                            }
                            if (i12 == i13) {
                                break;
                            }
                            i12 += i14;
                        }
                    }
                    listUnmodifiableList = Collections.unmodifiableList(arrayList);
                    Intrinsics.f(listUnmodifiableList, "unmodifiableList(result)");
                }
                Iterator it = listUnmodifiableList.iterator();
                while (it.hasNext()) {
                    vVarG.a(name, (String) it.next());
                }
            }
        }
        return vVarG.b().f95633i;
    }
}
