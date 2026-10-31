package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import b.c0;
import b.u4;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.AbstractC3023b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.C3022a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.o;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.p;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.q;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.s;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.t;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.u;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.v;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.w;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.z;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import t70.j0;
import t70.k0;
import t70.m0;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class k {

    @NotNull
    public static final String A = "ClickThrough";

    @NotNull
    public static final String B = "ClickTracking";

    @NotNull
    public static final String C = "CustomClick";

    @NotNull
    public static final String D = "Icons";

    @NotNull
    public static final String E = "Icon";

    @NotNull
    public static final String F = "StaticResource";

    @NotNull
    public static final String G = "IFrameResource";

    @NotNull
    public static final String H = "HTMLResource";

    @NotNull
    public static final String I = "IconClicks";

    @NotNull
    public static final String J = "IconClickThrough";

    @NotNull
    public static final String K = "IconClickTracking";

    @NotNull
    public static final String L = "IconViewTracking";

    @NotNull
    public static final String M = "AltText";

    @NotNull
    public static final String N = "CompanionAds";

    @NotNull
    public static final String O = "Companion";

    @NotNull
    public static final String P = "CompanionClickThrough";

    @NotNull
    public static final String Q = "CompanionClickTracking";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f40327a = LazyKt.a(new x(7));

    /* renamed from: b, reason: collision with root package name */
    public static final long f40328b = 3600;

    /* renamed from: c, reason: collision with root package name */
    public static final long f40329c = 60;

    /* renamed from: d, reason: collision with root package name */
    public static final long f40330d = 1000;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f40331e = "Error";

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f40332f = "Ad";

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final String f40333g = "InLine";

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public static final String f40334h = "Wrapper";

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f40335i = "VASTAdTagURI";

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public static final String f40336j = "AdSystem";

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public static final String f40337k = "AdTitle";

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public static final String f40338l = "Description";

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public static final String f40339m = "Advertiser";

    @NotNull
    public static final String n = "Pricing";

    @NotNull
    public static final String o = "Survey";

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public static final String f40340p = "Impression";

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public static final String f40341q = "Creatives";

    /* renamed from: r, reason: collision with root package name */
    @NotNull
    public static final String f40342r = "Creative";

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public static final String f40343s = "Linear";

    /* renamed from: t, reason: collision with root package name */
    @NotNull
    public static final String f40344t = "AdParameters";

    /* renamed from: u, reason: collision with root package name */
    @NotNull
    public static final String f40345u = "Duration";

    /* renamed from: v, reason: collision with root package name */
    @NotNull
    public static final String f40346v = "MediaFiles";

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public static final String f40347w = "MediaFile";

    /* renamed from: x, reason: collision with root package name */
    @NotNull
    public static final String f40348x = "TrackingEvents";

    /* renamed from: y, reason: collision with root package name */
    @NotNull
    public static final String f40349y = "Tracking";

    /* renamed from: z, reason: collision with root package name */
    @NotNull
    public static final String f40350z = "VideoClicks";

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseInLineTag")
    public static final class A extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40351a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40352b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40353c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40354d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40355e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40356f;

        /* renamed from: g, reason: collision with root package name */
        public Object f40357g;

        /* renamed from: h, reason: collision with root package name */
        public Object f40358h;

        /* renamed from: i, reason: collision with root package name */
        public /* synthetic */ Object f40359i;

        /* renamed from: j, reason: collision with root package name */
        public int f40360j;

        public A(Continuation<? super A> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40359i = obj;
            this.f40360j |= Integer.MIN_VALUE;
            return k.K(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseLinearTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 128, Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class B extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40361a;

        /* renamed from: b, reason: collision with root package name */
        public int f40362b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40363c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40364d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40365e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40366f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40367g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ List f40368h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ List f40369i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40370j;

        /* renamed from: k, reason: collision with root package name */
        public final /* synthetic */ boolean f40371k;

        /* renamed from: l, reason: collision with root package name */
        public final /* synthetic */ List f40372l;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public B(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, List list, List list2, Ref.ObjectRef objectRef4, boolean z11, List list3) {
            super(2, continuation);
            this.f40364d = xmlPullParser;
            this.f40365e = objectRef;
            this.f40366f = objectRef2;
            this.f40367g = objectRef3;
            this.f40368h = list;
            this.f40369i = list2;
            this.f40370j = objectRef4;
            this.f40371k = z11;
            this.f40372l = list3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((B) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            B b11 = new B(this.f40364d, continuation, this.f40365e, this.f40366f, this.f40367g, this.f40368h, this.f40369i, this.f40370j, this.f40371k, this.f40372l);
            b11.f40363c = obj;
            return b11;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Code restructure failed: missing block: B:47:0x00ea, code lost:
        
            if (r6 == r0) goto L81;
         */
        /* JADX WARN: Code restructure failed: missing block: B:69:0x014c, code lost:
        
            if (r6 == r0) goto L81;
         */
        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
        /* JADX WARN: Removed duplicated region for block: B:24:0x008a  */
        /* JADX WARN: Removed duplicated region for block: B:99:0x01c9  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0094 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x009e -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x00a6 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00ac -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00b7 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00d9 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x00ea -> B:49:0x00ee). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x00fb -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x011d -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:66:0x013b -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:77:0x0162 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:85:0x0182 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:93:0x01a4 -> B:98:0x01c2). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:95:0x01bd -> B:98:0x01c2). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            Ref.ObjectRef objectRef;
            String text;
            XmlPullParser xmlPullParser;
            String name;
            List list;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            switch (this.f40362b) {
                case 0:
                    ResultKt.b(obj);
                    k0.e((j0) this.f40363c);
                    if (k.j(this.f40364d)) {
                        this.f40364d.nextTag();
                    }
                    if (k.h(this.f40364d)) {
                        return Unit.f71706a;
                    }
                    if (!k.k(this.f40364d)) {
                        throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                    }
                    depth = this.f40364d.getDepth();
                    if (this.f40364d.getDepth() < depth) {
                        return Unit.f71706a;
                    }
                    int depth2 = this.f40364d.getDepth() - depth;
                    if (depth2 != 0) {
                        if (depth2 == 1 && k.k(this.f40364d) && (name = (xmlPullParser = this.f40364d).getName()) != null) {
                            switch (name.hashCode()) {
                                case -2049897434:
                                    if (name.equals(k.f40350z)) {
                                        Ref.ObjectRef objectRef2 = this.f40370j;
                                        boolean z11 = this.f40371k;
                                        this.f40363c = objectRef2;
                                        this.f40361a = depth;
                                        this.f40362b = 5;
                                        Object objH = k.h(xmlPullParser, z11, this);
                                        if (objH != coroutineSingletons) {
                                            objectRef2.f71863a = objH;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case -1927368268:
                                    if (name.equals(k.f40345u)) {
                                        objectRef = this.f40367g;
                                        this.f40363c = objectRef;
                                        this.f40361a = depth;
                                        this.f40362b = 2;
                                        obj = k.P(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case -1348833651:
                                    if (name.equals(k.f40344t)) {
                                        Ref.ObjectRef objectRef3 = this.f40366f;
                                        this.f40363c = objectRef3;
                                        this.f40361a = depth;
                                        this.f40362b = 1;
                                        Object objY = k.y(xmlPullParser, this);
                                        if (objY != coroutineSingletons) {
                                            objectRef3.f71863a = objY;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case -385055469:
                                    if (name.equals(k.f40346v)) {
                                        List list2 = this.f40368h;
                                        this.f40363c = list2;
                                        this.f40361a = depth;
                                        this.f40362b = 3;
                                        Object objM = k.M(xmlPullParser, this);
                                        if (objM != coroutineSingletons) {
                                            list2.addAll((Collection) objM);
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 70476538:
                                    if (name.equals(k.D)) {
                                        list = this.f40372l;
                                        this.f40363c = list;
                                        this.f40361a = depth;
                                        this.f40362b = 6;
                                        obj = k.I(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case 611554000:
                                    if (name.equals(k.f40348x)) {
                                        List list3 = this.f40369i;
                                        this.f40363c = list3;
                                        this.f40361a = depth;
                                        this.f40362b = 4;
                                        Object objQ = k.Q(xmlPullParser, this);
                                        if (objQ != coroutineSingletons) {
                                            list3.addAll((Collection) objQ);
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                            }
                        }
                    } else if (k.k(this.f40364d)) {
                        this.f40365e.f71863a = k.n(this.f40364d);
                    } else if (k.l(this.f40364d) && (text = this.f40364d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40364d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40364d)) {
                        return Unit.f71706a;
                    }
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 1:
                    depth = this.f40361a;
                    Ref.ObjectRef objectRef4 = (Ref.ObjectRef) this.f40363c;
                    ResultKt.b(obj);
                    objectRef4.f71863a = obj;
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 2:
                    depth = this.f40361a;
                    objectRef = (Ref.ObjectRef) this.f40363c;
                    ResultKt.b(obj);
                    String str = (String) obj;
                    if (str != null) {
                        objectRef.f71863a = k.h(str);
                    } else {
                        objectRef.f71863a = null;
                    }
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 3:
                    depth = this.f40361a;
                    List list4 = (List) this.f40363c;
                    ResultKt.b(obj);
                    list4.addAll((Collection) obj);
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 4:
                    depth = this.f40361a;
                    List list5 = (List) this.f40363c;
                    ResultKt.b(obj);
                    list5.addAll((Collection) obj);
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 5:
                    depth = this.f40361a;
                    Ref.ObjectRef objectRef5 = (Ref.ObjectRef) this.f40363c;
                    ResultKt.b(obj);
                    objectRef5.f71863a = obj;
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                case 6:
                    depth = this.f40361a;
                    list = (List) this.f40363c;
                    ResultKt.b(obj);
                    list.addAll((Collection) obj);
                    this.f40364d.next();
                    if (this.f40364d.getDepth() < depth) {
                    }
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseLinearTag")
    public static final class C extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public boolean f40373a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40374b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40375c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40376d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40377e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40378f;

        /* renamed from: g, reason: collision with root package name */
        public Object f40379g;

        /* renamed from: h, reason: collision with root package name */
        public Object f40380h;

        /* renamed from: i, reason: collision with root package name */
        public /* synthetic */ Object f40381i;

        /* renamed from: j, reason: collision with root package name */
        public int f40382j;

        public C(Continuation<? super C> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40381i = obj;
            this.f40382j |= Integer.MIN_VALUE;
            return k.g(null, false, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseMediaFileTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class D extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40383a;

        /* renamed from: b, reason: collision with root package name */
        public int f40384b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40385c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40386d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40387e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40388f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40389g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40390h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40391i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40392j;

        /* renamed from: k, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40393k;

        /* renamed from: l, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40394l;

        /* renamed from: m, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40395m;
        public final /* synthetic */ Ref.ObjectRef n;
        public final /* synthetic */ Ref.ObjectRef o;

        /* renamed from: p, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40396p;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public D(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, Ref.ObjectRef objectRef4, Ref.ObjectRef objectRef5, Ref.ObjectRef objectRef6, Ref.ObjectRef objectRef7, Ref.ObjectRef objectRef8, Ref.ObjectRef objectRef9, Ref.ObjectRef objectRef10, Ref.ObjectRef objectRef11, Ref.ObjectRef objectRef12) {
            super(2, continuation);
            this.f40386d = xmlPullParser;
            this.f40387e = objectRef;
            this.f40388f = objectRef2;
            this.f40389g = objectRef3;
            this.f40390h = objectRef4;
            this.f40391i = objectRef5;
            this.f40392j = objectRef6;
            this.f40393k = objectRef7;
            this.f40394l = objectRef8;
            this.f40395m = objectRef9;
            this.n = objectRef10;
            this.o = objectRef11;
            this.f40396p = objectRef12;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((D) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            D d5 = new D(this.f40386d, continuation, this.f40387e, this.f40388f, this.f40389g, this.f40390h, this.f40391i, this.f40392j, this.f40393k, this.f40394l, this.f40395m, this.n, this.o, this.f40396p);
            d5.f40385c = obj;
            return d5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40384b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40385c);
            if (k.j(this.f40386d)) {
                this.f40386d.nextTag();
            }
            if (k.h(this.f40386d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40386d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40386d.getDepth();
            while (this.f40386d.getDepth() >= depth) {
                int depth2 = this.f40386d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40386d);
                    }
                } else if (k.k(this.f40386d)) {
                    XmlPullParser xmlPullParser = this.f40386d;
                    this.f40387e.f71863a = k.b(xmlPullParser, "id");
                    this.f40388f.f71863a = Boolean.valueOf(Intrinsics.b(k.b(xmlPullParser, "delivery"), "progressive"));
                    this.f40389g.f71863a = k.b(xmlPullParser, TTConst.TRACK_TYPE);
                    Ref.ObjectRef objectRef = this.f40390h;
                    String strB = k.b(xmlPullParser, "width");
                    objectRef.f71863a = strB != null ? r70.i.u0(strB) : null;
                    Ref.ObjectRef objectRef2 = this.f40391i;
                    String strB2 = k.b(xmlPullParser, "height");
                    objectRef2.f71863a = strB2 != null ? r70.i.u0(strB2) : null;
                    this.f40392j.f71863a = k.b(xmlPullParser, "codec");
                    Ref.ObjectRef objectRef3 = this.f40393k;
                    String strB3 = k.b(xmlPullParser, "bitrate");
                    objectRef3.f71863a = strB3 != null ? r70.i.u0(strB3) : null;
                    Ref.ObjectRef objectRef4 = this.f40394l;
                    String strB4 = k.b(xmlPullParser, "minBitrate");
                    objectRef4.f71863a = strB4 != null ? r70.i.u0(strB4) : null;
                    Ref.ObjectRef objectRef5 = this.f40395m;
                    String strB5 = k.b(xmlPullParser, "maxBitrate");
                    objectRef5.f71863a = strB5 != null ? r70.i.u0(strB5) : null;
                    Ref.ObjectRef objectRef6 = this.n;
                    String strB6 = k.b(xmlPullParser, "scalable");
                    objectRef6.f71863a = strB6 != null ? Boolean.valueOf(Boolean.parseBoolean(strB6)) : null;
                    this.o.f71863a = k.b(xmlPullParser, "apiFramework");
                } else if (k.l(this.f40386d) && (text = this.f40386d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40386d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40396p.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40386d)) {
                    return Unit.f71706a;
                }
                this.f40386d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseMediaFileTag")
    public static final class E extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40397a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40398b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40399c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40400d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40401e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40402f;

        /* renamed from: g, reason: collision with root package name */
        public Object f40403g;

        /* renamed from: h, reason: collision with root package name */
        public Object f40404h;

        /* renamed from: i, reason: collision with root package name */
        public Object f40405i;

        /* renamed from: j, reason: collision with root package name */
        public Object f40406j;

        /* renamed from: k, reason: collision with root package name */
        public Object f40407k;

        /* renamed from: l, reason: collision with root package name */
        public Object f40408l;

        /* renamed from: m, reason: collision with root package name */
        public /* synthetic */ Object f40409m;
        public int n;

        public E(Continuation<? super E> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40409m = obj;
            this.n |= Integer.MIN_VALUE;
            return k.L(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseMediaFilesTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class F extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40410a;

        /* renamed from: b, reason: collision with root package name */
        public int f40411b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40412c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40413d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ List f40414e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public F(XmlPullParser xmlPullParser, Continuation continuation, List list) {
            super(2, continuation);
            this.f40413d = xmlPullParser;
            this.f40414e = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((F) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            F f11 = new F(this.f40413d, continuation, this.f40414e);
            f11.f40412c = obj;
            return f11;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0081  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00cc  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0059 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0062 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0070 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007a -> B:31:0x007d). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x008d -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00a7 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c0 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40411b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40412c);
                if (k.j(this.f40413d)) {
                    this.f40413d.nextTag();
                }
                if (k.h(this.f40413d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40413d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40413d.getDepth();
                if (this.f40413d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40410a;
                ResultKt.b(obj);
                q qVar = (q) obj;
                if (qVar != null) {
                    this.f40414e.add(qVar);
                }
                this.f40413d.next();
                if (this.f40413d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40413d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40413d)) {
                        if (k.l(this.f40413d) && (text = this.f40413d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40413d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40413d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40413d)) {
                    XmlPullParser xmlPullParser = this.f40413d;
                    if (Intrinsics.b(xmlPullParser.getName(), k.f40347w)) {
                        this.f40410a = depth;
                        this.f40411b = 1;
                        obj = k.L(xmlPullParser, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        q qVar2 = (q) obj;
                        if (qVar2 != null) {
                        }
                    }
                }
                this.f40413d.next();
                if (this.f40413d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseMediaFilesTag")
    public static final class G extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40415a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40416b;

        /* renamed from: c, reason: collision with root package name */
        public int f40417c;

        public G(Continuation<? super G> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40416b = obj;
            this.f40417c |= Integer.MIN_VALUE;
            return k.M(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parsePricingTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class H extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40418a;

        /* renamed from: b, reason: collision with root package name */
        public int f40419b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40420c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40421d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40422e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40423f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public H(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40421d = xmlPullParser;
            this.f40422e = objectRef;
            this.f40423f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((H) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            H h5 = new H(this.f40421d, continuation, this.f40422e, this.f40423f);
            h5.f40420c = obj;
            return h5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40419b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40420c);
            if (k.j(this.f40421d)) {
                this.f40421d.nextTag();
            }
            if (k.h(this.f40421d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40421d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40421d.getDepth();
            while (this.f40421d.getDepth() >= depth) {
                int depth2 = this.f40421d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40421d);
                    }
                } else if (k.k(this.f40421d)) {
                    XmlPullParser xmlPullParser = this.f40421d;
                    this.f40422e.f71863a = k.b(xmlPullParser, "model");
                    this.f40423f.f71863a = k.b(xmlPullParser, TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY);
                } else if (k.l(this.f40421d) && (text = this.f40421d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40421d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    r70.k.u1(text2).toString();
                } else if (k.i(this.f40421d)) {
                    return Unit.f71706a;
                }
                this.f40421d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parsePricingTag")
    public static final class I extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40424a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40425b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40426c;

        /* renamed from: d, reason: collision with root package name */
        public int f40427d;

        public I(Continuation<? super I> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40426c = obj;
            this.f40427d |= Integer.MIN_VALUE;
            return k.N(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseStaticResourceTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class J extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40428a;

        /* renamed from: b, reason: collision with root package name */
        public int f40429b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40430c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40431d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40432e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40433f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public J(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40431d = xmlPullParser;
            this.f40432e = objectRef;
            this.f40433f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((J) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            J j11 = new J(this.f40431d, continuation, this.f40432e, this.f40433f);
            j11.f40430c = obj;
            return j11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40429b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40430c);
            if (k.j(this.f40431d)) {
                this.f40431d.nextTag();
            }
            if (k.h(this.f40431d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40431d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40431d.getDepth();
            while (this.f40431d.getDepth() >= depth) {
                int depth2 = this.f40431d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40431d);
                    }
                } else if (k.k(this.f40431d)) {
                    XmlPullParser xmlPullParser = this.f40431d;
                    Ref.ObjectRef objectRef = this.f40432e;
                    String strB = k.b(xmlPullParser, "creativeType");
                    objectRef.f71863a = strB != null ? k.g(strB) : null;
                } else if (k.l(this.f40431d) && (text = this.f40431d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40431d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40433f.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40431d)) {
                    return Unit.f71706a;
                }
                this.f40431d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseStaticResourceTag")
    public static final class K extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40434a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40435b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40436c;

        /* renamed from: d, reason: collision with root package name */
        public int f40437d;

        public K(Continuation<? super K> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40436c = obj;
            this.f40437d |= Integer.MIN_VALUE;
            return k.O(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseTagsTextOnly$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class L extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40438a;

        /* renamed from: b, reason: collision with root package name */
        public int f40439b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40440c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40441d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40442e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public L(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef) {
            super(2, continuation);
            this.f40441d = xmlPullParser;
            this.f40442e = objectRef;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((L) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            L l9 = new L(this.f40441d, continuation, this.f40442e);
            l9.f40440c = obj;
            return l9;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40439b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40440c);
            if (k.j(this.f40441d)) {
                this.f40441d.nextTag();
            }
            if (k.h(this.f40441d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40441d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40441d.getDepth();
            while (this.f40441d.getDepth() >= depth) {
                int depth2 = this.f40441d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40441d);
                    }
                } else if (k.k(this.f40441d)) {
                    continue;
                } else if (k.l(this.f40441d) && (text = this.f40441d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40441d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40442e.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40441d)) {
                    return Unit.f71706a;
                }
                this.f40441d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseTagsTextOnly")
    public static final class M extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40443a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40444b;

        /* renamed from: c, reason: collision with root package name */
        public int f40445c;

        public M(Continuation<? super M> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40444b = obj;
            this.f40445c |= Integer.MIN_VALUE;
            return k.P(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseTrackingEventsTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class N extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40446a;

        /* renamed from: b, reason: collision with root package name */
        public int f40447b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40448c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40449d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ List f40450e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public N(XmlPullParser xmlPullParser, Continuation continuation, List list) {
            super(2, continuation);
            this.f40449d = xmlPullParser;
            this.f40450e = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((N) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            N n = new N(this.f40449d, continuation, this.f40450e);
            n.f40448c = obj;
            return n;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0081  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00cc  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0059 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0062 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0070 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007a -> B:31:0x007d). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x008d -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00a7 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c0 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40447b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40448c);
                if (k.j(this.f40449d)) {
                    this.f40449d.nextTag();
                }
                if (k.h(this.f40449d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40449d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40449d.getDepth();
                if (this.f40449d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40446a;
                ResultKt.b(obj);
                u uVar = (u) obj;
                if (uVar != null) {
                    this.f40450e.add(uVar);
                }
                this.f40449d.next();
                if (this.f40449d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40449d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40449d)) {
                        if (k.l(this.f40449d) && (text = this.f40449d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40449d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40449d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40449d)) {
                    XmlPullParser xmlPullParser = this.f40449d;
                    if (Intrinsics.b(xmlPullParser.getName(), k.f40349y)) {
                        this.f40446a = depth;
                        this.f40447b = 1;
                        obj = k.R(xmlPullParser, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        u uVar2 = (u) obj;
                        if (uVar2 != null) {
                        }
                    }
                }
                this.f40449d.next();
                if (this.f40449d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseTrackingEventsTag")
    public static final class O extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40451a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40452b;

        /* renamed from: c, reason: collision with root package name */
        public int f40453c;

        public O(Continuation<? super O> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40452b = obj;
            this.f40453c |= Integer.MIN_VALUE;
            return k.Q(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseTrackingTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class P extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40454a;

        /* renamed from: b, reason: collision with root package name */
        public int f40455b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40456c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40457d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40458e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40459f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40460g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public P(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3) {
            super(2, continuation);
            this.f40457d = xmlPullParser;
            this.f40458e = objectRef;
            this.f40459f = objectRef2;
            this.f40460g = objectRef3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((P) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            P p11 = new P(this.f40457d, continuation, this.f40458e, this.f40459f, this.f40460g);
            p11.f40456c = obj;
            return p11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40455b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40456c);
            if (k.j(this.f40457d)) {
                this.f40457d.nextTag();
            }
            if (k.h(this.f40457d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40457d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40457d.getDepth();
            while (this.f40457d.getDepth() >= depth) {
                int depth2 = this.f40457d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40457d);
                    }
                } else if (k.k(this.f40457d)) {
                    XmlPullParser xmlPullParser = this.f40457d;
                    Ref.ObjectRef objectRef = this.f40458e;
                    String strB = k.b(xmlPullParser, DatabaseConstants.EVENT_FIELD);
                    objectRef.f71863a = strB != null ? k.k(strB) : null;
                    Ref.ObjectRef objectRef2 = this.f40459f;
                    String strB2 = k.b(xmlPullParser, "offset");
                    objectRef2.f71863a = strB2 != null ? k.i(strB2) : null;
                } else if (k.l(this.f40457d) && (text = this.f40457d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40457d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40460g.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40457d)) {
                    return Unit.f71706a;
                }
                this.f40457d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseTrackingTag")
    public static final class Q extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40461a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40462b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40463c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f40464d;

        /* renamed from: e, reason: collision with root package name */
        public int f40465e;

        public Q(Continuation<? super Q> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40464d = obj;
            this.f40465e |= Integer.MIN_VALUE;
            return k.R(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseVast$2", f = "VastParser.kt", l = {Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE}, m = "invokeSuspend")
    public static final class R extends SuspendLambda implements Function2<j0, Continuation<? super w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40466a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40467b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public R(XmlPullParser xmlPullParser, Continuation<? super R> continuation) {
            super(2, continuation);
            this.f40467b = xmlPullParser;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super w> continuation) {
            return ((R) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new R(this.f40467b, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40466a;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            XmlPullParser xmlPullParser = this.f40467b;
            this.f40466a = 1;
            Object objT = k.T(xmlPullParser, this);
            return objT == coroutineSingletons ? coroutineSingletons : objT;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseVastTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class S extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40468a;

        /* renamed from: b, reason: collision with root package name */
        public int f40469b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40470c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40471d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40472e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40473f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ List f40474g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public S(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, List list) {
            super(2, continuation);
            this.f40471d = xmlPullParser;
            this.f40472e = objectRef;
            this.f40473f = objectRef2;
            this.f40474g = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((S) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            S s11 = new S(this.f40471d, continuation, this.f40472e, this.f40473f, this.f40474g);
            s11.f40470c = obj;
            return s11;
        }

        /* JADX WARN: Code restructure failed: missing block: B:37:0x00a6, code lost:
        
            if (r7 == r0) goto L38;
         */
        /* JADX WARN: Removed duplicated region for block: B:22:0x005e  */
        /* JADX WARN: Removed duplicated region for block: B:58:0x0104  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x0067 -> B:57:0x00fd). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0071 -> B:57:0x00fd). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x0099 -> B:57:0x00fd). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00a6 -> B:39:0x00a9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00bb -> B:57:0x00fd). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:52:0x00df -> B:57:0x00fd). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x00f8 -> B:57:0x00fd). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40469b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40470c);
                if (k.j(this.f40471d)) {
                    this.f40471d.nextTag();
                }
                if (k.h(this.f40471d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40471d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40471d.getDepth();
                if (this.f40471d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40468a;
                Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f40470c;
                ResultKt.b(obj);
                objectRef.f71863a = obj;
                this.f40471d.next();
                if (this.f40471d.getDepth() < depth) {
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40468a;
                ResultKt.b(obj);
                C3022a c3022a = (C3022a) obj;
                if (c3022a != null) {
                    this.f40474g.add(c3022a);
                }
                this.f40471d.next();
                if (this.f40471d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40471d.getDepth() - depth;
                if (depth2 == 0) {
                    if (k.k(this.f40471d)) {
                        this.f40472e.f71863a = k.b(this.f40471d, "version");
                    } else if (k.l(this.f40471d) && (text = this.f40471d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40471d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40471d)) {
                        return Unit.f71706a;
                    }
                } else if (depth2 == 1 && k.k(this.f40471d)) {
                    XmlPullParser xmlPullParser = this.f40471d;
                    String name = xmlPullParser.getName();
                    if (Intrinsics.b(name, k.f40331e)) {
                        Ref.ObjectRef objectRef2 = this.f40473f;
                        this.f40470c = objectRef2;
                        this.f40468a = depth;
                        this.f40469b = 1;
                        Object objD = k.D(xmlPullParser, this);
                        if (objD != coroutineSingletons) {
                            objectRef2.f71863a = objD;
                        }
                        return coroutineSingletons;
                    }
                    if (Intrinsics.b(name, k.f40332f)) {
                        this.f40470c = null;
                        this.f40468a = depth;
                        this.f40469b = 2;
                        obj = k.A(xmlPullParser, this);
                    }
                    if (this.f40471d.getDepth() < depth) {
                    }
                }
                this.f40471d.next();
                if (this.f40471d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseVastTag")
    public static final class T extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40475a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40476b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40477c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f40478d;

        /* renamed from: e, reason: collision with root package name */
        public int f40479e;

        public T(Continuation<? super T> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40478d = obj;
            this.f40479e |= Integer.MIN_VALUE;
            return k.T(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseVideoClickTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class U extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40480a;

        /* renamed from: b, reason: collision with root package name */
        public int f40481b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40482c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40483d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40484e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40485f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public U(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40483d = xmlPullParser;
            this.f40484e = objectRef;
            this.f40485f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((U) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            U u5 = new U(this.f40483d, continuation, this.f40484e, this.f40485f);
            u5.f40482c = obj;
            return u5;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40481b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40482c);
            if (k.j(this.f40483d)) {
                this.f40483d.nextTag();
            }
            if (k.h(this.f40483d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40483d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40483d.getDepth();
            while (this.f40483d.getDepth() >= depth) {
                int depth2 = this.f40483d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40483d);
                    }
                } else if (k.k(this.f40483d)) {
                    this.f40484e.f71863a = k.b(this.f40483d, "id");
                } else if (k.l(this.f40483d) && (text = this.f40483d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40483d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40485f.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40483d)) {
                    return Unit.f71706a;
                }
                this.f40483d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseVideoClickTag")
    public static final class V extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40486a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40487b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40488c;

        /* renamed from: d, reason: collision with root package name */
        public int f40489d;

        public V(Continuation<? super V> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40488c = obj;
            this.f40489d |= Integer.MIN_VALUE;
            return k.U(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseVideoClicksTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class W extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40490a;

        /* renamed from: b, reason: collision with root package name */
        public int f40491b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40492c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40493d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40494e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ List f40495f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ List f40496g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public W(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, List list, List list2) {
            super(2, continuation);
            this.f40493d = xmlPullParser;
            this.f40494e = objectRef;
            this.f40495f = list;
            this.f40496g = list2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((W) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            W w10 = new W(this.f40493d, continuation, this.f40494e, this.f40495f, this.f40496g);
            w10.f40492c = obj;
            return w10;
        }

        /* JADX WARN: Code restructure failed: missing block: B:43:0x00b0, code lost:
        
            if (r10 == r0) goto L62;
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x00d2, code lost:
        
            if (r10 == r0) goto L62;
         */
        /* JADX WARN: Removed duplicated region for block: B:24:0x0069  */
        /* JADX WARN: Removed duplicated region for block: B:80:0x013f  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0072 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007c -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x0084 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x0098 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00a2 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00b5 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x00b7 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:49:0x00c4 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:52:0x00d2 -> B:54:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x00e5 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x0100 -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:74:0x011a -> B:79:0x0138). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:76:0x0133 -> B:79:0x0138). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            XmlPullParser xmlPullParser;
            String name;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40491b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40492c);
                if (k.j(this.f40493d)) {
                    this.f40493d.nextTag();
                }
                if (k.h(this.f40493d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40493d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40493d.getDepth();
                if (this.f40493d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40490a;
                Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f40492c;
                ResultKt.b(obj);
                objectRef.f71863a = obj;
                this.f40493d.next();
                if (this.f40493d.getDepth() < depth) {
                }
            } else if (i5 == 2) {
                depth = this.f40490a;
                ResultKt.b(obj);
                z zVar = (z) obj;
                if (zVar != null) {
                    this.f40495f.add(zVar);
                }
                this.f40493d.next();
                if (this.f40493d.getDepth() < depth) {
                }
            } else {
                if (i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40490a;
                ResultKt.b(obj);
                z zVar2 = (z) obj;
                if (zVar2 != null) {
                    this.f40496g.add(zVar2);
                }
                this.f40493d.next();
                if (this.f40493d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40493d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40493d)) {
                        if (k.l(this.f40493d) && (text = this.f40493d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40493d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40493d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40493d) && (name = (xmlPullParser = this.f40493d).getName()) != null) {
                    int iHashCode = name.hashCode();
                    if (iHashCode == -617879491) {
                        if (name.equals(k.A)) {
                            Ref.ObjectRef objectRef2 = this.f40494e;
                            this.f40492c = objectRef2;
                            this.f40490a = depth;
                            this.f40491b = 1;
                            Object objU = k.U(xmlPullParser, this);
                            if (objU != coroutineSingletons) {
                                objectRef2.f71863a = objU;
                            }
                            return coroutineSingletons;
                        }
                    } else if (iHashCode == -135761801) {
                        if (name.equals(k.C)) {
                            this.f40492c = null;
                            this.f40490a = depth;
                            this.f40491b = 3;
                            obj = k.U(xmlPullParser, this);
                        }
                    } else if (iHashCode == 2107600959 && name.equals(k.B)) {
                        this.f40492c = null;
                        this.f40490a = depth;
                        this.f40491b = 2;
                        obj = k.U(xmlPullParser, this);
                    }
                    if (this.f40493d.getDepth() < depth) {
                    }
                }
                this.f40493d.next();
                if (this.f40493d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseVideoClicksTag")
    public static final class X extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public boolean f40497a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40498b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40499c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40500d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f40501e;

        /* renamed from: f, reason: collision with root package name */
        public int f40502f;

        public X(Continuation<? super X> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40501e = obj;
            this.f40502f |= Integer.MIN_VALUE;
            return k.h(null, false, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseWrapperTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 128, Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class Y extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40503a;

        /* renamed from: b, reason: collision with root package name */
        public int f40504b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40505c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40506d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40507e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40508f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40509g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ List f40510h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ List f40511i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ List f40512j;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Y(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, List list, List list2, List list3) {
            super(2, continuation);
            this.f40506d = xmlPullParser;
            this.f40507e = objectRef;
            this.f40508f = objectRef2;
            this.f40509g = objectRef3;
            this.f40510h = list;
            this.f40511i = list2;
            this.f40512j = list3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((Y) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            Y y11 = new Y(this.f40506d, continuation, this.f40507e, this.f40508f, this.f40509g, this.f40510h, this.f40511i, this.f40512j);
            y11.f40505c = obj;
            return y11;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Code restructure failed: missing block: B:103:0x019a, code lost:
        
            r8.f71863a = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:43:0x00bc, code lost:
        
            if (r11 == r0) goto L76;
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x00df, code lost:
        
            if (r11 == r0) goto L76;
         */
        /* JADX WARN: Code restructure failed: missing block: B:75:0x013b, code lost:
        
            if (r11 == r0) goto L76;
         */
        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
        /* JADX WARN: Removed duplicated region for block: B:28:0x0081  */
        /* JADX WARN: Removed duplicated region for block: B:97:0x01a1  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x008b -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0095 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x009d -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00a3 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00ae -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c2 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x00c4 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:49:0x00d1 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:55:0x00e4 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:56:0x00e6 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x00f3 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:65:0x0110 -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:72:0x012d -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x013b -> B:77:0x013e). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:91:0x017c -> B:96:0x019a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:93:0x0195 -> B:96:0x019a). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            XmlPullParser xmlPullParser;
            String name;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40504b;
            if (i5 != 0) {
                if (i5 == 1) {
                    depth = this.f40503a;
                    Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f40505c;
                    ResultKt.b(obj);
                    objectRef.f71863a = obj;
                } else if (i5 == 2) {
                    depth = this.f40503a;
                    Ref.ObjectRef objectRef2 = (Ref.ObjectRef) this.f40505c;
                    ResultKt.b(obj);
                    objectRef2.f71863a = obj;
                } else if (i5 == 3) {
                    depth = this.f40503a;
                    ResultKt.b(obj);
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n nVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n) obj;
                    if (nVar != null) {
                        this.f40510h.add(nVar);
                    }
                } else if (i5 == 4) {
                    depth = this.f40503a;
                    ResultKt.b(obj);
                    String str = (String) obj;
                    if (str != null) {
                        this.f40511i.add(str);
                    }
                } else {
                    if (i5 != 5) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    depth = this.f40503a;
                    ResultKt.b(obj);
                    this.f40512j.addAll((List) obj);
                }
                this.f40506d.next();
                if (this.f40506d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40506d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1 && k.k(this.f40506d) && (name = (xmlPullParser = this.f40506d).getName()) != null) {
                        switch (name.hashCode()) {
                            case -1692490108:
                                if (name.equals(k.f40341q)) {
                                    this.f40505c = null;
                                    this.f40503a = depth;
                                    this.f40504b = 5;
                                    obj = k.f(xmlPullParser, false, this);
                                    break;
                                }
                                break;
                            case -1633884078:
                                if (name.equals(k.f40336j)) {
                                    Ref.ObjectRef objectRef3 = this.f40509g;
                                    this.f40505c = objectRef3;
                                    this.f40503a = depth;
                                    this.f40504b = 2;
                                    Object objZ = k.z(xmlPullParser, this);
                                    if (objZ != coroutineSingletons) {
                                        objectRef3.f71863a = objZ;
                                        break;
                                    }
                                    return coroutineSingletons;
                                }
                                break;
                            case -587420703:
                                if (name.equals(k.f40335i)) {
                                    Ref.ObjectRef objectRef4 = this.f40508f;
                                    this.f40505c = objectRef4;
                                    this.f40503a = depth;
                                    this.f40504b = 1;
                                    Object objP = k.P(xmlPullParser, this);
                                    if (objP != coroutineSingletons) {
                                        objectRef4.f71863a = objP;
                                        break;
                                    }
                                    return coroutineSingletons;
                                }
                                break;
                            case 67232232:
                                if (name.equals(k.f40331e)) {
                                    this.f40505c = null;
                                    this.f40503a = depth;
                                    this.f40504b = 4;
                                    obj = k.D(xmlPullParser, this);
                                    break;
                                }
                                break;
                            case 2114088489:
                                if (name.equals(k.f40340p)) {
                                    this.f40505c = null;
                                    this.f40503a = depth;
                                    this.f40504b = 3;
                                    obj = k.J(xmlPullParser, this);
                                    break;
                                }
                                break;
                        }
                    }
                } else if (k.k(this.f40506d)) {
                    XmlPullParser xmlPullParser2 = this.f40506d;
                    Ref.ObjectRef objectRef5 = this.f40507e;
                    String strB = k.b(xmlPullParser2, "followAdditionalWrappers");
                    if (strB != null) {
                        objectRef5.f71863a = Boolean.valueOf(Boolean.parseBoolean(strB));
                    } else {
                        objectRef5.f71863a = Boolean.valueOf(Boolean.parseBoolean(strB));
                    }
                } else if (k.l(this.f40506d) && (text = this.f40506d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40506d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    r70.k.u1(text2).toString();
                } else if (k.i(this.f40506d)) {
                    return Unit.f71706a;
                }
                this.f40506d.next();
                if (this.f40506d.getDepth() < depth) {
                }
            } else {
                ResultKt.b(obj);
                k0.e((j0) this.f40505c);
                if (k.j(this.f40506d)) {
                    this.f40506d.nextTag();
                }
                if (k.h(this.f40506d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40506d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40506d.getDepth();
                if (this.f40506d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseWrapperTag")
    public static final class Z extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40513a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40514b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40515c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40516d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40517e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40518f;

        /* renamed from: g, reason: collision with root package name */
        public /* synthetic */ Object f40519g;

        /* renamed from: h, reason: collision with root package name */
        public int f40520h;

        public Z(Continuation<? super Z> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40519g = obj;
            this.f40520h |= Integer.MIN_VALUE;
            return k.V(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$iterateTag$2", f = "VastParser.kt", l = {102, 103, 111}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$a, reason: case insensitive filesystem */
    public static final class C2997a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40521a;

        /* renamed from: b, reason: collision with root package name */
        public int f40522b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40523c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40524d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Function2<XmlPullParser, Continuation<? super Unit>, Object> f40525e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Function3<XmlPullParser, String, Continuation<? super Unit>, Object> f40526f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Function2<XmlPullParser, Continuation<? super Unit>, Object> f40527g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public C2997a(XmlPullParser xmlPullParser, Function2<? super XmlPullParser, ? super Continuation<? super Unit>, ? extends Object> function2, Function3<? super XmlPullParser, ? super String, ? super Continuation<? super Unit>, ? extends Object> function3, Function2<? super XmlPullParser, ? super Continuation<? super Unit>, ? extends Object> function22, Continuation<? super C2997a> continuation) {
            super(2, continuation);
            this.f40524d = xmlPullParser;
            this.f40525e = function2;
            this.f40526f = function3;
            this.f40527g = function22;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C2997a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C2997a c2997a = new C2997a(this.f40524d, this.f40525e, this.f40526f, this.f40527g, continuation);
            c2997a.f40523c = obj;
            return c2997a;
        }

        /* JADX WARN: Code restructure failed: missing block: B:30:0x0079, code lost:
        
            if (r9.invoke(r5, r8) == r0) goto L46;
         */
        /* JADX WARN: Code restructure failed: missing block: B:35:0x0090, code lost:
        
            if (r9.invoke(r5, r8) == r0) goto L46;
         */
        /* JADX WARN: Code restructure failed: missing block: B:45:0x00c7, code lost:
        
            if (r9.invoke(r5, r6, r8) == r0) goto L46;
         */
        /* JADX WARN: Code restructure failed: missing block: B:46:0x00c9, code lost:
        
            return r0;
         */
        /* JADX WARN: Removed duplicated region for block: B:23:0x0058  */
        /* JADX WARN: Removed duplicated region for block: B:52:0x00dc  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0061 -> B:51:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:28:0x006b -> B:51:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x0079 -> B:51:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x0090 -> B:51:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:45:0x00c7 -> B:51:0x00d5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00d0 -> B:51:0x00d5). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40522b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40523c);
                if (k.j(this.f40524d)) {
                    this.f40524d.nextTag();
                }
                if (k.h(this.f40524d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40524d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40524d.getDepth();
                if (this.f40524d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1 && i5 != 2 && i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40521a;
                ResultKt.b(obj);
                this.f40524d.next();
                if (this.f40524d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40524d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1 && k.k(this.f40524d)) {
                        Function2<XmlPullParser, Continuation<? super Unit>, Object> function2 = this.f40527g;
                        XmlPullParser xmlPullParser = this.f40524d;
                        this.f40521a = depth;
                        this.f40522b = 3;
                    }
                    this.f40524d.next();
                } else if (k.k(this.f40524d)) {
                    Function2<XmlPullParser, Continuation<? super Unit>, Object> function22 = this.f40525e;
                    XmlPullParser xmlPullParser2 = this.f40524d;
                    this.f40521a = depth;
                    this.f40522b = 1;
                } else {
                    if (k.l(this.f40524d) && (text = this.f40524d.getText()) != null && !r70.k.U0(text)) {
                        Function3<XmlPullParser, String, Continuation<? super Unit>, Object> function3 = this.f40526f;
                        XmlPullParser xmlPullParser3 = this.f40524d;
                        String text2 = xmlPullParser3.getText();
                        Intrinsics.f(text2, "getText(...)");
                        String string = r70.k.u1(text2).toString();
                        this.f40521a = depth;
                        this.f40522b = 2;
                    } else if (k.i(this.f40524d)) {
                        return Unit.f71706a;
                    }
                    this.f40524d.next();
                }
                if (this.f40524d.getDepth() < depth) {
                }
            }
        }

        public final Object a(Object obj) throws XmlPullParserException, IOException {
            String text;
            k0.e((j0) this.f40523c);
            if (k.j(this.f40524d)) {
                this.f40524d.nextTag();
            }
            if (k.h(this.f40524d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40524d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40524d.getDepth();
            while (this.f40524d.getDepth() >= depth) {
                int depth2 = this.f40524d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1 && k.k(this.f40524d)) {
                        this.f40527g.invoke(this.f40524d, this);
                    }
                } else if (k.k(this.f40524d)) {
                    this.f40525e.invoke(this.f40524d, this);
                } else if (k.l(this.f40524d) && (text = this.f40524d.getText()) != null && !r70.k.U0(text)) {
                    Function3<XmlPullParser, String, Continuation<? super Unit>, Object> function3 = this.f40526f;
                    XmlPullParser xmlPullParser = this.f40524d;
                    String text2 = xmlPullParser.getText();
                    Intrinsics.f(text2, "getText(...)");
                    function3.invoke(xmlPullParser, r70.k.u1(text2).toString(), this);
                } else if (k.i(this.f40524d)) {
                    return Unit.f71706a;
                }
                this.f40524d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseAdParametersTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$b, reason: case insensitive filesystem */
    public static final class C2998b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40528a;

        /* renamed from: b, reason: collision with root package name */
        public int f40529b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40530c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40531d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40532e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40533f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C2998b(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40531d = xmlPullParser;
            this.f40532e = objectRef;
            this.f40533f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C2998b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C2998b c2998b = new C2998b(this.f40531d, continuation, this.f40532e, this.f40533f);
            c2998b.f40530c = obj;
            return c2998b;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40529b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40530c);
            if (k.j(this.f40531d)) {
                this.f40531d.nextTag();
            }
            if (k.h(this.f40531d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40531d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40531d.getDepth();
            while (this.f40531d.getDepth() >= depth) {
                int depth2 = this.f40531d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40531d);
                    }
                } else if (k.k(this.f40531d)) {
                    XmlPullParser xmlPullParser = this.f40531d;
                    Ref.ObjectRef objectRef = this.f40532e;
                    String strB = k.b(xmlPullParser, "xmlEncoded");
                    objectRef.f71863a = strB != null ? Boolean.valueOf(Boolean.parseBoolean(strB)) : null;
                } else if (k.l(this.f40531d) && (text = this.f40531d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40531d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40533f.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40531d)) {
                    return Unit.f71706a;
                }
                this.f40531d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseAdParametersTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$c, reason: case insensitive filesystem */
    public static final class C2999c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40534a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40535b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40536c;

        /* renamed from: d, reason: collision with root package name */
        public int f40537d;

        public C2999c(Continuation<? super C2999c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40536c = obj;
            this.f40537d |= Integer.MIN_VALUE;
            return k.y(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseAdSystemTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$d, reason: case insensitive filesystem */
    public static final class C3000d extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40538a;

        /* renamed from: b, reason: collision with root package name */
        public int f40539b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40540c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40541d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40542e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40543f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3000d(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40541d = xmlPullParser;
            this.f40542e = objectRef;
            this.f40543f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3000d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3000d c3000d = new C3000d(this.f40541d, continuation, this.f40542e, this.f40543f);
            c3000d.f40540c = obj;
            return c3000d;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40539b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40540c);
            if (k.j(this.f40541d)) {
                this.f40541d.nextTag();
            }
            if (k.h(this.f40541d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40541d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40541d.getDepth();
            while (this.f40541d.getDepth() >= depth) {
                int depth2 = this.f40541d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40541d);
                    }
                } else if (k.k(this.f40541d)) {
                    this.f40542e.f71863a = k.b(this.f40541d, "version");
                } else if (k.l(this.f40541d) && (text = this.f40541d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40541d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40543f.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40541d)) {
                    return Unit.f71706a;
                }
                this.f40541d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseAdSystemTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$e, reason: case insensitive filesystem */
    public static final class C3001e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40544a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40545b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40546c;

        /* renamed from: d, reason: collision with root package name */
        public int f40547d;

        public C3001e(Continuation<? super C3001e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40546c = obj;
            this.f40547d |= Integer.MIN_VALUE;
            return k.z(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseAdTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$f, reason: case insensitive filesystem */
    public static final class C3002f extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40548a;

        /* renamed from: b, reason: collision with root package name */
        public int f40549b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40550c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40551d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40552e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40553f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40554g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3002f(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3) {
            super(2, continuation);
            this.f40551d = xmlPullParser;
            this.f40552e = objectRef;
            this.f40553f = objectRef2;
            this.f40554g = objectRef3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3002f) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3002f c3002f = new C3002f(this.f40551d, continuation, this.f40552e, this.f40553f, this.f40554g);
            c3002f.f40550c = obj;
            return c3002f;
        }

        /* JADX WARN: Code restructure failed: missing block: B:39:0x00b4, code lost:
        
            if (r9 == r0) goto L40;
         */
        /* JADX WARN: Code restructure failed: missing block: B:67:0x00c2, code lost:
        
            r6 = null;
         */
        /* JADX WARN: Removed duplicated region for block: B:22:0x0064  */
        /* JADX WARN: Removed duplicated region for block: B:44:0x00c1  */
        /* JADX WARN: Removed duplicated region for block: B:62:0x011e  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x006d -> B:61:0x0117). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0077 -> B:61:0x0117). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007f -> B:61:0x0117). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x00b4 -> B:41:0x00b7). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00cd -> B:61:0x0117). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:56:0x00f9 -> B:61:0x0117). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:58:0x0112 -> B:61:0x0117). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            Ref.ObjectRef objectRef;
            Object aVar;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40549b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40550c);
                if (k.j(this.f40551d)) {
                    this.f40551d.nextTag();
                }
                if (k.h(this.f40551d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40551d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40551d.getDepth();
                if (this.f40551d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40548a;
                objectRef = (Ref.ObjectRef) this.f40550c;
                ResultKt.b(obj);
                aVar = new AbstractC3023b.a((o) obj);
                objectRef.f71863a = aVar;
                this.f40551d.next();
                if (this.f40551d.getDepth() < depth) {
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40548a;
                objectRef = (Ref.ObjectRef) this.f40550c;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.B b11 = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.B) obj;
                aVar = b11 != null ? new AbstractC3023b.C0257b(b11) : null;
                objectRef.f71863a = aVar;
                this.f40551d.next();
                if (this.f40551d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40551d.getDepth() - depth;
                if (depth2 == 0) {
                    if (k.k(this.f40551d)) {
                        XmlPullParser xmlPullParser = this.f40551d;
                        this.f40552e.f71863a = k.b(xmlPullParser, "id");
                        this.f40553f.f71863a = k.m(xmlPullParser);
                    } else if (k.l(this.f40551d) && (text = this.f40551d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40551d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40551d)) {
                        return Unit.f71706a;
                    }
                } else if (depth2 == 1 && k.k(this.f40551d)) {
                    XmlPullParser xmlPullParser2 = this.f40551d;
                    objectRef = this.f40554g;
                    if (objectRef.f71863a == null) {
                        String name = xmlPullParser2.getName();
                        if (Intrinsics.b(name, k.f40333g)) {
                            this.f40550c = objectRef;
                            this.f40548a = depth;
                            this.f40549b = 1;
                            Object objK = k.K(xmlPullParser2, this);
                            if (objK != coroutineSingletons) {
                                aVar = new AbstractC3023b.a((o) objK);
                                objectRef.f71863a = aVar;
                            }
                            return coroutineSingletons;
                        }
                        if (Intrinsics.b(name, k.f40334h)) {
                            this.f40550c = objectRef;
                            this.f40548a = depth;
                            this.f40549b = 2;
                            obj = k.V(xmlPullParser2, this);
                        }
                    }
                }
                this.f40551d.next();
                if (this.f40551d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseAdTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$g, reason: case insensitive filesystem */
    public static final class C3003g extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40555a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40556b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40557c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f40558d;

        /* renamed from: e, reason: collision with root package name */
        public int f40559e;

        public C3003g(Continuation<? super C3003g> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40558d = obj;
            this.f40559e |= Integer.MIN_VALUE;
            return k.A(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseCompanionAdsTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$h, reason: case insensitive filesystem */
    public static final class C3004h extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40560a;

        /* renamed from: b, reason: collision with root package name */
        public int f40561b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40562c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40563d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ List f40564e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3004h(XmlPullParser xmlPullParser, Continuation continuation, List list) {
            super(2, continuation);
            this.f40563d = xmlPullParser;
            this.f40564e = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3004h) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3004h c3004h = new C3004h(this.f40563d, continuation, this.f40564e);
            c3004h.f40562c = obj;
            return c3004h;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0081  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00cc  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0059 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0062 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0070 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007a -> B:31:0x007d). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x008d -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00a7 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c0 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40561b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40562c);
                if (k.j(this.f40563d)) {
                    this.f40563d.nextTag();
                }
                if (k.h(this.f40563d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40563d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40563d.getDepth();
                if (this.f40563d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40560a;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e) obj;
                if (eVar != null) {
                    this.f40564e.add(eVar);
                }
                this.f40563d.next();
                if (this.f40563d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40563d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40563d)) {
                        if (k.l(this.f40563d) && (text = this.f40563d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40563d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40563d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40563d)) {
                    XmlPullParser xmlPullParser = this.f40563d;
                    if (Intrinsics.b(xmlPullParser.getName(), k.O)) {
                        this.f40560a = depth;
                        this.f40561b = 1;
                        obj = k.C(xmlPullParser, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e eVar2 = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e) obj;
                        if (eVar2 != null) {
                        }
                    }
                }
                this.f40563d.next();
                if (this.f40563d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseCompanionAdsTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$i, reason: case insensitive filesystem */
    public static final class C3005i extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40565a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40566b;

        /* renamed from: c, reason: collision with root package name */
        public int f40567c;

        public C3005i(Continuation<? super C3005i> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40566b = obj;
            this.f40567c |= Integer.MIN_VALUE;
            return k.B(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseCompanionTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {128, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 141, 146, 147}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$j, reason: case insensitive filesystem */
    public static final class C3006j extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40568a;

        /* renamed from: b, reason: collision with root package name */
        public int f40569b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40570c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40571d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40572e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40573f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40574g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40575h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40576i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40577j;

        /* renamed from: k, reason: collision with root package name */
        public final /* synthetic */ List f40578k;

        /* renamed from: l, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40579l;

        /* renamed from: m, reason: collision with root package name */
        public final /* synthetic */ List f40580m;
        public final /* synthetic */ List n;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3006j(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, Ref.ObjectRef objectRef4, Ref.ObjectRef objectRef5, Ref.ObjectRef objectRef6, List list, Ref.ObjectRef objectRef7, List list2, List list3) {
            super(2, continuation);
            this.f40571d = xmlPullParser;
            this.f40572e = objectRef;
            this.f40573f = objectRef2;
            this.f40574g = objectRef3;
            this.f40575h = objectRef4;
            this.f40576i = objectRef5;
            this.f40577j = objectRef6;
            this.f40578k = list;
            this.f40579l = objectRef7;
            this.f40580m = list2;
            this.n = list3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3006j) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3006j c3006j = new C3006j(this.f40571d, continuation, this.f40572e, this.f40573f, this.f40574g, this.f40575h, this.f40576i, this.f40577j, this.f40578k, this.f40579l, this.f40580m, this.n);
            c3006j.f40570c = obj;
            return c3006j;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Code restructure failed: missing block: B:138:0x026b, code lost:
        
            r3.f71863a = null;
            r7.f40575h.f71863a = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.b(r8, "apiFramework");
         */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x00cd, code lost:
        
            if (r8 == r0) goto L106;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x00f7, code lost:
        
            if (r8 == r0) goto L106;
         */
        /* JADX WARN: Code restructure failed: missing block: B:67:0x0139, code lost:
        
            if (r8 == r0) goto L106;
         */
        /* JADX WARN: Code restructure failed: missing block: B:76:0x0164, code lost:
        
            if (r8 == r0) goto L106;
         */
        /* JADX WARN: Code restructure failed: missing block: B:96:0x01c4, code lost:
        
            if (r8 == r0) goto L106;
         */
        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
        /* JADX WARN: Removed duplicated region for block: B:131:0x0272  */
        /* JADX WARN: Removed duplicated region for block: B:26:0x0090  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:100:0x01cb -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:102:0x01dd -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:125:0x024d -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:127:0x0266 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x009b -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x00a5 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00ad -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00b3 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x00be -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:45:0x00d3 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00d5 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00e7 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x00f7 -> B:53:0x00fb). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:57:0x010c -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x012b -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:70:0x013f -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:71:0x0141 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:73:0x0153 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:84:0x018c -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:86:0x0197 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:93:0x01b5 -> B:130:0x026b). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:99:0x01c9 -> B:130:0x026b). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            List list;
            String text;
            XmlPullParser xmlPullParser;
            String name;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            switch (this.f40569b) {
                case 0:
                    ResultKt.b(obj);
                    k0.e((j0) this.f40570c);
                    if (k.j(this.f40571d)) {
                        this.f40571d.nextTag();
                    }
                    if (k.h(this.f40571d)) {
                        return Unit.f71706a;
                    }
                    if (!k.k(this.f40571d)) {
                        throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                    }
                    depth = this.f40571d.getDepth();
                    if (this.f40571d.getDepth() < depth) {
                        return Unit.f71706a;
                    }
                    int depth2 = this.f40571d.getDepth() - depth;
                    if (depth2 != 0) {
                        if (depth2 == 1 && k.k(this.f40571d) && (name = (xmlPullParser = this.f40571d).getName()) != null) {
                            switch (name.hashCode()) {
                                case -1348833651:
                                    if (name.equals(k.f40344t)) {
                                        Ref.ObjectRef objectRef = this.f40577j;
                                        this.f40570c = objectRef;
                                        this.f40568a = depth;
                                        this.f40569b = 5;
                                        Object objY = k.y(xmlPullParser, this);
                                        if (objY != coroutineSingletons) {
                                            objectRef.f71863a = objY;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case -375340334:
                                    if (name.equals(k.G)) {
                                        this.f40570c = null;
                                        this.f40568a = depth;
                                        this.f40569b = 3;
                                        obj = k.F(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case -348198615:
                                    if (name.equals(k.P)) {
                                        Ref.ObjectRef objectRef2 = this.f40579l;
                                        this.f40570c = objectRef2;
                                        this.f40568a = depth;
                                        this.f40569b = 7;
                                        Object objP = k.P(xmlPullParser, this);
                                        if (objP != coroutineSingletons) {
                                            objectRef2.f71863a = objP;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 611554000:
                                    if (name.equals(k.f40348x)) {
                                        list = this.f40578k;
                                        this.f40570c = list;
                                        this.f40568a = depth;
                                        this.f40569b = 6;
                                        obj = k.Q(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case 676623548:
                                    if (name.equals(k.F)) {
                                        this.f40570c = null;
                                        this.f40568a = depth;
                                        this.f40569b = 1;
                                        obj = k.O(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case 759877206:
                                    if (name.equals(k.M)) {
                                        Ref.ObjectRef objectRef3 = this.f40576i;
                                        this.f40570c = objectRef3;
                                        this.f40568a = depth;
                                        this.f40569b = 4;
                                        Object objP2 = k.P(xmlPullParser, this);
                                        if (objP2 != coroutineSingletons) {
                                            objectRef3.f71863a = objP2;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 1877773523:
                                    if (name.equals(k.Q)) {
                                        this.f40570c = null;
                                        this.f40568a = depth;
                                        this.f40569b = 8;
                                        obj = k.P(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case 1928285401:
                                    if (name.equals(k.H)) {
                                        this.f40570c = null;
                                        this.f40568a = depth;
                                        this.f40569b = 2;
                                        obj = k.E(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                            }
                        }
                    } else if (k.k(this.f40571d)) {
                        XmlPullParser xmlPullParser2 = this.f40571d;
                        this.f40572e.f71863a = k.b(xmlPullParser2, "id");
                        Ref.ObjectRef objectRef4 = this.f40573f;
                        String strB = k.b(xmlPullParser2, "width");
                        objectRef4.f71863a = strB != null ? r70.i.u0(strB) : null;
                        Ref.ObjectRef objectRef5 = this.f40574g;
                        String strB2 = k.b(xmlPullParser2, "height");
                        if (strB2 != null) {
                            objectRef5.f71863a = r70.i.u0(strB2);
                            this.f40575h.f71863a = k.b(xmlPullParser2, "apiFramework");
                        } else {
                            objectRef5.f71863a = r70.i.u0(strB2);
                            this.f40575h.f71863a = k.b(xmlPullParser2, "apiFramework");
                        }
                    } else if (k.l(this.f40571d) && (text = this.f40571d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40571d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40571d)) {
                        return Unit.f71706a;
                    }
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 1:
                    depth = this.f40568a;
                    ResultKt.b(obj);
                    t tVar = (t) obj;
                    if (tVar != null) {
                        this.f40580m.add(new y.c(tVar));
                    }
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 2:
                    depth = this.f40568a;
                    ResultKt.b(obj);
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j jVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j) obj;
                    if (jVar != null) {
                        this.f40580m.add(new y.a(jVar));
                    }
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 3:
                    depth = this.f40568a;
                    ResultKt.b(obj);
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k kVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k) obj;
                    if (kVar != null) {
                        this.f40580m.add(new y.b(kVar));
                    }
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 4:
                    depth = this.f40568a;
                    Ref.ObjectRef objectRef6 = (Ref.ObjectRef) this.f40570c;
                    ResultKt.b(obj);
                    objectRef6.f71863a = obj;
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 5:
                    depth = this.f40568a;
                    Ref.ObjectRef objectRef7 = (Ref.ObjectRef) this.f40570c;
                    ResultKt.b(obj);
                    objectRef7.f71863a = obj;
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 6:
                    depth = this.f40568a;
                    list = (List) this.f40570c;
                    ResultKt.b(obj);
                    ArrayList arrayList = new ArrayList();
                    for (Object obj2 : (Iterable) obj) {
                        if (((u) obj2).d() == v.f40824a) {
                            arrayList.add(obj2);
                        }
                    }
                    list.addAll(arrayList);
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 7:
                    depth = this.f40568a;
                    Ref.ObjectRef objectRef8 = (Ref.ObjectRef) this.f40570c;
                    ResultKt.b(obj);
                    objectRef8.f71863a = obj;
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                case 8:
                    depth = this.f40568a;
                    ResultKt.b(obj);
                    String str = (String) obj;
                    if (str != null) {
                        this.n.add(str);
                    }
                    this.f40571d.next();
                    if (this.f40571d.getDepth() < depth) {
                    }
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseCompanionTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$k, reason: collision with other inner class name */
    public static final class C0256k extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40581a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40582b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40583c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40584d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40585e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40586f;

        /* renamed from: g, reason: collision with root package name */
        public Object f40587g;

        /* renamed from: h, reason: collision with root package name */
        public Object f40588h;

        /* renamed from: i, reason: collision with root package name */
        public Object f40589i;

        /* renamed from: j, reason: collision with root package name */
        public Object f40590j;

        /* renamed from: k, reason: collision with root package name */
        public /* synthetic */ Object f40591k;

        /* renamed from: l, reason: collision with root package name */
        public int f40592l;

        public C0256k(Continuation<? super C0256k> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40591k = obj;
            this.f40592l |= Integer.MIN_VALUE;
            return k.C(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseCreativeTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$l, reason: case insensitive filesystem */
    public static final class C3007l extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40593a;

        /* renamed from: b, reason: collision with root package name */
        public int f40594b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40595c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40596d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40597e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40598f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40599g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40600h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40601i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ boolean f40602j;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3007l(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, Ref.ObjectRef objectRef4, Ref.ObjectRef objectRef5, boolean z11) {
            super(2, continuation);
            this.f40596d = xmlPullParser;
            this.f40597e = objectRef;
            this.f40598f = objectRef2;
            this.f40599g = objectRef3;
            this.f40600h = objectRef4;
            this.f40601i = objectRef5;
            this.f40602j = z11;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3007l) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3007l c3007l = new C3007l(this.f40596d, continuation, this.f40597e, this.f40598f, this.f40599g, this.f40600h, this.f40601i, this.f40602j);
            c3007l.f40595c = obj;
            return c3007l;
        }

        /* JADX WARN: Code restructure failed: missing block: B:33:0x0099, code lost:
        
            if (r9 == r0) goto L42;
         */
        /* JADX WARN: Code restructure failed: missing block: B:41:0x00b8, code lost:
        
            if (r9 == r0) goto L42;
         */
        /* JADX WARN: Removed duplicated region for block: B:22:0x0064  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00d0 A[PHI: r1 r5
          0x00d0: PHI (r1v2 int) = (r1v3 int), (r1v4 int), (r1v7 int) binds: [B:36:0x009e, B:39:0x00ac, B:48:0x00c8] A[DONT_GENERATE, DONT_INLINE]
          0x00d0: PHI (r5v0 kotlin.jvm.internal.Ref$ObjectRef) = 
          (r5v1 kotlin.jvm.internal.Ref$ObjectRef)
          (r5v7 kotlin.jvm.internal.Ref$ObjectRef)
          (r5v9 kotlin.jvm.internal.Ref$ObjectRef)
         binds: [B:36:0x009e, B:39:0x00ac, B:48:0x00c8] A[DONT_GENERATE, DONT_INLINE]] */
        /* JADX WARN: Removed duplicated region for block: B:68:0x0141  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x006d -> B:67:0x013a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0077 -> B:67:0x013a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007f -> B:67:0x013a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00a0 -> B:51:0x00d1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00b8 -> B:43:0x00bb). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:50:0x00d0 -> B:51:0x00d1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x00dc -> B:67:0x013a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:62:0x011c -> B:67:0x013a). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x0135 -> B:67:0x013a). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            Ref.ObjectRef objectRef;
            Object bVar;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40594b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40595c);
                if (k.j(this.f40596d)) {
                    this.f40596d.nextTag();
                }
                if (k.h(this.f40596d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40596d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40596d.getDepth();
                if (this.f40596d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40593a;
                objectRef = (Ref.ObjectRef) this.f40595c;
                ResultKt.b(obj);
                p pVar = (p) obj;
                if (pVar != null) {
                    bVar = new h.b(pVar);
                }
                objectRef.f71863a = bVar;
                this.f40596d.next();
                if (this.f40596d.getDepth() < depth) {
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40593a;
                objectRef = (Ref.ObjectRef) this.f40595c;
                ResultKt.b(obj);
                if (((List) obj).isEmpty()) {
                    obj = null;
                }
                List list = (List) obj;
                bVar = list != null ? new h.a(list) : null;
                objectRef.f71863a = bVar;
                this.f40596d.next();
                if (this.f40596d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40596d.getDepth() - depth;
                if (depth2 == 0) {
                    if (k.k(this.f40596d)) {
                        XmlPullParser xmlPullParser = this.f40596d;
                        this.f40597e.f71863a = k.b(xmlPullParser, "id");
                        this.f40598f.f71863a = k.m(xmlPullParser);
                        this.f40599g.f71863a = k.b(xmlPullParser, "adID");
                        this.f40600h.f71863a = k.b(xmlPullParser, "apiFramework");
                    } else if (k.l(this.f40596d) && (text = this.f40596d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40596d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40596d)) {
                        return Unit.f71706a;
                    }
                } else if (depth2 == 1 && k.k(this.f40596d)) {
                    XmlPullParser xmlPullParser2 = this.f40596d;
                    objectRef = this.f40601i;
                    if (objectRef.f71863a == null) {
                        String name = xmlPullParser2.getName();
                        if (Intrinsics.b(name, k.f40343s)) {
                            boolean z11 = this.f40602j;
                            this.f40595c = objectRef;
                            this.f40593a = depth;
                            this.f40594b = 1;
                            obj = k.g(xmlPullParser2, z11, this);
                        } else {
                            if (Intrinsics.b(name, k.N)) {
                                this.f40595c = objectRef;
                                this.f40593a = depth;
                                this.f40594b = 2;
                                obj = k.B(xmlPullParser2, this);
                            }
                            objectRef.f71863a = bVar;
                        }
                        return coroutineSingletons;
                    }
                }
                this.f40596d.next();
                if (this.f40596d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseCreativeTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$m, reason: case insensitive filesystem */
    public static final class C3008m extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40603a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40604b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40605c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40606d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40607e;

        /* renamed from: f, reason: collision with root package name */
        public /* synthetic */ Object f40608f;

        /* renamed from: g, reason: collision with root package name */
        public int f40609g;

        public C3008m(Continuation<? super C3008m> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40608f = obj;
            this.f40609g |= Integer.MIN_VALUE;
            return k.e(null, false, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseCreativesTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$n, reason: case insensitive filesystem */
    public static final class C3009n extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40610a;

        /* renamed from: b, reason: collision with root package name */
        public int f40611b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40612c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40613d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ boolean f40614e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ List f40615f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3009n(XmlPullParser xmlPullParser, Continuation continuation, boolean z11, List list) {
            super(2, continuation);
            this.f40613d = xmlPullParser;
            this.f40614e = z11;
            this.f40615f = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3009n) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3009n c3009n = new C3009n(this.f40613d, continuation, this.f40614e, this.f40615f);
            c3009n.f40612c = obj;
            return c3009n;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0051  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0084  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00cf  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x005a -> B:49:0x00c8). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0063 -> B:49:0x00c8). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0071 -> B:49:0x00c8). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007d -> B:31:0x0080). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x0090 -> B:49:0x00c8). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00aa -> B:49:0x00c8). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c3 -> B:49:0x00c8). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40611b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40612c);
                if (k.j(this.f40613d)) {
                    this.f40613d.nextTag();
                }
                if (k.h(this.f40613d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40613d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40613d.getDepth();
                if (this.f40613d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40610a;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g gVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g) obj;
                if (gVar != null) {
                    this.f40615f.add(gVar);
                }
                this.f40613d.next();
                if (this.f40613d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40613d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40613d)) {
                        if (k.l(this.f40613d) && (text = this.f40613d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40613d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40613d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40613d)) {
                    XmlPullParser xmlPullParser = this.f40613d;
                    if (Intrinsics.b(xmlPullParser.getName(), k.f40342r)) {
                        boolean z11 = this.f40614e;
                        this.f40610a = depth;
                        this.f40611b = 1;
                        obj = k.e(xmlPullParser, z11, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g gVar2 = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g) obj;
                        if (gVar2 != null) {
                        }
                    }
                }
                this.f40613d.next();
                if (this.f40613d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseCreativesTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$o, reason: case insensitive filesystem */
    public static final class C3010o extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40616a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40617b;

        /* renamed from: c, reason: collision with root package name */
        public int f40618c;

        public C3010o(Continuation<? super C3010o> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40617b = obj;
            this.f40618c |= Integer.MIN_VALUE;
            return k.f(null, false, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {827}, m = "parseHtmlResourceTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$p, reason: case insensitive filesystem */
    public static final class C3011p extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f40619a;

        /* renamed from: b, reason: collision with root package name */
        public int f40620b;

        public C3011p(Continuation<? super C3011p> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40619a = obj;
            this.f40620b |= Integer.MIN_VALUE;
            return k.E(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {830}, m = "parseIFrameResourceTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$q, reason: case insensitive filesystem */
    public static final class C3012q extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f40621a;

        /* renamed from: b, reason: collision with root package name */
        public int f40622b;

        public C3012q(Continuation<? super C3012q> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40621a = obj;
            this.f40622b |= Integer.MIN_VALUE;
            return k.F(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseIconClicksTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$r, reason: case insensitive filesystem */
    public static final class C3013r extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40623a;

        /* renamed from: b, reason: collision with root package name */
        public int f40624b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40625c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40626d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40627e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ List f40628f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3013r(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, List list) {
            super(2, continuation);
            this.f40626d = xmlPullParser;
            this.f40627e = objectRef;
            this.f40628f = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3013r) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3013r c3013r = new C3013r(this.f40626d, continuation, this.f40627e, this.f40628f);
            c3013r.f40625c = obj;
            return c3013r;
        }

        /* JADX WARN: Code restructure failed: missing block: B:37:0x00a6, code lost:
        
            if (r7 == r0) goto L38;
         */
        /* JADX WARN: Removed duplicated region for block: B:22:0x005e  */
        /* JADX WARN: Removed duplicated region for block: B:58:0x00f8  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x0067 -> B:57:0x00f1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0071 -> B:57:0x00f1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x0099 -> B:57:0x00f1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00a6 -> B:39:0x00a9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:43:0x00b9 -> B:57:0x00f1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:52:0x00d3 -> B:57:0x00f1). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x00ec -> B:57:0x00f1). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40624b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40625c);
                if (k.j(this.f40626d)) {
                    this.f40626d.nextTag();
                }
                if (k.h(this.f40626d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40626d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40626d.getDepth();
                if (this.f40626d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40623a;
                Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f40625c;
                ResultKt.b(obj);
                objectRef.f71863a = obj;
                this.f40626d.next();
                if (this.f40626d.getDepth() < depth) {
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40623a;
                ResultKt.b(obj);
                String str = (String) obj;
                if (str != null) {
                    this.f40628f.add(str);
                }
                this.f40626d.next();
                if (this.f40626d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40626d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40626d)) {
                        if (k.l(this.f40626d) && (text = this.f40626d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40626d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40626d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40626d)) {
                    XmlPullParser xmlPullParser = this.f40626d;
                    String name = xmlPullParser.getName();
                    if (Intrinsics.b(name, k.J)) {
                        Ref.ObjectRef objectRef2 = this.f40627e;
                        this.f40625c = objectRef2;
                        this.f40623a = depth;
                        this.f40624b = 1;
                        Object objP = k.P(xmlPullParser, this);
                        if (objP != coroutineSingletons) {
                            objectRef2.f71863a = objP;
                        }
                        return coroutineSingletons;
                    }
                    if (Intrinsics.b(name, k.K)) {
                        this.f40625c = null;
                        this.f40623a = depth;
                        this.f40624b = 2;
                        obj = k.P(xmlPullParser, this);
                    }
                    if (this.f40626d.getDepth() < depth) {
                    }
                }
                this.f40626d.next();
                if (this.f40626d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseIconClicksTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$s, reason: case insensitive filesystem */
    public static final class C3014s extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40629a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40630b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40631c;

        /* renamed from: d, reason: collision with root package name */
        public int f40632d;

        public C3014s(Continuation<? super C3014s> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40631c = obj;
            this.f40632d |= Integer.MIN_VALUE;
            return k.G(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseIconTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 139, 140}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$t, reason: case insensitive filesystem */
    public static final class C3015t extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40633a;

        /* renamed from: b, reason: collision with root package name */
        public int f40634b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40635c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40636d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40637e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40638f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40639g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40640h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40641i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40642j;

        /* renamed from: k, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40643k;

        /* renamed from: l, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40644l;

        /* renamed from: m, reason: collision with root package name */
        public final /* synthetic */ List f40645m;
        public Object n;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3015t(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, Ref.ObjectRef objectRef4, Ref.ObjectRef objectRef5, Ref.ObjectRef objectRef6, Ref.ObjectRef objectRef7, Ref.ObjectRef objectRef8, List list) {
            super(2, continuation);
            this.f40636d = xmlPullParser;
            this.f40637e = objectRef;
            this.f40638f = objectRef2;
            this.f40639g = objectRef3;
            this.f40640h = objectRef4;
            this.f40641i = objectRef5;
            this.f40642j = objectRef6;
            this.f40643k = objectRef7;
            this.f40644l = objectRef8;
            this.f40645m = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3015t) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3015t c3015t = new C3015t(this.f40636d, continuation, this.f40637e, this.f40638f, this.f40639g, this.f40640h, this.f40641i, this.f40642j, this.f40643k, this.f40644l, this.f40645m);
            c3015t.f40635c = obj;
            return c3015t;
        }

        /* JADX WARN: Code restructure failed: missing block: B:49:0x00e3, code lost:
        
            if (r13 == r0) goto L83;
         */
        /* JADX WARN: Code restructure failed: missing block: B:57:0x0105, code lost:
        
            if (r13 == r0) goto L83;
         */
        /* JADX WARN: Code restructure failed: missing block: B:66:0x0127, code lost:
        
            if (r13 == r0) goto L83;
         */
        /* JADX WARN: Code restructure failed: missing block: B:82:0x016c, code lost:
        
            if (r13 == r0) goto L83;
         */
        /* JADX WARN: Removed duplicated region for block: B:119:0x021d  */
        /* JADX WARN: Removed duplicated region for block: B:28:0x0096  */
        /* JADX WARN: Removed duplicated region for block: B:71:0x0134 A[PHI: r1 r8 r9
          0x0134: PHI (r1v3 int) = (r1v4 int), (r1v5 int), (r1v7 int), (r1v8 int), (r1v8 int), (r1v8 int), (r1v8 int), (r1v8 int) binds: [B:69:0x012c, B:60:0x010a, B:52:0x00e9, B:37:0x00b7, B:63:0x0118, B:55:0x00f7, B:43:0x00ca, B:46:0x00d4] A[DONT_GENERATE, DONT_INLINE]
          0x0134: PHI (r8v4 kotlin.jvm.internal.Ref$ObjectRef) = 
          (r8v5 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v6 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v8 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v16 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v16 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v16 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v16 kotlin.jvm.internal.Ref$ObjectRef)
          (r8v16 kotlin.jvm.internal.Ref$ObjectRef)
         binds: [B:69:0x012c, B:60:0x010a, B:52:0x00e9, B:37:0x00b7, B:63:0x0118, B:55:0x00f7, B:43:0x00ca, B:46:0x00d4] A[DONT_GENERATE, DONT_INLINE]
          0x0134: PHI (r9v1 org.xmlpull.v1.XmlPullParser) = 
          (r9v2 org.xmlpull.v1.XmlPullParser)
          (r9v3 org.xmlpull.v1.XmlPullParser)
          (r9v5 org.xmlpull.v1.XmlPullParser)
          (r9v26 org.xmlpull.v1.XmlPullParser)
          (r9v26 org.xmlpull.v1.XmlPullParser)
          (r9v26 org.xmlpull.v1.XmlPullParser)
          (r9v26 org.xmlpull.v1.XmlPullParser)
          (r9v26 org.xmlpull.v1.XmlPullParser)
         binds: [B:69:0x012c, B:60:0x010a, B:52:0x00e9, B:37:0x00b7, B:63:0x0118, B:55:0x00f7, B:43:0x00ca, B:46:0x00d4] A[DONT_GENERATE, DONT_INLINE]] */
        /* JADX WARN: Removed duplicated region for block: B:75:0x0143  */
        /* JADX WARN: Removed duplicated region for block: B:79:0x0158  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:113:0x01f8 -> B:118:0x0216). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:115:0x0211 -> B:118:0x0216). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x009f -> B:118:0x0216). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x00a9 -> B:118:0x0216). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:80:0x015e -> B:118:0x0216). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:82:0x016c -> B:84:0x016f). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            XmlPullParser xmlPullParser;
            String name;
            Ref.ObjectRef objectRef;
            Object bVar;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40634b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40635c);
                if (k.j(this.f40636d)) {
                    this.f40636d.nextTag();
                }
                if (k.h(this.f40636d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40636d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40636d.getDepth();
                if (this.f40636d.getDepth() < depth) {
                }
            } else if (i5 == 1) {
                depth = this.f40633a;
                objectRef = (Ref.ObjectRef) this.n;
                xmlPullParser = (XmlPullParser) this.f40635c;
                ResultKt.b(obj);
                t tVar = (t) obj;
                if (tVar != null) {
                    bVar = new y.c(tVar);
                }
                objectRef.f71863a = bVar;
                name = xmlPullParser.getName();
                if (Intrinsics.b(name, k.I)) {
                }
                if (this.f40636d.getDepth() < depth) {
                }
            } else if (i5 == 2) {
                depth = this.f40633a;
                objectRef = (Ref.ObjectRef) this.n;
                xmlPullParser = (XmlPullParser) this.f40635c;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j jVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j) obj;
                if (jVar != null) {
                    bVar = new y.a(jVar);
                }
                objectRef.f71863a = bVar;
                name = xmlPullParser.getName();
                if (Intrinsics.b(name, k.I)) {
                }
                if (this.f40636d.getDepth() < depth) {
                }
            } else if (i5 == 3) {
                depth = this.f40633a;
                objectRef = (Ref.ObjectRef) this.n;
                xmlPullParser = (XmlPullParser) this.f40635c;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k kVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k) obj;
                bVar = kVar != null ? new y.b(kVar) : null;
                objectRef.f71863a = bVar;
                name = xmlPullParser.getName();
                if (Intrinsics.b(name, k.I)) {
                }
                if (this.f40636d.getDepth() < depth) {
                }
            } else if (i5 == 4) {
                depth = this.f40633a;
                Ref.ObjectRef objectRef2 = (Ref.ObjectRef) this.f40635c;
                ResultKt.b(obj);
                objectRef2.f71863a = obj;
                this.f40636d.next();
                if (this.f40636d.getDepth() < depth) {
                }
            } else {
                if (i5 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40633a;
                ResultKt.b(obj);
                String str = (String) obj;
                if (str != null) {
                    this.f40645m.add(str);
                }
                this.f40636d.next();
                if (this.f40636d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40636d.getDepth() - depth;
                if (depth2 == 0) {
                    if (k.k(this.f40636d)) {
                        XmlPullParser xmlPullParser2 = this.f40636d;
                        this.f40637e.f71863a = k.b(xmlPullParser2, "program");
                        Ref.ObjectRef objectRef3 = this.f40638f;
                        String strB = k.b(xmlPullParser2, "width");
                        objectRef3.f71863a = strB != null ? r70.i.u0(strB) : null;
                        Ref.ObjectRef objectRef4 = this.f40639g;
                        String strB2 = k.b(xmlPullParser2, "height");
                        objectRef4.f71863a = strB2 != null ? r70.i.u0(strB2) : null;
                        this.f40640h.f71863a = k.b(xmlPullParser2, "apiFramework");
                        Ref.ObjectRef objectRef5 = this.f40641i;
                        String strB3 = k.b(xmlPullParser2, "offset");
                        objectRef5.f71863a = strB3 != null ? k.i(strB3) : null;
                        Ref.ObjectRef objectRef6 = this.f40642j;
                        String strB4 = k.b(xmlPullParser2, "duration");
                        if (strB4 != null) {
                            objectRef6.f71863a = k.h(strB4);
                        } else {
                            objectRef6.f71863a = null;
                        }
                    } else if (k.l(this.f40636d) && (text = this.f40636d.getText()) != null && !r70.k.U0(text)) {
                        String text2 = this.f40636d.getText();
                        Intrinsics.f(text2, "getText(...)");
                        r70.k.u1(text2).toString();
                    } else if (k.i(this.f40636d)) {
                        return Unit.f71706a;
                    }
                } else if (depth2 == 1 && k.k(this.f40636d)) {
                    xmlPullParser = this.f40636d;
                    objectRef = this.f40643k;
                    if (objectRef.f71863a != null) {
                        name = xmlPullParser.getName();
                        if (Intrinsics.b(name, k.I)) {
                            Ref.ObjectRef objectRef7 = this.f40644l;
                            this.f40635c = objectRef7;
                            this.n = null;
                            this.f40633a = depth;
                            this.f40634b = 4;
                            Object objG = k.G(xmlPullParser, this);
                            if (objG != coroutineSingletons) {
                                objectRef7.f71863a = objG;
                            }
                        } else if (Intrinsics.b(name, k.L)) {
                            this.f40635c = null;
                            this.n = null;
                            this.f40633a = depth;
                            this.f40634b = 5;
                            obj = k.P(xmlPullParser, this);
                        }
                        if (this.f40636d.getDepth() < depth) {
                        }
                    } else {
                        String name2 = xmlPullParser.getName();
                        if (name2 != null) {
                            int iHashCode = name2.hashCode();
                            if (iHashCode == -375340334) {
                                if (name2.equals(k.G)) {
                                    this.f40635c = xmlPullParser;
                                    this.n = objectRef;
                                    this.f40633a = depth;
                                    this.f40634b = 3;
                                    obj = k.F(xmlPullParser, this);
                                }
                            } else if (iHashCode == 676623548) {
                                if (name2.equals(k.F)) {
                                    this.f40635c = xmlPullParser;
                                    this.n = objectRef;
                                    this.f40633a = depth;
                                    this.f40634b = 1;
                                    obj = k.O(xmlPullParser, this);
                                }
                            } else if (iHashCode == 1928285401 && name2.equals(k.H)) {
                                this.f40635c = xmlPullParser;
                                this.n = objectRef;
                                this.f40633a = depth;
                                this.f40634b = 2;
                                obj = k.E(xmlPullParser, this);
                            }
                            objectRef.f71863a = bVar;
                            name = xmlPullParser.getName();
                            if (Intrinsics.b(name, k.I)) {
                            }
                            if (this.f40636d.getDepth() < depth) {
                            }
                        }
                        objectRef.f71863a = bVar;
                        name = xmlPullParser.getName();
                        if (Intrinsics.b(name, k.I)) {
                        }
                        if (this.f40636d.getDepth() < depth) {
                        }
                    }
                    return coroutineSingletons;
                }
                this.f40636d.next();
                if (this.f40636d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseIconTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$u, reason: case insensitive filesystem */
    public static final class C3016u extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40646a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40647b;

        /* renamed from: c, reason: collision with root package name */
        public Object f40648c;

        /* renamed from: d, reason: collision with root package name */
        public Object f40649d;

        /* renamed from: e, reason: collision with root package name */
        public Object f40650e;

        /* renamed from: f, reason: collision with root package name */
        public Object f40651f;

        /* renamed from: g, reason: collision with root package name */
        public Object f40652g;

        /* renamed from: h, reason: collision with root package name */
        public Object f40653h;

        /* renamed from: i, reason: collision with root package name */
        public Object f40654i;

        /* renamed from: j, reason: collision with root package name */
        public /* synthetic */ Object f40655j;

        /* renamed from: k, reason: collision with root package name */
        public int f40656k;

        public C3016u(Continuation<? super C3016u> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40655j = obj;
            this.f40656k |= Integer.MIN_VALUE;
            return k.H(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseIconsTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$v, reason: case insensitive filesystem */
    public static final class C3017v extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40657a;

        /* renamed from: b, reason: collision with root package name */
        public int f40658b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40659c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40660d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ List f40661e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3017v(XmlPullParser xmlPullParser, Continuation continuation, List list) {
            super(2, continuation);
            this.f40660d = xmlPullParser;
            this.f40661e = list;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3017v) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3017v c3017v = new C3017v(this.f40660d, continuation, this.f40661e);
            c3017v.f40659c = obj;
            return c3017v;
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0050  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0081  */
        /* JADX WARN: Removed duplicated region for block: B:50:0x00cc  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0059 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x0062 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0070 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x007a -> B:31:0x007d). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x008d -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00a7 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c0 -> B:49:0x00c5). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f40658b;
            if (i5 == 0) {
                ResultKt.b(obj);
                k0.e((j0) this.f40659c);
                if (k.j(this.f40660d)) {
                    this.f40660d.nextTag();
                }
                if (k.h(this.f40660d)) {
                    return Unit.f71706a;
                }
                if (!k.k(this.f40660d)) {
                    throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                }
                depth = this.f40660d.getDepth();
                if (this.f40660d.getDepth() < depth) {
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                depth = this.f40657a;
                ResultKt.b(obj);
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l lVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l) obj;
                if (lVar != null) {
                    this.f40661e.add(lVar);
                }
                this.f40660d.next();
                if (this.f40660d.getDepth() < depth) {
                    return Unit.f71706a;
                }
                int depth2 = this.f40660d.getDepth() - depth;
                if (depth2 == 0) {
                    if (!k.k(this.f40660d)) {
                        if (k.l(this.f40660d) && (text = this.f40660d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40660d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40660d)) {
                            return Unit.f71706a;
                        }
                    }
                } else if (depth2 == 1 && k.k(this.f40660d)) {
                    XmlPullParser xmlPullParser = this.f40660d;
                    if (Intrinsics.b(xmlPullParser.getName(), k.E)) {
                        this.f40657a = depth;
                        this.f40658b = 1;
                        obj = k.H(xmlPullParser, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l lVar2 = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l) obj;
                        if (lVar2 != null) {
                        }
                    }
                }
                this.f40660d.next();
                if (this.f40660d.getDepth() < depth) {
                }
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseIconsTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$w, reason: case insensitive filesystem */
    public static final class C3018w extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40662a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40663b;

        /* renamed from: c, reason: collision with root package name */
        public int f40664c;

        public C3018w(Continuation<? super C3018w> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40663b = obj;
            this.f40664c |= Integer.MIN_VALUE;
            return k.I(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseImpressionTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$x, reason: case insensitive filesystem */
    public static final class C3019x extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40665a;

        /* renamed from: b, reason: collision with root package name */
        public int f40666b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40667c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40668d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40669e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40670f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3019x(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2) {
            super(2, continuation);
            this.f40668d = xmlPullParser;
            this.f40669e = objectRef;
            this.f40670f = objectRef2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3019x) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3019x c3019x = new C3019x(this.f40668d, continuation, this.f40669e, this.f40670f);
            c3019x.f40667c = obj;
            return c3019x;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            String text;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f40666b != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            k0.e((j0) this.f40667c);
            if (k.j(this.f40668d)) {
                this.f40668d.nextTag();
            }
            if (k.h(this.f40668d)) {
                return Unit.f71706a;
            }
            if (!k.k(this.f40668d)) {
                throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
            }
            int depth = this.f40668d.getDepth();
            while (this.f40668d.getDepth() >= depth) {
                int depth2 = this.f40668d.getDepth() - depth;
                if (depth2 != 0) {
                    if (depth2 == 1) {
                        k.k(this.f40668d);
                    }
                } else if (k.k(this.f40668d)) {
                    this.f40669e.f71863a = k.b(this.f40668d, "id");
                } else if (k.l(this.f40668d) && (text = this.f40668d.getText()) != null && !r70.k.U0(text)) {
                    String text2 = this.f40668d.getText();
                    Intrinsics.f(text2, "getText(...)");
                    this.f40670f.f71863a = r70.k.u1(text2).toString();
                } else if (k.i(this.f40668d)) {
                    return Unit.f71706a;
                }
                this.f40668d.next();
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt", f = "VastParser.kt", l = {969}, m = "parseImpressionTag")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$y, reason: case insensitive filesystem */
    public static final class C3020y extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40671a;

        /* renamed from: b, reason: collision with root package name */
        public Object f40672b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40673c;

        /* renamed from: d, reason: collision with root package name */
        public int f40674d;

        public C3020y(Continuation<? super C3020y> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40673c = obj;
            this.f40674d |= Integer.MIN_VALUE;
            return k.J(null, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserKt$parseInLineTag$$inlined$iterateTag$1", f = "VastParser.kt", l = {Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 128, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k$z, reason: case insensitive filesystem */
    public static final class C3021z extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f40675a;

        /* renamed from: b, reason: collision with root package name */
        public int f40676b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f40677c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ XmlPullParser f40678d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40679e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40680f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40681g;

        /* renamed from: h, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40682h;

        /* renamed from: i, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef f40683i;

        /* renamed from: j, reason: collision with root package name */
        public final /* synthetic */ List f40684j;

        /* renamed from: k, reason: collision with root package name */
        public final /* synthetic */ List f40685k;

        /* renamed from: l, reason: collision with root package name */
        public final /* synthetic */ List f40686l;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C3021z(XmlPullParser xmlPullParser, Continuation continuation, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.ObjectRef objectRef3, Ref.ObjectRef objectRef4, Ref.ObjectRef objectRef5, List list, List list2, List list3) {
            super(2, continuation);
            this.f40678d = xmlPullParser;
            this.f40679e = objectRef;
            this.f40680f = objectRef2;
            this.f40681g = objectRef3;
            this.f40682h = objectRef4;
            this.f40683i = objectRef5;
            this.f40684j = list;
            this.f40685k = list2;
            this.f40686l = list3;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C3021z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C3021z c3021z = new C3021z(this.f40678d, continuation, this.f40679e, this.f40680f, this.f40681g, this.f40682h, this.f40683i, this.f40684j, this.f40685k, this.f40686l);
            c3021z.f40677c = obj;
            return c3021z;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Code restructure failed: missing block: B:42:0x00d1, code lost:
        
            if (r7 == r0) goto L97;
         */
        /* JADX WARN: Code restructure failed: missing block: B:72:0x0152, code lost:
        
            if (r7 == r0) goto L97;
         */
        /* JADX WARN: Code restructure failed: missing block: B:96:0x01b0, code lost:
        
            if (r7 == r0) goto L97;
         */
        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
        /* JADX WARN: Removed duplicated region for block: B:115:0x0200  */
        /* JADX WARN: Removed duplicated region for block: B:26:0x0094  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:100:0x01c1 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:109:0x01db -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:111:0x01f4 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x009e -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x00a8 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x00b0 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00b7 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x00c2 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:45:0x00d7 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00d9 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00e6 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:55:0x0105 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:62:0x0124 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:69:0x0143 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x0157 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:76:0x0159 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:78:0x0166 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:85:0x0184 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:93:0x01a1 -> B:114:0x01f9). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:96:0x01b0 -> B:98:0x01b3). Please report as a decompilation issue!!! */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) throws XmlPullParserException, IOException {
            int depth;
            String text;
            XmlPullParser xmlPullParser;
            String name;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            switch (this.f40676b) {
                case 0:
                    ResultKt.b(obj);
                    k0.e((j0) this.f40677c);
                    if (k.j(this.f40678d)) {
                        this.f40678d.nextTag();
                    }
                    if (k.h(this.f40678d)) {
                        return Unit.f71706a;
                    }
                    if (!k.k(this.f40678d)) {
                        throw new XmlPullParserException("iterateCurrentTagEvents call is allowed only for START_TAG event");
                    }
                    depth = this.f40678d.getDepth();
                    if (this.f40678d.getDepth() < depth) {
                        return Unit.f71706a;
                    }
                    int depth2 = this.f40678d.getDepth() - depth;
                    if (depth2 != 0) {
                        if (depth2 == 1 && k.k(this.f40678d) && (name = (xmlPullParser = this.f40678d).getName()) != null) {
                            switch (name.hashCode()) {
                                case -1692490108:
                                    if (name.equals(k.f40341q)) {
                                        this.f40677c = null;
                                        this.f40675a = depth;
                                        this.f40676b = 8;
                                        obj = k.f(xmlPullParser, true, this);
                                        break;
                                    }
                                    break;
                                case -1633884078:
                                    if (name.equals(k.f40336j)) {
                                        Ref.ObjectRef objectRef = this.f40679e;
                                        this.f40677c = objectRef;
                                        this.f40675a = depth;
                                        this.f40676b = 1;
                                        Object objZ = k.z(xmlPullParser, this);
                                        if (objZ != coroutineSingletons) {
                                            objectRef.f71863a = objZ;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case -56677412:
                                    if (name.equals(k.f40338l)) {
                                        Ref.ObjectRef objectRef2 = this.f40681g;
                                        this.f40677c = objectRef2;
                                        this.f40675a = depth;
                                        this.f40676b = 3;
                                        Object objP = k.P(xmlPullParser, this);
                                        if (objP != coroutineSingletons) {
                                            objectRef2.f71863a = objP;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 67232232:
                                    if (name.equals(k.f40331e)) {
                                        this.f40677c = null;
                                        this.f40675a = depth;
                                        this.f40676b = 7;
                                        obj = k.D(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                                case 501930965:
                                    if (name.equals(k.f40337k)) {
                                        Ref.ObjectRef objectRef3 = this.f40680f;
                                        this.f40677c = objectRef3;
                                        this.f40675a = depth;
                                        this.f40676b = 2;
                                        Object objP2 = k.P(xmlPullParser, this);
                                        if (objP2 != coroutineSingletons) {
                                            objectRef3.f71863a = objP2;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 1349597094:
                                    if (name.equals(k.n)) {
                                        Ref.ObjectRef objectRef4 = this.f40683i;
                                        this.f40677c = objectRef4;
                                        this.f40675a = depth;
                                        this.f40676b = 5;
                                        Object objN = k.N(xmlPullParser, this);
                                        if (objN != coroutineSingletons) {
                                            objectRef4.f71863a = objN;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 2065545547:
                                    if (name.equals(k.f40339m)) {
                                        Ref.ObjectRef objectRef5 = this.f40682h;
                                        this.f40677c = objectRef5;
                                        this.f40675a = depth;
                                        this.f40676b = 4;
                                        Object objP3 = k.P(xmlPullParser, this);
                                        if (objP3 != coroutineSingletons) {
                                            objectRef5.f71863a = objP3;
                                            break;
                                        }
                                        return coroutineSingletons;
                                    }
                                    break;
                                case 2114088489:
                                    if (name.equals(k.f40340p)) {
                                        this.f40677c = null;
                                        this.f40675a = depth;
                                        this.f40676b = 6;
                                        obj = k.J(xmlPullParser, this);
                                        break;
                                    }
                                    break;
                            }
                        }
                    } else if (!k.k(this.f40678d)) {
                        if (k.l(this.f40678d) && (text = this.f40678d.getText()) != null && !r70.k.U0(text)) {
                            String text2 = this.f40678d.getText();
                            Intrinsics.f(text2, "getText(...)");
                            r70.k.u1(text2).toString();
                        } else if (k.i(this.f40678d)) {
                            return Unit.f71706a;
                        }
                    }
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 1:
                    depth = this.f40675a;
                    Ref.ObjectRef objectRef6 = (Ref.ObjectRef) this.f40677c;
                    ResultKt.b(obj);
                    objectRef6.f71863a = obj;
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 2:
                    depth = this.f40675a;
                    Ref.ObjectRef objectRef7 = (Ref.ObjectRef) this.f40677c;
                    ResultKt.b(obj);
                    objectRef7.f71863a = obj;
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 3:
                    depth = this.f40675a;
                    Ref.ObjectRef objectRef8 = (Ref.ObjectRef) this.f40677c;
                    ResultKt.b(obj);
                    objectRef8.f71863a = obj;
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 4:
                    depth = this.f40675a;
                    Ref.ObjectRef objectRef9 = (Ref.ObjectRef) this.f40677c;
                    ResultKt.b(obj);
                    objectRef9.f71863a = obj;
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 5:
                    depth = this.f40675a;
                    Ref.ObjectRef objectRef10 = (Ref.ObjectRef) this.f40677c;
                    ResultKt.b(obj);
                    objectRef10.f71863a = obj;
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 6:
                    depth = this.f40675a;
                    ResultKt.b(obj);
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n nVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n) obj;
                    if (nVar != null) {
                        this.f40684j.add(nVar);
                    }
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 7:
                    depth = this.f40675a;
                    ResultKt.b(obj);
                    String str = (String) obj;
                    if (str != null) {
                        this.f40685k.add(str);
                    }
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                case 8:
                    depth = this.f40675a;
                    ResultKt.b(obj);
                    this.f40686l.addAll((List) obj);
                    this.f40678d.next();
                    if (this.f40678d.getDepth() < depth) {
                    }
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object A(XmlPullParser xmlPullParser, Continuation<? super C3022a> continuation) {
        C3003g c3003g;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        if (continuation instanceof C3003g) {
            c3003g = (C3003g) continuation;
            int i5 = c3003g.f40559e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3003g.f40559e = i5 - Integer.MIN_VALUE;
            } else {
                c3003g = new C3003g(continuation);
            }
        }
        Object obj = c3003g.f40558d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3003g.f40559e;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef5 = new Ref.ObjectRef();
            C3002f c3002f = new C3002f(xmlPullParser, null, objectRefL, objectRef4, objectRef5);
            c3003g.f40555a = objectRefL;
            c3003g.f40556b = objectRef4;
            c3003g.f40557c = objectRef5;
            c3003g.f40559e = 1;
            if (k0.d(c3002f, c3003g) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef4;
            objectRef3 = objectRef5;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef3 = (Ref.ObjectRef) c3003g.f40557c;
            objectRef2 = (Ref.ObjectRef) c3003g.f40556b;
            objectRef = (Ref.ObjectRef) c3003g.f40555a;
            ResultKt.b(obj);
        }
        AbstractC3023b abstractC3023b = (AbstractC3023b) objectRef3.f71863a;
        if (abstractC3023b != null) {
            return new C3022a((String) objectRef.f71863a, (Integer) objectRef2.f71863a, abstractC3023b);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object B(XmlPullParser xmlPullParser, Continuation<? super List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e>> continuation) {
        C3005i c3005i;
        if (continuation instanceof C3005i) {
            c3005i = (C3005i) continuation;
            int i5 = c3005i.f40567c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3005i.f40567c = i5 - Integer.MIN_VALUE;
            } else {
                c3005i = new C3005i(continuation);
            }
        }
        Object obj = c3005i.f40566b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3005i.f40567c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            List list = (List) c3005i.f40565a;
            ResultKt.b(obj);
            return list;
        }
        ArrayList arrayListX = c0.x(obj);
        C3004h c3004h = new C3004h(xmlPullParser, null, arrayListX);
        c3005i.f40565a = arrayListX;
        c3005i.f40567c = 1;
        return k0.d(c3004h, c3005i) == coroutineSingletons ? coroutineSingletons : arrayListX;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r4v6, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object C(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e> continuation) {
        C0256k c0256k;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        List list;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.ObjectRef objectRef5;
        Ref.ObjectRef objectRef6;
        ArrayList arrayList;
        ArrayList arrayList2;
        Ref.ObjectRef objectRef7;
        if (continuation instanceof C0256k) {
            c0256k = (C0256k) continuation;
            int i5 = c0256k.f40592l;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0256k.f40592l = i5 - Integer.MIN_VALUE;
            } else {
                c0256k = new C0256k(continuation);
            }
        }
        Object obj = c0256k.f40591k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0256k.f40592l;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef8 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef9 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef10 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef11 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef12 = new Ref.ObjectRef();
            ArrayList arrayList3 = new ArrayList();
            ArrayList arrayList4 = new ArrayList();
            Ref.ObjectRef objectRef13 = new Ref.ObjectRef();
            ArrayList arrayList5 = new ArrayList();
            C3006j c3006j = new C3006j(xmlPullParser, null, objectRefL, objectRef8, objectRef9, objectRef11, objectRef10, objectRef12, arrayList3, objectRef13, arrayList4, arrayList5);
            c0256k.f40581a = objectRefL;
            c0256k.f40582b = objectRef8;
            c0256k.f40583c = objectRef9;
            c0256k.f40584d = objectRef10;
            c0256k.f40585e = objectRef11;
            c0256k.f40586f = objectRef12;
            c0256k.f40587g = arrayList3;
            c0256k.f40588h = arrayList4;
            c0256k.f40589i = objectRef13;
            c0256k.f40590j = arrayList5;
            c0256k.f40592l = 1;
            if (k0.d(c3006j, c0256k) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRef8;
            objectRef2 = objectRef9;
            list = arrayList5;
            objectRef3 = objectRefL;
            objectRef4 = objectRef11;
            objectRef5 = objectRef10;
            objectRef6 = objectRef12;
            arrayList = arrayList3;
            arrayList2 = arrayList4;
            objectRef7 = objectRef13;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list = (List) c0256k.f40590j;
            objectRef7 = (Ref.ObjectRef) c0256k.f40589i;
            ?? r42 = (List) c0256k.f40588h;
            ?? r52 = (List) c0256k.f40587g;
            objectRef6 = (Ref.ObjectRef) c0256k.f40586f;
            objectRef4 = (Ref.ObjectRef) c0256k.f40585e;
            objectRef5 = (Ref.ObjectRef) c0256k.f40584d;
            objectRef2 = (Ref.ObjectRef) c0256k.f40583c;
            objectRef = (Ref.ObjectRef) c0256k.f40582b;
            objectRef3 = (Ref.ObjectRef) c0256k.f40581a;
            ResultKt.b(obj);
            arrayList2 = r42;
            arrayList = r52;
        }
        String str = (String) objectRef7.f71863a;
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.f fVar = str != null ? new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.f(str, list) : null;
        if (arrayList2.isEmpty()) {
            return null;
        }
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e((String) objectRef3.f71863a, (Integer) objectRef.f71863a, (Integer) objectRef2.f71863a, (String) objectRef5.f71863a, (String) objectRef4.f71863a, fVar, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.c) objectRef6.f71863a, arrayList, arrayList2);
    }

    public static final Object D(XmlPullParser xmlPullParser, Continuation<? super String> continuation) {
        return P(xmlPullParser, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object E(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j> continuation) {
        C3011p c3011p;
        if (continuation instanceof C3011p) {
            c3011p = (C3011p) continuation;
            int i5 = c3011p.f40620b;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3011p.f40620b = i5 - Integer.MIN_VALUE;
            } else {
                c3011p = new C3011p(continuation);
            }
        }
        Object objP = c3011p.f40619a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3011p.f40620b;
        if (i11 == 0) {
            ResultKt.b(objP);
            c3011p.f40620b = 1;
            objP = P(xmlPullParser, c3011p);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
        }
        String str = (String) objP;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.j(str);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object F(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k> continuation) {
        C3012q c3012q;
        if (continuation instanceof C3012q) {
            c3012q = (C3012q) continuation;
            int i5 = c3012q.f40622b;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3012q.f40622b = i5 - Integer.MIN_VALUE;
            } else {
                c3012q = new C3012q(continuation);
            }
        }
        Object objP = c3012q.f40621a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3012q.f40622b;
        if (i11 == 0) {
            ResultKt.b(objP);
            c3012q.f40622b = 1;
            objP = P(xmlPullParser, c3012q);
            if (objP == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objP);
        }
        String str = (String) objP;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.k(str);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object G(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.m> continuation) {
        C3014s c3014s;
        Ref.ObjectRef objectRef;
        List list;
        if (continuation instanceof C3014s) {
            c3014s = (C3014s) continuation;
            int i5 = c3014s.f40632d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3014s.f40632d = i5 - Integer.MIN_VALUE;
            } else {
                c3014s = new C3014s(continuation);
            }
        }
        Object obj = c3014s.f40631c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3014s.f40632d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            ArrayList arrayList = new ArrayList();
            C3013r c3013r = new C3013r(xmlPullParser, null, objectRefL, arrayList);
            c3014s.f40629a = objectRefL;
            c3014s.f40630b = arrayList;
            c3014s.f40632d = 1;
            if (k0.d(c3013r, c3014s) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            list = arrayList;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list = (List) c3014s.f40630b;
            objectRef = (Ref.ObjectRef) c3014s.f40629a;
            ResultKt.b(obj);
        }
        String str = (String) objectRef.f71863a;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.m(str, list);
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object H(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l> continuation) {
        C3016u c3016u;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.ObjectRef objectRef5;
        Ref.ObjectRef objectRef6;
        Ref.ObjectRef objectRef7;
        Ref.ObjectRef objectRef8;
        ArrayList arrayList;
        if (continuation instanceof C3016u) {
            c3016u = (C3016u) continuation;
            int i5 = c3016u.f40656k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3016u.f40656k = i5 - Integer.MIN_VALUE;
            } else {
                c3016u = new C3016u(continuation);
            }
        }
        Object obj = c3016u.f40655j;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3016u.f40656k;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            objectRef = new Ref.ObjectRef();
            Ref.ObjectRef objectRef9 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef10 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef11 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef12 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef13 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef14 = new Ref.ObjectRef();
            ArrayList arrayList2 = new ArrayList();
            C3015t c3015t = new C3015t(xmlPullParser, null, objectRefL, objectRef, objectRef9, objectRef10, objectRef11, objectRef12, objectRef14, objectRef13, arrayList2);
            c3016u.f40646a = objectRefL;
            c3016u.f40647b = objectRef;
            c3016u.f40648c = objectRef9;
            c3016u.f40649d = objectRef10;
            c3016u.f40650e = objectRef11;
            c3016u.f40651f = objectRef12;
            c3016u.f40652g = objectRef13;
            c3016u.f40653h = objectRef14;
            c3016u.f40654i = arrayList2;
            c3016u.f40656k = 1;
            if (k0.d(c3015t, c3016u) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef2 = objectRefL;
            objectRef3 = objectRef9;
            objectRef4 = objectRef10;
            objectRef5 = objectRef11;
            objectRef6 = objectRef12;
            objectRef7 = objectRef14;
            objectRef8 = objectRef13;
            arrayList = arrayList2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r22 = (List) c3016u.f40654i;
            objectRef7 = (Ref.ObjectRef) c3016u.f40653h;
            objectRef8 = (Ref.ObjectRef) c3016u.f40652g;
            objectRef6 = (Ref.ObjectRef) c3016u.f40651f;
            objectRef5 = (Ref.ObjectRef) c3016u.f40650e;
            objectRef4 = (Ref.ObjectRef) c3016u.f40649d;
            objectRef3 = (Ref.ObjectRef) c3016u.f40648c;
            objectRef = (Ref.ObjectRef) c3016u.f40647b;
            objectRef2 = (Ref.ObjectRef) c3016u.f40646a;
            ResultKt.b(obj);
            arrayList = r22;
        }
        y yVar = (y) objectRef7.f71863a;
        if (yVar != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l((String) objectRef2.f71863a, (Integer) objectRef.f71863a, (Integer) objectRef3.f71863a, (String) objectRef4.f71863a, (r) objectRef5.f71863a, (Long) objectRef6.f71863a, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.m) objectRef8.f71863a, arrayList, yVar);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object I(XmlPullParser xmlPullParser, Continuation<? super List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.l>> continuation) {
        C3018w c3018w;
        if (continuation instanceof C3018w) {
            c3018w = (C3018w) continuation;
            int i5 = c3018w.f40664c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3018w.f40664c = i5 - Integer.MIN_VALUE;
            } else {
                c3018w = new C3018w(continuation);
            }
        }
        Object obj = c3018w.f40663b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3018w.f40664c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            List list = (List) c3018w.f40662a;
            ResultKt.b(obj);
            return list;
        }
        ArrayList arrayListX = c0.x(obj);
        C3017v c3017v = new C3017v(xmlPullParser, null, arrayListX);
        c3018w.f40662a = arrayListX;
        c3018w.f40664c = 1;
        return k0.d(c3017v, c3018w) == coroutineSingletons ? coroutineSingletons : arrayListX;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object J(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n> continuation) {
        C3020y c3020y;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof C3020y) {
            c3020y = (C3020y) continuation;
            int i5 = c3020y.f40674d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3020y.f40674d = i5 - Integer.MIN_VALUE;
            } else {
                c3020y = new C3020y(continuation);
            }
        }
        Object obj = c3020y.f40673c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3020y.f40674d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            C3019x c3019x = new C3019x(xmlPullParser, null, objectRefL, objectRef3);
            c3020y.f40671a = objectRefL;
            c3020y.f40672b = objectRef3;
            c3020y.f40674d = 1;
            if (k0.d(c3019x, c3020y) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) c3020y.f40672b;
            objectRef = (Ref.ObjectRef) c3020y.f40671a;
            ResultKt.b(obj);
        }
        String str = (String) objectRef2.f71863a;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.n((String) objectRef.f71863a, str);
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object K(XmlPullParser xmlPullParser, Continuation<? super o> continuation) {
        A a11;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.ObjectRef objectRef5;
        ArrayList arrayList;
        ArrayList arrayList2;
        ArrayList arrayList3;
        if (continuation instanceof A) {
            a11 = (A) continuation;
            int i5 = a11.f40360j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a11.f40360j = i5 - Integer.MIN_VALUE;
            } else {
                a11 = new A(continuation);
            }
        }
        Object obj = a11.f40359i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a11.f40360j;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef6 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef7 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef8 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef9 = new Ref.ObjectRef();
            ArrayList arrayList4 = new ArrayList();
            ArrayList arrayList5 = new ArrayList();
            ArrayList arrayList6 = new ArrayList();
            C3021z c3021z = new C3021z(xmlPullParser, null, objectRefL, objectRef6, objectRef7, objectRef8, objectRef9, arrayList4, arrayList5, arrayList6);
            a11.f40351a = objectRefL;
            a11.f40352b = objectRef6;
            a11.f40353c = objectRef7;
            a11.f40354d = objectRef8;
            a11.f40355e = objectRef9;
            a11.f40356f = arrayList4;
            a11.f40357g = arrayList5;
            a11.f40358h = arrayList6;
            a11.f40360j = 1;
            if (k0.d(c3021z, a11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef6;
            objectRef3 = objectRef7;
            objectRef4 = objectRef8;
            objectRef5 = objectRef9;
            arrayList = arrayList4;
            arrayList2 = arrayList5;
            arrayList3 = arrayList6;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r22 = (List) a11.f40358h;
            ?? r32 = (List) a11.f40357g;
            ?? r42 = (List) a11.f40356f;
            objectRef5 = (Ref.ObjectRef) a11.f40355e;
            objectRef4 = (Ref.ObjectRef) a11.f40354d;
            objectRef3 = (Ref.ObjectRef) a11.f40353c;
            Ref.ObjectRef objectRef10 = (Ref.ObjectRef) a11.f40352b;
            objectRef = (Ref.ObjectRef) a11.f40351a;
            ResultKt.b(obj);
            arrayList3 = r22;
            arrayList2 = r32;
            objectRef2 = objectRef10;
            arrayList = r42;
        }
        return new o((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.d) objectRef.f71863a, (String) objectRef2.f71863a, (String) objectRef3.f71863a, (String) objectRef4.f71863a, (s) objectRef5.f71863a, arrayList, arrayList2, arrayList3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object L(XmlPullParser xmlPullParser, Continuation<? super q> continuation) {
        E e3;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.ObjectRef objectRef5;
        Ref.ObjectRef objectRef6;
        Ref.ObjectRef objectRef7;
        Ref.ObjectRef objectRef8;
        Ref.ObjectRef objectRef9;
        Ref.ObjectRef objectRef10;
        Ref.ObjectRef objectRef11;
        Ref.ObjectRef objectRef12;
        Object obj;
        if (continuation instanceof E) {
            e3 = (E) continuation;
            int i5 = e3.n;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e3.n = i5 - Integer.MIN_VALUE;
            } else {
                e3 = new E(continuation);
            }
        }
        Object obj2 = e3.f40409m;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e3.n;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj2);
            Ref.ObjectRef objectRef13 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef14 = new Ref.ObjectRef();
            objectRef = new Ref.ObjectRef();
            Ref.ObjectRef objectRef15 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef16 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef17 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef18 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef19 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef20 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef21 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef22 = new Ref.ObjectRef();
            D d5 = new D(xmlPullParser, null, objectRef13, objectRef14, objectRef, objectRef15, objectRef16, objectRef17, objectRef18, objectRef19, objectRef20, objectRef21, objectRef22, objectRefL);
            e3.f40397a = objectRefL;
            e3.f40398b = objectRef13;
            e3.f40399c = objectRef14;
            e3.f40400d = objectRef;
            e3.f40401e = objectRef15;
            e3.f40402f = objectRef16;
            e3.f40403g = objectRef17;
            e3.f40404h = objectRef18;
            e3.f40405i = objectRef19;
            e3.f40406j = objectRef20;
            e3.f40407k = objectRef21;
            e3.f40408l = objectRef22;
            e3.n = 1;
            if (k0.d(d5, e3) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef2 = objectRef13;
            objectRef3 = objectRef16;
            objectRef4 = objectRef14;
            objectRef5 = objectRef15;
            objectRef6 = objectRefL;
            objectRef7 = objectRef22;
            objectRef8 = objectRef21;
            objectRef9 = objectRef20;
            objectRef10 = objectRef17;
            objectRef11 = objectRef18;
            objectRef12 = objectRef19;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef7 = (Ref.ObjectRef) e3.f40408l;
            objectRef8 = (Ref.ObjectRef) e3.f40407k;
            objectRef9 = (Ref.ObjectRef) e3.f40406j;
            objectRef12 = (Ref.ObjectRef) e3.f40405i;
            objectRef11 = (Ref.ObjectRef) e3.f40404h;
            objectRef10 = (Ref.ObjectRef) e3.f40403g;
            objectRef3 = (Ref.ObjectRef) e3.f40402f;
            objectRef5 = (Ref.ObjectRef) e3.f40401e;
            objectRef = (Ref.ObjectRef) e3.f40400d;
            objectRef4 = (Ref.ObjectRef) e3.f40399c;
            objectRef2 = (Ref.ObjectRef) e3.f40398b;
            objectRef6 = (Ref.ObjectRef) e3.f40397a;
            ResultKt.b(obj2);
        }
        Object obj3 = objectRef6.f71863a;
        if (obj3 == null || objectRef.f71863a == null || (obj = objectRef4.f71863a) == null) {
            return null;
        }
        String str = (String) obj3;
        String str2 = (String) objectRef2.f71863a;
        Intrinsics.d(obj);
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        Object obj4 = objectRef.f71863a;
        Intrinsics.d(obj4);
        return new q(str, str2, zBooleanValue, (String) obj4, (Integer) objectRef5.f71863a, (Integer) objectRef3.f71863a, (String) objectRef10.f71863a, (Integer) objectRef11.f71863a, (Integer) objectRef12.f71863a, (Integer) objectRef9.f71863a, (Boolean) objectRef8.f71863a, (String) objectRef7.f71863a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object M(XmlPullParser xmlPullParser, Continuation<? super List<q>> continuation) {
        G g11;
        if (continuation instanceof G) {
            g11 = (G) continuation;
            int i5 = g11.f40417c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g11.f40417c = i5 - Integer.MIN_VALUE;
            } else {
                g11 = new G(continuation);
            }
        }
        Object obj = g11.f40416b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g11.f40417c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            List list = (List) g11.f40415a;
            ResultKt.b(obj);
            return list;
        }
        ArrayList arrayListX = c0.x(obj);
        F f11 = new F(xmlPullParser, null, arrayListX);
        g11.f40415a = arrayListX;
        g11.f40417c = 1;
        return k0.d(f11, g11) == coroutineSingletons ? coroutineSingletons : arrayListX;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object N(XmlPullParser xmlPullParser, Continuation<? super s> continuation) {
        I i5;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof I) {
            i5 = (I) continuation;
            int i11 = i5.f40427d;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                i5.f40427d = i11 - Integer.MIN_VALUE;
            } else {
                i5 = new I(continuation);
            }
        }
        Object obj = i5.f40426c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = i5.f40427d;
        if (i12 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            H h5 = new H(xmlPullParser, null, objectRefL, objectRef3);
            i5.f40424a = objectRefL;
            i5.f40425b = objectRef3;
            i5.f40427d = 1;
            if (k0.d(h5, i5) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) i5.f40425b;
            objectRef = (Ref.ObjectRef) i5.f40424a;
            ResultKt.b(obj);
        }
        Object obj2 = objectRef.f71863a;
        if (obj2 == null && objectRef2.f71863a == null) {
            return null;
        }
        return new s((String) obj2, (String) objectRef2.f71863a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object O(XmlPullParser xmlPullParser, Continuation<? super t> continuation) {
        K k11;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Object obj;
        if (continuation instanceof K) {
            k11 = (K) continuation;
            int i5 = k11.f40437d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k11.f40437d = i5 - Integer.MIN_VALUE;
            } else {
                k11 = new K(continuation);
            }
        }
        Object obj2 = k11.f40436c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k11.f40437d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj2);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            J j11 = new J(xmlPullParser, null, objectRef3, objectRefL);
            k11.f40434a = objectRefL;
            k11.f40435b = objectRef3;
            k11.f40437d = 1;
            if (k0.d(j11, k11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) k11.f40435b;
            objectRef = (Ref.ObjectRef) k11.f40434a;
            ResultKt.b(obj2);
        }
        Object obj3 = objectRef.f71863a;
        if (obj3 == null || (obj = objectRef2.f71863a) == null) {
            return null;
        }
        Intrinsics.d(obj);
        return new t((String) obj3, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i) obj);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object P(XmlPullParser xmlPullParser, Continuation<? super String> continuation) {
        M m11;
        Ref.ObjectRef objectRef;
        if (continuation instanceof M) {
            m11 = (M) continuation;
            int i5 = m11.f40445c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m11.f40445c = i5 - Integer.MIN_VALUE;
            } else {
                m11 = new M(continuation);
            }
        }
        Object obj = m11.f40444b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m11.f40445c;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            L l9 = new L(xmlPullParser, null, objectRefL);
            m11.f40443a = objectRefL;
            m11.f40445c = 1;
            if (k0.d(l9, m11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = (Ref.ObjectRef) m11.f40443a;
            ResultKt.b(obj);
        }
        return objectRef.f71863a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object Q(XmlPullParser xmlPullParser, Continuation<? super List<u>> continuation) {
        O o5;
        if (continuation instanceof O) {
            o5 = (O) continuation;
            int i5 = o5.f40453c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o5.f40453c = i5 - Integer.MIN_VALUE;
            } else {
                o5 = new O(continuation);
            }
        }
        Object obj = o5.f40452b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o5.f40453c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            List list = (List) o5.f40451a;
            ResultKt.b(obj);
            return list;
        }
        ArrayList arrayListX = c0.x(obj);
        N n9 = new N(xmlPullParser, null, arrayListX);
        o5.f40451a = arrayListX;
        o5.f40453c = 1;
        return k0.d(n9, o5) == coroutineSingletons ? coroutineSingletons : arrayListX;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object R(XmlPullParser xmlPullParser, Continuation<? super u> continuation) {
        Q q5;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        if (continuation instanceof Q) {
            q5 = (Q) continuation;
            int i5 = q5.f40465e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q5.f40465e = i5 - Integer.MIN_VALUE;
            } else {
                q5 = new Q(continuation);
            }
        }
        Object obj = q5.f40464d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q5.f40465e;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef5 = new Ref.ObjectRef();
            P p11 = new P(xmlPullParser, null, objectRefL, objectRef5, objectRef4);
            q5.f40461a = objectRefL;
            q5.f40462b = objectRef4;
            q5.f40463c = objectRef5;
            q5.f40465e = 1;
            if (k0.d(p11, q5) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef5;
            objectRef3 = objectRef4;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) q5.f40463c;
            objectRef3 = (Ref.ObjectRef) q5.f40462b;
            objectRef = (Ref.ObjectRef) q5.f40461a;
            ResultKt.b(obj);
        }
        Object obj2 = objectRef.f71863a;
        if (obj2 == null || objectRef3.f71863a == null) {
            return null;
        }
        if (obj2 == v.n && objectRef2.f71863a == null) {
            return null;
        }
        Intrinsics.d(obj2);
        Object obj3 = objectRef3.f71863a;
        Intrinsics.d(obj3);
        return new u((v) obj2, (String) obj3, (r) objectRef2.f71863a);
    }

    public static final Object S(XmlPullParser xmlPullParser, Continuation<? super w> continuation) {
        return m0.y(com.moloco.sdk.internal.scheduling.b.a().getIo(), new R(xmlPullParser, null), continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object T(XmlPullParser xmlPullParser, Continuation<? super w> continuation) {
        T t6;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        List list;
        if (continuation instanceof T) {
            t6 = (T) continuation;
            int i5 = t6.f40479e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t6.f40479e = i5 - Integer.MIN_VALUE;
            } else {
                t6 = new T(continuation);
            }
        }
        Object obj = t6.f40478d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t6.f40479e;
        if (i11 == 0) {
            ArrayList arrayListX = c0.x(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
            S s11 = new S(xmlPullParser, null, objectRef3, objectRef4, arrayListX);
            t6.f40475a = arrayListX;
            t6.f40476b = objectRef3;
            t6.f40477c = objectRef4;
            t6.f40479e = 1;
            if (k0.d(s11, t6) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRef3;
            objectRef2 = objectRef4;
            list = arrayListX;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) t6.f40477c;
            objectRef = (Ref.ObjectRef) t6.f40476b;
            list = (List) t6.f40475a;
            ResultKt.b(obj);
        }
        if (list.isEmpty() && objectRef2.f71863a == null) {
            return null;
        }
        return new w(list, (String) objectRef2.f71863a, (String) objectRef.f71863a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object U(XmlPullParser xmlPullParser, Continuation<? super z> continuation) {
        V v11;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof V) {
            v11 = (V) continuation;
            int i5 = v11.f40489d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v11.f40489d = i5 - Integer.MIN_VALUE;
            } else {
                v11 = new V(continuation);
            }
        }
        Object obj = v11.f40488c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = v11.f40489d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            U u5 = new U(xmlPullParser, null, objectRefL, objectRef3);
            v11.f40486a = objectRefL;
            v11.f40487b = objectRef3;
            v11.f40489d = 1;
            if (k0.d(u5, v11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) v11.f40487b;
            objectRef = (Ref.ObjectRef) v11.f40486a;
            ResultKt.b(obj);
        }
        String str = (String) objectRef2.f71863a;
        if (str != null) {
            return new z((String) objectRef.f71863a, str);
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v3, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object V(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.B> continuation) {
        Z z11;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        ArrayList arrayList;
        ArrayList arrayList2;
        ArrayList arrayList3;
        if (continuation instanceof Z) {
            z11 = (Z) continuation;
            int i5 = z11.f40520h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z11.f40520h = i5 - Integer.MIN_VALUE;
            } else {
                z11 = new Z(continuation);
            }
        }
        Object obj = z11.f40519g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z11.f40520h;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef4 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef5 = new Ref.ObjectRef();
            ArrayList arrayList4 = new ArrayList();
            ArrayList arrayList5 = new ArrayList();
            ArrayList arrayList6 = new ArrayList();
            Y y11 = new Y(xmlPullParser, null, objectRef4, objectRefL, objectRef5, arrayList4, arrayList5, arrayList6);
            z11.f40513a = objectRefL;
            z11.f40514b = objectRef4;
            z11.f40515c = objectRef5;
            z11.f40516d = arrayList4;
            z11.f40517e = arrayList5;
            z11.f40518f = arrayList6;
            z11.f40520h = 1;
            if (k0.d(y11, z11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRef4;
            objectRef2 = objectRefL;
            objectRef3 = objectRef5;
            arrayList = arrayList4;
            arrayList2 = arrayList5;
            arrayList3 = arrayList6;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r22 = (List) z11.f40518f;
            ?? r32 = (List) z11.f40517e;
            ?? r42 = (List) z11.f40516d;
            objectRef3 = (Ref.ObjectRef) z11.f40515c;
            Ref.ObjectRef objectRef6 = (Ref.ObjectRef) z11.f40514b;
            objectRef2 = (Ref.ObjectRef) z11.f40513a;
            ResultKt.b(obj);
            arrayList3 = r22;
            arrayList2 = r32;
            objectRef = objectRef6;
            arrayList = r42;
        }
        String str = (String) objectRef2.f71863a;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.B(str, (Boolean) objectRef.f71863a, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.d) objectRef3.f71863a, arrayList, arrayList2, arrayList3);
        }
        return null;
    }

    public static /* synthetic */ void d() {
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object y(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.c> continuation) {
        C2999c c2999c;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof C2999c) {
            c2999c = (C2999c) continuation;
            int i5 = c2999c.f40537d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c2999c.f40537d = i5 - Integer.MIN_VALUE;
            } else {
                c2999c = new C2999c(continuation);
            }
        }
        Object obj = c2999c.f40536c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c2999c.f40537d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            C2998b c2998b = new C2998b(xmlPullParser, null, objectRef3, objectRefL);
            c2999c.f40534a = objectRefL;
            c2999c.f40535b = objectRef3;
            c2999c.f40537d = 1;
            if (k0.d(c2998b, c2999c) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) c2999c.f40535b;
            objectRef = (Ref.ObjectRef) c2999c.f40534a;
            ResultKt.b(obj);
        }
        String str = (String) objectRef.f71863a;
        if (str != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.c(str, (Boolean) objectRef2.f71863a);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object z(XmlPullParser xmlPullParser, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.d> continuation) {
        C3001e c3001e;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        if (continuation instanceof C3001e) {
            c3001e = (C3001e) continuation;
            int i5 = c3001e.f40547d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3001e.f40547d = i5 - Integer.MIN_VALUE;
            } else {
                c3001e = new C3001e(continuation);
            }
        }
        Object obj = c3001e.f40546c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3001e.f40547d;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            C3000d c3000d = new C3000d(xmlPullParser, null, objectRef3, objectRefL);
            c3001e.f40544a = objectRefL;
            c3001e.f40545b = objectRef3;
            c3001e.f40547d = 1;
            if (k0.d(c3000d, c3001e) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef2 = (Ref.ObjectRef) c3001e.f40545b;
            objectRef = (Ref.ObjectRef) c3001e.f40544a;
            ResultKt.b(obj);
        }
        Object obj2 = objectRef.f71863a;
        if (obj2 == null && objectRef2.f71863a == null) {
            return null;
        }
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.d((String) obj2, (String) objectRef2.f71863a);
    }

    public static final boolean h(XmlPullParser xmlPullParser) {
        return xmlPullParser.getEventType() == 1;
    }

    public static final boolean i(XmlPullParser xmlPullParser) {
        return xmlPullParser.getEventType() == 3;
    }

    public static final boolean j(XmlPullParser xmlPullParser) {
        return xmlPullParser.getEventType() == 0;
    }

    public static final boolean k(XmlPullParser xmlPullParser) {
        return xmlPullParser.getEventType() == 2;
    }

    public static final boolean l(XmlPullParser xmlPullParser) {
        return xmlPullParser.getEventType() == 4;
    }

    public static final Integer m(XmlPullParser xmlPullParser) {
        String strB = b(xmlPullParser, "sequence");
        if (strB == null) {
            return null;
        }
        Integer numU0 = r70.i.u0(strB);
        return Integer.valueOf(numU0 != null ? numU0.intValue() : androidx.room.o.MAX_BIND_PARAMETER_CNT);
    }

    public static final r n(XmlPullParser xmlPullParser) {
        String strB = b(xmlPullParser, "skipoffset");
        if (strB != null) {
            return i(strB);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(XmlPullParser xmlPullParser, boolean z11, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g> continuation) {
        C3008m c3008m;
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        Ref.ObjectRef objectRef5;
        if (continuation instanceof C3008m) {
            c3008m = (C3008m) continuation;
            int i5 = c3008m.f40609g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3008m.f40609g = i5 - Integer.MIN_VALUE;
            } else {
                c3008m = new C3008m(continuation);
            }
        }
        Object obj = c3008m.f40608f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3008m.f40609g;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef6 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef7 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef8 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef9 = new Ref.ObjectRef();
            C3007l c3007l = new C3007l(xmlPullParser, null, objectRefL, objectRef6, objectRef7, objectRef8, objectRef9, z11);
            c3008m.f40603a = objectRefL;
            c3008m.f40604b = objectRef6;
            c3008m.f40605c = objectRef7;
            c3008m.f40606d = objectRef8;
            c3008m.f40607e = objectRef9;
            c3008m.f40609g = 1;
            if (k0.d(c3007l, c3008m) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            objectRef2 = objectRef6;
            objectRef3 = objectRef7;
            objectRef4 = objectRef8;
            objectRef5 = objectRef9;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef5 = (Ref.ObjectRef) c3008m.f40607e;
            objectRef4 = (Ref.ObjectRef) c3008m.f40606d;
            objectRef3 = (Ref.ObjectRef) c3008m.f40605c;
            objectRef2 = (Ref.ObjectRef) c3008m.f40604b;
            objectRef = (Ref.ObjectRef) c3008m.f40603a;
            ResultKt.b(obj);
        }
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.h hVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.h) objectRef5.f71863a;
        if (hVar != null) {
            return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g((String) objectRef.f71863a, (Integer) objectRef2.f71863a, (String) objectRef3.f71863a, (String) objectRef4.f71863a, hVar);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(XmlPullParser xmlPullParser, boolean z11, Continuation<? super List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.g>> continuation) {
        C3010o c3010o;
        if (continuation instanceof C3010o) {
            c3010o = (C3010o) continuation;
            int i5 = c3010o.f40618c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3010o.f40618c = i5 - Integer.MIN_VALUE;
            } else {
                c3010o = new C3010o(continuation);
            }
        }
        Object obj = c3010o.f40617b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3010o.f40618c;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            List list = (List) c3010o.f40616a;
            ResultKt.b(obj);
            return list;
        }
        ArrayList arrayListX = c0.x(obj);
        C3009n c3009n = new C3009n(xmlPullParser, null, z11, arrayListX);
        c3010o.f40616a = arrayListX;
        c3010o.f40618c = 1;
        return k0.d(c3009n, c3010o) == coroutineSingletons ? coroutineSingletons : arrayListX;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object g(XmlPullParser xmlPullParser, boolean z11, Continuation<? super p> continuation) {
        C c11;
        Ref.ObjectRef objectRef;
        boolean z12;
        Ref.ObjectRef objectRef2;
        Ref.ObjectRef objectRef3;
        List list;
        ArrayList arrayList;
        Ref.ObjectRef objectRef4;
        ArrayList arrayList2;
        if (continuation instanceof C) {
            c11 = (C) continuation;
            int i5 = c11.f40382j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c11.f40382j = i5 - Integer.MIN_VALUE;
            } else {
                c11 = new C(continuation);
            }
        }
        Object obj = c11.f40381i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c11.f40382j;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            Ref.ObjectRef objectRef5 = new Ref.ObjectRef();
            objectRef = new Ref.ObjectRef();
            ArrayList arrayList3 = new ArrayList();
            ArrayList arrayList4 = new ArrayList();
            Ref.ObjectRef objectRef6 = new Ref.ObjectRef();
            ArrayList arrayList5 = new ArrayList();
            z12 = z11;
            B b11 = new B(xmlPullParser, null, objectRefL, objectRef5, objectRef, arrayList3, arrayList4, objectRef6, z12, arrayList5);
            c11.f40374b = objectRefL;
            c11.f40375c = objectRef5;
            c11.f40376d = objectRef;
            c11.f40377e = arrayList3;
            c11.f40378f = arrayList4;
            c11.f40379g = objectRef6;
            c11.f40380h = arrayList5;
            c11.f40373a = z12;
            c11.f40382j = 1;
            if (k0.d(b11, c11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef2 = objectRefL;
            objectRef3 = objectRef5;
            list = arrayList3;
            arrayList = arrayList4;
            objectRef4 = objectRef6;
            arrayList2 = arrayList5;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            boolean z13 = c11.f40373a;
            ?? r32 = (List) c11.f40380h;
            objectRef4 = (Ref.ObjectRef) c11.f40379g;
            ?? r52 = (List) c11.f40378f;
            list = (List) c11.f40377e;
            Ref.ObjectRef objectRef7 = (Ref.ObjectRef) c11.f40376d;
            objectRef3 = (Ref.ObjectRef) c11.f40375c;
            objectRef2 = (Ref.ObjectRef) c11.f40374b;
            ResultKt.b(obj);
            z12 = z13;
            arrayList2 = r32;
            objectRef = objectRef7;
            arrayList = r52;
        }
        if (z12 && list.isEmpty()) {
            return null;
        }
        return new p((r) objectRef2.f71863a, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.c) objectRef3.f71863a, (Long) objectRef.f71863a, list, arrayList, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.A) objectRef4.f71863a, arrayList2);
    }

    public static final Long h(String str) {
        Object objA;
        Object objA2;
        Date date;
        Date date2;
        try {
            int i5 = Result.f71687b;
            SimpleDateFormat simpleDateFormatF = f();
            objA = (simpleDateFormatF == null || (date2 = simpleDateFormatF.parse(str)) == null) ? null : Long.valueOf(date2.getTime());
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        Long l9 = (Long) objA;
        if (l9 != null) {
            return l9;
        }
        try {
            SimpleDateFormat simpleDateFormatG = g();
            objA2 = (simpleDateFormatG == null || (date = simpleDateFormatG.parse(str)) == null) ? null : Long.valueOf(date.getTime());
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        Long l11 = (Long) (objA2 instanceof Result.Failure ? null : objA2);
        return l11 == null ? f(str) : l11;
    }

    public static final r i(String str) {
        Long lH = h(str);
        if (lH != null) {
            return new r.b(lH.longValue());
        }
        Integer numJ = j(str);
        if (numJ != null) {
            return new r.a(numJ.intValue());
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Integer j(String str) {
        Object objA;
        Number number;
        try {
            int i5 = Result.f71687b;
            NumberFormat numberFormatE = e();
            if (numberFormatE == null || (number = numberFormatE.parse(str)) == null) {
                objA = null;
            } else {
                int iFloatValue = (int) (number.floatValue() * 100);
                objA = Integer.valueOf(iFloatValue);
                if (iFloatValue < 0 || iFloatValue >= 101) {
                }
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Integer num = (Integer) (objA instanceof Result.Failure ? null : objA);
        return num == null ? e(str) : num;
    }

    public static final v k(String str) {
        switch (str.hashCode()) {
            case -1638835128:
                if (str.equals("midpoint")) {
                    return v.f40827d;
                }
                return null;
            case -1337830390:
                if (str.equals("thirdQuartile")) {
                    return v.f40828e;
                }
                return null;
            case -1001078227:
                if (str.equals("progress")) {
                    return v.n;
                }
                return null;
            case -934426579:
                if (str.equals("resume")) {
                    return v.f40834k;
                }
                return null;
            case -934318917:
                if (str.equals("rewind")) {
                    return v.f40833j;
                }
                return null;
            case -840405966:
                if (str.equals("unmute")) {
                    return v.f40831h;
                }
                return null;
            case -599445191:
                if (str.equals("complete")) {
                    return v.f40829f;
                }
                return null;
            case -37683395:
                if (str.equals("closeLinear")) {
                    return v.f40835l;
                }
                return null;
            case 3363353:
                if (str.equals("mute")) {
                    return v.f40830g;
                }
                return null;
            case 3532159:
                if (str.equals("skip")) {
                    return v.f40836m;
                }
                return null;
            case 106440182:
                if (str.equals("pause")) {
                    return v.f40832i;
                }
                return null;
            case 109757538:
                if (str.equals("start")) {
                    return v.f40825b;
                }
                return null;
            case 560220243:
                if (str.equals("firstQuartile")) {
                    return v.f40826c;
                }
                return null;
            case 1778167540:
                if (str.equals("creativeView")) {
                    return v.f40824a;
                }
                return null;
            default:
                return null;
        }
    }

    @NotNull
    public static final i b() {
        return c();
    }

    public static final j c() {
        return (j) f40327a.getValue();
    }

    public static final j a() {
        return new j();
    }

    public static final String b(XmlPullParser xmlPullParser, String str) {
        String attributeValue = xmlPullParser.getAttributeValue(null, str);
        if (attributeValue == null || r70.k.U0(attributeValue)) {
            return null;
        }
        return attributeValue;
    }

    public static final Object a(XmlPullParser xmlPullParser, Function2<? super XmlPullParser, ? super Continuation<? super Unit>, ? extends Object> function2, Function3<? super XmlPullParser, ? super String, ? super Continuation<? super Unit>, ? extends Object> function3, Function2<? super XmlPullParser, ? super Continuation<? super Unit>, ? extends Object> function22, Continuation<? super Unit> continuation) {
        k0.d(new C2997a(xmlPullParser, function2, function3, function22, null), continuation);
        return Unit.f71706a;
    }

    public static final SimpleDateFormat f() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.L.a("HH:mm:ss.SSS", null, 2, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00a3  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Long f(@NotNull String str) {
        Long lV0;
        long jLongValue;
        CharSequence charSequenceSubSequence;
        Long lV02;
        Intrinsics.g(str, "<this>");
        List listI1 = r70.k.i1(str, new String[]{"."}, 6);
        Object obj = listI1.get(0);
        int i5 = 1;
        String str2 = (String) b70.g.Z0(1, listI1);
        List listI12 = r70.k.i1((String) obj, new String[]{":"}, 6);
        if (listI12.size() != 3 || (lV0 = r70.i.v0((String) listI12.get(0))) == null) {
            return null;
        }
        long jLongValue2 = lV0.longValue();
        Long lV03 = r70.i.v0((String) listI12.get(1));
        if (lV03 == null) {
            return null;
        }
        long jLongValue3 = lV03.longValue();
        Long lV04 = r70.i.v0((String) listI12.get(2));
        if (lV04 == null) {
            return null;
        }
        long jLongValue4 = lV04.longValue();
        if (str2 == null) {
            jLongValue = 0;
        } else {
            if (3 <= str2.length()) {
                charSequenceSubSequence = str2.subSequence(0, str2.length());
            } else {
                StringBuilder sb2 = new StringBuilder(3);
                sb2.append((CharSequence) str2);
                int length = 3 - str2.length();
                if (1 <= length) {
                    while (true) {
                        sb2.append('0');
                        if (i5 == length) {
                            break;
                        }
                        i5++;
                    }
                }
                charSequenceSubSequence = sb2;
            }
            String string = charSequenceSubSequence.toString();
            if (string != null && (lV02 = r70.i.v0(r70.l.G1(3, string))) != null) {
                jLongValue = lV02.longValue();
            }
        }
        return Long.valueOf((((jLongValue3 * 60) + (jLongValue2 * f40328b) + jLongValue4) * 1000) + jLongValue);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object h(XmlPullParser xmlPullParser, boolean z11, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.A> continuation) {
        X x11;
        Ref.ObjectRef objectRef;
        List list;
        List list2;
        if (continuation instanceof X) {
            x11 = (X) continuation;
            int i5 = x11.f40502f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x11.f40502f = i5 - Integer.MIN_VALUE;
            } else {
                x11 = new X(continuation);
            }
        }
        Object obj = x11.f40501e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x11.f40502f;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            W w10 = new W(xmlPullParser, null, objectRefL, arrayList, arrayList2);
            x11.f40498b = objectRefL;
            x11.f40499c = arrayList;
            x11.f40500d = arrayList2;
            x11.f40497a = z11;
            x11.f40502f = 1;
            if (k0.d(w10, x11) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
            list = arrayList;
            list2 = arrayList2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = x11.f40497a;
            list2 = (List) x11.f40500d;
            list = (List) x11.f40499c;
            objectRef = (Ref.ObjectRef) x11.f40498b;
            ResultKt.b(obj);
        }
        if (z11 && objectRef.f71863a == null) {
            return null;
        }
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.A((z) objectRef.f71863a, list, list2);
    }

    @Nullable
    public static final Integer e(@NotNull String str) {
        Float fS0;
        Intrinsics.g(str, "<this>");
        if (!r70.j.A0(str, "%", false) || (fS0 = r70.i.s0(r70.k.u1(r70.l.C1(str)).toString())) == null) {
            return null;
        }
        int iFloatValue = (int) fS0.floatValue();
        Integer numValueOf = Integer.valueOf(iFloatValue);
        if (iFloatValue < 0 || iFloatValue >= 101) {
            return null;
        }
        return numValueOf;
    }

    public static final NumberFormat e() {
        Object objA;
        try {
            int i5 = Result.f71687b;
            objA = NumberFormat.getPercentInstance();
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        return (NumberFormat) objA;
    }

    public static final SimpleDateFormat g() {
        return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.L.a("HH:mm:ss", null, 2, null);
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i g(String str) {
        if (r70.j.I0(str, "image/", true)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.f40755a;
        }
        if (r70.k.K0(str, "javascript", true)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.i.f40756b;
        }
        return null;
    }
}
