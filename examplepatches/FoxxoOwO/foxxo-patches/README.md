# foxxo-patches 🦊

Kolekce vlastních patchů pro **Morphe Manager** (a kompatibilní patchery založené na ReVanced/Morphe ekosystému) vytvořená uživatelem **FoxxoOwO**.

---

## 🌿 Podporované aplikace a patche

### **AI Plant Doctor** (`me.jodoin.aiplantdoctor`)
- **Podporovaná verze:** `2.19.2`
- **Obsažené patche:**
  1. **Disable PairIP License Check (`disable-pairip-license-check`)**
     - Neutralizuje Google Play Integrity / PairIP ochranu integrity (`com.pairip.licensecheck.LicenseClient`).
     - Umožňuje bezproblémový běh modifikované aplikace bez pádů s chybou *"Get this app from Play"*.
  2. **Unlock Premium (`unlock-premium`)**
     - Odemyká veškeré prémiové funkce aplikace (neomezená identifikace chorob, detailní diagnostika, plné plány péče o rostliny).
     - Simuluje platné a aktivní předplatné ve Flutter `in_app_purchase` (Pigeon bridge) vrstvě.

---

## 📲 Jak přidat do Morphe Manageru

1. Otevřete aplikaci **Morphe Manager** na svém Android zařízení.
2. Přejděte do **Settings** -> **Sources** (Zdroje patchů).
3. Do pole pro zdroj patchů zadejte:
   ```
   https://github.com/FoxxoOwO/foxxo-patches
   ```
   případně odkaz na raw `patches-bundle.json`:
   ```
   https://raw.githubusercontent.com/FoxxoOwO/foxxo-patches/main/patches-bundle.json
   ```
4. V sekci **Patcher** vyberte nainstalovanou aplikaci **AI Plant Doctor** (nebo zvolte APK soubor verze 2.19.2).
5. Zvolte patche **Disable PairIP License Check** a **Unlock Premium**.
6. Klepněte na **Patch**, vyčkejte na dokončení a nainstalujte upravenou aplikaci!

---

## 💻 Přímé patchování na PC (bez Morphe Manageru)

Pokud chcete APK opatchovat přímo na počítači:
1. Zkopírujte původní `AI Plant Doctor.apk` do stejné složky se skriptem `tools/patch_apk.py`.
2. Spusťte:
   ```bash
   python tools/patch_apk.py
   ```
3. Skript upraví bytecode, vygeneruje podepsané `AI Plant Doctor-patched.apk` připravené k okamžité instalaci (`adb install "AI Plant Doctor-patched.apk"`).

---

## 📜 Licence

Tento projekt je šířen pod licencí **GPLv3**.
