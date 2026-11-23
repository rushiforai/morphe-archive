package app.bin0culars.patches.reddit.layout.collapseall

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.p0Register

@Suppress("unused")
val collapseAllCommentsPatch =
    patch(
        name = "Collapse all comments",
        description = "Adds a button next to the comment count on a post that collapses or expands all comments. Choose what it collapses in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "collapse_all_button",
                    section = BinocularsModsSection.POSTS,
                    title = "Collapse all button",
                    summary = "Adds a button next to the comment count on a post. Tap it to collapse comments, tap it again to expand them.",
                    default = true,
                ),
            )
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "collapse_all_scope",
                    section = BinocularsModsSection.POSTS,
                    parentKey = "collapse_all_button",
                    title = "What the button collapses",
                    summary = "All comments folds every thread to its top comment. Replies only keeps top-level comments open and folds their replies. Deep replies also keeps direct replies open.",
                    choices = listOf(
                        BinocularsModsChoice("all", "All comments"),
                        BinocularsModsChoice("replies", "Replies only"),
                        BinocularsModsChoice("deep", "Deep replies"),
                    ),
                    defaultChoice = "all",
                ),
            )

            val postActionBarMethod = PostActionBarFingerprint.method
            val p2Register = postActionBarMethod.p0Register + 2
            val registerClickSmali =
                if (p2Register > 15) {
                    "invoke-static/range { p2 .. p2 }, $EXTENSION_CLASS->registerPostCommentsClick(Ljava/lang/Object;)V"
                } else {
                    "invoke-static { p2 }, $EXTENSION_CLASS->registerPostCommentsClick(Ljava/lang/Object;)V"
                }
            postActionBarMethod.addInstructions(0, registerClickSmali)

            val slotField = findCommentSlotField()
            val pillClass = mutableClassDefBy(ActionBarButtonsFingerprint.classDef)
            val pillMethod = findPillMethod(pillClass, slotField)
            val hookedSites = findHookedSites(pillClass, pillMethod, slotField)

            val totalHookedSites = hookedSites.values.sumOf { it.size }
            if (totalHookedSites == 0) {
                throw PatchException("Expected at least 3 hooked sites, found 0")
            }

            hookComposerGroupsAndPills(pillClass, pillMethod, hookedSites)

            val collapseOpType = CollapseCommentOpFingerprint.classDef.type
            val expandOpType = ExpandCommentOpFingerprint.classDef.type
            val dispatchRef = findDispatchRef(expandOpType)
            val storeClassDef = mutableClassDefBy(dispatchRef.definingClass)

            hookDispatchMethod(storeClassDef, dispatchRef)

            val storeFields = findStoreFields(storeClassDef)
            fillStoreBridges(storeClassDef, dispatchRef, storeFields, collapseOpType, expandOpType)
        }

        finalize {
            resourceXml("res/values/strings.xml").use { strings ->
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_collapse_all_desc")
                    text = "Collapse or expand all comments"
                }
            }
        }
    }
