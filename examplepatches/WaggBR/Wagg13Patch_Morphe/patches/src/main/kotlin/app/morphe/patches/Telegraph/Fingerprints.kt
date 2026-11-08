/*
 * Copyright (C) 2026 hxreborn
 * Copyright (C) 2026 Wagg13
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Adaptado de hxreborn/morphe-patches (patches/src/main/kotlin/app/morphe/patches/
 * graphmessenger/misc/premium/Fingerprints.kt):
 * https://github.com/hxreborn/morphe-patches
 */
package app.morphe.patches.telegraph.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patches.telegraph.shared.LICENSE_DAYS_LEFT_METHOD
import app.morphe.patches.telegraph.shared.LICENSE_EXPIRED_METHOD
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val CONNECTIONS_MANAGER_CLASS = "Lorg/telegram/tgnet/ConnectionsManager;"

// UserConfig.isPremium(): método público final, sem parâmetros, que retorna
// boolean lendo TLRPC$User.premium. É o mesmo ponto do UnlockPremiumPatch
// original (ver histórico do patch), reescrito aqui com os mesmos filtros
// usados pelo hxreborn (accessFlags fecham a correspondência a 1 método só).
internal object UserIsPremiumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lorg/telegram/tgnet/TLRPC\$User;",
            name = "premium",
        ),
    ),
)

internal object LicenseDaysLeftFingerprint : Fingerprint(
    filters = listOf(methodCall(definingClass = CONNECTIONS_MANAGER_CLASS, name = LICENSE_DAYS_LEFT_METHOD)),
)

internal object LicenseExpiredFingerprint : Fingerprint(
    filters = listOf(methodCall(definingClass = CONNECTIONS_MANAGER_CLASS, name = LICENSE_EXPIRED_METHOD)),
)
