/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.samsung.dailyboard.misc.phonesupport

import app.morphe.patcher.Fingerprint

private const val FEATURE_UTILS_CLASS =
    "Lcom/samsung/android/homemode/infra/utils/a;"

private const val DEVICE_UTILS_CLASS =
    "Lcom/samsung/android/homemode/infra/utils/e;"

internal object PogoFeatureFingerprint : Fingerprint(
    definingClass = FEATURE_UTILS_CLASS,
    name = "e",
    returnType = "Z",
    parameters = listOf()
)

internal object TaFeatureFingerprint : Fingerprint(
    definingClass = FEATURE_UTILS_CLASS,
    name = "i",
    returnType = "Z",
    parameters = listOf()
)

internal object SupportedDeviceFingerprint : Fingerprint(
    definingClass = DEVICE_UTILS_CLASS,
    name = "g",
    returnType = "Z",
    parameters = listOf()
)

internal object DockingFingerprint : Fingerprint(
    definingClass = DEVICE_UTILS_CLASS,
    name = "c",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

internal object PhotoRepositoryInitFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/external/repository/photo/PhotoRepository;",
    name = "init",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object PhotoDataSourceLookupFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/external/repository/photo/PhotoRepository;",
    name = "getPhotoDataSource",
    returnType = "Lz0/a;",
    parameters = listOf("I")
)

internal object SecureSettingsWriteFingerprint : Fingerprint(
    definingClass = "Lcom/bumptech/glide/d;",
    name = "w",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object CalendarDayInfoFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/external/datasource/calendar/b;",
    name = "b",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Landroid/content/Context;", "La0/c;")
)

internal object MusicSessionListenerFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/external/repository/music/MusicRepository;",
    name = "addPropertyChangeListener",
    returnType = "V",
    parameters = listOf("Ljava/beans/PropertyChangeListener;")
)

internal object WeatherRepositoryUpdateFingerprint : Fingerprint(
    definingClass = "Lk1/c;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object WeatherStateFingerprint : Fingerprint(
    definingClass = "Lk1/c;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I")
)

internal object WeatherSourceFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/context/sdk/samsunganalytics/internal/sender/b;",
    name = "x",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/widget/TextView;", "Lw0/b;")
)

internal object IconActivityOnCreateFingerprint : Fingerprint(
    definingClass =
        "Lcom/samsung/android/homemode/ui/activity/main/HomeModeIconActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object HomeModeApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/homemode/ui/HomeModeApp;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf()
)

internal object LauncherComponentStateFingerprint : Fingerprint(
    definingClass = "Lv1/a;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z")
)
