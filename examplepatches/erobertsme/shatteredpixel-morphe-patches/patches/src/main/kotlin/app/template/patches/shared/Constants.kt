package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
	val COMPATIBILITY_SHATTERED_PIXEL_DUNGEON = Compatibility(
		name = "Shattered Pixel Dungeon",
		packageName = "com.shatteredpixel.shatteredpixeldungeon",
		apkFileType = ApkFileType.APK,
		appIconColor = 0x2B2B2B,
		targets = listOf(
			AppTarget(
				version = "4.0.3",
				description = "From github.com/00-Evan/shattered-pixel-dungeon/releases: ShatteredPD-v4.0.3-Gplay.apk, the Google Play version, or ShatteredPD-v4.0.3-Android.apk, which has no supporter features.",
			),
			AppTarget(version = null, isExperimental = true),
		),
	)
}
