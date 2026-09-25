# 🦊 Foxxo Patches

Custom Morphe Patches repository by [FoxxoOwO](https://github.com/FoxxoOwO).

### 📲 How to use these patches in Morphe

Click here to add this repository as a patch source in Morphe:  
👉 **[Add to Morphe](https://morphe.software/add-source?github=FoxxoOwO/foxxo-patches)**

Or add manually in Morphe Manager:
- **Source:** `FoxxoOwO/foxxo-patches`

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/FoxxoOwO/foxxo-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clone](#clone) | Renames the package and app label so the patched build installs alongside a stock Instagram instead of replacing it. | • Package name<br>• App name |
| [Debug bridge](#debug-bridge) | Development only: exposes the Feurstagram settings over ADB broadcasts so they can be driven from a shell instead of the on-screen panel. |  |
| [Feed item filtering](#feed-item-filtering) | Drops ad/promo and suggested feed units at the JSON-parse layer, catching the ones injected inline into the timeline that URL blocking misses. Gated on the Ads and Suggested toggles. |  |
| [Force SDR display](#force-sdr-display) | Reroutes Instagram's window colour-mode changes so the app can be pinned to SDR, keeping the dark UI's blacks deep instead of the washed-out look HDR forces. |  |
| [Install-packages permission](#install-packages-permission) | Declares REQUEST_INSTALL_PACKAGES so the update dialog can download and install a new release directly instead of opening the browser. |  |
| [Limit feed to following profiles](#limit-feed-to-following-profiles) | Optionally restricts the home feed to accounts you follow, by rewriting the feed request's pagination header. Gated on the runtime toggle. |  |
| [Network content blocking](#network-content-blocking) | Blocks the feed, stories, explore, reels, ads, suggestions and tracking at the network layer, gated on the runtime toggles. |  |
| [Popup hiding](#popup-hiding) | Drops Instagram's popups ("Couldn't refresh feed"), which a blocked surface raises on every failed request. Gated on the Instagram popups toggle. |  |
| [Restart relay](#restart-relay) | Declares the one-shot activity Feurstagram runs in its own process to bring Instagram back after the cache-clear restart. |  |
| [Settings entry point](#settings-entry-point) | Opens the Feurstagram settings on a long-press of the Home tab, and installs the surface hiders and update check. |  |
| [Signature check bypass](#signature-check-bypass) | Forces Instagram's signing-certificate trust checks to always pass, so a re-signed APK is treated as an official Meta build and deep links route to their content instead of falling back to the home feed. |  |

</details>

<details open>
<summary>📦 AI Plant Doctor&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Unlocks all AI Plant Doctor premium features by bypassing Google Play Billing and returning an active annual subscription. |  |

</details>

<!-- PATCHES_END -->

---

## 🌿 AI Plant Doctor (me.jodoin.aiplantdoctor)

### Co patch dělá
Patch odemyká všechny premium funkce aplikace **AI Plant Doctor** (`me.jodoin.aiplantdoctor v3.1.0_antisplit`) tím, že přesměruje Google Play Billing komunikaci. Aplikace si vždy myslí, že uživatel má aktivní roční předplatné (`me.jodoin.aiplantdoctor.premium_annual`).

### Odemčené funkce
- Neomezená diagnostika rostlin (AI Plant Doctor)
- Přístup k asistentovi Budsy
- Detekce škůdců a chorob bez limitu
- Personalizované plány péče
- Pokročilá analýza zdraví rostlin
- AI diagnózy a Day pass funkce

### Jak patch funguje
Aplikace je postavena na Flutteru. Logika předplatného běží v Dart kódu (`libapp.so`), který získává stav předplatného přes Pigeon IPC bridge z Java pluginu `in_app_purchase_android`.
Patch zachytí volání `queryPurchasesAsync` v Java vrstvě a vrátí fake odpověď s aktivním předplatným `me.jodoin.aiplantdoctor.premium_annual`, čímž zcela obejde reálný Google Play BillingClient.

## 📸 Instagram Direct / Chat-Only (`com.instagram.android`)

### Co patch dělá
Přetváří Instagram na čistě chatovací aplikaci (Messenger pro Instagram) bez rušivých prvků:
- **Přímo do zpráv:** Aplikace po spuštění automaticky přejde rovnou do Direct Messages (inboxu).
- **Odstranění feedu a rušivých prvků:** Zablokován hlavní kanál příspěvků, příběhy (Stories), Explore/objevování a doporučený kanál Reels.
- **Skrytí navigační lišty:** Skryty nepotřebné taby (Home, Explore, Reels, Create, Profile).
- **Chování jako messenger:** Tlačítko Zpět v kořenovém Direct inboxu minimalizuje aplikaci na plochu telefonu namísto návratu do prázdného feedu.
- **Přehrávání médií ze zpráv:** Konkrétní příspěvky a Reels zaslané v chatu zůstávají plně funkční a přehratelné (díky bypassu kontroly certifikátů podpisů).
- **Nastavení:** Dlouhým podržením na záhlaví Direct inboxu lze otevřít podrobné nastavení.

---

## 📜 License
[GPLv3](LICENSE)
