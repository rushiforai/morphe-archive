/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.settings

import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.models.PandoField
import app.crimera.patches.instagram.models.PandoModel
import app.crimera.patches.instagram.models.USER_DESCRIPTOR
import app.crimera.patches.instagram.models.readModelValue
import app.crimera.patches.instagram.models.resolvedModelGetter
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.crimera.patches.instagram.misc.downloads.registerOfParameterIndex
import app.crimera.patches.instagram.utils.Constants.SETTINGS_DESCRIPTOR
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ACTIVITY = "Landroid/app/Activity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val LIST = "Ljava/util/List;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private const val IG_LINEAR_LAYOUT = "Lcom/instagram/common/ui/base/IgLinearLayout;"
private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"

/** Framework-named types: the profile bar, the profile screen's view model and its user. */
private const val PROFILE_ACTION_BAR = "Lcom/instagram/profile/actionbar/ProfileActionBar;"
private const val USER_DETAIL_VIEW_MODEL = "Lcom/instagram/profile/fragment/UserDetailViewModel;"

private const val SETTINGS_BUTTON = "$SETTINGS_DESCRIPTOR/SettingsButton;"
private const val STRING = "Ljava/lang/String;"
private const val INVALID_USER_ID = "INVALID_USER_ID"
private const val STRING_EQUALS = "$STRING->equals($OBJECT)Z"

/**
 * Pando field id of the user's id (`pk`). The getter decodes its key at runtime, so the string never
 * appears in the dex; the id is the same on every supported release.
 */
private val USER_ID_FIELD = PandoField.FieldId("pk", 0x7b27f5a8)

private const val ADD_TO_PROFILE_ACTION_BAR =
    "$SETTINGS_DESCRIPTOR/SettingsButton;->addToProfileActionBar(" +
        "$ACTIVITY$VIEW_GROUP$USER_SESSION$OBJECT)V"

/** Parameters of the helper `ProfileActionBar` hands its views, state and button list to. */
private const val BUILDER_PARAMETER_COUNT = 8
private const val STATE_PARAMETER_INDEX = 5

/**
 * Adds the Piko settings icon to the profile action bar. `ProfileActionBar` passes its two button
 * layouts, the profile state and the list of buttons to one static helper, which clears both layouts
 * and then adds a view per button. The hook runs between the two: the right-hand layout is empty, the
 * activity and session are parameters, and the profile's user is reached through the state.
 *
 * Every obfuscated member is resolved by shape:
 *  - the helper is the one static `void` method called from `ProfileActionBar` that takes
 *    `(Activity, Context, UserSession, IgLinearLayout, IgLinearLayout, state, List, Function1)`,
 *  - the injection point is the `List.iterator()` call that directly follows the two
 *    `removeAllViews` calls,
 *  - the profile identity is either the `User` field of the `UserDetailViewModel`, or its string ID
 *    getter that the profile-model factory checks against `INVALID_USER_ID`.
 */
context(patchContext: BytecodePatchContext)
internal fun addSettingsButtonToProfileActionBar() {
    injectProfileUserId()
    val builderReference = resolveBuilderReference()
    val builder =
        requireExactlyOne(
            "profile action bar builder",
            patchContext.mutableClassDefBy(builderReference.definingClass).methods.filter { method ->
                method.name == builderReference.name &&
                    method.returnType == builderReference.returnType &&
                    AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.map { it.toString() } ==
                    builderReference.parameterTypes.map { it.toString() }
            },
        )

    val stateType = builder.parameterTypes[STATE_PARAMETER_INDEX].toString()
    val userSource = resolveProfileUserSource(stateType)
    val injectionIndex = resolveInjectionIndex(builder)

    val activity = builder.registerOfParameterIndex(0)
    val session = builder.registerOfParameterIndex(2)
    val buttons = builder.registerOfParameterIndex(4)
    val state = builder.registerOfParameterIndex(STATE_PARAMETER_INDEX)

    builder.insertHook(index = injectionIndex, relocateBranchTargets = false) {
        val activityCopy = scratchRegister()
        val buttonsCopy = scratchRegister()
        val sessionCopy = scratchRegister()
        val user = scratchRegister()

        // The state, its profile header and the header's view model are nullable while the profile loads.
        move(user, state, stateType)
        ifEqz(user, Target.Original)
        iget(user, user, userSource.path.container)
        ifEqz(user, Target.Original)
        iget(user, user, userSource.path.viewModel)
        ifEqz(user, Target.Original)
        when (userSource) {
            is ProfileUserSource.UserField -> iget(user, user, userSource.field)
            is ProfileUserSource.UserIdGetter -> {
                invokeVirtual(userSource.getter, user)
                moveResult(user, STRING)
            }
        }

        move(activityCopy, activity, ACTIVITY)
        move(buttonsCopy, buttons, IG_LINEAR_LAYOUT)
        move(sessionCopy, session, USER_SESSION)
        invokeStatic(methodReference(ADD_TO_PROFILE_ACTION_BAR), activityCopy, buttonsCopy, sessionCopy, user)
    }
}

/**
 * Emits `SettingsButton.getUserId(profileIdentity)`. Older view models expose a `User`; newer ones
 * expose the ID as a string. The `User` class declares no readable `getId`, so its path uses the
 * resolved lazy-model getter rather than a guessed method name.
 */
context(patchContext: BytecodePatchContext)
private fun injectProfileUserId() {
    val userId = resolvedModelGetter(PandoModel.USER, USER_ID_FIELD)
    if (userId.getter.returnType != STRING) {
        throw PatchException("User id getter returns ${userId.getter.returnType}, not a String")
    }

    replaceBridgeBody(
        SETTINGS_BUTTON,
        "getUserId",
        listOf(OBJECT),
        STRING,
        registers = 2,
    ) {
        val value = 0
        val profileIdentity = 1
        instanceOf(value, profileIdentity, STRING)
        ifNez(value, Target.Local("profile_id"))
        instanceOf(value, profileIdentity, USER_DESCRIPTOR)
        ifEqz(value, Target.Local("none"))
        checkCast(profileIdentity, USER_DESCRIPTOR)
        readModelValue(value, profileIdentity, userId, Target.Local("none"))
        returnObject(value)

        label("profile_id")
        checkCast(profileIdentity, STRING)
        returnObject(profileIdentity)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }
}

context(patchContext: BytecodePatchContext)
private fun resolveBuilderReference(): MethodReference {
    val actionBar = patchContext.classDefBy(PROFILE_ACTION_BAR)
    val staticInvokes = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
    return requireExactlyOne(
        "profile action bar builder call in $PROFILE_ACTION_BAR",
        actionBar.methods
            .flatMap { method -> method.implementation?.instructions?.toList().orEmpty() }
            .filter { instruction -> instruction.opcode in staticInvokes }
            .mapNotNull { instruction -> instruction.getReference<MethodReference>() }
            .filter { reference -> reference.isProfileActionBarBuilder() }
            .distinctBy { reference -> reference.toString() },
    )
}

private fun MethodReference.isProfileActionBarBuilder(): Boolean {
    val parameters = parameterTypes.map { it.toString() }
    return returnType == "V" &&
        parameters.size == BUILDER_PARAMETER_COUNT &&
        parameters.slice(0..4) == listOf(ACTIVITY, CONTEXT, USER_SESSION, IG_LINEAR_LAYOUT, IG_LINEAR_LAYOUT) &&
        parameters[6] == LIST &&
        parameters[7] == FUNCTION1
}

private class UserPath(
    val container: FieldReference,
    val viewModel: FieldReference,
)

private sealed class ProfileUserSource(val path: UserPath) {
    class UserField(path: UserPath, val field: FieldReference) : ProfileUserSource(path)

    class UserIdGetter(path: UserPath, val getter: MethodReference) : ProfileUserSource(path)
}

/** State field to a container holding the view model, then the view-model field itself. */
context(patchContext: BytecodePatchContext)
private fun resolveViewModelPath(stateType: String): UserPath {
    val container =
        requireExactlyOne(
            "profile user-state container field of $stateType",
            patchContext.classDefBy(stateType).fields.filter { field ->
                patchContext.classDefByOrNull(field.type)?.fields?.count { it.type == USER_DETAIL_VIEW_MODEL } == 1
            },
        )
    val viewModel =
        requireExactlyOne(
            "view model field of ${container.type}",
            patchContext.classDefBy(container.type).fields.filter { it.type == USER_DETAIL_VIEW_MODEL },
        )

    return UserPath(container, viewModel)
}

context(patchContext: BytecodePatchContext)
private fun resolveProfileUserSource(stateType: String): ProfileUserSource {
    val path = resolveViewModelPath(stateType)
    val userFields = patchContext.classDefBy(path.viewModel.type).fields.filter { it.type == USER_DESCRIPTOR }
    if (userFields.isNotEmpty()) {
        return ProfileUserSource.UserField(
            path,
            requireExactlyOne("user field of $USER_DETAIL_VIEW_MODEL", userFields),
        )
    }

    return ProfileUserSource.UserIdGetter(path, resolveProfileUserIdGetter(path.viewModel.type))
}

/** The model factory distinguishes the profile ID getter from the username fallback by sentinel. */
context(patchContext: BytecodePatchContext)
private fun resolveProfileUserIdGetter(viewModelType: String): MethodReference {
    val viewModelClass = patchContext.classDefBy(viewModelType)
    val factoryCandidates =
        viewModelClass.methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.map { it.toString() } == listOf(viewModelType) &&
                (method.returnType.startsWith("L") || method.returnType.startsWith("["))
        }
    val factories =
        factoryCandidates.filter { method -> method.profileUserIdGetterCalls(viewModelType).isNotEmpty() }
    if (factories.isEmpty()) {
        throw PatchException(
            "Expected one profile model factory checking $INVALID_USER_ID in $viewModelType; " +
                "found none among $factoryCandidates",
        )
    }
    val factory = requireExactlyOne("profile model factory checking $INVALID_USER_ID", factories)
    val getterCandidates = factory.profileUserIdGetterCalls(viewModelType)
    val getter = requireExactlyOne("profile user ID getter in $factory", getterCandidates)
    val getterMethod =
        requireExactlyOne(
            "declaration of profile user ID getter $getter",
            viewModelClass.methods.filter { method ->
                method.name == getter.name &&
                    method.returnType == STRING &&
                    method.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)
            },
        )
    if (!AccessFlags.PUBLIC.isSet(viewModelClass.accessFlags) || !AccessFlags.PUBLIC.isSet(getterMethod.accessFlags)) {
        throw PatchException("Profile user ID getter is not publicly callable: $getter")
    }
    return getter
}

/**
 * Follows the factory's actual value flow: its no-arg String getter result is compared with
 * `INVALID_USER_ID`, and that comparison controls a branch before the factory creates its model.
 */
private fun Method.profileUserIdGetterCalls(viewModelType: String): List<MethodReference> {
    val instructions = implementation?.instructions?.toList() ?: return emptyList()
    if (!AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.map { it.toString() } != listOf(viewModelType)) {
        return emptyList()
    }
    val viewModelRegister = registerOfParameterIndex(0)

    return instructions.indices.mapNotNull { sentinelIndex ->
        if (instructions[sentinelIndex].getReference<StringReference>()?.string != INVALID_USER_ID) {
            return@mapNotNull null
        }

        val getterInvokeIndex = sentinelIndex - 2
        val getterInvoke = instructions.getOrNull(getterInvokeIndex) ?: return@mapNotNull null
        if (getterInvoke.opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)) {
            return@mapNotNull null
        }
        val getter = getterInvoke.getReference<MethodReference>() ?: return@mapNotNull null
        if (getter.definingClass != viewModelType || getter.returnType != STRING || getter.parameterTypes.isNotEmpty()) {
            return@mapNotNull null
        }
        if (getterInvoke.invokeRegisters() != listOf(viewModelRegister)) return@mapNotNull null

        val getterResult = instructions.getOrNull(sentinelIndex - 1) ?: return@mapNotNull null
        if (getterResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        val getterResultRegister = (getterResult as? OneRegisterInstruction)?.registerA ?: return@mapNotNull null

        val sentinel = instructions[sentinelIndex] as? OneRegisterInstruction ?: return@mapNotNull null
        val equalsInvoke = instructions.getOrNull(sentinelIndex + 1) ?: return@mapNotNull null
        val equalsReference = equalsInvoke.getReference<MethodReference>() ?: return@mapNotNull null
        if (equalsReference.toString() != STRING_EQUALS) return@mapNotNull null
        if (equalsInvoke.invokeRegisters() != listOf(sentinel.registerA, getterResultRegister)) return@mapNotNull null

        val comparisonResult = instructions.getOrNull(sentinelIndex + 2) ?: return@mapNotNull null
        if (comparisonResult.opcode != Opcode.MOVE_RESULT) return@mapNotNull null
        val comparisonRegister = (comparisonResult as? OneRegisterInstruction)?.registerA ?: return@mapNotNull null
        val branch = instructions.getOrNull(sentinelIndex + 3) ?: return@mapNotNull null
        if (branch.opcode !in setOf(Opcode.IF_EQZ, Opcode.IF_NEZ)) return@mapNotNull null
        if ((branch as? OneRegisterInstruction)?.registerA != comparisonRegister) return@mapNotNull null

        getter
    }.distinctBy { getter -> getter.toString() }
}

private fun Instruction.invokeRegisters(): List<Int> =
    when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }

/** The `List.iterator()` call that directly follows the two `removeAllViews` calls. */
private fun resolveInjectionIndex(builder: MutableMethod): Int {
    val instructions = builder.implementation!!.instructions.toList()
    val removeAllViews =
        instructions.indices.filter { index -> instructions[index].isInvokeOf { it.isRemoveAllViews() } }
    if (removeAllViews.size != 2 || removeAllViews[1] != removeAllViews[0] + 1) {
        throw PatchException(
            "Expected exactly two consecutive removeAllViews calls in $builder, found $removeAllViews",
        )
    }
    val iteratorIndex = removeAllViews[1] + 1
    if (!instructions[iteratorIndex].isInvokeOf { it.isListIterator() }) {
        throw PatchException("Expected List.iterator() after removeAllViews in $builder")
    }
    return iteratorIndex
}

private fun Instruction.isInvokeOf(matches: (MethodReference) -> Boolean): Boolean =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let(matches) == true

private fun MethodReference.isRemoveAllViews(): Boolean =
    definingClass == VIEW_GROUP && name == "removeAllViews" && parameterTypes.isEmpty() && returnType == "V"

private fun MethodReference.isListIterator(): Boolean =
    definingClass == LIST && name == "iterator" && parameterTypes.isEmpty() &&
        returnType == "Ljava/util/Iterator;"
