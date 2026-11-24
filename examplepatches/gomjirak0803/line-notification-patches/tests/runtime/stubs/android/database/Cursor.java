package android.database;

import java.io.Closeable;
import java.util.List;

public class Cursor implements Closeable {
    private final List<Object[]> rows;
    private int index = -1;

    public Cursor(List<Object[]> rows) {
        this.rows = rows;
    }

    public boolean moveToFirst() {
        index = rows.isEmpty() ? -1 : 0;
        return !rows.isEmpty();
    }

    public boolean moveToNext() {
        index++;
        return index >= 0 && index < rows.size();
    }

    public boolean isNull(int columnIndex) {
        return rows.get(index)[columnIndex] == null;
    }

    public String getString(int columnIndex) {
        Object v = rows.get(index)[columnIndex];
        return v == null ? null : v.toString();
    }

    public int getInt(int columnIndex) {
        Object v = rows.get(index)[columnIndex];
        return v instanceof Number ? ((Number) v).intValue() : Integer.parseInt(String.valueOf(v));
    }

    public long getLong(int columnIndex) {
        Object v = rows.get(index)[columnIndex];
        return v instanceof Number ? ((Number) v).longValue() : Long.parseLong(String.valueOf(v));
    }

    @Override public void close() {}
}
