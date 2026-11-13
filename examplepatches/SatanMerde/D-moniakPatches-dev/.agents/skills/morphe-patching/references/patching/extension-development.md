# Extension Development — Java Runtime Code

How to write Java extensions that run inside the patched app. Extensions handle complex logic that's too much for inline smali.

## Architecture

```
Patch (Kotlin, compile-time)          Extension (Java, runtime)
├── Finds target method               ├── Contains complex logic
├── Injects invoke-static call  ──→   ├── Reads settings
└── Modifies bytecode                 ├── Accesses Android APIs
                                      └── Returns result to patched code
```

## Extension Pattern — Simple Boolean Check

**Extension (Java):**
```java
@SuppressWarnings("unused")
public class MyPatch {
    private static final boolean IS_ENABLED = Settings.MY_SETTING.get();

    // Injection point — called from patched bytecode
    public static boolean isEnabled() {
        return IS_ENABLED;
    }
}
```

**Patch (Kotlin):**
```kotlin
val myPatch = bytecodePatch(name = "My Feature") {
    dependsOn(sharedExtensionPatch)
    execute {
        TargetFingerprint.method.addInstructionsWithLabels(0, """
            invoke-static { }, Lapp/morphe/extension/MyPatch;->isEnabled()Z
            move-result v0
            if-eqz v0, :disabled
            return-void
            :disabled
            nop
        """)
    }
}
```

## Extension Pattern — List Filtering (Reddit Ads)

Filter items from a list at runtime:

```java
public final class HideAdsPatch {
    private static final boolean HIDE_POST_ADS = Settings.HIDE_POST_ADS.get();

    // Injection point
    public static List<?> hideOldPostAds(List<?> list) {
        if (HIDE_POST_ADS) {
            List<Object> filtered = new ArrayList<>();
            for (Object item : list) {
                if (!(item instanceof ILink iLink) || !iLink.getPromoted()) {
                    filtered.add(item);
                }
            }
            return filtered;
        }
        return list;
    }

    // Injection point — simpler version
    public static List<?> hideNewPostAds(List<?> list) {
        return HIDE_POST_ADS ? null : list;
    }
}
```

## Extension Pattern — Value Override with Fallback

Override a value but fall back to original if setting is off:

```java
public class BackgroundPlaybackPatch {
    private static final boolean ENABLED = Settings.REMOVE_BACKGROUND_RESTRICTIONS.get();

    // Injection point — override boolean
    public static boolean enableFeatureFlag(boolean original) {
        if (ENABLED) return true;
        return original;
    }

    // Injection point — override with complex logic
    public static boolean isBackgroundPlaybackAllowed(boolean original) {
        if (!ENABLED) return original;
        if (original) return true;
        if (ShortsPlayerState.isOpen()) return false;
        PlayerType current = PlayerType.getCurrent();
        return !current.isNoneOrHidden();
    }
}
```

## Extension Pattern — String Override (Video Ads)

Spoof a string value to trick the app:

```java
public class VideoAdsPatch {
    private static final boolean HIDE_ADS = Settings.HIDE_VIDEO_ADS.get();

    // Injection point — return modified string
    public static String hideVideoAds(String osName) {
        return HIDE_ADS ? "Android Automotive" : osName;
    }
}
```

## Extension Pattern — Deep Signature Spoof (Reddit)

Replace the entire PackageInfo.CREATOR to intercept signature checks at the system level:

```java
public class SpoofSignaturePatch extends Application {
    static {
        killPM();  // Run before anything else
    }

    private static void killPM() {
        String packageName = "com.reddit.frontpage";
        Signature fakeSignature = new Signature(Base64.decode(CERT_DATA, Base64.DEFAULT));

        // Replace PackageInfo.CREATOR with custom one that spoofs signatures
        Parcelable.Creator<PackageInfo> creator = new Parcelable.Creator<>() {
            public PackageInfo createFromParcel(Parcel source) {
                PackageInfo info = originalCreator.createFromParcel(source);
                if (info.packageName.equals(packageName)) {
                    info.signatures[0] = fakeSignature;
                    // Also spoof signingInfo for newer Android
                    info.signingInfo.getApkContentsSigners()[0] = fakeSignature;
                }
                return info;
            }
        };

        // Replace the static CREATOR field
        findField(PackageInfo.class, "CREATOR").set(null, creator);

        // Clear caches so the spoofed creator is used
        HiddenApiBypass.addHiddenApiExemptions("Landroid/os/Parcel;", ...);
        clearCache(PackageManager.class, "sPackageInfoCache");
        clearCache(Parcel.class, "mCreators");
        clearCache(Parcel.class, "sPairedCreators");
    }
}
```

**This is the most thorough signature spoof possible** — intercepts at the Parcel level before any SDK reads the signature.

## Extension Pattern — Litho Component Filter (YouTube)

Abstract filter system for YouTube's Litho UI framework:

```java
abstract class Filter {
    protected final List<StringFilterGroup> identifierCallbacks = new ArrayList<>();
    protected final List<StringFilterGroup> pathCallbacks = new ArrayList<>();

    protected final void addIdentifierCallbacks(StringFilterGroup... groups) {
        identifierCallbacks.addAll(Arrays.asList(groups));
    }

    // Called when a component matches — return true to hide it
    boolean isFiltered(ContextInterface ctx, String identifier, String accessibility,
                       String path, byte[] buffer, StringFilterGroup matchedGroup,
                       FilterContentType contentType, int contentIndex) {
        return true;  // Default: hide matched components
    }
}

// Concrete filter for ads
public final class AdsFilter extends Filter {
    public AdsFilter() {
        // Don't filter these (exceptions)
        exceptions.addPatterns("home_video_with_context", "comment_thread");

        // Filter these identifiers
        addIdentifierCallbacks(
            new StringFilterGroup(Settings.HIDE_GENERAL_ADS, "ad_", "ads_"),
            new StringFilterGroup(Settings.HIDE_MERCHANDISE, "product_carousel")
        );
    }
}
```

## Extension File Location

```
${PATCHES_DIR}/extensions/extension/src/main/java/
├── app/morphe/extension/shared/     # Shared utilities (already copied)
│   ├── Utils.java
│   ├── Logger.java
│   ├── settings/
│   └── ui/
└── <group>/extension/               # YOUR extension code goes here
    └── <app>/
        └── MyPatch.java
```

`${PATCHES_DIR}` = `${MORPHE_PATCHES_DIR:-morphe-patches}`. The `<group>` matches your patches repo's Kotlin group (discover from `build.gradle.kts`).

## How to Use Extensions in Patches

```kotlin
val myPatch = bytecodePatch(name = "My Feature") {
    // Load the extension DEX
    extendWith("extensions/extension.mpe")

    execute {
        // Call extension method from patched bytecode
        // Replace <group> with your actual package group (from build.gradle.kts)
        TargetFingerprint.method.addInstructions(0, """
            invoke-static { }, L<group>/extension/<app>/MyPatch;->isEnabled()Z
            move-result v0
            return v0
        """)
    }
}
```

## When to Use Extensions vs Inline Smali

| Scenario | Use |
|----------|-----|
| Return true/false | Inline smali (`returnEarly`) |
| Simple value override | Inline smali |
| Check a setting | Extension (reads SharedPreferences) |
| Filter a list | Extension (Java list operations) |
| Complex conditional logic | Extension |
| Access Android APIs (Context, Toast) | Extension |
| String manipulation | Extension |
| Network operations | Extension |
| Signature spoofing | Extension (Application subclass) |

## Key Rules

1. Extension methods called from patches must be `public static`
2. Use `@SuppressWarnings("unused")` — methods are called via reflection/smali
3. Settings are read once at class load time (static final) for performance
4. Extension class descriptor in smali: `L<group>/extension/<app>/MyPatch;`
5. Extension is compiled to DEX and merged before patches execute
