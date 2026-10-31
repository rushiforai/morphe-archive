package app.badfella.extension.ticktick.locallists;

/** Local mapping from a real, cloud-owned task SID to a local list UUID. */
public final class Membership {
    private final String taskSid;
    private final String listUuid;
    private final long assignedAt;

    public Membership(String taskSid, String listUuid, long assignedAt) {
        this.taskSid = taskSid;
        this.listUuid = listUuid;
        this.assignedAt = assignedAt;
    }

    public String getTaskSid() {
        return taskSid;
    }

    public String getListUuid() {
        return listUuid;
    }

    public long getAssignedAt() {
        return assignedAt;
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof Membership)) return false;
        Membership that = (Membership) other;
        return assignedAt == that.assignedAt
                && taskSid.equals(that.taskSid)
                && listUuid.equals(that.listUuid);
    }

    @Override
    public int hashCode() {
        int result = taskSid.hashCode();
        result = 31 * result + listUuid.hashCode();
        result = 31 * result + (int) (assignedAt ^ (assignedAt >>> 32));
        return result;
    }

    @Override
    public String toString() {
        return "Membership{" + taskSid + " -> " + listUuid + "}";
    }
}
