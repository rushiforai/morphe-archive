# 🧦 Proxy Patches

Patches that route **all** of an app's traffic through **your own HTTP, HTTPS or SOCKS5 proxy**, with optional username and password. It's built into the app, so there's no VPN app to keep running and no system proxy to switch on.

Currently supported: **Reddit**.

### How to use these patches

Click the button below, or add this repo URL as a patch source in Morphe Manager: https://github.com/TahmidSummy/proxy-patches

<a href="https://morphe.software/add-source?github=TahmidSummy/proxy-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Then select the **Proxy** patch for Reddit and patch the app.

### ⚙️ Setting your proxy (no repatching needed)

**Long-press the Reddit icon → Proxy settings.** Fill in:

| Setting | What to enter |
|---|---|
| **Run without proxy** | **Off** (default): everything goes through your proxy, and if it isn't working the app is offline. **On**: the app connects directly, without the proxy. |
| **Proxy type** | **HTTPS**: the connection to the proxy itself is encrypted (such as Caddy `forward_proxy`). **HTTP**: a plain HTTP proxy. **SOCKS5**: a SOCKS5 proxy. |
| **Proxy host** | Hostname or IP of your proxy, for example `proxy.example.com` |
| **Port** | For example `443` for HTTPS, `8080` for HTTP, or `1080` for SOCKS5 |
| **Username / Password** | Your proxy login, or leave both empty if it has none. Once saved, the password is **never shown again**: the field stays empty, and leaving it empty keeps the saved one. **Remove saved password** clears it. |

> ℹ️ **SOCKS5 isn't encrypted** between your phone and the proxy. Your app traffic inside is still HTTPS, but your proxy login and the hostnames you visit can be seen on the network path. **HTTPS** proxies protect both. With SOCKS5, hostnames are sent to the proxy unresolved, so DNS happens on the proxy, not on your phone.

The screen also has these buttons:

- **Test connection** asks your proxy to open a tunnel and tells you whether it works, or why not (wrong login, TLS mismatch, unknown host, can't connect, SOCKS5 errors).
- **Save** applies the settings to new connections straight away.
- **Save & restart app** also drops connections that are already open.

The screen works offline, so you can always fix a wrong or dead proxy. It also **blocks screenshots and screen recording**, and shows blank in the recent-apps view.

**If your proxy stops working**, the app tells you instead of just failing to load. You see a short message such as:

- "Can't reach your proxy";
- "Your proxy rejected the login";
- "Secure (TLS) connection to your proxy failed".

It appears at most once a minute, only while the app is open, and only after a few failures in a row. It doesn't appear when your phone itself has no internet, so a dead Wi-Fi isn't blamed on the proxy.

The patch options in Morphe Manager (proxy type, host, port) are optional **starting values**, if you'd rather have the proxy pre-filled from the first launch.

> 🔒 **Your username and password are only ever entered in the app's Proxy settings.** There's deliberately no patch option for them. Patch options are stored as plain text inside the APK, and installed APKs can be read by any app on the phone. The app's own storage is private to the app (Android's sandbox).

## 🔍 What the patch does

Inside the app it runs a small local forwarder on `127.0.0.1`. Every network stack in the app is pointed at that forwarder. For each connection, the forwarder:

- **HTTP/HTTPS:** connects to your proxy (with the certificate and hostname checked, for HTTPS), adds your `Proxy-Authorization` login, and passes the traffic through.
- **SOCKS5:** connects to your proxy, logs in (username/password auth), and asks for a tunnel to the destination hostname.

For Reddit it also closes the gaps where traffic would otherwise skip the proxy:

- **Cronet** (Chromium networking, Reddit's main stack) would switch to direct connections and QUIC whenever Android broadcasts a proxy change. It's patched to keep using the proxy.
- **Cronet's own DNS** (built-in resolver and stale/persisted host cache) is turned off.
- **Reddit's startup DNS warm-up** (`DnsLookupInitializer`) is turned off. On a fresh install it looked up Reddit's API hosts with your phone's DNS.
- **Google Play Services' Cronet**, used by reCAPTCHA, is disabled, so reCAPTCHA uses the app's own patched Cronet.
- **WebView** gets a proxy override.
- **Android's built-in `HttpURLConnection`** (used by SDKs such as AppsFlyer and Firebase) quietly tries a direct connection when the proxy fails. Every `http(s)` URL is opened with the proxy passed explicitly, which turns that fallback off.

There is **no fallback to a direct connection**. If your proxy isn't set, is down, or rejects the login, the app has no network rather than connecting directly. The only exception is when you turn on **Run without proxy** yourself.

**Tested with Reddit 2026.40.0.** No TCP or QUIC traffic went anywhere except the proxy in any of these:

- **Android 17 phone:** scrolling, video, Wi-Fi ⇄ mobile data, background, proxy unreachable.
- **Android 15 emulator:** first launch with no proxy set, in-app settings changes, switching Run without proxy off and on, and a real SOCKS5 proxy.

The only other traffic is the phone's DNS lookup of the proxy's own hostname.

### Limitations

- **YouTube links** inside Reddit open the YouTube app, which isn't covered.
- **Push notifications** come through Google Play Services, outside the app.
- **SOCKS5 is TCP only** (CONNECT). That's all the app needs, because QUIC/UDP is off whenever a proxy is set.
- **SOCKS5 servers without IPv6** can answer "host unreachable" for sites that have IPv6 addresses. The patch retries those twice. The real fix is making the server prefer IPv4.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/TahmidSummy/proxy-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.reddit.frontpage`

**🎯 Supported versions:**

| 2026.40.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Proxy](#proxy) | Routes all of the app's traffic through your HTTP, HTTPS or SOCKS5 proxy, with optional username and password. Set it up in the app: long-press the app icon → Proxy settings (the login is entered there, never baked into the APK). Nothing goes direct, even if the proxy is down, unless you turn on "Run without proxy" there. | • Proxy host (optional)<br>• Proxy port<br>• Proxy type |

</details>

<!-- PATCHES_END -->

&nbsp;

## 🛠️ Building

You need:

- JDK 17+;
- the Android SDK (`ANDROID_HOME`, with its licenses accepted);
- a GitHub token with `read:packages`, because Morphe's patcher is hosted on GitHub Packages. Set it as `GITHUB_ACTOR`/`GITHUB_TOKEN`, or as `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`.

```bash
./gradlew :patches:buildAndroid      # -> patches/build/libs/patches-<version>.mpp
./gradlew generatePatchesList        # -> patches-list.json
```

The forwarder source is in [`extensions/proxy`](extensions/proxy/src/main/java/app/proxypatches/extension), and the patch is in [`patches/.../reddit/proxy`](patches/src/main/kotlin/app/proxypatches/patches/reddit/proxy).

## 📜 License

GPLv3, see [LICENSE](LICENSE). This is an independent project built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template), and isn't affiliated with or endorsed by Morphe. See [NOTICE](NOTICE).
