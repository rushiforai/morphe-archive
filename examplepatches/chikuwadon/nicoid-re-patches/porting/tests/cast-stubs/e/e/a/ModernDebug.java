package e.e.a;
public final class ModernDebug {
    public static final java.util.List<String> messages = java.util.Collections.synchronizedList(new java.util.ArrayList<>());
    public static void record(String message) { messages.add(message); }
}
