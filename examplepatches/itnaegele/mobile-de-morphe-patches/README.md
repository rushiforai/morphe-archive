# mobile.de Morphe Patches

[Morphe](https://morphe.software) patches for the **mobile.de** Android app (`de.mobile.android.app`, target versions **10.30**, **10.29**).

## Installation in Morphe Manager

### 1-Click Remote Source (recommended)
Open this link on your Android phone with Morphe Manager installed:

👉 **[Add Patch Source in Morphe Manager](https://morphe.software/add-source?github=itnaegele/mobile-de-morphe-patches)**

### Manual Setup
1. Open **Morphe Manager** → **Patch Sources** → **`+`**
2. Select **Remote** and enter:
   ```
   github.com/itnaegele/mobile-de-morphe-patches
   ```
3. Select the **mobile.de** full APK (v10.30 or v10.29) and toggle the patches you want.

> **Note:** Morphe requires a full `.apk` file (if you exported a split APK / `.apkm`, merge it first e.g. with AntiSplit-M).

---

## Included Patches (all individually toggleable)

| Patch | Description |
|---|---|
| **Abgelaufene Inserate archivieren (Google Drive)** | Archives viewed & parked listings (JSON, seller contact, photos, readable `info.txt`) locally and optionally in Google Drive. Restores expired listings in Parkplatz & detail view and adds a 1-tap archive button to each listing card. Includes search, Wi-Fi-only mode, and configurable local image cache limit (LRU). |
| **Werbung entfernen** | Disables ads globally and removes ad banners in search results, listing details, home feed, and filter screens. |
| **Finanzierungswidgets ausblenden** | Hides financing monthly rate badges, financing calculators, and the post-contact financing popup. |
| **Versicherungs-, Carfax- & Partner-Widgets ausblenden** | Removes Check24 insurance, Carfax, leasing partner, IONITY, and EV bonus cards from listing details. |
| **Express-Verkauf / Ankauf-Banner ausblenden** | Removes "Sell your car" / Express-Sell teaser banners from Parkplatz (standalone bytecode patch). |
| **Umfragen & Bewertungs-Popups deaktivieren** | Suppresses app rating dialogs, Survicate surveys, and CSAT/NPS prompts. |
| **Gesponserte & Top-Inserate ausblenden** | Removes paid Top-of-Page and Top-in-Category sponsored listings from search results. |

---

## Google Drive Sync Setup (optional)

Local archiving works out of the box with no configuration. To back up listings to your own Google Drive:

1. In the patched mobile.de app, open the toolbar menu (or long-press any archive button on a listing card) → **Archiv (Google Drive)** → **Einstellungen & Google Drive einrichten**.
2. Choose **Google Apps Script** (recommended, no token expiry) and tap **Apps-Script Code (mit deinem Secret) kopieren** (or use [`google-drive-bridge.gs`](google-drive-bridge.gs)).
3. Go to [script.google.com](https://script.google.com) → **New Project** → paste the code → **Deploy → Web app** (*Execute as: Me*, *Who has access: Anyone*).
4. Copy the generated `https://script.google.com/macros/s/.../exec` URL back into the app settings and tap **Save**.

---

## License

GPLv3 — see [LICENSE](LICENSE).
