package com.amplitude.analytics.connector;

import b70.g;
import com.amplitude.analytics.connector.IdentityStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J \u0010\u000e\u001a\u00020\n2\u0016\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\n0\tj\u0002`\u000bH\u0016J\b\u0010\u0010\u001a\u00020\u0011H\u0016J\b\u0010\u0012\u001a\u00020\u0004H\u0016J \u0010\u0013\u001a\u00020\n2\u0016\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\n0\tj\u0002`\u000bH\u0016J\u0010\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\u0004H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\u0007\u001a\u0018\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\n0\tj\u0002`\u000b0\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Lcom/amplitude/analytics/connector/IdentityStoreImpl;", "Lcom/amplitude/analytics/connector/IdentityStore;", "()V", "identity", "Lcom/amplitude/analytics/connector/Identity;", "identityLock", "Ljava/util/concurrent/locks/ReentrantReadWriteLock;", "listeners", b.f42142b, "Lkotlin/Function1;", b.f42142b, "Lcom/amplitude/analytics/connector/IdentityListener;", "listenersLock", b.f42142b, "addIdentityListener", "listener", "editIdentity", "Lcom/amplitude/analytics/connector/IdentityStore$Editor;", "getIdentity", "removeIdentityListener", "setIdentity", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentityStoreImpl implements IdentityStore {

    @NotNull
    private final ReentrantReadWriteLock identityLock = new ReentrantReadWriteLock(true);

    @NotNull
    private Identity identity = new Identity(null, null, null, 7, null);

    @NotNull
    private final Object listenersLock = new Object();

    @NotNull
    private final Set<Function1<Identity, Unit>> listeners = new LinkedHashSet();

    @Override // com.amplitude.analytics.connector.IdentityStore
    public void addIdentityListener(@NotNull Function1<? super Identity, Unit> listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.listenersLock) {
            this.listeners.add(listener);
        }
    }

    @Override // com.amplitude.analytics.connector.IdentityStore
    @NotNull
    public IdentityStore.Editor editIdentity() {
        return new IdentityStore.Editor(this) { // from class: com.amplitude.analytics.connector.IdentityStoreImpl.editIdentity.1

            @Nullable
            private String deviceId;
            final /* synthetic */ IdentityStoreImpl this$0;

            @Nullable
            private String userId;

            @NotNull
            private Map<String, ? extends Object> userProperties;

            {
                this.this$0 = this;
                this.userId = this.$originalIdentity.getUserId();
                this.deviceId = this.$originalIdentity.getDeviceId();
                this.userProperties = this.$originalIdentity.getUserProperties();
            }

            @Override // com.amplitude.analytics.connector.IdentityStore.Editor
            public void commit() {
                this.this$0.setIdentity(new Identity(this.userId, this.deviceId, this.userProperties));
            }

            @Override // com.amplitude.analytics.connector.IdentityStore.Editor
            @NotNull
            public IdentityStore.Editor setDeviceId(@Nullable String deviceId) {
                this.deviceId = deviceId;
                return this;
            }

            @Override // com.amplitude.analytics.connector.IdentityStore.Editor
            @NotNull
            public IdentityStore.Editor setUserId(@Nullable String userId) {
                this.userId = userId;
                return this;
            }

            @Override // com.amplitude.analytics.connector.IdentityStore.Editor
            @NotNull
            public IdentityStore.Editor setUserProperties(@NotNull Map<String, ? extends Object> userProperties) {
                Intrinsics.g(userProperties, "userProperties");
                this.userProperties = userProperties;
                return this;
            }

            @Override // com.amplitude.analytics.connector.IdentityStore.Editor
            @NotNull
            public IdentityStore.Editor updateUserProperties(@NotNull Map<String, ? extends Map<String, ? extends Object>> actions) {
                Intrinsics.g(actions, "actions");
                LinkedHashMap linkedHashMapU0 = MapsKt.u0(this.userProperties);
                for (Map.Entry<String, ? extends Map<String, ? extends Object>> entry : actions.entrySet()) {
                    String key = entry.getKey();
                    Map<String, ? extends Object> value = entry.getValue();
                    int iHashCode = key.hashCode();
                    if (iHashCode != 1186238) {
                        if (iHashCode != 146417720) {
                            if (iHashCode == 1142092165 && key.equals(IdentityStoreKt.ID_OP_UNSET)) {
                                Iterator<Map.Entry<String, ? extends Object>> it = value.entrySet().iterator();
                                while (it.hasNext()) {
                                    linkedHashMapU0.remove(it.next().getKey());
                                }
                            }
                        } else if (key.equals(IdentityStoreKt.ID_OP_CLEAR_ALL)) {
                            linkedHashMapU0.clear();
                        }
                    } else if (key.equals(IdentityStoreKt.ID_OP_SET)) {
                        linkedHashMapU0.putAll(value);
                    }
                }
                this.userProperties = linkedHashMapU0;
                return this;
            }
        };
    }

    @Override // com.amplitude.analytics.connector.IdentityStore
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

    @Override // com.amplitude.analytics.connector.IdentityStore
    public void removeIdentityListener(@NotNull Function1<? super Identity, Unit> listener) {
        Intrinsics.g(listener, "listener");
        synchronized (this.listenersLock) {
            this.listeners.remove(listener);
        }
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.amplitude.analytics.connector.IdentityStore
    public void setIdentity(@NotNull Identity identity) {
        Set setN1;
        Intrinsics.g(identity, "identity");
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
            Iterator it = setN1.iterator();
            while (it.hasNext()) {
                ((Function1) it.next()).invoke(identity);
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
}
