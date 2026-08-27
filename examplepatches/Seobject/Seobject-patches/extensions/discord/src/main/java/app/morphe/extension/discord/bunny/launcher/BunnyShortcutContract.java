package app.morphe.extension.discord.bunny.launcher;

/** Fixed, allow-listed operations accepted by the launcher dispatcher. */
public final class BunnyShortcutContract {
    public static final String ID_SAFE_MODE = "bunny-safe-mode";
    public static final String ID_RECOVERY_SETTINGS = "bunny-recovery-settings";
    public static final String ID_SETTINGS = "bunny-settings";
    public static final String ACTION_SAFE_MODE = "app.morphe.bunny.action.SAFE_MODE";
    public static final String ACTION_RECOVERY_SETTINGS = "app.morphe.bunny.action.RECOVERY_SETTINGS";
    public static final String ACTION_SETTINGS = "app.morphe.bunny.action.SETTINGS";
    public static final String TARGET_RECOVERY = "recovery";
    public static final String TARGET_SETTINGS = "settings";
    private BunnyShortcutContract() {}
}
