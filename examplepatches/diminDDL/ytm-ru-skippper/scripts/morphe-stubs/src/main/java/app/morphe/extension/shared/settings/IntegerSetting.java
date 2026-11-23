package app.morphe.extension.shared.settings;

public class IntegerSetting extends Setting<Integer> {
    public IntegerSetting(String key, Integer defaultValue) { super(key, defaultValue, null); }

    public IntegerSetting(String key, Integer defaultValue, Availability availability) { super(key, defaultValue, availability); }

    @Override
    public Integer get() { throw new UnsupportedOperationException(); }
}
