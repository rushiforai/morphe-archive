package samsungcompat.sync;

import java.util.Objects;

/** One note as published in a device manifest. Tombstones keep their last hash. */
public final class NoteRecord {
    public final String uuid;
    public final String hash;
    public final VersionVector version;
    public final String title;
    public final String categoryUuid;
    public final long createdAt;
    public final long modifiedAt;
    public final boolean favorite;
    public final boolean deleted;
    public final long deletedAt;

    public NoteRecord(String uuid, String hash, VersionVector version, String title,
                      String categoryUuid, long createdAt, long modifiedAt, boolean favorite,
                      boolean deleted, long deletedAt) {
        this.uuid = Objects.requireNonNull(uuid, "uuid");
        this.hash = hash;
        this.version = version == null ? VersionVector.EMPTY : version;
        this.title = title == null ? "" : title;
        this.categoryUuid = categoryUuid == null ? "" : categoryUuid;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.favorite = favorite;
        this.deleted = deleted;
        this.deletedAt = deletedAt;
    }

    public NoteRecord withVersion(VersionVector v) {
        return new NoteRecord(uuid, hash, v, title, categoryUuid, createdAt, modifiedAt,
            favorite, deleted, deletedAt);
    }

    public NoteRecord asTombstone(long when) {
        return new NoteRecord(uuid, hash, version, title, categoryUuid, createdAt, modifiedAt,
            favorite, true, when);
    }

    /** Same content and metadata, ignoring version and timestamps. The title is inside the note, so the hash covers it. */
    public boolean sameState(NoteRecord other) {
        return other != null
            && Objects.equals(hash, other.hash)
            && deleted == other.deleted
            && favorite == other.favorite
            && categoryUuid.equals(other.categoryUuid);
    }

    @Override
    public String toString() {
        return uuid + (deleted ? "[deleted]" : "") + " hash=" + hash + " v=" + version;
    }
}
