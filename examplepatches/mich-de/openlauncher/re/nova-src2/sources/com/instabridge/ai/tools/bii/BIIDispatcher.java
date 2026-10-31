package com.instabridge.ai.tools.bii;

import a80.m;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.util.Log;
import b.c9;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.tools.ContactResolver;
import com.instabridge.ai.tools.ToolResult;
import com.instabridge.ai.tools.bii.BIICapabilityDiscovery;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import jo.c;
import jo.e;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;
import t70.m0;
import z.x;

@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\bÇ\u0002\u0018\u00002\u00020\u0001:\u00014B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003JR\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\t2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0082@¢\u0006\u0004\b\u0011\u0010\u0012J\u0015\u0010\u0013\u001a\u00020\u000b*\u0004\u0018\u00010\u0001H\u0002¢\u0006\u0004\b\u0013\u0010\u0014J'\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0015\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\tH\u0003¢\u0006\u0004\b\u0017\u0010\u0018J'\u0010\u001b\u001a\u00020\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ6\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\t2\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00010\bH\u0082@¢\u0006\u0004\b\u001f\u0010 J>\u0010#\u001a\u00020\u001e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010!\u001a\u00020\t2\u0006\u0010\"\u001a\u00020\t2\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00010\bH\u0082@¢\u0006\u0004\b#\u0010$JG\u0010(\u001a\u00020\u00102\u0006\u0010\u0007\u001a\u00020\u00062\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010%\u001a\u00020\u00042\b\b\u0002\u0010\r\u001a\u00020\tH\u0001¢\u0006\u0004\b&\u0010'J\u000f\u0010+\u001a\u00020)H\u0001¢\u0006\u0004\b*\u0010\u0003JJ\u0010,\u001a\u00020\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\t2\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\t\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b2\b\b\u0002\u0010\f\u001a\u00020\u000b2\b\b\u0002\u0010\r\u001a\u00020\tH\u0086@¢\u0006\u0004\b,\u0010-R\u0014\u0010.\u001a\u00020\t8\u0002X\u0082T¢\u0006\u0006\n\u0004\b.\u0010/R \u00102\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u000201008\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b2\u00103¨\u00065"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIDispatcher;", b.f42142b, "<init>", "()V", "Landroid/content/Context;", "context", "Lcom/instabridge/ai/tools/bii/BIIEntry;", "entry", b.f42142b, b.f42142b, "params", b.f42142b, "userInitiated", "toolCallId", b.f42142b, "startedOverride", "Lcom/instabridge/ai/tools/ToolResult;", "dispatchInternal", "(Landroid/content/Context;Lcom/instabridge/ai/tools/bii/BIIEntry;Ljava/util/Map;ZLjava/lang/String;Ljava/lang/Long;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isMissingValue", "(Ljava/lang/Object;)Z", "packageName", "shortcutId", "startShortcut", "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/instabridge/ai/tools/ToolResult;", "Landroid/content/Intent;", "intent", "startIntent", "(Landroid/content/Context;Landroid/content/Intent;Lcom/instabridge/ai/tools/bii/BIIEntry;)Lcom/instabridge/ai/tools/ToolResult;", "biiName", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams;", "resolveContactParams", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "contactName", "telephoneKey", "resolvePhoneForParam", "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "contextOverride", "dispatchForTest$instabridge_ai_sdk_release", "(Lcom/instabridge/ai/tools/bii/BIIEntry;Ljava/util/Map;ZLandroid/content/Context;Ljava/lang/String;)Lcom/instabridge/ai/tools/ToolResult;", "dispatchForTest", b.f42142b, "resetRetryCacheForTest$instabridge_ai_sdk_release", "resetRetryCacheForTest", "dispatch", "(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;ZLjava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "TAG", "Ljava/lang/String;", "Lz/x;", b.f42142b, "needsInputAttempts", "Lz/x;", "ResolvedParams", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BIIDispatcher {

    @NotNull
    private static final String TAG = "BIIDispatcher";

    @NotNull
    public static final BIIDispatcher INSTANCE = new BIIDispatcher();

    @NotNull
    private static final x needsInputAttempts = new x(64);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b2\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0003\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams;", b.f42142b, "<init>", "()V", "Enriched", "Unchanged", k.f40331e, "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Enriched;", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Error;", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Unchanged;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class ResolvedParams {

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003HÆ\u0003J!\u0010\u000b\u001a\u00020\u00002\u0016\b\u0002\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003HÆ\u0001J\u0013\u0010\f\u001a\u00020\r2\b\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÖ\u0003J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001J\t\u0010\u0011\u001a\u00020\u0004HÖ\u0001R\u001f\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\t¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Enriched;", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams;", "params", b.f42142b, b.f42142b, b.f42142b, "<init>", "(Ljava/util/Map;)V", "getParams", "()Ljava/util/Map;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Enriched extends ResolvedParams {
            public static final int $stable = 8;

            @NotNull
            private final Map<String, Object> params;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Enriched(@NotNull Map<String, ? extends Object> params) {
                super(null);
                Intrinsics.g(params, "params");
                this.params = params;
            }

            /* JADX WARN: Multi-variable type inference failed */
            public static /* synthetic */ Enriched copy$default(Enriched enriched, Map map, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    map = enriched.params;
                }
                return enriched.copy(map);
            }

            @NotNull
            public final Map<String, Object> component1() {
                return this.params;
            }

            @NotNull
            public final Enriched copy(@NotNull Map<String, ? extends Object> params) {
                Intrinsics.g(params, "params");
                return new Enriched(params);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Enriched) && Intrinsics.b(this.params, ((Enriched) other).params);
            }

            @NotNull
            public final Map<String, Object> getParams() {
                return this.params;
            }

            public int hashCode() {
                return this.params.hashCode();
            }

            @NotNull
            public String toString() {
                return c9.l(new StringBuilder("Enriched(params="), this.params, ')');
            }
        }

        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Error;", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams;", "result", "Lcom/instabridge/ai/tools/ToolResult;", "<init>", "(Lcom/instabridge/ai/tools/ToolResult;)V", "getResult", "()Lcom/instabridge/ai/tools/ToolResult;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Error extends ResolvedParams {
            public static final int $stable = 0;

            @NotNull
            private final ToolResult result;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Error(@NotNull ToolResult result) {
                super(null);
                Intrinsics.g(result, "result");
                this.result = result;
            }

            public static /* synthetic */ Error copy$default(Error error, ToolResult toolResult, int i5, Object obj) {
                if ((i5 & 1) != 0) {
                    toolResult = error.result;
                }
                return error.copy(toolResult);
            }

            @NotNull
            /* renamed from: component1, reason: from getter */
            public final ToolResult getResult() {
                return this.result;
            }

            @NotNull
            public final Error copy(@NotNull ToolResult result) {
                Intrinsics.g(result, "result");
                return new Error(result);
            }

            public boolean equals(@Nullable Object other) {
                if (this == other) {
                    return true;
                }
                return (other instanceof Error) && Intrinsics.b(this.result, ((Error) other).result);
            }

            @NotNull
            public final ToolResult getResult() {
                return this.result;
            }

            public int hashCode() {
                return this.result.hashCode();
            }

            @NotNull
            public String toString() {
                return "Error(result=" + this.result + ')';
            }
        }

        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams$Unchanged;", "Lcom/instabridge/ai/tools/bii/BIIDispatcher$ResolvedParams;", "<init>", "()V", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Unchanged extends ResolvedParams {
            public static final int $stable = 0;

            @NotNull
            public static final Unchanged INSTANCE = new Unchanged();

            private Unchanged() {
                super(null);
            }

            public boolean equals(@Nullable Object other) {
                return this == other || (other instanceof Unchanged);
            }

            public int hashCode() {
                return 785045246;
            }

            @NotNull
            public String toString() {
                return "Unchanged";
            }
        }

        public /* synthetic */ ResolvedParams(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private ResolvedParams() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.bii.BIIDispatcher", f = "BIIDispatcher.kt", l = {110}, m = "dispatchInternal")
    /* renamed from: com.instabridge.ai.tools.bii.BIIDispatcher$dispatchInternal$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        long J$0;
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return BIIDispatcher.this.dispatchInternal(null, null, null, false, null, null, this);
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.bii.BIIDispatcher", f = "BIIDispatcher.kt", l = {342}, m = "resolvePhoneForParam")
    /* renamed from: com.instabridge.ai.tools.bii.BIIDispatcher$resolvePhoneForParam$1, reason: invalid class name and case insensitive filesystem */
    public static final class C28611 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        public C28611(Continuation<? super C28611> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return BIIDispatcher.this.resolvePhoneForParam(null, null, null, null, this);
        }
    }

    private BIIDispatcher() {
    }

    public static /* synthetic */ Object dispatch$default(BIIDispatcher bIIDispatcher, Context context, String str, Map map, boolean z11, String str2, Continuation continuation, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            z11 = true;
        }
        boolean z12 = z11;
        if ((i5 & 16) != 0) {
            str2 = "system-" + str + '-' + System.nanoTime();
        }
        return bIIDispatcher.dispatch(context, str, map, z12, str2, continuation);
    }

    public static /* synthetic */ ToolResult dispatchForTest$instabridge_ai_sdk_release$default(BIIDispatcher bIIDispatcher, BIIEntry bIIEntry, Map map, boolean z11, Context context, String str, int i5, Object obj) {
        if ((i5 & 16) != 0) {
            str = "test-call-default";
        }
        return bIIDispatcher.dispatchForTest$instabridge_ai_sdk_release(bIIEntry, map, z11, context, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object dispatchInternal(Context context, BIIEntry bIIEntry, Map<String, ? extends Object> map, boolean z11, String str, Long l9, Continuation<? super ToolResult> continuation) {
        AnonymousClass1 anonymousClass1;
        String biiName;
        BIIEntry bIIEntry2;
        Object objResolveContactParams;
        String str2;
        Map<String, Object> params;
        long j11;
        String str3;
        Object next;
        long j12;
        BIICapabilityDiscovery.CapabilityBinding capabilityBindingBestBindingFor;
        Object next2;
        Function1<Map<String, ? extends Object>, Uri> dataUri;
        Context context2 = context;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            long jLongValue = l9 != null ? l9.longValue() : System.currentTimeMillis();
            biiName = bIIEntry.getBiiName();
            Object obj3 = map.get("targetPackage");
            String str4 = obj3 instanceof String ? (String) obj3 : null;
            anonymousClass1.L$0 = context2;
            bIIEntry2 = bIIEntry;
            anonymousClass1.L$1 = bIIEntry2;
            anonymousClass1.L$2 = map;
            anonymousClass1.L$3 = str;
            anonymousClass1.L$4 = biiName;
            anonymousClass1.L$5 = str4;
            anonymousClass1.J$0 = jLongValue;
            anonymousClass1.label = 1;
            objResolveContactParams = resolveContactParams(context2, biiName, map, anonymousClass1);
            if (objResolveContactParams == obj2) {
                return obj2;
            }
            str2 = str4;
            params = map;
            j11 = jLongValue;
            str3 = str;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j13 = anonymousClass1.J$0;
            str2 = (String) anonymousClass1.L$5;
            biiName = (String) anonymousClass1.L$4;
            str3 = (String) anonymousClass1.L$3;
            params = (Map) anonymousClass1.L$2;
            bIIEntry2 = (BIIEntry) anonymousClass1.L$1;
            Context context3 = (Context) anonymousClass1.L$0;
            ResultKt.b(obj);
            objResolveContactParams = obj;
            j11 = j13;
            context2 = context3;
        }
        ResolvedParams resolvedParams = (ResolvedParams) objResolveContactParams;
        boolean z12 = resolvedParams instanceof ResolvedParams.Error;
        if (z12) {
            needsInputAttempts.e(str3);
            return ((ResolvedParams.Error) resolvedParams).getResult();
        }
        if (resolvedParams instanceof ResolvedParams.Enriched) {
            params = ((ResolvedParams.Enriched) resolvedParams).getParams();
        } else if (!(resolvedParams instanceof ResolvedParams.Unchanged) && !z12) {
            throw new NoWhenBranchMatchedException();
        }
        Iterator<T> it = bIIEntry2.getParameters().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            BIIParameter bIIParameter = (BIIParameter) next;
            if (bIIParameter.getRequired() && INSTANCE.isMissingValue(params.get(bIIParameter.getName()))) {
                break;
            }
        }
        BIIParameter bIIParameter2 = (BIIParameter) next;
        if (bIIParameter2 != null) {
            x xVar = needsInputAttempts;
            Integer num = (Integer) xVar.c(str3);
            int iIntValue = (num != null ? num.intValue() : 0) + 1;
            if (iIntValue > 1) {
                xVar.e(str3);
                Log.w(TAG, "routed " + biiName + " via disambiguation_failed (param=" + bIIParameter2.getName() + ')');
                e.a(c.f69624c, bIIEntry2.getToolName(), jo.b.f69617b, new Long(System.currentTimeMillis() - j11), MapsKt.j0(new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "disambiguation_failed"), new Pair("param", bIIParameter2.getName())));
                return new ToolResult.Error("I tried to " + j.E0(bIIEntry2.getToolName(), '_', ' ') + " but I'm still missing " + bIIParameter2.getName() + ". Try again with the value spelled out.", "disambiguation_failed");
            }
            xVar.d(str3, new Integer(iIntValue));
            String disambiguationPrompt = bIIParameter2.getDisambiguationPrompt();
            if (disambiguationPrompt == null) {
                StringBuilder sb2 = new StringBuilder("I need ");
                String description = bIIParameter2.getDescription();
                if (r70.k.U0(description)) {
                    description = bIIParameter2.getName();
                }
                sb2.append(description);
                sb2.append(" to ");
                sb2.append(j.E0(bIIEntry2.getToolName(), '_', ' '));
                sb2.append('.');
                disambiguationPrompt = sb2.toString();
            }
            StringBuilder sbK = u4.k("routed ", biiName, " via needs_input (param=");
            sbK.append(bIIParameter2.getName());
            sbK.append(')');
            Log.i(TAG, sbK.toString());
            e.a(c.f69624c, bIIEntry2.getToolName(), jo.b.f69618c, new Long(System.currentTimeMillis() - j11), m.n("param", bIIParameter2.getName()));
            return new ToolResult.NeedsUserInput(disambiguationPrompt, bIIParameter2.getName(), null, 4, null);
        }
        needsInputAttempts.e(str3);
        IntentTemplate standardIntentFallback = bIIEntry2.getStandardIntentFallback();
        if (((standardIntentFallback == null || (dataUri = standardIntentFallback.getDataUri()) == null) ? null : (Uri) dataUri.invoke(params)) == null && Build.VERSION.SDK_INT >= 33) {
            if (str2 != null) {
                List<BIICapabilityDiscovery.CapabilityBinding> listAllBindings = BIICapabilityDiscovery.INSTANCE.allBindings(context2);
                ArrayList arrayList = new ArrayList();
                for (Object obj4 : listAllBindings) {
                    BIICapabilityDiscovery.CapabilityBinding capabilityBinding = (BIICapabilityDiscovery.CapabilityBinding) obj4;
                    long j14 = j11;
                    if (Intrinsics.b(capabilityBinding.getBiiName(), biiName) && Intrinsics.b(capabilityBinding.getPackageName(), str2)) {
                        arrayList.add(obj4);
                    }
                    j11 = j14;
                }
                j12 = j11;
                Iterator it2 = arrayList.iterator();
                if (it2.hasNext()) {
                    next2 = it2.next();
                    if (it2.hasNext()) {
                        long lastChangedMs = ((BIICapabilityDiscovery.CapabilityBinding) next2).getLastChangedMs();
                        do {
                            Object next3 = it2.next();
                            long lastChangedMs2 = ((BIICapabilityDiscovery.CapabilityBinding) next3).getLastChangedMs();
                            if (lastChangedMs < lastChangedMs2) {
                                next2 = next3;
                                lastChangedMs = lastChangedMs2;
                            }
                        } while (it2.hasNext());
                    }
                } else {
                    next2 = null;
                }
                capabilityBindingBestBindingFor = (BIICapabilityDiscovery.CapabilityBinding) next2;
            } else {
                j12 = j11;
                capabilityBindingBestBindingFor = BIICapabilityDiscovery.INSTANCE.bestBindingFor(context2, biiName);
            }
            if (capabilityBindingBestBindingFor != null) {
                ToolResult toolResultStartShortcut = startShortcut(context2, capabilityBindingBestBindingFor.getPackageName(), capabilityBindingBestBindingFor.getShortcutId());
                if (toolResultStartShortcut instanceof ToolResult.Success) {
                    StringBuilder sbK2 = u4.k("routed ", biiName, " via bii_shortcut to ");
                    sbK2.append(capabilityBindingBestBindingFor.getPackageName());
                    Log.i(TAG, sbK2.toString());
                    e.a(c.f69624c, bIIEntry2.getToolName(), jo.b.f69616a, new Long(System.currentTimeMillis() - j12), MapsKt.j0(new Pair("path", "bii_shortcut"), new Pair("target", capabilityBindingBestBindingFor.getPackageName())));
                    return toolResultStartShortcut;
                }
                StringBuilder sbK3 = u4.k("bii_shortcut failed for ", biiName, " on ");
                sbK3.append(capabilityBindingBestBindingFor.getPackageName());
                sbK3.append(", falling back to standardized_intent");
                Log.w(TAG, sbK3.toString());
            }
        } else {
            j12 = j11;
        }
        IntentTemplate standardIntentFallback2 = bIIEntry2.getStandardIntentFallback();
        if (standardIntentFallback2 == null) {
            Log.w(TAG, "routed " + biiName + " via no_handler (no standardized fallback, no discovered binding)");
            e.b(c.f69624c, bIIEntry2.getToolName(), jo.b.f69619d, new Long(System.currentTimeMillis() - j12), null, 16);
            return new ToolResult.Error("No handler on this device for " + bIIEntry2.getBiiName(), "no_handler");
        }
        Intent intentRender = standardIntentFallback2.render(params);
        if (str2 != null && intentRender.getPackage() == null && intentRender.getComponent() == null) {
            intentRender.setPackage(str2);
        }
        ToolResult toolResultStartIntent = INSTANCE.startIntent(context2, intentRender, bIIEntry2);
        String str5 = intentRender.getPackage();
        if (str5 == null) {
            ComponentName component = intentRender.getComponent();
            String packageName = component != null ? component.getPackageName() : null;
            str5 = packageName == null ? "system-default" : packageName;
        }
        if (toolResultStartIntent instanceof ToolResult.Success) {
            Log.i(TAG, "routed " + biiName + " via standardized_intent to " + str5);
            e.a(c.f69624c, bIIEntry2.getToolName(), jo.b.f69616a, new Long(System.currentTimeMillis() - j12), MapsKt.j0(new Pair("path", "standard_intent"), new Pair("target", str5)));
            return toolResultStartIntent;
        }
        Intrinsics.e(toolResultStartIntent, "null cannot be cast to non-null type com.instabridge.ai.tools.ToolResult.Error");
        String code = ((ToolResult.Error) toolResultStartIntent).getCode();
        if (code == null) {
            code = "error";
        }
        Log.w(TAG, "routed " + biiName + " via standardized_intent → error: " + code);
        e.a(c.f69624c, bIIEntry2.getToolName(), code.equals("no_handler") ? jo.b.f69619d : jo.b.f69617b, new Long(System.currentTimeMillis() - j12), MapsKt.j0(new Pair("path", "standard_intent"), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, code)));
        return toolResultStartIntent;
    }

    public static /* synthetic */ Object dispatchInternal$default(BIIDispatcher bIIDispatcher, Context context, BIIEntry bIIEntry, Map map, boolean z11, String str, Long l9, Continuation continuation, int i5, Object obj) {
        if ((i5 & 32) != 0) {
            l9 = null;
        }
        return bIIDispatcher.dispatchInternal(context, bIIEntry, map, z11, str, l9, continuation);
    }

    private final boolean isMissingValue(Object obj) {
        if (obj == null) {
            return true;
        }
        return obj instanceof String ? r70.k.U0((CharSequence) obj) : obj instanceof Collection ? ((Collection) obj).isEmpty() : (obj instanceof Object[]) && ((Object[]) obj).length == 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object resolveContactParams(Context context, String str, Map<String, ? extends Object> map, Continuation<? super ResolvedParams> continuation) {
        String string;
        String string2;
        String string3;
        String string4;
        String string5;
        String string6;
        String string7;
        String string8;
        if (Intrinsics.b(str, "actions.intent.CREATE_CALL")) {
            Object obj = map.get("call.recipient.telephone");
            if (obj == null || (string8 = obj.toString()) == null || (string5 = r70.k.u1(string8).toString()) == null || string5.length() <= 0) {
                string5 = null;
            }
            if (string5 != null) {
                return ResolvedParams.Unchanged.INSTANCE;
            }
            Object obj2 = map.get("call.recipient.name");
            if (obj2 != null && (string6 = obj2.toString()) != null && (string7 = r70.k.u1(string6).toString()) != null) {
                String str2 = string7.length() > 0 ? string7 : null;
                if (str2 != null) {
                    return resolvePhoneForParam(context, str2, "call.recipient.telephone", map, continuation);
                }
            }
            return ResolvedParams.Unchanged.INSTANCE;
        }
        if (!Intrinsics.b(str, "actions.intent.CREATE_MESSAGE")) {
            return ResolvedParams.Unchanged.INSTANCE;
        }
        Object obj3 = map.get("message.recipient.telephone");
        if (obj3 == null || (string4 = obj3.toString()) == null || (string = r70.k.u1(string4).toString()) == null || string.length() <= 0) {
            string = null;
        }
        if (string != null) {
            return ResolvedParams.Unchanged.INSTANCE;
        }
        Object obj4 = map.get("message.recipient.name");
        if (obj4 != null && (string2 = obj4.toString()) != null && (string3 = r70.k.u1(string2).toString()) != null) {
            String str3 = string3.length() > 0 ? string3 : null;
            if (str3 != null) {
                return resolvePhoneForParam(context, str3, "message.recipient.telephone", map, continuation);
            }
        }
        return ResolvedParams.Unchanged.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object resolvePhoneForParam(Context context, String str, String str2, Map<String, ? extends Object> map, Continuation<? super ResolvedParams> continuation) {
        C28611 c28611;
        if (continuation instanceof C28611) {
            c28611 = (C28611) continuation;
            int i5 = c28611.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c28611.label = i5 - Integer.MIN_VALUE;
            } else {
                c28611 = new C28611(continuation);
            }
        }
        Object objResolvePhone = c28611.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c28611.label;
        try {
            if (i11 == 0) {
                ResultKt.b(objResolvePhone);
                ContactResolver contactResolver = ContactResolver.INSTANCE;
                c28611.L$0 = str;
                c28611.L$1 = str2;
                c28611.L$2 = map;
                c28611.label = 1;
                objResolvePhone = contactResolver.resolvePhone(context, str, c28611);
                if (objResolvePhone == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                map = (Map) c28611.L$2;
                str2 = (String) c28611.L$1;
                str = (String) c28611.L$0;
                ResultKt.b(objResolvePhone);
            }
            String str3 = (String) objResolvePhone;
            if (str3 != null) {
                Log.i(TAG, "Resolved contact '" + str + "' to phone for " + str2);
                return new ResolvedParams.Enriched(MapsKt.n0(map, new Pair(str2, str3)));
            }
            Log.w(TAG, "Contact '" + str + "' has no phone number");
            return new ResolvedParams.Error(new ToolResult.Error("No phone number found for '" + str + '\'', "contact_not_found"));
        } catch (ContactResolver.AmbiguousContactException e3) {
            StringBuilder sbK = u4.k("Ambiguous contact '", str, "': ");
            sbK.append(e3.getCandidates().size());
            sbK.append(" matches");
            Log.w(TAG, sbK.toString());
            String message = e3.getMessage();
            if (message == null) {
                message = "Ambiguous contact";
            }
            return new ResolvedParams.Error(new ToolResult.Error(message, "ambiguous_contact"));
        } catch (Exception e11) {
            Log.w(TAG, "Contact resolution failed for '" + str + '\'', e11);
            return ResolvedParams.Unchanged.INSTANCE;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final ToolResult startIntent(Context context, Intent intent, BIIEntry entry) {
        try {
            intent.addFlags(268435456);
            if (context.getPackageManager().queryIntentActivities(intent, 0).isEmpty()) {
                return new ToolResult.Error("No app on this device handles " + entry.getBiiName(), "no_handler");
            }
            context.startActivity(intent);
            return new ToolResult.Success(MapsKt.j0(new Pair("action", "bii_intent"), new Pair("bii", entry.getBiiName())), null, 2, 0 == true ? 1 : 0);
        } catch (ActivityNotFoundException e3) {
            return new ToolResult.Error("No handler: " + e3.getMessage(), "no_handler");
        } catch (SecurityException e11) {
            return new ToolResult.Error("Permission denied: " + e11.getMessage(), "permission_denied");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final ToolResult startShortcut(Context context, String packageName, String shortcutId) {
        String str;
        String str2;
        Exception exc;
        LauncherApps launcherApps;
        try {
            Object systemService = context.getSystemService("launcherapps");
            String str3 = null;
            Object[] objArr = 0;
            if (systemService instanceof LauncherApps) {
                try {
                    launcherApps = (LauncherApps) systemService;
                } catch (Exception e3) {
                    exc = e3;
                    str = packageName;
                    str2 = shortcutId;
                    Log.w(TAG, "startShortcut failed for " + str + '/' + str2, exc);
                    return new ToolResult.Error(c1.s(exc, new StringBuilder("Shortcut launch failed: ")), "shortcut_failed");
                }
            } else {
                launcherApps = null;
            }
            if (launcherApps == null) {
                return new ToolResult.Error("LauncherApps unavailable", "no_launcher_service");
            }
            str = packageName;
            str2 = shortcutId;
            try {
                launcherApps.startShortcut(str, str2, null, null, Process.myUserHandle());
                return new ToolResult.Success(MapsKt.j0(new Pair("action", "bii_shortcut"), new Pair("package", str)), str3, 2, objArr == true ? 1 : 0);
            } catch (Exception e11) {
                e = e11;
                exc = e;
                Log.w(TAG, "startShortcut failed for " + str + '/' + str2, exc);
                return new ToolResult.Error(c1.s(exc, new StringBuilder("Shortcut launch failed: ")), "shortcut_failed");
            }
        } catch (Exception e12) {
            e = e12;
            str = packageName;
            str2 = shortcutId;
        }
    }

    @Nullable
    public final Object dispatch(@NotNull Context context, @NotNull String str, @NotNull Map<String, ? extends Object> map, boolean z11, @NotNull String str2, @NotNull Continuation<? super ToolResult> continuation) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        BIIEntry bIIEntryByBiiName = BIIRegistry.INSTANCE.byBiiName(str);
        if (bIIEntryByBiiName != null) {
            return dispatchInternal(context, bIIEntryByBiiName, map, z11, str2, new Long(jCurrentTimeMillis), continuation);
        }
        Log.w(TAG, "routed " + str + " via error: unknown_bii");
        e.a(c.f69624c, str, jo.b.f69617b, new Long(System.currentTimeMillis() - jCurrentTimeMillis), m.n("reason", "unknown_bii"));
        return new ToolResult.Error("Unknown BII: ".concat(str), "unknown_bii");
    }

    @NotNull
    public final ToolResult dispatchForTest$instabridge_ai_sdk_release(@NotNull BIIEntry entry, @NotNull Map<String, ? extends Object> params, boolean userInitiated, @NotNull Context contextOverride, @NotNull String toolCallId) {
        Intrinsics.g(entry, "entry");
        Intrinsics.g(params, "params");
        Intrinsics.g(contextOverride, "contextOverride");
        Intrinsics.g(toolCallId, "toolCallId");
        return (ToolResult) m0.u(EmptyCoroutineContext.f71803a, new BIIDispatcher$dispatchForTest$1(contextOverride, entry, params, userInitiated, toolCallId, null));
    }

    public final void resetRetryCacheForTest$instabridge_ai_sdk_release() {
        needsInputAttempts.i(-1);
    }
}
