package app.ahmedyarub.patches.x.sharemenu

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val POST_MENU_CLASS = "$EXTENSION_PACKAGE/PostMenu;"

private object PostOptionsStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("PostOptionsState(showOptionsDialog="),
)

private object OptionGroupToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("OptionGroup(postActions="),
)

private object DidSelectOptionToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DidSelectOption(option="),
)

/** The post menu presenter's event handler, whose constructor names the presenter. */
private object PostOptionsEventHandlerFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("DefaultPostOptionsPresenter"),
)

private object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/main/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
)

private class PostMenuSetting(name: String) : Fingerprint(definingClass = POST_MENU_CLASS, name = name)

private val postActions = linkedSetOf<String>()
private var hiddenOptions = emptyList<String>()

/**
 * Adds the action [key] (see PostMenu.Action) to the post menu. Called from the execute block of
 * a patch that depends on [postMenuPatch].
 */
internal fun addPostAction(key: String) {
    postActions += key
}

/**
 * Lets the patches add actions to a post's "..." menu and hide options from it.
 *
 * The menu state is handed its option groups and their labels when it is made; the added group
 * goes in there. A selection reaches the presenter's event handler as an event, which the
 * extension looks at first.
 */
internal val postMenuPatch = bytecodePatch(
    description = "Lets the patches add actions to the post menu.",
) {
    dependsOn(xExtensionPatch)

    execute {
        postActions.clear()
        hiddenOptions = emptyList()

        // The actions' dialogs are shown on the activity: the menu only has the application context.
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_PACKAGE/MainActivity;->set(Landroid/app/Activity;)V",
        )

        val actionType = DidSelectOptionToStringFingerprint.classDef.fields.single().type
        PostMenuSetting("actionClass").method.returnEarly(actionType.toClassName())
        PostMenuSetting("groupClass").method.returnEarly(OptionGroupToStringFingerprint.classDef.type.toClassName())

        // The state: (shown, author, groups, labels, ...).
        mutableClassDefBy(PostOptionsStateToStringFingerprint.classDef).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.firstOrNull() == "Z" &&
                method.parameterTypes.getOrNull(2) == "Ljava/util/List;" && method.parameterTypes.getOrNull(3) == "Ljava/util/Map;"
        }.addInstructions(
            0,
            """
            invoke-static { p1, p3 }, $POST_MENU_CLASS->options(ZLjava/util/List;)Ljava/util/List;
            move-result-object p3
            invoke-static { p1, p4 }, $POST_MENU_CLASS->labels(ZLjava/util/Map;)Ljava/util/Map;
            move-result-object p4
            """,
        )

        // The handler holds the presenter, which holds the context and the post, and the
        // visibility of the menu, which it clears on a selection.
        val handler = PostOptionsEventHandlerFingerprint.classDef
        val presenterField = handler.fields.single { field ->
            classDefByOrNull(field.type)?.fields?.let { fields ->
                fields.any { it.type == "Landroid/content/Context;" } &&
                    fields.any { it.type.startsWith("Lcom/x/models/timelines/items/") }
            } == true
        }
        val presenter = classDefBy(presenterField.type)
        val contextField = presenter.fields.first { it.type == "Landroid/content/Context;" }
        val postField = presenter.fields.first { it.type.startsWith("Lcom/x/models/timelines/items/") }

        mutableClassDefBy(handler).methods.single { method ->
            method.name == "invoke" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
        }.apply {
            // The first menu visibility state the handler reads is the one a selection clears.
            val visibility = instructions.firstNotNullOfOrNull { instruction ->
                instruction.getReference<FieldReference>()?.takeIf {
                    instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == handler.type &&
                        it.type == "Landroidx/compose/runtime/l1;"
                }
            } ?: throw PatchException("The post menu handler never reads the menu's visibility")

            addInstructionsWithLabels(
                0,
                """
                move-object/from16 v0, p0
                iget-object v1, v0, ${handler.type}->${presenterField.name}:${presenterField.type}
                iget-object v2, v1, ${presenter.type}->${contextField.name}:Landroid/content/Context;
                iget-object v1, v1, ${presenter.type}->${postField.name}:${postField.type}
                move-object/from16 v3, p1
                invoke-static { v2, v1, v3 }, $POST_MENU_CLASS->onOption(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :original
                iget-object v1, v0, $visibility
                sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface { v1, v2 }, Landroidx/compose/runtime/l1;->setValue(Ljava/lang/Object;)V
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }

    finalize {
        PostMenuSetting("enabledActions").method.returnEarly(postActions.joinToString(","))
        PostMenuSetting("hiddenOptions").method.returnEarly(hiddenOptions.joinToString(","))
    }
}

private fun String.toClassName() = removePrefix("L").removeSuffix(";").replace('/', '.')

private fun postActionPatch(name: String, description: String, key: String) = bytecodePatch(
    name = name,
    description = description,
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(postMenuPatch)

    execute { addPostAction(key) }
}

@Suppress("unused")
val copyMediaLinkPatch = postActionPatch(
    "Add ability to copy media link",
    "Adds \"Copy media link\" to the post menu: the direct links of the post's photos, videos and GIFs.",
    "copyMediaLink",
)

@Suppress("unused")
val externalDownloaderPatch = postActionPatch(
    "Support external downloader",
    "Adds \"Open in downloader\" to the post menu, which shares the post's link with an app of your choice.",
    "externalDownloader",
)

@Suppress("unused")
val readerModePatch = postActionPatch(
    "Native reader mode",
    "Adds \"Reader mode\" to the post menu: the post's text, selectable, with links to its media.",
    "reader",
)

@Suppress("unused")
val nativeTranslatorPatch = postActionPatch(
    "Native translator",
    "Adds \"Translate with Google\" to the post menu.",
    "translate",
)

@Suppress("unused")
val postDebugMenuPatch = postActionPatch(
    "Enable debug menu for posts",
    "Adds \"Post data\" to the post menu: everything the app knows about the post, as text.",
    "debug",
)

@Suppress("unused")
val customShareMenuPatch = bytecodePatch(
    name = "Custom share menu",
    description = "Hides options from the post menu.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(postMenuPatch)

    val hidden by stringsOption(
        key = "hiddenOptions",
        default = emptyList(),
        title = "Hidden options",
        description = "The post action types to hide, e.g. Follow, AddToList, Mute, Block, Report, Embed, NotInterested.",
    )

    execute {
        hiddenOptions = hidden.orEmpty().map { it.trim() }.filter { it.matches(Regex("[A-Za-z0-9_]+")) }
    }
}
