package android.os;
public final class UserHandle {
    private final int id;
    public UserHandle(int id) { this.id = id; }
    @Override public boolean equals(Object o) { return o instanceof UserHandle && ((UserHandle)o).id == id; }
    @Override public int hashCode() { return id; }
}
