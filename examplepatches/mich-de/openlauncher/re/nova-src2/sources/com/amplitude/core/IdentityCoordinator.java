package com.amplitude.core;

import com.amplitude.id.Identity;
import com.amplitude.id.IdentityManager;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\f\b\u0000\u0018\u00002\u00020\u0001:\u0001\u0018B\u000f\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0015\u0010\f\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u0006H\u0000¢\u0006\u0002\b\u000eJ\u000e\u0010\u000f\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\nJ\u0010\u0010\u0011\u001a\u00020\r2\b\u0010\u0012\u001a\u0004\u0018\u00010\nJ0\u0010\u0013\u001a\u0004\u0018\u0001H\u0014\"\u0004\b\u0000\u0010\u0014*\n\u0012\u0004\u0012\u0002H\u0014\u0018\u00010\t2\b\u0010\u0015\u001a\u0004\u0018\u0001H\u0014H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\u0017R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\b\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\tX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u001e\u0010\u000b\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\tX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0019"}, d2 = {"Lcom/amplitude/core/IdentityCoordinator;", b.f42142b, "state", "Lcom/amplitude/core/State;", "(Lcom/amplitude/core/State;)V", "identityManager", "Lcom/amplitude/id/IdentityManager;", "lock", "pendingDeviceId", "Lcom/amplitude/core/IdentityCoordinator$Pending;", b.f42142b, "pendingUserId", "bootstrap", b.f42142b, "bootstrap$core", "setDeviceId", "deviceId", "setUserId", "userId", "getOrElse", "T", CarrierConfigurator.APN_TYPE, "getOrElse-iI3CwxU", "(Lcom/amplitude/core/IdentityCoordinator$Pending;Ljava/lang/Object;)Ljava/lang/Object;", "Pending", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class IdentityCoordinator {

    @Nullable
    private IdentityManager identityManager;

    @NotNull
    private final Object lock;

    @Nullable
    private Pending<String> pendingDeviceId;

    @Nullable
    private Pending<String> pendingUserId;

    @NotNull
    private final State state;

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0083@\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\u000f\u0012\u0006\u0010\u0003\u001a\u00028\u0000¢\u0006\u0004\b\u0004\u0010\u0005J\u001a\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\u0002HÖ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0003\u001a\u00028\u0000¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007\u0088\u0001\u0003¨\u0006\u0016"}, d2 = {"Lcom/amplitude/core/IdentityCoordinator$Pending;", "T", b.f42142b, "value", "constructor-impl", "(Ljava/lang/Object;)Ljava/lang/Object;", "getValue", "()Ljava/lang/Object;", "Ljava/lang/Object;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "equals-impl", "(Ljava/lang/Object;Ljava/lang/Object;)Z", "hashCode", b.f42142b, "hashCode-impl", "(Ljava/lang/Object;)I", "toString", b.f42142b, "toString-impl", "(Ljava/lang/Object;)Ljava/lang/String;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @JvmInline
    public static final class Pending<T> {
        private final T value;

        /* JADX WARN: Multi-variable type inference failed */
        private /* synthetic */ Pending(Object obj) {
            this.value = obj;
        }

        /* renamed from: box-impl, reason: not valid java name */
        public static final /* synthetic */ Pending m121boximpl(Object obj) {
            return new Pending(obj);
        }

        @NotNull
        /* renamed from: constructor-impl, reason: not valid java name */
        public static <T> Object m122constructorimpl(T t6) {
            return t6;
        }

        /* renamed from: equals-impl, reason: not valid java name */
        public static boolean m123equalsimpl(Object obj, Object obj2) {
            return (obj2 instanceof Pending) && Intrinsics.b(obj, ((Pending) obj2).getValue());
        }

        /* renamed from: equals-impl0, reason: not valid java name */
        public static final boolean m124equalsimpl0(Object obj, Object obj2) {
            return Intrinsics.b(obj, obj2);
        }

        /* renamed from: hashCode-impl, reason: not valid java name */
        public static int m125hashCodeimpl(Object obj) {
            if (obj == null) {
                return 0;
            }
            return obj.hashCode();
        }

        /* renamed from: toString-impl, reason: not valid java name */
        public static String m126toStringimpl(Object obj) {
            return "Pending(value=" + obj + ')';
        }

        public boolean equals(Object obj) {
            return m123equalsimpl(this.value, obj);
        }

        public final T getValue() {
            return this.value;
        }

        public int hashCode() {
            return m125hashCodeimpl(this.value);
        }

        public String toString() {
            return m126toStringimpl(this.value);
        }

        /* renamed from: unbox-impl, reason: not valid java name and from getter */
        public final /* synthetic */ Object getValue() {
            return this.value;
        }
    }

    public IdentityCoordinator(@NotNull State state) {
        Intrinsics.g(state, "state");
        this.state = state;
        this.lock = new Object();
    }

    /* renamed from: getOrElse-iI3CwxU, reason: not valid java name */
    private final <T> T m120getOrElseiI3CwxU(Pending<T> pending, T t6) {
        return pending != null ? (T) pending.getValue() : t6;
    }

    public final void bootstrap$core(@NotNull IdentityManager identityManager) {
        Intrinsics.g(identityManager, "identityManager");
        synchronized (this.lock) {
            this.identityManager = identityManager;
            Identity identity = identityManager.getIdentity();
            String str = (String) m120getOrElseiI3CwxU(this.pendingUserId, identity.getUserId());
            String str2 = (String) m120getOrElseiI3CwxU(this.pendingDeviceId, identity.getDeviceId());
            this.state.setUserId(str);
            this.state.setDeviceId(str2);
            identityManager.editIdentity().setUserId(str).setDeviceId(str2).commit();
            this.pendingUserId = null;
            this.pendingDeviceId = null;
            Unit unit = Unit.f71706a;
        }
    }

    public final void setDeviceId(@NotNull String deviceId) {
        Unit unit;
        IdentityManager.Editor editorEditIdentity;
        IdentityManager.Editor deviceId2;
        Intrinsics.g(deviceId, "deviceId");
        synchronized (this.lock) {
            try {
                this.state.setDeviceId(deviceId);
                IdentityManager identityManager = this.identityManager;
                if (identityManager == null || (editorEditIdentity = identityManager.editIdentity()) == null || (deviceId2 = editorEditIdentity.setDeviceId(deviceId)) == null) {
                    unit = null;
                } else {
                    deviceId2.commit();
                    unit = Unit.f71706a;
                }
                if (unit == null) {
                    this.pendingDeviceId = Pending.m121boximpl(Pending.m122constructorimpl(deviceId));
                }
                Unit unit2 = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void setUserId(@Nullable String userId) {
        Unit unit;
        IdentityManager.Editor editorEditIdentity;
        IdentityManager.Editor userId2;
        synchronized (this.lock) {
            try {
                this.state.setUserId(userId);
                IdentityManager identityManager = this.identityManager;
                if (identityManager == null || (editorEditIdentity = identityManager.editIdentity()) == null || (userId2 = editorEditIdentity.setUserId(userId)) == null) {
                    unit = null;
                } else {
                    userId2.commit();
                    unit = Unit.f71706a;
                }
                if (unit == null) {
                    this.pendingUserId = Pending.m121boximpl(Pending.m122constructorimpl(userId));
                }
                Unit unit2 = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
