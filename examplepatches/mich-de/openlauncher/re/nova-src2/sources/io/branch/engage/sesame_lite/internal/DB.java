package io.branch.engage.sesame_lite.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.engage.sesame_lite.internal.stores.AliasStore;
import io.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import io.branch.engage.sesame_lite.internal.stores.InMemoryStore;
import io.branch.engage.sesame_lite.internal.stores.LinkStore;
import io.branch.engage.sesame_lite.internal.stores.UsageStore;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.l1;
import t70.m0;
import t70.r1;
import u40.j;
import u40.l;

@Metadata(d1 = {"\u0000\u0096\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010%\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0007\u0018\u0000 A2\u00020\u0001:\u0001AB\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0007¢\u0006\u0004\b\u0007\u0010\bJ4\u0010\r\u001a\u00028\u0000\"\u0004\b\u0000\u0010\t2\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00028\u00000\n\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001¢\u0006\u0004\b\r\u0010\u000eJ.\u0010\u0010\u001a\u00020\u00062\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000f0\n\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0001 \u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0015\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0015\u0010\u0016J\r\u0010\u0017\u001a\u00020\u0014¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0006H\u0007¢\u0006\u0004\b\u0019\u0010\bJ\u000f\u0010\u001a\u001a\u00020\u0006H\u0007¢\u0006\u0004\b\u001a\u0010\bR\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001bR\u0016\u0010\u001d\u001a\u00020\u001c8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b\u001d\u0010\u001eR\u0016\u0010 \u001a\u00020\u001f8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b \u0010!R\u0016\u0010#\u001a\u00020\"8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b#\u0010$R\u0016\u0010&\u001a\u00020%8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b&\u0010'R$\u0010*\u001a\u0010\u0012\f\u0012\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030)0(8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b*\u0010+R\u0014\u0010-\u001a\u00020,8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b-\u0010.R\u001a\u00100\u001a\b\u0012\u0004\u0012\u00020\u000b0/8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b0\u00101R\u0016\u00102\u001a\u00020\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b2\u00103R*\u00105\u001a\u0016\u0012\u0004\u0012\u00020\u0012\u0012\f\u0012\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030)048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b5\u00106R\u0018\u00108\u001a\u0004\u0018\u0001078\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b8\u00109R\u0014\u0010;\u001a\u00020:8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b;\u0010<R\u0011\u0010@\u001a\u00020=8F¢\u0006\u0006\u001a\u0004\b>\u0010?¨\u0006B"}, d2 = {"Lio/branch/engage/sesame_lite/internal/DB;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/io/File;", "dbDir", "<init>", "(Ljava/io/File;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "loadFromDisk", "()V", "X", "Lkotlin/Function1;", "Lio/branch/engage/sesame_lite/internal/DbView;", "block", "readTx", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "Lio/branch/engage/sesame_lite/internal/WriteBack;", "writeTx", "(Lkotlin/jvm/functions/Function1;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "typeName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "count", "(Ljava/lang/String;)J", "getSizeOnDisk", "()J", "reset", "deleteFiles", "Ljava/io/File;", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "linkStore", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "usageStore", "Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "aliasStore", "Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "ignoreStore", "Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "allStores", "Ljava/util/List;", "Ljava/util/concurrent/locks/ReentrantLock;", "writeLock", "Ljava/util/concurrent/locks/ReentrantLock;", "Lkotlin/collections/ArrayDeque;", "writeTxViews", "Lkotlin/collections/ArrayDeque;", "writeBackPendingCommit", "Lio/branch/engage/sesame_lite/internal/WriteBack;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "storesToWrite", "Ljava/util/Map;", "Lt70/r1;", "writeToDiskJob", "Lt70/r1;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "_hasLoadedFromDisk", "Ljava/util/concurrent/atomic/AtomicBoolean;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getHasLoadedFromDisk", "()Z", "hasLoadedFromDisk", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class DB {
    public static final int DB_VERSION = 2;

    @NotNull
    public static final String TAG = "SSML-Database";
    private AliasStore aliasStore;

    @Nullable
    private final File dbDir;
    private IgnoreStore ignoreStore;
    private LinkStore linkStore;
    private UsageStore usageStore;

    @Nullable
    private r1 writeToDiskJob;

    @NotNull
    private List<? extends InMemoryStore<?, ?>> allStores = EmptyList.f71733a;

    @NotNull
    private final ReentrantLock writeLock = new ReentrantLock();

    @NotNull
    private final ArrayDeque<DbView> writeTxViews = new ArrayDeque<>();

    @NotNull
    private WriteBack writeBackPendingCommit = WriteBack.INSTANCE.getNO_OP();

    @NotNull
    private Map<String, InMemoryStore<?, ?>> storesToWrite = new LinkedHashMap();

    @NotNull
    private final AtomicBoolean _hasLoadedFromDisk = new AtomicBoolean(false);

    public DB(@Nullable File file) {
        this.dbDir = file;
    }

    private static final File loadFromDisk$subFile(File file, String str) {
        return new File(file, str);
    }

    public final long count(@NotNull String typeName) {
        Object next;
        Intrinsics.g(typeName, "typeName");
        Iterator<T> it = this.allStores.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((InMemoryStore) next).getTypeName(), typeName)) {
                break;
            }
        }
        InMemoryStore inMemoryStore = (InMemoryStore) next;
        if (inMemoryStore != null) {
            return inMemoryStore.count();
        }
        return 0L;
    }

    public final void deleteFiles() {
        ReentrantLock reentrantLock = this.writeLock;
        reentrantLock.lock();
        try {
            Iterator<T> it = this.allStores.iterator();
            while (it.hasNext()) {
                File cacheFile = ((InMemoryStore) it.next()).getCacheFile();
                if (cacheFile != null) {
                    cacheFile.delete();
                }
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final boolean getHasLoadedFromDisk() {
        return this._hasLoadedFromDisk.get();
    }

    public final long getSizeOnDisk() {
        Iterator<T> it = this.allStores.iterator();
        long length = 0;
        while (it.hasNext()) {
            File cacheFile = ((InMemoryStore) it.next()).getCacheFile();
            length += cacheFile != null ? cacheFile.length() : 0L;
        }
        return length;
    }

    public final void loadFromDisk() {
        State state = State.INSTANCE;
        l log = state.getLog();
        if (log.getLevel().ordinal() >= 3) {
            log.getWriter().debug("SSML-Database", "loadFromDisk() acquiring DB write lock...");
        }
        ReentrantLock reentrantLock = this.writeLock;
        reentrantLock.lock();
        try {
            l log2 = state.getLog();
            if (log2.getLevel().ordinal() >= 3) {
                log2.getWriter().debug("SSML-Database", "Initializing database...");
            }
            long jNanoTime = System.nanoTime();
            File file = this.dbDir;
            this.linkStore = new LinkStore(file != null ? loadFromDisk$subFile(file, "links.proto") : null);
            File file2 = this.dbDir;
            this.usageStore = new UsageStore(file2 != null ? loadFromDisk$subFile(file2, "linkUsage.proto") : null);
            File file3 = this.dbDir;
            this.aliasStore = new AliasStore(file3 != null ? loadFromDisk$subFile(file3, "aliases.proto") : null);
            File file4 = this.dbDir;
            IgnoreStore ignoreStore = new IgnoreStore(file4 != null ? loadFromDisk$subFile(file4, "ignores.proto") : null);
            this.ignoreStore = ignoreStore;
            LinkStore linkStore = this.linkStore;
            if (linkStore == null) {
                Intrinsics.m("linkStore");
                throw null;
            }
            UsageStore usageStore = this.usageStore;
            if (usageStore == null) {
                Intrinsics.m("usageStore");
                throw null;
            }
            AliasStore aliasStore = this.aliasStore;
            if (aliasStore == null) {
                Intrinsics.m("aliasStore");
                throw null;
            }
            List<? extends InMemoryStore<?, ?>> listQ = ul.b.Q(linkStore, usageStore, aliasStore, ignoreStore);
            this.allStores = listQ;
            Iterator<T> it = listQ.iterator();
            while (it.hasNext()) {
                InMemoryStore inMemoryStore = (InMemoryStore) it.next();
                long jLoadFromDisk$sesame_lite_release = inMemoryStore.loadFromDisk$sesame_lite_release();
                l log3 = State.INSTANCE.getLog();
                if (log3.getLevel().ordinal() >= 3) {
                    j writer = log3.getWriter();
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Loaded ");
                    sb2.append(inMemoryStore.count());
                    sb2.append(' ');
                    sb2.append(inMemoryStore.getTypeName());
                    sb2.append(" entities from ");
                    File cacheFile = inMemoryStore.getCacheFile();
                    sb2.append(cacheFile != null ? cacheFile.getName() : null);
                    sb2.append(": readBytes=");
                    sb2.append(jLoadFromDisk$sesame_lite_release);
                    writer.debug("SSML-Database", sb2.toString());
                }
            }
            this._hasLoadedFromDisk.set(true);
            long jNanoTime2 = System.nanoTime() - jNanoTime;
            l log4 = State.INSTANCE.getLog();
            if (log4.getLevel().ordinal() >= 3) {
                log4.getWriter().debug("SSML-Database", "Finished initializing DB: elapsed=" + Strs.INSTANCE.formatDuration(jNanoTime2));
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final <X> X readTx(@NotNull Function1<? super DbView, ? extends X> block) {
        Intrinsics.g(block, "block");
        UtilsKt.assertTrue(getHasLoadedFromDisk(), new Function0<String>() { // from class: io.branch.engage.sesame_lite.internal.DB.readTx.2
            @Override // kotlin.jvm.functions.Function0
            @Nullable
            public final String invoke() {
                return "Database must be loaded before calling 'readTx'";
            }
        });
        DbView dbView = (DbView) this.writeTxViews.j();
        if (dbView != null && this.writeLock.isHeldByCurrentThread()) {
            return (X) block.invoke(dbView);
        }
        LinkStore linkStore = this.linkStore;
        if (linkStore == null) {
            Intrinsics.m("linkStore");
            throw null;
        }
        LinkStore linkStoreNewDataInstance = linkStore.newDataInstance();
        UsageStore usageStore = this.usageStore;
        if (usageStore == null) {
            Intrinsics.m("usageStore");
            throw null;
        }
        UsageStore usageStoreNewDataInstance = usageStore.newDataInstance();
        AliasStore aliasStore = this.aliasStore;
        if (aliasStore == null) {
            Intrinsics.m("aliasStore");
            throw null;
        }
        AliasStore aliasStoreNewDataInstance = aliasStore.newDataInstance();
        IgnoreStore ignoreStore = this.ignoreStore;
        if (ignoreStore != null) {
            return (X) block.invoke(new DbView(linkStoreNewDataInstance, usageStoreNewDataInstance, aliasStoreNewDataInstance, ignoreStore.newDataInstance()));
        }
        Intrinsics.m("ignoreStore");
        throw null;
    }

    public final void reset() {
        ReentrantLock reentrantLock = this.writeLock;
        reentrantLock.lock();
        try {
            deleteFiles();
            Iterator<T> it = this.allStores.iterator();
            while (it.hasNext()) {
                ((InMemoryStore) it.next()).removeAll();
            }
            loadFromDisk();
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final void writeTx(@NotNull Function1<? super DbView, WriteBack> block) {
        DbView dbView;
        Intrinsics.g(block, "block");
        ReentrantLock reentrantLock = this.writeLock;
        reentrantLock.lock();
        try {
            ArrayDeque<DbView> arrayDeque = this.writeTxViews;
            boolean z11 = arrayDeque.f71724c == 0;
            if (z11) {
                LinkStore linkStore = this.linkStore;
                if (linkStore == null) {
                    Intrinsics.m("linkStore");
                    throw null;
                }
                LinkStore linkStoreNewDataInstance = linkStore.newDataInstance();
                UsageStore usageStore = this.usageStore;
                if (usageStore == null) {
                    Intrinsics.m("usageStore");
                    throw null;
                }
                UsageStore usageStoreNewDataInstance = usageStore.newDataInstance();
                AliasStore aliasStore = this.aliasStore;
                if (aliasStore == null) {
                    Intrinsics.m("aliasStore");
                    throw null;
                }
                AliasStore aliasStoreNewDataInstance = aliasStore.newDataInstance();
                IgnoreStore ignoreStore = this.ignoreStore;
                if (ignoreStore == null) {
                    Intrinsics.m("ignoreStore");
                    throw null;
                }
                dbView = new DbView(linkStoreNewDataInstance, usageStoreNewDataInstance, aliasStoreNewDataInstance, ignoreStore.newDataInstance());
            } else {
                DbView dbView2 = (DbView) arrayDeque.last();
                dbView = new DbView(dbView2.getLinkStore().newDataInstance(), dbView2.getUsageStore().newDataInstance(), dbView2.getAliasStore().newDataInstance(), dbView2.getIgnoreStore().newDataInstance());
            }
            this.writeTxViews.addLast(dbView);
            WriteBack.INSTANCE.getNO_OP();
            try {
                WriteBack writeBack = (WriteBack) block.invoke(dbView);
                this.writeTxViews.removeLast();
                State state = State.INSTANCE;
                l log = state.getLog();
                if (log.getLevel().ordinal() >= 3) {
                    log.getWriter().debug("SSML-Database", "Finished writeTx block invocation. hasError=false, isBaseCall=" + z11 + " (Previous nested calls: " + this.writeTxViews.f71724c + ')');
                }
                if (z11) {
                    l log2 = state.getLog();
                    if (log2.getLevel().ordinal() >= 3) {
                        log2.getWriter().debug("SSML-Database", " -- Committing WriteBack data to database, and triggering save to file");
                    }
                    LinkStore linkStore2 = writeBack.getLinkStore();
                    if (linkStore2 == null) {
                        linkStore2 = this.writeBackPendingCommit.getLinkStore();
                    }
                    UsageStore usageStore2 = writeBack.getUsageStore();
                    if (usageStore2 == null) {
                        usageStore2 = this.writeBackPendingCommit.getUsageStore();
                    }
                    AliasStore aliasStore2 = writeBack.getAliasStore();
                    if (aliasStore2 == null) {
                        aliasStore2 = this.writeBackPendingCommit.getAliasStore();
                    }
                    IgnoreStore ignoreStore2 = writeBack.getIgnoreStore();
                    if (ignoreStore2 == null) {
                        ignoreStore2 = this.writeBackPendingCommit.getIgnoreStore();
                    }
                    this.writeBackPendingCommit = new WriteBack(linkStore2, usageStore2, aliasStore2, ignoreStore2);
                } else if (!z11) {
                    l log3 = state.getLog();
                    if (log3.getLevel().ordinal() >= 3) {
                        log3.getWriter().debug("SSML-Database", " -- Writing WriteBack data to previous ReadView, and accumulating pending commit");
                    }
                    DbView dbView3 = (DbView) this.writeTxViews.last();
                    LinkStore linkStore3 = writeBack.getLinkStore();
                    if (linkStore3 != null) {
                        dbView3.getLinkStore().replaceData(linkStore3);
                        Unit unit = Unit.f71706a;
                    }
                    UsageStore usageStore3 = writeBack.getUsageStore();
                    if (usageStore3 != null) {
                        dbView3.getUsageStore().replaceData(usageStore3);
                        Unit unit2 = Unit.f71706a;
                    }
                    AliasStore aliasStore3 = writeBack.getAliasStore();
                    if (aliasStore3 != null) {
                        dbView3.getAliasStore().replaceData(aliasStore3);
                        Unit unit3 = Unit.f71706a;
                    }
                    IgnoreStore ignoreStore3 = writeBack.getIgnoreStore();
                    if (ignoreStore3 != null) {
                        dbView3.getIgnoreStore().replaceData(ignoreStore3);
                        Unit unit4 = Unit.f71706a;
                    }
                    LinkStore linkStore4 = writeBack.getLinkStore();
                    if (linkStore4 == null) {
                        linkStore4 = this.writeBackPendingCommit.getLinkStore();
                    }
                    UsageStore usageStore4 = writeBack.getUsageStore();
                    if (usageStore4 == null) {
                        usageStore4 = this.writeBackPendingCommit.getUsageStore();
                    }
                    AliasStore aliasStore4 = writeBack.getAliasStore();
                    if (aliasStore4 == null) {
                        aliasStore4 = this.writeBackPendingCommit.getAliasStore();
                    }
                    IgnoreStore ignoreStore4 = writeBack.getIgnoreStore();
                    if (ignoreStore4 == null) {
                        ignoreStore4 = this.writeBackPendingCommit.getIgnoreStore();
                    }
                    this.writeBackPendingCommit = new WriteBack(linkStore4, usageStore4, aliasStore4, ignoreStore4);
                }
                if (z11) {
                    List listV0 = kotlin.collections.c.v0(new InMemoryStore[]{this.writeBackPendingCommit.getLinkStore(), this.writeBackPendingCommit.getUsageStore(), this.writeBackPendingCommit.getAliasStore(), this.writeBackPendingCommit.getIgnoreStore()});
                    synchronized (this.storesToWrite) {
                        try {
                            Iterator it = ((ArrayList) listV0).iterator();
                            while (it.hasNext()) {
                                InMemoryStore<?, ?> inMemoryStore = (InMemoryStore) it.next();
                                this.storesToWrite.put(inMemoryStore.getTypeName(), inMemoryStore);
                            }
                            Unit unit5 = Unit.f71706a;
                        } finally {
                        }
                    }
                    LinkStore linkStore5 = this.writeBackPendingCommit.getLinkStore();
                    if (linkStore5 == null && (linkStore5 = this.linkStore) == null) {
                        Intrinsics.m("linkStore");
                        throw null;
                    }
                    this.linkStore = linkStore5;
                    UsageStore usageStore5 = this.writeBackPendingCommit.getUsageStore();
                    if (usageStore5 == null && (usageStore5 = this.usageStore) == null) {
                        Intrinsics.m("usageStore");
                        throw null;
                    }
                    this.usageStore = usageStore5;
                    AliasStore aliasStore5 = this.writeBackPendingCommit.getAliasStore();
                    if (aliasStore5 == null && (aliasStore5 = this.aliasStore) == null) {
                        Intrinsics.m("aliasStore");
                        throw null;
                    }
                    this.aliasStore = aliasStore5;
                    IgnoreStore ignoreStore5 = this.writeBackPendingCommit.getIgnoreStore();
                    if (ignoreStore5 == null && (ignoreStore5 = this.ignoreStore) == null) {
                        Intrinsics.m("ignoreStore");
                        throw null;
                    }
                    this.ignoreStore = ignoreStore5;
                    LinkStore linkStore6 = this.linkStore;
                    if (linkStore6 == null) {
                        Intrinsics.m("linkStore");
                        throw null;
                    }
                    UsageStore usageStore6 = this.usageStore;
                    if (usageStore6 == null) {
                        Intrinsics.m("usageStore");
                        throw null;
                    }
                    AliasStore aliasStore6 = this.aliasStore;
                    if (aliasStore6 == null) {
                        Intrinsics.m("aliasStore");
                        throw null;
                    }
                    this.allStores = ul.b.Q(linkStore6, usageStore6, aliasStore6, ignoreStore5);
                    this.writeBackPendingCommit = WriteBack.INSTANCE.getNO_OP();
                    r1 r1Var = this.writeToDiskJob;
                    if (r1Var != null) {
                        r1Var.c(null);
                    }
                    this.writeToDiskJob = m0.t(l1.f88818a, null, null, new DB$writeTx$2$11(this, null), 3);
                }
                Unit unit6 = Unit.f71706a;
                reentrantLock.unlock();
            } finally {
            }
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
