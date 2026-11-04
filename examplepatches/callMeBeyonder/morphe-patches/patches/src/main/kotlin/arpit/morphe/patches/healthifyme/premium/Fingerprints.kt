package arpit.morphe.patches.healthifyme.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * `true` when [this] class has a field of [fieldType] annotated with Gson's
 * `@SerializedName` (`Lzh/c;` in 31.5) whose value is [serializedName].
 *
 * The serialized names are DEX annotation values and survive R8; they pin the exact
 * Gson model shape of a class, which instruction filters alone cannot express.
 */
private fun ClassDef.hasGsonField(serializedName: String, fieldType: String? = null): Boolean =
    fields.any { field ->
        (fieldType == null || field.type == fieldType) &&
            field.annotations.any { annotation ->
                annotation.type == "Lzh/c;" &&
                    annotation.elements.any { element ->
                        element.name == "value" &&
                            (element.value as? StringEncodedValue)?.value == serializedName
                    }
            }
    }

/**
 * The (obfuscated) name of the field annotated with Gson's `@SerializedName` value
 * [serializedName], or `null` when no such field exists.
 *
 * The serialized names survive R8, so this resolves the field without hard-coding an
 * obfuscated name that changes from build to build.
 */
private fun ClassDef.gsonFieldName(serializedName: String, fieldType: String? = null): String? =
    fields.firstOrNull { field ->
        (fieldType == null || field.type == fieldType) &&
            field.annotations.any { annotation ->
                annotation.type == "Lzh/c;" &&
                    annotation.elements.any { element ->
                        element.name == "value" &&
                            (element.value as? StringEncodedValue)?.value == serializedName
                    }
            }
    }?.name

/**
 * `true` when [this] reads the boolean field [fieldName] declared by [definingClass].
 *
 * Used to pin a plain Kotlin data-class getter to the exact backing field (resolved via
 * its stable Gson serialized name) instead of relying on the obfuscated getter name or
 * on the getter being the only `()Z` method in the class.
 */
private fun Method.readsBooleanField(definingClass: String, fieldName: String): Boolean =
    implementation?.instructions?.any { instruction ->
        if (instruction.opcode != Opcode.IGET_BOOLEAN) return@any false
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is FieldReference &&
            reference.definingClass == definingClass &&
            reference.name == fieldName &&
            reference.type == "Z"
    } == true

/**
 * `true` when [this] reads the object field [fieldName] declared by [definingClass].
 *
 * Companion to [readsBooleanField] for the nested Gson models (`LockedStateInfo`,
 * `TagButtonInfo`) whose obfuscated field names are resolved through their stable
 * serialized names.
 */
private fun Method.readsObjectField(definingClass: String, fieldName: String): Boolean =
    implementation?.instructions?.any { instruction ->
        if (instruction.opcode != Opcode.IGET_OBJECT) return@any false
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is FieldReference &&
            reference.definingClass == definingClass &&
            reference.name == fieldName
    } == true

/**
 * Matches `BaseProfile.isPaidUser()Z` (`Lcom/healthifyme/base/utils/a0;`, smali line 4403).
 *
 * A pure local SharedPreferences read: `prefs().getBoolean("is_user_premium", false)`.
 * Some flows read this getter directly instead of [BaseProfileIsPremiumUserFingerprint]
 * (e.g. `DpUtils`), so both are patched.
 *
 * Anchors: the `"is_user_premium"` key literal plus the `SharedPreferences.getBoolean`
 * call; the method name is kept by R8 in this build. Verified against
 * `smali/classes/com/healthifyme/base/utils/a0.smali` — `.registers 4`, `public`,
 * instruction order of the filters: `const-string "is_user_premium"` (line 4415) then
 * `invoke-interface ...->getBoolean(Ljava/lang/String;Z)Z` (line 4422).
 */
object BaseProfileIsPaidUserFingerprint : Fingerprint(
    name = "isPaidUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        // SharedPreferences key written from the server profile payload.
        string("is_user_premium"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            returnType = "Z",
        ),
    ),
)

/**
 * Matches `BaseProfile.isFreemiumUser()Z` (`Lcom/healthifyme/base/utils/a0;`, smali line 4066).
 *
 * Server-written flag (`"is_freemium_user"`, from the profile `hydrateFromJson` payload),
 * read locally from SharedPreferences. It is the first half of several dashboard/food-log
 * freemium gates — e.g. `FoodTrackerCardView` locks the food card on
 * `isFreemiumUser() && FreemiumLockStateConfigPref.shouldShowLockState()` — so forcing it
 * `false` makes the app treat the account as non-freemium everywhere, leaving the
 * server-delivered payload intact.
 *
 * Anchors: the `"is_freemium_user"` key literal plus `SharedPreferences.getBoolean`; the
 * method name is kept by R8 in this build. Verified against `smali/classes/com/healthifyme/`
 * `base/utils/a0.smali` — `.registers 4`, `public`, `const-string "is_freemium_user"`
 * (line 4078) then `invoke-interface ...->getBoolean(Ljava/lang/String;Z)Z` (line 4085).
 *
 * Side effect to be aware of: the `is_user_freemium` analytics payload and the
 * `Timeline.Freemium.isEligible` flag both read this value, so they flip to the
 * non-freemium branch as well.
 */
object BaseProfileIsFreemiumUserFingerprint : Fingerprint(
    name = "isFreemiumUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        // SharedPreferences key written from the server profile payload.
        string("is_freemium_user"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            returnType = "Z",
        ),
    ),
)

/**
 * Matches `BaseProfile.isPremiumUser()Z` (`Lcom/healthifyme/base/utils/a0;`, smali line 4439).
 *
 * The ≈40 premium UI gates all funnel through this getter. Body is
 * `isOnTrial() || isPaidUser()` — two virtual calls on `this`.
 *
 * Verified against `smali/classes/com/healthifyme/base/utils/a0.smali` — `.registers 3`,
 * `public`, filter order: `invoke-virtual ...->isOnTrial()Z` (line 4443) then
 * `invoke-virtual ...->isPaidUser()Z` (line 4451).
 */
object BaseProfileIsPremiumUserFingerprint : Fingerprint(
    name = "isPremiumUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "this",
            name = "isOnTrial",
            parameters = emptyList(),
            returnType = "Z",
        ),
        methodCall(
            definingClass = "this",
            name = "isPaidUser",
            parameters = emptyList(),
            returnType = "Z",
        ),
    ),
)

/**
 * Class locator for `FeatureConfig` (`Lcom/healthifyme/freemium/b$a;`).
 *
 * `FeatureConfig` is a Kotlin data class parsed from the server freemium payload
 * (`@SerializedName("is_locked")` on its only boolean field) and cached locally.
 *
 * Anchors (verified against `smali/classes12/com/healthifyme/freemium/b$a.smali`):
 * - `toString` literals `"FeatureConfig(headerText="` (line 634), `", locked="` (648),
 *   `", lockedStateInfo="` (676), `", tagButtonInfo="` (690) — the literal is unique in
 *   the APK;
 * - source file `FreemiumConfigResponse.kt` (line 3);
 * - Gson (`@zh/c`) boolean field `is_locked` (lines 82-86).
 *
 * The obfuscated class name `b$a` is deliberately not used as an anchor.
 */
object FeatureConfigClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("FeatureConfig(headerText="),
        string(", locked="),
        string(", lockedStateInfo="),
        string(", tagButtonInfo="),
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "FreemiumConfigResponse.kt" &&
            classDef.hasGsonField("is_locked", fieldType = "Z")
    },
)

/**
 * Class locator for the dashboard food-card model (`Lcom/healthifyme/basic/dashboard/`
 * `model/FoodCardStates;`, classes11).
 *
 * `FoodCardStates` is parsed from the dashboard payload's `food_card_states` object and
 * cached under the `"food_card_state"` preference. Its `shouldShowLockState` drives the
 * dashboard food card's lock icon and CTA hijack.
 *
 * Anchors (verified against `smali/classes11/com/healthifyme/basic/dashboard/model/`
 * `FoodCardStates.smali`):
 * - `toString` literals `"FoodCardStates(userSegment="` (line 2705), `", cardState="`
 *   (2719), `", shouldShowLockState="` (2775), `", pfcfLockInfo="` (2831);
 * - source file `FoodCardStates.kt` (line 3) — shared with `PfcfLockInfo`, hence not
 *   sufficient on its own;
 * - Gson (`@zh/c`) fields `should_show_lock_state` (boolean) and `pfcf_lock_info`.
 *
 * The class name is kept in this build but is deliberately not used as an anchor.
 */
object FoodCardStatesClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("FoodCardStates(userSegment="),
        string(", cardState="),
        string(", shouldShowLockState="),
        string(", pfcfLockInfo="),
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "FoodCardStates.kt" &&
            classDef.hasGsonField("should_show_lock_state", fieldType = "Z") &&
            classDef.hasGsonField("pfcf_lock_info")
    },
)

/**
 * Matches `FoodCardStates.getShouldShowLockState()Z` (`Lcom/healthifyme/basic/dashboard/`
 * `model/FoodCardStates;`, smali line 2126, method `g()Z`).
 *
 * Server-provided lock flag. Its only consumer is
 * `FreemiumLockStateConfigPref.m156366f()` (`"food_card_state"` → `FoodCardStates`), which
 * `FoodTrackerCardView` uses at lines 919/1386 to render the lock icon and to route the
 * card tap to the upsell URL instead of the tracker. Forcing it `false` removes that
 * branch; the card then falls through to the normal tracker flow.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-boolean v0, p0, ...->f:Z` + `return v0`. The field is resolved through its Gson
 * serialized name, not the obfuscated `f`.
 */
object FoodCardStatesShouldShowLockStateFingerprint : Fingerprint(
    classFingerprint = FoodCardStatesClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    custom = { method, classDef ->
        val fieldName = classDef.gsonFieldName("should_show_lock_state", fieldType = "Z")
        fieldName != null &&
            method.implementation?.registerCount == 2 &&
            method.readsBooleanField(classDef.type, fieldName)
    },
)

/**
 * Class locator for the PFCF lock model (`Lcom/healthifyme/basic/dashboard/model/`
 * `PfcfLockInfo;`, classes11).
 *
 * `PfcfLockInfo` is the `pfcf_lock_info` object inside the dashboard `food_card_states`
 * payload; its `isLocked` is the separate protein/fat/carbs/fibre card lock.
 *
 * Anchors (verified against `smali/classes11/com/healthifyme/basic/dashboard/model/`
 * `PfcfLockInfo.smali`):
 * - `toString` literals `"PfcfLockInfo(isLocked="` (line 601), `", deeplink="` (615),
 *   `", iconUrl="` (629);
 * - source file `FoodCardStates.kt` (line 3);
 * - Gson (`@zh/c`) fields `is_locked` (boolean), `deeplink`, `icon_url`.
 */
object PfcfLockInfoClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("PfcfLockInfo(isLocked="),
        string(", deeplink="),
        string(", iconUrl="),
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "FoodCardStates.kt" &&
            classDef.hasGsonField("is_locked", fieldType = "Z") &&
            classDef.hasGsonField("deeplink") &&
            classDef.hasGsonField("icon_url")
    },
)

/**
 * Matches `PfcfLockInfo.getIsLocked()Z` (`Lcom/healthifyme/basic/dashboard/model/`
 * `PfcfLockInfo;`, smali line 275, method `c()Z`).
 *
 * Its only consumer is `FreemiumLockStateConfigPref.m156373n()`, which feeds
 * `FoodTrackerCardView`'s PFCF card state (`isPfcfLocked`). Forcing it `false` clears the
 * PFCF lock branch while leaving the card's content untouched.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-boolean v0, p0, ...->a:Z` + `return v0`.
 */
object PfcfLockInfoIsLockedFingerprint : Fingerprint(
    classFingerprint = PfcfLockInfoClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    custom = { method, classDef ->
        val fieldName = classDef.gsonFieldName("is_locked", fieldType = "Z")
        fieldName != null &&
            method.implementation?.registerCount == 2 &&
            method.readsBooleanField(classDef.type, fieldName)
    },
)

/**
 * Matches `FeatureConfig.getLocked()Z` (`Lcom/healthifyme/freemium/b$a;`, smali line 139).
 *
 * Plain getter over the deserialized `is_locked` field; consumers
 * (`FreemiumDataUseCase` and the dashboard/assistant view models) read it locally,
 * so forcing it `false` clears all six freemium feature locks
 * (`food_tracking`, `pfcf`, `snap`, `active_choices`, `ria`, `timeline_insight`).
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-boolean v0, p0, ...->b:Z` + `return v0` — the only zero-arg boolean getter
 * of the class.
 */
object FeatureConfigIsLockedFingerprint : Fingerprint(
    classFingerprint = FeatureConfigClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    // `.registers 2` (one local + `p0`) — the plain boolean-getter shape.
    custom = { method, _ -> method.implementation?.registerCount == 2 },
)

/**
 * Matches `FeatureConfig.getLockedStateInfo()` (`Lcom/healthifyme/freemium/b$a;`,
 * method `c()`).
 *
 * The new-generation dashboard builds the PFCF "Unlock Macros" pill from
 * `lockedStateInfo.ctaButtonConfig` **regardless of `getLocked()`**:
 * `NewGenTrackersHelper.m48003v()` attaches the CTA whenever `locked_state_info` is
 * present and `Pfcf` draws it whenever the CTA is non-null. The same payload feeds the
 * Ria, active-choice, and timeline-insight locked banners. Returning `null` removes all
 * of those locked CTAs while leaving the rest of the server config (header/title/type)
 * intact; `getLocked()` is already forced `false`.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-object v0, p0, ...->d:Lcom/healthifyme/freemium/b$a$b;` + `return-object v0`.
 */
object FeatureConfigLockedStateInfoFingerprint : Fingerprint(
    classFingerprint = FeatureConfigClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/healthifyme/freemium/b\$a\$b;",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
    ),
    custom = { method, classDef ->
        val fieldName = classDef.gsonFieldName("locked_state_info")
        fieldName != null &&
            method.implementation?.registerCount == 2 &&
            method.readsObjectField(classDef.type, fieldName)
    },
)

/**
 * Matches `FeatureConfig.getTagButtonInfo()` (`Lcom/healthifyme/freemium/b$a;`,
 * method `d()`).
 *
 * The tag is the dashboard's "Free trial Expired" / "Premium Feature" chip rendered by
 * `NutritionFrontContentKt` (`FreemiumDivider(pfcf.getFreemiumTag())`) and the equivalent
 * tag on active-choice cards. Returning `null` drops the expired-trial chip while the
 * card content stays.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-object v0, p0, ...->e:Lcom/healthifyme/freemium/b$a$c;` + `return-object v0`.
 */
object FeatureConfigTagButtonInfoFingerprint : Fingerprint(
    classFingerprint = FeatureConfigClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/healthifyme/freemium/b\$a\$c;",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
    ),
    custom = { method, classDef ->
        val fieldName = classDef.gsonFieldName("tag_button_info")
        fieldName != null &&
            method.implementation?.registerCount == 2 &&
            method.readsObjectField(classDef.type, fieldName)
    },
)

/**
 * Class locator for `NextGenDashboardResponseItem` (`Lhp0/n0;` in 31.6, `Lpp0/n0;`
 * in 31.5, classes12).
 *
 * The dashboard_v3 response item that carries the header's server-provided status chip
 * (`user_state_tag_info`, e.g. "Free Trial Expired" with type
 * `free_trial_new_hook_premium_tag_locked_pwyw`).
 *
 * Anchors:
 * - `toString` literal `"NextGenDashboardResponseItem(extraData="` — unique in the APK;
 * - Gson (`@zh/c`) field `user_state_tag_info`.
 *
 * The obfuscated package moved from `pp0` to `hp0` in 31.6, so the name is deliberately
 * not used as an anchor.
 */
object NextGenDashboardResponseItemClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("NextGenDashboardResponseItem(extraData="),
    ),
    custom = { _, classDef ->
        classDef.hasGsonField("user_state_tag_info")
    },
)

/**
 * Matches `NextGenDashboardResponseItem.getUserStatusTag()` (`Lhp0/n0;` in 31.6,
 * `Lpp0/n0;` in 31.5, method `t()`).
 *
 * `DashboardResponseUseCase` converts the tag into the header `FreemiumHeader`
 * ("Free Trial Expired" chip). Returning `null` hides the chip; the caller already
 * handles a null tag by building no header. The rest of the profile header is untouched.
 *
 * Getter shape (verified for both versions): `.registers 2`, `public final`, body is a
 * single `iget-object v0, p0, ...->d:<package>/e1;` + `return-object v0`. The return
 * type's package moved with the model, so the getter is resolved through its Gson field
 * rather than a hardcoded type.
 */
object NextGenDashboardUserStatusTagFingerprint : Fingerprint(
    classFingerprint = NextGenDashboardResponseItemClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
    ),
    custom = { method, classDef ->
        val fieldName = classDef.gsonFieldName("user_state_tag_info")
        fieldName != null &&
            method.implementation?.registerCount == 2 &&
            method.readsObjectField(classDef.type, fieldName)
    },
)

/**
 * Class locator for the Ria insight screen model `UiModelV3` (`Lyw0/v;`, classes12).
 *
 * The model carries the per-screen `shouldShowLockState` flag that
 * `RiaInsightFragment` passes into every insight card holder (macro, micro, foods,
 * meal suggestions), so forcing it `false` unlocks the whole "Today's Insights" page.
 *
 * Anchors (verified against `smali/classes12/yw0/v.smali`):
 * - `toString` literal `"UiModelV3(groups="` — unique in the APK;
 * - source file `UiModel.kt`.
 */
object RiaInsightUiModelClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("UiModelV3(groups="),
    ),
    custom = { _, classDef -> classDef.sourceFile == "UiModel.kt" },
)

/**
 * Matches `UiModelV3.getShouldShowLockState()` (`Lyw0/v;`, method `d()`).
 *
 * `RiaInsightFragment.m75576s0()` reads this flag and forwards it to `m75537C0()`, which
 * builds `MacroCardVH`, `MicroCardVH`, `FoodCardVH3`, `MealSuggestionCardVH`, and the
 * other insight holders with the locked state; the "Detailed Premium Analysis",
 * "Unlock All Micronutrients", and "out of free Suggestions" surfaces all come from that
 * page. Forcing `false` renders the unlocked variants of those cards.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-boolean v0, p0, ...->b:Z` + `return v0`. `c()` is the sibling
 * `getShouldShowEmptyState()` getter, hence the method-name pin.
 */
object RiaInsightShouldShowLockStateFingerprint : Fingerprint(
    classFingerprint = RiaInsightUiModelClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    custom = { method, _ ->
        method.name == "d" && method.implementation?.registerCount == 2
    },
)

/**
 * Matches `AllNutrientsViewModel.getShouldShowLockedState()Z` (`Lnx/b;` in 31.6,
 * `Lvx/b;` in 31.5, method `K()`).
 *
 * The "All Nutrients" screen (`AllNutrientsActivity`) builds its nutrient adapter unlocked,
 * then after 450 ms calls `NutrientsAdapter.m151021O(true)` when this getter is `true`:
 * every row after position 0 is blurred and the upgrade footer is shown. The getter
 * delegates to `OtherNutrientsInteractor.mo144274b()`, which is `!FaPreference.B1()` — a
 * local preference read, not a server entitlement. Forcing it `false` skips the locked
 * branch entirely, so all nutrient values stay readable and the footer is never shown.
 *
 * `K()` is the only caller of that interactor method in this screen, and its only call
 * site is `AllNutrientsActivity.m51255l6()` (dashboard/insight "all nutrients" entry).
 * Getter shape (verified for both versions): `.registers 2`, `public final`,
 * `iget-object` the interactor field, `invoke-interface ->b()Z`, `move-result`, `return`.
 * The interactor's package changed in 31.6, so the call is matched by shape rather than
 * by its obfuscated type.
 */
object AllNutrientsLockedStateFingerprint : Fingerprint(
    name = "K",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        val implementation = method.implementation
        implementation != null &&
            implementation.registerCount == 2 &&
            implementation.instructions.any { instruction ->
                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                        ?.let { it.name == "b" && it.returnType == "Z" } == true
            } &&
            classDef.sourceFile == "AllNutrientsViewModel.kt" &&
            classDef.fields.any { it.type == "Landroidx/lifecycle/MutableLiveData;" }
    },
)

/**
 * Class locator for the new-gen timeline food card model `TimelineFood` (`Ljq0/c;`).
 *
 * `TimelineFood` carries the per-food-card freemium payload used by `TimelineFoodCard`:
 * `freemiumTag` draws the "Premium" divider and `freemiumLocked` blurs the four PFCF
 * values (the "Today's Logs" meal card).
 *
 * Anchors (verified against `smali/classes12/jq0/c.smali`):
 * - `toString` literal `"TimelineFood(calories="` — unique in the APK;
 * - source file `TimelineState.kt`.
 */
object TimelineFoodClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("TimelineFood(calories="),
    ),
    custom = { _, classDef -> classDef.sourceFile == "TimelineState.kt" },
)

/**
 * Matches `TimelineFood.getFreemiumLocked()Z` (`Ljq0/c;`, method `c()`).
 *
 * `TimelineFoodCard` passes this flag to `m124602m(...)`, which applies the blur to all
 * four PFCF values. Forcing it `false` renders the values normally instead.
 *
 * Getter shape (verified in `smali/classes12/jq0/c.smali`): `.registers 2`,
 * `public final`, `iget-boolean v0, p0, Ljq0/c;->j:Z`, `return v0`.
 */
object TimelineFoodFreemiumLockedFingerprint : Fingerprint(
    classFingerprint = TimelineFoodClassFingerprint,
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    custom = { method, _ -> method.implementation?.registerCount == 2 },
)

/**
 * Matches `TimelineFood.getFreemiumTag()` (`Lbq0/c;` in 31.6, `Ljq0/c;` in 31.5,
 * method `d()`).
 *
 * `TimelineFoodCard` draws `FreemiumDivider` whenever this tag is non-null; the tag is the
 * "Premium" label above the blurred PFCF row. Returning `null` drops the divider while
 * keeping the rest of the card (calories, foods, photos, description) intact.
 *
 * Getter shape (verified for both versions): `.registers 2`, `public final`, a single
 * `iget-object` + `return-object`. The tag type's package moved with the model, so the
 * getter is matched by shape and class rather than a hardcoded return type.
 */
object TimelineFoodFreemiumTagFingerprint : Fingerprint(
    classFingerprint = TimelineFoodClassFingerprint,
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
    ),
    custom = { method, _ -> method.implementation?.registerCount == 2 },
)

/**
 * Class locator for `MicroNutrientsLockInfo` (`Lzj0/d;`, FatSecret food response).
 *
 * This is the food-item micronutrient lock ("Unlock micronutrient breakdown with
 * HealthifyTrack+") — a different lock model than [FeatureConfigClassFingerprint]
 * with different consumers.
 *
 * Anchors (verified against `smali/classes12/zj0/d.smali`):
 * - `toString` literals `"MicroNutrientsLockInfo(isLocked="` (line 505),
 *   `", titleText="` (519), `", ctaText="` (533), `", ctaUrl="` (547) — the first
 *   literal is unique in the APK;
 * - source file `FatSecretModels.kt` (line 3);
 * - Gson (`@zh/c`) fields `is_locked` (boolean), `title_text`, `cta_text`, `cta_url`
 *   (lines 54-76).
 *
 * The obfuscated class name `zj0/d` is deliberately not used as an anchor.
 */
object MicroNutrientsLockInfoClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("MicroNutrientsLockInfo(isLocked="),
        string(", titleText="),
        string(", ctaText="),
        string(", ctaUrl="),
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "FatSecretModels.kt" &&
            classDef.hasGsonField("is_locked", fieldType = "Z") &&
            classDef.hasGsonField("title_text") &&
            classDef.hasGsonField("cta_text") &&
            classDef.hasGsonField("cta_url")
    },
)

/**
 * Matches `MicroNutrientsLockInfo.getIsLocked()Z` (`Lzj0/d;`, smali line 155).
 *
 * The single gate read by both food pickers — `FoodQuantityPickerFragment.o1(Lzj0/d;)Z`
 * and `OnlineFoodQuantityPickerFragment$a.d(Lzj0/d;)Z` (the only two call sites in the
 * APK; asserted at patch time). Forcing it `false` stops the locked-overlay inflation
 * and the 4-of-5 micronutrient value blanking, so all five micro values render normally.
 *
 * Getter shape (verified): `.registers 2`, `public final`, body is a single
 * `iget-boolean v0, p0, ...->a:Z` + `return v0` — the only zero-arg boolean getter
 * of the class.
 *
 * Fallback (should this class anchor ever fail in a future build): pin the two readers
 * (`FoodQuantityPickerFragment` / `OnlineFoodQuantityPickerFragment$a`) instead.
 */
object MicroNutrientsIsLockedFingerprint : Fingerprint(
    classFingerprint = MicroNutrientsLockInfoClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
    ),
    // `.registers 2` (one local + `p0`) — the plain boolean-getter shape.
    custom = { method, _ -> method.implementation?.registerCount == 2 },
)
