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
> **[v1.0.1](https://github.com/FoxxoOwO/foxxo-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
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

---

## 📜 License
[GPLv3](LICENSE)
