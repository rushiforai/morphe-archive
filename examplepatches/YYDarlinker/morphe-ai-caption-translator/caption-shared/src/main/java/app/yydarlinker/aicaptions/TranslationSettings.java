package app.yydarlinker.aicaptions;

/** Immutable provider input. Never persisted, logged, or coupled to settings widgets. */
public final class TranslationSettings {
    final boolean enabled;
    final String baseUrl, model, prompt, apiKey, preferenceProvenance, effectivePreference;

    public TranslationSettings(
            boolean enabled,
            String endpoint,
            String model,
            String prompt,
            String key,
            String provenance) {
        this.enabled = enabled;
        baseUrl = endpoint;
        this.model = model;
        this.prompt = prompt;
        apiKey = key == null ? "" : key;
        preferenceProvenance = provenance;
        effectivePreference =
                "program_default".equals(provenance)
                        ? "Translate faithfully, naturally and concisely in the selected target"
                              + " language; preserve names, numbers, tone and necessary"
                              + " punctuation; do not add explanations."
                        : prompt;
    }

    boolean ready() {
        return enabled && !apiKey.isEmpty() && model != null && !model.trim().isEmpty();
    }

    String fingerprint() {
        return baseUrl + '\n' + model + '\n' + prompt;
    }
}
