package io.branch.search.internal.client.ads;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.k2;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \u001d*\u0006\b\u0000\u0010\u0001 \u0001*\u0006\b\u0001\u0010\u0002 \u00012\u00020\u0003:\u0003\u001e\u001f B\t\b\u0004¢\u0006\u0004\b\u001b\u0010\u001cJ;\u0010\b\u001a\u00028\u0002\"\u0004\b\u0002\u0010\u00042\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00020\u00052\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ3\u0010\f\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00020\u0000\"\u0004\b\u0002\u0010\n2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00020\u0005¢\u0006\u0004\b\f\u0010\rJ?\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00020\u0000\"\u0004\b\u0002\u0010\u000e2\u001e\u0010\u000f\u001a\u001a\u0012\u0004\u0012\u00028\u0001\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00020\u00000\u0005¢\u0006\u0004\b\u0010\u0010\rJ3\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00028\u00010\u0000\"\u0004\b\u0002\u0010\u00042\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00020\u0005¢\u0006\u0004\b\u0011\u0010\rJ\u001b\u0010\u0014\u001a\u00028\u00012\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00028\u00010\u0012¢\u0006\u0004\b\u0014\u0010\u0015J-\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00002\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0000¢\u0006\u0004\b\u0017\u0010\u0018J\u0019\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u00028\u00000\u0000¢\u0006\u0004\b\u0019\u0010\u001a\u0082\u0001\u0002!\"¨\u0006#"}, d2 = {"Lio/branch/search/internal/client/ads/Either;", "L", "R", b.f42142b, "T", "Lkotlin/Function1;", "leftOp", "rightOp", "fold", "(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "C", InneractiveMediationDefs.GENDER_FEMALE, "map", "(Lkotlin/jvm/functions/Function1;)Lio/branch/search/internal/client/ads/Either;", "R2", "fn", "flatMap", "mapLeft", "Lkotlin/Function0;", CarrierConfigurator.APN_TYPE, "getOrElse", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "alternative", "orElse", "(Lio/branch/search/internal/client/ads/Either;)Lio/branch/search/internal/client/ads/Either;", "swap", "()Lio/branch/search/internal/client/ads/Either;", "<init>", "()V", k.O, "a", "Left", "Right", "Lio/branch/search/internal/client/ads/Either$Left;", "Lio/branch/search/internal/client/ads/Either$Right;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public abstract class Either<L, R> {

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u0000*\u0006\b\u0002\u0010\u0001 \u00012\u000e\u0012\u0004\u0012\u00028\u0002\u0012\u0004\u0012\u00020\u00030\u0002B\u000f\u0012\u0006\u0010\u0006\u001a\u00028\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0004\u001a\u00028\u0002HÆ\u0003¢\u0006\u0004\b\u0004\u0010\u0005J \u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00028\u0002HÆ\u0001¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\n\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fHÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0006\u001a\u00028\u00028\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0005¨\u0006\u0019"}, d2 = {"Lio/branch/search/internal/client/ads/Either$Left;", "L", "Lio/branch/search/internal/client/ads/Either;", b.f42142b, "component1", "()Ljava/lang/Object;", "value", "copy", "(Ljava/lang/Object;)Lio/branch/search/internal/client/ads/Either$Left;", b.f42142b, "toString", "()Ljava/lang/String;", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Ljava/lang/Object;", "getValue", "<init>", "(Ljava/lang/Object;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final /* data */ class Left<L> extends Either {

        /* renamed from: a, reason: collision with root package name and from kotlin metadata */
        public final L value;

        public Left(L l9) {
            super(null);
            this.value = l9;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Left copy$default(Left left, Object obj, int i5, Object obj2) {
            if ((i5 & 1) != 0) {
                obj = left.value;
            }
            return left.copy(obj);
        }

        public final L component1() {
            return this.value;
        }

        @NotNull
        public final Left<L> copy(L value) {
            return new Left<>(value);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Left) && Intrinsics.b(this.value, ((Left) other).value);
        }

        public final L getValue() {
            return this.value;
        }

        public int hashCode() {
            L l9 = this.value;
            if (l9 == null) {
                return 0;
            }
            return l9.hashCode();
        }

        @NotNull
        public String toString() {
            return k2.j(new StringBuilder("Left(value="), this.value, ')');
        }
    }

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0086\b\u0018\u0000*\u0006\b\u0002\u0010\u0001 \u00012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00028\u00020\u0002B\u000f\u0012\u0006\u0010\u0006\u001a\u00028\u0002¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0004\u001a\u00028\u0002HÆ\u0003¢\u0006\u0004\b\u0004\u0010\u0005J \u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00028\u0002HÆ\u0001¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\n\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fHÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0006\u001a\u00028\u00028\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0005¨\u0006\u0019"}, d2 = {"Lio/branch/search/internal/client/ads/Either$Right;", "R", "Lio/branch/search/internal/client/ads/Either;", b.f42142b, "component1", "()Ljava/lang/Object;", "value", "copy", "(Ljava/lang/Object;)Lio/branch/search/internal/client/ads/Either$Right;", b.f42142b, "toString", "()Ljava/lang/String;", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Ljava/lang/Object;", "getValue", "<init>", "(Ljava/lang/Object;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final /* data */ class Right<R> extends Either {

        /* renamed from: a, reason: collision with root package name and from kotlin metadata */
        public final R value;

        public Right(R r11) {
            super(null);
            this.value = r11;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Right copy$default(Right right, Object obj, int i5, Object obj2) {
            if ((i5 & 1) != 0) {
                obj = right.value;
            }
            return right.copy(obj);
        }

        public final R component1() {
            return this.value;
        }

        @NotNull
        public final Right<R> copy(R value) {
            return new Right<>(value);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Right) && Intrinsics.b(this.value, ((Right) other).value);
        }

        public final R getValue() {
            return this.value;
        }

        public int hashCode() {
            R r11 = this.value;
            if (r11 == null) {
                return 0;
            }
            return r11.hashCode();
        }

        @NotNull
        public String toString() {
            return k2.j(new StringBuilder("Right(value="), this.value, ')');
        }
    }

    public /* synthetic */ Either(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public final <R2> Either<L, R2> flatMap(@NotNull Function1<? super R, ? extends Either<? extends L, ? extends R2>> fn) {
        Intrinsics.g(fn, "fn");
        if (this instanceof Left) {
            return this;
        }
        if (this instanceof Right) {
            return (Either) fn.invoke(((Right) this).getValue());
        }
        throw new NoWhenBranchMatchedException();
    }

    public final <T> T fold(@NotNull Function1<? super L, ? extends T> leftOp, @NotNull Function1<? super R, ? extends T> rightOp) {
        Intrinsics.g(leftOp, "leftOp");
        Intrinsics.g(rightOp, "rightOp");
        if (this instanceof Left) {
            return (T) leftOp.invoke(((Left) this).getValue());
        }
        if (this instanceof Right) {
            return (T) rightOp.invoke(((Right) this).getValue());
        }
        throw new NoWhenBranchMatchedException();
    }

    public final R getOrElse(@NotNull Function0<? extends R> function0) {
        Intrinsics.g(function0, "default");
        if (this instanceof Right) {
            return (R) ((Right) this).getValue();
        }
        if (this instanceof Left) {
            return (R) function0.invoke();
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public final <C> Either<L, C> map(@NotNull Function1<? super R, ? extends C> f11) {
        Intrinsics.g(f11, "f");
        if (this instanceof Left) {
            return this;
        }
        if (this instanceof Right) {
            return new Right(f11.invoke(((Right) this).getValue()));
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public final <T> Either<T, R> mapLeft(@NotNull Function1<? super L, ? extends T> fn) {
        Intrinsics.g(fn, "fn");
        if (this instanceof Left) {
            return new Left(fn.invoke(((Left) this).getValue()));
        }
        if (this instanceof Right) {
            return this;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @NotNull
    public final Either<L, R> orElse(@NotNull Either<? extends L, ? extends R> alternative) {
        Intrinsics.g(alternative, "alternative");
        if (this instanceof Left) {
            return alternative;
        }
        if (this instanceof Right) {
            return this;
        }
        throw new NoWhenBranchMatchedException();
    }

    @NotNull
    public final Either<R, L> swap() {
        if (this instanceof Left) {
            return new Right(((Left) this).getValue());
        }
        if (this instanceof Right) {
            return new Left(((Right) this).getValue());
        }
        throw new NoWhenBranchMatchedException();
    }

    public Either() {
    }
}
