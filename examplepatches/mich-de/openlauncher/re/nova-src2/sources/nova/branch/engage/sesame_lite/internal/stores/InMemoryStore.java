package nova.branch.engage.sesame_lite.internal.stores;

import b70.c;
import b70.g;
import b70.h;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.protobuf.ProtoBuf;
import nova.branch.engage.sesame_lite.internal.State;
import nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r80.o;
import r80.p;

@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010$\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010%\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0010\u001e\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 5*\u0004\b\u0000\u0010\u0001*\u000e\b\u0001\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00010\u00032\u00020\u0004:\u00015B+\b\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\u000e\u0010\t\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\n¢\u0006\u0004\b\u000b\u0010\fJ\u0014\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0000H&J$\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0012\u0010\u001e\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u001fH\u0016J\u0006\u0010 \u001a\u00020!J\f\u0010\"\u001a\b\u0012\u0004\u0012\u00028\u00010#J\u0015\u0010$\u001a\u0004\u0018\u00018\u00012\u0006\u0010%\u001a\u00028\u0000¢\u0006\u0002\u0010&J\u001a\u0010$\u001a\b\u0012\u0004\u0012\u00028\u00010'2\f\u0010(\u001a\b\u0012\u0004\u0012\u00028\u00000'J\u0013\u0010)\u001a\u00020\u001b2\u0006\u0010*\u001a\u00028\u0001¢\u0006\u0002\u0010+J\u0014\u0010)\u001a\u00020\u001b2\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00010'J\u0013\u0010-\u001a\u00020\u001b2\u0006\u0010*\u001a\u00028\u0001¢\u0006\u0002\u0010+J\u0014\u0010-\u001a\u00020\u001b2\f\u0010,\u001a\b\u0012\u0004\u0012\u00028\u00010'J\u0006\u0010.\u001a\u00020\u001bJ\u001a\u0010/\u001a\u00020\u001b2\u0012\u00100\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0000J\r\u00101\u001a\u00020!H\u0000¢\u0006\u0002\b2J\r\u00103\u001a\u00020!H\u0000¢\u0006\u0002\b4R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R&\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0014X\u0084\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018\u0082\u0001\u00046789¨\u0006:"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "K", "T", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "typeName", b.f42142b, "cacheFile", "Ljava/io/File;", "serializer", "Lkotlinx/serialization/KSerializer;", "<init>", "(Ljava/lang/String;Ljava/io/File;Lkotlinx/serialization/KSerializer;)V", "getTypeName", "()Ljava/lang/String;", "getCacheFile", "()Ljava/io/File;", "getSerializer", "()Lkotlinx/serialization/KSerializer;", "data", b.f42142b, "getData", "()Ljava/util/Map;", "setData", "(Ljava/util/Map;)V", "newDataInstance", "onPostLoaded", b.f42142b, "dbVersion", b.f42142b, "loadedData", b.f42142b, "count", b.f42142b, "getAll", b.f42142b, "get", "id", "(Ljava/lang/Object;)Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "ids", "put", "entity", "(Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;)V", "entities", "remove", "removeAll", "replaceData", "store", "writeToDisk", "writeToDisk$sesame_lite_release", "loadFromDisk", "loadFromDisk$sesame_lite_release", k.O, "Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;", "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class InMemoryStore<K, T extends InMemoryEntity<K>> {
    public static final int MAX_DB_FILE_SIZE = 104857600;

    @NotNull
    public static final String TAG = "SSML-InMemStore";

    @Nullable
    private final File cacheFile;

    @NotNull
    private Map<K, ? extends T> data;

    @Nullable
    private final KSerializer<T> serializer;

    @NotNull
    private final String typeName;

    public /* synthetic */ InMemoryStore(String str, File file, KSerializer kSerializer, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, file, kSerializer);
    }

    public final long count() {
        return this.data.size();
    }

    @Nullable
    public final T get(K id2) {
        return this.data.get(id2);
    }

    @NotNull
    public final List<T> getAll() {
        return g.I1(this.data.values());
    }

    @Nullable
    public final File getCacheFile() {
        return this.cacheFile;
    }

    @NotNull
    public final Map<K, T> getData() {
        return this.data;
    }

    @Nullable
    public final KSerializer<T> getSerializer() {
        return this.serializer;
    }

    @NotNull
    public final String getTypeName() {
        return this.typeName;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v0, types: [nova.branch.engage.sesame_lite.internal.stores.InMemoryStore, nova.branch.engage.sesame_lite.internal.stores.InMemoryStore<K, T extends nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity<K>>] */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.util.LinkedHashMap, java.util.Map, java.util.Map<K, ? extends T extends nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity<K>>] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r8v3, types: [java.io.BufferedInputStream, java.io.Closeable, java.io.InputStream] */
    public final long loadFromDisk$sesame_lite_release() throws IOException {
        int i5;
        if (this.cacheFile == null || this.serializer == null) {
            return -1L;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
        ?? bufferedInputStream = 0;
        if (!this.cacheFile.exists()) {
            return 0L;
        }
        try {
        } catch (Exception e3) {
            p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            o oVar = o.f85697a;
            if (iOrdinal >= 1) {
                log.getWriter().error("SSML-InMemStore", e3);
            }
        }
        if (this.cacheFile.length() > 104857600) {
            p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            o oVar2 = o.f85697a;
            if (iOrdinal2 >= 2) {
                log2.getWriter().warn("SSML-InMemStore", "Database file too large: size=" + this.cacheFile.length() + ": file=" + this.cacheFile.getName() + ". Deleting...");
            }
            this.cacheFile.delete();
            this.data = h.f17594a;
            return 0L;
        }
        try {
            bufferedInputStream = new BufferedInputStream(new FileInputStream(this.cacheFile), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                i5 = bufferedInputStream.read(byteBufferAllocate.array());
            } catch (Exception e11) {
                linkedHashMap.clear();
                p log3 = State.INSTANCE.getLog();
                int iOrdinal3 = log3.getLevel().ordinal();
                o oVar3 = o.f85697a;
                if (iOrdinal3 >= 1) {
                    log3.getWriter().error("SSML-InMemStore", e11);
                }
            }
            if (i5 != 4) {
                throw new IOException("Bad version read size: expected=4, found=" + i5 + ": file=" + this.cacheFile.getName());
            }
            byteBufferAllocate.position(0);
            int i11 = byteBufferAllocate.getInt();
            if (i11 > 3) {
                p log4 = State.INSTANCE.getLog();
                int iOrdinal4 = log4.getLevel().ordinal();
                o oVar4 = o.f85697a;
                if (iOrdinal4 >= 2) {
                    log4.getWriter().warn("SSML-InMemStore", "Database on disk newer: expected=3, found=" + i11 + ": file=" + this.cacheFile.getName() + ". Ignoring...");
                }
            }
            while (bufferedInputStream.read(byteBufferAllocate.array()) == 4) {
                byteBufferAllocate.position(0);
                int i12 = byteBufferAllocate.getInt();
                if (i12 <= 0 || i12 > 104857600) {
                    throw new IllegalStateException("Bad entity size: " + i12 + ": file=" + this.cacheFile.getName());
                }
                byte[] bArr = new byte[i12];
                int i13 = bufferedInputStream.read(bArr, 0, i12);
                if (i13 != i12) {
                    throw new IllegalStateException("Bad entity read size: expected=" + i12 + ", found=" + i13 + ": file=" + this.cacheFile.getName());
                }
                InMemoryEntity inMemoryEntity = (InMemoryEntity) ProtoBuf.INSTANCE.decodeFromByteArray(this.serializer, bArr);
                linkedHashMap.put(inMemoryEntity.getDbId(), inMemoryEntity);
            }
            onPostLoaded(i11, linkedHashMap);
            this.data = linkedHashMap;
            Unit unit = Unit.f71706a;
            bufferedInputStream.close();
            return this.cacheFile.length();
        } finally {
        }
    }

    @NotNull
    public abstract InMemoryStore<K, T> newDataInstance();

    public void onPostLoaded(int dbVersion, @NotNull Map<K, T> loadedData) {
        Intrinsics.g(loadedData, "loadedData");
    }

    public final void put(@NotNull T entity) {
        Intrinsics.g(entity, "entity");
        this.data = MapsKt.n0(this.data, new Pair(entity.getDbId(), entity));
    }

    public final void remove(@NotNull T entity) {
        Intrinsics.g(entity, "entity");
        Map<K, ? extends T> map = this.data;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<K, ? extends T> entry : map.entrySet()) {
            if (!Intrinsics.b(entry.getKey(), entity.getDbId())) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        this.data = linkedHashMap;
    }

    public final void removeAll() {
        this.data = h.f17594a;
    }

    public final void replaceData(@NotNull InMemoryStore<K, T> store) {
        Intrinsics.g(store, "store");
        this.data = MapsKt.s0(store.data);
    }

    public final void setData(@NotNull Map<K, ? extends T> map) {
        Intrinsics.g(map, "<set-?>");
        this.data = map;
    }

    public final long writeToDisk$sesame_lite_release() throws IOException {
        File file = this.cacheFile;
        if (file == null || this.serializer == null) {
            return -1L;
        }
        try {
            File parentFile = file.getParentFile();
            Intrinsics.d(parentFile);
            parentFile.mkdirs();
            File fileCreateTempFile = File.createTempFile(this.cacheFile.getName(), null, this.cacheFile.getParentFile());
            Intrinsics.d(fileCreateTempFile);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(fileCreateTempFile), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
                byteBufferAllocate.position(0);
                byteBufferAllocate.putInt(3);
                bufferedOutputStream.write(byteBufferAllocate.array());
                Iterator<T> it = this.data.values().iterator();
                while (it.hasNext()) {
                    try {
                        byte[] bArrEncodeToByteArray = ProtoBuf.INSTANCE.encodeToByteArray(this.serializer, (InMemoryEntity) it.next());
                        int length = bArrEncodeToByteArray.length;
                        byteBufferAllocate.position(0);
                        byteBufferAllocate.putInt(length);
                        bufferedOutputStream.write(byteBufferAllocate.array());
                        bufferedOutputStream.write(bArrEncodeToByteArray);
                    } catch (RuntimeException e3) {
                        p log = State.INSTANCE.getLog();
                        int iOrdinal = log.getLevel().ordinal();
                        o oVar = o.f85697a;
                        if (iOrdinal >= 1) {
                            log.getWriter().error("SSML-InMemStore", e3);
                        }
                    }
                }
                Unit unit = Unit.f71706a;
                bufferedOutputStream.close();
                fileCreateTempFile.renameTo(this.cacheFile);
                return this.cacheFile.length();
            } finally {
            }
        } catch (IOException e11) {
            p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            o oVar2 = o.f85697a;
            if (iOrdinal2 < 1) {
                return -1L;
            }
            log2.getWriter().error("SSML-InMemStore", e11);
            return -1L;
        }
    }

    private InMemoryStore(String str, File file, KSerializer<T> kSerializer) {
        this.typeName = str;
        this.cacheFile = file;
        this.serializer = kSerializer;
        this.data = h.f17594a;
        if (file != null && kSerializer == null) {
            throw new IllegalArgumentException("Must specify serializer if cacheFile is set");
        }
    }

    @NotNull
    public final Collection<T> get(@NotNull Collection<? extends K> ids) {
        Intrinsics.g(ids, "ids");
        Map<K, ? extends T> map = this.data;
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = ids.iterator();
        while (it.hasNext()) {
            T t6 = map.get(it.next());
            if (t6 != null) {
                arrayList.add(t6);
            }
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void put(@NotNull Collection<? extends T> entities) {
        Intrinsics.g(entities, "entities");
        LinkedHashMap linkedHashMapU0 = MapsKt.u0(this.data);
        int iD0 = b70.k.d0(c.u0(entities, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        for (Object obj : entities) {
            linkedHashMap.put(((InMemoryEntity) obj).getDbId(), obj);
        }
        linkedHashMapU0.putAll(linkedHashMap);
        this.data = linkedHashMapU0;
    }

    public final void remove(@NotNull Collection<? extends T> entities) {
        Intrinsics.g(entities, "entities");
        Map<K, ? extends T> map = this.data;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<K, ? extends T> entry : map.entrySet()) {
            if (!entities.contains(entry.getValue())) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        this.data = linkedHashMap;
    }
}
