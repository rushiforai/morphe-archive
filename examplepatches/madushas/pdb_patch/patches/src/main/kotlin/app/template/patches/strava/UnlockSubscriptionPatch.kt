package app.template.patches.strava

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Strava 485.12 subscription architecture
//
// SubscriptionDetail (com.strava.subscriptions.data.models.SubscriptionDetail)
//   — fully non-obfuscated (was pb1/f in v474.14)
//   field isPremium:Z  ← primary gate for all premium feature checks
//
//   Private constructor (classes6.dex, 14 param registers, .locals 0):
//     <init>(JZLjava/lang/Long;SubscriptionState;SubscriptionSubState;
//            Product;String;RecurringPeriod;SubscriptionPlatform;
//            Long;Long;StravaProductAccess;)V
//     p1+p2 = athleteId:J (wide), p3 = isPremium:Z,
//     p4 = premiumExpiryTimeInMillis:Long, p5 = state:SubscriptionState
//
//   Three construction paths — all reach this constructor:
//     REST:    SubscriptionDetailRestDataSource → toSubscriptionDetail()
//     GraphQL: SubscriptionDetailGraphQLMapper.toDomain(svi.d) → new SubscriptionDetail(...)
//     DB:      SubscriptionDetailLocalDataSource.toSubscriptionDetail(entity) via JSON deserializer
//
//   P1 (full spoof — replaces the old "const/4 p3, 0x1" injection):
//   A free account's model has isPremium=false, state=FREE, expiry=null.
//   Forcing only isPremium=true left a frankenstate (premium=true + FREE +
//   null expiry) that UI logic can still nag on (isFree(), winback, renewal
//   banners). The ctor body is rewritten to force:
//     isPremium = true
//     premiumExpiryTimeInMillis = 4102358400000L (2099-12-31T23:59:59Z)
//     state = SubscriptionState.PAID
//   Everything else (athleteId, subState, product, purchaseToken, ...) passes
//   through untouched. Register count grows 14→16 for two scratch registers
//   (v0/v1 — the Long boxing needs a const-wide pair).
//
//   SubscriptionAccessSnapshot (the 99-call-site gate) copies isPremium and
//   state from SubscriptionDetail — both now consistently premium, so dark
//   mode, stat maps, share designs, winback UI all see a coherent PAID state.
//
// OTP / password login (classes4.dex):
//   RequestOtpLogInNetworkResponse.getUsePassword()Z — unchanged from v474.
//   Fingerprinted by stable non-obfuscated definingClass + name.
//   NOTE (2026-10-22): on-emulator OTP login fails identically on the
//   ORIGINAL Strava-signed APK → server-side bot/integrity defense, not a
//   client gate; this half of the patch stays for real-device use.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Strava Premium features (spoofs PAID state + far-future expiry). Also re-enables password login after OTP.",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {

        // ── DOMAIN MODEL: SubscriptionDetail.<init> — full body rewrite ──────
        //
        // Clear the original body, grow to 16 registers (p0 shifts to reg 2,
        // freeing v0/v1), and re-emit every field store with the premium
        // spoof applied to p3 (isPremium) and p4/p5 (expiry/state).
        val ctor = mutableClassDefBy("Lcom/strava/subscriptions/data/models/SubscriptionDetail;")
            .directMethods
            .first { it.name == "<init>" && it.accessFlags and AccessFlags.PRIVATE.value != 0 }

        ctor.clearBody()
        ctor.ensureRegisters(16)
        ctor.addInstructions(
            0,
            """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V

                iput-wide p1, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->athleteId:J

                # isPremium = true
                const/4 v0, 0x1
                iput-boolean v0, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->isPremium:Z

                # premiumExpiryTimeInMillis = 4102358400000L (2099-12-31T23:59:59Z)
                const-wide v0, 0x3bb279d7c00L
                invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v0
                iput-object v0, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->premiumExpiryTimeInMillis:Ljava/lang/Long;

                # state = SubscriptionState.PAID
                sget-object v0, Lcom/strava/subscriptions/data/models/SubscriptionState;->PAID:Lcom/strava/subscriptions/data/models/SubscriptionState;
                iput-object v0, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->state:Lcom/strava/subscriptions/data/models/SubscriptionState;

                # untouched passthroughs
                iput-object p6, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->subState:Lcom/strava/subscriptions/data/models/SubscriptionSubState;
                iput-object p7, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->product:Lcom/strava/subscriptions/data/models/Product;
                iput-object p8, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->purchaseToken:Ljava/lang/String;
                iput-object p9, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->recurringPeriod:Lcom/strava/subscriptions/data/models/RecurringPeriod;
                iput-object p10, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->subscriptionPlatform:Lcom/strava/subscriptions/data/models/SubscriptionPlatform;
                iput-object p11, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->subscriptionStartTimeInMillis:Ljava/lang/Long;
                iput-object p12, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->subscriptionId:Ljava/lang/Long;

                # productAccess = StravaProductAccess(bitfield = all bits).
                # Free accounts get bitfield=0 from the server, so hasAccess()
                # gates (Runna plans, product-scoped features) all fail even
                # with isPremium=true. Force the full bitfield here AND patch
                # the three -impl statics below for consumers that read the
                # bitfield from raw payloads instead of SubscriptionDetail.
                const v0, -0x1
                invoke-static {v0}, Lcom/strava/subscriptions/data/models/StravaProductAccess;->box-impl(I)Lcom/strava/subscriptions/data/models/StravaProductAccess;
                move-result-object v0
                iput-object v0, p0, Lcom/strava/subscriptions/data/models/SubscriptionDetail;->productAccess:Lcom/strava/subscriptions/data/models/StravaProductAccess;

                return-void
            """.trimIndent(),
        )

        // ── P2a: StravaProductAccess gate statics ────────────────────────────
        //
        // Inline value class over an int bitfield. Force every gate true so
        // ALL consumers grant access (Runna, STRAVA, both — and any caller
        // reading a bitfield that did not pass through the ctor above).
        // Bodies overwrite p0 (the bitfield int) and return it — no extra
        // registers needed, register counts stay as-is after clearBody.
        val access = mutableClassDefBy("Lcom/strava/subscriptions/data/models/StravaProductAccess;")
        access.directMethods
            .first { it.name == "hasAccess-impl" }
            .apply {
                clearBody()
                addInstructions(0, "const/4 p0, 0x1\nreturn p0")
            }
        access.directMethods
            .first { it.name == "getHasAnyAccess-impl" }
            .apply {
                clearBody()
                addInstructions(0, "const/4 p0, 0x1\nreturn p0")
            }
        access.directMethods
            .first { it.name == "getHasNoAccess-impl" }
            .apply {
                clearBody()
                addInstructions(0, "const/4 p0, 0x0\nreturn p0")
            }

        // ── OTP / PASSWORD LOGIN ───────────────────────────────────────────────
        //
        // Stable non-obfuscated fingerprint — unchanged across versions.
        // Returns true so the app falls through to password login rather than
        // forcing OTP-only auth flow.
        Fingerprint(
            definingClass = "Lcom/strava/authorization/data/RequestOtpLogInNetworkResponse;",
            name = "getUsePassword",
            returnType = "Z",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
