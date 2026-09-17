# De-Vanced

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🧩 Patches & Features

| Patch | Key Features |
|---|---|
| **Spoof features** | • **Unlimited Original Quality Backup** (spoofs Pixel XL)<br>• **Pixel AI Tools Unlocked**: Magic Eraser, Portrait Blur, Color Pop, Sky |
| **GmsCore support** | • Non-root Google account login via MicroG / GmsCore<br>• Custom package name (`app.morphe.android.apps.photos`) coexistence with stock app |
| **Account avatar** | • Restores Google profile picture across Top Toolbar, Bento Menu, and Account Switcher |
| **Enable DCIM backup control** | • Granular per-folder backup toggles (Screenshots, WhatsApp, Camera)<br>• Stops forced auto-backup of entire DCIM directory |
| **Enable Phenotype flag manager** | • In-app flag editor under `Settings > 🛠️ Morphe Flags`<br>• Search, toggle, export/import flags and UI presets |
| **Bake memory style flags** | • Hard-codes scrapbook borders, typography cutouts, and 3D depth pop-outs in Memories carousel<br>• Bypasses GMS font provider certificate checks to load local system fonts |
| **AI Model Auto-Seeder** | • Dynamic runtime discovery and in-app background downloader for all 116+ Google ML models directly from official Google CDNs<br>• Dynamic manifest-driven mapping (zero hardcoded URLs/counts or GitHub mirror dependencies)<br>• Instant out-of-the-box Magic Eraser, Portrait Blur, Sky, and AI editing suite on any device without root |

---

## 📲 Pre-built APKs

Ready-to-install builds patched with this bundle are available at:
👉 **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**

---

For developer CLI recipes (building, releases, ADB, permissions, and models), see **[COMMANDS.md](COMMANDS.md)**.
