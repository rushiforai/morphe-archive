package android.os;

public final class Process {
    public static final int THREAD_PRIORITY_BACKGROUND = 10;
    private Process() {}
    public static void setThreadPriority(int priority) {}
    public static int myPid() {
        return (int) ProcessHandle.current().pid();
    }
}
