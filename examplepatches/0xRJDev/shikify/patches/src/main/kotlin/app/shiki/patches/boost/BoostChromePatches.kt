package app.shiki.patches.boost

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

// Verified against the developer-signed 1.14.3 APK. See docs/VALIDATION.md.
private const val SWIPE_EXTENSION = "Lapp/morphe/extension/boost/CommentSwipeActions;"
private const val COMMENTS_ACTIVITY = "Lcom/rubenmayayo/reddit/ui/comments/CommentsActivity;"
private const val COMMENTS_FRAGMENT = "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment;"
private const val COMMENT_HOLDER = "Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;"
private const val LOAD_MORE_HOLDER = "Lcom/rubenmayayo/reddit/ui/adapters/LoadMoreViewHolder;"
private const val VIDEO_ACTIVITY = "Lcom/rubenmayayo/reddit/ui/activities/MediaVideoActivity;"
private const val GALLERY_ACTIVITY = "Lcom/rubenmayayo/reddit/ui/activities/GalleryActivity;"
private const val COMMENTS_EXTENSION = "Lapp/morphe/extension/boost/CommentsChromeTweaks;"
private const val GALLERY_EXTENSION = "Lapp/morphe/extension/boost/GalleryBottomActionsTweaks;"
private val boostCompatibility = Compatibility(
    name = "Boost for Reddit",
    packageName = "com.rubenmayayo.reddit",
    targets = listOf(AppTarget(version = "1.14.3")),
)

// Unnamed dependencies are internal. The Manager shows thirteen user-facing patches.
private val boostChromeExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
    // Run after every selected source's execute block. Repair only the exact invalid
    // emoji-wrapper branches observed in the user's Patcheddit 2.1.0-dev.1 APK.
    finalize {
      for ((holder, model) in listOf(COMMENT_HOLDER to "CommentModel",
          "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;" to "SubmissionModel")) {
        val bind = Fingerprint(
            definingClass = holder, name = "w", returnType = "V", isStatic = false,
            parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/$model;",
                "Z", "Z", "Z", "Lhg2;"),
        ).method
        val instructions = bind.implementation!!.instructions
        if (instructions.any { it.methodReference()?.name == "getExtraEmoji" } &&
            instructions.any { it.methodReference()?.name?.startsWith("morpheOriginal_w_") == true }) {
            // Hand-built wrappers can retain labels belonging to their temporary assembler.
            // Locate the guards structurally: a stale target may be inside an instruction.
            val emoji = instructions.indexOfFirst { it.methodReference()?.name == "getExtraEmoji" }
            val guards = instructions.withIndex().filter { (index, instruction) ->
                index > emoji && index < emoji + 10 &&
                    (instruction.opcode == Opcode.IF_NEZ || instruction.opcode == Opcode.IF_EQZ)
            }
            check(guards.size == 2 && guards[0].value.opcode == Opcode.IF_NEZ &&
                guards[1].value.opcode == Opcode.IF_EQZ &&
                instructions[guards[0].index - 1].opcode == Opcode.MOVE_RESULT &&
                instructions[guards[1].index - 1].opcode == Opcode.IGET_OBJECT) {
                "Unrecognized comment emoji wrapper; refusing broad edits"
            }
            val end = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            check(end == instructions.lastIndex) { "Unrecognized comment emoji wrapper return" }
            val returnLabel = bind.implementation!!.newLabelForIndex(end)
            for ((index, instruction) in guards) {
                val branch = instruction as BuilderInstruction21t
                bind.replaceInstruction(index, BuilderInstruction21t(branch.opcode, branch.registerA, returnLabel))
            }
            if (model == "SubmissionModel") {
                val third = instructions.withIndex().single { (index, instruction) ->
                    index > guards.last().index && instruction.opcode == Opcode.IF_NEZ
                }
                val destination = instructions.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE }
                check(destination > third.index && instructions[third.index - 1].opcode == Opcode.MOVE_RESULT)
                val branch = third.value as BuilderInstruction21t
                bind.replaceInstruction(third.index, BuilderInstruction21t(branch.opcode, branch.registerA,
                    bind.implementation!!.newLabelForIndex(destination)))
            }
            println("Shikify: rebound both comment emoji guards to the wrapper's actual return")
        }
      }
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodReference() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MutableMethod.hasHook(owner: String, name: String) =
    implementation!!.instructions.any { it.methodReference()?.let { ref ->
        ref.definingClass == owner && ref.name == name
    } == true }


private fun app.morphe.patcher.patch.BytecodePatchContext.enableCommentFeature(name: String) {
    Fingerprint(definingClass = COMMENTS_EXTENSION, name = name, returnType = "Z",
        parameters = emptyList(), isStatic = true).method.replaceInstruction(0, "const/4 v0, 0x1")
    val bind = Fingerprint(
        definingClass = COMMENT_HOLDER, name = "w", returnType = "V", isStatic = false,
        parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/CommentModel;", "Z", "Z", "Z", "Lhg2;"),
    ).method
    // Both comment features share this single prefix. Never add a second hook to the wrapper.
    val oldHooks = bind.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.methodReference()?.let { ref ->
            (ref.definingClass == COMMENTS_EXTENSION && ref.name == "beforeCommentBind") ||
                (ref.definingClass == SWIPE_EXTENSION && ref.name == "bind")
        } == true
    }.map { it.index }
    for (index in oldHooks.asReversed()) bind.removeInstruction(index)
    if (!bind.hasHook(COMMENTS_EXTENSION, "onCommentBind")) bind.addInstruction(0,
        "invoke-static/range {p0 .. p0}, $COMMENTS_EXTENSION->onCommentBind(Ljava/lang/Object;)V")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.enableRowCompletion() {
    val adapter = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment\$m;",
        name = "onBindViewHolder", returnType = "V", isStatic = false,
        parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$a0;", "I")).method
    if (adapter.hasHook(COMMENTS_EXTENSION, "onRowBound")) return
    val calls = adapter.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.methodReference()?.let { ref -> ref.name == "w" && ref.returnType == "V" &&
            ref.definingClass in setOf(COMMENT_HOLDER, LOAD_MORE_HOLDER,
                "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;") } == true
    }
    check(calls.size == 3) { "Unrecognized comments adapter binding dispatch" }
    for ((index, instruction) in calls.asReversed()) {
        val register = when (instruction) {
            is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction -> instruction.startRegister
            is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction -> instruction.registerC
            else -> error("Unexpected holder call encoding")
        }
        // Reuse the holder argument immediately after its native void binder. It is
        // still live here; later instructions reuse p0/p1 for depth and IndentView.
        adapter.addInstruction(index + 1,"invoke-static/range {v$register .. v$register}, $COMMENTS_EXTENSION->onRowBound(Ljava/lang/Object;)V")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.enableFeedCompletion() {
    val extension = "Lapp/morphe/extension/boost/MaterialYouTweaks;"
    // Exact 1.14.3 binding dispatchers: regular subreddit/search feeds, grid, front feed,
    // and profile submissions. Keep the shared native post/emoji binder prefix unchanged.
    for (owner in listOf("Lcom/rubenmayayo/reddit/ui/fragments/k\$a;",
        "Lcom/rubenmayayo/reddit/ui/fragments/m\$a;", "Lft0;",
        "Lcom/rubenmayayo/reddit/ui/profile/UserContributionListFragment\$f;")) {
        val method = Fingerprint(definingClass = owner, name = "onBindViewHolder", returnType = "V", isStatic = false,
            parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$a0;", "I")).method
        if (method.hasHook(extension,"onPostBound")) continue
        val call = method.implementation!!.instructions.withIndex().single { (_, instruction) ->
            instruction.methodReference()?.let { it.definingClass == "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;" &&
                it.name == "w" && it.returnType == "V" } == true
        }
        val argument = when (val instruction = call.value) {
            is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction -> instruction.startRegister
            is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction -> instruction.registerC
            else -> error("Unexpected feed holder call encoding")
        }
        method.addInstruction(call.index + 1,"invoke-static/range {v$argument .. v$argument}, $extension->onPostBound(Ljava/lang/Object;)V")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.enableCommentsObserver() {
        val resume = Fingerprint(
            definingClass = COMMENTS_FRAGMENT, name = "onResume",
            returnType = "V", parameters = emptyList(), isStatic = false,
        ).method
        val returns = resume.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(returns.size == 1) { "Unexpected CommentsFragment.onResume layout" }
        // p0 is live here. Replace the return so existing branch labels enter the hook too.
        val index = returns.single()
        if (!resume.hasHook(COMMENTS_EXTENSION, "onFragmentResume")) {
            resume.replaceInstruction(index,
                "invoke-static/range {p0 .. p0}, $COMMENTS_EXTENSION->onFragmentResume(Ljava/lang/Object;)V")
            resume.addInstruction(index + 1, "return-void")
        }

        val pause = Fingerprint(
            definingClass = COMMENTS_FRAGMENT, name = "onPause",
            returnType = "V", parameters = emptyList(), isStatic = false,
        ).method
        if (!pause.hasHook(COMMENTS_EXTENSION, "onFragmentPause")) pause.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $COMMENTS_EXTENSION->onFragmentPause(Ljava/lang/Object;)V")
}

@Suppress("unused")
val boostDynamicCommentsHeaderPatch = bytecodePatch(
    name = "Show post in comments header",
    description = "Show r/subreddit and the post title throughout the comments screen, preserving native menu and search actions.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        Fingerprint(definingClass = COMMENTS_EXTENSION, name = "dynamicHeaderEnabled", returnType = "Z",
            parameters = emptyList(), isStatic = true).method.replaceInstruction(0,"const/4 v0, 0x1")
        enableCommentsObserver()
    }
}

@Suppress("unused")
val boostHideHorizontalCommentDividersPatch = bytecodePatch(
    name = "Hide horizontal comment dividers",
    description = "Make horizontal comment and load-more dividers transparent while retaining spacing and vertical thread indicators.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        enableCommentFeature("hideDividersEnabled")
        val loadMoreBind = Fingerprint(
            definingClass = LOAD_MORE_HOLDER, name = "w", returnType = "V", isStatic = false,
            parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/LoadMoreModel;"),
        ).method
        if (!loadMoreBind.hasHook(COMMENTS_EXTENSION, "beforeCommentBind")) loadMoreBind.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $COMMENTS_EXTENSION->beforeCommentBind(Ljava/lang/Object;)V")
    }
}

@Suppress("unused")
val boostBottomGalleryActionsPatch = bytecodePatch(
    name = "Bottom gallery action buttons",
    description = "Compact image and gallery action pills with navigation insets; move video download beside the other actions.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        val create = Fingerprint(
            definingClass = GALLERY_ACTIVITY, name = "onCreate", returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"), isStatic = false,
        ).method
        val returns = create.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(returns.size == 2) { "Unexpected GalleryActivity.onCreate layout" }
        // Both returns retain the Activity in p0. No scratch registers are allocated.
        if (!create.hasHook(GALLERY_EXTENSION, "onGalleryCreate")) for (index in returns.asReversed()) {
            create.replaceInstruction(index,
                "invoke-static/range {p0 .. p0}, $GALLERY_EXTENSION->onGalleryCreate(Ljava/lang/Object;)V")
            create.addInstruction(index + 1, "return-void")
        }
        val video = Fingerprint(
            definingClass = VIDEO_ACTIVITY, name = "onResume", returnType = "V",
            parameters = emptyList(), isStatic = false,
        ).method
        // onResume follows layout binding and works even when another source wraps onCreate.
        // Entry retains the receiver without relying on the original's reused exit registers.
        if (!video.hasHook(GALLERY_EXTENSION, "onVideoResume")) video.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $GALLERY_EXTENSION->onVideoResume(Ljava/lang/Object;)V")
        val image = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/activities/a;", name = "onResume",
            returnType = "V", parameters = emptyList(), isStatic = false).method
        if(!image.hasHook(GALLERY_EXTENSION,"onImageResume"))image.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $GALLERY_EXTENSION->onImageResume(Ljava/lang/Object;)V")
        val download = Fingerprint(definingClass = VIDEO_ACTIVITY,name = "c1",returnType = "V",
            parameters = emptyList(),isStatic = false).method
        if(!download.hasHook(GALLERY_EXTENSION,"findActionAnchor")) {
        val anchor = download.implementation!!.instructions.withIndex().single { (_,instruction) ->
            instruction.methodReference()?.let { it.definingClass=="Landroid/view/View;" && it.name=="findViewById" }==true
        }
        val call=anchor.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        check(call.registerCount==2 && call.registerC==0 && call.registerD==1)
        download.replaceInstruction(anchor.index,"invoke-static {v0, v1}, $GALLERY_EXTENSION->findActionAnchor(Landroid/view/View;I)Landroid/view/View;")
        }
        // No onPrepareOptionsMenu exit hook: Boost replaces p0 with its boolean result.
        // The pre-draw observer handles menu inflation and the active image Fragment's actions.
    }
}


@Suppress("unused")
val boostCommentSwipeActionsPatch = bytecodePatch(
    name = "Swipe comment actions",
    description = "Swipe left by distance: short upvotes, medium downvotes, long replies. Preview the selected icon and release to act.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        enableCommentFeature("swipeActionsEnabled")

        val dispatch = Fingerprint(
            definingClass = COMMENTS_ACTIVITY, name = "dispatchTouchEvent", returnType = "Z",
            parameters = listOf("Landroid/view/MotionEvent;"), isStatic = false,
        ).method
        if (!dispatch.hasHook(SWIPE_EXTENSION, "onTouch")) {
            // Verified original locals=3. v0 is a scratch register at method entry.
            check(dispatch.implementation!!.registerCount >= 3)
            val original = dispatch.implementation!!.instructions.first()
            dispatch.addInstructionsWithLabels(0,
                """
                    invoke-static/range {p0 .. p1}, $SWIPE_EXTENSION->onTouch(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :boost_swipe_original
                    return v0
                """.trimIndent(),
                ExternalLabel("boost_swipe_original", original))
        }
        val pause = Fingerprint(
            definingClass = COMMENTS_FRAGMENT, name = "onPause", returnType = "V",
            parameters = emptyList(), isStatic = false,
        ).method
        if (!pause.hasHook(SWIPE_EXTENSION, "onPause")) pause.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $SWIPE_EXTENSION->onPause(Ljava/lang/Object;)V")
    }
}

private val boostPredictiveBackManifestPatch = resourcePatch {
    execute {
        // ActivityRecord reads translucency from the launch theme before il.a1 runs.
        // Preserve the legacy transparent SlidrTheme below API 33.
        val stylePath = "res/values-v33/styles.xml"
        get(stylePath).apply {
            if (!exists()) { parentFile.mkdirs(); writeText("<resources/>") }
        }
        document(stylePath).use { styles ->
            val root = styles.documentElement
            val found = (0 until root.childNodes.length).map { root.childNodes.item(it) }
                .filterIsInstance<org.w3c.dom.Element>()
                .firstOrNull { it.tagName == "style" && it.getAttribute("name") == "SlidrTheme" }
            val style = found ?: styles.createElement("style").also { root.appendChild(it) }
            style.setAttribute("name", "SlidrTheme")
            style.setAttribute("parent", "@style/Base.Theme.Boost.Material.Light")
            for ((name, value) in listOf("android:windowBackground" to "?android:attr/colorBackground",
                    "android:windowIsTranslucent" to "false")) {
                val item = (0 until style.childNodes.length).map { style.childNodes.item(it) }
                    .filterIsInstance<org.w3c.dom.Element>().firstOrNull { it.getAttribute("name") == name }
                    ?: styles.createElement("item").also { style.appendChild(it) }
                item.setAttribute("name", name)
                item.textContent = value
            }
        }
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            application.setAttributeNS("http://schemas.android.com/apk/res/android",
                "android:enableOnBackInvokedCallback", "true")
        }
    }
}

@Suppress("unused")
val boostPredictiveBackPatch = bytecodePatch(
    name = "Predictive back navigation",
    description = "Enable Android's predictive Back animations across supported screens, preserving draft prompts, drawers and browser history.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch, boostPredictiveBackManifestPatch)
    execute {
        val extension = "Lapp/morphe/extension/boost/PredictiveBackTweaks;"
        val application = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/MyApplication;",
            name = "onCreate", returnType = "V", parameters = emptyList(), isStatic = false).method
        if (!application.hasHook(extension, "install")) application.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $extension->install(Ljava/lang/Object;)V")

        // il is BoostSwipeBackActivity, verified in the original 1.14.3 APK. Its setup makes
        // comments translucent and installs a competing content-wide swipe panel. On Android 13+
        // keep the original opaque Activity window and let the system own the edge gesture.
        val setup = Fingerprint(definingClass = "Lil;", name = "a1", returnType = "V",
            parameters = emptyList(), isStatic = false).method
        if (!setup.hasHook(extension, "isSupported")) {
            check(setup.implementation!!.registerCount >= 2) { "No safe local in legacy swipe setup" }
            val original = setup.implementation!!.instructions.first()
            setup.addInstructionsWithLabels(0, """
                invoke-static {}, $extension->isSupported()Z
                move-result v0
                if-eqz v0, :boost_legacy_swipe
                return-void
            """.trimIndent(), ExternalLabel("boost_legacy_swipe", original))
        }
        val finish = Fingerprint(definingClass = "Lil;", name = "finish", returnType = "V",
            parameters = emptyList(), isStatic = false).method
        if (!finish.hasHook(extension, "legacyTransition")) {
            val transition = finish.implementation!!.instructions.withIndex().single { (_, instruction) ->
                instruction.methodReference()?.let { it.definingClass == "Landroid/app/Activity;" &&
                    it.name == "overridePendingTransition" } == true
            }
            val registers = transition.value as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
            check(registers.registerC == 1 && registers.registerD == 0 && registers.registerE == 0 &&
                finish.implementation!!.registerCount == 2) { "Unrecognized legacy finish registers" }
            // Same three arguments, same instruction width; no new registers or branch locations.
            finish.replaceInstruction(transition.index,
                "invoke-static {p0, v0, v0}, $extension->legacyTransition(Landroid/app/Activity;II)V")
        }
    }
}

@Suppress("unused")
val boostPostSwipeActionsPatch = bytecodePatch(
    name = "Swipe post actions",
    description = "Swipe posts left through upvote, downvote, save and hide; rows follow your finger.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        Fingerprint(definingClass = SWIPE_EXTENSION, name = "postSwipesEnabled", returnType = "Z",
            parameters = emptyList(), isStatic = true).method.replaceInstruction(0, "const/4 v0, 0x1")
        enablePostMediaBinder()
        val dispatch = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/submissions/subreddit/SubmissionsActivity;",
            name = "dispatchTouchEvent", returnType = "Z", isStatic = false,
            parameters = listOf("Landroid/view/MotionEvent;")).method
        if (!dispatch.hasHook(SWIPE_EXTENSION, "onTouch")) {
            check(dispatch.implementation!!.registerCount == 5)
            val original = dispatch.implementation!!.instructions.first()
            dispatch.addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p1}, $SWIPE_EXTENSION->onTouch(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
                move-result v0
                if-eqz v0, :boost_post_original
                return v0
            """.trimIndent(), ExternalLabel("boost_post_original", original))
        }
        val destroy = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/activities/a;",
            name = "onDestroy", returnType = "V", parameters = emptyList(), isStatic = false).method
        if (!destroy.hasHook(SWIPE_EXTENSION, "onActivityDestroy")) destroy.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $SWIPE_EXTENSION->onActivityDestroy(Ljava/lang/Object;)V")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.enablePostMediaBinder() {
        val binder = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;",
            name = "w", returnType = "V", isStatic = false,
            parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;", "Z", "Z", "Z", "Lhg2;")).method
        if (!binder.hasHook(SWIPE_EXTENSION, "bindPost")) binder.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $SWIPE_EXTENSION->bindPost(Ljava/lang/Object;)V")
 }

@Suppress("unused")
val boostMediaPeekPatch = bytecodePatch(
    name = "Hold to peek at media",
    description = "Hold a loaded post image or inline comment image/GIF to preview it; release to dismiss.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        enableCommentFeature("mediaPeekEnabled")
        enablePostMediaBinder()
    }
}

@Suppress("unused")
val boostInlineMediaExpansionPatch = bytecodePatch(
    name = "Expand inline comment media",
    description = "Double tap an existing inline image/GIF to expand it in place; single tap retains Boost's viewer.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute { enableCommentFeature("inlineMediaEnabled") }
}

@Suppress("unused")
val boostCommentLayoutPatch = bytecodePatch(
    name = "Polish comment layout",
    description = "Group avatar, username, points, time and awards in a compact flowing header; retain native actions and flair.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute { enableCommentFeature("commentLayoutEnabled"); enableRowCompletion() }
}

private val shikifyVideoSurfaceResourcesPatch = resourcePatch {
    execute {
        val app="http://schemas.android.com/apk/res-auto"
        document("res/layout/activity_media_video.xml").use { doc ->
            val players=doc.getElementsByTagName("com.google.android.exoplayer2.ui.PlayerView")
            check(players.length==1) { "Unexpected video viewer player layout" }
            (players.item(0) as org.w3c.dom.Element).apply {
                // Restore Boost's native surface for streamed and local video alike.
                // Explicitly replace older Shikify TextureView edits on mixed inputs.
                removeAttributeNS(app,"surface_type")
                removeAttributeNS(app,"resize_mode")
            }
        }
    }
}

@Suppress("unused")
val boostViewerPolishPatch = bytecodePatch(
    name = "Polish media viewer",
    description = "Restore native media rendering and close the viewer as soon as a swipe passes its threshold.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch, shikifyVideoSurfaceResourcesPatch)
    execute {
        val method = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/fragments/imagemodel/ImageModelFragment;",
            name = "onResume", returnType = "V", parameters = emptyList(), isStatic = false).method
        if (!method.hasHook("Lapp/morphe/extension/boost/ViewerPolishTweaks;", "onResume"))
            method.addInstruction(0, "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/ViewerPolishTweaks;->onResume(Ljava/lang/Object;)V")
        val activity = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/activities/a;",
            name = "onResume", returnType = "V", parameters = emptyList(), isStatic = false).method
        if (!activity.hasHook("Lapp/morphe/extension/boost/ViewerPolishTweaks;", "onActivityResume"))
            activity.addInstruction(0, "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/ViewerPolishTweaks;->onActivityResume(Ljava/lang/Object;)V")
        val release = Fingerprint(definingClass = "Lcom/liuguangqiang/swipeback/SwipeBackLayout\$e;", name = "j", returnType = "V",
            parameters = listOf("Landroid/view/View;", "F", "F"), isStatic = false).method
        if (!release.hasHook("Lapp/morphe/extension/boost/ViewerPolishTweaks;", "settle")) {
            val settles = release.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.methodReference()?.let { it.definingClass == "Ljm3;" && it.name == "s" } == true
            }.toList()
            check(settles.size == 4) { "Unrecognized SwipeBackLayout release" }
            // Same width and same boolean result. p0 already holds the SwipeBackLayout here.
            for ((index, instruction) in settles) {
                val call = instruction as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                check(call.registerCount == 3)
                release.replaceInstruction(index, "invoke-static {p0, v${call.registerC}, v${call.registerD}, v${call.registerE}}, " +
                    "Lapp/morphe/extension/boost/ViewerPolishTweaks;->settle(Ljava/lang/Object;Ljava/lang/Object;II)Z")
            }
        }
    }
}

private val boostMaterialYouResourcesPatch = resourcePatch {
    execute {
        val android="http://schemas.android.com/apk/res/android"
        val app="http://schemas.android.com/apk/res-auto"
        // Rounded (and, with glass on, frosted) Material 3 menu container. Android 7+ inflates
        // app-defined Drawable classes from XML; the class lives in the extension.
        get("res/drawable/shikify_menu_background.xml").apply {
            parentFile.mkdirs()
            writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                "<drawable xmlns:android=\"http://schemas.android.com/apk/res/android\" " +
                "class=\"app.morphe.extension.boost.GlassMenuBackground\" />\n")
        }
        // Keep Boost's own action/callback, but expose the community panel in one tap.
        document("res/menu/menu_subreddit.xml").use { doc ->
            val items=doc.getElementsByTagName("item")
            for(i in 0 until items.length){val item=items.item(i) as org.w3c.dom.Element
                if(item.getAttributeNS(android,"id")=="@id/action_sidebar"){
                    item.setAttributeNS(app,"app:showAsAction","always")
                    item.setAttributeNS(android,"android:orderInCategory","4")
                }
            }
        }
        for(path in listOf("res/layout/material_drawer_item_divider.xml","res/layout/material_drawer_item_section.xml"))document(path).use { doc ->
            val rule=doc.getElementsByTagName("View").item(0) as org.w3c.dom.Element
            for(side in listOf("Left","Right","Start","End"))rule.setAttributeNS(android,"android:layout_margin$side","28dp")
        }
        document("res/layout/material_drawer_item_subscription.xml").use { doc ->
            val icon=doc.getElementsByTagName("de.hdodenhof.circleimageview.CircleImageView").item(0) as org.w3c.dom.Element
            for(side in listOf("Left","Top","Right","Bottom","Start","End"))icon.setAttributeNS(android,"android:padding$side","0dp")
            icon.setAttributeNS(android,"android:layout_width","32dp");icon.setAttributeNS(android,"android:layout_height","32dp")
            // ConstraintLayout only honours the margin on the side a view is constrained from.
            val views=doc.getElementsByTagName("androidx.appcompat.widget.AppCompatTextView")
            for(i in 0 until views.length){val text=views.item(i) as org.w3c.dom.Element
                if(text.getAttributeNS(android,"id") in setOf("@id/material_drawer_name","@id/material_drawer_description"))
                    for(side in listOf("Left","Start"))text.setAttributeNS(android,"android:layout_margin$side","12dp")}
        }
        document("res/layout/row_comments_search_field.xml").use { doc ->
            val box=doc.getElementsByTagName("com.google.android.material.textfield.TextInputLayout").item(0) as org.w3c.dom.Element
            val field=doc.getElementsByTagName("com.google.android.material.textfield.TextInputEditText").item(0) as org.w3c.dom.Element
            val hint=box.getAttributeNS(android,"hint");box.removeAttributeNS(android,"hint");field.setAttributeNS(android,"android:hint",hint)
            box.setAttributeNS(app,"app:hintEnabled","false");box.setAttributeNS(app,"app:boxBackgroundColor","?attr/colorSurfaceContainerHighest")
            box.setAttributeNS(app,"app:boxStrokeWidth","0dp");box.setAttributeNS(app,"app:boxStrokeWidthFocused","0dp")
            for(corner in listOf("TopStart","TopEnd","BottomStart","BottomEnd"))box.setAttributeNS(app,"app:boxCornerRadius$corner","28dp")
        }
        get("res/drawable/shikify_thumbnail_background.xml").apply {
            parentFile.mkdirs()
            writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<shape xmlns:android=\"http://schemas.android.com/apk/res/android\" android:shape=\"rectangle\">" +
                "<solid android:color=\"#14ffffff\" /><corners android:radius=\"16dp\" /></shape>\n")
        }
        document("res/layout/activity_album_grid.xml").use { doc ->
            doc.documentElement.removeAttributeNS(android,"background")
            val bar=doc.getElementsByTagName("com.google.android.material.appbar.AppBarLayout").item(0) as org.w3c.dom.Element
            val tools=doc.getElementsByTagName("com.google.android.material.appbar.MaterialToolbar").item(0) as org.w3c.dom.Element
            bar.setAttributeNS(android,"android:background","@android:color/transparent");bar.setAttributeNS(app,"app:elevation","0dp")
            tools.setAttributeNS(android,"android:background","@android:color/transparent")
        }
        document("res/layout/content_album_grid.xml").use { doc ->
            val list=doc.getElementsByTagName("androidx.recyclerview.widget.RecyclerView").item(0) as org.w3c.dom.Element
            for(side in listOf("Left","Right","Top"))list.setAttributeNS(android,"android:padding$side","9dp")
            list.setAttributeNS(android,"android:paddingBottom","96dp");list.setAttributeNS(android,"android:clipToPadding","false")
        }
        document("res/layout/row_album_grid_item.xml").use { doc ->
            val row=doc.documentElement
            row.removeAttributeNS(android,"padding");row.setAttributeNS(android,"android:background","@drawable/shikify_thumbnail_background");row.setAttributeNS(android,"android:clipToOutline","true")
            val image=doc.getElementsByTagName("ImageView").item(0) as org.w3c.dom.Element
            image.setAttributeNS(android,"android:scaleType","centerCrop");image.removeAttributeNS(android,"adjustViewBounds")
            val cover=doc.getElementsByTagName("View").item(0) as org.w3c.dom.Element
            cover.setAttributeNS(android,"android:background","?attr/colorPrimary");cover.setAttributeNS(android,"android:alpha","0.38")
        }
        fun motion(name:String,body:String){get("res/anim/$name.xml").apply {parentFile.mkdirs();writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n$body\n")}}
        val ns="xmlns:android=\"http://schemas.android.com/apk/res/android\""
        get("res/interpolator/shikify_emphasized.xml").apply {
            parentFile.mkdirs()
            writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<pathInterpolator $ns android:controlX1=\"0.2\" android:controlY1=\"0\" android:controlX2=\"0\" android:controlY2=\"1\" />\n")
        }
        val eased="android:interpolator=\"@interpolator/shikify_emphasized\" android:shareInterpolator=\"true\""
        // Media only fades: moving or scaling these windows reads as jitter while the image settles.
        motion("activity_fade_in","<alpha $ns $eased android:duration=\"150\" android:fromAlpha=\"0\" android:toAlpha=\"1\" />")
        motion("activity_fade_out","<alpha $ns $eased android:duration=\"120\" android:fromAlpha=\"1\" android:toAlpha=\"0\" />")
        // The video player's bottom row gains download; hidden until the player shows it.
        for(path in listOf("res/layout/view_media_submission_buttons.xml","res/layout/view_media_submission_buttons_tok.xml"))document(path).use { doc ->
            val views=doc.getElementsByTagName("ImageButton")
            val share=(0 until views.length).map { views.item(it) as org.w3c.dom.Element }.single { it.getAttributeNS(android,"id")=="@id/submission_media_overflow" }
            val slot=share.parentNode as org.w3c.dom.Element
            val framed=slot.tagName=="FrameLayout"
            val copy=(if(framed)slot else share).cloneNode(true) as org.w3c.dom.Element
            val button=if(framed)copy.getElementsByTagName("ImageButton").item(0) as org.w3c.dom.Element else copy
            button.setAttributeNS(android,"android:id","@id/action_download")
            button.setAttributeNS(android,"android:src","@drawable/ic_save_alt_white_24dp")
            button.setAttributeNS(android,"android:contentDescription","@string/download")
            copy.setAttributeNS(android,"android:visibility","gone")
            val anchor=if(framed)slot else share
            anchor.parentNode.insertBefore(copy,anchor)
        }
        // Fixed accent colours become wallpaper tones on Android 12+, and keep their originals below it.
        document("res/values/colors.xml").use { doc ->
            val colours=doc.getElementsByTagName("color")
            for(i in colours.length-1 downTo 0){val node=colours.item(i) as org.w3c.dom.Element;if(node.getAttribute("name")=="shikify_accent")node.parentNode.removeChild(node)}
            doc.createElement("color").apply {setAttribute("name","shikify_accent");textContent="#ffc107";doc.documentElement.appendChild(this)}
        }
        document("res/values-v31/colors.xml").use { doc ->
            val colours=doc.getElementsByTagName("color")
            // Votes keep Reddit's own colours.
            val tones=mapOf("saved_color" to "system_accent1_300","shikify_accent" to "system_accent1_300")
            for(i in colours.length-1 downTo 0){val node=colours.item(i) as org.w3c.dom.Element;if(node.getAttribute("name") in tones)node.parentNode.removeChild(node)}
            for((name,tone) in tones)doc.createElement("color").apply {setAttribute("name",name);textContent="@android:color/$tone";doc.documentElement.appendChild(this)}
        }
        for(path in listOf("res/drawable/ic_outline_wb_sunny_24.xml","res/drawable/ic_night_24dp.xml"))document(path).use { doc ->
            doc.documentElement.removeAttributeNS(android,"tint")
            val paths=doc.getElementsByTagName("path")
            for(i in 0 until paths.length)(paths.item(i) as org.w3c.dom.Element).setAttributeNS(android,"android:fillColor","@color/shikify_accent")
        }
        // Settings toggles become switches and rows gain room for their rounded group.
        get("res/layout/preference_widget_checkbox.xml").writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
            "<androidx.appcompat.widget.SwitchCompat xmlns:android=\"http://schemas.android.com/apk/res/android\" android:id=\"@android:id/checkbox\" " +
            "android:background=\"@null\" android:focusable=\"false\" android:clickable=\"false\" android:layout_width=\"wrap_content\" android:layout_height=\"wrap_content\" " +
            "style=\"@style/Widget.Material3.CompoundButton.MaterialSwitch\" />\n")
        for(path in listOf("res/layout/preference_material.xml","res/layout/preference_category_material.xml"))document(path).use { doc ->
            for(side in listOf("Left","Right","Start","End"))doc.documentElement.setAttributeNS(android,"android:layout_margin$side","12dp")
        }
        // Boost and Patcheddit set these icons at runtime, so the pairs are applied by Screen.iconStates.
        val icon="xmlns:android=\"http://schemas.android.com/apk/res/android\" android:width=\"24dp\" android:height=\"24dp\" android:viewportWidth=\"24\" android:viewportHeight=\"24\""
        fun vector(name:String,data:String){get("res/drawable/$name.xml").writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<vector $icon><path android:fillColor=\"#ffffffff\" android:pathData=\"$data\" /></vector>\n")}
        vector("shikify_nav_home_on","M10,20v-6h4v6h5v-8h3L12,3 2,12h3v8z")
        vector("shikify_nav_home_off","M12,5.69l5,4.5V18h-2v-6H9v6H7v-7.81l5,-4.5M12,3L2,12h3v8h6v-6h2v6h6v-8h3L12,3z")
        vector("shikify_nav_inbox_on","M20,4H4c-1.1,0 -1.99,0.9 -1.99,2L2,18c0,1.1 0.9,2 2,2h16c1.1,0 2,-0.9 2,-2V6c0,-1.1 -0.9,-2 -2,-2zm0,4l-8,5 -8,-5V6l8,5 8,-5v2z")
        vector("shikify_nav_inbox_off","M22,6c0,-1.1 -0.9,-2 -2,-2H4c-1.1,0 -2,0.9 -2,2v12c0,1.1 0.9,2 2,2h16c1.1,0 2,-0.9 2,-2V6zM20,6l-8,5 -8,-5h16zM20,18H4V8l8,5 8,-5v10z")
        for(name in listOf("home","inbox"))get("res/drawable/shikify_nav_$name.xml").writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<selector xmlns:android=\"http://schemas.android.com/apk/res/android\">" +
            "<item android:state_checked=\"true\" android:drawable=\"@drawable/shikify_nav_${name}_on\" /><item android:drawable=\"@drawable/shikify_nav_${name}_off\" /></selector>\n")
        // Comment navigation becomes a compact pill, sized by its buttons rather than the screen.
        document("res/layout/layout_comments_navigation_arrows.xml").use { doc ->
            doc.documentElement.removeAttributeNS(android,"background")
            doc.documentElement.setAttributeNS(android,"android:layout_width","wrap_content")
            doc.documentElement.setAttributeNS(android,"android:paddingLeft","4dp");doc.documentElement.setAttributeNS(android,"android:paddingRight","4dp")
            val buttons=doc.getElementsByTagName("ImageButton")
            for(i in 0 until buttons.length){val button=buttons.item(i) as org.w3c.dom.Element
                button.setAttributeNS(android,"android:layout_width","56dp");button.setAttributeNS(android,"android:layout_height","48dp");button.removeAttributeNS(android,"layout_weight")}
        }
        // Boost resets this row's padding when binding, leaving the theme toggle past the edge of its group.
        document("res/layout/material_drawer_item_button.xml").use { doc ->
            val boxes=doc.getElementsByTagName("LinearLayout")
            for(i in 0 until boxes.length){val box=boxes.item(i) as org.w3c.dom.Element
                if(box.getAttributeNS(android,"id")=="@id/material_drawer_button_container")
                    for(side in listOf("Right","End"))box.setAttributeNS(android,"android:layout_margin$side","16dp")}
        }
        document("res/layout/active_image_button.xml").use { doc ->
            val icon=doc.getElementsByTagName("ImageView").item(0) as org.w3c.dom.Element
            icon.setAttributeNS(android,"android:layout_width","18dp")
            icon.setAttributeNS(android,"android:layout_height","18dp")
            icon.setAttributeNS(android,"android:scaleType","centerInside")
        }
        // Undo earlier Shikify media-row edits on mixed inputs too.
        document("res/layout/view_media_submission_buttons.xml").use { doc ->
            doc.documentElement.setAttributeNS(android,"android:layout_height","@dimen/button_row_media")
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                if(view.tagName=="ImageButton"){view.removeAttributeNS(android,"scaleType");view.removeAttributeNS(android,"padding")}
                if(view.getAttributeNS(android,"id") in setOf("@id/submission_header_score","@id/submission_header_comment_count"))view.removeAttributeNS(android,"textSize")
            }
        }
        for(path in listOf("res/layout/row_submission_minimal_buttons.xml"))document(path).use { doc ->
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                if(view.tagName=="ImageButton") {
                    view.setAttributeNS(android,"android:scaleType","centerInside")
                    view.setAttributeNS(android,"android:padding","12dp")
                }
                if(view.getAttributeNS(android,"id") in setOf("@id/submission_header_score","@id/submission_header_comment_count"))
                    view.setAttributeNS(android,"android:textSize","14sp")
            }
        }
        for(path in listOf("res/layout/view_user_info.xml","res/layout/view_user_info_old.xml"))document(path).use { doc ->
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                when(view.getAttributeNS(android,"id")) {
                    "@id/user_info_icon" -> view.setAttributeNS(app,"app:riv_oval","true")
                    "@id/user_info_banner" -> {view.removeAttributeNS(android,"src");view.setAttributeNS(android,"android:background","?attr/colorSecondaryContainer")}
                }
            }
        }
        document("res/layout/activity_user.xml").use { doc ->
            val profiles=doc.getElementsByTagName("com.rubenmayayo.reddit.ui.customviews.UserInfoView")
            for(i in 0 until profiles.length)(profiles.item(i) as org.w3c.dom.Element).setAttributeNS(app,"app:layout_collapseMode","none")
            val tabs=doc.getElementsByTagName("com.google.android.material.tabs.TabLayout").item(0) as org.w3c.dom.Element
            tabs.setAttributeNS(android,"android:background","?attr/colorSurfaceContainerLow")
            tabs.setAttributeNS(app,"app:tabIndicatorColor","?attr/colorPrimary")
            tabs.setAttributeNS(app,"app:tabSelectedTextColor","?attr/colorPrimary")
        }
        fun org.w3c.dom.Element.put(doc: org.w3c.dom.Document, name: String, value: String) {
            val item = (0 until childNodes.length).map { childNodes.item(it) }
                .filterIsInstance<org.w3c.dom.Element>().firstOrNull { it.tagName == "item" && it.getAttribute("name") == name }
                ?: doc.createElement("item").also { appendChild(it) }
            item.setAttribute("name", name); item.textContent = value
        }
        val names = listOf("MaterialDarkTheme", "MaterialDarkTheme.Amoled", "MaterialDarkTheme.Dynamic", "MaterialLightTheme", "MaterialLightTheme.Dynamic")
        document("res/values/styles.xml").use { styles ->
            val all = (0 until styles.getElementsByTagName("style").length).map {
                styles.getElementsByTagName("style").item(it) as org.w3c.dom.Element
            }
            for (style in all.filter { it.getAttribute("name") in names }) {
                // Separate background and content roles, retaining the active theme on older Android.
                for ((key, value) in mapOf("LightContentBackground" to "?attr/colorSurfaceContainerHigh",
                    "ContentBackground" to "?attr/colorSurfaceContainerLow", "SubtleBackground" to "?attr/colorSurfaceContainerHighest", "ToolbarColor" to "?attr/colorSurfaceContainerLow",
                    "android:windowBackground" to "?attr/ContentBackground", "HighlightBackground" to "?attr/colorSecondaryContainer",
                    "popupMenuBackground" to "@drawable/shikify_menu_background",
                    "material_drawer_background" to "?attr/colorSurfaceContainerLow", "material_drawer_divider" to "@android:color/transparent",
                    "material_drawer_header_selection_text" to "?attr/colorOnSurface", "SpoilerColor" to "?attr/colorSurfaceContainerHighest", "SpoilerText" to "?attr/colorOnSurface",
                    "ShapeStrokeColor" to "?attr/colorOutlineVariant", "colorPrimaryVariant" to "?attr/colorPrimary",
                    "textInputOutlinedStyle" to "@style/Shikify.TextInput", "textInputOutlinedDenseStyle" to "@style/Shikify.TextInput.Dense",
                    "material_drawer_selected" to "?attr/colorSecondaryContainer", "material_drawer_selected_text" to "?attr/colorOnSecondaryContainer",
                    "md_background_color" to "?attr/colorSurfaceContainerHigh"))
                    style.put(styles, key, value)
            }
            // Toolbar popups inflate through Boost's PopupTheme overlays; give them the same container.
            for (style in all.filter { it.getAttribute("name").startsWith("ThemeOverlay.Boost.Material.") &&
                    it.getAttribute("name").endsWith(".PopupOverlay") })
                style.put(styles, "popupMenuBackground", "@drawable/shikify_menu_background")
            // Filled Material 3 fields replace outlined boxes. Dropdowns keep their own style.
            for ((name, parent) in listOf("Shikify.TextInput" to "Widget.Material3.TextInputLayout.FilledBox", "Shikify.TextInput.Dense" to "Widget.Material3.TextInputLayout.FilledBox.Dense")) {
                all.filter { it.getAttribute("name") == name }.forEach { it.parentNode.removeChild(it) }
                styles.createElement("style").apply {
                    setAttribute("name", name);setAttribute("parent", "@style/$parent")
                    put(styles, "boxBackgroundColor", "?attr/colorSurfaceContainerHighest")
                    put(styles, "boxStrokeWidth", "0dp");put(styles, "boxStrokeWidthFocused", "0dp")
                    for (corner in listOf("TopStart", "TopEnd", "BottomStart", "BottomEnd")) put(styles, "boxCornerRadius$corner", "16dp")
                    styles.documentElement.appendChild(this)
                }
            }
            // Dividers between settings rows are replaced by rounded groups.
            for (style in all.filter { it.getAttribute("name").startsWith("Preference.") && it.getAttribute("name").endsWith(".Material") }) {
                style.put(styles, "allowDividerAbove", "false");style.put(styles, "allowDividerBelow", "false")
            }
            all.single { it.getAttribute("name") == "CustomShapeAppearanceBottomSheetDialog" }.apply {
                put(styles, "cornerSizeTopLeft", "28dp");put(styles, "cornerSizeTopRight", "28dp")
            }
            // The feed stays still behind a media window.
            all.single { it.getAttribute("name") == "YourAnimation.Activity" }.apply {
                put(styles,"android:activityOpenExitAnimation","@anim/stay_still")
                put(styles,"android:activityCloseEnterAnimation","@anim/stay_still")
                put(styles,"android:activityCloseExitAnimation","@anim/activity_fade_out")
            }
            all.single { it.getAttribute("name") == "Widget.Material3.Snackbar" }.apply {
                put(styles,"shapeAppearance","?attr/shapeAppearanceCornerMedium")
            }
            all.single { it.getAttribute("name") == "Widget.Boost.Material.Feed.CardView.Mini" }.apply {
                put(styles,"cardCornerRadius","16dp");put(styles,"cardElevation","0dp")
            }
            all.single { it.getAttribute("name") == "Widget.Boost.Material.BottomNavigationView" }.apply {
                put(styles,"android:background","?attr/colorSurfaceContainerHighest")
            }
            // Native dynamic colour tokens already exist in this APK. Override the selected
            // Material themes using their official M3 roles, never a copied screenshot palette.
            val sources = all.filter { it.getAttribute("name") in names }.map { it.cloneNode(true) as org.w3c.dom.Element }
            val dialogs = all.filter { it.getAttribute("name") in setOf("MD_Dark", "MD_Light") }.map { it.cloneNode(true) as org.w3c.dom.Element }
            check(dialogs.size == 2) { "Unexpected MaterialDialog themes" }
            document("res/values-v31/styles.xml").use { dynamic ->
                val root = dynamic.documentElement
                // Android 12+ blurs what is behind the dialog; older versions keep the plain scrim.
                for (source in dialogs) {
                    val old = (0 until root.childNodes.length).map { root.childNodes.item(it) }
                        .filterIsInstance<org.w3c.dom.Element>().firstOrNull { it.getAttribute("name") == source.getAttribute("name") }
                    if (old != null) root.removeChild(old)
                    val style = dynamic.importNode(source, true) as org.w3c.dom.Element
                    root.appendChild(style)
                    style.put(dynamic, "android:windowBlurBehindEnabled", "true")
                    style.put(dynamic, "android:windowBlurBehindRadius", "12dp")
                    style.put(dynamic, "android:backgroundDimAmount", "0.32")
                    style.put(dynamic, "android:windowAnimationStyle", "@style/MaterialAlertDialog.Material3.Animation")
                }
                for (source in sources) {
                    val name = source.getAttribute("name")
                    val old = (0 until root.childNodes.length).map { root.childNodes.item(it) }
                        .filterIsInstance<org.w3c.dom.Element>().firstOrNull { it.getAttribute("name") == name }
                    if (old != null) root.removeChild(old)
                    val style = dynamic.importNode(source,true) as org.w3c.dom.Element
                    root.appendChild(style)
                    val mode = if (name.startsWith("MaterialDark")) "dark" else "light"
                    for ((attr, token) in mapOf("colorPrimary" to "primary", "colorOnPrimary" to "on_primary",
                        "colorPrimaryContainer" to "primary_container", "colorOnPrimaryContainer" to "on_primary_container",
                        "colorSecondary" to "secondary", "colorOnSecondary" to "on_secondary",
                        "colorSecondaryContainer" to "secondary_container", "colorOnSecondaryContainer" to "on_secondary_container",
                        "colorTertiary" to "tertiary", "colorOnTertiary" to "on_tertiary",
                        "colorTertiaryContainer" to "tertiary_container", "colorOnTertiaryContainer" to "on_tertiary_container",
                        "colorSurface" to "surface", "colorOnSurface" to "on_surface", "colorOnSurfaceVariant" to "on_surface_variant",
                        "colorSurfaceContainer" to "surface_container", "colorSurfaceContainerLow" to "surface_container_low",
                        "colorSurfaceContainerHigh" to "surface_container_high", "colorSurfaceContainerHighest" to "surface_container_highest",
                        "colorSurfaceContainerLowest" to "surface_container_lowest", "colorOutline" to "outline", "colorOutlineVariant" to "outline_variant",
                        "colorSurfaceVariant" to "surface_variant", "colorSurfaceBright" to "surface_bright", "colorSurfaceDim" to "surface_dim",
                        "colorOnBackground" to "on_background", "colorSurfaceInverse" to "inverse_surface", "colorOnSurfaceInverse" to "inverse_on_surface",
                        "colorPrimaryInverse" to "inverse_primary", "colorError" to "error", "colorOnError" to "on_error",
                        "colorErrorContainer" to "error_container", "colorOnErrorContainer" to "on_error_container"))
                        style.put(dynamic,attr,"@color/m3_sys_color_dynamic_${mode}_$token")
                    style.put(dynamic,"android:colorBackground","?attr/colorSurfaceContainerLow")
                    style.put(dynamic,"colorAccent","?attr/colorPrimary")
                    style.put(dynamic,"LightContentBackground","?attr/colorSurfaceContainerHigh")
                    style.put(dynamic,"SubtleBackground","?attr/colorSurfaceContainerHighest")
                    style.put(dynamic,"ContentBackground","?attr/colorSurfaceContainerLow")
                    style.put(dynamic,"ToolbarColor","?attr/colorSurfaceContainerLow")
                    style.put(dynamic,"colorControlNormal","?attr/colorOnSurfaceVariant")
                    style.put(dynamic,"PrimaryTextColor","?attr/colorOnSurface")
                    style.put(dynamic,"SecondaryTextColor","?attr/colorOnSurfaceVariant")
                    style.put(dynamic,"LinkColor","?attr/colorPrimary")
                    style.put(dynamic,"HighlightTextColor","?attr/colorOnSurfaceVariant")
                    style.put(dynamic,"HighlightBackground","?attr/colorSecondaryContainer")
                }
            }
        }
        document("res/values/dimens.xml").use { dimensions ->
            for (i in 0 until dimensions.getElementsByTagName("dimen").length) {
                val item = dimensions.getElementsByTagName("dimen").item(i) as org.w3c.dom.Element
                when (item.getAttribute("name")) {
                    "indent_line_width_lines" -> item.textContent = "2dp"
                    "indent_line_width_colors" -> item.textContent = "4dp"
                    "indent_margin_width_lines" -> item.textContent = "14dp"
                    "indent_margin_width_colors" -> item.textContent = "0dp"
                    // Material 3 navigation drawer: 56dp pills inset 12dp, content at 28dp.
                    "md_bg_corner_radius" -> item.textContent = "28dp"
                    "material_drawer_item_primary" -> item.textContent = "56dp"
                    "material_drawer_item_corner_radius" -> item.textContent = "28dp"
                    "material_drawer_item_background_padding_start_end" -> item.textContent = "16dp"
                    "material_drawer_item_background_padding_top_bottom" -> item.textContent = "0dp"
                    "material_drawer_vertical_padding" -> item.textContent = "28dp"
                    "material_drawer_item_primary_icon" -> item.textContent = "36dp"
                    "material_drawer_item_primary_icon_padding" -> item.textContent = "16dp"
                    "material_drawer_item_primary_icon_padding_right" -> item.textContent = "12dp"
                }
            }
        }
    }
}

/** Light and condensed families are Boost's own choices; medium stays as a weight of the system font. */
private val shikifySystemFontResourcesPatch = resourcePatch {
    execute {
        val android="http://schemas.android.com/apk/res/android"
        val custom=setOf("sans-serif-light","sans-serif-thin","sans-serif-condensed","sans-serif-condensed-light")
        document("res/values/styles.xml").use { styles ->
            val items=styles.getElementsByTagName("item")
            for(i in 0 until items.length){val item=items.item(i) as org.w3c.dom.Element
                if(item.getAttribute("name")=="android:fontFamily" && item.textContent in custom)item.textContent="sans-serif"}
        }
        for(file in get("res/layout").listFiles().orEmpty().filter { it.readText().contains("sans-serif-") })document("res/layout/${file.name}").use { doc ->
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                if(view.getAttributeNS(android,"fontFamily") in custom)view.setAttributeNS(android,"android:fontFamily","sans-serif")}
        }
    }
}

@Suppress("unused")
val shikifySystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Use your phone's system font for posts, comments, names and the rest of the app. Boost's own font settings stop applying.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifySystemFontResourcesPatch)
    execute {
        // Every Boost font preference resolves through this one lookup.
        val lookup=Fingerprint(definingClass="Lps2;",name="e0",returnType="Landroid/graphics/Typeface;",isStatic=true,
            parameters=listOf("Landroid/content/Context;","Ljava/lang/String;")).method
        lookup.addInstruction(0,"return-object v0")
        lookup.addInstruction(0,"sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;")
    }
}

private val shikifySurfaceResourcesPatch = resourcePatch {
    execute {
        document("res/values/strings.xml").use { doc ->
            val strings=doc.getElementsByTagName("string")
            for(i in strings.length-1 downTo 0){val node=strings.item(i) as org.w3c.dom.Element;if(node.getAttribute("name")=="shikify_view_more")node.parentNode.removeChild(node)}
            val label=doc.createElement("string");label.setAttribute("name","shikify_view_more");label.textContent="View more (%1\$d)";doc.documentElement.appendChild(label)
        }

        val android="http://schemas.android.com/apk/res/android"
        val app="http://schemas.android.com/apk/res-auto"
        val options=listOf(
            Triple("surface_treatment",listOf("Dimmed","Solid"),listOf("dimmed","solid")),
            Triple("dim_opacity",listOf("Lighter (55%)","Balanced (70%)","Darker (80%)","Darkest (90%)"),listOf("55","70","80","90")))
        document("res/values/arrays.xml").use { doc->
            for((key,titles,values) in options)for((suffix,items) in listOf("titles" to titles,"values" to values)){
                val existing=doc.getElementsByTagName("string-array")
                for(i in existing.length-1 downTo 0){val node=existing.item(i) as org.w3c.dom.Element;if(node.getAttribute("name")=="shikify_${key}_$suffix")node.parentNode.removeChild(node)}
                val array=doc.createElement("string-array");array.setAttribute("name","shikify_${key}_$suffix")
                for(value in items){val item=doc.createElement("item");item.textContent=value;array.appendChild(item)}
                doc.documentElement.appendChild(array)
            }
        }
        for(path in listOf("res/xml/pref_appearance.xml","res/xml/pref_appearance_v2.xml"))document(path).use { doc->
            val existing=doc.getElementsByTagName("PreferenceCategory")
            for(i in existing.length-1 downTo 0){val node=existing.item(i) as org.w3c.dom.Element;if(node.getAttributeNS(android,"title")=="Shikify surfaces")node.parentNode.removeChild(node)}
            val category=doc.createElement("PreferenceCategory");category.setAttributeNS(android,"android:title","Shikify surfaces")
            for((key,title,default) in listOf(Triple("surface_treatment","Surface style","dimmed"),Triple("dim_opacity","Media backdrop dimming","70"))){
                val item=doc.createElement("ListPreference")
                for((attr,value) in mapOf("key" to "shikify_$key","title" to title,"defaultValue" to default,
                    "entries" to "@array/shikify_${key}_titles","entryValues" to "@array/shikify_${key}_values"))item.setAttributeNS(android,"android:$attr",value)
                if(path.endsWith("_v2.xml"))item.setAttributeNS(app,"app:useSimpleSummaryProvider","true") else item.setAttributeNS(android,"android:summary","%s")
                category.appendChild(item)
            }
            val blur=doc.createElement("CheckBoxPreference")
            for((attr,value) in mapOf("key" to "shikify_feed_pill_blur","title" to "Glass pill blur","summary" to "Frosted navigation and media controls with glass edges","defaultValue" to "true"))blur.setAttributeNS(android,"android:$attr",value)
            category.appendChild(blur)
            doc.documentElement.appendChild(category)
        }
        document("AndroidManifest.xml").use { doc ->
            val name="app.morphe.extension.boost.SurfaceSettingsActivity";val nodes=doc.getElementsByTagName("activity")
            if((0 until nodes.length).none { (nodes.item(it) as org.w3c.dom.Element).getAttributeNS(android,"name")==name }){
                val activity=doc.createElement("activity");activity.setAttributeNS(android,"android:name",name);activity.setAttributeNS(android,"android:exported","false");activity.setAttributeNS(android,"android:label","Shikify");doc.getElementsByTagName("application").item(0).appendChild(activity)
            }
        }
        document("res/values/styles.xml").use { doc->
            fun style(name:String,parent:String):org.w3c.dom.Element {
                val existing=doc.getElementsByTagName("style")
                for(i in existing.length-1 downTo 0){val node=existing.item(i) as org.w3c.dom.Element;if(node.getAttribute("name")==name)node.parentNode.removeChild(node)}
                val node=doc.createElement("style");node.setAttribute("name",name);node.setAttribute("parent",parent)
                for((key,value) in mapOf("android:windowIsTranslucent" to "false","android:windowBackground" to "@android:color/black","android:windowIsFloating" to "false","android:backgroundDimEnabled" to "false","android:windowDisablePreview" to "false")){
                    val item=doc.createElement("item");item.setAttribute("name",key);item.textContent=value;node.appendChild(item)
                }
                doc.documentElement.appendChild(node);return node
            }
            style("Theme.Shikify.Media","@style/Theme.Boost.Black.Immersive")
            style("ThemeOverlay.Shikify.Translucent","")
        }
        for(path in listOf("res/layout/activity_subreddit_collapsing_left.xml","res/layout/activity_subreddit_collapsing_center.xml"))document(path).use { doc->
            val views=doc.getElementsByTagName("RelativeLayout")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element;if(view.getAttributeNS(android,"id")=="@id/header_content"){view.setAttributeNS(android,"android:layout_marginTop","0dp");view.setAttributeNS("http://schemas.android.com/apk/res-auto","app:layout_collapseMode","none")}}
        }
        // Pager pages inflate after the Activity callback; remove their own black
        // backdrop in XML, independently of the optional viewer-polish hook.
        document("res/layout/fragment_image_model.xml").use { doc->
            doc.documentElement.setAttributeNS(android,"android:background","@color/almost_black")
        }
        document("AndroidManifest.xml").use { doc->
            val targets=setOf("MediaImageActivity","MediaVideoActivity","GalleryImgurActivity","GalleryCommentsActivity","GalleryXkcdActivity","GalleryRedditActivity","GalleryDeviantActivity")
            val activities=doc.getElementsByTagName("activity")
            for(i in 0 until activities.length){val node=activities.item(i) as org.w3c.dom.Element;val name=node.getAttributeNS(android,"name").substringAfterLast('.');if(name in targets)node.setAttributeNS(android,"android:theme",if(name=="MediaImageActivity" || name=="MediaVideoActivity") "@style/Theme.Boost.Black.Immersive" else "@style/Theme.Boost.Black")}
        }
    }
    finalize {
        val android="http://schemas.android.com/apk/res/android"
        for(path in listOf("res/xml/pref_appearance.xml","res/xml/pref_appearance_v2.xml"))document(path).use { doc ->
            val categories=doc.getElementsByTagName("PreferenceCategory")
            for(i in categories.length-1 downTo 0){val node=categories.item(i) as org.w3c.dom.Element;if(node.getAttributeNS(android,"title")=="Shikify surfaces")node.parentNode.removeChild(node)}
        }
        // Add our own destination without replacing Patcheddit's header document.
        for(path in listOf("res/xml/pref_headers_v2.xml","res/xml/pref_appearance.xml"))document(path).use { doc ->
            val nodes=doc.getElementsByTagName("Preference")
            for(i in nodes.length-1 downTo 0){val node=nodes.item(i) as org.w3c.dom.Element;if(node.getAttributeNS(android,"key")=="shikify_settings_entry")node.parentNode.removeChild(node)}
            val entry=doc.createElement("Preference");entry.setAttributeNS(android,"android:key","shikify_settings_entry");entry.setAttributeNS(android,"android:title","Shikify Settings");entry.setAttributeNS(android,"android:summary","Glass strength, update interval and gesture controls")
            val intent=doc.createElement("intent");intent.setAttributeNS(android,"android:targetPackage","com.rubenmayayo.reddit");intent.setAttributeNS(android,"android:targetClass","app.morphe.extension.boost.SurfaceSettingsActivity");entry.appendChild(intent);entry.setAttributeNS(android,"android:icon","@drawable/ic_settings_24dp");
            val morphe=(0 until nodes.length).map { nodes.item(it) as org.w3c.dom.Element }.firstOrNull { it.getAttributeNS(android,"key")=="morphe_boost_settings_entry" }
            if(morphe!=null)doc.documentElement.insertBefore(entry,morphe.nextSibling) else doc.documentElement.insertBefore(entry,doc.documentElement.firstChild)
        }
        // Restore a missing link only when the other source supplies its actual entry XML.
        val morpheEntry=get("res/xml/morphe_boost_settings_entry.xml")
        if(morpheEntry.exists())document("res/xml/morphe_boost_settings_entry.xml").use { source ->
            document("res/xml/pref_headers_v2.xml").use { doc ->
                val prefs=doc.getElementsByTagName("Preference")
                val present=(0 until prefs.length).any { (prefs.item(it) as org.w3c.dom.Element).getAttributeNS(android,"key")=="morphe_boost_settings_entry" }
                if(!present && source.documentElement.tagName=="Preference")doc.documentElement.insertBefore(doc.importNode(source.documentElement,true),doc.documentElement.firstChild)
            }
        }
    }
}


/** JRAW's obsolete SPDY default is stripped by Boost's bundled OkHttp, disabling HTTP/2. */
private fun app.morphe.patcher.patch.BytecodePatchContext.enableModernRedditTransport() {
    val owner="Lnet/dean/jraw/http/OkHttpAdapter;"
    val init=Fingerprint(definingClass=owner,name="<clinit>",returnType="V",parameters=emptyList(),isStatic=true).method
    val instructions=init.implementation!!.instructions
    val position=instructions.withIndex().single { (_,instruction)->
        val field=(instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
        instruction.opcode==Opcode.SGET_OBJECT && field?.definingClass=="Lokhttp3/Protocol;" && field.name in setOf("SPDY_3","HTTP_2")
    }.index
    val register=(instructions[position] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    val output=(instructions[position+1] as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
    check(instructions[position+1].opcode==Opcode.SPUT_OBJECT && output?.definingClass==owner && output.name=="DEFAULT_PROTOCOL")
    init.replaceInstruction(position,"sget-object v$register, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;")
    val constructor=Fingerprint(definingClass=owner,name="<init>",returnType="V",isStatic=false,
        parameters=listOf("Lokhttp3/OkHttpClient;","Lokhttp3/Protocol;")).method
    val body=constructor.implementation!!.instructions
    val index=body.withIndex().single { (_,instruction)->instruction.methodReference()?.let {
        it.definingClass=="Lokhttp3/OkHttpClient\$Builder;" && it.name=="protocols" && it.parameterTypes.map { p->p.toString() }==listOf("Ljava/util/List;")
    }==true }.index
    if(body.take(index).any { it.methodReference()?.let { ref->ref.definingClass=="Ljava/util/Collections;" && ref.name=="reverse" }==true })return
    val call=body[index] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
    val p0=constructor.implementation!!.registerCount-3
    check(call.registerCount==2 && call.registerC==p0+2 && call.registerD==p0+1 && body[index-1].opcode==Opcode.MOVE_RESULT_OBJECT &&
        (body[index-1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA==p0+2) { "Reddit transport builder/list registers changed" }
    // p1 is the local ArrayList (fallback first), p2 the live Builder. Reverse only
    // this local list so ALPN prefers the requested protocol; keep native fallback.
    constructor.addInstruction(index,"invoke-static/range {p1 .. p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V")
}

/** Every task start goes through one decision, so content loaders can leave the serial queue. */
private fun app.morphe.patcher.patch.BytecodePatchContext.removeRequestQueue() {
    val tweaks="Lapp/morphe/extension/boost/NetworkTweaks;"
    val rate=Fingerprint(definingClass="Lnet/dean/jraw/http/RestClient;",name="setRatelimit",returnType="V",parameters=listOf("I"),isStatic=false).method
    rate.addInstruction(0,"move-result p1")
    rate.addInstruction(0,"invoke-static {p1}, $tweaks->rate(I)I")
    val adjust=Fingerprint(definingClass="Lnet/dean/jraw/RedditClient;",name="adjustRatelimit",returnType="V",parameters=listOf("Lnet/dean/jraw/http/RestResponse;"),isStatic=false).method
    adjust.addInstructionsWithLabels(0,"""
        invoke-virtual {p1}, Lnet/dean/jraw/http/RestResponse;->getHeaders()Lokhttp3/Headers;
        move-result-object v0
        const-string v1, "X-Ratelimit-Remaining"
        invoke-virtual {v0, v1}, Lokhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        invoke-static {v0}, $tweaks->remaining(Ljava/lang/String;)V
    """.trimIndent())
}
private fun app.morphe.patcher.patch.BytecodePatchContext.reuseSavedLogin() {
    val tweaks="Lapp/morphe/extension/boost/NetworkTweaks;"
    val client="Lnet/dean/jraw/RedditClient;"
    fun reads(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction) =
        instruction.methodReference()?.let { it.definingClass==client && it.name=="me" && it.parameterTypes.isEmpty() }==true
    val authenticate=Fingerprint(definingClass=client,name="authenticate",returnType="V",parameters=listOf("Lnet/dean/jraw/http/oauth/OAuthData;"),isStatic=false).method
    val fetch=authenticate.implementation!!.instructions.withIndex().single { reads(it.value) }.index
    val permitted=authenticate.implementation!!.instructions.withIndex().single { it.value.methodReference()?.let { ref->ref.definingClass==client && ref.name=="isAuthorizedFor" }==true }.index
    check(authenticate.implementation!!.instructions[permitted+1].opcode==Opcode.MOVE_RESULT)
    val answer=(authenticate.implementation!!.instructions[permitted+1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    val fetched=authenticate.implementation!!.instructions[fetch+1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
    check(authenticate.implementation!!.instructions[fetch+1].opcode==Opcode.MOVE_RESULT_OBJECT)
    authenticate.addInstruction(fetch+2,"invoke-static {v${fetched.registerA}}, $tweaks->keepAccount(Ljava/lang/Object;)V")
    authenticate.addInstruction(permitted+2,"move-result v$answer")
    authenticate.addInstruction(permitted+2,"invoke-static {v$answer}, $tweaks->accountCheck(Z)Z")
    authenticate.addInstruction(0,"invoke-static {}, $tweaks->clearAccount()V")
    val login=Fingerprint(definingClass="Lpd2;",name="M",returnType="V",parameters=emptyList(),isStatic=false).method
    val body=login.implementation!!.instructions.toList()
    val read=body.withIndex().single { reads(it.value) }.index
    check(body[read+1].opcode==Opcode.MOVE_RESULT_OBJECT)
    val account=(body[read+1] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    login.addInstructionsWithLabels(read,"""
        invoke-static {}, $tweaks->takeAccount()Ljava/lang/Object;
        move-result-object v$account
        check-cast v$account, Lnet/dean/jraw/models/LoggedInAccount;
        if-nez v$account, :boost_account_ready
    """.trimIndent(),ExternalLabel("boost_account_ready",body[read+2]))
}
/** A feed's first page can ask for fewer posts. NetworkTweaks.pageLimit decides. */
private fun app.morphe.patcher.patch.BytecodePatchContext.smallerFirstPage() {
    val owner="Lnet/dean/jraw/paginators/Paginator;"
    val next=Fingerprint(definingClass=owner,name="next",returnType="Lnet/dean/jraw/models/Listing;",parameters=listOf("Z"),isStatic=false).method
    val body=next.implementation!!.instructions.toList()
    val read=body.withIndex().single { (_,instruction)->
        val field=(instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
        instruction.opcode==Opcode.IGET && field?.definingClass==owner && field.name=="limit"
    }.index
    val limit=(body[read] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    val scratch=(body[read+3] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
    check(body[read+3].opcode==Opcode.CONST_STRING && scratch!=limit) { "Paginator limit code changed" }
    next.addInstruction(read+1,"move-result v$limit")
    next.addInstruction(read+1,"invoke-static {v$limit, v$scratch}, Lapp/morphe/extension/boost/NetworkTweaks;->pageLimit(IZ)I")
    next.addInstruction(read+1,"iget-boolean v$scratch, p0, $owner->started:Z")
}
private fun app.morphe.patcher.patch.BytecodePatchContext.parallelContentLoaders() {
    fun start(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction) = instruction.methodReference()?.let { ref ->
        ref.name=="execute" && ref.returnType=="Landroid/os/AsyncTask;" && ref.parameterTypes.map { it.toString() }==listOf("[Ljava/lang/Object;") }==true
    val callers=mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { type ->
        if(!type.type.startsWith("Lapp/morphe/") && type.methods.any { method -> method.implementation?.instructions?.any { start(it) }==true })callers+=type
    }
    check(callers.isNotEmpty()) { "No AsyncTask callers found" }
    for(type in callers)for(method in mutableClassDefBy(type).methods){
        val body=method.implementation?.instructions?.toList() ?: continue
        for((index,instruction) in body.withIndex()){
            if(!start(instruction))continue
            val registers=when(instruction) {
                is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction -> "/range {v${instruction.startRegister} .. v${instruction.startRegister+1}}"
                is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction -> " {v${instruction.registerC}, v${instruction.registerD}}"
                else -> error("Unexpected AsyncTask call encoding")
            }
            method.replaceInstruction(index,"invoke-static$registers, Lapp/morphe/extension/boost/NetworkTweaks;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)Landroid/os/AsyncTask;")
        }
    }
}

/** Toasts are created across the app, so every caller is found rather than listed. */
private fun app.morphe.patcher.patch.BytecodePatchContext.replaceToasts() {
    val notice="Lapp/morphe/extension/boost/NoticeTweaks;"
    val callers=mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { type ->
        if(!type.type.startsWith("Lapp/morphe/") && type.methods.any { method -> method.implementation?.instructions?.any {
            it.methodReference()?.definingClass=="Landroid/widget/Toast;" }==true })callers+=type
    }
    check(callers.isNotEmpty()) { "No Toast callers found" }
    for(type in callers)for(method in mutableClassDefBy(type).methods){
        val body=method.implementation?.instructions?.toList() ?: continue
        for((index,instruction) in body.withIndex()){
            val ref=instruction.methodReference() ?: continue
            if(ref.definingClass!="Landroid/widget/Toast;")continue
            val target=when {
                ref.name=="show" && ref.parameterTypes.isEmpty() -> "$notice->show(Landroid/widget/Toast;)V"
                ref.name=="makeText" && ref.parameterTypes.size==3 -> "$notice->make(${ref.parameterTypes.joinToString("")})Landroid/widget/Toast;"
                else -> continue
            }
            val registers=when(instruction) {
                is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction ->
                    "/range {v${instruction.startRegister} .. v${instruction.startRegister+instruction.registerCount-1}}"
                is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction ->
                    " {"+listOf(instruction.registerC,instruction.registerD,instruction.registerE).take(instruction.registerCount).joinToString(", ") { "v$it" }+"}"
                else -> error("Unexpected Toast call encoding")
            }
            method.replaceInstruction(index,"invoke-static$registers, $target")
        }
    }
}

@Suppress("unused")
val boostMaterialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Wallpaper-based themes, cards, side panel, empty screens, compact metadata and glass surfaces.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch, boostMaterialYouResourcesPatch, shikifySurfaceResourcesPatch)
    execute {
        val tags="Lapp/morphe/extension/boost/MaterialYouTweaks;->tagColor(Ljava/lang/String;)I"
        for(owner in listOf(COMMENT_HOLDER,"Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;"))for(method in mutableClassDefBy(owner).methods){
            val body=method.implementation?.instructions?.toList() ?: continue
            for((index,instruction) in body.withIndex()){
                val ref=instruction.methodReference() ?: continue
                if(ref.definingClass!="Landroid/graphics/Color;" || ref.name!="parseColor")continue
                val call=instruction as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                method.replaceInstruction(index,"invoke-static {v${call.registerC}}, $tags")
            }
        }
        val profile=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/ui/profile/UserContributionListFragment\$f;",name="onBindViewHolder",returnType="V",isStatic=false,parameters=listOf("Landroidx/recyclerview/widget/RecyclerView\$a0;","I")).method
        val chrome="Lapp/morphe/extension/boost/UnifiedChromeTweaks;"
        if(!profile.hasHook(chrome,"onProfileCommentBound")){
            val bind=profile.implementation!!.instructions.withIndex().single { (_,instruction)->instruction.methodReference()?.let { it.definingClass==COMMENT_HOLDER && it.name=="w" && it.returnType=="V" }==true }
            val argument=when(val call=bind.value){is com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction->call.startRegister;is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction->call.registerC;else->error("Unknown profile comment binder encoding")}
            profile.addInstruction(bind.index+1,"invoke-static/range {v$argument .. v$argument}, $chrome->onProfileCommentBound(Ljava/lang/Object;)V")
        }
        enableCommentFeature("materialYouEnabled")
        enableRowCompletion()
        enableFeedCompletion()
        enablePostMediaBinder()
        enableCommentsObserver()
        val surface="Lapp/morphe/extension/boost/SurfaceAppearanceTweaks;"
        val application=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/MyApplication;",name="onCreate",returnType="V",parameters=emptyList(),isStatic=false).method
        if(!application.hasHook(surface,"install"))application.addInstruction(0,"invoke-static/range {p0 .. p0}, $surface->install(Ljava/lang/Object;)V")
        val create=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/ui/activities/a;",name="onCreate",returnType="V",parameters=listOf("Landroid/os/Bundle;"),isStatic=false).method
        val theme=create.implementation!!.instructions.withIndex().single { (_,instruction)->instruction.methodReference()?.let { it.name=="setToolbarTheme" && it.definingClass=="Lcom/rubenmayayo/reddit/ui/activities/a;" }==true }
        if(!create.hasHook(surface,"onThemeReady"))create.addInstruction(theme.index+1,"invoke-static/range {p0 .. p0}, $surface->onThemeReady(Ljava/lang/Object;)V")
        val loadMore = Fingerprint(definingClass = LOAD_MORE_HOLDER, name = "w", returnType = "V", isStatic = false,
            parameters = listOf("Lcom/rubenmayayo/reddit/models/reddit/LoadMoreModel;")).method
        if (!loadMore.hasHook(COMMENTS_EXTENSION,"beforeCommentBind")) loadMore.addInstruction(0,
            "invoke-static/range {p0 .. p0}, $COMMENTS_EXTENSION->beforeCommentBind(Ljava/lang/Object;)V")
    }
}

@Suppress("unused")
val shikifyMaterialLoadingPatch = bytecodePatch(
    name = "Material loading animation",
    description = "Wallpaper-coloured Material 3 Expressive shapes for pull-to-refresh and indeterminate loading wheels; retain native refresh actions.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        val extension = "Lapp/morphe/extension/boost/MaterialLoadingTweaks;"
        val refresh = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;"
        val create = Fingerprint(definingClass = refresh, name = "<init>", returnType = "V", isStatic = false,
            parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;")).method
        val end = create.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
        if(!create.hasHook(extension,"onRefreshCreated")){
            create.replaceInstruction(end,"invoke-static/range {p0 .. p0}, $extension->onRefreshCreated(Ljava/lang/Object;)V")
            create.addInstruction(end + 1,"return-void")
        }
        val pull=Fingerprint(definingClass = refresh, name = "d", returnType = "V", isStatic = false,
            parameters = listOf("F")).method
        if(!pull.hasHook(extension,"onPull"))pull.addInstruction(0,
                "invoke-static/range {p0 .. p1}, $extension->onPull(Ljava/lang/Object;F)V")
        val stop=Fingerprint(definingClass = "Lrs;", name = "stop", returnType = "V", isStatic = false,
            parameters = emptyList()).method
        if(!stop.hasHook(extension,"onRefreshStopped"))stop.addInstruction(0,
                "invoke-static/range {p0 .. p0}, $extension->onRefreshStopped(Ljava/lang/Object;)V")
        for ((owner, name, hook) in listOf(Triple("Lrs;","draw","drawRefresh"),
            Triple("Lcom/pnikosis/materialishprogress/ProgressWheel;","onDraw","drawWheel"))) {
            val draw = Fingerprint(definingClass = owner,name = name,returnType = "V",isStatic = false,
                parameters = listOf("Landroid/graphics/Canvas;")).method
            if(draw.hasHook(extension,hook))continue
            check(draw.implementation!!.registerCount >= 3) { "No free entry scratch register in $owner->$name" }
            val native = draw.implementation!!.instructions.first()
            // v0 is an uninitialised local at entry and the untouched native entry
            // overwrites it. Neither p0 nor the Canvas argument is changed.
            draw.addInstructionsWithLabels(0,"""
                invoke-static/range {p0 .. p1}, $extension->$hook(Ljava/lang/Object;Landroid/graphics/Canvas;)Z
                move-result v0
                if-eqz v0, :native_draw
                return-void
            """.trimIndent(),ExternalLabel("native_draw",native))
        }
    }
}

@Suppress("unused")
val shikifyHomeAvatarPatch = bytecodePatch(
    name = "Home account avatar",
    description = "Show the account avatar beside Home and in the bottom pill, with subreddit icons beside community titles; retain sorting and navigation.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute {
        val title = Fingerprint(definingClass = "Lcom/rubenmayayo/reddit/ui/submissions/subreddit/MainActivity\$d;",
            name = "getView",returnType = "Landroid/view/View;",isStatic = false,
            parameters = listOf("I","Landroid/view/View;","Landroid/view/ViewGroup;")).method
        val application=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/MyApplication;",name="onCreate",returnType="V",parameters=emptyList(),isStatic=false).method
        if(!application.hasHook("Lapp/morphe/extension/boost/HomeAvatarTweaks;","install"))application.addInstruction(0,"invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/HomeAvatarTweaks;->install(Ljava/lang/Object;)V")
        if(title.hasHook("Lapp/morphe/extension/boost/HomeAvatarTweaks;","onTitleBind"))return@execute
        val instructions=title.implementation!!.instructions
        val index=instructions.withIndex().single { (_,instruction) -> instruction.methodReference()?.let {
            it.definingClass=="Lkk3;" && it.name=="b0" && it.parameterTypes.map { p -> p.toString() }==
                listOf("Landroid/content/Context;","Lcom/rubenmayayo/reddit/models/reddit/SubscriptionViewModel;")
        }==true }.index
        val cast=instructions[index-1] as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
        check(instructions[index-1].opcode==Opcode.CHECK_CAST && cast?.registerA==title.implementation!!.registerCount-3) {
            "Home title no longer has subscription in p1 immediately before formatting"
        }
        // At this exact point p1 is the selected SubscriptionViewModel and p2 is
        // the selected spinner row. p0 has already been reused for the Activity.
        title.addInstruction(index,"invoke-static/range {p1 .. p2}, Lapp/morphe/extension/boost/HomeAvatarTweaks;->onTitleBind(Ljava/lang/Object;Ljava/lang/Object;)V")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.enableFeature(name: String) {
    Fingerprint(definingClass = "Lapp/morphe/extension/boost/Features;", name = name, returnType = "Z",
        parameters = emptyList(), isStatic = true).method.replaceInstruction(0, "const/4 v0, 0x1")
}

/** Loading settings are read once at launch, because some are needed before any screen exists. */
private val shikifyNetworkSettingsPatch = bytecodePatch {
    dependsOn(boostChromeExtensionPatch)
    execute {
        val application=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/MyApplication;",name="onCreate",returnType="V",parameters=emptyList(),isStatic=false).method
        if(!application.hasHook("Lapp/morphe/extension/boost/NetworkTweaks;","init"))application.addInstruction(0,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/NetworkTweaks;->init(Landroid/content/Context;)V")
    }
}

/** Parallel loaders can reach an expired token together; only one should refresh it. */
private val shikifyTokenLockPatch = bytecodePatch {
    dependsOn(shikifyNetworkSettingsPatch)
    execute {
        // Dex has no runtime synchronized flag for ordinary methods, so the lock lives in the extension.
        val token=Fingerprint(definingClass="Lpd2;",name="b",returnType="V",parameters=emptyList(),isStatic=false).method
        token.addInstructionsWithLabels(0,"""
            invoke-static {p0}, Lapp/morphe/extension/boost/NetworkTweaks;->token(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :boost_token_check
            return-void
        """.trimIndent(),ExternalLabel("boost_token_check",token.implementation!!.instructions.first()))
    }
}

@Suppress("unused")
val shikifyHttp2Patch = bytecodePatch(
    name = "HTTP/2 Reddit connection",
    description = "Connect to Reddit over HTTP/2, with HTTP/1.1 as a fallback.",
) {
    compatibleWith(boostCompatibility)
    execute { enableModernRedditTransport() }
}

@Suppress("unused")
val shikifyParallelLoadingPatch = bytecodePatch(
    name = "Parallel content loading",
    description = "Load feeds, comments and posts in parallel instead of one background task at a time.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifyTokenLockPatch)
    execute { parallelContentLoaders();enableFeature("parallelLoading") }
}

@Suppress("unused")
val shikifyRequestQueuePatch = bytecodePatch(
    name = "Remove startup request queue",
    description = "Stop spacing Reddit requests a second apart, and pace them again when Reddit reports a low budget.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifyNetworkSettingsPatch)
    execute { removeRequestQueue();enableFeature("requestQueue") }
}

@Suppress("unused")
val shikifyInstantLoginPatch = bytecodePatch(
    name = "Instant saved login",
    description = "Use a saved login that is still valid straight away, and renew it in the background.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifyTokenLockPatch)
    execute { reuseSavedLogin();enableFeature("instantLogin") }
}

@Suppress("unused")
val shikifyFirstPagePatch = bytecodePatch(
    name = "Smaller first page",
    description = "Ask for 25 posts on the first page of a feed. Later pages keep their size.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifyNetworkSettingsPatch)
    execute { smallerFirstPage();enableFeature("firstPage") }
}

@Suppress("unused")
val shikifyOnlineCheckPatch = bytecodePatch(
    name = "Improved online check",
    description = "Let requests run when Android reports a restricted app's network as blocked.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(shikifyNetworkSettingsPatch)
    execute {
        val online=Fingerprint(definingClass="Lkk3;",name="D",returnType="Z",isStatic=true,parameters=listOf("Landroid/content/Context;")).method
        online.addInstruction(0,"return p0")
        online.addInstruction(0,"move-result p0")
        online.addInstruction(0,"invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/NetworkTweaks;->online(Landroid/content/Context;)Z")
        enableFeature("onlineCheck")
    }
}

@Suppress("unused")
val shikifyNoticesPatch = bytecodePatch(
    name = "Material notices",
    description = "Show Boost's toasts as Material 3 notices above the bottom bar.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostChromeExtensionPatch)
    execute { replaceToasts();enableFeature("notices") }
}

@Suppress("unused")
val shikifyDialogsPatch = bytecodePatch(
    name = "Material dialogs",
    description = "Float option menus above the bottom edge like the bottom bar.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostMaterialYouPatch)
    execute {
        val dialog=Fingerprint(definingClass="Ldp1;",name="show",returnType="V",parameters=emptyList(),isStatic=false).method
        if(!dialog.hasHook("Lapp/morphe/extension/boost/DialogTweaks;","onShow"))dialog.addInstruction(0,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/boost/DialogTweaks;->onShow(Ljava/lang/Object;)V")
        enableFeature("dialogs")
    }
}

@Suppress("unused")
val shikifyFlairsPatch = bytecodePatch(
    name = "Inline flairs",
    description = "Move post flairs in line with the post details, and keep flair text readable.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostMaterialYouPatch)
    execute {
        val flair=Fingerprint(definingClass="Lcom/rubenmayayo/reddit/models/reddit/RichFlairView;",name="c",returnType="V",isStatic=false,
            parameters=listOf("Lcom/rubenmayayo/reddit/models/reddit/FlairModel;","Z")).method
        if(!flair.hasHook("Lapp/morphe/extension/boost/MaterialYouTweaks;","flairText")){
            val body=flair.implementation!!.instructions.toList()
            val fill=body.indexOfLast { it.methodReference()?.let { ref->ref.definingClass=="Landroid/graphics/drawable/GradientDrawable;" && ref.name=="setColor" }==true }
            val text=body.indexOfLast { it.methodReference()?.let { ref->ref.definingClass=="Lcom/rubenmayayo/reddit/models/reddit/RichFlairView;" && ref.name=="setTextColor" }==true }
            check(fill>=0 && text>fill) { "Unrecognized flair colour binding" }
            val background=(body[fill] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
            val foreground=(body[text] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
            flair.addInstruction(text,"move-result v$foreground")
            flair.addInstruction(text,"invoke-static {p0, v$foreground, v$background}, Lapp/morphe/extension/boost/MaterialYouTweaks;->flairText(Ljava/lang/Object;II)I")
        }
        enableFeature("flairs")
    }
}

private val shikifySearchResourcesPatch = resourcePatch {
    execute {
        val android="http://schemas.android.com/apk/res/android"
        // Search: section labels and flat rows instead of a stack of filled cards.
        document("res/layout/item_search_header.xml").use { doc ->
            doc.documentElement.removeAttributeNS(android,"background")
            doc.documentElement.setAttributeNS(android,"android:layout_height","48dp")
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                if(view.getAttributeNS(android,"id")=="@id/item_search_text")view.setAttributeNS(android,"android:textColor","?attr/colorPrimary")}
        }
        for(path in listOf("res/layout/item_search_option.xml","res/layout/item_search_option_subreddit.xml"))document(path).use { doc ->
            doc.documentElement.setAttributeNS(android,"android:layout_height","56dp")
        }
        document("res/layout/item_subreddit_subscribe.xml").use { doc ->
            doc.documentElement.removeAttributeNS(android,"background")
            val views=doc.getElementsByTagName("*")
            for(i in 0 until views.length){val view=views.item(i) as org.w3c.dom.Element
                if(view.getAttributeNS(android,"id")=="@id/item_subreddit_description"){
                    view.setAttributeNS(android,"android:maxLines","2");view.setAttributeNS(android,"android:ellipsize","end")
                    view.setAttributeNS(android,"android:textColor","?attr/colorOnSurfaceVariant")}}
        }
    }
}

@Suppress("unused")
val shikifySearchPatch = bytecodePatch(
    name = "Material search",
    description = "Fill the empty search page with your feeds and subscriptions in collapsible Material 3 sections.",
) {
    compatibleWith(boostCompatibility)
    dependsOn(boostMaterialYouPatch, shikifySearchResourcesPatch)
    execute {
        val searchPage="Lcom/rubenmayayo/reddit/ui/search/SearchGenericActivity;"
        val searchTweaks="Lapp/morphe/extension/boost/SearchTweaks;"
        val searchList=Fingerprint(definingClass=searchPage,name="s1",returnType="V",parameters=emptyList(),isStatic=false).method
        if(!searchList.hasHook(searchTweaks,"onList"))searchList.addInstruction(0,"invoke-static/range {p0 .. p0}, $searchTweaks->onList(Ljava/lang/Object;)V")
        val searchHeader=Fingerprint(definingClass=searchPage,name="e0",returnType="V",parameters=listOf("Lbn2;"),isStatic=false).method
        if(!searchHeader.hasHook(searchTweaks,"onHeader")){
            check(searchHeader.implementation!!.registerCount>=3) { "No free register in search header" }
            searchHeader.addInstructionsWithLabels(0,"""
                invoke-static/range {p0 .. p1}, $searchTweaks->onHeader(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :native_header
                return-void
            """.trimIndent(),ExternalLabel("native_header",searchHeader.implementation!!.instructions.first()))
        }
        enableFeature("search")
    }
}

@Suppress("unused")
val shikifyTransitionsPatch = resourcePatch(
    name = "Sliding screen transitions",
    description = "New screens slide over the one below, which drifts back slightly.",
) {
    compatibleWith(boostCompatibility)
    execute {
        fun motion(name:String,body:String){get("res/anim/$name.xml").apply {parentFile.mkdirs();writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n$body\n")}}
        val ns="xmlns:android=\"http://schemas.android.com/apk/res/android\""
        get("res/interpolator/shikify_slide.xml").apply {
            parentFile.mkdirs()
            writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<pathInterpolator $ns android:controlX1=\"0.35\" android:controlY1=\"0\" android:controlX2=\"0.1\" android:controlY2=\"1\" />\n")
        }
        val slide="android:interpolator=\"@interpolator/shikify_slide\" android:shareInterpolator=\"true\""
        // A new screen visibly slides over the one below, which drifts back slightly.
        motion("shikify_open_enter","<set $ns $slide android:zAdjustment=\"top\"><translate android:duration=\"450\" android:fromXDelta=\"100%p\" android:toXDelta=\"0\" /></set>")
        motion("shikify_open_exit","<set $ns $slide><translate android:duration=\"450\" android:fromXDelta=\"0\" android:toXDelta=\"-12%p\" /></set>")
        motion("shikify_close_enter","<set $ns $slide><translate android:duration=\"320\" android:fromXDelta=\"-12%p\" android:toXDelta=\"0\" /></set>")
        motion("shikify_close_exit","<set $ns $slide android:zAdjustment=\"top\"><translate android:duration=\"320\" android:fromXDelta=\"0\" android:toXDelta=\"100%p\" /></set>")
        fun org.w3c.dom.Element.put(doc: org.w3c.dom.Document, name: String, value: String) {
            val item = (0 until childNodes.length).map { childNodes.item(it) }
                .filterIsInstance<org.w3c.dom.Element>().firstOrNull { it.tagName == "item" && it.getAttribute("name") == name }
                ?: doc.createElement("item").also { appendChild(it) }
            item.setAttribute("name", name); item.textContent = value
        }
        val names = listOf("MaterialDarkTheme", "MaterialDarkTheme.Amoled", "MaterialDarkTheme.Dynamic", "MaterialLightTheme", "MaterialLightTheme.Dynamic")
        document("res/values/styles.xml").use { styles ->
            val all = (0 until styles.getElementsByTagName("style").length).map {
                styles.getElementsByTagName("style").item(it) as org.w3c.dom.Element
            }
            all.filter { it.getAttribute("name") == "Shikify.Animation.Activity" }.forEach { it.parentNode.removeChild(it) }
            styles.createElement("style").apply {
                setAttribute("name", "Shikify.Animation.Activity");setAttribute("parent", "@android:style/Animation.Activity")
                for ((key, value) in listOf("OpenEnter" to "shikify_open_enter", "OpenExit" to "shikify_open_exit", "CloseEnter" to "shikify_close_enter", "CloseExit" to "shikify_close_exit"))
                    put(styles, "android:activity${key}Animation", "@anim/$value")
                styles.documentElement.appendChild(this)
            }
            for (style in all.filter { it.getAttribute("name") in names }) style.put(styles, "android:windowAnimationStyle", "@style/Shikify.Animation.Activity")
        }
    }
}
