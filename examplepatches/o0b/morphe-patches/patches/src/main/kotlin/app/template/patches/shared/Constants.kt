package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
 // Business Calendar 2 2.55.6 — Play-flavor split bundle (.apks).
 val BUSINESS_CALENDAR_2_COMPATIBILITY = Compatibility(
  name = "Business Calendar 2",
  packageName = "com.appgenix.bizcal",
  apkFileType = ApkFileType.APKS,
  appIconColor = 0xD32F2F,
  targets = listOf(AppTarget(version = "2.55.6", versionCode = 255601))
 )

 val METEOBLUE_COMPATIBILITY = Compatibility(
  name = "meteoblue Weather",
  packageName = "com.meteoblue.droid",
  apkFileType = ApkFileType.APKS,
  appIconColor = 0x0077CC,
  targets = listOf(AppTarget(version = "Cirrus Uncinus 3.1.4", versionCode = 27041))
 )

 val OCTOPILAUNCHER_COMPATIBILITY = Compatibility(
  name = "Octopi Launcher",
  packageName = "com.otp.octopilauncher",
  apkFileType = ApkFileType.XAPK,
  appIconColor = 0xFF6600,
  targets = listOf(AppTarget(version = "1.92", versionCode = 2309))
 )

 val WAVELET_COMPATIBILITY = Compatibility(
  name = "Wavelet",
  packageName = "com.pittvandewitt.wavelet",
  apkFileType = ApkFileType.XAPK,
  appIconColor = 0x1E88E5,
  targets = listOf(AppTarget(version = "26.05", versionCode = 260508))
 )

 // Nova Launcher 8.1.6 ships as a plain APK (single dex, no splits).
 // The manifest versionName is literally "81006 (8.1.6)".
 val NOVA_LAUNCHER_COMPATIBILITY = Compatibility(
  name = "Nova Launcher",
  packageName = "com.teslacoilsw.launcher",
  apkFileType = ApkFileType.APK,
  appIconColor = 0xE53935,
  targets = listOf(AppTarget(version = "81006 (8.1.6)", versionCode = 81006))
 )

 // Your Calendar Widget 1.71.3 (523) — plain APK, pinned recon build
 // (sha256 ff53d3ea…ab7888; full hash in the calendarwidget patch headers).
 val CALENDAR_WIDGET_COMPATIBILITY = Compatibility(
  name = "Your Calendar Widget",
  packageName = "de.mash.android.calendar",
  apkFileType = ApkFileType.APK,
  appIconColor = 0x2E86AB,
  targets = listOf(AppTarget(version = "1.71.3", versionCode = 523))
 )

 // recon 2026-10-11: hurry 30.2 (186), exact dumped build, sha256 815dcbde…48cc
 val HURRY_COMPATIBILITY = Compatibility(
  name = "Hurry Day Countdown & Reminder",
  packageName = "com.samruston.hurry",
  apkFileType = ApkFileType.APKS, // ships as a Play bundle (.apkm)
  appIconColor = 0x1E88E5,
  targets = listOf(AppTarget(version = "30.2", versionCode = 186))
 )

 // recon 2026-11-09: Ivy 1.1.29 (29), exact dumped build, sha256 1bfc235d…42fef
 val IVY_COMPATIBILITY = Compatibility(
  name = "Ivy",
  packageName = "com.stinger.ivy",
  apkFileType = ApkFileType.APK,
  appIconColor = 0x2E7D32,
  targets = listOf(AppTarget(version = "1.1.29", versionCode = 29))
 )
}
