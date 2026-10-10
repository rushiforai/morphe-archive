package app.morphe.extension.shared.settings;

import static java.lang.Boolean.TRUE;

public class SharedSettings extends BaseSettings {
    public static final IntegerSetting CHECK_ENVIRONMENT_WARNINGS_ISSUED = new IntegerSetting("tada_check_environment_warnings_issued", 0, true, false);

    /** Use the icons declared in the preferences created during patching. If no icons or styles are declared then this setting does nothing. */
    public static final BooleanSetting SHOW_MENU_ICONS = new BooleanSetting("tada_show_menu_icons", TRUE, true);

    /** Name shown for the TADa settings: a preset entry value, or a name the user typed. */
    public static final StringSetting SETTINGS_NAME = new StringSetting("tada_settings_name", "DEFAULT", true);

    public static final StringSetting EXPERIMENTAL_APP_CONFIRMED = new StringSetting("tada_experimental_app_target_confirmed", "", false, false);

    /** If the GmsCore battery optimization dialogs should be shown. */
    public static final BooleanSetting GMS_CORE_BATTERY_OPTIMIZATION_DIALOG = new BooleanSetting("tada_gms_core_battery_optimization_dialog", TRUE, true, "tada_gms_core_battery_optimization_dialog_user_dialog_message");

}
