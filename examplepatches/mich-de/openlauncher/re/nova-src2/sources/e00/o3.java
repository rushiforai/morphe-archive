package e00;

import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.teslacoilsw.launcher.preferences.fragments.ScrollEffectPreviewPagedView;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.Arrays;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.CombinedContext;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.reflect.KProperty;

/* loaded from: classes4.dex */
public final /* synthetic */ class o3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50847a;

    public /* synthetic */ o3(int i5) {
        this.f50847a = 7;
        o2.f fVar = qx.l.f84543e;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) throws IOException {
        CombinedContext combinedContext;
        switch (this.f50847a) {
            case 0:
                ((Integer) obj2).getClass();
                r3.c((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 1:
                ((Integer) obj2).getClass();
                r3.a((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 2:
                ((Integer) obj2).getClass();
                r3.e((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 3:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.w((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 4:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.q((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 5:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.n((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 6:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.b((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 7:
                o2.f fVar = qx.l.f84543e;
                ((Integer) obj2).getClass();
                cl.l0.e((p1.o) obj, p1.a0.l(439));
                return Unit.f71706a;
            case 8:
                int iIntValue = ((Integer) obj2).intValue();
                Integer numU0 = r70.i.u0((String) obj);
                if (numU0 == null) {
                    return null;
                }
                int iIntValue2 = numU0.intValue() + iIntValue;
                if (iIntValue2 < 0 && iIntValue > 0) {
                    return "0";
                }
                if (iIntValue2 > 24 && iIntValue < 0) {
                    return "24";
                }
                if (iIntValue2 < 0 || iIntValue2 > 24) {
                    return null;
                }
                return String.format("%02d", Arrays.copyOf(new Object[]{Integer.valueOf(iIntValue2)}, 1));
            case 9:
                return (f1.w1) ((p1.s2) ((f1.v1) obj2).f54045a.f54114d).getValue();
            case 10:
                return (f1.d3) ((p1.s2) ((f1.c3) obj2).f53424b.f54114d).getValue();
            case 11:
                return Integer.valueOf(((z2.s) obj).F(((Integer) obj2).intValue()));
            case 12:
                return Integer.valueOf(((z2.s) obj).t(((Integer) obj2).intValue()));
            case 13:
                return Integer.valueOf(((z2.s) obj).b(((Integer) obj2).intValue()));
            case 14:
                return Integer.valueOf(((z2.s) obj).E(((Integer) obj2).intValue()));
            case 15:
                String acc = (String) obj;
                CoroutineContext.Element element = (CoroutineContext.Element) obj2;
                Intrinsics.g(acc, "acc");
                Intrinsics.g(element, "element");
                if (acc.length() == 0) {
                    return element.toString();
                }
                return acc + ", " + element;
            case 16:
                CoroutineContext acc2 = (CoroutineContext) obj;
                CoroutineContext.Element element2 = (CoroutineContext.Element) obj2;
                Intrinsics.g(acc2, "acc");
                Intrinsics.g(element2, "element");
                CoroutineContext coroutineContextMinusKey = acc2.minusKey(element2.getKey());
                EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
                if (coroutineContextMinusKey == emptyCoroutineContext) {
                    return element2;
                }
                ContinuationInterceptor.Key key = ContinuationInterceptor.f71801cp;
                ContinuationInterceptor continuationInterceptor = (ContinuationInterceptor) coroutineContextMinusKey.get(key);
                if (continuationInterceptor == null) {
                    combinedContext = new CombinedContext(element2, coroutineContextMinusKey);
                } else {
                    CoroutineContext coroutineContextMinusKey2 = coroutineContextMinusKey.minusKey(key);
                    if (coroutineContextMinusKey2 == emptyCoroutineContext) {
                        return new CombinedContext(continuationInterceptor, element2);
                    }
                    combinedContext = new CombinedContext(continuationInterceptor, new CombinedContext(element2, coroutineContextMinusKey2));
                }
                return combinedContext;
            case 17:
                HttpURLConnection open = (HttpURLConnection) obj;
                fr.t0 request = (fr.t0) obj2;
                Intrinsics.g(open, "$this$open");
                Intrinsics.g(request, "request");
                open.setConnectTimeout(fr.j.f55642a);
                open.setReadTimeout(fr.j.f55643b);
                open.setUseCaches(request.e());
                open.setRequestMethod(request.b().f55698a);
                for (Map.Entry entry : request.a().entrySet()) {
                    open.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
                if (fr.r0.f55695c == request.b()) {
                    open.setDoOutput(true);
                    Map mapC = request.c();
                    if (mapC != null) {
                        for (Map.Entry entry2 : mapC.entrySet()) {
                            open.setRequestProperty((String) entry2.getKey(), (String) entry2.getValue());
                        }
                    }
                    OutputStream outputStream = open.getOutputStream();
                    try {
                        Intrinsics.d(outputStream);
                        request.g(outputStream);
                        Unit unit = Unit.f71706a;
                        outputStream.close();
                    } catch (Throwable th2) {
                        try {
                            throw th2;
                        } catch (Throwable th3) {
                            CloseableKt.a(outputStream, th2);
                            throw th3;
                        }
                    }
                }
                return Unit.f71706a;
            case 18:
                return new AdaptiveIconDrawable((Drawable) obj, (Drawable) obj2);
            case 19:
                int iIntValue3 = ((Integer) obj2).intValue();
                Integer numT0 = r70.i.t0(16, (String) obj);
                Integer numValueOf = numT0 != null ? Integer.valueOf(numT0.intValue() + iIntValue3) : null;
                IntRange intRange = new IntRange(0, 16777215, 1);
                if (numValueOf == null || !intRange.g(numValueOf.intValue())) {
                    return null;
                }
                return String.format("%06x", Arrays.copyOf(new Object[]{numValueOf}, 1));
            case 20:
                ScrollEffectPreviewPagedView scrollEffectPreviewPagedView = (ScrollEffectPreviewPagedView) ((View) obj).findViewById(2131429249);
                scrollEffectPreviewPagedView.u0(e10.h3.valueOf(((f10.x) obj2).f54219a));
                scrollEffectPreviewPagedView.t0();
                return Unit.f71706a;
            case 21:
                ScrollEffectPreviewPagedView scrollEffectPreviewPagedView2 = (ScrollEffectPreviewPagedView) ((View) obj).findViewById(2131429249);
                scrollEffectPreviewPagedView2.u0(e10.h3.valueOf(((f10.x) obj2).f54219a));
                scrollEffectPreviewPagedView2.t0();
                return Unit.f71706a;
            case 22:
                ((Boolean) obj).getClass();
                Boolean bool = (Boolean) obj2;
                bool.getClass();
                mx.g0.a(null);
                e10.y2.f51877a.getClass();
                e10.s2 s2Var = e10.y2.f51943r2;
                KProperty kProperty = e10.y2.f51881b[169];
                s2Var.getClass();
                s2Var.h(bool);
                return Unit.f71706a;
            case 23:
                ((Integer) obj2).getClass();
                g90.k.t((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 24:
                ((Integer) obj2).getClass();
                hv.k2.d((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 25:
                return Float.valueOf(((Number) kotlin.ranges.a.i0(Float.valueOf(((Float) obj).floatValue() + ((Integer) obj2).intValue()), hy.a0.f60908a)).floatValue());
            case 26:
                return (String) obj;
            case 27:
                ((Integer) obj2).getClass();
                io.sentry.config.a.e((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            case 28:
                ((Integer) obj2).getClass();
                j00.g0.a((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
            default:
                ((Integer) obj2).getClass();
                jk.b.f((p1.o) obj, p1.a0.l(1));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ o3(int i5, byte b11) {
        this.f50847a = i5;
    }

    public /* synthetic */ o3(int i5, int i11) {
        this.f50847a = i11;
    }
}
