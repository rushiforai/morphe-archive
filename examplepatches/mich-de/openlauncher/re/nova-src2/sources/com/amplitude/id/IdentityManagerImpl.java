package com.amplitude.id;

import a80.d;
import a80.e;
import b70.g;
import com.amplitude.id.IdentityManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\b\u0005\b\u0000\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J'\u0010\u000e\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\nH\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001f\u0010\u0015\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\r2\u0006\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0017\u0010\u001d\u001a\u00020\r2\u0006\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001d\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\nH\u0016¢\u0006\u0004\b\u001e\u0010\u001fR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010 R\u0014\u0010\"\u001a\u00020!8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\"\u0010#R\u0014\u0010%\u001a\u00020$8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b%\u0010&R\u0016\u0010\t\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\t\u0010'R\u0014\u0010)\u001a\u00020(8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b)\u0010*R\u001a\u0010,\u001a\b\u0012\u0004\u0012\u00020\u00190+8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b,\u0010-R\u0016\u0010.\u001a\u00020\n8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b.\u0010/¨\u00060"}, d2 = {"Lcom/amplitude/id/IdentityManagerImpl;", "Lcom/amplitude/id/IdentityManager;", "Lcom/amplitude/id/IdentityStorage;", "identityStorage", "Lt70/c0;", "persistDispatcher", "<init>", "(Lcom/amplitude/id/IdentityStorage;Lt70/c0;)V", "Lcom/amplitude/id/Identity;", "identity", b.f42142b, "userIdChanged", "deviceIdChanged", b.f42142b, "persistIdentity", "(Lcom/amplitude/id/Identity;ZZ)V", "Lcom/amplitude/id/IdentityManager$Editor;", "editIdentity", "()Lcom/amplitude/id/IdentityManager$Editor;", "Lcom/amplitude/id/IdentityUpdateType;", "updateType", "setIdentity", "(Lcom/amplitude/id/Identity;Lcom/amplitude/id/IdentityUpdateType;)V", "getIdentity", "()Lcom/amplitude/id/Identity;", "Lcom/amplitude/id/IdentityListener;", "listener", "addIdentityListener", "(Lcom/amplitude/id/IdentityListener;)V", "removeIdentityListener", "isInitialized", "()Z", "Lcom/amplitude/id/IdentityStorage;", "Lt70/j0;", "identityStorageScope", "Lt70/j0;", "Ljava/util/concurrent/locks/ReentrantReadWriteLock;", "identityLock", "Ljava/util/concurrent/locks/ReentrantReadWriteLock;", "Lcom/amplitude/id/Identity;", b.f42142b, "listenersLock", "Ljava/lang/Object;", b.f42142b, "listeners", "Ljava/util/Set;", "initialized", "Z", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentityManagerImpl implements IdentityManager {

    @NotNull
    private Identity identity;

    @NotNull
    private final ReentrantReadWriteLock identityLock;

    @NotNull
    private final IdentityStorage identityStorage;

    @NotNull
    private final j0 identityStorageScope;
    private boolean initialized;

    @NotNull
    private final Set<IdentityListener> listeners;

    @NotNull
    private final Object listenersLock;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.id.IdentityManagerImpl$persistIdentity$1", f = "IdentityManager.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.id.IdentityManagerImpl$persistIdentity$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04571 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ boolean $deviceIdChanged;
        final /* synthetic */ Identity $identity;
        final /* synthetic */ boolean $userIdChanged;
        int label;
        final /* synthetic */ IdentityManagerImpl this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04571(boolean z11, IdentityManagerImpl identityManagerImpl, Identity identity, boolean z12, Continuation<? super C04571> continuation) {
            super(2, continuation);
            this.$userIdChanged = z11;
            this.this$0 = identityManagerImpl;
            this.$identity = identity;
            this.$deviceIdChanged = z12;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new C04571(this.$userIdChanged, this.this$0, this.$identity, this.$deviceIdChanged, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (this.$userIdChanged) {
                this.this$0.identityStorage.saveUserId(this.$identity.getUserId());
            }
            if (this.$deviceIdChanged) {
                this.this$0.identityStorage.saveDeviceId(this.$identity.getDeviceId());
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04571) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public IdentityManagerImpl(@NotNull IdentityStorage identityStorage, @NotNull c0 persistDispatcher) {
        Intrinsics.g(identityStorage, "identityStorage");
        Intrinsics.g(persistDispatcher, "persistDispatcher");
        this.identityStorage = identityStorage;
        this.identityStorageScope = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), persistDispatcher));
        this.identityLock = new ReentrantReadWriteLock(true);
        this.identity = new Identity(null, null, 3, null);
        this.listenersLock = new Object();
        this.listeners = new LinkedHashSet();
        setIdentity(identityStorage.load(), IdentityUpdateType.Initialized);
    }

    private final void persistIdentity(Identity identity, boolean userIdChanged, boolean deviceIdChanged) {
        if (userIdChanged || deviceIdChanged) {
            m0.t(this.identityStorageScope, null, null, new C04571(userIdChanged, this, identity, deviceIdChanged, null), 3);
        }
    }

    @Override // com.amplitude.id.IdentityManager
    public void addIdentityListener(@NotNull IdentityListener listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.listenersLock) {
            this.listeners.add(listener);
        }
    }

    @Override // com.amplitude.id.IdentityManager
    @NotNull
    public IdentityManager.Editor editIdentity() {
        return new IdentityManager.Editor(getIdentity(), this) { // from class: com.amplitude.id.IdentityManagerImpl.editIdentity.1

            @Nullable
            private String deviceId;
            final /* synthetic */ IdentityManagerImpl this$0;

            @Nullable
            private String userId;

            {
                this.this$0 = this;
                this.userId = identity.getUserId();
                this.deviceId = identity.getDeviceId();
            }

            @Override // com.amplitude.id.IdentityManager.Editor
            public void commit() {
                IdentityManager.setIdentity$default(this.this$0, new Identity(this.userId, this.deviceId), null, 2, null);
            }

            @Override // com.amplitude.id.IdentityManager.Editor
            @NotNull
            public IdentityManager.Editor setDeviceId(@Nullable String deviceId) {
                this.deviceId = deviceId;
                return this;
            }

            @Override // com.amplitude.id.IdentityManager.Editor
            @NotNull
            public IdentityManager.Editor setUserId(@Nullable String userId) {
                this.userId = userId;
                return this;
            }
        };
    }

    @Override // com.amplitude.id.IdentityManager
    @NotNull
    public Identity getIdentity() {
        ReentrantReadWriteLock.ReadLock lock = this.identityLock.readLock();
        lock.lock();
        try {
            return this.identity;
        } finally {
            lock.unlock();
        }
    }

    @Override // com.amplitude.id.IdentityManager
    /* renamed from: isInitialized, reason: from getter */
    public boolean getInitialized() {
        return this.initialized;
    }

    @Override // com.amplitude.id.IdentityManager
    public void removeIdentityListener(@NotNull IdentityListener listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.listenersLock) {
            this.listeners.remove(listener);
        }
    }

    @Override // com.amplitude.id.IdentityManager
    public void setIdentity(@NotNull Identity identity, @NotNull IdentityUpdateType updateType) {
        Set<IdentityListener> setN1;
        Intrinsics.g(identity, "identity");
        Intrinsics.g(updateType, "updateType");
        Identity identity2 = getIdentity();
        ReentrantReadWriteLock reentrantReadWriteLock = this.identityLock;
        ReentrantReadWriteLock.ReadLock lock = reentrantReadWriteLock.readLock();
        int i5 = 0;
        int readHoldCount = reentrantReadWriteLock.getWriteHoldCount() == 0 ? reentrantReadWriteLock.getReadHoldCount() : 0;
        for (int i11 = 0; i11 < readHoldCount; i11++) {
            lock.unlock();
        }
        ReentrantReadWriteLock.WriteLock writeLock = reentrantReadWriteLock.writeLock();
        writeLock.lock();
        try {
            this.identity = identity;
            if (updateType == IdentityUpdateType.Initialized) {
                this.initialized = true;
            }
            Unit unit = Unit.f71706a;
            while (i5 < readHoldCount) {
                lock.lock();
                i5++;
            }
            writeLock.unlock();
            if (identity.equals(identity2)) {
                return;
            }
            synchronized (this.listenersLock) {
                setN1 = g.N1(this.listeners);
            }
            if (updateType != IdentityUpdateType.Initialized) {
                persistIdentity(identity, !Intrinsics.b(identity.getUserId(), identity2.getUserId()), !Intrinsics.b(identity.getDeviceId(), identity2.getDeviceId()));
            }
            for (IdentityListener identityListener : setN1) {
                if (!Intrinsics.b(identity.getUserId(), identity2.getUserId())) {
                    identityListener.onUserIdChange(identity.getUserId());
                }
                if (!Intrinsics.b(identity.getDeviceId(), identity2.getDeviceId())) {
                    identityListener.onDeviceIdChange(identity.getDeviceId());
                }
                identityListener.onIdentityChanged(identity, updateType);
            }
        } catch (Throwable th2) {
            while (i5 < readHoldCount) {
                lock.lock();
                i5++;
            }
            writeLock.unlock();
            throw th2;
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public IdentityManagerImpl(IdentityStorage identityStorage, c0 c0Var, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        if ((i5 & 2) != 0) {
            e eVar = y0.f88884a;
            c0Var = d.f488c.f0(1, null);
        }
        this(identityStorage, c0Var);
    }
}
