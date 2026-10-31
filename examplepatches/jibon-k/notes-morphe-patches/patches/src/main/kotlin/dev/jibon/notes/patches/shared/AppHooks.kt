package dev.jibon.notes.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/** MemoApplication.onCreate: hooks go right after the call to Application.onCreate(). */
object MemoApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/app/notes/MemoApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(methodCall(definingClass = "Landroid/app/Application;", name = "onCreate")),
)
