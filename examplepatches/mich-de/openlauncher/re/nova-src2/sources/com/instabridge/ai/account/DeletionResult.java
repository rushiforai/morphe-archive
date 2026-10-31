package com.instabridge.ai.account;

import a2.c;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0004\u0005\u0006\u0007B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003\u0082\u0001\u0004\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/account/DeletionResult;", b.f42142b, "<init>", "()V", "ImmediatelyDeleted", "Scheduled", "NotAuthenticated", k.f40331e, "Lcom/instabridge/ai/account/DeletionResult$Error;", "Lcom/instabridge/ai/account/DeletionResult$ImmediatelyDeleted;", "Lcom/instabridge/ai/account/DeletionResult$NotAuthenticated;", "Lcom/instabridge/ai/account/DeletionResult$Scheduled;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public abstract class DeletionResult {
    public static final int $stable = 0;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/account/DeletionResult$Error;", "Lcom/instabridge/ai/account/DeletionResult;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Error extends DeletionResult {
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

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/account/DeletionResult$ImmediatelyDeleted;", "Lcom/instabridge/ai/account/DeletionResult;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ImmediatelyDeleted extends DeletionResult {
        public static final int $stable = 0;

        @NotNull
        public static final ImmediatelyDeleted INSTANCE = new ImmediatelyDeleted();

        private ImmediatelyDeleted() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/instabridge/ai/account/DeletionResult$NotAuthenticated;", "Lcom/instabridge/ai/account/DeletionResult;", "<init>", "()V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class NotAuthenticated extends DeletionResult {
        public static final int $stable = 0;

        @NotNull
        public static final NotAuthenticated INSTANCE = new NotAuthenticated();

        private NotAuthenticated() {
            super(null);
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/ai/account/DeletionResult$Scheduled;", "Lcom/instabridge/ai/account/DeletionResult;", "gracePeriodDays", b.f42142b, "<init>", "(I)V", "getGracePeriodDays", "()I", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", "toString", b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Scheduled extends DeletionResult {
        public static final int $stable = 0;
        private final int gracePeriodDays;

        public Scheduled(int i5) {
            super(null);
            this.gracePeriodDays = i5;
        }

        public static /* synthetic */ Scheduled copy$default(Scheduled scheduled, int i5, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                i5 = scheduled.gracePeriodDays;
            }
            return scheduled.copy(i5);
        }

        /* renamed from: component1, reason: from getter */
        public final int getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        @NotNull
        public final Scheduled copy(int gracePeriodDays) {
            return new Scheduled(gracePeriodDays);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Scheduled) && this.gracePeriodDays == ((Scheduled) other).gracePeriodDays;
        }

        public final int getGracePeriodDays() {
            return this.gracePeriodDays;
        }

        public int hashCode() {
            return Integer.hashCode(this.gracePeriodDays);
        }

        @NotNull
        public String toString() {
            return c.m(new StringBuilder("Scheduled(gracePeriodDays="), this.gracePeriodDays, ')');
        }
    }

    public /* synthetic */ DeletionResult(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private DeletionResult() {
    }
}
