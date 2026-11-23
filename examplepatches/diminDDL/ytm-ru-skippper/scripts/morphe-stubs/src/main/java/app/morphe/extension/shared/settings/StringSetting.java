package app.morphe.extension.shared.settings;

public class StringSetting extends Setting<String> {
    public StringSetting(String key, String defaultValue) { super(key, defaultValue, null); }

    public StringSetting(String key, String defaultValue, Availability availability) { super(key, defaultValue, availability); }

    @Override
    public String get() { throw new UnsupportedOperationException(); }
}
