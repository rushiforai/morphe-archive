package androidx.room;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public abstract class f extends v {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(o database) {
        super(database);
        Intrinsics.g(database, "database");
    }

    public abstract void bind(d7.g gVar, Object obj);

    public final void insert(Object obj) {
        d7.g gVarAcquire = acquire();
        try {
            bind(gVarAcquire, obj);
            gVarAcquire.executeInsert();
        } finally {
            release(gVarAcquire);
        }
    }

    public final long insertAndReturnId(Object obj) {
        d7.g gVarAcquire = acquire();
        try {
            bind(gVarAcquire, obj);
            return gVarAcquire.executeInsert();
        } finally {
            release(gVarAcquire);
        }
    }

    @NotNull
    public final long[] insertAndReturnIdsArray(@NotNull Collection<Object> entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            long[] jArr = new long[entities.size()];
            int i5 = 0;
            for (Object obj : entities) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                bind(gVarAcquire, obj);
                jArr[i5] = gVarAcquire.executeInsert();
                i5 = i11;
            }
            release(gVarAcquire);
            return jArr;
        } catch (Throwable th2) {
            release(gVarAcquire);
            throw th2;
        }
    }

    @NotNull
    public final Long[] insertAndReturnIdsArrayBox(@NotNull Collection<Object> entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        Iterator<Object> it = entities.iterator();
        try {
            int size = entities.size();
            Long[] lArr = new Long[size];
            for (int i5 = 0; i5 < size; i5++) {
                bind(gVarAcquire, it.next());
                lArr[i5] = Long.valueOf(gVarAcquire.executeInsert());
            }
            return lArr;
        } finally {
            release(gVarAcquire);
        }
    }

    @NotNull
    public final List<Long> insertAndReturnIdsList(@NotNull Object[] entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            ListBuilder listBuilderW = ul.b.w();
            for (Object obj : entities) {
                bind(gVarAcquire, obj);
                listBuilderW.add(Long.valueOf(gVarAcquire.executeInsert()));
            }
            ListBuilder listBuilderM = ul.b.m(listBuilderW);
            release(gVarAcquire);
            return listBuilderM;
        } catch (Throwable th2) {
            release(gVarAcquire);
            throw th2;
        }
    }

    public final void insert(@NotNull Object[] entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            for (Object obj : entities) {
                bind(gVarAcquire, obj);
                gVarAcquire.executeInsert();
            }
        } finally {
            release(gVarAcquire);
        }
    }

    @NotNull
    public final Long[] insertAndReturnIdsArrayBox(@NotNull Object[] entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        b70.a aVarA = ArrayIteratorKt.a(entities);
        try {
            int length = entities.length;
            Long[] lArr = new Long[length];
            for (int i5 = 0; i5 < length; i5++) {
                bind(gVarAcquire, aVarA.next());
                lArr[i5] = Long.valueOf(gVarAcquire.executeInsert());
            }
            return lArr;
        } finally {
            release(gVarAcquire);
        }
    }

    @NotNull
    public final List<Long> insertAndReturnIdsList(@NotNull Collection<Object> entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            ListBuilder listBuilderW = ul.b.w();
            Iterator<T> it = entities.iterator();
            while (it.hasNext()) {
                bind(gVarAcquire, it.next());
                listBuilderW.add(Long.valueOf(gVarAcquire.executeInsert()));
            }
            ListBuilder listBuilderM = ul.b.m(listBuilderW);
            release(gVarAcquire);
            return listBuilderM;
        } catch (Throwable th2) {
            release(gVarAcquire);
            throw th2;
        }
    }

    @NotNull
    public final long[] insertAndReturnIdsArray(@NotNull Object[] entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            long[] jArr = new long[entities.length];
            int length = entities.length;
            int i5 = 0;
            int i11 = 0;
            while (i5 < length) {
                int i12 = i11 + 1;
                bind(gVarAcquire, entities[i5]);
                jArr[i11] = gVarAcquire.executeInsert();
                i5++;
                i11 = i12;
            }
            return jArr;
        } finally {
            release(gVarAcquire);
        }
    }

    public final void insert(@NotNull Iterable<Object> entities) {
        Intrinsics.g(entities, "entities");
        d7.g gVarAcquire = acquire();
        try {
            Iterator<Object> it = entities.iterator();
            while (it.hasNext()) {
                bind(gVarAcquire, it.next());
                gVarAcquire.executeInsert();
            }
        } finally {
            release(gVarAcquire);
        }
    }
}
