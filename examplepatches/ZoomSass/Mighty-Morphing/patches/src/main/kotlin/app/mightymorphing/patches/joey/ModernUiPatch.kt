package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"
private const val MODERN_UI = "Lapp/mightymorphing/extension/joey/ModernUi;"
private const val POSTS = "Lapp/mightymorphing/extension/joey/PostLayout;"
private const val DOWNLOADS = "Lapp/mightymorphing/extension/joey/MediaDownload;"
private const val MOTION = "Lapp/mightymorphing/extension/joey/PostMotion;"
private const val SIDEBAR = "Lapp/mightymorphing/extension/joey/Sidebar;"

private const val ANIM_HEAD = """<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android" android:shareInterpolator="true""""

/** Short window animations used in place of Joey's full-width slide while Modern UI is on. */
private val modernMotionResources = resourcePatch {
    compatibleWith(JOEY)

    execute {
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

        val drawable = get("res").resolve("drawable")
        drawable.mkdirs()
        drawable.resolve("morphe_download.xml").writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp"
                android:height="24dp"
                android:viewportWidth="24"
                android:viewportHeight="24">
                <path
                    android:fillColor="#FFFFFFFF"
                    android:fillType="evenOdd"
                    android:pathData="M17,3H5C3.89,3 3,3.9 3,5V19C3,20.1 3.89,21 5,21H19C20.1,21 21,20.1 21,19V7L17,3M19,19H5V5H16.17L19,7.83V19M12,12C10.34,12 9,13.34 9,15S10.34,18 12,18 15,16.66 15,15 13.66,12 12,12M6,6H15V10H6V6Z" />
            </vector>
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val modernUiPatch = bytecodePatch(
    name = "Modern UI",
    description = "[v1.3.7: AMOLED black now appears in settings. v1.3.6: Classic Joey can be turned back on. The Joey bird image in sidebar can be toggled on when using ModernUI. Performance improvements for Modern UI. Post style settings are back, without post layout, thumbnail side, or corner roundness. Thumbnail post style ui fixes.] With ModernUI layout turned on (on by default) Joey's own themes and colour changes are turned off. ModernUI layout patch includes Aqua (default), Blue, Purple, Coral, Mint, Gold, Amber, Black, Sky, and AMOLED black themes and can be set in Joey Settings - Morphe Settings. Posts use one compact list, so card and compact are no longer separate. Various customisable UI options are in Morphe Settings. The media viewer has its first UI tweaks in this release, including bigger icons and a full screen view.",
    default = true,
) {
    compatibleWith(JOEY)

    dependsOn(modernMotionResources)
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
        for (rebuild in listOf("G", "C")) {
            val method = Fingerprint(
                definingClass = "Ljc/d;",
                name = rebuild,
                returnType = "V",
                parameters = emptyList(),
            ).method
            method.insertAt(
                method.instructions.lastIndex,
                """
                invoke-static {p0}, $POSTS->refresh(Ljava/lang/Object;)V
                """,
            )
        }

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

        // 5. System font matching (Typeface.DEFAULT)
        val fontMethod = TypefaceFingerprint.method
        fontMethod.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->getTypefaceOverride(I)Landroid/graphics/Typeface;
            move-result-object v0
            if-eqz v0, :font_skip
            return-object v0
            """,
            ExternalLabel("font_skip", fontMethod.instructions[0]),
        )

        val home = HomeActivityOnCreateFingerprint.method
        home.insertAt(
            home.indexOfReference("setContentView") + 1,
            """
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

        val open = Fingerprint(
            definingClass = "Loa/f;",
            name = "e",
            returnType = "V",
            parameters = listOf(
                "Lnet/dean/jraw/models/Submission;",
                "Landroid/app/Activity;",
                "Z",
            ),
        ).method
        open.insertAt(
            0,
            """
            invoke-static {p0}, $DOWNLOADS->note(Ljava/lang/Object;)V
            """,
        )

        val save = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseActivity;",
            name = "y1",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;"),
        ).method
        save.insertAt(
            0,
            """
            invoke-static {p0, p1}, $DOWNLOADS->prepare(Landroid/app/Activity;Ljava/lang/String;)V
            """,
        )

        PhotoViewerFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->setupPhotoViewer(Landroid/app/Activity;)V
            """,
        )

        val album = Fingerprint(
            definingClass = "Lo/o/joey/Activities/BaseAlbumActivity;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf("Landroid/os/Bundle;"),
        ).method
        album.insertAt(
            album.instructions.lastIndex,
            """
            invoke-static {p0}, $MODERN_UI->setupAlbumViewer(Landroid/app/Activity;)V
            """,
        )

        VActivityFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0}, $MODERN_UI->setupVideoViewer(Landroid/app/Activity;)V
            """,
        )

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

        // Joey names the saved file from the URL. Swap in the chosen name as it is filed.
        for (name in listOf("E", "F")) {
            val filing = Fingerprint(
                definingClass = "Lo/o/joey/Download/DownloadService;",
                name = name,
                returnType = "V",
                parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            ).method
            filing.insertAt(
                0,
                """
                invoke-static {p2}, $DOWNLOADS->fileName(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
                """,
            )
        }
    }
}
