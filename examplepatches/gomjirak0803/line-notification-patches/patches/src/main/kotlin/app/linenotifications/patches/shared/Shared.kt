package app.linenotifications.patches.shared

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction

internal const val LINE_SETTINGS = "Lapp/linenotifications/extension/Settings;"
internal const val NOTIFICATIONS = "Lapp/linenotifications/extension/Notifications;"

object Constants {
    val COMPATIBILITY_LINE = Compatibility(
        name = "LINE",
        packageName = "jp.naver.line.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x06C755,
        targets = listOf(AppTarget(version = "26.19.0", versionCode = 261900178, isExperimental = false, minSdk = 30)),
    )
}

internal val verifiedLineVersionPatch = bytecodePatch {
    execute {
        if (packageMetadata.packageName != "jp.naver.line.android" ||
            packageMetadata.versionName != "26.19.0" || packageMetadata.versionCode != "261900178") {
            throw PatchException("Only inspected LINE 26.19.0 (261900178) is supported")
        }
    }
}

internal val lineSettingsExtensionPatch = bytecodePatch {
    dependsOn(verifiedLineVersionPatch)
    extendWith("extensions/extension.mpe")
    execute {
        // The optimized native setter requires sm8.c, not merely Continuation.
        // Wrap the Java completion callback in LINE's real coroutine base.
        classDefBy("Lsm8/c;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Lkotlin/coroutines/Continuation;")
        }
        val bridge = mutableClassDefBy("Lapp/linenotifications/extension/NotificationContinuation;")
        if (bridge.superclass != "Ljava/lang/Object;") throw PatchException("Continuation bridge superclass changed")
        bridge.setSuperClass("Lsm8/c;")
        val constructor = bridge.methods.single { it.name == "<init>" }
        check(constructor.implementation!!.registerCount == 2)
        constructor.replaceInstruction(0, "invoke-direct {p0, p1}, Lsm8/c;-><init>(Lkotlin/coroutines/Continuation;)V")
        constructor.addInstructions(0, "check-cast p1, Lkotlin/coroutines/Continuation;")
        val app = mutableClassDefBy("Ljp/naver/line/android/LineApplication;")
        val create = app.methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        create.addInstructions(0, "invoke-static/range {p0 .. p0}, $LINE_SETTINGS->init(Landroid/content/Context;)V")
    }
}

internal fun BytecodePatchContext.markIncluded(name: String) {
    mutableClassDefBy(LINE_SETTINGS).methods.single { it.name == name && it.parameterTypes.isEmpty() }
        .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
}
