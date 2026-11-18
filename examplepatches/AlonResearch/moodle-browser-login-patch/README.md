<h1 align="center">Moodle Browser Login</h1>

<p align="center">Use your Moodle site's browser sign-in from the official Moodle Android app.</p>

<p align="center">
  <a href="https://github.com/AlonResearch/moodle-browser-login-patch/releases/tag/v1.0.0-dev.1">Download the preview</a>
  ·
  <a href="https://github.com/MorpheApp/morphe-manager">Morphe Manager</a>
</p>

> **Experimental preview · Android app version 5.2.1 only**

## What this patch does

Adds a **Log in through browser** option to the Moodle app's first sign-in and reconnect screens. It opens your Moodle site's browser login so you can choose your institution's sign-in method, such as JYU credentials. The normal Moodle login choices remain available.

The patch works across Moodle site addresses. The Moodle server still needs to support browser sign-in and return an app login token. A browser session is not copied into the app, and a successful website login by itself does not mean the app has signed in.

## Install

Choose one of these options from the [preview release](https://github.com/AlonResearch/moodle-browser-login-patch/releases/tag/v1.0.0-dev.1).

### Install the ready-to-use APK

Download the [ready-to-install APK](https://github.com/AlonResearch/moodle-browser-login-patch/releases/download/v1.0.0-dev.1/Moodle-5.2.1-Browser-Login-v1.0.0-dev.1.apk) and install it on Android. This is the quickest option for a new install.

The APK has this project's signing key. Android may not install it over a Moodle app from Google Play or one patched by Morphe because those use a different signing key. If Android reports a signature conflict, sync offline work before uninstalling the existing Moodle app. Uninstalling clears its local data. Future updates to this APK must use this project's signature.

### Patch with Morphe

Use this option if you already use Morphe or want Morphe to sign the patched app with your own key.

1. Download the [Morphe patch bundle](https://github.com/AlonResearch/moodle-browser-login-patch/releases/download/v1.0.0-dev.1/patches-1.0.0-dev.1.mpp).
2. In [Morphe Manager](https://github.com/MorpheApp/morphe-manager), choose **Sources → + → Local** and select the downloaded `.mpp` file. **Patch selections → Import** is for JSON selection files.
3. Select an unmodified official Moodle Android **5.2.1** APK and apply **Add browser login option**.
4. Install the result. Keep the same Morphe signing key when updating this installation.

Morphe is a general-purpose Android app patcher. This patch bundle is specific to Moodle Android 5.2.1; it does not make other app versions compatible.

## Sign in

1. Add your Moodle site in the app and tap **Log in through browser**.
2. On the university login page, choose your institution's sign-in option and finish signing in.
3. If Moodle shows **“Plugin not enabled or configured”**, tap **Continue**, then choose the institution's sign-in option on the Moodle page. For JYU, choose **Login with JYU credentials**.
4. Wait for the browser to return to the Moodle app, then check that the app itself is signed in.

You usually do not need to log out first. If your university sign-in session is already active, the browser may reuse it. On JYU, a user reported that **Continue → Login with JYU credentials** completed the app sign-in after the error page appeared.

Moodle sets a short-lived app handoff marker before checking its mobile login configuration. That marker is not your browser session cookie being transferred to the app. Other Moodle sites may behave differently depending on their server and sign-in setup.

## If reconnect still fails

Sync offline work first. In the app's **Accounts** screen, use the pencil/edit control to remove the saved Moodle account, then add the site again. Removing the account can clear local app data or unsynced work; it does not delete your university account.

## Compatibility and status

- Android, official Moodle app **5.2.1** (`com.moodle.moodlemobile`). Other app versions need a compatible patch update.
- Supports any Moodle site address when the site's browser SSO and app-token return flow are configured to work together.
- The JYU workaround above was reported working. Sign-in and reconnect have not been independently verified on a range of Moodle sites. This patch cannot change Moodle server settings or guarantee every site's handoff.

See [Moodle's SSO guidance](https://docs.moodle.org/502/en/Moodle_app_FAQ#SSO_is_not_working_with_my_custom_auth_plugin) for server-side requirements.

## Privacy and project status

The patch adds a button that uses Moodle's existing browser SSO flow. It does not read your password, copy browser cookies, or change course content. Authentication remains subject to your Moodle site's configuration.

This is an independent community patch and is not affiliated with or endorsed by Moodle, JYU, or Morphe. Licensed under GPL-3.0; see [LICENSE](LICENSE).
