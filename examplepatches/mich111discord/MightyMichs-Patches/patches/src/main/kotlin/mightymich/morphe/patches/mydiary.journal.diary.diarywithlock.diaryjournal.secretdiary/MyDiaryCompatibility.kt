package mightymich.morphe.patches.mydiary.journal.diary.diarywithlock.diaryjournal.secretdiary

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object MyDiaryCompatibility {
    val MY_DIARY = Compatibility(
        name = "My Diary",
        packageName = "mydiary.journal.diary.diarywithlock.diaryjournal.secretdiary",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF5722,
        targets = listOf(
            AppTarget(
                version = "1.04.16.0813"
                version = "1.04.17.0918"
            )
        )
    )
}
