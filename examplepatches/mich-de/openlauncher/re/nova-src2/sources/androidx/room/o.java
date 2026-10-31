package androidx.room;

import android.database.Cursor;
import android.os.CancellationSignal;
import android.os.Looper;
import android.util.Log;
import java.util.BitSet;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import kotlin.Deprecated;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.JvmSuppressWildcards;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class o {

    @NotNull
    public static final n Companion = new n();
    public static final int MAX_BIND_PARAMETER_CNT = 999;
    private boolean allowMainThreadQueries;

    @Nullable
    private a autoCloser;

    @NotNull
    private final Map<String, Object> backingFieldMap;
    private d7.d internalOpenHelper;
    private Executor internalQueryExecutor;
    private Executor internalTransactionExecutor;

    @JvmField
    @Nullable
    protected List<? extends p7.b> mCallbacks;

    @JvmField
    @Nullable
    protected volatile d7.a mDatabase;

    @NotNull
    private final Map<Class<?>, Object> typeConverters;
    private boolean writeAheadLoggingEnabled;

    @NotNull
    private final j invalidationTracker = createInvalidationTracker();

    @NotNull
    private Map<Class<Object>, Object> autoMigrationSpecs = new LinkedHashMap();

    @NotNull
    private final ReentrantReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    @NotNull
    private final ThreadLocal<Integer> suspendingTransactionId = new ThreadLocal<>();

    public o() {
        Map<String, Object> mapSynchronizedMap = Collections.synchronizedMap(new LinkedHashMap());
        Intrinsics.f(mapSynchronizedMap, "synchronizedMap(mutableMapOf())");
        this.backingFieldMap = mapSynchronizedMap;
        this.typeConverters = new LinkedHashMap();
    }

    public static final void access$internalBeginTransaction(o oVar) {
        oVar.assertNotMainThread();
        d7.a writableDatabase = oVar.getOpenHelper().getWritableDatabase();
        oVar.getInvalidationTracker().c(writableDatabase);
        if (writableDatabase.isWriteAheadLoggingEnabled()) {
            writableDatabase.beginTransactionNonExclusive();
        } else {
            writableDatabase.beginTransaction();
        }
    }

    @Deprecated
    public static /* synthetic */ void getMCallbacks$annotations() {
    }

    @Deprecated
    public static /* synthetic */ void getMDatabase$annotations() {
    }

    public static /* synthetic */ void isOpen$annotations() {
    }

    public static /* synthetic */ void isOpenInternal$annotations() {
    }

    public static /* synthetic */ Cursor query$default(o oVar, d7.f fVar, CancellationSignal cancellationSignal, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: query");
        }
        if ((i5 & 2) != 0) {
            cancellationSignal = null;
        }
        return oVar.query(fVar, cancellationSignal);
    }

    public void assertNotMainThread() {
        if (!this.allowMainThreadQueries && isMainThread$room_runtime_release()) {
            throw new IllegalStateException("Cannot access database on the main thread since it may potentially lock the UI for a long period of time.");
        }
    }

    public void assertNotSuspendingTransaction() {
        if (!inTransaction() && this.suspendingTransactionId.get() != null) {
            throw new IllegalStateException("Cannot access database on a different coroutine context inherited from a suspending transaction.");
        }
    }

    @Deprecated
    public void beginTransaction() {
        assertNotMainThread();
        assertNotMainThread();
        d7.a writableDatabase = getOpenHelper().getWritableDatabase();
        getInvalidationTracker().c(writableDatabase);
        if (writableDatabase.isWriteAheadLoggingEnabled()) {
            writableDatabase.beginTransactionNonExclusive();
        } else {
            writableDatabase.beginTransaction();
        }
    }

    public final void c() {
        getOpenHelper().getWritableDatabase().endTransaction();
        if (inTransaction()) {
            return;
        }
        j invalidationTracker = getInvalidationTracker();
        if (invalidationTracker.f15227e.compareAndSet(false, true)) {
            invalidationTracker.f15223a.getQueryExecutor().execute(invalidationTracker.f15234l);
        }
    }

    public abstract void clearAllTables();

    public void close() {
        if (isOpen()) {
            ReentrantReadWriteLock.WriteLock writeLock = this.readWriteLock.writeLock();
            Intrinsics.f(writeLock, "readWriteLock.writeLock()");
            writeLock.lock();
            try {
                getInvalidationTracker().getClass();
                getOpenHelper().close();
            } finally {
                writeLock.unlock();
            }
        }
    }

    @NotNull
    public d7.g compileStatement(@NotNull String sql) {
        Intrinsics.g(sql, "sql");
        assertNotMainThread();
        assertNotSuspendingTransaction();
        return getOpenHelper().getWritableDatabase().compileStatement(sql);
    }

    @NotNull
    public abstract j createInvalidationTracker();

    @NotNull
    public abstract d7.d createOpenHelper(@NotNull d dVar);

    @Deprecated
    public void endTransaction() {
        c();
    }

    @NotNull
    public final Map<Class<Object>, Object> getAutoMigrationSpecs() {
        return this.autoMigrationSpecs;
    }

    @JvmSuppressWildcards
    @NotNull
    public List<y6.a> getAutoMigrations(@NotNull Map<Class<Object>, Object> autoMigrationSpecs) {
        Intrinsics.g(autoMigrationSpecs, "autoMigrationSpecs");
        return EmptyList.f71733a;
    }

    @NotNull
    public final Map<String, Object> getBackingFieldMap() {
        return this.backingFieldMap;
    }

    @NotNull
    public final Lock getCloseLock$room_runtime_release() {
        ReentrantReadWriteLock.ReadLock lock = this.readWriteLock.readLock();
        Intrinsics.f(lock, "readWriteLock.readLock()");
        return lock;
    }

    @NotNull
    public j getInvalidationTracker() {
        return this.invalidationTracker;
    }

    @NotNull
    public d7.d getOpenHelper() {
        d7.d dVar = this.internalOpenHelper;
        if (dVar != null) {
            return dVar;
        }
        Intrinsics.m("internalOpenHelper");
        throw null;
    }

    @NotNull
    public Executor getQueryExecutor() {
        Executor executor = this.internalQueryExecutor;
        if (executor != null) {
            return executor;
        }
        Intrinsics.m("internalQueryExecutor");
        throw null;
    }

    @NotNull
    public Set<Class<Object>> getRequiredAutoMigrationSpecs() {
        return EmptySet.f71734a;
    }

    @NotNull
    public Map<Class<?>, List<Class<?>>> getRequiredTypeConverters() {
        return b70.h.f17594a;
    }

    @NotNull
    public final ThreadLocal<Integer> getSuspendingTransactionId() {
        return this.suspendingTransactionId;
    }

    @NotNull
    public Executor getTransactionExecutor() {
        Executor executor = this.internalTransactionExecutor;
        if (executor != null) {
            return executor;
        }
        Intrinsics.m("internalTransactionExecutor");
        throw null;
    }

    @Nullable
    public <T> T getTypeConverter(@NotNull Class<T> klass) {
        Intrinsics.g(klass, "klass");
        return (T) this.typeConverters.get(klass);
    }

    public boolean inTransaction() {
        return getOpenHelper().getWritableDatabase().inTransaction();
    }

    public void init(@NotNull d configuration) {
        Intrinsics.g(configuration, "configuration");
        a0.b bVar = configuration.f15207d;
        List list = configuration.n;
        List list2 = configuration.f15216m;
        this.internalOpenHelper = createOpenHelper(configuration);
        Set<Class<Object>> requiredAutoMigrationSpecs = getRequiredAutoMigrationSpecs();
        BitSet bitSet = new BitSet();
        Iterator<Class<Object>> it = requiredAutoMigrationSpecs.iterator();
        while (true) {
            int i5 = -1;
            if (it.hasNext()) {
                Class<Object> next = it.next();
                int size = list.size() - 1;
                if (size >= 0) {
                    while (true) {
                        int i11 = size - 1;
                        if (next.isAssignableFrom(list.get(size).getClass())) {
                            bitSet.set(size);
                            i5 = size;
                            break;
                        } else if (i11 < 0) {
                            break;
                        } else {
                            size = i11;
                        }
                    }
                }
                if (i5 < 0) {
                    throw new IllegalArgumentException(("A required auto migration spec (" + next.getCanonicalName() + ") is missing in the database configuration.").toString());
                }
                this.autoMigrationSpecs.put(next, list.get(i5));
            } else {
                int size2 = list.size() - 1;
                if (size2 >= 0) {
                    while (true) {
                        int i12 = size2 - 1;
                        if (!bitSet.get(size2)) {
                            throw new IllegalArgumentException("Unexpected auto migration specs found. Annotate AutoMigrationSpec implementation with @ProvidedAutoMigrationSpec annotation or remove this spec from the builder.");
                        }
                        if (i12 < 0) {
                            break;
                        } else {
                            size2 = i12;
                        }
                    }
                }
                Iterator<y6.a> it2 = getAutoMigrations(this.autoMigrationSpecs).iterator();
                while (true) {
                    boolean zContainsKey = false;
                    if (!it2.hasNext()) {
                        break;
                    }
                    y6.a next2 = it2.next();
                    int i13 = next2.f96732a;
                    int i14 = next2.f96733b;
                    LinkedHashMap linkedHashMap = bVar.f57a;
                    if (linkedHashMap.containsKey(Integer.valueOf(i13))) {
                        Map map = (Map) linkedHashMap.get(Integer.valueOf(i13));
                        if (map == null) {
                            map = b70.h.f17594a;
                        }
                        zContainsKey = map.containsKey(Integer.valueOf(i14));
                    }
                    if (!zContainsKey) {
                        bVar.a(next2);
                    }
                }
                d7.d openHelper = getOpenHelper();
                if (!u.class.isInstance(openHelper)) {
                    openHelper = null;
                }
                if (openHelper != null) {
                    throw new ClassCastException();
                }
                d7.d openHelper2 = getOpenHelper();
                if ((b.class.isInstance(openHelper2) ? openHelper2 : null) != null) {
                    throw new ClassCastException();
                }
                boolean z11 = configuration.f15210g == 3;
                getOpenHelper().setWriteAheadLoggingEnabled(z11);
                this.mCallbacks = configuration.f15208e;
                this.internalQueryExecutor = configuration.f15211h;
                this.internalTransactionExecutor = new x(configuration.f15212i, 0);
                this.allowMainThreadQueries = configuration.f15209f;
                this.writeAheadLoggingEnabled = z11;
                Map<Class<?>, List<Class<?>>> requiredTypeConverters = getRequiredTypeConverters();
                BitSet bitSet2 = new BitSet();
                for (Map.Entry<Class<?>, List<Class<?>>> entry : requiredTypeConverters.entrySet()) {
                    Class<?> key = entry.getKey();
                    for (Class<?> cls : entry.getValue()) {
                        int size3 = list2.size() - 1;
                        if (size3 >= 0) {
                            while (true) {
                                int i15 = size3 - 1;
                                if (cls.isAssignableFrom(list2.get(size3).getClass())) {
                                    bitSet2.set(size3);
                                    break;
                                } else if (i15 < 0) {
                                    break;
                                } else {
                                    size3 = i15;
                                }
                            }
                            size3 = -1;
                        } else {
                            size3 = -1;
                        }
                        if (!(size3 >= 0)) {
                            throw new IllegalArgumentException(("A required type converter (" + cls + ") for " + key.getCanonicalName() + " is missing in the database configuration.").toString());
                        }
                        this.typeConverters.put(cls, list2.get(size3));
                    }
                }
                int size4 = list2.size() - 1;
                if (size4 < 0) {
                    return;
                }
                while (true) {
                    int i16 = size4 - 1;
                    if (!bitSet2.get(size4)) {
                        throw new IllegalArgumentException("Unexpected type converter " + list2.get(size4) + ". Annotate TypeConverter class with @ProvidedTypeConverter annotation or remove this converter from the builder.");
                    }
                    if (i16 < 0) {
                        return;
                    } else {
                        size4 = i16;
                    }
                }
            }
        }
    }

    public void internalInitInvalidationTracker(@NotNull d7.a db2) {
        Intrinsics.g(db2, "db");
        j invalidationTracker = getInvalidationTracker();
        invalidationTracker.getClass();
        synchronized (invalidationTracker.f15233k) {
            if (invalidationTracker.f15228f) {
                Log.e("ROOM", "Invalidation tracker is initialized twice :/.");
                return;
            }
            db2.execSQL("PRAGMA temp_store = MEMORY;");
            db2.execSQL("PRAGMA recursive_triggers='ON';");
            db2.execSQL("CREATE TEMP TABLE room_table_modification_log (table_id INTEGER PRIMARY KEY, invalidated INTEGER NOT NULL DEFAULT 0)");
            invalidationTracker.c(db2);
            invalidationTracker.f15229g = db2.compileStatement("UPDATE room_table_modification_log SET invalidated = 0 WHERE invalidated = 1");
            invalidationTracker.f15228f = true;
            Unit unit = Unit.f71706a;
        }
    }

    public final boolean isMainThread$room_runtime_release() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }

    public boolean isOpen() {
        d7.a aVar = this.mDatabase;
        return Intrinsics.b(aVar != null ? Boolean.valueOf(aVar.isOpen()) : null, Boolean.TRUE);
    }

    public final boolean isOpenInternal() {
        d7.a aVar = this.mDatabase;
        return aVar != null && aVar.isOpen();
    }

    @JvmOverloads
    @NotNull
    public final Cursor query(@NotNull d7.f query) {
        Intrinsics.g(query, "query");
        return query$default(this, query, null, 2, null);
    }

    public void runInTransaction(@NotNull Runnable body) {
        Intrinsics.g(body, "body");
        beginTransaction();
        try {
            body.run();
            setTransactionSuccessful();
        } finally {
            endTransaction();
        }
    }

    public final void setAutoMigrationSpecs(@NotNull Map<Class<Object>, Object> map) {
        Intrinsics.g(map, "<set-?>");
        this.autoMigrationSpecs = map;
    }

    @Deprecated
    public void setTransactionSuccessful() {
        getOpenHelper().getWritableDatabase().setTransactionSuccessful();
    }

    @NotNull
    public Cursor query(@NotNull String query, @Nullable Object[] objArr) {
        Intrinsics.g(query, "query");
        return getOpenHelper().getWritableDatabase().query(new x7.l(query, objArr));
    }

    @JvmOverloads
    @NotNull
    public Cursor query(@NotNull d7.f query, @Nullable CancellationSignal cancellationSignal) {
        Intrinsics.g(query, "query");
        assertNotMainThread();
        assertNotSuspendingTransaction();
        if (cancellationSignal != null) {
            return getOpenHelper().getWritableDatabase().query(query, cancellationSignal);
        }
        return getOpenHelper().getWritableDatabase().query(query);
    }

    public <V> V runInTransaction(@NotNull Callable<V> body) {
        Intrinsics.g(body, "body");
        beginTransaction();
        try {
            V vCall = body.call();
            setTransactionSuccessful();
            return vCall;
        } finally {
            endTransaction();
        }
    }
}
