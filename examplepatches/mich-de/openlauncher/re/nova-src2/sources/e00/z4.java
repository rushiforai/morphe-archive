package e00;

import ads_mobile_sdk.iy0;
import ads_mobile_sdk.tx0;
import android.content.Context;
import android.util.Log;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final class z4 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51215t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f51216u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z4(int i5) {
        super(2, null);
        this.f51215t = i5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51215t) {
            case 0:
                z4 z4Var = new z4(2, continuation, 0);
                z4Var.f51216u = obj;
                return z4Var;
            case 1:
                z4 z4Var2 = new z4(2, continuation, 1);
                z4Var2.f51216u = obj;
                return z4Var2;
            case 2:
                z4 z4Var3 = new z4(2, continuation, 2);
                z4Var3.f51216u = obj;
                return z4Var3;
            case 3:
                z4 z4Var4 = new z4(2, continuation, 3);
                z4Var4.f51216u = obj;
                return z4Var4;
            case 4:
                z4 z4Var5 = new z4(2, continuation, 4);
                z4Var5.f51216u = obj;
                return z4Var5;
            case 5:
                z4 z4Var6 = new z4(2, continuation, 5);
                z4Var6.f51216u = obj;
                return z4Var6;
            case 6:
                z4 z4Var7 = new z4(2, continuation, 6);
                z4Var7.f51216u = obj;
                return z4Var7;
            case 7:
                z4 z4Var8 = new z4(2, continuation, 7);
                z4Var8.f51216u = obj;
                return z4Var8;
            case 8:
                z4 z4Var9 = new z4(2, continuation, 8);
                z4Var9.f51216u = obj;
                return z4Var9;
            case 9:
                z4 z4Var10 = new z4(2, continuation, 9);
                z4Var10.f51216u = obj;
                return z4Var10;
            case 10:
                z4 z4Var11 = new z4(2, continuation, 10);
                z4Var11.f51216u = obj;
                return z4Var11;
            case 11:
                z4 z4Var12 = new z4(2, continuation, 11);
                z4Var12.f51216u = obj;
                return z4Var12;
            case 12:
                z4 z4Var13 = new z4(2, continuation, 12);
                z4Var13.f51216u = obj;
                return z4Var13;
            case 13:
                z4 z4Var14 = new z4(2, continuation, 13);
                z4Var14.f51216u = obj;
                return z4Var14;
            case 14:
                z4 z4Var15 = new z4(2, continuation, 14);
                z4Var15.f51216u = obj;
                return z4Var15;
            case 15:
                z4 z4Var16 = new z4(2, continuation, 15);
                z4Var16.f51216u = obj;
                return z4Var16;
            case 16:
                z4 z4Var17 = new z4(2, continuation, 16);
                z4Var17.f51216u = obj;
                return z4Var17;
            case 17:
                z4 z4Var18 = new z4(2, continuation, 17);
                z4Var18.f51216u = obj;
                return z4Var18;
            case 18:
                z4 z4Var19 = new z4(2, continuation, 18);
                z4Var19.f51216u = obj;
                return z4Var19;
            case 19:
                z4 z4Var20 = new z4(2, continuation, 19);
                z4Var20.f51216u = obj;
                return z4Var20;
            case 20:
                z4 z4Var21 = new z4(2, continuation, 20);
                z4Var21.f51216u = obj;
                return z4Var21;
            case 21:
                z4 z4Var22 = new z4(2, continuation, 21);
                z4Var22.f51216u = obj;
                return z4Var22;
            case 22:
                z4 z4Var23 = new z4(2, continuation, 22);
                z4Var23.f51216u = obj;
                return z4Var23;
            case 23:
                z4 z4Var24 = new z4(2, continuation, 23);
                z4Var24.f51216u = obj;
                return z4Var24;
            default:
                z4 z4Var25 = new z4(2, continuation, 24);
                z4Var25.f51216u = obj;
                return z4Var25;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f51215t) {
            case 0:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                z4 z4Var = new z4(2, (Continuation) obj2, 1);
                z4Var.f51216u = (tx0) obj;
                return z4Var.invokeSuspend(Unit.f71706a);
            case 2:
                z4 z4Var2 = new z4(2, (Continuation) obj2, 2);
                z4Var2.f51216u = (tx0) obj;
                return z4Var2.invokeSuspend(Unit.f71706a);
            case 3:
                z4 z4Var3 = new z4(2, (Continuation) obj2, 3);
                z4Var3.f51216u = (tx0) obj;
                return z4Var3.invokeSuspend(Unit.f71706a);
            case 4:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 5:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 6:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 7:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 8:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 9:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 10:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 11:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 12:
                return ((z4) create((sx.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 13:
                return ((z4) create((String) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 14:
                return ((z4) create((Integer) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 15:
                return ((z4) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 16:
                return ((z4) create(obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 17:
                return ((z4) create((op.m) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 18:
                return ((z4) create((List) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 19:
                return ((z4) create((String) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 20:
                return ((z4) create((t5.i1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 21:
                return ((z4) create((List) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 22:
                return ((z4) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 23:
                return ((z4) create((List) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((z4) create((pw.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws InterruptedException {
        Object objA;
        Continuation continuation = null;
        int i5 = 5;
        int i11 = 2;
        int i12 = 1;
        switch (this.f51215t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar = (sx.a) this.f51216u;
                for (int i13 = 0; i13 < 5; i13++) {
                    aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 10.0d);
                }
                for (int i14 = 0; i14 < 3; i14++) {
                    aVar.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", false, 0.0d);
                }
                int iC = aVar.c("ca-app-pub-4858839354660716/1043145278", "t1", sx.o.f87812c);
                if (iC == 3) {
                    return new j6(true, b.c0.h(iC, "consecutiveFailures="));
                }
                throw new IllegalStateException(b.c0.h(iC, "Expected 3, got ").toString());
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                iy0 iy0VarB = ((tx0) this.f51216u).b();
                iy0VarB.n.setValue(iy0VarB, iy0.f5027w[2], Boolean.TRUE);
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                iy0 iy0VarB2 = ((tx0) this.f51216u).b();
                iy0VarB2.n.setValue(iy0VarB2, iy0.f5027w[2], Boolean.TRUE);
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((tx0) this.f51216u).n.set(true);
                return Unit.f71706a;
            case 4:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar2 = (sx.a) this.f51216u;
                for (int i15 = 0; i15 < 200; i15++) {
                    aVar2.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, b.c0.h((i15 % 3) + 1, "t"), i15 % 4 != 0, i15 % 15);
                }
                IntRange intRange = new IntRange(1, 100, 1);
                ArrayList arrayList = new ArrayList(b70.c.u0(intRange, 10));
                IntProgressionIterator it = intRange.iterator();
                while (it.f71911c) {
                    it.nextInt();
                    long jNanoTime = System.nanoTime();
                    aVar2.b("ca-app-pub-4858839354660716/1043145278", "t1", sx.o.f87812c);
                    arrayList.add(new Double((System.nanoTime() - jNanoTime) / 1000000.0d));
                }
                double dDoubleValue = ((Number) b70.g.C1(arrayList).get((int) (r2.size() * 0.95d))).doubleValue();
                if (dDoubleValue < 50.0d) {
                    StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
                    return new j6(true, b.c0.l("p95=", String.format("%.1f", Arrays.copyOf(new Object[]{new Double(dDoubleValue)}, 1)), "ms"));
                }
                StringCompanionObject stringCompanionObject2 = StringCompanionObject.f71868a;
                throw new IllegalStateException(b.c0.l("p95 latency ", String.format("%.1f", Arrays.copyOf(new Object[]{new Double(dDoubleValue)}, 1)), "ms exceeds 50ms").toString());
            case 5:
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar3 = (sx.a) this.f51216u;
                for (int i16 = 0; i16 < 50; i16++) {
                    aVar3.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 20.0d);
                }
                sx.o oVar = sx.o.f87812c;
                sx.k kVarB = aVar3.b("ca-app-pub-4858839354660716/1043145278", "t1", oVar);
                sx.k kVarB2 = aVar3.b("ca-app-pub-4858839354660716/9559343163", "t1", oVar);
                int i17 = kVarB.f87797b;
                if (i17 != 50) {
                    throw new IllegalStateException(b.c0.h(i17, "DRAWER should have 50 obs, got ").toString());
                }
                int i18 = kVarB2.f87797b;
                if (i18 == 0) {
                    return new j6(true, b.c0.g(i17, i18, "DRAWER=", ", BANNER="));
                }
                throw new IllegalStateException(b.c0.h(i18, "BANNER should have 0 obs, got ").toString());
            case 6:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar4 = (sx.a) this.f51216u;
                for (int i19 = 0; i19 < 10; i19++) {
                    aVar4.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 0.0d);
                }
                sx.k kVarB3 = aVar4.b("ca-app-pub-4858839354660716/1043145278", "t1", sx.o.f87812c);
                int i21 = kVarB3.f87797b;
                if (i21 != 10) {
                    throw new IllegalStateException("Expected 10 obs");
                }
                if (kVarB3.a() < 0.0d) {
                    throw new IllegalStateException("CPM must be >= 0");
                }
                StringCompanionObject stringCompanionObject3 = StringCompanionObject.f71868a;
                return new j6(true, a80.m.f(i21, "obs=", ", cpm=", String.format("%.2f", Arrays.copyOf(new Object[]{new Double(kVarB3.a())}, 1))));
            case 7:
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar5 = (sx.a) this.f51216u;
                for (int i22 = 0; i22 < 10; i22++) {
                    aVar5.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 500.0d);
                }
                sx.k kVarB4 = aVar5.b("ca-app-pub-4858839354660716/1043145278", "t1", sx.o.f87812c);
                if (kVarB4.a() > 400.0d) {
                    StringCompanionObject stringCompanionObject4 = StringCompanionObject.f71868a;
                    return new j6(true, "cpm=".concat(String.format("%.2f", Arrays.copyOf(new Object[]{new Double(kVarB4.a())}, 1))));
                }
                throw new IllegalStateException(("Expected high CPM, got " + kVarB4.a()).toString());
            case 8:
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar6 = (sx.a) this.f51216u;
                for (int i23 = 0; i23 < 1000; i23++) {
                    int i24 = i23 % 3;
                    aVar6.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, b.c0.h(i24 + 1, "t"), i24 != 0, i23 % 20);
                }
                long jNanoTime2 = System.nanoTime();
                sx.k kVarB5 = aVar6.b("ca-app-pub-4858839354660716/1043145278", "t1", sx.o.f87812c);
                double dNanoTime = (System.nanoTime() - jNanoTime2) / 1000000.0d;
                if (dNanoTime < 100.0d) {
                    int i25 = kVarB5.f87797b;
                    StringCompanionObject stringCompanionObject5 = StringCompanionObject.f71868a;
                    return new j6(true, a80.m.f(i25, "obs=", ", queryMs=", String.format("%.1f", Arrays.copyOf(new Object[]{new Double(dNanoTime)}, 1))));
                }
                throw new IllegalStateException(("Query took " + dNanoTime + "ms, expected < 100ms").toString());
            case 9:
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar7 = (sx.a) this.f51216u;
                for (int i26 = 0; i26 < 20; i26++) {
                    aVar7.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 10.0d);
                }
                aVar7.a();
                sx.o oVar2 = sx.o.f87812c;
                int i27 = aVar7.b("ca-app-pub-4858839354660716/1043145278", "t1", oVar2).f87797b;
                if (i27 != 0) {
                    throw new IllegalStateException(b.c0.h(i27, "After clear, expected 0 obs, got ").toString());
                }
                int iC2 = aVar7.c("ca-app-pub-4858839354660716/1043145278", "t1", oVar2);
                if (iC2 == 0) {
                    return new j6(true, "obs=0, failures=0");
                }
                throw new IllegalStateException(b.c0.h(iC2, "After clear, expected 0 failures, got ").toString());
            case 10:
                CoroutineSingletons coroutineSingletons11 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar8 = (sx.a) this.f51216u;
                sx.o oVar3 = sx.o.f87812c;
                aVar8.f("ca-app-pub-4858839354660716/1043145278", oVar3, "t1", true, 10.0d);
                aVar8.f("ca-app-pub-4858839354660716/1043145278", oVar3, "t1", false, 0.0d);
                aVar8.f("ca-app-pub-4858839354660716/1043145278", oVar3, "t1", false, 0.0d);
                aVar8.f("ca-app-pub-4858839354660716/1043145278", oVar3, "t1", true, 5.0d);
                aVar8.f("ca-app-pub-4858839354660716/1043145278", oVar3, "t1", false, 0.0d);
                int iC3 = aVar8.c("ca-app-pub-4858839354660716/1043145278", "t1", oVar3);
                if (iC3 != 1) {
                    throw new IllegalStateException(b.c0.h(iC3, "Expected 1 trailing failure, got ").toString());
                }
                int i28 = aVar8.b("ca-app-pub-4858839354660716/1043145278", "t1", oVar3).f87797b;
                if (i28 == 5) {
                    return new j6(true, b.c0.g(iC3, i28, "failures=", ", obs="));
                }
                throw new IllegalStateException(b.c0.h(i28, "Expected 5 obs, got ").toString());
            case 11:
                CoroutineSingletons coroutineSingletons12 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar9 = (sx.a) this.f51216u;
                CountDownLatch countDownLatch = new CountDownLatch(50);
                for (int i29 = 0; i29 < 50; i29++) {
                    new Thread(new com.instabridge.ai.chat.ui.c0(aVar9, i29, countDownLatch, i12)).start();
                }
                countDownLatch.await(10L, TimeUnit.SECONDS);
                LinkedHashMap linkedHashMapD = aVar9.d("ca-app-pub-4858839354660716/1043145278");
                if (linkedHashMapD.isEmpty()) {
                    throw new IllegalStateException("Should have network stats after writes");
                }
                return new j6(true, b.c0.h(linkedHashMapD.size(), "50 parallel writes OK, networks="));
            case 12:
                CoroutineSingletons coroutineSingletons13 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                sx.a aVar10 = (sx.a) this.f51216u;
                for (int i31 = 0; i31 < 50; i31++) {
                    aVar10.f("ca-app-pub-4858839354660716/1043145278", sx.o.f87812c, "t1", true, 20.0d);
                }
                sx.o oVar4 = sx.o.f87812c;
                sx.k kVarB6 = aVar10.b("ca-app-pub-4858839354660716/1043145278", "t1", oVar4);
                sx.k kVarB7 = aVar10.b("ca-app-pub-4858839354660716/5914434907", "t1", oVar4);
                sx.k kVarB8 = aVar10.b("ca-app-pub-4858839354660716/9559343163", "t1", oVar4);
                int i32 = kVarB6.f87797b;
                if (i32 != 50) {
                    throw new IllegalStateException(b.c0.h(i32, "DRAWER should have 50, got ").toString());
                }
                int i33 = kVarB7.f87797b;
                if (i33 != 0) {
                    throw new IllegalStateException(b.c0.h(i33, "LEFT_SWIPE should have 0, got ").toString());
                }
                int i34 = kVarB8.f87797b;
                if (i34 != 0) {
                    throw new IllegalStateException(b.c0.h(i34, "BANNER should have 0, got ").toString());
                }
                StringBuilder sbT = b.c0.t(i32, "drawer=", ", leftSwipe=", i33, ", banner=");
                sbT.append(i34);
                return new j6(true, sbT.toString());
            case 13:
                CoroutineSingletons coroutineSingletons14 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                Log.e("FirebaseSessions", "Error failed to fetch the remote configs: " + ((String) this.f51216u));
                return Unit.f71706a;
            case 14:
                CoroutineSingletons coroutineSingletons15 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(((Integer) this.f51216u) != null);
            case 15:
                CoroutineSingletons coroutineSingletons16 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                try {
                    int i35 = Result.f71687b;
                    objA = InetAddress.getByName("googleads.g.doubleclick.net");
                } catch (Throwable th2) {
                    int i36 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (!(objA instanceof Result.Failure)) {
                    Log.i("NovaAds", "DNS probe: googleads.g.doubleclick.net OK (" + ((InetAddress) objA).getHostAddress() + ")");
                }
                Throwable thA = Result.a(objA);
                if (thA != null) {
                    Log.e("NovaAds", "DNS probe: googleads.g.doubleclick.net FAILED: " + thA.getMessage() + " — check device Private DNS / VPN / data saver");
                }
                return Unit.f71706a;
            case 16:
                CoroutineSingletons coroutineSingletons17 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(this.f51216u instanceof mt.x);
            case 17:
                CoroutineSingletons coroutineSingletons18 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                op.m updatedSettingsAnalytics = (op.m) this.f51216u;
                Context context = mx.g0.f77088a;
                op.r rVarI = mx.g0.i();
                Intrinsics.g(updatedSettingsAnalytics, "updatedSettingsAnalytics");
                if (rVarI.f80578b) {
                    qp.i iVar = rVarI.f80579c;
                    iVar.getClass();
                    synchronized (iVar.f84309c) {
                        try {
                            np.d dVar = (np.d) iVar.f84310d;
                            if (dVar != null) {
                                dVar.f78502s = updatedSettingsAnalytics.f80563a;
                            }
                            if (dVar != null) {
                                dVar.f78503t = updatedSettingsAnalytics.f80564b;
                            }
                            if (dVar != null) {
                                dVar.f78504u = updatedSettingsAnalytics.f80565c;
                            }
                            if (dVar != null) {
                                dVar.f78505v = updatedSettingsAnalytics.f80566d;
                            }
                            if (dVar != null) {
                                dVar.f78506w = updatedSettingsAnalytics.f80567e;
                            }
                            if (dVar != null) {
                                String[] strArr = (String[]) updatedSettingsAnalytics.f80568f.toArray(new String[0]);
                                Intrinsics.g(strArr, "<set-?>");
                                dVar.f78507x = strArr;
                            }
                            Unit unit = Unit.f71706a;
                        } catch (Throwable th3) {
                            throw th3;
                        }
                    }
                }
                return Unit.f71706a;
            case 18:
                CoroutineSingletons coroutineSingletons19 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List list = (List) this.f51216u;
                Context context2 = mx.g0.f77088a;
                op.r rVarI2 = mx.g0.i();
                List list2 = list;
                ArrayList arrayList2 = new ArrayList(b70.c.u0(list2, 10));
                Iterator it2 = list2.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(((y30.b) it2.next()).name());
                }
                rVarI2.e(new op.p(arrayList2));
                return Unit.f71706a;
            case 19:
                CoroutineSingletons coroutineSingletons20 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                String str = (String) this.f51216u;
                return Boolean.valueOf(!(str == null || r70.k.U0(str)));
            case 20:
                CoroutineSingletons coroutineSingletons21 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(!(((t5.i1) this.f51216u) instanceof t5.n0));
            case 21:
                CoroutineSingletons coroutineSingletons22 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(!((List) this.f51216u).isEmpty());
            case 22:
                CoroutineSingletons coroutineSingletons23 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                t70.j0 j0Var = (t70.j0) this.f51216u;
                a80.e eVar = t70.y0.f88884a;
                t70.m0.t(j0Var, a80.d.f488c, null, new p10.p1(i11, continuation, i5), 2);
                return Unit.f71706a;
            case 23:
                CoroutineSingletons coroutineSingletons24 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(!((List) this.f51216u).isEmpty());
            default:
                CoroutineSingletons coroutineSingletons25 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                pw.a aVar11 = (pw.a) this.f51216u;
                if (!aVar11.f83106b) {
                    aVar11 = null;
                }
                if (aVar11 != null) {
                    return aVar11.f83105a;
                }
                return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z4(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f51215t = i11;
    }
}
