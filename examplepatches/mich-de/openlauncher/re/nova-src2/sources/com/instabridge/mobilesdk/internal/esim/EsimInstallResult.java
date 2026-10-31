package com.instabridge.mobilesdk.internal.esim;

import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", b.f42142b, "Ok", "Failed", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult$Failed;", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult$Ok;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface EsimInstallResult {

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0016\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001BC\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\u0006\u0010\n\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\bHÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\bHÆ\u0003J\t\u0010\u001c\u001a\u00020\bHÆ\u0003JS\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\n\u001a\u00020\bHÆ\u0001J\u0013\u0010\u001e\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010!HÖ\u0003J\t\u0010\"\u001a\u00020\u0003HÖ\u0001J\t\u0010#\u001a\u00020\bHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0011\u0010\n\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0013¨\u0006$"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult$Failed;", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", "resultCode", b.f42142b, "errorCode", "operationCode", "detailedCode", "smdxSubjectCode", b.f42142b, "smdxReasonCode", "reason", "<init>", "(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getResultCode", "()I", "getErrorCode", "getOperationCode", "getDetailedCode", "getSmdxSubjectCode", "()Ljava/lang/String;", "getSmdxReasonCode", "getReason", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements EsimInstallResult {
        public static final int $stable = 0;
        private final int detailedCode;
        private final int errorCode;
        private final int operationCode;

        @NotNull
        private final String reason;
        private final int resultCode;

        @Nullable
        private final String smdxReasonCode;

        @Nullable
        private final String smdxSubjectCode;

        public Failed(int i5, int i11, int i12, int i13, @Nullable String str, @Nullable String str2, @NotNull String reason) {
            Intrinsics.g(reason, "reason");
            this.resultCode = i5;
            this.errorCode = i11;
            this.operationCode = i12;
            this.detailedCode = i13;
            this.smdxSubjectCode = str;
            this.smdxReasonCode = str2;
            this.reason = reason;
        }

        public static /* synthetic */ Failed copy$default(Failed failed, int i5, int i11, int i12, int i13, String str, String str2, String str3, int i14, Object obj) {
            if ((i14 & 1) != 0) {
                i5 = failed.resultCode;
            }
            if ((i14 & 2) != 0) {
                i11 = failed.errorCode;
            }
            if ((i14 & 4) != 0) {
                i12 = failed.operationCode;
            }
            if ((i14 & 8) != 0) {
                i13 = failed.detailedCode;
            }
            if ((i14 & 16) != 0) {
                str = failed.smdxSubjectCode;
            }
            if ((i14 & 32) != 0) {
                str2 = failed.smdxReasonCode;
            }
            if ((i14 & 64) != 0) {
                str3 = failed.reason;
            }
            String str4 = str2;
            String str5 = str3;
            String str6 = str;
            int i15 = i12;
            return failed.copy(i5, i11, i15, i13, str6, str4, str5);
        }

        /* renamed from: component1, reason: from getter */
        public final int getResultCode() {
            return this.resultCode;
        }

        /* renamed from: component2, reason: from getter */
        public final int getErrorCode() {
            return this.errorCode;
        }

        /* renamed from: component3, reason: from getter */
        public final int getOperationCode() {
            return this.operationCode;
        }

        /* renamed from: component4, reason: from getter */
        public final int getDetailedCode() {
            return this.detailedCode;
        }

        @Nullable
        /* renamed from: component5, reason: from getter */
        public final String getSmdxSubjectCode() {
            return this.smdxSubjectCode;
        }

        @Nullable
        /* renamed from: component6, reason: from getter */
        public final String getSmdxReasonCode() {
            return this.smdxReasonCode;
        }

        @NotNull
        /* renamed from: component7, reason: from getter */
        public final String getReason() {
            return this.reason;
        }

        @NotNull
        public final Failed copy(int resultCode, int errorCode, int operationCode, int detailedCode, @Nullable String smdxSubjectCode, @Nullable String smdxReasonCode, @NotNull String reason) {
            Intrinsics.g(reason, "reason");
            return new Failed(resultCode, errorCode, operationCode, detailedCode, smdxSubjectCode, smdxReasonCode, reason);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Failed)) {
                return false;
            }
            Failed failed = (Failed) other;
            return this.resultCode == failed.resultCode && this.errorCode == failed.errorCode && this.operationCode == failed.operationCode && this.detailedCode == failed.detailedCode && Intrinsics.b(this.smdxSubjectCode, failed.smdxSubjectCode) && Intrinsics.b(this.smdxReasonCode, failed.smdxReasonCode) && Intrinsics.b(this.reason, failed.reason);
        }

        public final int getDetailedCode() {
            return this.detailedCode;
        }

        public final int getErrorCode() {
            return this.errorCode;
        }

        public final int getOperationCode() {
            return this.operationCode;
        }

        @NotNull
        public final String getReason() {
            return this.reason;
        }

        public final int getResultCode() {
            return this.resultCode;
        }

        @Nullable
        public final String getSmdxReasonCode() {
            return this.smdxReasonCode;
        }

        @Nullable
        public final String getSmdxSubjectCode() {
            return this.smdxSubjectCode;
        }

        public int hashCode() {
            int iA = u4.a(this.detailedCode, u4.a(this.operationCode, u4.a(this.errorCode, Integer.hashCode(this.resultCode) * 31, 31), 31), 31);
            String str = this.smdxSubjectCode;
            int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.smdxReasonCode;
            return this.reason.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
        }

        @NotNull
        public String toString() {
            int i5 = this.resultCode;
            int i11 = this.errorCode;
            int i12 = this.operationCode;
            int i13 = this.detailedCode;
            String str = this.smdxSubjectCode;
            String str2 = this.smdxReasonCode;
            String str3 = this.reason;
            StringBuilder sbT = c0.t(i5, "Failed(resultCode=", ", errorCode=", i11, ", operationCode=");
            c0.A(sbT, i12, ", detailedCode=", i13, ", smdxSubjectCode=");
            c0.D(sbT, str, ", smdxReasonCode=", str2, ", reason=");
            return c0.q(sbT, str3, ")");
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult$Ok;", "Lcom/instabridge/mobilesdk/internal/esim/EsimInstallResult;", EsimInstallStore.KEY_ICCID, b.f42142b, "<init>", "(Ljava/lang/String;)V", "getIccid", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Ok implements EsimInstallResult {
        public static final int $stable = 0;

        @NotNull
        private final String iccid;

        public Ok(@NotNull String iccid) {
            Intrinsics.g(iccid, "iccid");
            this.iccid = iccid;
        }

        public static /* synthetic */ Ok copy$default(Ok ok2, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = ok2.iccid;
            }
            return ok2.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getIccid() {
            return this.iccid;
        }

        @NotNull
        public final Ok copy(@NotNull String iccid) {
            Intrinsics.g(iccid, "iccid");
            return new Ok(iccid);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Ok) && Intrinsics.b(this.iccid, ((Ok) other).iccid);
        }

        @NotNull
        public final String getIccid() {
            return this.iccid;
        }

        public int hashCode() {
            return this.iccid.hashCode();
        }

        @NotNull
        public String toString() {
            return c0.l("Ok(iccid=", this.iccid, ")");
        }
    }
}
