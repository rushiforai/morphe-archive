# RingConn Morphe Patch Bundle

Official Morphe patch bundle for the **RingConn** Android application (`com.gdjztech.ringconn`), featuring an embedded **Intervals Direct** dashboard, sports science calibrated sleep scoring, local sync to [intervals.icu](https://intervals.icu), and standalone debug provider support for companion tools.

---

## Patches in this Bundle

This repository provides two modular patches that can be toggled independently in Morphe Manager:

### 1. RingConn Health Data Provider (`ringconn-provider`)
* **Developer & Companion App Support:** Injects and registers `com.gdjztech.ringconn.provider.HealthDataProvider` with authority `com.gdjztech.ringconn.provider`.
* Sets `android:debuggable="true"` in `AndroidManifest.xml` so external companion tools such as [Intervals Direct](https://github.com/DarioDKM/IntervalsDirect) can query sleep stages, resting HR, and temperature offset via ContentResolver.
* Lightweight: no UI elements, zero overhead.

### 2. Embedded Intervals Direct Dashboard (`ringconn-dashboard`)
* **Floating Action Button:** Injects an unobtrusive floating button into the RingConn main screen to open the dashboard directly without cluttering the app drawer.
* **OLED Dark Dashboard:** Complete English UI with deep `#070A11` background, stage percentages (`%` and minutes), efficiency rating, and 30-day sleep history.
* **Dual Sleep Score Engine:**
  * **Athletic (Recommended):** Non-linear sports recovery algorithm calibrated for endurance athletes. Prevents the common commercial inflation of short sleep durations by weighting sleep duration ($T^{2.2}$), slow-wave deep sleep ($D^{1.5}$), REM ($R^{1.5}$), and wake-after-sleep-onset (WASO).
  * **RingConn Official:** Direct export of the vendor's internal sleep score.
* **Direct Intervals.icu Sync:** Background auto-sync and manual 30-day sync directly from RingConn without requiring companion apps or external servers.

---

## How to Install (Using Morphe Manager on Android)

You do not need a computer, terminal, ADB, or root access. Everything runs directly on your Android phone.

### Step 1: Add the Patch Source to Morphe Manager

1. Open **Morphe Manager** on your Android device.
2. Tap **Sources** in the bottom navigation bar.
3. Tap **+** (or **Add**) in the top right corner.
4. Select the **Remote** tab and enter:
   ```text
   github.com/DarioDKM/ringconn-patches
   ```
5. Tap **Add**. Morphe Manager will fetch the patch definitions and bundle.

> [!TIP]
> **1-Click Deep Link:** On your Android phone, tap [Add to Morphe](https://morphe.software/add-source?github=DarioDKM/ringconn-patches) to automatically open Morphe Manager and register the source.

### Step 2: Patch RingConn

1. In Morphe Manager, switch to the **Dashboard / Patcher** tab.
2. Tap **Select an application** and choose **RingConn** (installed or from an APK file).
3. Select your desired patches:
   * Select both **RingConn Health Data Provider** and **Embedded Intervals Direct Dashboard** for the full experience.
   * Or select only **RingConn Health Data Provider** if you only want to use external companion apps.
4. Tap **Patch**. Morphe will unpack, patch, and repack the APK.
5. Tap **Install** to install the patched RingConn app.

---

## Sleep Score Algorithm: Athletic vs. Official

Commercial trackers often assign high scores (e.g. 80–85) to severely restricted sleep (under 6.5 hours) if fragmentation is low. For endurance athletes, recovery and glycogen replenishment require sufficient absolute duration and deep sleep phases.

The **Athletic Score** evaluates:
$$\text{Score} = \text{Duration} (40\,\text{pts}) + \text{Deep Sleep} (25\,\text{pts}) + \text{REM} (20\,\text{pts}) + \text{Efficiency} (15\,\text{pts})$$

* **Duration:** Scaled exponentially against 8 hours: $(\text{Duration}/480)^{2.2} \times 40$.
* **Deep Sleep:** Target 90 minutes of slow-wave sleep: $(\text{Deep}/90)^{1.5} \times 25$.
* **REM:** Target 100 minutes: $(\text{REM}/100)^{1.5} \times 20$.
* **Efficiency & WASO:** Punishes wakefulness after sleep onset exceeding 20 minutes.

*Example (06.09.2026, 6h 13m sleep, 40m Deep, 85m REM, 17m Awake):*
* RingConn Official Score: **84**
* Athletic Calibrated Score: **60**

---

## Building From Source

To build `patches-1.2.3.mpp` locally:

```bash
git clone https://github.com/DarioDKM/ringconn-patches.git
cd ringconn-patches
./build.sh
```

Output bundle will be located at `dist/patches-1.2.3.mpp`.

---

## License

Released under the [MIT License](LICENSE).
