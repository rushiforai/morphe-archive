package io.branch.search.internal;

import io.branch.search.internal.AbstractC3196i6;
import io.branch.search.internal.J2;
import java.util.EnumMap;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.s8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3366s8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F2 f65755a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3257m0 f65756b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final H f65757c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final InterfaceC3272mf f65758d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Z1 f65759e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Ye f65760f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final A9 f65761g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Cif f65762h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final y40.y f65763i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final EnumMap<EnumC3075b4, C3112d7> f65764j;

    @DebugMetadata(c = "io.branch.search.internal.interfaces.KNetworkInterface", f = "KNetworkInterface.kt", l = {90}, m = "makeGet")
    /* renamed from: io.branch.search.internal.s8$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f65765a;

        /* renamed from: c, reason: collision with root package name */
        public int f65767c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65765a = obj;
            this.f65767c |= Integer.MIN_VALUE;
            return C3366s8.this.a(null, null, null, null, null, this);
        }
    }

    public C3366s8(@NotNull G2 remoteConfigManager, @NotNull C3291o0 analyticsStateRepository, @NotNull I analyticalBufferRepository, @NotNull InterfaceC3272mf userAgentFetcher, @NotNull Z1 branchDeviceInfo, @NotNull Ze transferDataSource, @NotNull B9 networkRepository, @NotNull Cif updateRemoteConfiguration, @NotNull y40.y maxDailyBandwidthCap) {
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(analyticsStateRepository, "analyticsStateRepository");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(userAgentFetcher, "userAgentFetcher");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(transferDataSource, "transferDataSource");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(updateRemoteConfiguration, "updateRemoteConfiguration");
        Intrinsics.g(maxDailyBandwidthCap, "maxDailyBandwidthCap");
        this.f65755a = remoteConfigManager;
        this.f65756b = analyticsStateRepository;
        this.f65757c = analyticalBufferRepository;
        this.f65758d = userAgentFetcher;
        this.f65759e = branchDeviceInfo;
        this.f65760f = transferDataSource;
        this.f65761g = networkRepository;
        this.f65762h = updateRemoteConfiguration;
        this.f65763i = maxDailyBandwidthCap;
        EnumMap<EnumC3075b4, C3112d7> enumMap = new EnumMap<>(EnumC3075b4.class);
        this.f65764j = enumMap;
        for (EnumC3075b4 enumC3075b4 : EnumC3075b4.values()) {
            enumMap.put((EnumMap<EnumC3075b4, C3112d7>) enumC3075b4, (EnumC3075b4) a(enumC3075b4));
        }
    }

    @NotNull
    public final C3112d7 a(@NotNull EnumC3075b4 channel) {
        Intrinsics.g(channel, "channel");
        C3112d7 c3112d7 = this.f65764j.get(channel);
        return c3112d7 == null ? new C3112d7(channel, this.f65755a, this.f65760f, this.f65761g, this.f65756b, this.f65757c, this.f65762h, this.f65763i) : c3112d7;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull EnumC3075b4 enumC3075b4, @NotNull String str2, @Nullable Map<String, String> map, @Nullable String str3, @NotNull Continuation<? super AbstractC3196i6<J2, ? extends JSONObject>> continuation) {
        a aVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f65767c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f65767c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object objA = aVar2.f65765a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f65767c;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                Intrinsics.g(str2, "<this>");
                x80.v vVar = new x80.v();
                vVar.e(null, str2);
                x80.v vVarG = vVar.b().g();
                if (map != null) {
                    for (Map.Entry<String, String> entry : map.entrySet()) {
                        vVarG.a(entry.getKey(), entry.getValue());
                    }
                }
                x80.w wVarB = vVarG.b();
                C3112d7 c3112d7A = a(enumC3075b4);
                String str4 = wVarB.f95633i;
                InterfaceC3272mf interfaceC3272mf = this.f65758d;
                Z1 z12 = this.f65759e;
                aVar2.f65767c = 1;
                objA = c3112d7A.a(str, str4, interfaceC3272mf, z12, str3, aVar2);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
            }
            return (AbstractC3196i6) objA;
        } catch (IllegalArgumentException unused) {
            J2.b errorCode = J2.b.BAD_REQUEST_ERR;
            Intrinsics.g(errorCode, "errorCode");
            return new AbstractC3196i6.a(new J2(errorCode, J2.a.a(J2.Companion, errorCode), null));
        }
    }
}
