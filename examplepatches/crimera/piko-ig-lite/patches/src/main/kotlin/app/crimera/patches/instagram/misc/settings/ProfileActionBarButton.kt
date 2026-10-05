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
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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
 *  - the user is the one `User` field of the `UserDetailViewModel` that the one state field with such
 *    a view model leads to.
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
    val userField = resolveUserField(stateType)
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
        iget(user, user, userField.header)
        ifEqz(user, Target.Original)
        iget(user, user, userField.viewModel)
        ifEqz(user, Target.Original)
        iget(user, user, userField.user)

        move(activityCopy, activity, ACTIVITY)
        move(buttonsCopy, buttons, IG_LINEAR_LAYOUT)
        move(sessionCopy, session, USER_SESSION)
        invokeStatic(methodReference(ADD_TO_PROFILE_ACTION_BAR), activityCopy, buttonsCopy, sessionCopy, user)
    }
}

/**
 * Emits `SettingsButton.getUserId(user)`: the profile user's id through the lazy model getter. The
 * `User` class declares no readable `getId`, so reading it by name would always fail.
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
        val user = 1
        instanceOf(value, user, USER_DESCRIPTOR)
        ifEqz(value, Target.Local("none"))
        checkCast(user, USER_DESCRIPTOR)
        readModelValue(value, user, userId, Target.Local("none"))
        returnObject(value)

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
    val header: FieldReference,
    val viewModel: FieldReference,
    val user: FieldReference,
)

/** State field to the profile header, header field to the view model, view model field to the user. */
context(patchContext: BytecodePatchContext)
private fun resolveUserField(stateType: String): UserPath {
    val header =
        requireExactlyOne(
            "profile header field of $stateType",
            patchContext.classDefBy(stateType).fields.filter { field ->
                patchContext.classDefByOrNull(field.type)?.fields?.count { it.type == USER_DETAIL_VIEW_MODEL } == 1
            },
        )
    val viewModel =
        requireExactlyOne(
            "view model field of ${header.type}",
            patchContext.classDefBy(header.type).fields.filter { it.type == USER_DETAIL_VIEW_MODEL },
        )
    val user =
        requireExactlyOne(
            "user field of $USER_DETAIL_VIEW_MODEL",
            patchContext.classDefBy(USER_DETAIL_VIEW_MODEL).fields.filter { it.type == USER_DESCRIPTOR },
        )
    return UserPath(header, viewModel, user)
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
