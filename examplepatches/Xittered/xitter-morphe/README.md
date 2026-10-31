# Xitter Patches

Morphe patches that turn X's Android app (`com.twitter.android` 12.19.1-release.0) into a
client of a [Xitter](https://github.com/Xittered/xitter) instance.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/jakeayy/xitter-morphe/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 X&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 12.19.1-release.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Changes the app's package name, account type and name, so the patched app installs next to the original X app instead of replacing it. Do not also select Morphe's own "Change package name" patch. | • Package name<br>• App name |
| [Xitter](#xitter) | Makes the app a client of a Xitter instance. Every address of X (x.com, twitter.com, twimg.com, t.co...) is sent to the instance instead, signed in with the instance's sessions, and the app's sign-in screens sign in to the instance. Nothing is sent to X. | • Instance address<br>• Client app token<br>• Block third-party services<br>• Allowed hosts |

</details>

<!-- PATCHES_END -->

### How nothing reaches X

The guard is in several layers, so one missed path is still caught by the next:

1. **OkHttp**: every client goes through `OkHttpClient(Builder)`. That constructor is hooked
   to add an interceptor (rewrite and auth), a DNS and proxy selector that refuse X's hosts
   (they also catch redirects), no cookie jar, and system TLS in place of X's pinned CAs.
2. **`java.net`**: every `URL.openConnection`/`openStream` and `InetAddress.getByName`/`getAllByName`
   call in the app (166 call sites in 12.19.1) goes through the guard.
3. **WebView**: `loadUrl`/`postUrl` calls are rewritten or blocked.

No native library in the app contains X hostnames, and the app has no Cronet.

With `blockThirdParty` on (the default), Google/Firebase, Braze, Datadog, Stripe and other SDKs
are refused too; only the instance, `allowedHosts`, and localhost/LAN addresses are reachable.

### Signing in

The username → password screens are X's native sign-in screens, driven by the extension. The
password is checked with the instance's `POST /login`. The session (`auth_token` + `ct0`) becomes
the account's OAuth token, so several accounts work side by side. Accounts with two-factor
sign-in can't sign in this way yet (`/login` refuses them).

## Use

- **Morphe Manager**: [add this repository as a patch source](https://morphe.software/add-source?github=jakeayy/xitter-morphe)
  (or a built `patches-*.mpp`), pick the X 12.19.1 APKM from APKMirror, and set the instance
  address in the Xitter patch's options.
- **CLI**:
  ```
  java -jar morphe-desktop-all.jar patch --patches=patches-1.0.0.mpp -e Xitter -O serverUrl=https://your.instance -e "Change package name" --striplibs=arm64-v8a x-12.19.1.apkm
  ```

## Build

Needs JDK 21, the Android SDK (`local.properties` or `ANDROID_HOME`) and a GitHub token with
`read:packages` (for Morphe's Gradle plugin):

```
GITHUB_ACTOR=<you> GITHUB_TOKEN=$(gh auth token) ./gradlew :patches:buildAndroid
```

Output: `patches/build/libs/patches-*.mpp`.

## Limits

The app side is complete, but **the Xitter server answers the web client's API, not the
Android app's**. Of the 319 GraphQL operations X Android 12.19.1 uses, 21 share a name with
Xitter's handlers (HomeTimeline, CreateTweet, FavoriteTweet, SearchTimeline, …). Profiles,
post detail and most lists use Android-only operations (`UserResultByScreenNameQuery`,
`ConversationTimelineV2`, `UserWithProfileTweetsQueryV2`, `ViewerUserQuery`, …). Unhandled
calls get an empty `{data:{}}`, and Xitter lists them at `GET /_debug/unknown`. Those screens
need Android aliases on the server.
