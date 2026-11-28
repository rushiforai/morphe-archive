-dontobfuscate
-dontoptimize
-keepattributes *
# Referenced and, for some stubs, rebound from patch bytecode after shrinking.
-keep interface app.yydarlinker.aicaptions.host.NativeCaptionBridge$CaptionModel { *; }
-keep class app.yydarlinker.aicaptions.host.AiCaptionHook {
    public static void on*(...);
}
-keep class app.yydarlinker.aicaptions.host.NativeCaptionBridge {
    public static *;
}
-keep class app.yydarlinker.aicaptions.host.CaptionAddonSupport {
    public static *;
}
-keep class app.yydarlinker.aicaptions.settings.CaptionQuickToggle {
    public static *;
}
# The verifier reads the shipped identity from DEX even when callers inline the constants.
-keep class app.yydarlinker.extension.BuildConfig {
    public static final java.lang.String CAPTION_PATCH_VERSION;
    public static final java.lang.String CAPTION_BUILD_ID;
}
# Android PreferenceInflater calls these constructors from generated settings XML.
-keep class app.yydarlinker.aicaptions.settings.CaptionSettingsPreference {
    public <init>(...);
}
-keep class app.yydarlinker.aicaptions.settings.CaptionSettingsSwitch {
    public <init>(...);
}
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier
