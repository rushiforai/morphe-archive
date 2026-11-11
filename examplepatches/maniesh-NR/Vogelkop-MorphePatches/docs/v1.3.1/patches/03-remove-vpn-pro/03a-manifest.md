# Patch 03a — AndroidManifest: strip 3 VPN Pro component declarations

## File

`AndroidManifest.xml` (decoded by apktool)

## What is removed

Three component declarations, each removed in full (opening tag through
closing tag, including any nested `<intent-filter>` and `<meta-data>`):

### Removal 1 — `VpnProReceiver` (boot-completed receiver, lines 508-512)

Prevents VPN Pro from auto-starting on `BOOT_COMPLETED`. The free VPN's
`VpnReceiver` (line 507) is left intact.

**Before:**
```xml
        <receiver android:exported="false" android:name="com.opera.android.vpn.VpnReceiver"/>
        <receiver android:exported="false" android:name="com.opera.android.vpn.VpnProReceiver">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
            </intent-filter>
        </receiver>
```

**After:**
```xml
        <receiver android:exported="false" android:name="com.opera.android.vpn.VpnReceiver"/>
```

### Removal 2 — `VpnProQuickSettingsTileService` (Quick Settings tile, lines 523-529)

Removes the Quick Settings tile from the system tile picker.

**Before:**
```xml
        <service android:exported="true" android:icon="@drawable/ic_material_vpn_on" android:label="@string/vpn_pro_title" android:name="com.opera.android.vpn.quick_settings_tile.VpnProQuickSettingsTileService" android:permission="android.permission.BIND_QUICK_SETTINGS_TILE">
            <intent-filter>
                <action android:name="android.service.quicksettings.action.QS_TILE"/>
            </intent-filter>
            <meta-data android:name="android.service.quicksettings.ACTIVE_TILE" android:value="true"/>
            <meta-data android:name="android.service.quicksettings.TOGGLEABLE_TILE" android:value="true"/>
        </service>
```

**After:** (the entire `<service>…</service>` block is deleted; the preceding
`</service>` of `OperaFirebaseMessagingService` and the following `<receiver>`
of `ShortcutUtils$Receiver` become adjacent)

### Removal 3 — `VpnProAppWidget` (App Widget, lines 587-592)

Removes the App Widget from the system widget picker.

**Before:**
```xml
        <receiver android:exported="false" android:label="@string/vpn_pro_title" android:name="com.opera.android.vpn.app_widget.VpnProAppWidget">
            <intent-filter>
                <action android:name="android.appwidget.action.APPWIDGET_UPDATE"/>
            </intent-filter>
            <meta-data android:name="android.appwidget.provider" android:resource="@xml/vpn_pro_widget_info"/>
        </receiver>
```

**After:** (the entire `<receiver>…</receiver>` block is deleted)

## Anchoring notes

Each block is uniquely identified by the `android:name="…VpnPro…"` attribute
on its top-level element. The three class names are stable across Opera Beta
builds because they are full Java FQNs declared in the source.

## Risk

* The smali classes for these three components (`VpnProReceiver`,
  `VpnProQuickSettingsTileService`, `VpnProAppWidget`) are left in place —
  they simply become unreferenced. This is fine: the Android runtime does
  not instantiate components that are not declared in the manifest.
* `@string/vpn_pro_title` is referenced only by these two `android:label`
  attributes (verified by grep). After removal, the string becomes an
  unused resource; layer 03c blanks it anyway.
* `@xml/vpn_pro_widget_info` is referenced only by the App Widget meta-data.
  After removal, it becomes an unused resource; harmless.
