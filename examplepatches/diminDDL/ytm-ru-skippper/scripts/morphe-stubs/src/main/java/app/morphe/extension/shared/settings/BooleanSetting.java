package app.morphe.extension.shared.settings;

public class BooleanSetting extends Setting<Boolean> {
    public BooleanSetting(String key, Boolean defaultValue) { super(key, defaultValue, null); }

    public BooleanSetting(String key, Boolean defaultValue, Availability availability) { super(key, defaultValue, availability); }

    @Override
    public Boolean get() { throw new UnsupportedOperationException(); }
}
