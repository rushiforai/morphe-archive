package app.template.patches.teams.integrity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// =============================================================================
// Microsoft Teams — WebView User-Agent Fingerprints
// =============================================================================

// ---------------------------------------------------------------------------
// WebViewAuthorizationFragment.setUpWebView (MSAL)
// ---------------------------------------------------------------------------
// This method configures the WebView used for authentication.
// It calls WebSettings.setUserAgentString() to set the user agent.
// We inject a const-string with a desktop user agent before that call.
//
// Match on the MSAL WebViewAuthorizationFragment class + setUserAgentString call.
// Other constraints (method name, accessFlags, parameters, returnType) are
// loosened because the exact signature varies across builds.
internal val webViewAuthSetUpWebViewFingerprint = Fingerprint(
    definingClass = "Lcom/microsoft/identity/common/internal/providers/oauth2/WebViewAuthorizationFragment;",
    filters = listOf(
        methodCall(
            name = "setUserAgentString",
        ),
    ),
)