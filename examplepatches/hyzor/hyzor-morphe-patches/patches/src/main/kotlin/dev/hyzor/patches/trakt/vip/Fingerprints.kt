/*
 * Copyright 2026 ineednotitle
 * https://github.com/ineednotitle/Proteus-Patches
 *
 * Ported from the Trakt "Unlock VIP" patch in Proteus-Patches (GPLv3),
 * re-resolved for 3.28.0.
 */

package dev.hyzor.patches.trakt.vip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode
import dev.hyzor.patches.trakt.shared.Constants.USER
import dev.hyzor.patches.trakt.shared.Constants.USER_IS_VIP

/**
 * `User.<init>` — the public primary constructor, and the only place app code builds a `User`
 * from parsed data (`UserKt.a(User.Companion, i86)` maps the API model through it).
 *
 * 3.28.0 keeps the 3.26.1 field layout exactly:
 *
 *   `a=Ids`, `b..f=Strings`, `g=isPrivate(Z)`, `h=isVip(Z)`, `i=isVipEp(Z)`,
 *   `j=isVipOg(Z)`, `k=isDirector(Z)`, `l=Images`, `m=Streamings`, `n=Settings`
 *
 * The parameter list is the anchor (the class name is kept by `@Serializable`), so a model
 * reshuffle fails the fingerprint rather than forcing the wrong boolean. `isVip` is the 8th
 * parameter, `p8`; the patch overwrites the register immediately before the `iput-boolean`
 * into `h`, so it never touches the `isVipEp`/`isVipOg`/`isDirector` flags.
 */
object UserConstructorFingerprint : Fingerprint(
    definingClass = USER,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ltv/trakt/trakt/common/model/Ids;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z", "Z", "Z", "Z", "Z",
        "Ltv/trakt/trakt/common/model/User\$Images;",
        "Ltv/trakt/trakt/common/model/User\$Streamings;",
        "Ltv/trakt/trakt/common/model/User\$Settings;",
    ),
    filters = listOf(
        // iput-boolean p8, p0, Ltv/trakt/trakt/common/model/User;->h:Z
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = USER,
            name = USER_IS_VIP,
        ),
    ),
)

/**
 * `User.<init>(I, …)` — the synthetic constructor Kotlinx-serialization uses when decoding a
 * `User` (the leading `I` is the `seen` mask).
 *
 * Upstream patched only the primary constructor because, in 3.26.1, the synthetic constructor
 * delegated to it. In 3.28.0 R8 emits the synthetic body with its own field stores, so decoded
 * `User`s (cached sessions, `CustomList` members) bypass the primary constructor. Forcing the
 * same field here as well is what makes *every* `User` the app holds report VIP.
 *
 * `isVip` is the 9th parameter, `p9`; the patch still resolves the store's value register from
 * the instruction itself rather than assuming that mapping.
 */
object UserSerializerConstructorFingerprint : Fingerprint(
    definingClass = USER,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I",
        "Ltv/trakt/trakt/common/model/Ids;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z", "Z", "Z", "Z", "Z",
        "Ltv/trakt/trakt/common/model/User\$Images;",
        "Ltv/trakt/trakt/common/model/User\$Streamings;",
        "Ltv/trakt/trakt/common/model/User\$Settings;",
    ),
    filters = listOf(
        // iput-boolean p9, p0, Ltv/trakt/trakt/common/model/User;->h:Z
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = USER,
            name = USER_IS_VIP,
        ),
    ),
)
