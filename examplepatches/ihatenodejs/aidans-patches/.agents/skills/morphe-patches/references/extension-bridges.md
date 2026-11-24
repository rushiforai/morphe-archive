# Java Extension Runtime Bridges Reference

This reference covers the design, packaging, Smali ABI linkage, reflection patterns, Android lifecycle safety, and UI threading requirements for Morphe Java runtime bridges under `extensions/`.

---

## 1. Architecture and Packaging

Morphe patches modify existing DEX code, but authoring complex features (such as custom dialogs, WebView renderers, or dynamic interceptors) directly in Smali is impractical. Java extension bridges allow writing high-level Java code that is packaged into an extension bundle (`.mpe`) and merged into the target APK's DEX.

### Directory Structure & Build Output

- **Java Source Root**: `extensions/extension/src/main/java/app/aidan/extension/<app-or-domain>/`
- **Manifest**: `extensions/extension/src/main/AndroidManifest.xml` (keep minimal; only declare components strictly required by Android runtime).
- **Gradle Module**: `extensions/extension/build.gradle.kts`
- **Output Artifact**: `extensions/extension.mpe`
- **Compilation Command**:

  ```bash
  ./gradlew :extensions:extension:compileReleaseJavaWithJavac --console=plain
  ```

### Linking with Kotlin Patches

In the companion Kotlin patch under `patches/src/main/kotlin/app/aidan/patches/...`, link the extension using `extendWith(...)`:

```kotlin
val myFeaturePatch = bytecodePatch(
    name = "My Feature",
    description = "...",
    default = true,
) {
    // Declares runtime dependency on the extension bundle
    extendWith("extensions/extension.mpe")

    execute {
        // Injected Smali invokes bridge methods
    }
}
```

---

## 2. Bridge Class Conventions & Smali ABI

### Class Structure Template

Bridge classes should follow strict conventions:

1. `public final class <BridgeName>`
2. `private <BridgeName>() {}` (prevent instantiation; static utilities only)
3. Narrow, static entry points.
4. Pass required Android context (`Context`, `Activity`) explicitly from Smali; avoid global singleton state.

```java
package app.aidan.extension.sezzle;

import android.app.Activity;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

public final class ConsentGate {
    private static final String TAG = "ConsentGate";

    private ConsentGate() {}

    /**
     * Entry point invoked from Activity.onResume() Smali injection.
     */
    public static void maybeShow(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1 && activity.isDestroyed()) {
            return;
        }

        new Handler(Looper.getMainLooper()).post(() -> {
            showDialogSafely(activity);
        });
    }

    private static void showDialogSafely(Activity activity) {
        // Implementation...
    }
}
```

### Exact Descriptor Matching (Smali $\leftrightarrow$ Java ABI)

The public descriptor of a bridge method is an immutable binary contract. Any signature change in Java requires an identical change in the injected Smali:

| Java Method Signature                                         | Smali Invocations Descriptor                                                                                       |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `public static void maybeShow(Activity activity)`             | `invoke-static {p0}, Lapp/aidan/extension/sezzle/ConsentGate;->maybeShow(Landroid/app/Activity;)V`                 |
| `public static boolean isFeatureAllowed(String key)`          | `invoke-static {v0}, Lapp/aidan/extension/shared/FeatureGate;->isFeatureAllowed(Ljava/lang/String;)Z`              |
| `public static String transformUrl(String rawUrl, int flags)` | `invoke-static {v0, v1}, Lapp/aidan/extension/web/UrlRouter;->transformUrl(Ljava/lang/String;I)Ljava/lang/String;` |

_Critical_: Never use primitive wrapper types (`java.lang.Boolean`, `java.lang.Integer`) unless nullability is strictly required; prefer primitive `boolean` (`Z`) and `int` (`I`) to avoid unnecessary autoboxing and descriptor complexity.

---

## 3. Reflection over Obfuscated Classes

Target applications are proprietary and obfuscated (e.g. `com.example.a.b.c`). Their classes do not exist in the Gradle classpath of `extensions/extension/`.

### Strict Rule: No Compile-Time Imports

**NEVER** attempt to import or reference target application package names in Java bridge files. Doing so causes compile-time failure.

### Reflection Strategy

Access target app classes, methods, and fields exclusively through dynamic Java reflection. Keep the bridge narrow and never extract credentials or tokens merely to demonstrate reflection:

```java
public static boolean isFeatureEnabled(Object configService) {
    if (configService == null) return false;

    try {
        Class<?> clazz = configService.getClass();
        java.lang.reflect.Method method;
        try {
            // Public method first.
            method = clazz.getMethod("isFeatureEnabled", String.class);
        } catch (NoSuchMethodException notPublic) {
            // Obfuscated targets often declare private methods.
            method = clazz.getDeclaredMethod("isFeatureEnabled", String.class);
            method.setAccessible(true);
        }
        Object result = method.invoke(configService, "target_feature");
        return result instanceof Boolean && (Boolean) result;
    } catch (NoSuchMethodException e) {
        Log.w(TAG, "Method isFeatureEnabled not found on " + configService.getClass().getName(), e);
        return false;
    } catch (Exception e) {
        Log.e(TAG, "Failed to read feature flag reflectively", e);
        return false;
    }
}
```

Use `getDeclaredMethod` plus `setAccessible(true)` when the target method is private; `getMethod` only finds public methods. Cache reflection objects only when the target class lifecycle is explicit and invalidation is understood; do not cache across app upgrades.

### Failure Policy: Safe Degradation vs Fail-Fast

- **Best-effort features** (optional telemetry suppression, cosmetic styling): catch reflection/API exceptions at the bridge boundary, log with context, and return a safe fallback (`false`, `null`, or no-op).
- **Indispensable feature dependencies** (security gate, storage redirection, required initialization): log an `ERROR` and disable the feature or expose an explicit failure state. Do not let the exception escape and crash the host, and do not silently report success.
- **Security-sensitive decisions**: fail **closed**. If the bridge cannot establish that an operation is allowed, deny it. Never return `true`, skip a check, or fall through to permissive behavior on error.
- Do not use blanket `catch (Throwable ignored)` for security or required paths. Catch the narrowest exception type that is genuinely recoverable; rethrow or surface programming errors.

---

## 4. Android UI, Threading & Lifecycle Safety

### UI Thread Dispatch

Smali bytecode injections may occur on background worker threads (e.g. OkHttp interceptors, RxJava/Coroutine pools). Any code modifying Android Views, creating `Dialog` instances, or accessing `Toast` **MUST** run on the main looper:

```java
public static void runOnMainThread(Runnable action) {
    if (Looper.myLooper() == Looper.getMainLooper()) {
        action.run();
    } else {
        new Handler(Looper.getMainLooper()).post(action);
    }
}
```

### Activity Lifecycle Invariants

Never attach a dialog or view to a dead or dying activity. Always check lifecycle state before performing UI operations:

```java
if (activity == null || activity.isFinishing()) {
    return;
}
if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR1) {
    if (activity.isDestroyed()) {
        return;
    }
}
```

### Preventing Memory Leaks

- Never store `Activity` or `View` instances in static fields.
- If an asynchronous callback or event listener must retain a reference to a UI component, wrap it in a `WeakReference<Activity>` or `WeakReference<View>`.
- Dismiss any created dialogs when the parent activity finishes or is destroyed.

---

## 5. Safe WebView Configuration

Default to **no JavaScript and no JavaScript interface**. A `WebView` is a full browser engine inside the host app; every capability you enable applies to every frame it loads.

```java
package app.aidan.extension.example;

import android.app.Activity;
import android.net.Uri;
import android.os.Build;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.lang.ref.WeakReference;

public final class TrustedWebViewFactory {
    private TrustedWebViewFactory() {
    }

    public static WebView create(Activity activity) {
        WebView webView = new WebView(activity);
        WebSettings settings = webView.getSettings();

        // Secure defaults: no script, no bridge, no local file/content access.
        settings.setJavaScriptEnabled(false);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            settings.setAllowFileAccessFromFileURLs(false);
            settings.setAllowUniversalAccessFromFileURLs(false);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            settings.setSafeBrowsingEnabled(true);
        }

        // Restrict navigation to HTTPS origins the feature controls.
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return !isTrustedOrigin(Uri.parse(url));
            }
        });

        webView.loadUrl("https://trusted.example/app");
        return webView;
    }

    private static boolean isTrustedOrigin(Uri uri) {
        if (uri == null || !"https".equals(uri.getScheme())) return false;
        String host = uri.getHost();
        return "trusted.example".equals(host) || "cdn.trusted.example".equals(host);
    }

    // Call only when the feature truly requires a JavaScript bridge.
    static void attachMinimalBridge(WebView webView) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            webView.addJavascriptInterface(new MinimalBridge(webView), "AndroidBridge");
        }
    }

    private static final class MinimalBridge {
        private final WeakReference<WebView> webViewRef;

        MinimalBridge(WebView webView) {
            this.webViewRef = new WeakReference<>(webView);
        }

        @JavascriptInterface
        public void onReady() {
            WebView view = webViewRef.get();
            if (view == null) return;

            // Coarse top-level guard; it does not identify iframe origins.
            String currentUrl = view.getUrl();
            if (currentUrl == null || !isTrustedOrigin(Uri.parse(currentUrl))) return;

            // Interface methods run on a WebView background thread; marshal UI work.
            view.post(() -> {
                // Small, explicitly reviewed UI action.
            });
        }
    }
}
```

Enable JavaScript only when the feature genuinely requires it, and only for content restricted to those trusted origins. Never enable it for arbitrary user-supplied or third-party URLs.

### If a JavaScript Interface Is Truly Required

Use `addJavascriptInterface` only as a last resort, only on API 17+, and only after locking navigation to trusted origins. Interface methods on API 17+ are exposed **only** when annotated with `@JavascriptInterface`; on older versions all public methods of the object are reachable, so do not add an interface there.

The `attachMinimalBridge` method above shows the complete interface pattern: a `WeakReference`-held WebView, no Activity/Context leakage, a top-level-origin guard, a single no-argument method, and UI work marshalled with `view.post(...)`. Do not add an interface unless the feature cannot be implemented without one.

Interface rules:

1. **Minimize surface**: expose only the methods required, with primitive/string parameters and no `Activity`, `Context`, reflection handles, or file paths.
2. **No secrets or privileged operations**: never expose tokens, credentials, session cookies, arbitrary URL loading, `evaluateJavascript`, file I/O, SQL, intents, or reflection.
3. **Validate every input**: length/format/allowlist checks before use; never concatenate interface input into JavaScript, URLs, or shell/file paths.
4. **Validate the caller/origin**: treat `webView.getUrl()` as a coarse top-level-URL check. It does **not** identify an iframe's origin. Block non-allowlisted frame navigations/subresources (for example in `shouldInterceptRequest`) or avoid third-party frames entirely when the interface is exposed.
5. **Thread correctly**: `@JavascriptInterface` methods execute on a WebView-owned background thread. Use `view.post(...)` or a main `Handler` for UI mutations.
6. **Version guards**: `@JavascriptInterface` requires API 17; `evaluateJavascript` API 19; `setMixedContentMode` API 21; `setSafeBrowsingEnabled` API 26; the `WebResourceRequest` navigation overload API 24. Guard or avoid newer APIs as appropriate.
7. **Lifecycle**: use a `WeakReference` to the WebView; do not retain the Activity or interface object beyond the view lifecycle.

---

## 6. Verification Protocol

Synthetic unit tests under `extensions/extension/src/test/java/` can verify pure Java logic (transactions, mappings, JNI constant alignment). They cannot verify reflection targets, target-app lifecycle behavior, WebView policy, or ABI linkage.

1. **Compile Java**:

   ```bash
   ./gradlew :extensions:extension:compileReleaseJavaWithJavac --console=plain
   ```

2. **Run synthetic tests when they cover changed logic**:

   ```bash
   ./gradlew :extensions:extension:testReleaseUnitTest --console=plain
   ```

3. **Build Bundle**:

   ```bash
   ./gradlew :patches:buildAndroid
   ```

4. **Run real-artifact patch check**:

   ```bash
   cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
     --mpp patches/build/libs/patches-<version>.mpp \
     --package <pkg> \
     --all
   ```

   This exercises patch application, output identity, `dexdump -c` checksum validation, member delta, and an inventory of `Lapp/aidan/extension/` classes. It does **not** prove that every `.mpe` class was injected, that a Smali descriptor matches a Java method, or that reflection resolves at runtime.
5. **Device smoke and monitoring**:

   ```bash
   cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- deploy path/to/app.apkm \
     --mpp patches/build/libs/patches-<version>.mpp \
     --package <pkg> \
     --all \
     --launch
   cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- monitor --package <pkg>
   ```

   Exercise the exact changed flow. An ABI/descriptor mismatch typically appears as `NoSuchMethodError`, `NoClassDefFoundError`, or `ClassNotFoundException` at runtime; compile-time checks cannot see the Smali string. Do not declare the bridge verified until this step succeeds.
