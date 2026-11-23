path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/writingtools/GboardAiWritingToolsRuntime.java'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()

target = """            if (GboardRoundedKeysSettings.isRoundedKeyPhenotypeFlag(flagName)
                    && originalResult instanceof Boolean) {
                if (GboardRoundedKeysSettings.isEnabled(context)) {
                    if (!Boolean.TRUE.equals(originalResult)) {
                        logLimited(FLAG_LOG_COUNT,
                                "flag=" + flagName
                                        + ", original=" + describe(originalResult)
                                        + ", enforced=" + describe(Boolean.TRUE));
                    }
                    return Boolean.TRUE;
                }
            }"""

replacement = target + """
            if ("enable_frequent_emoji_recent_tab".equals(flagName)
                    && originalResult instanceof Boolean) {
                try {
                    android.content.SharedPreferences patchesPrefs =
                            com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettings.preferences(context);
                    if (patchesPrefs != null && patchesPrefs.getBoolean("frequently_used_emojis_enabled", false)) {
                        return Boolean.TRUE;
                    } else {
                        return Boolean.FALSE;
                    }
                } catch (Throwable ignored) {
                }
            }
            if ("enable_emoji_frequent_recent_switch_option".equals(flagName)
                    && originalResult instanceof Boolean) {
                return Boolean.TRUE;
            }"""

norm_text = text.replace('\r\n', '\n')
norm_target = target.replace('\r\n', '\n')
norm_rep = replacement.replace('\r\n', '\n')

if norm_target in norm_text:
    norm_text = norm_text.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_text)
    print("Patched GboardAiWritingToolsRuntime emoji flags successfully!")
else:
    print("Target not found in GboardAiWritingToolsRuntime!")
