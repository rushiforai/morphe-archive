# R8 rules for the anti-resale extension.
#
# The extension is not referenced from inside its own module: the patched host calls
# AntiResaleAlert.onAppCreate(Application) through an injected invoke-static, so R8 sees no usage and
# would strip everything without this rule.

-keep class app.ra1nify.f4t.extension.** { *; }

# The entry point is also called by descriptor from the patch, so keep the exact name.
-keepclassmembers class app.ra1nify.f4t.extension.AntiResaleAlert {
    public static void onAppCreate(android.app.Application);
}
