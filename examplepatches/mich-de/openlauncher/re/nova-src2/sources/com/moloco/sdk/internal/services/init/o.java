package com.moloco.sdk.internal.services.init;

import android.net.Uri;
import com.moloco.sdk.MetricsRequest;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.init.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class o implements n {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38108c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f38109a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d f38110b;

    /* loaded from: classes4.dex */
    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f38111a;

        static {
            int[] iArr = new int[b.values().length];
            try {
                iArr[b.f38012f.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[b.f38007a.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[b.f38008b.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[b.f38009c.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[b.f38010d.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[b.f38011e.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            f38111a = iArr;
        }
    }

    public o(@NotNull String endpoint, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d httpRequestClient) {
        Intrinsics.g(endpoint, "endpoint");
        Intrinsics.g(httpRequestClient, "httpRequestClient");
        this.f38109a = endpoint;
        this.f38110b = httpRequestClient;
    }

    @Override // com.moloco.sdk.internal.services.init.n
    @Nullable
    public Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
        MolocoLogger molocoLogger;
        try {
            molocoLogger = MolocoLogger.INSTANCE;
            MolocoLogger.debug$default(molocoLogger, p.f38112a, "Reporting InitTracking success", false, 4, null);
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, p.f38112a, "Failed to send notifySuccess post request", e3, false, 8, null);
        }
        if (this.f38109a.length() == 0) {
            MolocoLogger.debug$default(molocoLogger, p.f38112a, "SDK InitTracking disabled", false, 4, null);
            return Unit.f71706a;
        }
        Uri uriBuild = Uri.parse(this.f38109a).buildUpon().build();
        com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d dVar = this.f38110b;
        String string = uriBuild.toString();
        Intrinsics.f(string, "toString(...)");
        byte[] bArrA = a(j11);
        o50.e eVar = o50.b.f79540a;
        d.a.a(dVar, string, bArrA, o50.b.f79542c, null, 8, null);
        return Unit.f71706a;
    }

    @Override // com.moloco.sdk.internal.services.init.n
    @Nullable
    public Object a(@NotNull j jVar, long j11, @NotNull Continuation<? super Unit> continuation) {
        try {
            if (jVar instanceof j.a) {
                MolocoLogger.debug$default(MolocoLogger.INSTANCE, p.f38112a, "Reporting InitTracking client failure: " + ((j.a) jVar).a(), false, 4, null);
            } else {
                if (!(jVar instanceof j.b)) {
                    throw new NoWhenBranchMatchedException();
                }
                MolocoLogger.debug$default(MolocoLogger.INSTANCE, p.f38112a, "Reporting InitTracking server failure: " + ((j.b) jVar).a(), false, 4, null);
            }
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, p.f38112a, "Failed to send notifyFailure post request", e3, false, 8, null);
        }
        if (this.f38109a.length() == 0) {
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, p.f38112a, "SDK InitTracking disabled", false, 4, null);
            return Unit.f71706a;
        }
        Uri uriBuild = Uri.parse(this.f38109a).buildUpon().build();
        byte[] bArrA = a(jVar, j11);
        com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d dVar = this.f38110b;
        String string = uriBuild.toString();
        Intrinsics.f(string, "toString(...)");
        o50.e eVar = o50.b.f79540a;
        d.a.a(dVar, string, bArrA, o50.b.f79542c, null, 8, null);
        return Unit.f71706a;
    }

    public final byte[] a(long j11) {
        MetricsRequest.SDKInitTrackingRequest.Builder builderNewBuilder = MetricsRequest.SDKInitTrackingRequest.newBuilder();
        builderNewBuilder.setLatencyMs(j11);
        builderNewBuilder.setSuccess((MetricsRequest.SDKInitSuccessTrackingRequest) MetricsRequest.SDKInitSuccessTrackingRequest.newBuilder().build());
        byte[] byteArray = ((MetricsRequest.SDKInitTrackingRequest) builderNewBuilder.build()).toByteArray();
        Intrinsics.f(byteArray, "toByteArray(...)");
        return byteArray;
    }

    public final byte[] a(j jVar, long j11) {
        MetricsRequest.SDKInitTrackingRequest.Builder builderNewBuilder = MetricsRequest.SDKInitTrackingRequest.newBuilder();
        MetricsRequest.SDKInitFailureTrackingRequest.Builder builderNewBuilder2 = MetricsRequest.SDKInitFailureTrackingRequest.newBuilder();
        if (jVar instanceof j.a) {
            MetricsRequest.SDKInitFailureTrackingRequest.ClientError.Builder builderNewBuilder3 = MetricsRequest.SDKInitFailureTrackingRequest.ClientError.newBuilder();
            builderNewBuilder3.setClientFailureType(a(((j.a) jVar).a()));
            builderNewBuilder2.setClientError((MetricsRequest.SDKInitFailureTrackingRequest.ClientError) builderNewBuilder3.build());
        } else if (jVar instanceof j.b) {
            MetricsRequest.SDKInitFailureTrackingRequest.ServerError.Builder builderNewBuilder4 = MetricsRequest.SDKInitFailureTrackingRequest.ServerError.newBuilder();
            builderNewBuilder4.setServerHttpStatus(((j.b) jVar).a());
            builderNewBuilder2.setServerError((MetricsRequest.SDKInitFailureTrackingRequest.ServerError) builderNewBuilder4.build());
        } else {
            throw new NoWhenBranchMatchedException();
        }
        builderNewBuilder.setFailure((MetricsRequest.SDKInitFailureTrackingRequest) builderNewBuilder2.build());
        builderNewBuilder.setLatencyMs(j11);
        byte[] byteArray = ((MetricsRequest.SDKInitTrackingRequest) builderNewBuilder.build()).toByteArray();
        Intrinsics.f(byteArray, "toByteArray(...)");
        return byteArray;
    }

    public final MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes a(b bVar) {
        switch (a.f38111a[bVar.ordinal()]) {
            case 1:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.UNKNOWN;
            case 2:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.HTTP_REQUEST_TIMEOUT;
            case 3:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.HTTP_UKNOWN_HOST;
            case 4:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.HTTP_SOCKET;
            case 5:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.HTTP_SSL_ERROR;
            case 6:
                return MetricsRequest.SDKInitFailureTrackingRequest.ClientError.ClientErrorTypes.ANDROID_WORK_MANAGER_ISSUE;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }
}
