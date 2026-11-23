package app.morphe.extension.shared.settings;

public abstract class Setting<T> {
    public interface Availability {
        boolean isAvailable();
    }

    public final String key = null;

    protected Setting(String key, T defaultValue, Availability availability) {}

    public static Availability parent(BooleanSetting parent) { throw new UnsupportedOperationException(); }

    public abstract T get();
}
