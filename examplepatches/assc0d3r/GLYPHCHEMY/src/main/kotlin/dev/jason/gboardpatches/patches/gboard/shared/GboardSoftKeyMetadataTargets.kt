package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext

/**
 * The type names one release's SoftKey metadata is described with.
 *
 * These were compile-time constants while the tree only described 18.6.3. A release that renames
 * its event, key-data or list class needs its own set, so [gboardSoftKeyMetadataTargets] selects a
 * set by what the APK actually declares and every body reads its types from there.
 */
internal data class GboardSoftKeyTypeSet(
    /** `SoftKeyDef`; a library class on both releases, so its descriptor does not change. */
    val softKeyDef: String,
    /** `ActionDef`; likewise a library class, reached through the release's own builder. */
    val actionDef: String,
    /** The action event enum: `Lpuc;` on 18.6.3, `Lagkl;` on 18.8.0. */
    val event: String,
    /** One entry of `ActionDef`'s parameters: `Lpva;` on 18.6.3, `Lagmb;` on 18.8.0. */
    val keyData: String,
    /** The parameter container: `Lwhe;` on 18.6.3, `Lauaz;` on 18.8.0. */
    val list: String,
    /** The type the walking code calls `size`/`get` on: `Ljava/util/List;` or `Lauaz;`. */
    val listCall: String,
    /** `invoke-interface` for a `List`; `Lauaz;` exposes the same calls virtually. */
    val listCallOpcode: String,
)

/**
 * Where the primary label of a key lives.
 *
 * 18.6.3 keeps its labels in a list that has to be walked, [MetadataList]; 18.8.0 exposes a plain
 * string, [TextField].
 */
internal sealed interface SoftKeyLabelSource {
    /** `SoftKeyDef.i:Lwhe;` on 18.6.3 - the first non-empty element is the label. */
    data class MetadataList(val field: String) : SoftKeyLabelSource

    /** The label is the field itself; empty means "no label". */
    data class TextField(val field: String) : SoftKeyLabelSource
}

/**
 * The members the two read helpers touch.
 *
 * Everything here is read-only, so it is the half of the metadata contract a release can support
 * before its builders are resolved. The type names come from [types] rather than from this file's
 * compile-time constants.
 *
 * 18.6.3 (`Lpuc;` events, `Lwhe;` lists): lookup `SoftKeyDef.g(Lpuc;)ActionDef`, key id
 * `SoftKeyDef.f:I`, labels `SoftKeyDef.i:Lwhe;`, parameters `ActionDef.f:Lwhe;`, one parameter
 * `Lpva.e:Ljava/lang/Object;`, walking through `Ljava/util/List;`.
 *
 * 18.8.0 (`Lagkl;` events, `Lauaz;` lists - an immutable list implementation whose own `size()`,
 * `get()` and `iterator()` the stock code calls virtually): lookup `SoftKeyDef.a(Lagkl;)ActionDef`,
 * key id `SoftKeyDef.e:I` (`f` is `layoutId`), parameters `ActionDef.e:Lauaz;` (labelled `keyDatas`
 * by the class's own `toString`), one parameter `Lagmb.f:Ljava/lang/Object;`. Event constant order
 * is unchanged: `a`=PRESS, `b`=LONG_PRESS, `c`=SLIDE_UP, `d`=SLIDE_DOWN.
 */
internal data class GboardSoftKeyMetadataReadTargets(
    val types: GboardSoftKeyTypeSet,
    val actionLookup: GboardMethodTarget,
    val pressEvent: String,
    val slideUpEvent: String,
    val slideDownEvent: String,
    val keyIdField: String,
    val actionParamsField: String,
    val actionParamValueField: String,
    val label: SoftKeyLabelSource,
) {
    /** The enum type `SoftKeyDef` looks actions up by; its descriptor is the lookup's parameter. */
    val eventType: String get() = types.event
}

/**
 * The members the metadata-builder body needs to construct a patched `SoftKeyDef`.
 *
 * This half is only ever non-null for a release whose builder chain has been resolved: the body
 * allocates the release's `SoftKeyDef` builder, an `ActionDef` builder per added action, and the
 * commit parameter that carries the payload, none of which can be guessed from the read side.
 */
internal data class GboardSoftKeyMetadataBuildTargets(
    val softKeyBuilder: String,
    val softKeyBuilderCopy: String,
    val softKeyBuilderAddAction: String,
    val softKeyBuilderBuild: String,
    val actionBuilder: String,
    /** Reset invoked right after the builder is allocated; null when `<init>` already starts clean. */
    val actionBuilderReset: String?,
    val actionBuilderEventField: String,
    /** Keyword-array setter; 18.8.0's builder has none and carries the text in the commit alone. */
    val actionBuilderSetKeywords: String?,
    val actionBuilderSetParam: String,
    val actionBuilderBuild: String,
    val commitParameter: String,
    val commitParameterField: String,
    /** Attribute id the release's own code gives the commit key data, spelled as smali sees it. */
    val commitParameterId: String,
)

/**
 * One release's worth of the SoftKey metadata contract.
 *
 * [build] being null is what still blocks a release: read helpers can be installed against it, the
 * metadata builder cannot.
 */
internal data class GboardSoftKeyMetadataTargets(
    val read: GboardSoftKeyMetadataReadTargets,
    val build: GboardSoftKeyMetadataBuildTargets?,
)

/**
 * Chooses by what the APK declares, so a release the generated projection cannot describe falls
 * through to its audited row instead of resolving names that are not there.
 */
internal fun gboardSoftKeyMetadataTargets(context: BytecodePatchContext): GboardSoftKeyMetadataTargets =
    selectReleaseTargets(
        context = context,
        projection = ::gboardSoftKeyMetadataProjection,
        probe = { targets -> targets.read.actionLookup },
        audited = GBOARD_SOFT_KEY_METADATA_18_8,
    )

/**
 * Assembles a release's read targets from its type set, so the lookup the selector probes and the
 * types the bodies emit can never drift apart.
 */
private fun gboardSoftKeyReadTargets(
    types: GboardSoftKeyTypeSet,
    lookupName: String,
    keyIdField: String,
    actionParamsField: String,
    actionParamValueField: String,
    label: SoftKeyLabelSource,
) = GboardSoftKeyMetadataReadTargets(
    types = types,
    actionLookup = GboardMethodTarget(
        classType = types.softKeyDef,
        name = lookupName,
        parameterTypes = listOf(types.event),
        returnType = types.actionDef,
    ),
    pressEvent = "a",
    slideUpEvent = "c",
    slideDownEvent = "d",
    keyIdField = keyIdField,
    actionParamsField = actionParamsField,
    actionParamValueField = actionParamValueField,
    label = label,
)

/** Read at call time so a build that does not select the English feature can load this class. */
private fun gboardSoftKeyMetadataProjection() = GboardSoftKeyMetadataTargets(
    read = gboardSoftKeyReadTargets(
        types = GboardSoftKeyTypeSet(
            softKeyDef = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;",
            actionDef = "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;",
            event = "Lpuc;",
            keyData = "Lpva;",
            list = "Lwhe;",
            listCall = "Ljava/util/List;",
            listCallOpcode = "invoke-interface",
        ),
        lookupName = "g",
        keyIdField = "f",
        actionParamsField = "f",
        actionParamValueField = "e",
        label = SoftKeyLabelSource.MetadataList(field = "i"),
    ),
    build = GboardSoftKeyMetadataBuildTargets(
        softKeyBuilder = "Lpwt;",
        softKeyBuilderCopy = "k",
        softKeyBuilderAddAction = "o",
        softKeyBuilderBuild = "b",
        actionBuilder = "Lpud;",
        actionBuilderReset = null,
        actionBuilderEventField = "a",
        actionBuilderSetKeywords = "t",
        actionBuilderSetParam = "s",
        actionBuilderBuild = "c",
        commitParameter = "Lpuz;",
        commitParameterField = "c",
        // The id the shipped 18.6.3 template has always written, kept so its output stays identical.
        commitParameterId = "-0x2719",
    ),
)

/**
 * 18.8.0, verified against the release APK.
 *
 * Read side: `SoftKeyDef.a(Lagkl;)ActionDef` resolves one exact event, `ActionDef.e` is `keyDatas`,
 * and a key data carries its payload in `Lagmb.f`. The label is read from `SoftKeyDef.m`, the field
 * the port contract names as the primary label.
 *
 * Build side, following stock `Laacs;->f`: `Lagko.<init>` -> `m()` reset -> `a` = event ->
 * `n(id, Lagma;->d, text)`, which wraps `Lagmb(id, COMMIT, text, Integer.MAX_VALUE)` -> `b()`, and
 * then `Lagpt;->p(ActionDef)` appends it to the copy `Lagpt;->m(SoftKeyDef)` made.
 *
 * `Lagma;->d` is `COMMIT`: the enum's own `<clinit>` names it, and on 18.6.3 the same role is
 * `Lpuz;` with `COMMIT` at `c`. The commit attribute id is the one stock 18.8.0 writes, -0x272b;
 * the shipped 18.6.3 template writes -0x2719 there instead, a discrepancy left alone because that
 * template's output is verified byte-for-byte.
 */
private val GBOARD_SOFT_KEY_METADATA_18_8 = GboardSoftKeyMetadataTargets(
    read = gboardSoftKeyReadTargets(
        types = GboardSoftKeyTypeSet(
            softKeyDef = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;",
            actionDef = "Lcom/google/android/libraries/inputmethod/metadata/ActionDef;",
            event = "Lagkl;",
            keyData = "Lagmb;",
            list = "Lauaz;",
            listCall = "Lauaz;",
            listCallOpcode = "invoke-virtual",
        ),
        lookupName = "a",
        keyIdField = "e",
        actionParamsField = "e",
        actionParamValueField = "f",
        label = SoftKeyLabelSource.TextField(field = "m"),
    ),
    build = GboardSoftKeyMetadataBuildTargets(
        softKeyBuilder = "Lagpt;",
        softKeyBuilderCopy = "m",
        softKeyBuilderAddAction = "p",
        softKeyBuilderBuild = "b",
        actionBuilder = "Lagko;",
        actionBuilderReset = "m",
        actionBuilderEventField = "a",
        actionBuilderSetKeywords = null,
        actionBuilderSetParam = "n",
        actionBuilderBuild = "b",
        commitParameter = "Lagma;",
        commitParameterField = "d",
        commitParameterId = "-0x272b",
    ),
)
