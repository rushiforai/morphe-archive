package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.net.Uri;
import android.text.TextUtils;
import b.c0;
import com.moloco.sdk.internal.x;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class n {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final b f39148b = new b(null);

    /* renamed from: c, reason: collision with root package name */
    public static final int f39149c = 0;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final String f39150d = "close";

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f39151e = "expand";

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f39152f = "open";

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final String f39153g = "resize";

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final String f39154h = "setOrientationProperties";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f39155a;

    public static final class a extends n {

        /* renamed from: i, reason: collision with root package name */
        @NotNull
        public static final a f39156i = new a();

        /* renamed from: j, reason: collision with root package name */
        public static final int f39157j = 0;

        public a() {
            super(n.f39150d, null);
        }
    }

    @SourceDebugExtension
    public static final class b {

        public static final class a {

            /* renamed from: c, reason: collision with root package name */
            public static final int f39158c = 0;

            /* renamed from: a, reason: collision with root package name */
            public final boolean f39159a;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final String f39160b;

            public a(boolean z11, @NotNull String description) {
                Intrinsics.g(description, "description");
                this.f39159a = z11;
                this.f39160b = description;
            }

            @NotNull
            public final String a() {
                return this.f39160b;
            }

            public final boolean b() {
                return this.f39159a;
            }
        }

        public /* synthetic */ b(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final e a() {
            return null;
        }

        public final d b(Map<String, String> map) {
            Object objA;
            String str = map.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            if (str == null) {
                return null;
            }
            try {
                int i5 = Result.f71687b;
                Uri uri = Uri.parse(str);
                Intrinsics.f(uri, "parse(...)");
                objA = new d(uri);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            return (d) (objA instanceof Result.Failure ? null : objA);
        }

        public final f c(Map<String, String> map) {
            Boolean boolT1;
            String str = map.get("allowOrientationChange");
            if (str == null || (boolT1 = r70.k.t1(str)) == null) {
                return null;
            }
            boolean zBooleanValue = boolT1.booleanValue();
            p pVarA = p.f39173a.a(map.get("forceOrientation"));
            if (pVarA == null) {
                return null;
            }
            return new f(zBooleanValue, pVarA);
        }

        public b() {
        }

        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
        java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
         */
        @NotNull
        public final com.moloco.sdk.internal.x<n, a> a(@Nullable String str) {
            Object objA;
            try {
                int i5 = Result.f71687b;
                objA = Uri.parse(str);
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Object objA2 = null;
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            Uri uri = (Uri) objA;
            if (uri == null) {
                return new x.a(new a(false, c0.k("Invalid url: ", str)));
            }
            if (!Intrinsics.b(uri.getScheme(), "mraid")) {
                return new x.a(new a(false, c0.k("Non-mraid url scheme: ", str)));
            }
            Map<String, String> mapA = a(uri);
            String host = uri.getHost();
            if (host != null) {
                switch (host.hashCode()) {
                    case -1289167206:
                        if (host.equals(n.f39151e)) {
                            objA2 = a(mapA);
                            break;
                        }
                        break;
                    case -934437708:
                        if (host.equals(n.f39153g)) {
                            objA2 = a();
                            break;
                        }
                        break;
                    case 3417674:
                        if (host.equals("open")) {
                            objA2 = b(mapA);
                            break;
                        }
                        break;
                    case 94756344:
                        if (host.equals(n.f39150d)) {
                            objA2 = a.f39156i;
                            break;
                        }
                        break;
                    case 133423073:
                        if (host.equals(n.f39154h)) {
                            objA2 = c(mapA);
                            break;
                        }
                        break;
                }
            }
            if (objA2 != null) {
                return new x.b(objA2);
            }
            return new x.a(new a(true, "Unknown/unsupported mraid command " + uri.getHost()));
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v4, types: [kotlin.Result$Failure] */
        public final c a(Map<String, String> map) {
            Uri uriA;
            String str = map.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            if (str != null) {
                try {
                    int i5 = Result.f71687b;
                    uriA = Uri.parse(str);
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    uriA = ResultKt.a(th2);
                }
                uri = uriA instanceof Result.Failure ? null : uriA;
            }
            return new c(uri);
        }

        public final Map<String, String> a(Uri uri) {
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (String str : uri.getQueryParameterNames()) {
                linkedHashMap.put(str, TextUtils.join(",", uri.getQueryParameters(str)));
            }
            return linkedHashMap;
        }
    }

    public static final class c extends n {

        /* renamed from: j, reason: collision with root package name */
        public static final int f39161j = 8;

        /* renamed from: i, reason: collision with root package name */
        @Nullable
        public final Uri f39162i;

        public c(@Nullable Uri uri) {
            super(n.f39151e, null);
            this.f39162i = uri;
        }

        @Nullable
        public final Uri b() {
            return this.f39162i;
        }
    }

    public static final class d extends n {

        /* renamed from: j, reason: collision with root package name */
        public static final int f39163j = 8;

        /* renamed from: i, reason: collision with root package name */
        @NotNull
        public final Uri f39164i;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull Uri uri) {
            super("open", null);
            Intrinsics.g(uri, "uri");
            this.f39164i = uri;
        }

        @NotNull
        public final Uri b() {
            return this.f39164i;
        }
    }

    public static final class e extends n {
        public static final int n = 0;

        /* renamed from: i, reason: collision with root package name */
        public final int f39165i;

        /* renamed from: j, reason: collision with root package name */
        public final int f39166j;

        /* renamed from: k, reason: collision with root package name */
        public final int f39167k;

        /* renamed from: l, reason: collision with root package name */
        public final int f39168l;

        /* renamed from: m, reason: collision with root package name */
        public final boolean f39169m;

        public e(int i5, int i11, int i12, int i13, boolean z11) {
            super(n.f39153g, null);
            this.f39165i = i5;
            this.f39166j = i11;
            this.f39167k = i12;
            this.f39168l = i13;
            this.f39169m = z11;
        }

        public final boolean b() {
            return this.f39169m;
        }

        public final int c() {
            return this.f39166j;
        }

        public final int d() {
            return this.f39167k;
        }

        public final int e() {
            return this.f39168l;
        }

        public final int f() {
            return this.f39165i;
        }
    }

    public static final class f extends n {

        /* renamed from: k, reason: collision with root package name */
        public static final int f39170k = 0;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f39171i;

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public final p f39172j;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(boolean z11, @NotNull p forceOrientation) {
            super(n.f39154h, null);
            Intrinsics.g(forceOrientation, "forceOrientation");
            this.f39171i = z11;
            this.f39172j = forceOrientation;
        }

        public final boolean b() {
            return this.f39171i;
        }

        @NotNull
        public final p c() {
            return this.f39172j;
        }
    }

    public /* synthetic */ n(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    @NotNull
    public final String a() {
        return this.f39155a;
    }

    public n(String str) {
        this.f39155a = str;
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.b a(@NotNull f fVar) {
        Intrinsics.g(fVar, "<this>");
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation.b(q.a(fVar.c()), fVar.b());
    }
}
