# AARE Patches

[Morphe](https://morphe.software) patches for [AARE](https://github.com/prototux/AARE), the open-source Android Auto replacement: background location, WhatsApp voice messages and voice reply in the car, and a Settings screen to turn each one on or off.

## ❓ About

AARE asks Android for the *location* foreground-service type, so the navigation app shown on the car screen (for example Vela Maps) keeps its GPS while the phone is locked. When AARE starts the car connection in the background, for example from the car's Bluetooth connection, Android 14 and later refuse that type unless the app holds the background location permission, which AARE doesn't declare. AARE then runs without it, and the navigation app freezes on the car screen as soon as the phone screen turns off.

The **Background location** patch adds that one permission to AARE's manifest. It changes nothing else.

The **Voice messages** patch plays WhatsApp voice messages in the car. When AARE reads a message aloud (the "Read aloud" button on the car screen), voice messages are played instead of read as "Voice message (0:05)": the sender's name is spoken, then the recording plays through the car speakers and the music pauses meanwhile. WhatsApp keeps voice messages in a folder hidden from other apps; the patch reads them through Shizuku, which AARE already uses for car audio, with a small helper that can only list and open WhatsApp's received voice notes. AARE gets no storage permission.

The **Voice reply** patch (needs Voice messages) lets you answer by voice. After a message is read aloud, a **Reply** card shows on the car screen for 15 seconds, and every message that can be answered gets a **Reply** button in the notification centre. Tap Reply and AARE asks for your answer, listens, shows what you dictate live on the card, reads it back and asks whether to send it: say "yes" / "send" or "no" / "cancel", or tap **Send** / **Cancel**. It works for WhatsApp and any messaging app whose notifications can be answered, and uses the phone's speech recognition (on the phone itself when available) with the phone's microphone.

The **AARE assistant** patch makes the steering-wheel voice button and the rail's microphone open AARE's own assistant, as a card on the car screen, in Italian, German or English (language in Settings), with on-device speech recognition and no server: *portami a…* / *take me to…*, music (*pausa*, *avanti*, *indietro*, *riprendi*), *leggi i messaggi*, *rispondi a Marco che…* (read back, sent after a yes), *chiama Anna* (after a yes), *apri Spotify*, *che ore sono*, *quanto manca*, the phone's battery, dark or light screen. It runs them with the car tools AARE gives assistants. Anything else opens the phone's assistant (Google) on the phone. Google's own car assistant refuses non-Google hosts, so it can't run on the car screen in AARE.

The **Car microphone** patch makes dictated replies and AARE's assistant listen through the car's microphone (AARE's microphone route: the car's, or the phone's when the car has none), on Android 13 or newer.

The **Tunnel navigation** patch keeps the position moving in tunnels when AARE gives the phone the car's GPS (its *car GPS for the phone* option). In a tunnel the car has no fix, so the position stops and the navigation app (Vela, Maps, Waze…) stops too. The car still sends its speed, compass and gyroscope: from the last good fix the patch estimates where the car is, once a second, and hands that to the phone until the GPS is back. The gyroscope's direction is learned from the GPS while driving, so it works whatever the car. It can be turned off in Settings.

The **Integrated Shizuku** patch removes the need for the Shizuku app. AARE pairs once with the phone's wireless debugging (Settings → Integrated Shizuku → Pair, then the six-digit code in AARE's notification), and from then on starts its own small Shizuku server as the shell user, the way Shizuku does. AARE's car audio, app launcher and the Voice messages patch use it through the same Shizuku API, unchanged. The server serves AARE only. AARE starts it again by itself after a restart and each time the car connects, if it isn't running, as soon as the phone is on a Wi-Fi network: the car's own Wi-Fi works too, no internet needed (it switches wireless debugging on just for the start, and off again; the first time on a new network, choose *Always allow on this network*). Car audio channels opened before it is up start again on the Shizuku method.

The **Settings** patch (included with every other patch) adds a **Settings** row at the end of AARE's settings home. It opens a screen in AARE's style with one switch and a short description for each installed patch: Voice messages and Voice reply can be turned off there without patching again, and Background location shows whether *Allow all the time* is granted (tap it to open the permission). Each patch registers its own switch, so a new release of the patches brings its new switches by itself.

The patches only accept the official AARE releases, signed with the AARE release key published in its README.

### How to use

1. Add this repository to Morphe Manager: tap the button below, or add `https://github.com/Pirrotto/aare-patches` as a patch source.

   <a href="https://morphe.software/add-source?github=Pirrotto/aare-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>

2. Download the official `aare-<version>.apk` from the [AARE releases](https://github.com/prototux/AARE/releases) and patch it with Morphe Manager.
3. Uninstall the official AARE (the patched app has a different signature), then install the patched one and set AARE up again.
4. In **Settings → Apps → AARE → Permissions → Location**, choose **Allow all the time** (Background location).
5. Keep Shizuku running and allowed for AARE, as for car audio (Voice messages).

Navigation apps then keep following the car with the phone locked, with no need to open AARE before starting the car, and WhatsApp voice messages play in the car.

Patching AARE again later (a new AARE version, or another patch) installs over the patched app and keeps its settings, as long as Morphe Manager is the same: keep the same patches selected.

## 🆕 What's new / Novità

**English**

- **1.10 – Tunnel navigation**: with the car's GPS for the phone, the position keeps moving in tunnels (estimated from the car's speed, compass and gyroscope).
- **1.9 – Integrated Shizuku works reliably**: starts on any Wi-Fi (also where mDNS is filtered), one start at a time, and the server stays up after the start. *Copy diagnostics* in Settings reports its state.
- **1.9 – AARE assistant in German**, besides Italian and English (language in Settings).
- **1.8 – AARE assistant**: the voice button opens AARE's own assistant on the car screen (navigation, music, messages and replies, calls, time). Anything else goes to Google on the phone. **Car microphone** for dictation and the assistant.
- **1.7 – Integrated Shizuku starts by itself** after a restart and when the car connects, also on the car's Wi-Fi.
- **1.6 – Integrated Shizuku**: no Shizuku app needed, pair once with wireless debugging.
- **1.5 – Settings** in AARE: one switch per patch.
- **1.4 – Reply** in the notification centre, reply card for 15 seconds after reading.
- **1.3 – Voice reply**: dictate the answer, confirm, sent.
- **1.2 – Voice messages**: WhatsApp voice notes play in the car.
- **1.0 – Background location**: navigation keeps GPS with the phone locked.

Every release lists its fixes in [the releases](https://github.com/Pirrotto/aare-patches/releases) and in [CHANGELOG.md](CHANGELOG.md).

**Italiano**

- **1.10 – Navigazione in galleria**: col GPS dell'auto per il telefono, in galleria la posizione continua ad avanzare (stimata da velocità, bussola e giroscopio dell'auto).
- **1.9 – Shizuku integrato affidabile**: parte con qualsiasi Wi-Fi (anche dove gli annunci di rete sono bloccati), un avvio alla volta, e il server resta acceso. In Settings, *Copia diagnostica* ne mostra lo stato.
- **1.9 – Assistente AARE in tedesco**, oltre a italiano e inglese (lingua in Settings).
- **1.8 – Assistente AARE**: il tasto vocale apre l'assistente di AARE sullo schermo dell'auto (navigazione, musica, messaggi e risposte, chiamate, ora); il resto va a Google sul telefono. **Microfono dell'auto** per dettatura e assistente.
- **1.7 – Shizuku integrato si avvia da solo** dopo un riavvio e quando ti colleghi all'auto, anche col Wi-Fi dell'auto.
- **1.6 – Shizuku integrato**: niente app Shizuku, accoppiamento una volta col debug wireless.
- **1.5 – Settings** in AARE: un interruttore per ogni patch.
- **1.4 – Rispondi** nel centro notifiche, scheda di risposta per 15 secondi dopo la lettura.
- **1.3 – Risposta vocale**: detti la risposta, confermi, inviata.
- **1.2 – Messaggi vocali**: i vocali WhatsApp si sentono in auto.
- **1.0 – Posizione in background**: la navigazione mantiene il GPS a telefono bloccato.

Ogni release elenca le correzioni nelle [release](https://github.com/Pirrotto/aare-patches/releases) e nel [CHANGELOG.md](CHANGELOG.md).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.2](https://github.com/Pirrotto/aare-patches/releases/tag/v1.10.2)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**8 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**AARE**](PATCHES.md#aare-netprototuxaare) | 8 | `1.5.0` | [`net.prototux.aare`](https://play.google.com/store/apps/details?id=net.prototux.aare) |
<!-- PATCHES_END -->

## 🧑‍💻 Building

- Make changes on the `dev` branch and use [semantic commit](https://www.conventionalcommits.org) messages (`feat:`, `fix:`, `chore:`). `release.yml` publishes the releases.
- Local build: `./gradlew buildAndroid`, then find the bundle in `patches/build/libs/patches-*.mpp`.

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information. This project is not affiliated with Morphe or with AARE.

## 📜 License

AARE Background Location Patches are licensed under the [GNU General Public License v3.0](LICENSE).

## 🙏 Credits

The Integrated Shizuku patch builds on the work of others:

- [Shizuku](https://github.com/RikkaApps/Shizuku) (Apache-2.0) and [Shizuku-API](https://github.com/RikkaApps/Shizuku-API) (MIT): adb client, pairing flow and the server protocol AARE speaks.
- [libadb-android](https://github.com/MuntashirAkon/libadb-android) (GPL-3.0-or-later or Apache-2.0): the pairing protocol.
- [BoringSSL](https://boringssl.googlesource.com/boringssl)'s `spake25519.cc`: the SPAKE2 variant adb uses, rewritten in plain Java for the pairing.
