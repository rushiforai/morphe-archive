package app.morphe.extension.shared.settings;
/** Independent signature fixture. Notification happens after the Enum value changes, as in official save. */
public class EnumSetting extends Setting {
    private Enum<?> value=AppLanguage.DEFAULT;
    public Enum<?> get(){return value;}
    public void save(Object selected){value=(Enum<?>)selected;if(preferences.preferences!=null)preferences.preferences.edit().putString(key,value.name()).apply();}
}
