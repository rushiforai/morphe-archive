package android.util;

import java.util.TreeMap;

public class SparseArray<E> {
    private final TreeMap<Integer, E> map = new TreeMap<>();

    public SparseArray() {}
    public SparseArray(int initialCapacity) {}

    public E get(int key) { return map.get(key); }
    public E get(int key, E valueIfKeyNotFound) { return map.getOrDefault(key, valueIfKeyNotFound); }
    public void put(int key, E value) { map.put(key, value); }
    public void append(int key, E value) { map.put(key, value); }
    public void delete(int key) { map.remove(key); }
    public void remove(int key) { map.remove(key); }
    public void clear() { map.clear(); }
    public int size() { return map.size(); }
}
