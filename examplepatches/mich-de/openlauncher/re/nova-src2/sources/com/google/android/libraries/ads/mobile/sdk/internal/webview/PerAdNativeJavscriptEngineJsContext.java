package com.google.android.libraries.ads.mobile.sdk.internal.webview;

import ads_mobile_sdk.sb2;
import ads_mobile_sdk.tx0;
import ads_mobile_sdk.vx0;
import ads_mobile_sdk.zw0;
import android.net.Uri;
import androidx.annotation.Keep;
import ar.a;
import b.gb;
import b.u7;
import c80.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.k;
import t70.s;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001R\u001a\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0002X\u0083\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/google/android/libraries/ads/mobile/sdk/internal/webview/PerAdNativeJavscriptEngineJsContext;", "Lb/u7;", b.f42142b, "Lb/gb;", "perAdGmsgHandlers", "Ljava/util/Set;", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class PerAdNativeJavscriptEngineJsContext implements u7 {

    /* renamed from: a, reason: collision with root package name */
    public final u7 f33994a;

    /* renamed from: b, reason: collision with root package name */
    public final String f33995b;

    /* renamed from: c, reason: collision with root package name */
    public final d f33996c;

    @Keep
    @NotNull
    private final Set<gb> perAdGmsgHandlers;

    public PerAdNativeJavscriptEngineJsContext(u7 jsContext, String str) {
        Intrinsics.g(jsContext, "jsContext");
        this.f33994a = jsContext;
        this.f33995b = str;
        this.f33996c = new d();
        this.perAdGmsgHandlers = new LinkedHashSet();
    }

    @Override // b.u7
    public final Object a(tx0 tx0Var, Uri uri, vx0 vx0Var) {
        return this.f33994a.a(tx0Var, uri, vx0Var);
    }

    @Override // b.u7
    public final Object a(tx0 tx0Var, String str, a aVar) {
        return this.f33994a.a(tx0Var, str, aVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x00ca, code lost:
    
        if (r10.a(r8, r9, r0) != r1) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.u7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, gb gbVar, ContinuationImpl continuationImpl) {
        sb2 sb2Var;
        PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext;
        String str2;
        d dVar;
        d dVar2;
        if (continuationImpl instanceof sb2) {
            sb2Var = (sb2) continuationImpl;
            int i5 = sb2Var.f9505g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sb2Var.f9505g = i5 - Integer.MIN_VALUE;
            } else {
                sb2Var = new sb2(this, continuationImpl);
            }
        }
        Object obj = sb2Var.f9503e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sb2Var.f9505g;
        if (i11 == 0) {
            ResultKt.b(obj);
            String strD = gbVar.d();
            d dVar3 = this.f33996c;
            if (strD != null && !k.U0(strD)) {
                sb2Var.f9499a = this;
                sb2Var.f9500b = str;
                sb2Var.f9501c = gbVar;
                sb2Var.f9502d = dVar3;
                sb2Var.f9505g = 1;
                if (dVar3.e(sb2Var) != coroutineSingletons) {
                    str2 = str;
                    dVar2 = dVar3;
                    perAdNativeJavscriptEngineJsContext = this;
                    perAdNativeJavscriptEngineJsContext.perAdGmsgHandlers.add(gbVar);
                }
            } else {
                String str3 = this.f33995b;
                if (str3 != null && !k.U0(str3)) {
                    sb2Var.f9499a = this;
                    sb2Var.f9500b = str;
                    sb2Var.f9501c = gbVar;
                    sb2Var.f9502d = dVar3;
                    sb2Var.f9505g = 2;
                    if (dVar3.e(sb2Var) != coroutineSingletons) {
                        str2 = str;
                        dVar = dVar3;
                        perAdNativeJavscriptEngineJsContext = this;
                        gbVar.a(perAdNativeJavscriptEngineJsContext.f33995b);
                        perAdNativeJavscriptEngineJsContext.perAdGmsgHandlers.add(gbVar);
                    }
                } else {
                    perAdNativeJavscriptEngineJsContext = this;
                    u7 u7Var = perAdNativeJavscriptEngineJsContext.f33994a;
                    sb2Var.f9499a = null;
                    sb2Var.f9500b = null;
                    sb2Var.f9501c = null;
                    sb2Var.f9502d = null;
                    sb2Var.f9505g = 3;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            dVar2 = sb2Var.f9502d;
            gbVar = sb2Var.f9501c;
            str2 = sb2Var.f9500b;
            perAdNativeJavscriptEngineJsContext = sb2Var.f9499a;
            ResultKt.b(obj);
            try {
                perAdNativeJavscriptEngineJsContext.perAdGmsgHandlers.add(gbVar);
            } finally {
            }
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            dVar = sb2Var.f9502d;
            gbVar = sb2Var.f9501c;
            str2 = sb2Var.f9500b;
            perAdNativeJavscriptEngineJsContext = sb2Var.f9499a;
            ResultKt.b(obj);
            try {
                gbVar.a(perAdNativeJavscriptEngineJsContext.f33995b);
                perAdNativeJavscriptEngineJsContext.perAdGmsgHandlers.add(gbVar);
            } finally {
            }
        }
        str = str2;
        u7 u7Var2 = perAdNativeJavscriptEngineJsContext.f33994a;
        sb2Var.f9499a = null;
        sb2Var.f9500b = null;
        sb2Var.f9501c = null;
        sb2Var.f9502d = null;
        sb2Var.f9505g = 3;
    }

    @Override // b.u7
    public final Object a(String str, s sVar, zw0 zw0Var) {
        return this.f33994a.a(str, sVar, zw0Var);
    }
}
