import java.util.Arrays;

public final class otk {
    public final oth c;
    public final oud[] d;
    public final String[] n;

    public otk(oti builder) {
        this(builder.a, builder.b, builder.c);
    }

    otk(oth type, oud[] entries, String[] labels) {
        c = type;
        d = entries;
        n = labels;
    }

    @Override
    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof otk)) {
            return false;
        }
        otk that = (otk) other;
        return c == that.c && Arrays.equals(d, that.d) && Arrays.equals(n, that.n);
    }

    @Override
    public int hashCode() {
        int result = c != null ? c.hashCode() : 0;
        result = 31 * result + Arrays.hashCode(d);
        return 31 * result + Arrays.hashCode(n);
    }
}
