package com.amplitude.android.network;

import ab.e0;
import b70.c;
import b70.g;
import com.amplitude.android.network.NetworkTrackingOptions;
import com.amplitude.android.utilities.ObjectFilter;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.SetBuilder;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.ranges.IntRange;
import kotlin.text.Charsets;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import r70.j;
import x80.u;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\n\u0018\u0000 \u001b2\u00020\u0001:\u0005\u0018\u0019\u001a\u001b\u001cBA\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\n\u001a\u00020\b¢\u0006\u0002\u0010\u000bJ\u0015\u0010\u0015\u001a\u00020\b2\u0006\u0010\u0016\u001a\u00020\u0006H\u0000¢\u0006\u0002\b\u0017R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\n\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\r¨\u0006\u001d"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions;", b.f42142b, "captureRules", b.f42142b, "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureRule;", "ignoreHosts", b.f42142b, "ignoreAmplitudeRequests", b.f42142b, "enabled", "enableRemoteConfig", "(Ljava/util/List;Ljava/util/List;ZZZ)V", "getCaptureRules", "()Ljava/util/List;", "getEnableRemoteConfig", "()Z", "getEnabled", "getIgnoreAmplitudeRequests", "ignoreHostMatcher", "Lcom/amplitude/android/network/HostMatcher;", "getIgnoreHosts", "shouldIgnore", "host", "shouldIgnore$android_release", "CaptureBody", "CaptureHeader", "CaptureRule", k.O, "URLPattern", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class NetworkTrackingOptions {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Lazy<NetworkTrackingOptions> DEFAULT$delegate = LazyKt.a(new Function0<NetworkTrackingOptions>() { // from class: com.amplitude.android.network.NetworkTrackingOptions$Companion$DEFAULT$2
        @Override // kotlin.jvm.functions.Function0
        @NotNull
        public final NetworkTrackingOptions invoke() {
            return new NetworkTrackingOptions(ul.b.P(new NetworkTrackingOptions.CaptureRule(ul.b.P("*"), null, 2, null)), null, false, false, false, 30, null);
        }
    });

    @NotNull
    private final List<CaptureRule> captureRules;
    private final boolean enableRemoteConfig;
    private final boolean enabled;
    private final boolean ignoreAmplitudeRequests;

    @NotNull
    private final HostMatcher ignoreHostMatcher;

    @NotNull
    private final List<String> ignoreHosts;

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\b\n\u0018\u00002\u00020\u0001B!\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ%\u0010\u000e\u001a\u0010\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u000b2\u0006\u0010\n\u001a\u00020\tH\u0000¢\u0006\u0004\b\f\u0010\rR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u000f\u001a\u0004\b\u0010\u0010\u0011R\u001d\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;", b.f42142b, b.f42142b, b.f42142b, "allowlist", b.f42142b, "captureSafeHeaders", "<init>", "(Ljava/util/List;Z)V", "Lx80/u;", "headers", b.f42142b, "filterHeaders$android_release", "(Lx80/u;)Ljava/util/Map;", "filterHeaders", "Z", "getCaptureSafeHeaders", "()Z", "Ljava/util/List;", "getAllowlist", "()Ljava/util/List;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @SourceDebugExtension
    public static final class CaptureHeader {

        @NotNull
        private final List<String> allowlist;
        private final boolean captureSafeHeaders;

        public CaptureHeader() {
            this(null, false, 3, null);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Nullable
        public final Map<String, Object> filterHeaders$android_release(@NotNull u headers) {
            Intrinsics.g(headers, "headers");
            SetBuilder setBuilder = new SetBuilder();
            List<String> list = this.allowlist;
            ArrayList arrayList = new ArrayList(c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                String lowerCase = ((String) it.next()).toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                arrayList.add(lowerCase);
            }
            setBuilder.addAll(arrayList);
            if (this.captureSafeHeaders) {
                setBuilder.addAll(NetworkTrackingOptionsKt.getSAFE_HEADERS());
            }
            setBuilder.removeAll(NetworkTrackingOptionsKt.getBLOCK_HEADERS());
            SetBuilder setBuilderL = e0.l(setBuilder);
            if (setBuilderL.f71786a.isEmpty()) {
                return null;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            int size = headers.size();
            for (int i5 = 0; i5 < size; i5++) {
                String strC = headers.c(i5);
                String lowerCase2 = strC.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                if (setBuilderL.f71786a.containsKey(lowerCase2)) {
                    String strE = headers.e(i5);
                    Object obj = linkedHashMap.get(strC);
                    if (obj == null) {
                        linkedHashMap.put(strC, strE);
                    } else if (obj instanceof String) {
                        linkedHashMap.put(strC, ul.b.T(obj, strE));
                    } else if (TypeIntrinsics.g(obj)) {
                        TypeIntrinsics.b(obj).add(strE);
                    }
                }
            }
            if (linkedHashMap.isEmpty()) {
                return null;
            }
            return linkedHashMap;
        }

        @NotNull
        public final List<String> getAllowlist() {
            return this.allowlist;
        }

        public final boolean getCaptureSafeHeaders() {
            return this.captureSafeHeaders;
        }

        public CaptureHeader(List list, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? EmptyList.f71733a : list, (i5 & 2) != 0 ? true : z11);
        }

        public CaptureHeader(@NotNull List<String> allowlist, boolean z11) {
            Intrinsics.g(allowlist, "allowlist");
            this.captureSafeHeaders = z11;
            this.allowlist = g.I1(allowlist);
        }
    }

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001b\u0010\u0003\u001a\u00020\u00048FX\u0086\u0084\u0002¢\u0006\f\n\u0004\b\u0007\u0010\b\u001a\u0004\b\u0005\u0010\u0006¨\u0006\t"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$Companion;", b.f42142b, "()V", "DEFAULT", "Lcom/amplitude/android/network/NetworkTrackingOptions;", "getDEFAULT", "()Lcom/amplitude/android/network/NetworkTrackingOptions;", "DEFAULT$delegate", "Lkotlin/Lazy;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final NetworkTrackingOptions getDEFAULT() {
            return (NetworkTrackingOptions) NetworkTrackingOptions.DEFAULT$delegate.getValue();
        }

        private Companion() {
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0002\u0003\u0004B\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\u0002\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern;", b.f42142b, "()V", "Exact", "Regex", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern$Exact;", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern$Regex;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static abstract class URLPattern {

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0010"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern$Exact;", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern;", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, b.f42142b, "(Ljava/lang/String;)V", "getUrl", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class Exact extends URLPattern {

            @NotNull
            private final String url;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Exact(@NotNull String url) {
                super(null);
                Intrinsics.g(url, "url");
                this.url = url;
            }

            public static /* synthetic */ Exact copy$default(Exact exact, String str, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = exact.url;
                }
                return exact.copy(str);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getUrl() {
                return this.url;
            }

            @NotNull
            public final Exact copy(@NotNull String url) {
                Intrinsics.g(url, "url");
                return new Exact(url);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Exact) && Intrinsics.b(this.url, ((Exact) other).url);
            }

            @NotNull
            public final String getUrl() {
                return this.url;
            }

            public int hashCode() {
                return this.url.hashCode();
            }

            @NotNull
            public String toString() {
                return c1.t(new StringBuilder("Exact(url="), this.url, ')');
            }
        }

        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0010"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern$Regex;", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern;", "pattern", b.f42142b, "(Ljava/lang/String;)V", "getPattern", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        public static final /* data */ class Regex extends URLPattern {

            @NotNull
            private final String pattern;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Regex(@NotNull String pattern) {
                super(null);
                Intrinsics.g(pattern, "pattern");
                this.pattern = pattern;
            }

            public static /* synthetic */ Regex copy$default(Regex regex, String str, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    str = regex.pattern;
                }
                return regex.copy(str);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final String getPattern() {
                return this.pattern;
            }

            @NotNull
            public final Regex copy(@NotNull String pattern) {
                Intrinsics.g(pattern, "pattern");
                return new Regex(pattern);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Regex) && Intrinsics.b(this.pattern, ((Regex) other).pattern);
            }

            @NotNull
            public final String getPattern() {
                return this.pattern;
            }

            public int hashCode() {
                return this.pattern.hashCode();
            }

            @NotNull
            public String toString() {
                return c1.t(new StringBuilder("Regex(pattern="), this.pattern, ')');
            }
        }

        public /* synthetic */ URLPattern(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private URLPattern() {
        }
    }

    public NetworkTrackingOptions(@NotNull List<CaptureRule> captureRules, @NotNull List<String> ignoreHosts, boolean z11, boolean z12, boolean z13) {
        Intrinsics.g(captureRules, "captureRules");
        Intrinsics.g(ignoreHosts, "ignoreHosts");
        this.ignoreAmplitudeRequests = z11;
        this.enabled = z12;
        this.enableRemoteConfig = z13;
        List<CaptureRule> list = captureRules;
        this.captureRules = g.I1(list);
        this.ignoreHosts = g.I1(ignoreHosts);
        boolean z14 = list instanceof Collection;
        if (!z14 || !list.isEmpty()) {
            for (CaptureRule captureRule : list) {
                if (captureRule.getHosts().isEmpty() && captureRule.getUrls().isEmpty()) {
                    throw new IllegalArgumentException("Capture rules must have a non-empty host list or URL list.");
                }
            }
        }
        if (!z14 || !list.isEmpty()) {
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                if (((CaptureRule) it.next()).getStatusCodeRange().isEmpty()) {
                    throw new IllegalArgumentException("Capture rules must have a non-empty status code range.");
                }
            }
        }
        this.ignoreHostMatcher = new HostMatcher(ignoreHosts);
    }

    @NotNull
    public final List<CaptureRule> getCaptureRules() {
        return this.captureRules;
    }

    public final boolean getEnableRemoteConfig() {
        return this.enableRemoteConfig;
    }

    public final boolean getEnabled() {
        return this.enabled;
    }

    public final boolean getIgnoreAmplitudeRequests() {
        return this.ignoreAmplitudeRequests;
    }

    @NotNull
    public final List<String> getIgnoreHosts() {
        return this.ignoreHosts;
    }

    public final boolean shouldIgnore$android_release(@NotNull String host) {
        Intrinsics.g(host, "host");
        if (this.ignoreAmplitudeRequests && NetworkTrackingOptionsKt.isAmplitudeHost(host)) {
            return true;
        }
        return this.ignoreHostMatcher.matches(host);
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0012\n\u0002\b\u0002\u0018\u00002\u00020\u0001B#\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0006J\u0019\u0010\f\u001a\u0004\u0018\u00010\u00042\b\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0000¢\u0006\u0002\b\u000fR\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\bR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;", b.f42142b, "allowlist", b.f42142b, b.f42142b, "excludelist", "(Ljava/util/List;Ljava/util/List;)V", "getAllowlist", "()Ljava/util/List;", "getExcludelist", "objectFilter", "Lcom/amplitude/android/utilities/ObjectFilter;", "filterBodyBytes", "bodyBytes", b.f42142b, "filterBodyBytes$android_release", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class CaptureBody {

        @NotNull
        private final List<String> allowlist;

        @NotNull
        private final List<String> excludelist;

        @NotNull
        private final ObjectFilter objectFilter;

        public CaptureBody(List list, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(list, (i5 & 2) != 0 ? EmptyList.f71733a : list2);
        }

        @Nullable
        public final String filterBodyBytes$android_release(@Nullable byte[] bodyBytes) {
            Object objJsonArrayToList;
            if (bodyBytes != null && bodyBytes.length != 0) {
                try {
                    Object objNextValue = new JSONTokener(new String(bodyBytes, Charsets.f72000b)).nextValue();
                    if (objNextValue instanceof JSONObject) {
                        objJsonArrayToList = NetworkTrackingOptionsKt.jsonObjectToMap((JSONObject) objNextValue);
                    } else if (objNextValue instanceof JSONArray) {
                        objJsonArrayToList = NetworkTrackingOptionsKt.jsonArrayToList((JSONArray) objNextValue);
                    }
                    Object objFiltered = this.objectFilter.filtered(objJsonArrayToList);
                    if (objFiltered == null) {
                        return null;
                    }
                    if (objFiltered instanceof Map) {
                        return new JSONObject((Map) objFiltered).toString();
                    }
                    if (objFiltered instanceof List) {
                        return new JSONArray((Collection) objFiltered).toString();
                    }
                } catch (Exception unused) {
                }
            }
            return null;
        }

        @NotNull
        public final List<String> getAllowlist() {
            return this.allowlist;
        }

        @NotNull
        public final List<String> getExcludelist() {
            return this.excludelist;
        }

        public CaptureBody(@NotNull List<String> allowlist, @NotNull List<String> excludelist) {
            Intrinsics.g(allowlist, "allowlist");
            Intrinsics.g(excludelist, "excludelist");
            List<String> listI1 = g.I1(allowlist);
            this.allowlist = listI1;
            List<String> listI12 = g.I1(excludelist);
            this.excludelist = listI12;
            this.objectFilter = new ObjectFilter(listI1, listI12);
        }
    }

    @Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\u0018\u00002\u00020\u0001B%\b\u0016\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\u0002\u0010\u0007Be\b\u0016\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0003\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f¢\u0006\u0002\u0010\u0011Bg\b\u0000\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0003\u0012\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f¢\u0006\u0002\u0010\u0012J'\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u00042\u0006\u0010&\u001a\u00020\u00042\b\u0010'\u001a\u0004\u0018\u00010\u0004H\u0000¢\u0006\u0002\b(J\u0010\u0010)\u001a\u00020$2\u0006\u0010&\u001a\u00020\u0004H\u0002R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0017\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0016R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0019R\u0013\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0016R\"\u0010\u001f\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010!0 0\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0003¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0016¨\u0006*"}, d2 = {"Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureRule;", b.f42142b, "hosts", b.f42142b, b.f42142b, "statusCodeRange", b.f42142b, "(Ljava/util/List;Ljava/util/List;)V", "urls", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern;", "methods", "requestHeaders", "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;", "responseHeaders", "requestBody", "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;", "responseBody", "(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;)V", "(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;)V", "hostMatcher", "Lcom/amplitude/android/network/HostMatcher;", "getHosts", "()Ljava/util/List;", "getMethods", "getRequestBody", "()Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;", "getRequestHeaders", "()Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;", "getResponseBody", "getResponseHeaders", "getStatusCodeRange", "urlMatchers", "Lkotlin/Pair;", "Lkotlin/text/Regex;", "getUrls", "matchesRequest", b.f42142b, "host", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "method", "matchesRequest$android_release", "matchesUrl", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @SourceDebugExtension
    public static final class CaptureRule {

        @NotNull
        private final HostMatcher hostMatcher;

        @NotNull
        private final List<String> hosts;

        @NotNull
        private final List<String> methods;

        @Nullable
        private final CaptureBody requestBody;

        @Nullable
        private final CaptureHeader requestHeaders;

        @Nullable
        private final CaptureBody responseBody;

        @Nullable
        private final CaptureHeader responseHeaders;

        @NotNull
        private final List<Integer> statusCodeRange;

        @NotNull
        private final List<Pair<URLPattern, Regex>> urlMatchers;

        @NotNull
        private final List<URLPattern> urls;

        /* JADX WARN: Illegal instructions before constructor call */
        public CaptureRule(@NotNull List<String> hosts, @NotNull List<Integer> statusCodeRange) {
            Intrinsics.g(hosts, "hosts");
            Intrinsics.g(statusCodeRange, "statusCodeRange");
            EmptyList emptyList = EmptyList.f71733a;
            this(hosts, emptyList, emptyList, statusCodeRange, null, null, null, null);
        }

        private final boolean matchesUrl(String url) {
            boolean zB;
            List<Pair<URLPattern, Regex>> list = this.urlMatchers;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    URLPattern uRLPattern = (URLPattern) pair.f71683a;
                    Regex regex = (Regex) pair.f71684b;
                    if (uRLPattern instanceof URLPattern.Exact) {
                        zB = Intrinsics.b(((URLPattern.Exact) uRLPattern).getUrl(), url);
                    } else {
                        if (!(uRLPattern instanceof URLPattern.Regex)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        zB = regex != null && regex.a(url);
                    }
                    if (zB) {
                        return true;
                    }
                }
            }
            return false;
        }

        @NotNull
        public final List<String> getHosts() {
            return this.hosts;
        }

        @NotNull
        public final List<String> getMethods() {
            return this.methods;
        }

        @Nullable
        public final CaptureBody getRequestBody() {
            return this.requestBody;
        }

        @Nullable
        public final CaptureHeader getRequestHeaders() {
            return this.requestHeaders;
        }

        @Nullable
        public final CaptureBody getResponseBody() {
            return this.responseBody;
        }

        @Nullable
        public final CaptureHeader getResponseHeaders() {
            return this.responseHeaders;
        }

        @NotNull
        public final List<Integer> getStatusCodeRange() {
            return this.statusCodeRange;
        }

        @NotNull
        public final List<URLPattern> getUrls() {
            return this.urls;
        }

        public final boolean matchesRequest$android_release(@NotNull String host, @NotNull String url, @Nullable String method) {
            Intrinsics.g(host, "host");
            Intrinsics.g(url, "url");
            if (this.urls.isEmpty()) {
                if (this.hosts.isEmpty() || !this.hostMatcher.matches(host)) {
                    return false;
                }
            } else if (!matchesUrl(url)) {
                return false;
            }
            if (!this.methods.isEmpty() && !this.methods.contains("*")) {
                if (method != null) {
                    String upperCase = method.toUpperCase(Locale.ROOT);
                    Intrinsics.f(upperCase, "toUpperCase(...)");
                    List<String> list = this.methods;
                    if (!(list instanceof Collection) || !list.isEmpty()) {
                        Iterator<T> it = list.iterator();
                        while (it.hasNext()) {
                            if (j.B0((String) it.next(), upperCase, true)) {
                            }
                        }
                    }
                }
                return false;
            }
            return true;
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public CaptureRule(@NotNull List<? extends URLPattern> urls, @NotNull List<String> methods, @NotNull List<Integer> statusCodeRange, @Nullable CaptureHeader captureHeader, @Nullable CaptureHeader captureHeader2, @Nullable CaptureBody captureBody, @Nullable CaptureBody captureBody2) {
            this(EmptyList.f71733a, urls, methods, statusCodeRange, captureHeader, captureHeader2, captureBody, captureBody2);
            Intrinsics.g(urls, "urls");
            Intrinsics.g(methods, "methods");
            Intrinsics.g(statusCodeRange, "statusCodeRange");
        }

        public CaptureRule(List list, List list2, List list3, CaptureHeader captureHeader, CaptureHeader captureHeader2, CaptureBody captureBody, CaptureBody captureBody2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(list, (i5 & 2) != 0 ? EmptyList.f71733a : list2, (i5 & 4) != 0 ? g.I1(new IntRange(500, 599, 1)) : list3, (i5 & 8) != 0 ? null : captureHeader, (i5 & 16) != 0 ? null : captureHeader2, (i5 & 32) != 0 ? null : captureBody, (i5 & 64) != 0 ? null : captureBody2);
        }

        public CaptureRule(@NotNull List<String> hosts, @NotNull List<? extends URLPattern> urls, @NotNull List<String> methods, @NotNull List<Integer> statusCodeRange, @Nullable CaptureHeader captureHeader, @Nullable CaptureHeader captureHeader2, @Nullable CaptureBody captureBody, @Nullable CaptureBody captureBody2) {
            Pair pair;
            Intrinsics.g(hosts, "hosts");
            Intrinsics.g(urls, "urls");
            Intrinsics.g(methods, "methods");
            Intrinsics.g(statusCodeRange, "statusCodeRange");
            this.requestHeaders = captureHeader;
            this.responseHeaders = captureHeader2;
            this.requestBody = captureBody;
            this.responseBody = captureBody2;
            this.hosts = g.I1(hosts);
            List<? extends URLPattern> list = urls;
            this.urls = g.I1(list);
            this.methods = g.I1(methods);
            this.statusCodeRange = g.I1(statusCodeRange);
            this.hostMatcher = new HostMatcher(hosts);
            ArrayList arrayList = new ArrayList(c.u0(list, 10));
            for (URLPattern uRLPattern : list) {
                if (uRLPattern instanceof URLPattern.Exact) {
                    pair = new Pair(uRLPattern, null);
                } else if (uRLPattern instanceof URLPattern.Regex) {
                    pair = new Pair(uRLPattern, new Regex(((URLPattern.Regex) uRLPattern).getPattern()));
                } else {
                    throw new NoWhenBranchMatchedException();
                }
                arrayList.add(pair);
            }
            this.urlMatchers = arrayList;
        }

        public CaptureRule(List list, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this(list, (i5 & 2) != 0 ? g.I1(new IntRange(500, 599, 1)) : list2);
        }
    }

    public NetworkTrackingOptions(List list, List list2, boolean z11, boolean z12, boolean z13, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, (i5 & 2) != 0 ? EmptyList.f71733a : list2, (i5 & 4) != 0 ? true : z11, (i5 & 8) != 0 ? true : z12, (i5 & 16) != 0 ? true : z13);
    }
}
