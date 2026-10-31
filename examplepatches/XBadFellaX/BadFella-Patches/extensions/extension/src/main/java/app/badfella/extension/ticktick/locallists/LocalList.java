package app.badfella.extension.ticktick.locallists;

/** A local-only list definition. It is never written to TickTick's project tables. */
public final class LocalList {
    private final String uuid;
    private final String name;
    private final long sortOrder;
    private final long createdAt;
    private final long updatedAt;

    public LocalList(String uuid, String name, long sortOrder, long createdAt, long updatedAt) {
        this.uuid = uuid;
        this.name = name;
        this.sortOrder = sortOrder;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public String getUuid() {
        return uuid;
    }

    public String getName() {
        return name;
    }

    public long getSortOrder() {
        return sortOrder;
    }

    public long getCreatedAt() {
        return createdAt;
    }

    public long getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof LocalList)) return false;
        LocalList that = (LocalList) other;
        return sortOrder == that.sortOrder
                && createdAt == that.createdAt
                && updatedAt == that.updatedAt
                && uuid.equals(that.uuid)
                && name.equals(that.name);
    }

    @Override
    public int hashCode() {
        int result = uuid.hashCode();
        result = 31 * result + name.hashCode();
        result = 31 * result + (int) (sortOrder ^ (sortOrder >>> 32));
        result = 31 * result + (int) (createdAt ^ (createdAt >>> 32));
        result = 31 * result + (int) (updatedAt ^ (updatedAt >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "LocalList{" + uuid + ", " + name + ", " + sortOrder + "}";
    }
}
