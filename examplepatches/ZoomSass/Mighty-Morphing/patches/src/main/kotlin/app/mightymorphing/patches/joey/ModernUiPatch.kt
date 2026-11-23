package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.filterBoolean
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.indexOfString
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.nextReference
import app.mightymorphing.patches.shared.returnVoid
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"
private const val MODERN_UI = "Lapp/mightymorphing/extension/joey/ModernUi;"
private const val POSTS = "Lapp/mightymorphing/extension/joey/PostLayout;"
private const val MOTION = "Lapp/mightymorphing/extension/joey/PostMotion;"
private const val SIDEBAR = "Lapp/mightymorphing/extension/joey/Sidebar;"
private const val FONTS = "Lapp/mightymorphing/extension/joey/ModernFonts;"
private const val THEME = "Lapp/mightymorphing/extension/joey/ModernTheme;"
private const val VIDEO = "Lapp/mightymorphing/extension/joey/ModernVideo;"
private const val ICONS = "Lapp/mightymorphing/extension/joey/ModernIcons;"
private const val LAYOUT_COPY = "Lapp/mightymorphing/extension/joey/ModernSettings;"

private const val ANIM_HEAD = """<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android" android:shareInterpolator="true""""

/** Short window animations used in place of Joey's full-width slide while Modern UI is on. */
private val modernMotionResources = resourcePatch {
    compatibleWith(JOEY)

    execute {
        // Icon packs: about twenty vector icons per pack, chosen at runtime by ModernIcons.
        val drawable = get("res").resolve("drawable")
        drawable.mkdirs()
        // A class from this bundle, not the patcher's context, so the lookup searches our jar.
        val loader = Class.forName("app.mightymorphing.patches.joey.ModernUiPatchKt").classLoader
            ?: throw PatchException("Icon pack files cannot be read")
        val index = loader.getResourceAsStream("icons/index.txt")?.bufferedReader()?.readLines()
            ?: throw PatchException("Icon pack index is missing")
        for (name in index.map { it.trim() }.filter { it.isNotEmpty() }) {
            val stream = loader.getResourceAsStream("icons/$name") ?: throw PatchException("Missing icon $name")
            stream.use { input -> drawable.resolve(name).outputStream().use { input.copyTo(it) } }
        }

        val anim = get("res").resolve("anim")
        anim.mkdirs()
        mapOf(
            "morphe_post_open" to """$ANIM_HEAD
    android:interpolator="@android:interpolator/fast_out_slow_in" android:duration="220">
    <translate android:fromXDelta="12%" android:toXDelta="0" />
    <alpha android:fromAlpha="0" android:toAlpha="1" android:duration="160" />
</set>
""",
            "morphe_post_close" to """$ANIM_HEAD
    android:interpolator="@android:interpolator/fast_out_linear_in" android:duration="170">
    <translate android:fromXDelta="0" android:toXDelta="12%" />
    <alpha android:fromAlpha="1" android:toAlpha="0" />
</set>
""",
            // No scale here: the viewer plays GIFs and video on a SurfaceView, which a
            // window scale does not carry, so the player box would grow out of the centre.
            "morphe_media_open" to """$ANIM_HEAD
    android:interpolator="@android:interpolator/linear_out_slow_in" android:duration="180">
    <translate android:fromYDelta="3%" android:toYDelta="0" />
    <alpha android:fromAlpha="0" android:toAlpha="1" android:duration="140" />
</set>
""",
            "morphe_media_close" to """$ANIM_HEAD
    android:interpolator="@android:interpolator/fast_out_linear_in" android:duration="140">
    <translate android:fromYDelta="0" android:toYDelta="3%" />
    <alpha android:fromAlpha="1" android:toAlpha="0" />
</set>
""",
        ).forEach { (name, xml) -> anim.resolve("$name.xml").writeText(xml) }
    }
}

@Suppress("unused")
val modernUiPatch = bytecodePatch(
    name = "Modern UI",
    description = "A cleaner layout for Joey, on by default. Choose from 12 new themes and Joey's originals, or make your own in the Theme Manager and share it as a file. Posts show as cards or a compact list, with adjustable post buttons, info line and image style. Also adds icon packs, fonts, editors for the text formatting and subreddit bars, and downloads, full screen media and an album viewer. Joey's own themes are off while it's on, and Classic Joey can be switched back on any time. Settings in Joey Settings - Morphe Settings.",
    default = true,
) {
    compatibleWith(JOEY)

    dependsOn(problemReportPatch, modernMotionResources, mediaHooksPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // 1. Settings integration & hide legacy theme row
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableModernUi()V
            invoke-static {p0}, $SETTINGS->attach(Landroid/app/Activity;)V
            """,
        )

        // 2. Joey reads colors from ec.j for toolbars, windows, cards and drawers.
        //    The XML token path is only a fraction of the screen.
        for ((name, slot) in listOf(
            "h" to "primary",
            "k" to "card",
            "b" to "canvas",
            "a" to "accent",
            "n" to "toolbar",
            "g" to "unread",
            "i" to "read",
            "e" to "text",
            "m" to "tint",
            "d" to "link",
            "j" to "sticky",
            "c" to "highlight",
        )) {
            val getter = Fingerprint(
                definingClass = "Lec/j;",
                name = name,
                returnType = "Ljava/lang/Integer;",
                parameters = listOf(),
            ).method
            getter.insertAt(
                0,
                """
                const-string v0, "$slot"
                invoke-static {v0}, $MODERN_UI->themeColor(Ljava/lang/String;)Ljava/lang/Integer;
                move-result-object v0
                if-eqz v0, :theme_${name}_own
                return-object v0
                """,
                ExternalLabel("theme_${name}_own", getter.instructions[0]),
            )
        }

        // XML token colors still go through ec.e.l, which now calls the hooked getters.
        val themeMethod = ThemeColorFingerprint.method
        themeMethod.insertAt(
            0,
            """
            invoke-static {p0, p1}, $MODERN_UI->getThemeColorOverride(ILandroid/view/View;)Ljava/lang/Integer;
            move-result-object v0
            if-eqz v0, :theme_skip
            return-object v0
            """,
            ExternalLabel("theme_skip", themeMethod.instructions[0]),
        )

        // Icon packs. Layout icons load through AppCompat, Joey's own code through zd.x0.e.
        // Both ask ModernIcons for the drawable to use first.
        Fingerprint(
            definingClass = "Lf/a;",
            name = "b",
            returnType = "Landroid/graphics/drawable/Drawable;",
            parameters = listOf("Landroid/content/Context;", "I"),
        ).method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $ICONS->swap(Landroid/content/Context;I)I
            move-result p1
            """,
        )
        Fingerprint(
            definingClass = "Lzd/x0;",
            name = "e",
            returnType = "Landroid/graphics/drawable/Drawable;",
            parameters = listOf("Landroid/content/Context;", "I"),
        ).method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $ICONS->swap(Landroid/content/Context;I)I
            move-result p1
            """,
        )

        // Theme vote colours. Joey reads its upvote and downvote colour resources through two
        // helpers and a few direct Resources.getColor calls in its text builders. Each now asks
        // ModernTheme first, which answers only for those two colours while Modern is on.
        writeBody(
            Fingerprint(
                definingClass = "Lzd/x0;",
                name = "b",
                returnType = "I",
                parameters = listOf("Landroid/content/Context;", "I"),
            ).method,
            3,
            """
            invoke-static {p0, p1}, $THEME->contextColor(Landroid/content/Context;I)I
            move-result v0
            return v0
            """,
        )
        writeBody(
            Fingerprint(
                definingClass = "Lzd/e;",
                name = "h",
                returnType = "I",
                parameters = listOf("I"),
            ).method,
            2,
            """
            invoke-static {p0}, $THEME->appColor(I)I
            move-result v0
            return v0
            """,
        )
        val textBuilders = mutableClassDefBy("Lzd/n;")
        var routed = 0
        for (method in textBuilders.methods.toList()) {
            if (method.implementation == null) continue
            for ((index, instruction) in method.instructions.withIndex().toList()) {
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL) continue
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (reference.definingClass != "Landroid/content/res/Resources;" ||
                    reference.name != "getColor" ||
                    reference.parameterTypes.size != 1
                ) continue
                val call = instruction as FiveRegisterInstruction
                method.replaceInstruction(
                    index,
                    "invoke-static {v${call.registerC}, v${call.registerD}}, $THEME->resourcesColor(Landroid/content/res/Resources;I)I",
                )
                routed++
            }
        }
        if (routed == 0) throw PatchException("Joey's comment text builder no longer reads colours")

        // Comment level colours. Every bar, "more replies" row and reply-to name gets its
        // colour from n9.j.d, which now asks the theme first. Zero keeps Joey's nine.
        val depthMethod = Fingerprint(
            definingClass = "Ln9/j;",
            name = "d",
            returnType = "I",
            parameters = listOf("Landroid/content/Context;", "I"),
        ).method
        depthMethod.insertAt(
            0,
            """
            invoke-static {p0, p1}, $THEME->depthColor(Landroid/content/Context;I)I
            move-result v0
            if-eqz v0, :theme_depth_joey
            return v0
            """,
            ExternalLabel("theme_depth_joey", depthMethod.instructions[0]),
        )
        // The bars themselves, so a theme can hide them without losing the indent.
        for ((owner, name) in listOf("Ln9/k;" to "J", "Ln9/m;" to "c")) {
            val painter = Fingerprint(
                definingClass = owner,
                name = name,
                returnType = "V",
                parameters = listOf(),
            ).method
            val read = painter.indexOfReference("Ln9/j;->d(Landroid/content/Context;I)I")
            val paint = painter.nextReference(read, "Landroid/view/View;->setBackgroundColor(I)V")
            val call = painter.instructions[paint] as FiveRegisterInstruction
            painter.replaceInstruction(
                paint,
                "invoke-static {v${call.registerC}, v${call.registerD}}, $THEME->depthBar(Landroid/view/View;I)V",
            )
        }

        // Hidden NSFW profile pictures: Joey draws a circle in its NSFW red. Use the theme's.
        val avatar = Fingerprint(
            definingClass = "Lzd/n;",
            name = "c",
            returnType = "V",
            parameters = listOf(
                "Landroid/content/Context;",
                "Landroid/text/SpannableStringBuilder;",
                "I",
                "I",
                "Ljava/lang/String;",
                "Landroid/view/View;",
                "Z",
            ),
        ).method
        val red = avatar.indexOfString("#FF575B")
        avatar.insertAt(
            red + 1,
            """
            invoke-static {p0}, $THEME->hiddenAvatar(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            """,
        )

        // Author tags (OP, MOD, YOU, FRIEND, ADMIN). Joey draws each as one outlined chip and gives
        // every type the same highlight colour. Note which tag is being built, then let the theme
        // pick the chip colour for it. Joey's colour stays when nothing is set.
        val tag = Fingerprint(
            definingClass = "Lzd/n;",
            name = "y",
            returnType = "Landroid/text/SpannableStringBuilder;",
            parameters = listOf("Lec/j;", "Lzd/n\$b;"),
        ).method
        val chip = tag.indexOfReference("Lv9/q;-><init>(IILandroid/content/Context;)V")
        tag.insertAt(
            chip,
            """
            invoke-static {p1}, $THEME->tagColor(I)I
            move-result p1
            move p0, p1
            """,
        )
        tag.insertAt(
            0,
            """
            invoke-static {p1}, $THEME->tagType(Ljava/lang/Object;)V
            """,
        )

        // Video controls: when Joey's player sets up its progress bar, hand the bar (and its buttons
        // and volume slider) to the theme. Joey sets no colours of its own here except for its thin
        // white feed line, which ModernVideo leaves alone, so running first is enough.
        val player = Fingerprint(
            definingClass = "Lab/c;",
            name = "H0",
            returnType = "V",
            parameters = listOf(),
        ).method
        player.insertAt(
            0,
            """
            iget-object v0, p0, Lab/c;->u:Lo/o/joey/CustomViews/VideoTimeBar;
            iget-boolean v1, p0, Lab/c;->C:Z
            invoke-static {v0, v1}, $VIDEO->bar(Landroid/view/View;Z)V
            """,
        )

        // Modern's own copy of Joey's layout settings. Wherever Joey opens a settings file, the
        // file goes through ModernSettings.wrap, which sends the layout keys to Modern's copy
        // while Modern is on. Files without layout keys come back unchanged.
        var wrapped = 0
        for (owner in listOf("Lza/a;", "Lmb/o;", "Lmb/b;", "Lmb/j;", "Lmb/i;")) {
            for (method in mutableClassDefBy(owner).methods.toList()) {
                if (method.implementation == null) continue
                val opens = method.instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                            it.name == "getSharedPreferences" &&
                                it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/String;", "I")
                        } == true
                }.map { it.index }
                for (index in opens.reversed()) {
                    val call = method.instructions[index] as FiveRegisterInstruction
                    val result = method.instructions[index + 1]
                    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) continue
                    val target = (result as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                    if (target > 15 || call.registerD > 15) throw PatchException("$owner settings file register out of reach")
                    method.insertAt(
                        index + 2,
                        """
                        invoke-static {v$target, v${call.registerD}}, $LAYOUT_COPY->wrap(Landroid/content/SharedPreferences;Ljava/lang/String;)Landroid/content/SharedPreferences;
                        move-result-object v$target
                        """,
                    )
                    wrapped++
                }
            }
        }
        if (wrapped < 5) throw PatchException("Only $wrapped of Joey's settings files could be wrapped")

        // Joey's "Show thumbnail on right" (za.a.d). With it off, Joey anchors the thumbnail on
        // the left and Modern's right-side anchor centred it. In Modern it always reads as on.
        var thumbSides = 0
        for (owner in listOf("Ljc/k;", "Lv8/b;")) {
            for (method in mutableClassDefBy(owner).methods.toList()) {
                if (method.implementation == null) continue
                val reads = method.instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.SGET_BOOLEAN &&
                        (instruction as? ReferenceInstruction)?.reference?.toString() == "Lza/a;->d:Z"
                }.map { it.index }
                for (index in reads.reversed()) {
                    method.filterBoolean(index, "$POSTS->joeyRightThumbnail(Z)Z")
                    thumbSides++
                }
            }
        }
        if (thumbSides == 0) throw PatchException("Joey's thumbnail side is no longer read where expected")

        // 3. Material 3 rounded corners & AMOLED card background
        val cardInit = CardViewInitFingerprint.method
        cardInit.insertAt(
            cardInit.instructions.lastIndex,
            """
            invoke-static {p0}, $MODERN_UI->applyCardStyle(Landroid/view/View;)V
            """,
        )

        // 4. Action pills for post cards & compact view
        val postFactory = PostViewFactoryFingerprint.method
        postFactory.insertAt(
            postFactory.instructions.lastIndex,
            """
            invoke-static {p0}, $MODERN_UI->enhancePostView(Landroid/view/View;)Landroid/view/View;
            move-result-object p0
            """,
        )
        postFactory.insertAt(
            0,
            """
            invoke-static {p0, p1}, $POSTS->layoutFor(Landroid/view/ViewGroup;Ljava/lang/Enum;)Ljava/lang/Enum;
            move-result-object p1
            check-cast p1, Ljc/k${'$'}c;
            """,
        )

        // Joey's slide_horiz_in / slide_horiz_out for the comment screen and photo viewer.
        for ((owner, name) in listOf(
            "Lo/o/joey/Activities/SlidingBaseActivity;" to "onCreate",
            "Lo/o/joey/Activities/SlidingBaseActivity;" to "finish",
            "Lo/o/joey/Activities/PhotoViewer;" to "onCreate",
            "Lo/o/joey/Activities/PhotoViewer;" to "finish",
        )) {
            val method = Fingerprint(
                definingClass = owner,
                name = name,
                returnType = "V",
                parameters = if (name == "onCreate") listOf("Landroid/os/Bundle;") else emptyList(),
            ).method
            val at = method.indexOfReference("overridePendingTransition")
            val call = method.instructions[at] as FiveRegisterInstruction
            val self = call.registerC
            val enter = call.registerD
            val exit = call.registerE
            method.insertAt(
                at,
                """
                invoke-static {v$self, v$enter}, $MOTION->enter(Landroid/app/Activity;I)I
                move-result v$enter
                invoke-static {v$self, v$exit}, $MOTION->exit(Landroid/app/Activity;I)I
                move-result v$exit
                """,
            )
        }

        // u(Z) is the one bind entry for feed, comment screen, profile and search.
        val bind = Fingerprint(
            definingClass = "Ljc/d;",
            name = "u",
            returnType = "V",
            parameters = listOf("Z"),
        ).method
        bind.insertAt(
            bind.instructions.lastIndex,
            """
            invoke-static {p0}, $POSTS->apply(Ljava/lang/Object;)V
            """,
        )
        bind.insertAt(
            0,
            """
            invoke-static {p0}, $POSTS->begin(Ljava/lang/Object;)V
            """,
        )

        // Marking a post seen rebuilds the info line (G) and the comment count (C) outside u(Z).
        // C returns early when Joey hides the comment count, so every return gets the call.
        // Neither method's returns are branch targets, so no path can jump past the call.
        for (rebuild in listOf("G", "C")) {
            val method = Fingerprint(
                definingClass = "Ljc/d;",
                name = rebuild,
                returnType = "V",
                parameters = emptyList(),
            ).method
            val returns = method.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            for (index in returns.reversed()) {
                method.insertAt(
                    index,
                    """
                    invoke-static {p0}, $POSTS->refresh(Ljava/lang/Object;)V
                    """,
                )
            }
        }

        // Post bar and Post details. In Modern, Joey sets up every bar item and puts every
        // piece on the info line. PostLayout then orders them, hides them, or moves bar items
        // to Joey's menu. Classic reads Joey's own switches as before. Every insert below sits
        // on an instruction no branch jumps to, so no path skips it.
        val joeyBar = "$POSTS->joeyBar(Z)Z"
        val joeyLine = "$POSTS->joeyLine(Z)Z"

        // Bar: save (R), share (T), and hide (k0, shared by the bar and the menu).
        val saveBind = Fingerprint(definingClass = "Ljc/d;", name = "R", returnType = "V", parameters = emptyList()).method
        saveBind.filterBoolean(saveBind.indexOfReference("Lza/a;->e:Z"), joeyBar)
        val shareBind = Fingerprint(definingClass = "Ljc/d;", name = "T", returnType = "V", parameters = emptyList()).method
        shareBind.filterBoolean(shareBind.indexOfReference("Lmb/o;->A0()Z") + 1, joeyBar)
        val hideAllowed = Fingerprint(definingClass = "Ljc/i;", name = "k0", returnType = "Z", parameters = listOf("Ljc/l;")).method
        hideAllowed.filterBoolean(hideAllowed.indexOfReference("Lza/a;->a0:Z"), joeyBar)

        // Joey's "compact thumbnail action bar" setting hides the link button (H) and moves the
        // comment count off the bar (C). In Modern, Post bar and Post details decide.
        val minimal = "$POSTS->joeyMinimalBar(Z)Z"
        val linkBind = Fingerprint(definingClass = "Ljc/d;", name = "H", returnType = "V", parameters = emptyList()).method
        linkBind.filterBoolean(linkBind.indexOfReference("Lmb/o;->g()Z") + 1, minimal)
        val countBind = Fingerprint(definingClass = "Ljc/d;", name = "C", returnType = "V", parameters = emptyList()).method
        countBind.filterBoolean(countBind.indexOfReference("Lud/b;->n(Ljc/l;)Z") + 1, minimal)

        // Joey's menu adds save, share and hide when they are not on the bar.
        val menuSave = Fingerprint(definingClass = "Ljc/i;", name = "F", returnType = "V", parameters = listOf("Lh9/a;", "Landroid/view/ViewGroup;")).method
        menuSave.filterBoolean(menuSave.indexOfReference("Lza/a;->e:Z"), "$POSTS->onBarSave(Z)Z")
        val menuShare = Fingerprint(definingClass = "Ljc/i;", name = "G", returnType = "V", parameters = listOf("Lh9/a;", "Landroid/view/ViewGroup;")).method
        menuShare.filterBoolean(menuShare.indexOfReference("Lmb/o;->A0()Z") + 1, "$POSTS->onBarShare(Z)Z")
        val menuHide = Fingerprint(definingClass = "Ljc/i;", name = "l0", returnType = "Z", parameters = emptyList()).method
        menuHide.filterBoolean(menuHide.indexOfReference("Ljc/i;->k0(") + 1, "$POSTS->onBarHide(Z)Z")

        // The menu is built (q): each item comes from its own jc.i method, called as
        // invoke-direct {p0, p1, v2}, jc.i->X(Lh9/a;Landroid/view/ViewGroup;)V with v2 the row.
        // Each call is wrapped so the cells it adds are tagged with that method's name. v3 only
        // holds the column count for the row lookup just before, so it is free here.
        val menu = Fingerprint(definingClass = "Ljc/i;", name = "q", returnType = "Landroid/view/View;", parameters = listOf("Lh9/a;")).method
        val builders = menu.instructions.withIndex().filter { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT) return@filter false
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@filter false
            reference.definingClass == "Ljc/i;" &&
                reference.parameterTypes.map { it.toString() } == listOf("Lh9/a;", "Landroid/view/ViewGroup;")
        }.map { it.index }
        if (builders.size < 15) throw PatchException("jc/i->q has ${builders.size} menu items, expected 21")
        for (index in builders.reversed()) {
            val call = menu.instructions[index] as FiveRegisterInstruction
            val row = call.registerE
            if (row > 15) throw PatchException("jc/i->q row register v$row is out of reach")
            val name = ((call as ReferenceInstruction).reference as MethodReference).name
            menu.insertAt(
                index + 1,
                """
                invoke-static {v$row}, $POSTS->menuAfter(Ljava/lang/Object;)V
                """,
            )
            menu.insertAt(
                index,
                """
                const-string v3, "$name"
                invoke-static {v$row, v3}, $POSTS->menuBefore(Ljava/lang/Object;Ljava/lang/String;)V
                """,
            )
        }

        // Joey's column switch (B0, true is one column) for the row size (W) and the final
        // packing (f0). In Modern the Post actions setting decides once it is set.
        val oneColumn = "$POSTS->joeyOneColumn(Z)Z"
        for (name in listOf("W", "f0")) {
            val method = Fingerprint(
                definingClass = "Ljc/i;",
                name = name,
                returnType = if (name == "W") "I" else "V",
                parameters = if (name == "W") emptyList() else listOf("Landroid/widget/TableLayout;"),
            ).method
            method.filterBoolean(method.indexOfReference("Lmb/o;->B0()Z") + 1, oneColumn)
        }

        // Before Joey packs the last row (f0), add the bar items moved to Menu and lay every
        // item out in the Post actions order. f0 takes the menu's table.
        val pad = menu.indexOfReference("Ljc/i;->f0(Landroid/widget/TableLayout;)")
        val table = (menu.instructions[pad] as FiveRegisterInstruction).registerD
        if (table > 15) throw PatchException("jc/i->q table register v$table is out of reach")
        menu.insertAt(
            pad,
            """
            invoke-static {p0, p1, v$table}, $POSTS->sheet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        // The post on the comments screen follows Joey's own "Same as above" (offered in Image style).

        // The author's flair on the info line (zd.n.P reads SHOW_POST_AUTHOR_FLAIR). The post
        // flair chip above the line (zd.n.Q) stays on Joey's own Show flair switch.
        val flair = Fingerprint(
            definingClass = "Lzd/n;",
            name = "P",
            returnType = "Landroid/text/SpannableStringBuilder;",
            parameters = listOf("Lnet/dean/jraw/models/Submission;", "I", "I"),
        ).method
        flair.filterBoolean(flair.indexOfReference("Lmb/o;->D0()Z") + 1, joeyLine)

        // SubmissionInfoProvider.f builds the info line in v1 and adds it to v0, after the tags.
        // Each piece is marked where it starts, separator included. The marks are placed
        // bottom to top so each index is found in the method as it stands.
        val info = Fingerprint(
            definingClass = "Lud/a;",
            name = "f",
            returnType = "Landroid/text/SpannableStringBuilder;",
            parameters = listOf("Lnet/dean/jraw/models/Submission;", "Ljc/l;", "Z", "Landroid/view/View;"),
        ).method
        fun markAt(index: Int, piece: String) = info.insertAt(
            index,
            """
            invoke-static {v1}, $POSTS->mark$piece(Landroid/text/SpannableStringBuilder;)V
            """,
        )
        val separator = "Lud/b;->b(Landroid/text/SpannableStringBuilder;)"
        info.insertAt(
            info.indexOfReference("Lud/a;->e(Lnet/dean/jraw/models/Submission;Landroid/view/View;)"),
            """
            invoke-static {v0, v1, p0}, $POSTS->details(Landroid/text/SpannableStringBuilder;Landroid/text/SpannableStringBuilder;Ljava/lang/Object;)V
            """,
        )
        markAt(info.nextReference(info.indexOfReference("Lzd/n;->o("), separator), "Other")
        markAt(
            info.nextReference(info.indexOfReference("Lnet/dean/jraw/models/Submission;->R()"), "Lzd/n;->C("),
            "Domain",
        )
        info.filterBoolean(info.indexOfReference("Lza/a;->g:Z"), joeyLine)
        markAt(info.nextReference(info.indexOfReference("Lnet/dean/jraw/models/Submission;->f0()"), separator), "Percent")
        val type = info.indexOfReference("Lud/a;->d(Lnet/dean/jraw/models/Submission;)") - 1
        if (info.instructions[type].opcode != Opcode.NEW_INSTANCE) {
            throw PatchException("ud/a->f post type is not where it was")
        }
        markAt(type, "Type")
        markAt(info.nextReference(info.indexOfString("view_count"), separator), "Views")
        markAt(
            info.nextReference(info.indexOfReference("Lzd/n;->P("), "Landroid/text/SpannableStringBuilder;->append("),
            "Flair",
        )
        markAt(info.nextReference(info.indexOfReference("Lzd/n;->t("), separator), "Author")
        info.filterBoolean(info.indexOfReference("Lza/a;->f:Z"), joeyLine)
        markAt(info.nextReference(info.indexOfReference("Lzd/n;->W("), separator), "Time")
        val commentCount = info.indexOfReference("Lud/b;->n(Ljc/l;)")
        markAt(info.nextReference(commentCount, separator), "Comments")
        info.filterBoolean(commentCount + 1, "$POSTS->joeyComments(Z)Z")
        markAt(info.indexOfReference("Lud/b;->c(Ljc/l;)"), "Subreddit")

        val postStyle = Fingerprint(
            definingClass = "Lo/o/joey/SettingActivities/PostStyleSettings;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        postStyle.insertAt(
            postStyle.instructions.lastIndex,
            """
            invoke-static {p0}, $POSTS->trimPostStyle(Landroid/app/Activity;)V
            """,
        )

        val layoutPicker = Fingerprint(
            definingClass = "Lo/o/joey/SettingActivities/PostStyleSettings;",
            name = "O3",
            returnType = "V",
            parameters = listOf("Lo/o/joey/Activities/BaseActivity;"),
        ).method
        layoutPicker.insertAt(
            0,
            """
            invoke-static {p0}, $POSTS->offerLayout(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :post_layout_joey
            return-void
            """,
            ExternalLabel("post_layout_joey", layoutPicker.instructions[0]),
        )

        val imageHome = Fingerprint(
            definingClass = "Lo/o/joey/Activities/HomeActivity;",
            name = "g4",
            returnType = "V",
            parameters = emptyList(),
        ).method
        imageHome.insertAt(
            0,
            """
            invoke-static {p0}, $POSTS->offerImage(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :image_style_joey
            return-void
            """,
            ExternalLabel("image_style_joey", imageHome.instructions[0]),
        )

        val imageSettings = Fingerprint(
            definingClass = "Lo/o/joey/SettingActivities/PostStyleSettings;",
            name = "N3",
            returnType = "V",
            parameters = emptyList(),
        ).method
        imageSettings.insertAt(
            0,
            """
            invoke-static {p0}, $POSTS->offerImage(Landroid/app/Activity;)Z
            move-result v0
            if-eqz v0, :image_settings_joey
            return-void
            """,
            ExternalLabel("image_settings_joey", imageSettings.instructions[0]),
        )

        // Modern has Full image and Thumbnail only. After Joey loads its image style, a saved
        // 16:9 is swapped for Full image in memory (the saved value is left alone).
        val loadSettings = Fingerprint(
            definingClass = "Lza/a;",
            name = "q",
            returnType = "V",
            parameters = emptyList(),
        ).method
        loadSettings.insertAt(
            loadSettings.instructions.lastIndex,
            """
            invoke-static {}, $POSTS->liftWide()V
            """,
        )

        // 5. Fonts. Modern keeps its own copy of Joey's font settings (ModernFonts).

        // Joey's fixed fonts by number (labels, tags, flair). Font 5 is the icon font.
        val fontMethod = TypefaceFingerprint.method
        fontMethod.insertAt(
            0,
            """
            invoke-static {p0}, $FONTS->fixed(I)Landroid/graphics/Typeface;
            move-result-object v0
            if-eqz v0, :font_skip
            return-object v0
            """,
            ExternalLabel("font_skip", fontMethod.instructions[0]),
        )

        // FontGuy.x(): every font and size read goes through it. Points it at the file for
        // the current mode. x() ends with return-object v0, the FontGuy.
        val fontGuy = Fingerprint(
            definingClass = "Lya/c;",
            name = "x",
            returnType = "Lya/c;",
            parameters = emptyList(),
        ).method
        fontGuy.insertAt(
            fontGuy.instructions.lastIndex,
            """
            invoke-static {v0}, $FONTS->bind(Ljava/lang/Object;)V
            """,
        )

        // FontGuy.c() deletes every downloaded font the current settings do not use. With
        // separate Classic and Modern settings, that would delete fonts the other mode uses.
        // FontGuy.b(), which drops broken font files, stays.
        returnVoid(
            Fingerprint(
                definingClass = "Lya/c;",
                name = "c",
                returnType = "V",
                parameters = emptyList(),
            ).method,
        )

        // A built-in font the user picked always loads Joey's real font.
        writeBody(
            Fingerprint(
                definingClass = "Lya/c\$a;",
                name = "c",
                returnType = "Landroid/graphics/Typeface;",
                parameters = emptyList(),
            ).method,
            2,
            """
            iget v0, p0, Lya/c${'$'}a;->b:I
            invoke-static {v0}, $FONTS->joey(I)Landroid/graphics/Typeface;
            move-result-object v0
            return-object v0
            """,
        )

        // Joey's font-file loader serves Modern's corrected system fonts. .locals 3.
        val fontFile = Fingerprint(
            definingClass = "Lzd/o1;",
            name = "c",
            returnType = "Landroid/graphics/Typeface;",
            parameters = listOf("Ljava/lang/String;"),
        ).method
        fontFile.insertAt(
            0,
            """
            invoke-static {p0}, $FONTS->special(Ljava/lang/String;)Landroid/graphics/Typeface;
            move-result-object v0
            if-eqz v0, :font_file_skip
            return-object v0
            """,
            ExternalLabel("font_file_skip", fontFile.instructions[0]),
        )

        // After a text view gets its font and size (ConfigTextViewAttr.a, .locals 2, one
        // return-void at the end): keep Joey's line height for the corrected system fonts.
        val textAttr = Fingerprint(
            definingClass = "Lq9/b;",
            name = "a",
            returnType = "V",
            parameters = emptyList(),
        ).method
        textAttr.insertAt(
            textAttr.instructions.lastIndex,
            """
            iget-object v0, p0, Lq9/b;->f:Landroid/widget/TextView;
            iget v1, p0, Lq9/b;->c:I
            invoke-static {v0, v1}, $FONTS->fit(Landroid/widget/TextView;I)V
            """,
        )

        // The comment and post body text sets its own font and size.
        val bodyStyle = Fingerprint(
            definingClass = "Lo/o/joey/CustomViews/HtmlDispaly;",
            name = "setStyle",
            returnType = "V",
            parameters = listOf("Lo/o/joey/CustomViews/HTMLTextView;"),
        ).method
        bodyStyle.insertAt(
            bodyStyle.instructions.lastIndex,
            """
            invoke-static {p1}, $FONTS->fitBody(Landroid/widget/TextView;)V
            """,
        )

        val home = HomeActivityOnCreateFingerprint.method
        home.insertAt(
            home.indexOfReference("setContentView") + 1,
            """
            invoke-static {}, $SETTINGS->enableModernUi()V
            invoke-static {p0}, $MODERN_UI->setupNavigation(Landroid/app/Activity;)V
            """,
        )

        val comments = Fingerprint(
            definingClass = "Lo/o/joey/Activities/CommentActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        comments.insertAt(
            comments.indexOfReference("->l3(") + 1,
            """
            invoke-static {p0}, $MODERN_UI->clearHeaderBorder(Landroid/app/Activity;)V
            """,
        )

        val header = Fingerprint(
            definingClass = "Lo/o/joey/Activities/HomeActivity\$a0;",
            name = "a",
            returnType = "V",
            parameters = listOf("Lbc/g;"),
        ).method
        header.insertAt(
            header.instructions.lastIndex,
            """
            iget-object v0, p0, Lo/o/joey/Activities/HomeActivity${'$'}a0;->a:Lbc/i;
            iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView${'$'}c0;->itemView:Landroid/view/View;
            invoke-static {v0}, $MODERN_UI->applyBanner(Landroid/view/View;)V
            """,
        )

        // Restyle Joey's own left-drawer rows after each bind while Modern UI is on.
        for (owner in listOf(
            "Lva/a;",
            "Lva/b;",
            "Lva/c;",
            "Lva/d;",
            "Lva/e;",
            "Lva/f;",
            "Lva/g;",
            "Lva/j;",
            "Lva/k;",
            "Lva/l;",
        )) {
            val bind = Fingerprint(
                definingClass = owner,
                name = "p",
                returnType = "V",
                parameters = listOf(
                    "Lq5/c;",
                    "Landroidx/recyclerview/widget/RecyclerView\$c0;",
                    "I",
                    "Ljava/util/List;",
                ),
            ).method
            bind.insertAt(
                bind.instructions.lastIndex,
                """
                invoke-static {p2}, $SIDEBAR->schedule(Ljava/lang/Object;)V
                """,
            )
        }

        // Joey slides each new post up from a full screen below. Modern UI shortens that.
        val rise = Fingerprint(
            definingClass = "Llc/g;",
            name = "g0",
            returnType = "V",
            parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$c0;"),
        ).method
        rise.insertAt(
            rise.instructions.lastIndex,
            """
            invoke-static {p1}, $MOTION->softenRise(Landroid/view/View;)V
            """,
        )
        val riseAnim = Fingerprint(
            definingClass = "Llc/g;",
            name = "e0",
            returnType = "Landroidx/core/view/t0;",
            parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$c0;"),
        ).method
        riseAnim.insertAt(
            riseAnim.instructions.lastIndex,
            """
            invoke-static {p0, p1}, $MOTION->polishRise(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        val config = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseActivity;",
            name = "onConfigurationChanged",
            returnType = "V",
            parameters = listOf("Landroid/content/res/Configuration;"),
        ).method
        config.insertAt(
            config.instructions.lastIndex,
            """
            invoke-static {p0}, $MODERN_UI->syncChrome(Landroid/app/Activity;)V
            """,
        )
    }
}
