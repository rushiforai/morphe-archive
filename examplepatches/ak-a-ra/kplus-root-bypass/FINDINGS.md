# K PLUS 6.1.0 Root Detection Findings

## Device
- POCO alioth, Android 13, bootloader locked, verified boot green
- SELinux enforcing, stock release-keys, no /data/adb, no su/magisk/ksu
- Not actually rooted

## App
- Package: com.kasikorn.retail.mbanking.wap
- APK: K PLUS_6.1.0.apks
- Security SDK: V-Key VGuard / V-OS

## Blocking Path
- VGuard.getSecurityStatus() -> VGSecurityStatus.UNSAFE
- V-Key shows VGFullScreenDialogActivity / safety deny screen
- Native root detection in libchecks.so:
  - Java_com_vkey_android_internal_vguard_engine_NativeThreatsChecker_checkForSuFilesNative
  - scan_root / scan_root_func
  - findSuidSgidFiles
  - checkForVncSshTelnet
- Triggered by com.vkey.android.aa -> NativeThreatsChecker.checkForSuFilesNative(...)

## Native Libraries
- libchecks.so
- libtoolChecker.so (RootBeer native check)
- libvosWrapperEx.so
- libsecurity_lite.so

## Likely False-Positive Triggers
- Developer options enabled
- USB debugging enabled
- Shizuku installed/running
- Termux environment installed
