import android.content.Context;

public final class pnp {
    private static final pnp INSTANCE = new pnp();

    private boolean simplifiedEnabled;
    private boolean throwOnWrite;
    private int writeAttempts;

    public static pnp N(Context context) {
        return context == null ? null : INSTANCE;
    }

    public boolean at(int resourceId) {
        return simplifiedEnabled;
    }

    public void aa(int resourceId, Object value) {
        writeAttempts++;
        if (throwOnWrite) {
            throw new IllegalStateException("fixture write failure");
        }
        simplifiedEnabled = ((Boolean) value).booleanValue();
    }

    public static void reset() {
        INSTANCE.simplifiedEnabled = false;
        INSTANCE.throwOnWrite = false;
        INSTANCE.writeAttempts = 0;
    }

    public static pnp instance() {
        return INSTANCE;
    }

    public void setSimplifiedEnabled(boolean enabled) {
        simplifiedEnabled = enabled;
    }

    public boolean isSimplifiedEnabled() {
        return simplifiedEnabled;
    }

    public void setThrowOnWrite(boolean shouldThrow) {
        throwOnWrite = shouldThrow;
    }

    public int getWriteAttempts() {
        return writeAttempts;
    }
}
