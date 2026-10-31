package io.branch.engage.sesame_lite.internal.stores;

import b70.c;
import b70.g;
import b70.h;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.engage.sesame_lite.internal.State;
import io.branch.engage.sesame_lite.internal.stores.InMemoryEntity;
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
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u40.l;

@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\b\t\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u001e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010%\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 4*\u0004\b\u0000\u0010\u0001*\u000e\b\u0001\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00010\u00032\u00020\u0004:\u00014B)\b\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\u000e\u0010\t\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\n¢\u0006\u0002\u0010\u000bJ\u0006\u0010\u0018\u001a\u00020\u0019J\u0015\u0010\u001a\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u001b\u001a\u00028\u0000¢\u0006\u0002\u0010\u001cJ\u001a\u0010\u001a\u001a\b\u0012\u0004\u0012\u00028\u00010\u001d2\f\u0010\u001e\u001a\b\u0012\u0004\u0012\u00028\u00000\u001dJ\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00010 J\r\u0010!\u001a\u00020\u0019H\u0000¢\u0006\u0002\b\"J\u0014\u0010#\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0000H&J$\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020'2\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010)H\u0016J\u0013\u0010*\u001a\u00020%2\u0006\u0010+\u001a\u00028\u0001¢\u0006\u0002\u0010,J\u0014\u0010*\u001a\u00020%2\f\u0010-\u001a\b\u0012\u0004\u0012\u00028\u00010\u001dJ\u0013\u0010.\u001a\u00020%2\u0006\u0010+\u001a\u00028\u0001¢\u0006\u0002\u0010,J\u0014\u0010.\u001a\u00020%2\f\u0010-\u001a\b\u0012\u0004\u0012\u00028\u00010\u001dJ\u0006\u0010/\u001a\u00020%J\u001a\u00100\u001a\u00020%2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0000J\r\u00102\u001a\u00020\u0019H\u0000¢\u0006\u0002\b3R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR&\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u000fX\u0084\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0019\u0010\t\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017\u0082\u0001\u00045678¨\u00069"}, d2 = {"Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "K", "T", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "typeName", b.f42142b, "cacheFile", "Ljava/io/File;", "serializer", "Lkotlinx/serialization/KSerializer;", "(Ljava/lang/String;Ljava/io/File;Lkotlinx/serialization/KSerializer;)V", "getCacheFile", "()Ljava/io/File;", "data", b.f42142b, "getData", "()Ljava/util/Map;", "setData", "(Ljava/util/Map;)V", "getSerializer", "()Lkotlinx/serialization/KSerializer;", "getTypeName", "()Ljava/lang/String;", "count", b.f42142b, "get", "id", "(Ljava/lang/Object;)Lio/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", b.f42142b, "ids", "getAll", b.f42142b, "loadFromDisk", "loadFromDisk$sesame_lite_release", "newDataInstance", "onPostLoaded", b.f42142b, "dbVersion", b.f42142b, "loadedData", b.f42142b, "put", "entity", "(Lio/branch/engage/sesame_lite/internal/stores/InMemoryEntity;)V", "entities", "remove", "removeAll", "replaceData", "store", "writeToDisk", "writeToDisk$sesame_lite_release", k.O, "Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public abstract class InMemoryStore<K, T extends InMemoryEntity<K>> {

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
    public final long loadFromDisk$sesame_lite_release() throws IOException {
        BufferedInputStream bufferedInputStream;
        int i5;
        if (this.cacheFile == null || this.serializer == null) {
            return -1L;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
        if (!this.cacheFile.exists()) {
            return 0L;
        }
        try {
            bufferedInputStream = new BufferedInputStream(new FileInputStream(this.cacheFile), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                try {
                    i5 = bufferedInputStream.read(byteBufferAllocate.array());
                } finally {
                }
            } catch (Exception e3) {
                linkedHashMap.clear();
                l log = State.INSTANCE.getLog();
                if (log.getLevel().ordinal() >= 1) {
                    log.getWriter().error("SSML-InMemStore", e3);
                }
            }
        } catch (Exception e11) {
            l log2 = State.INSTANCE.getLog();
            if (log2.getLevel().ordinal() >= 1) {
                log2.getWriter().error("SSML-InMemStore", e11);
            }
        }
        if (i5 != 4) {
            throw new IOException("Bad version read size: expected=4, found=" + i5 + ": file=" + this.cacheFile.getName());
        }
        byteBufferAllocate.position(0);
        int i11 = byteBufferAllocate.getInt();
        if (i11 > 2) {
            l log3 = State.INSTANCE.getLog();
            if (log3.getLevel().ordinal() >= 2) {
                log3.getWriter().warn("SSML-InMemStore", "Database on disk newer: expected=2, found=" + i11 + ": file=" + this.cacheFile.getName() + ". Ignoring...");
            }
        }
        while (bufferedInputStream.read(byteBufferAllocate.array()) == 4) {
            byteBufferAllocate.position(0);
            int i12 = byteBufferAllocate.getInt();
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
            File tmpFile = File.createTempFile(this.cacheFile.getName(), null, this.cacheFile.getParentFile());
            Intrinsics.f(tmpFile, "tmpFile");
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(tmpFile), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            try {
                ByteBuffer byteBufferAllocate = ByteBuffer.allocate(4);
                byteBufferAllocate.position(0);
                byteBufferAllocate.putInt(2);
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
                        l log = State.INSTANCE.getLog();
                        if (log.getLevel().ordinal() >= 1) {
                            log.getWriter().error("SSML-InMemStore", e3);
                        }
                    }
                }
                Unit unit = Unit.f71706a;
                bufferedOutputStream.close();
                tmpFile.renameTo(this.cacheFile);
                return this.cacheFile.length();
            } finally {
            }
        } catch (IOException e11) {
            l log2 = State.INSTANCE.getLog();
            if (log2.getLevel().ordinal() < 1) {
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
