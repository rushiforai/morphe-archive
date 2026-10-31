package nova.branch.engage.sesame_lite.internal.stores;

import aa.y;
import b70.g;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.collections.c;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import nova.branch.engage.sesame_lite.internal.IdHash;
import nova.branch.engage.sesame_lite.internal.LinkEntity;
import nova.branch.engage.sesame_lite.internal.State;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r80.d;
import r80.o;
import r80.p;
import t70.a0;

@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0010%\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0016\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\r\u0018\u0000 02\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u00010B\u0011\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0000H\u0016¢\u0006\u0004\b\b\u0010\tJ+\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\fH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001d\u0010\u0015\u001a\u00020\u00142\u000e\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0011¢\u0006\u0004\b\u0015\u0010\u0016JS\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00030\u001e2\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\u000e\b\u0002\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00192\u0010\b\u0002\u0010\u001c\u001a\n\u0012\u0004\u0012\u00020\u001b\u0018\u00010\u001a2\u0010\b\u0002\u0010\u001d\u001a\n\u0012\u0004\u0012\u00020\u001b\u0018\u00010\u001a¢\u0006\u0004\b\u001f\u0010 J7\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00030\u001e2\u0006\u0010!\u001a\u00020\u001b2\b\b\u0002\u0010\"\u001a\u00020\u00142\u0010\b\u0002\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0019¢\u0006\u0004\b\u001f\u0010#JE\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00030\u001e2\u0006\u0010!\u001a\u00020\u001b2\b\b\u0002\u0010\"\u001a\u00020\u00142\u0010\b\u0002\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u00192\f\u0010%\u001a\b\u0012\u0004\u0012\u00020$0\u0011¢\u0006\u0004\b\u001f\u0010&J'\u0010(\u001a\u0004\u0018\u00010\u00032\u0006\u0010!\u001a\u00020\u001b2\u0006\u0010\"\u001a\u00020\u00142\u0006\u0010'\u001a\u00020\u0012¢\u0006\u0004\b(\u0010)J!\u0010+\u001a\u0004\u0018\u00010\u00032\u0006\u0010!\u001a\u00020\u001b2\b\b\u0002\u0010*\u001a\u00020\u0014¢\u0006\u0004\b+\u0010,J\u0019\u0010.\u001a\u0004\u0018\u00010\u00032\b\u0010-\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b.\u0010/¨\u00061"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "Lnova/branch/engage/sesame_lite/internal/IdHash;", "Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "Ljava/io/File;", "cacheFile", "<init>", "(Ljava/io/File;)V", "newDataInstance", "()Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", b.f42142b, "dbVersion", b.f42142b, "loadedData", b.f42142b, "onPostLoaded", "(ILjava/util/Map;)V", b.f42142b, "Lr80/d;", "types", b.f42142b, "count", "([Lr80/d;)J", b.f42142b, "userSerials", "Ljava/util/EnumSet;", b.f42142b, b.f42142b, "groups", UserMetadata.KEYDATA_FILENAME, b.f42142b, "get", "([JLjava/util/EnumSet;Ljava/util/Set;Ljava/util/Set;)Ljava/util/List;", "packageName", "userSerial", "(Ljava/lang/String;JLjava/util/EnumSet;)Ljava/util/List;", "Lkotlin/UByte;", "subtypes", "(Ljava/lang/String;JLjava/util/EnumSet;[Lkotlin/UByte;)Ljava/util/List;", TTConst.TRACK_TYPE, "getFirst", "(Ljava/lang/String;JLr80/d;)Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "user", "getDefaultComponent", "(Ljava/lang/String;J)Lnova/branch/engage/sesame_lite/internal/LinkEntity;", "child", "getParentApp", "(Lnova/branch/engage/sesame_lite/internal/LinkEntity;)Lnova/branch/engage/sesame_lite/internal/LinkEntity;", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class LinkStore extends InMemoryStore<IdHash, LinkEntity> {

    @NotNull
    public static final String TYPE = "links";
    private static final EnumSet<d> ALL_LINK_TYPES = EnumSet.allOf(d.class);

    public LinkStore(@Nullable File file) {
        super("links", file, LinkEntity.INSTANCE.serializer(), null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ List get$default(LinkStore linkStore, long[] jArr, EnumSet enumSet, Set set, Set set2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            jArr = null;
        }
        if ((i5 & 2) != 0) {
            enumSet = ALL_LINK_TYPES;
        }
        if ((i5 & 4) != 0) {
            set = null;
        }
        if ((i5 & 8) != 0) {
            set2 = null;
        }
        return linkStore.get(jArr, (EnumSet<d>) enumSet, (Set<String>) set, (Set<String>) set2);
    }

    public static /* synthetic */ LinkEntity getDefaultComponent$default(LinkStore linkStore, String str, long j11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = -1;
        }
        return linkStore.getDefaultComponent(str, j11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean onPostLoaded$lambda$1(Map.Entry it) {
        Intrinsics.g(it, "it");
        return ((IdHash) it.getKey()).getType() == d.f85660g;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean onPostLoaded$lambda$2(Function1 function1, Object obj) {
        return ((Boolean) function1.invoke(obj)).booleanValue();
    }

    public final long count(@Nullable d[] types) {
        int size;
        if (types == null) {
            size = getData().size();
        } else {
            Collection<LinkEntity> collectionValues = getData().values();
            int i5 = 0;
            if (!(collectionValues instanceof Collection) || !collectionValues.isEmpty()) {
                Iterator<T> it = collectionValues.iterator();
                while (it.hasNext()) {
                    if (c.o0(((LinkEntity) it.next()).getType(), types) && (i5 = i5 + 1) < 0) {
                        ul.b.d0();
                        throw null;
                    }
                }
            }
            size = i5;
        }
        return size;
    }

    @NotNull
    public final List<LinkEntity> get(@Nullable long[] userSerials, @NotNull EnumSet<d> types, @Nullable Set<String> groups, @Nullable Set<String> keys) {
        Intrinsics.g(types, "types");
        if (userSerials == null && types == ALL_LINK_TYPES && groups == null && keys == null) {
            return getAll();
        }
        boolean z11 = types.size() >= d.values().length;
        Collection<LinkEntity> collectionValues = getData().values();
        ArrayList arrayList = new ArrayList();
        for (Object obj : collectionValues) {
            LinkEntity linkEntity = (LinkEntity) obj;
            if (keys == null || keys.contains(linkEntity.getTypeSpecificKey())) {
                if (groups == null || groups.contains(linkEntity.getGroupId())) {
                    if (z11 || types.contains(linkEntity.getType())) {
                        if (userSerials == null || linkEntity.getUserSerial() == -1 || c.s0(userSerials, linkEntity.getUserSerial())) {
                            arrayList.add(obj);
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    @Nullable
    public final LinkEntity getDefaultComponent(@NotNull String packageName, long user) {
        Intrinsics.g(packageName, "packageName");
        return (LinkEntity) g.Y0(get(packageName, user, EnumSet.of(d.f85655b)));
    }

    @Nullable
    public final LinkEntity getFirst(@NotNull String packageName, long userSerial, @NotNull d type) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(type, "type");
        return (LinkEntity) g.Y0(get(packageName, userSerial, EnumSet.of(type)));
    }

    @Nullable
    public final LinkEntity getParentApp(@Nullable LinkEntity child) {
        Object obj = null;
        if (child == null) {
            return null;
        }
        for (Object obj2 : getData().values()) {
            LinkEntity linkEntity = (LinkEntity) obj2;
            if (linkEntity.getType() == d.f85655b && Intrinsics.b(linkEntity.getGroupId(), child.getGroupId()) && (child.getUserSerial() == -1 || linkEntity.getUserSerial() == child.getUserSerial())) {
                obj = obj2;
                break;
            }
        }
        return (LinkEntity) obj;
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryStore
    public void onPostLoaded(int dbVersion, @NotNull Map<IdHash, LinkEntity> loadedData) {
        Intrinsics.g(loadedData, "loadedData");
        super.onPostLoaded(dbVersion, loadedData);
        int i5 = 2;
        if (dbVersion <= 1) {
            State state = State.INSTANCE;
            p log = state.getLog();
            int iOrdinal = log.getLevel().ordinal();
            o oVar = o.f85697a;
            if (iOrdinal >= 3) {
                log.getWriter().debug("SSML-InMemStore", "Cleaning up LinkStore data post loaded, db version=" + dbVersion + ": removing contact records");
            }
            int size = loadedData.size();
            loadedData.entrySet().removeIf(new y(new a0(i5), 4));
            p log2 = state.getLog();
            if (log2.getLevel().ordinal() >= 3) {
                log2.getWriter().debug("SSML-InMemStore", "Removed " + (size - loadedData.size()) + " contact records from LinkStore");
            }
        }
        if (dbVersion <= 2) {
            p log3 = State.INSTANCE.getLog();
            int iOrdinal2 = log3.getLevel().ordinal();
            o oVar2 = o.f85697a;
            if (iOrdinal2 >= 3) {
                log3.getWriter().debug("SSML-InMemStore", "Computing searchable label for LinkStore entities post loaded, db version=" + dbVersion);
            }
            Iterator<T> it = loadedData.values().iterator();
            while (it.hasNext()) {
                ((LinkEntity) it.next()).migrateSearchableLabels();
            }
            p log4 = State.INSTANCE.getLog();
            int iOrdinal3 = log4.getLevel().ordinal();
            o oVar3 = o.f85697a;
            if (iOrdinal3 >= 3) {
                log4.getWriter().debug("SSML-InMemStore", "Migrated " + loadedData.size() + " link records from LinkStore to contain searchable labels");
            }
        }
    }

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryStore
    @NotNull
    public LinkStore newDataInstance() {
        LinkStore linkStore = new LinkStore(getCacheFile());
        linkStore.setData(getData());
        return linkStore;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ List get$default(LinkStore linkStore, String str, long j11, EnumSet enumSet, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = -1;
        }
        if ((i5 & 4) != 0) {
            enumSet = null;
        }
        return linkStore.get(str, j11, enumSet);
    }

    public static /* synthetic */ List get$default(LinkStore linkStore, String str, long j11, EnumSet enumSet, UByte[] uByteArr, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            j11 = -1;
        }
        long j12 = j11;
        if ((i5 & 4) != 0) {
            enumSet = null;
        }
        return linkStore.get(str, j12, (EnumSet<d>) enumSet, uByteArr);
    }

    @NotNull
    public final List<LinkEntity> get(@NotNull String packageName, long userSerial, @Nullable EnumSet<d> types) {
        Intrinsics.g(packageName, "packageName");
        Collection<LinkEntity> collectionValues = getData().values();
        ArrayList arrayList = new ArrayList();
        for (Object obj : collectionValues) {
            LinkEntity linkEntity = (LinkEntity) obj;
            if (Intrinsics.b(linkEntity.getPackageName(), packageName) && (userSerial == -1 || linkEntity.getUserSerial() == -1 || linkEntity.getUserSerial() == userSerial)) {
                if (types == null || types.contains(linkEntity.getType())) {
                    arrayList.add(obj);
                }
            }
        }
        return arrayList;
    }

    @NotNull
    public final List<LinkEntity> get(@NotNull String packageName, long userSerial, @Nullable EnumSet<d> types, @NotNull UByte[] subtypes) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(subtypes, "subtypes");
        Collection<LinkEntity> collectionValues = getData().values();
        ArrayList arrayList = new ArrayList();
        for (Object obj : collectionValues) {
            LinkEntity linkEntity = (LinkEntity) obj;
            if (Intrinsics.b(linkEntity.getPackageName(), packageName) && (userSerial == -1 || linkEntity.getUserSerial() == -1 || linkEntity.getUserSerial() == userSerial)) {
                if (types == null || types.contains(linkEntity.getType())) {
                    if (c.o0(new UByte(linkEntity.getIdHash().m447getSubtypew2LRezQ()), subtypes)) {
                        arrayList.add(obj);
                    }
                }
            }
        }
        return arrayList;
    }
}
