package app.template.patches.expand

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXPAND
import java.security.MessageDigest
import java.util.UUID

/**
 * Forces Expand's `usePremiumStatus` hook to report an active Plus subscription.
 *
 * Expand 2.1.1 keeps this gate in its Hermes v96 bundle. The first edit changes
 * the hook's initial `isPremium` state to true. The second edits
 * `getSubscriptionStatus`: it forces the "active entitlement exists" flag true
 * and prevents the empty-entitlements branch, while leaving the optional
 * entitlement reads intact (they safely produce a null plan).
 *
 * The signatures include registers, property IDs, and surrounding instructions
 * from `decompiled/expand-hasm/instruction.hasm`; offsets are never hard-coded.
 */
@Suppress("unused")
val unlockPlusPatch = rawResourcePatch(
    name = "Unlock Plus",
    description = "Unlocks Expand Plus without a subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_EXPAND)

    execute {
        val bundlePath = "assets/index.android.bundle"
        val bundle = get(bundlePath)
        if (!bundle.exists()) {
            throw PatchException(
                "$bundlePath missing. Use a base/merged APK that includes the Hermes bundle.",
            )
        }

        val bytes = bundle.readBytes()

        // usePremiumStatus:
        //   GetByIdShort r3, r2, 1, "useState"
        //   LoadConstUndefined r8
        //   LoadConstFalse r2                  <- initial isPremium
        //   Call2 r3, r3, r8, r2
        val initialPremiumSignature = byteArrayOf(
            0x36, 0x03, 0x02, 0x01, 0xF9.toByte(),
            0x76, 0x08,
            0x79, 0x02,
            0x53, 0x03, 0x03, 0x08, 0x02,
        )
        val initialPremiumAt = bytes.findUnique(
            initialPremiumSignature,
            "usePremiumStatus initial state",
        ) ?: throw PatchException(
            "usePremiumStatus initial-state signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        // LoadConstFalse (0x79) -> LoadConstTrue (0x78), retaining destination r2.
        bytes[initialPremiumAt + 7] = 0x78

        // getSubscriptionStatus:
        //   GetById r9, r2, 2, "active" (string id 29576 / 0x7388)
        //   Not r2, r9
        //   Not r7, r2                       <- r7 = Boolean(active)
        //   JmpTrue +46, r2                  <- skips to non-premium result when empty
        val activeEntitlementSignature = byteArrayOf(
            0x37, 0x09, 0x02, 0x02, 0x88.toByte(), 0x73,
            0x0B, 0x02, 0x09,
            0x0B, 0x07, 0x02,
            0x90.toByte(), 0x2E, 0x02,
        )
        val activeEntitlementAt = bytes.findUnique(
            activeEntitlementSignature,
            "getSubscriptionStatus active-entitlement gate",
        ) ?: throw PatchException(
            "getSubscriptionStatus entitlement signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        // Keep both three-byte instruction slots valid:
        //   LoadConstFalse r2; AsyncBreakCheck  -> do not take the empty-result jump
        //   LoadConstTrue  r7; AsyncBreakCheck  -> return isPremium=true
        byteArrayOf(
            0x79, 0x02, 0x62,
            0x78, 0x07, 0x62,
        ).copyInto(bytes, destinationOffset = activeEntitlementAt + 6)

        // Explore's experience cards and detail page use a separate GraphQL gate:
        // `useEventExperienceAccess` returns hasEventAccess by comparing the server response
        // with true. This is what controls the lock badges, "Subscribe to" button, and paywall
        // shown in the experience UI.
        //
        //   Call3 r1, r5, r6, r1, r0
        //   NewObject r0
        //   StrictEq r3, r3, r4              <- hasEventAccess
        //   PutNewOwnById r0, r3, 62436      <- "hasEventAccess"
        val eventAccessSignature = byteArrayOf(
            0x54, 0x01, 0x05, 0x06, 0x01, 0x00,
            0x03, 0x00,
            0x0F, 0x03, 0x03, 0x04,
            0x40, 0x00, 0x03, 0xE4.toByte(), 0xF3.toByte(),
        )
        val eventAccessAt = bytes.findUnique(
            eventAccessSignature,
            "useEventExperienceAccess result",
        ) ?: throw PatchException(
            "Experience-access signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        // StrictEq occupies four bytes. Force its destination r3 true and fill the remaining
        // two bytes with operand-free AsyncBreakCheck instructions to preserve bytecode layout.
        byteArrayOf(
            0x78, 0x03, 0x62, 0x62,
        ).copyInto(bytes, destinationOffset = eventAccessAt + 8)

        // ExperienceCard receives a separate `locked` prop from its parent list query. Force
        // the normalized local value false so card badges and locked press handling are disabled.
        //
        //   GetById r2, r1, 5, 30457            <- "locked"
        //   LoadConstFalse r29
        //   JStrictEqual +7, r2, r3
        //   Mov r29, r2                         <- overwrite default with server value
        val experienceCardLockSignature = byteArrayOf(
            0x37, 0x02, 0x01, 0x05, 0xF9.toByte(), 0x76,
            0x79, 0x1D,
            0xBC.toByte(), 0x07, 0x02, 0x03,
            0x08, 0x1D, 0x02,
        )
        val experienceCardLockAt = bytes.findUnique(
            experienceCardLockSignature,
            "ExperienceCard locked prop",
        ) ?: throw PatchException(
            "Experience-card lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x1D, 0x62,
        ).copyInto(bytes, destinationOffset = experienceCardLockAt + 12)

        // ExperienceDetailComponent independently normalizes its own `locked` prop. This value
        // selects the "Subscribe to Play" button instead of the normal play action.
        //
        //   GetById r4, r1, 20, 30457           <- "locked"
        //   LoadConstFalse r36
        //   JStrictEqual +7, r4, r3
        //   Mov r36, r4                         <- overwrite default with computed lock
        val experienceDetailLockSignature = byteArrayOf(
            0x37, 0x04, 0x01, 0x14, 0xF9.toByte(), 0x76,
            0x79, 0x24,
            0xBC.toByte(), 0x07, 0x04, 0x03,
            0x08, 0x24, 0x04,
        )
        val experienceDetailLockAt = bytes.findUnique(
            experienceDetailLockSignature,
            "ExperienceDetailComponent locked prop",
        ) ?: throw PatchException(
            "Experience-detail lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x24, 0x62,
        ).copyInto(bytes, destinationOffset = experienceDetailLockAt + 12)

        // TimerSoundscapesSection reads `isPremium` independently before deciding whether to
        // place TimerUiLocked over each soundscape. Force that local hook result true.
        val timerPremiumSignature = byteArrayOf(
            0x37, 0x07, 0x06, 0x0E, 0x70, 0xF7.toByte(),
            0x2A, 0x08, 0x07, 0x07,
            0x36, 0x06, 0x06, 0x0F, 0xAF.toByte(),
        )
        val timerPremiumAt = bytes.findUnique(
            timerPremiumSignature,
            "TimerSoundscapesSection premium status",
        ) ?: throw PatchException(
            "Timer-soundscape premium signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x78, 0x07, 0x62, 0x62, 0x62, 0x62,
        ).copyInto(bytes, destinationOffset = timerPremiumAt)

        // JourneyFeature has its own usePremiumStatus read. Its derived `locked` value chooses
        // the journey's subscription CTA and redirects experience presses to the paywall.
        val journeyPremiumSignature = byteArrayOf(
            0x37, 0x04, 0x07, 0x09, 0x70, 0xF7.toByte(),
            0x36, 0x0E, 0x07, 0x0A, 0xAF.toByte(),
        )
        val journeyPremiumAt = bytes.findUnique(
            journeyPremiumSignature,
            "JourneyFeature premium status",
        ) ?: throw PatchException(
            "Journey premium signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x78, 0x04, 0x62, 0x62, 0x62, 0x62,
        ).copyInto(bytes, destinationOffset = journeyPremiumAt)

        // The Timer screen also derives and stores `isLocked` on each soundscape card.
        // Override that final value directly so the card cannot be disabled or open a paywall.
        val timerCardLockSignature = byteArrayOf(
            0x36, 0x03, 0x01, 0x05, 0xDE.toByte(),
            0x73, 0x02, 0x83.toByte(), 0x7A,
            0x0F, 0x02, 0x03, 0x02,
            0x92.toByte(), 0x0D, 0x02,
            0x29, 0x03, 0x01,
            0x2E, 0x03, 0x03, 0x03,
            0x0B, 0x02, 0x03,
            0x40, 0x00, 0x02, 0x2A, 0xF7.toByte(),
        )
        val timerCardLockAt = bytes.findUnique(
            timerCardLockSignature,
            "Timer soundscape isLocked result",
        ) ?: throw PatchException(
            "Timer-card lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x02, 0x62,
        ).copyInto(bytes, destinationOffset = timerCardLockAt + 23)

        // TimerCardUi independently normalizes the `isLocked` prop supplied by both the
        // soundscape-section cards and the main timer carousel. Clear it at the shared UI
        // boundary so every card variant is rendered and pressed as unlocked.
        val timerCardUiLockSignature = byteArrayOf(
            0x37, 0x02, 0x00, 0x04, 0x2A, 0xF7.toByte(),
            0x79, 0x05,
            0xBC.toByte(), 0x07, 0x02, 0x03,
            0x08, 0x05, 0x02,
        )
        val timerCardUiLockAt = bytes.findUnique(
            timerCardUiLockSignature,
            "TimerCardUi isLocked prop",
        ) ?: throw PatchException(
            "Timer-card UI lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x05, 0x62,
        ).copyInto(bytes, destinationOffset = timerCardUiLockAt + 12)

        // The full Timer screen derives a separate selected-soundscape lock (`r47`) and uses
        // it to replace the Start controls with a subscription button. Force that final value
        // false as well; this path is separate from TimerSoundscapesSection and TimerCardUi.
        val timerSelectedLockSignature = byteArrayOf(
            0x36, 0x12, 0x26, 0x18, 0xDE.toByte(),
            0x73, 0x10, 0x83.toByte(), 0x7A,
            0x0F, 0x2F, 0x12, 0x10,
            0x92.toByte(), 0x06, 0x2F,
            0x0B, 0x2F, 0x0D,
        )
        val timerSelectedLockAt = bytes.findUnique(
            timerSelectedLockSignature,
            "Timer selected-soundscape lock",
        ) ?: throw PatchException(
            "Timer selected-soundscape lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x2F, 0x62,
        ).copyInto(bytes, destinationOffset = timerSelectedLockAt + 16)

        // Journey's presentation component normalizes a separate `locked` prop and uses it to
        // choose between the normal Begin/Start action and its subscription button.
        val journeyLockSignature = byteArrayOf(
            0x37, 0x01, 0x00, 0x02, 0xF9.toByte(), 0x76,
            0x76, 0x03,
            0x79, 0x0D,
            0xBC.toByte(), 0x07, 0x01, 0x03,
            0x08, 0x0D, 0x01,
            0x2A, 0x0C, 0x00, 0x0D,
        )
        val journeyLockAt = bytes.findUnique(
            journeyLockSignature,
            "Journey locked prop",
        ) ?: throw PatchException(
            "Journey lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x0D, 0x62,
        ).copyInto(bytes, destinationOffset = journeyLockAt + 14)

        // Explore's Multi-day Journeys carousel derives one more visual-only `locked` value
        // before constructing JourneyCard. Clear it to remove the "Premium content" badge and
        // lock icon now that the underlying journey is accessible.
        val exploreJourneyCardLockSignature = byteArrayOf(
            0x2E, 0x01, 0x09, 0x00,
            0x0B, 0x08, 0x01,
            0x29, 0x02, 0x01,
            0x2E, 0x01, 0x02, 0x03,
            0x36, 0x07, 0x01, 0x04, 0xA9.toByte(),
        )
        val exploreJourneyCardLockAt = bytes.findUnique(
            exploreJourneyCardLockSignature,
            "Explore journey-card lock",
        ) ?: throw PatchException(
            "Explore journey-card lock signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x79, 0x08, 0x62,
        ).copyInto(bytes, destinationOffset = exploreJourneyCardLockAt + 4)

        // The Explore tab's Gateway Voyage panel is a purchase/subscription promotion rendered
        // by CoursePreviewCtaCard. Return null before constructing the card.
        val gatewayPromotionSignature = byteArrayOf(
            0x6C, 0x04, 0x01,
            0x36, 0x07, 0x04, 0x01, 0xEC.toByte(),
            0x37, 0x01, 0x04, 0x02, 0x0F, 0x87.toByte(),
        )
        val gatewayPromotionAt = bytes.findUnique(
            gatewayPromotionSignature,
            "CoursePreviewCtaCard Gateway promotion",
        ) ?: throw PatchException(
            "Gateway-promotion signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        // LoadConstNull r0; Ret r0. The remainder of the component is unreachable.
        byteArrayOf(
            0x77, 0x00, 0x5C, 0x00,
        ).copyInto(bytes, destinationOffset = gatewayPromotionAt)

        // The bottom "Unlock Expand Plus" / "Get it Now" promotion is ExpandPlusCard.
        // Premium users should not see it, so suppress the component entirely.
        val expandPlusPromotionSignature = byteArrayOf(
            0x6C, 0x00, 0x01,
            0x37, 0x01, 0x00, 0x01, 0x62, 0xFB.toByte(),
            0x73, 0x13, 0x0B, 0x41,
        )
        val expandPlusPromotionAt = bytes.findUnique(
            expandPlusPromotionSignature,
            "ExpandPlusCard promotion",
        ) ?: throw PatchException(
            "Expand Plus promotion signature not found in $bundlePath. " +
                "This patch only supports Expand 2.1.1 (Hermes v96).",
        )

        byteArrayOf(
            0x77, 0x00, 0x5C, 0x00,
        ).copyInto(bytes, destinationOffset = expandPlusPromotionAt)

        // Hermes v96 stores SHA-1(file without its final 20 bytes) in the footer.
        if (bytes.size < 20) {
            throw PatchException("$bundlePath is too small to be a valid Hermes bundle.")
        }
        val footerAt = bytes.size - 20
        val digest = MessageDigest.getInstance("SHA-1").digest(bytes.copyOf(footerAt))
        digest.copyInto(bytes, destinationOffset = footerAt)

        bundle.writeBytes(bytes)

        // Expo Updates caches the embedded Hermes bundle by the ID and commit time in
        // app.manifest. Without changing them, an in-place APK update can keep launching the
        // unpatched bundle copied by an earlier install. Give this modified embedded update a
        // deterministic ID based on its digest and a fresh commit time so Expo imports it.
        val manifestPath = "assets/app.manifest"
        val manifest = get(manifestPath)
        if (!manifest.exists()) {
            throw PatchException("$manifestPath missing; cannot refresh the Expo update identity.")
        }

        val manifestText = manifest.readText()
        val updateIdPattern = Regex(""""id":"[0-9a-fA-F-]{36}"""")
        val commitTimePattern = Regex(""""commitTime":\d+""")
        if (updateIdPattern.findAll(manifestText).count() != 1) {
            throw PatchException("Expected exactly one Expo update ID in $manifestPath.")
        }
        if (commitTimePattern.findAll(manifestText).count() != 1) {
            throw PatchException("Expected exactly one Expo commit time in $manifestPath.")
        }

        val patchedUpdateId = UUID.nameUUIDFromBytes(digest).toString()
        val patchedManifest = manifestText
            .replace(updateIdPattern, """"id":"$patchedUpdateId"""")
            .replace(commitTimePattern, """"commitTime":${System.currentTimeMillis()}""")
        manifest.writeText(patchedManifest)
    }
}

/** Returns one match, null for none, and rejects signatures that are not unique. */
private fun ByteArray.findUnique(pattern: ByteArray, label: String): Int? {
    if (pattern.isEmpty() || pattern.size > size) return null

    var found: Int? = null
    val last = size - pattern.size
    outer@ for (i in 0..last) {
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) continue@outer
        }
        if (found != null) {
            throw PatchException("$label signature matched more than once; refusing to patch.")
        }
        found = i
    }
    return found
}
