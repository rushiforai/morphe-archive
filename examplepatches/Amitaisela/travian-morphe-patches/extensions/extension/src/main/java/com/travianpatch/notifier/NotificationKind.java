package com.travianpatch.notifier;

/**
 * Every type of notification the user can switch on or off on the Notifications screen. The screen builds
 * its switches from this list, so adding a new alert type means adding one entry here.
 * Pure logic (no Android APIs) so it can be checked against sample data off-device.
 */
enum NotificationKind {
    BUILD_DONE("build_done", "Building finished",
            "A building or upgrade finished.", false, true),
    TRAINING_DONE("training_done", "Troop training finished",
            "A barracks, stable or other troop training finished.", false, true),
    ATTACK_INCOMING("attack_incoming", "Incoming attack",
            "An attack or raid is heading for one of your villages.", true, true),
    ATTACK_REMINDER("attack_reminder", "Attack about to land",
            "A second warning about a minute before an attack lands.", true, true),
    ATTACK_CALLED_OFF("attack_called_off", "Attack called off",
            "An incoming attack was cancelled before it landed.", true, true),
    ATTACK_WAVE("attack_wave", "Attacks landing together",
            "Several attacks will land on one village within about 2 minutes of each other.", true, true),
    RESOURCES_FULL("resources_full", "Storage almost full",
            "A warehouse or granary will be full within about 30 minutes.", false, true),
    CROP_NEGATIVE("crop_negative", "Crop running out",
            "A village eats more crop than it makes; troops starve when the granary is empty.", false, true),
    HERO_ADVENTURE("hero_adventure", "Hero: new adventure",
            "A new adventure is waiting for your hero.", false, true),
    HERO_HOME("hero_home", "Hero back home",
            "Your hero returned home from an adventure or mission.", false, true),
    HERO_HEALTH("hero_health", "Hero died or low health",
            "Your hero died, or its health dropped low.", false, true),
    REINFORCEMENT_ARRIVED("reinforcement_arrived", "Reinforcements arrived",
            "Troops sent to help you have arrived.", false, true),
    TROOPS_RETURNED("troops_returned", "Your troops are back",
            "Your own troops returned home.", false, true);

    /** Stable key used in storage; never rename an existing one. */
    final String id;
    final String label;
    final String description;
    /** True for the high-priority "Incoming attacks" channel, false for the normal timers channel. */
    final boolean attackChannel;
    final boolean defaultOn;

    NotificationKind(String id, String label, String description, boolean attackChannel, boolean defaultOn) {
        this.id = id;
        this.label = label;
        this.description = description;
        this.attackChannel = attackChannel;
        this.defaultOn = defaultOn;
    }

    static NotificationKind fromId(String id) {
        for (NotificationKind kind : values()) {
            if (kind.id.equals(id)) {
                return kind;
            }
        }
        return null;
    }

    /** Arrival keys start with "return:" (own troops back) or "reinforcement:". */
    static NotificationKind forArrivalKey(String key) {
        return key != null && key.startsWith("return:") ? TROOPS_RETURNED : REINFORCEMENT_ARRIVED;
    }

    /** Tracked queue kinds are "build", "train", "stable" or "barracks". */
    static NotificationKind forTrackedKind(String kind) {
        return "build".equals(kind) ? BUILD_DONE : TRAINING_DONE;
    }
}
