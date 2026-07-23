package io.github.ilikeadofai.vocacolle.extension.settings;

/** User-selectable display languages with stable persistence values. */
public enum DisplayLanguage {
    SYSTEM("system"),
    JAPANESE("ja"),
    ENGLISH("en"),
    KOREAN("ko");

    private final String persistedValue;

    DisplayLanguage(String persistedValue) {
        this.persistedValue = persistedValue;
    }

    public String persistedValue() {
        return persistedValue;
    }

    public static DisplayLanguage fromPersistedValue(String value) {
        for (DisplayLanguage language : values()) {
            if (language.persistedValue.equals(value)) {
                return language;
            }
        }
        return SYSTEM;
    }
}