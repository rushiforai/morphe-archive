package io.branch.engage.sesame_lite.internal.stores;

import io.branch.engage.sesame_lite.internal.IdHash;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\bf\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001R\u0014\u0010\u0003\u001a\u00020\u00028VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0002X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\u0005¨\u0006\b"}, d2 = {"Lio/branch/engage/sesame_lite/internal/stores/IdHashInMemoryEntity;", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", "Lio/branch/engage/sesame_lite/internal/IdHash;", "dbId", "getDbId", "()Lio/branch/engage/sesame_lite/internal/IdHash;", "idHash", "getIdHash", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public interface IdHashInMemoryEntity extends InMemoryEntity<IdHash> {

    @Metadata(k = 3, mv = {1, 7, 1}, xi = 48)
    public static final class DefaultImpls {
        @NotNull
        public static IdHash getDbId(@NotNull IdHashInMemoryEntity idHashInMemoryEntity) {
            return idHashInMemoryEntity.getIdHash();
        }
    }

    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryEntity
    @NotNull
    IdHash getDbId();

    @NotNull
    IdHash getIdHash();
}
