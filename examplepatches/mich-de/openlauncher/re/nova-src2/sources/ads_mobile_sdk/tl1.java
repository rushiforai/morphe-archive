package ads_mobile_sdk;

import b.p2;
import java.io.Closeable;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes2.dex */
public final class tl1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final zt1 f9984a;

    /* renamed from: b, reason: collision with root package name */
    public final p2 f9985b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f9986c;

    public tl1(zt1 nativeAdCore, p2 nativeJavascriptEngine) {
        Intrinsics.g(nativeAdCore, "nativeAdCore");
        Intrinsics.g(nativeJavascriptEngine, "nativeJavascriptEngine");
        this.f9984a = nativeAdCore;
        this.f9985b = nativeJavascriptEngine;
        this.f9986c = new AtomicBoolean(false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x0101, code lost:
    
        if (r0.a(r2, r10) == r5) goto L47;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00cc A[Catch: all -> 0x0107, TryCatch #1 {all -> 0x0107, blocks: (B:42:0x00c1, B:44:0x00cc, B:45:0x00dc), top: B:90:0x00c1 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00dc A[Catch: all -> 0x0107, TRY_LEAVE, TryCatch #1 {all -> 0x0107, blocks: (B:42:0x00c1, B:44:0x00cc, B:45:0x00dc), top: B:90:0x00c1 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0123 A[Catch: all -> 0x012f, TryCatch #6 {all -> 0x012f, blocks: (B:61:0x011c, B:63:0x0123, B:65:0x0127, B:67:0x012b, B:70:0x0132, B:72:0x0136, B:74:0x013a, B:76:0x013e, B:77:0x013f, B:78:0x0144, B:79:0x0145, B:80:0x014c, B:81:0x014d, B:82:0x0154, B:83:0x0155), top: B:99:0x011c }] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0155 A[Catch: all -> 0x012f, TRY_LEAVE, TryCatch #6 {all -> 0x012f, blocks: (B:61:0x011c, B:63:0x0123, B:65:0x0127, B:67:0x012b, B:70:0x0132, B:72:0x0136, B:74:0x013a, B:76:0x013e, B:77:0x013f, B:78:0x0144, B:79:0x0145, B:80:0x014c, B:81:0x014d, B:82:0x0154, B:83:0x0155), top: B:99:0x011c }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v15, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v18, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v19 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v20 */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        sl1 sl1Var;
        th3 th3Var;
        th3 th3Var2;
        th3 th3Var3;
        tl1 tl1Var;
        th3 th3Var4;
        th3 th3Var5;
        b.a1 a1Var;
        ?? r32;
        Map map2 = map;
        if (continuation instanceof sl1) {
            sl1Var = (sl1) continuation;
            int i5 = sl1Var.f9608g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sl1Var.f9608g = i5 - Integer.MIN_VALUE;
            } else {
                sl1Var = new sl1(this, continuation);
            }
        }
        sl1 sl1Var2 = sl1Var;
        Object obj = sl1Var2.f9606e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sl1Var2.f9608g;
        if (i11 == 0) {
            ResultKt.b(obj);
            String str = (String) map2.get("overlayHtml");
            if (str == null) {
                return Unit.f71706a;
            }
            String str2 = (String) map2.get("baseUrl");
            tx0 tx0Var2 = (tx0) this.f9984a.f12655d.get();
            if (tx0Var2 == null) {
                zi3.a(6, "Handling loadHtml gmsg while 1.5 click overlay not available", null);
                return Unit.f71706a;
            }
            WeakHashMap weakHashMap = ji3.f5253a;
            th3 th3VarA = ji3.a(wv0.CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_LOAD, EmptyList.f71733a, true);
            try {
                if (!this.f9986c.compareAndSet(false, true)) {
                    th3 th3Var6 = th3VarA;
                    th3Var3 = th3Var6;
                    r32 = th3Var6;
                    Unit unit = Unit.f71706a;
                    CloseableKt.a(r32, null);
                    return unit;
                }
                sl1Var2.f9602a = this;
                sl1Var2.f9603b = map2;
                sl1Var2.f9604c = th3VarA;
                sl1Var2.f9605d = th3VarA;
                sl1Var2.f9608g = 1;
                th3Var = th3VarA;
                try {
                    Object objA = tx0.a(tx0Var2, str, str2, false, (ContinuationImpl) sl1Var2, 12);
                    if (objA != coroutineSingletons) {
                        tl1Var = this;
                        th3Var4 = th3Var;
                        obj = objA;
                        th3Var5 = th3Var4;
                        a1Var = (b.a1) obj;
                        tl1Var.f9986c.getAndSet(false);
                        if (a1Var instanceof pu0) {
                        }
                        r32 = th3Var5;
                        th3Var3 = th3Var4;
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(r32, null);
                        return unit2;
                    }
                    return coroutineSingletons;
                } catch (Throwable th2) {
                    th = th2;
                    th3Var2 = th3Var;
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                th3Var = th3VarA;
            }
        } else if (i11 == 1) {
            th3Var5 = sl1Var2.f9605d;
            th3Var4 = sl1Var2.f9604c;
            map2 = (Map) sl1Var2.f9603b;
            tl1Var = (tl1) sl1Var2.f9602a;
            try {
                ResultKt.b(obj);
                try {
                    a1Var = (b.a1) obj;
                    tl1Var.f9986c.getAndSet(false);
                    if (a1Var instanceof pu0) {
                        com.google.gson.r rVar = new com.google.gson.r();
                        rVar.s("messageType", "htmlLoaded");
                        rVar.s("id", (String) map2.get("id"));
                        p2 p2Var = tl1Var.f9985b;
                        sl1Var2.f9602a = th3Var4;
                        sl1Var2.f9603b = th3Var5;
                        sl1Var2.f9604c = null;
                        sl1Var2.f9605d = null;
                        sl1Var2.f9608g = 2;
                    } else {
                        zi3.a(6, "Error loading html overlay: " + a1Var, null);
                    }
                    r32 = th3Var5;
                    th3Var3 = th3Var4;
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(r32, null);
                    return unit22;
                } catch (Throwable th4) {
                    th = th4;
                    th3Var = th3Var5;
                    th3Var2 = th3Var4;
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } catch (Throwable th5) {
                th = th5;
                r32 = th3Var5;
                th3Var3 = th3Var4;
                th3Var = r32;
                th3Var2 = th3Var3;
                th3Var2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r32 = (Closeable) sl1Var2.f9603b;
            th3Var3 = (th3) sl1Var2.f9602a;
            try {
                ResultKt.b(obj);
                r32 = r32;
                Unit unit222 = Unit.f71706a;
                CloseableKt.a(r32, null);
                return unit222;
            } catch (Throwable th6) {
                th = th6;
                th3Var = r32;
                th3Var2 = th3Var3;
                try {
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                        throw th;
                    }
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var2.a(th);
                    }
                    if (th instanceof TimeoutCancellationException) {
                        throw new lw0(th);
                    }
                    if (th instanceof CancellationException) {
                        throw new du0(th);
                    }
                    if (th instanceof dv0) {
                        throw th;
                    }
                    throw new iu0(th);
                } finally {
                }
            }
        }
    }

    @Override // b.gb
    public final int b() {
        return 47;
    }
}
