package com.instabridge.ai.account;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fq.c;
import h6.c1;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0004\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/account/AppClosureResult;", b.f42142b, "<init>", "()V", "Closed", "DeletionScheduled", "NotAuthenticated", k.f40331e, "Lcom/instabridge/ai/account/AppClosureResult$Closed;", "Lcom/instabridge/ai/account/AppClosureResult$DeletionScheduled;", "Lcom/instabridge/ai/account/AppClosureResult$Error;", "Lcom/instabridge/ai/account/AppClosureResult$NotAuthenticated;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class AppClosureResult {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u000eHÖ\u0003J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001J\t\u0010\u0011\u001a\u00020\u0004HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/account/AppClosureResult$Closed;", "Lcom/instabridge/ai/account/AppClosureResult;", "remainingApps", b.f42142b, b.f42142b, "<init>", "(Ljava/util/List;)V", "getRemainingApps", "()Ljava/util/List;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Closed extends AppClosureResult {
        public static final int $stable = 8;

        @NotNull
        private final List<String> remainingApps;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Closed(@NotNull List<String> remainingApps) {
            super(null);
            Intrinsics.g(remainingApps, "remainingApps");
            this.remainingApps = remainingApps;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Closed copy$default(Closed closed, List list, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                list = closed.remainingApps;
            }
            return closed.copy(list);
        }

        @NotNull
        public final List<String> component1() {
            return this.remainingApps;
        }

        @NotNull
        public final Closed copy(@NotNull List<String> remainingApps) {
            Intrinsics.g(remainingApps, "remainingApps");
            return new Closed(remainingApps);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Closed) && Intrinsics.b(this.remainingApps, ((Closed) other).remainingApps);
        }

        @NotNull
        public final List<String> getRemainingApps() {
            return this.remainingApps;
        }

        public int hashCode() {
            return this.remainingApps.hashCode();
        }

        @NotNull
        public String toString() {
            return c.e(new StringBuilder("Closed(remainingApps="), this.remainingApps, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/account/AppClosureResult$DeletionScheduled;", "Lcom/instabridge/ai/account/AppClosureResult;", "gracePeriodDays", b.f42142b, "<init>", "(I)V", "getGracePeriodDays", "()I", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class DeletionScheduled extends AppClosureResult {
        public static final int $stable = 0;
        private final int gracePeriodDays;

        public DeletionScheduled(int i5) {
            super(null);
            this.gracePeriodDays = i5;
        }

        public static /* synthetic */ DeletionScheduled copy$default(DeletionScheduled deletionScheduled, int i5, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = deletionScheduled.gracePeriodDays;
            }
            return deletionScheduled.copy(i5);
        }

        /* renamed from: component1, reason: from getter */
        public final int getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        @NotNull
        public final DeletionScheduled copy(int gracePeriodDays) {
            return new DeletionScheduled(gracePeriodDays);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof DeletionScheduled) && this.gracePeriodDays == ((DeletionScheduled) other).gracePeriodDays;
        }

        public final int getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        public int hashCode() {
            return Integer.hashCode(this.gracePeriodDays);
        }

        @NotNull
        public String toString() {
            return a2.c.m(new StringBuilder("DeletionScheduled(gracePeriodDays="), this.gracePeriodDays, ')');
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/account/AppClosureResult$Error;", "Lcom/instabridge/ai/account/AppClosureResult;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Error extends AppClosureResult {
        public static final int $stable = 0;

        @NotNull
        private final String message;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Error(@NotNull String message) {
            super(null);
            Intrinsics.g(message, "message");
            this.message = message;
        }

        public static /* synthetic */ Error copy$default(Error error, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = error.message;
            }
            return error.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        @NotNull
        public final Error copy(@NotNull String message) {
            Intrinsics.g(message, "message");
            return new Error(message);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Error) && Intrinsics.b(this.message, ((Error) other).message);
        }

        @NotNull
        public final String getMessage() {
            return this.message;
        }

        public int hashCode() {
            return this.message.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("Error(message="), this.message, ')');
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/account/AppClosureResult$NotAuthenticated;", "Lcom/instabridge/ai/account/AppClosureResult;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NotAuthenticated extends AppClosureResult {
        public static final int $stable = 0;

        @NotNull
        public static final NotAuthenticated INSTANCE = new NotAuthenticated();

        private NotAuthenticated() {
            super(null);
        }
    }

    public /* synthetic */ AppClosureResult(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private AppClosureResult() {
    }
}
