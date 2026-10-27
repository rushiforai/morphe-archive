package android.util;
public final class SparseIntArray {
    private final java.util.Map<Integer, Integer> values = new java.util.HashMap<>();
    public int get(int key, int fallback) { return values.getOrDefault(key, fallback); }
    public void put(int key, int value) { values.put(key, value); }
}
