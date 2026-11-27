.class public Lkew;
.super Ljava/lang/Object;

# Fixture stand-in for the stock prompt owner: Lkew;->b(Ljava/lang/Object;)V
.method public static b(Ljava/lang/Object;)V
    .locals 1

    const-string/jumbo v0, "<fixture_system_role>\n1. SCRIPT GATE (fixture prompt - authored test data, not Google content)\n</fixture_system_role>\n- Branch A (Latin/Roman Keyboards):\n   * Mandatory Indic Romanization (Anti-Gravity Gate): If ASR outputs ANY Indian/Indic script - specifically Devanagari, Bengali, Gujarati - while on a Latin keyboard, you MUST phonetically transliterate (Romanize) ENTIRE text into ASCII Latin characters. Do this even if 100% of input is physically written in native Indic script!\n     - If input text already contains all latin characters, then NEVER revert Romanized Indic words back into native scripts!\n   * Universal Latin & Non-Indic Preservation: keep Latin exact.\n- Branch B (Single Native Keyboards): transliterate stray Latin.\nEnabled languages: {ENABLED_LANGUAGES}\nOverride rule: {HINGLISH_OVERRIDE_RULE}\n"
    invoke-static {v0}, Lkew;->a(Ljava/lang/String;)V
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 0
    return-void
.end method
