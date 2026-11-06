package app.template.patches.reddit.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Targets AccountJsonAdapter.fromJson(JsonReader) — the Moshi deserialization
 * entry point that converts Reddit's /api/v1/me JSON into the in-memory
 * Lcom/reddit/domain/model/Account; object.
 *
 * WHY THIS ANCHOR (data-source surgery > leaf-patch surgery):
 *   The app consults Account.hasPremium / isPremiumSubscriber in only a
 *   handful of places, but those places are version-dependent UI code.
 *   The Moshi adapter is THE stable choke point: every Account object the app
 *   ever sees is born here, and JSON key names ("is_gold",
 *   "has_gold_subscription", "has_premium_avatar_treatment") are a public API
 *   contract — R8 cannot rename payload strings.
 *
 * Verified on Reddit 2026.42.0 (versionCode 2642020/2642021, Oct 2026):
 *   class  : smali_classes4/com/reddit/domain/model/AccountJsonAdapter.smali
 *   fromJson: line 778 → fromJson(Lcom/squareup/moshi/e;)Ljava/lang/Object;  (public)
 *   <init>  : line 175 → <init>(Lcom/squareup/moshi/j;)V                     (public)
 *   toJson  : line 4268 → toJson(Luir;Ljava/lang/Object;)V
 *
 * Declaration style deliberately mirrors the production-proven reference pack
 * (rushiranpise/morphe-patches): definingClass + name + accessFlags +
 * returnType + exact full parameter descriptors. No partial "L" parameter
 * types and no string() filters: this exact field set compiles to the
 * constructor overload whose positional binary layout stays stable against
 * Manager/Patcher 2.0.0's compatibility constructors.
 */
object AccountFromJsonFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/AccountJsonAdapter;",
    name = "fromJson",
    returnType = "Ljava/lang/Object;",
    // "L" = any reference type (STARTS_WITH). The Moshi JsonReader class is
    // obfuscated per build (e; on 2026.42.0 / vc 2642020), so exact types would
    // match only one build. Binding-safe: list content does not affect which
    // Fingerprint ctor overload the compiler picks.
    parameters = listOf("L"),
    accessFlags = listOf(AccessFlags.PUBLIC)
)

/**
 * AccountJsonAdapter constructor — builds the Moshi JsonReader.Options table
 * (the ordered JSON key names). The patch reads this table to compute which
 * constructor parameter (and therefore which register) carries each premium
 * boolean at the Account construction sites inside fromJson.
 * Only one <init> with one reference parameter exists in the adapter class,
 * so class scope alone disambiguates it.
 */
object AccountJsonAdapterConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/domain/model/AccountJsonAdapter;",
    name = "<init>",
    // Upstream-proven constructor style: name + parameters ONLY (no returnType,
    // no accessFlags — both break constructor matching in Patcher 2.0.0).
    // Single Moshi JsonFactory param, obfuscated per build (j; on 2026.42.0) →
    // partial "L". The adapter class has exactly one constructor, so class
    // scope + one ref-param uniquely identifies it on every build.
    parameters = listOf("L"),
)
