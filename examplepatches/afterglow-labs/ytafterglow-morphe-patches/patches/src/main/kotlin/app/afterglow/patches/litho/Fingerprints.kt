/*
 * YTAfterglow for Android.
 *
 * Fingerprints adapted from the Litho filter, conversion context, RenderNext and
 * vertical scroll patches of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), whose Litho filter was
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3).
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and checked one by one
 * against YouTube 21.43.523. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

@file:Suppress("SpellCheckingInspection")

package app.afterglow.patches.litho

import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Every fingerprint below names what it resolves to in YouTube 21.43.523
 * (classes*.dex of the arm64 APK), as checked against `dexdump -d`.
 */

private const val UPB_MESSAGE = "Lcom/google/android/libraries/elements/adl/UpbMessage;"
private const val ELEMENTS_SERVICES = "Lcom/google/android/libraries/multiplatform/elements/ElementsServices;"

/** RenderNext feature flag. */
private const val RENDER_NEXT_FLAG = 45661418L

/** Flag that opens the Home with the page fragment, which can render all of it with RenderNext. */
private const val PAGE_FRAGMENT_ROUTE_FLAG = 1073830434L

// region Conversion context

internal const val CONTEXT_IDENTIFIER_LABEL = ", identifierProperty="
internal const val CONTEXT_HEIGHT_CONSTRAINT_LABEL = ", heightConstraint="
internal const val CONTEXT_SWIPE_PROTECTOR_LABEL = ", horizontalCollectionSwipeProtector="

/**
 * `toString()` of the Litho conversion context.
 *
 * 21.43.523: `Lwuw;->toString()Ljava/lang/String;` (classes2.dex). It prints the identifier from
 * `Lwuw;->o`, the height constraint from `Lwuw;->d` and the swipe protector from `Lwuw;->k`
 * (through `String.valueOf`); `Lwuw;->m` is the only StringBuilder field, the path.
 */
internal object ConversionContextToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(
        string("ConversionContext{", StringComparisonType.CONTAINS),
        string(", widthConstraint="),
        string(", templateLoggerFactory="),
        string(", rootDisposableContainer="),
        string(CONTEXT_IDENTIFIER_LABEL),
    ),
)

// endregion

// region Element conversion, where components are filtered

/**
 * Encodes a native (Upb) proto message to bytes.
 *
 * 21.43.523: `Lvgs;->f()[B` (classes2.dex). The converted elements are `Lwmw;`, a subclass of
 * `Lvgs;` that implements the element interface `Lwdi;`.
 */
internal object ElementProtoEncodeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "[B",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = UPB_MESSAGE),
        methodCall(definingClass = UPB_MESSAGE, name = "jniEncode"),
    ),
)

/**
 * Private constructor of YouTube's EmptyComponent.
 *
 * 21.43.523: `Lhpm;-><init>()V` (classes4.dex).
 */
internal object EmptyComponentConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    filters = listOf(string("EmptyComponent")),
)

/**
 * Creates the builder of an EmptyComponent; the builder keeps the component in its only field.
 *
 * 21.43.523: `Lhpm;->aE(Lhfs;)Lhpl;` (classes4.dex); the field is `Lhpl;->a:Lhpm;`, and `Lhpm;`
 * extends `Lhju;`, which extends the component class `Lhfn;`.
 */
internal object EmptyComponentBuilderFingerprint : Fingerprint(
    classFingerprint = EmptyComponentConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "L",
    parameters = listOf("L"),
)

/**
 * Compares a button view model's accessibility id with "primary_image". The interface call before
 * the string is the accessibility id getter.
 *
 * 21.43.523: `Lwsr;->a(Lhfs;Lwuw;Ljava/lang/Object;Ljava/lang/String;Lwgc;Lvku;Ljava/util/List;)Lhfk;`
 * (classes2.dex), the only method with "primary_image"; the getter is `Lvyy;->i()Ljava/lang/String;`.
 */
internal object AccessibilityIdFingerprint : Fingerprint(
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf(), returnType = "Ljava/lang/String;"),
        string("primary_image", location = MatchAfterWithin(5)),
    ),
)

/**
 * Applies a button view model's accessibility properties. The first view model getter followed
 * closely by the accessibility id getter returns the accessibility text.
 *
 * 21.43.523: `Lvrd;->e(Lhfs;Lwuw;Ljava/lang/String;Ljava/lang/Object;Lwwa;Lwuf;)V` (classes2.dex,
 * public final synthetic), the only synthetic caller of `Lvyy;->i()`; it gives
 * `Lvyy;->h()Ljava/lang/String;`. `Lvyy;->j()` is also within reach of the id getter there; the
 * first match (`h`) is the getter the reference patches use as the accessibility text.
 */
internal fun accessibilityTextFingerprint(accessibilityId: MethodReference) = Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_INTERFACE, parameters = listOf(), returnType = "Ljava/lang/String;"),
        methodCall(reference = accessibilityId, location = MatchAfterWithin(5)),
    ),
    custom = { method, _ -> AccessFlags.SYNTHETIC.isSet(method.accessFlags) },
)

/**
 * Converts an element into its Litho component, which it returns at the end. Before that, the
 * element's button view model (its accessibility extension) is cast and applied when present.
 *
 * 21.43.523: `Lvnf;->a(Lhfs;Lwuw;Lwdi;Ljava/util/List;Lwvr;Z)Lhfn;` (classes2.dex):
 * `if-eqz v1` at 0x00ee, `check-cast v0, Lvyy;` at 0x00f4, `return-object v0` at 0x0100.
 */
internal fun elementConversionFingerprint(accessibilityExtensionType: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    filters = listOf(
        opcode(Opcode.IF_EQZ),
        checkCast(accessibilityExtensionType, location = MatchAfterWithin(5)),
        opcode(Opcode.RETURN_OBJECT),
        string("Element missing correct type extension"),
        string("Element missing type"),
    ),
)

/**
 * The original component return, even after another filter adds an earlier empty-component
 * return. In 21.43.523 the component is built by Lwwa.b(Lhfs;)Lhfn; and stored in v0.
 * Resolve that result from its signature instead of treating the first return as native.
 */
internal fun elementComponentReturnIndex(method: Method, viewModelIndex: Int, errorIndex: Int): Int {
    val instructions = method.implementation!!.instructions.toList()
    val contextType = method.parameterTypes.first().toString()
    val builders = (viewModelIndex + 1 until errorIndex).filter { index ->
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)
            && reference != null && reference.returnType == method.returnType
            && reference.parameterTypes.map { it.toString() } == listOf(contextType)
    }
    require(builders.size == 1) { "Expected one native component builder in $method" }
    val resultIndex = builders.single() + 1
    require(instructions[resultIndex].opcode == Opcode.MOVE_RESULT_OBJECT) {
        "Native component builder has no adjacent result in $method"
    }
    val resultRegister = (instructions[resultIndex] as OneRegisterInstruction).registerA
    val returns = (resultIndex + 1 until errorIndex).filter { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.RETURN_OBJECT
            && (instruction as OneRegisterInstruction).registerA == resultRegister
    }
    require(returns.size == 1) { "Expected one native component result return in $method" }
    return returns.single()
}

/**
 * Add complete getter/result pairs after the native void view-model binding. Upstream uses
 * this same cast+2 boundary; inserting at cast+1 would let its later hook split our first pair.
 * Plain insertion preserves the no-view-model branch's target at the component builder.
 */
internal fun MutableMethod.addElementAccessibilityHook(
    viewModelIndex: Int,
    idRegister: Int,
    textRegister: Int,
    accessibilityId: MethodReference,
    accessibilityText: MethodReference,
) {
    val instructions = implementation!!.instructions
    val viewModelRegister = (instructions[viewModelIndex] as OneRegisterInstruction).registerA
    val binding = instructions[viewModelIndex + 1]
    val reference = (binding as? ReferenceInstruction)?.reference as? MethodReference
    require(binding.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
        && reference != null && reference.returnType == "V"
        && reference.parameterTypes.firstOrNull()?.toString() == accessibilityId.definingClass
        && binding.invokeRegisters.firstOrNull() == viewModelRegister) {
        "Expected native view-model binding immediately after cast in $this"
    }
    addInstructions(viewModelIndex + 2, """
        invoke-interface/range { v$viewModelRegister .. v$viewModelRegister }, ${accessibilityId.smali}
        move-result-object v$idRegister
        invoke-interface/range { v$viewModelRegister .. v$viewModelRegister }, ${accessibilityText.smali}
        move-result-object v$textRegister
    """)
}

// endregion

// region RenderNext

/**
 * Gives the section list's present context the ElementsServices that RenderNext needs, when the
 * RenderNext flag is on. The filters match the flag check: literal, call, result.
 *
 * 21.43.523: `Lkvc;->q(Lautj;)V` (classes.dex): the flag at 0x0004, `Laktm;->m(IJZ)Z` at 0x000a,
 * `move-result v0` at 0x000d. `Lifh;->dG()Z` also reads the flag but casts no ElementsServices.
 */
internal object RenderNextPresentContextFingerprint : Fingerprint(
    filters = listOf(
        literal(RENDER_NEXT_FLAG),
        methodCall(returnType = "Z", location = MatchAfterWithin(3)),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        checkCast(ELEMENTS_SERVICES),
    ),
)

/**
 * Reads the server's enable_rendernext field of an Element proto.
 *
 * 21.43.523: `Lacmo;->cr(Lbbiu;)Z` (classes2.dex).
 */
internal object RenderNextEnablementCheckFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(string("Failed to read Element proto passed in to RenderNextEnablementCheck: ")),
)

/**
 * Decides if an element is RenderNext from the RenderNext field of its config and then the
 * enablement check. The first boolean it reads is that config field.
 *
 * 21.43.523: `Latqs;->a(Lbfcw;)Latqo;` (classes2.dex); the field is `Lbfcx;->k:Z`, read at 0x0028.
 * The other caller of the enablement check, `Latqw;->a`, is static.
 */
internal fun renderNextConfigFieldFingerprint(enablementCheck: MethodReference) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        methodCall(reference = enablementCheck),
        methodCall(name = "toBuilder"),
    ),
)

/** Number of methods that read the RenderNext config field in 21.43.523. */
internal const val RENDER_NEXT_CONFIG_READS = 3

/**
 * Every read of the RenderNext config field.
 *
 * 21.43.523: `Latqs;->a(Lbfcw;)Latqo;` and `Latqw;->a(Lbfcw;)Z` (classes2.dex), and
 * `Lattt;->a(Lbfcw;)Latqo;` (classes6.dex), which picks the RenderNext element class `Lattq;`
 * over the Litho one `Latqo;`.
 */
internal fun renderNextConfigFieldReadFingerprint(configField: FieldReference) = Fingerprint(
    filters = listOf(fieldAccess(configField, Opcode.IGET_BOOLEAN)),
)

/**
 * Checks if a component's template is in the list of flag 45661551 ("template" or
 * "parentTemplate:template"); if so, the Litho component is converted to RenderNext.
 *
 * 21.43.523: `Lvld;->e(Lazag;Ljava/lang/String;Ljava/lang/String;)Z` (classes2.dex), the only
 * static `(L, String, String)Z` method that splits on ':'.
 */
internal object RenderNextTemplateCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L", "Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        literal(58), // ':'
        methodCall(smali = "Ljava/lang/String;->indexOf(I)I"),
        methodCall(smali = "Ljava/lang/String;->substring(II)Ljava/lang/String;"),
    ),
)

/**
 * Opens the Home with the page fragment when flag 1073830434 is on (phones). The page fragment
 * renders the whole page with RenderNext when the server sends the page as one element.
 *
 * 21.43.523: `Lauoa;->r(Lbdso;ZZZ)Lkpp;` (classes2.dex): the flag at 0x0030,
 * `Laflv;->f(I)Z` at 0x0033, `move-result v2` at 0x0036.
 */
internal object PageFragmentRouteFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L",
    parameters = listOf("L", "Z", "Z", "Z"),
    filters = listOf(
        string("top_level_browse_pane"),
        literal(PAGE_FRAGMENT_ROUTE_FLAG),
        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            parameters = listOf("I"),
            returnType = "Z",
            location = MatchAfterWithin(5),
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

/**
 * Presents an element with RenderNext if it is a RenderNext element, otherwise with Litho.
 *
 * 21.43.523: `Latsv;->c(Landroid/view/ViewGroup;Lauhp;Latqo;)V` (classes2.dex): the RenderNext
 * check is `instance-of v0, v11, Lattq;` at 0x0001, followed by `if-eqz v0`.
 */
internal object HybridElementPresenterFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        opcode(Opcode.INSTANCE_OF),
        string("HybridElementPresenter: ElementsServices not provided through builder or PresentContext."),
    ),
)

// endregion

// region Pull to refresh

/**
 * `SwipeRefreshLayout.canChildScrollUp()`, which asks the list if it can still scroll up.
 *
 * 21.43.523: `Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n()Z` (classes.dex):
 * `View.canScrollVertically(I)Z` at 0x000e, `move-result v2` at 0x0011. There is no
 * ChildScrollUpCallback path left in this build.
 */
internal object SwipeRefreshCanChildScrollUpFingerprint : Fingerprint(
    definingClass = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Landroid/view/View;->canScrollVertically(I)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

// endregion
