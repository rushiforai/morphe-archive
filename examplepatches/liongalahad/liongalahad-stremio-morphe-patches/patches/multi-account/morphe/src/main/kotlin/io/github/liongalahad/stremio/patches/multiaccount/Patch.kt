package io.github.liongalahad.stremio.patches.multiaccount

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.stremio.patches.shared.Constants.STREMIO_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ISOLATION = "Lcom/stremio/morphe/MorpheIsolation;"
private const val NAV_BRIDGE = "Lcom/stremio/morphe/MorpheNavBridge;"

private val multiAccountResourcePatch = resourcePatch {
    compatibleWith(STREMIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use(::transformManifest)
        document("res/layout/activity_main.xml").use(::transformMainLayout)
    }
}

@Suppress("unused")
val multiAccountPatch = bytecodePatch(
    name = "Multi-account",
    description = "Adds an Android TV account chooser with isolated login, library, addons, watch state, names, colors, and PINs.",
    default = true
) {
    compatibleWith(STREMIO_COMPATIBILITY)
    dependsOn(multiAccountResourcePatch)
    extendWith("extensions/stremio.mpe")

    execute {
        listOf(
            CoreErrorResetFingerprint,
            CorePreferencesFingerprint,
            ProfilePreferencesFingerprint,
            DestinationChangedFingerprint,
            MenuFocusChangedFingerprint,
            NavigationTabsFingerprint
        ).forEach { it.matchAll(1..1) }

        CoreErrorResetFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2, p0, p1 }, $ISOLATION->resetActiveAccount(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;)Z
                invoke-static { p2 }, Lcom/stremio/common/extensions/ContextExtKt;->restartApp(Landroid/content/Context;)V
                sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object p0
            """
        )

        CorePreferencesFingerprint.method.apply {
            val callIndex = implementation!!.instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == "Landroid/content/Context;" &&
                    reference.name == "getSharedPreferences"
            }.index
            replaceInstruction(
                callIndex,
                "invoke-static { p0 }, $ISOLATION->corePreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"
            )
        }

        ProfilePreferencesFingerprint.method.apply {
            val callIndex = implementation!!.instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == "Landroidx/preference/PreferenceManager;" &&
                    reference.name == "getDefaultSharedPreferences"
            }.index
            replaceInstruction(
                callIndex,
                "invoke-static { p0 }, $ISOLATION->profilePreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;"
            )
        }

        DestinationChangedFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val idCallIndex = instructions.withIndex().first { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@first false
                reference.definingClass == "Landroidx/navigation/NavDestination;" &&
                    reference.name == "getId"
            }.index
            val result = instructions[idCallIndex + 1] as? OneRegisterInstruction
                ?: error("Navigation destination ID has no result register")
            check(result.opcode == Opcode.MOVE_RESULT && result.registerA <= 15) {
                "Navigation destination ID result is no longer encodable"
            }
            addInstructions(
                idCallIndex + 2,
                "invoke-static { v${result.registerA} }, $NAV_BRIDGE->onDestinationChanged(I)V"
            )
        }

        MenuFocusChangedFingerprint.method.apply {
            val callIndex = implementation!!.instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == "Lcom/stremio/tv/views/menu/NavigationMenuKt;" &&
                    reference.name == "NavigationMenu\$lambda\$8"
            }.index
            addInstructions(
                callIndex + 1,
                "invoke-static { p0, p1 }, $NAV_BRIDGE->onMenuFocusChanged(Ljava/lang/Object;Z)V"
            )
        }

        NavigationTabsFingerprint.method.apply {
            check(implementation!!.registerCount > 12) {
                "Navigation Tabs no longer has the verified temporary registers"
            }
            val paddingCallIndex = implementation!!.instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == "Landroidx/compose/foundation/layout/PaddingKt;" &&
                    reference.name == "padding-VpY3zN4"
            }.index
            val result = implementation!!.instructions[paddingCallIndex + 1]
                as? OneRegisterInstruction
                ?: error("Navigation padding has no modifier result")
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT && result.registerA == 0) {
                "Navigation padding modifier no longer uses v0"
            }
            addInstructions(
                paddingCallIndex + 2,
                """
                    const/4 v11, 0x0
                    int-to-float v11, v11
                    invoke-static { v11 }, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F
                    move-result v11
                    const/16 v12, 0x18
                    int-to-float v12, v12
                    invoke-static { v12 }, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F
                    move-result v12
                    invoke-static { v0, v11, v12 }, Landroidx/compose/foundation/layout/OffsetKt;->offset-VpY3zN4(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;
                    move-result-object v0
                """
            )
        }
    }
}

private fun transformManifest(document: Document) {
    val manifest = document.documentElement
    check(manifest.tagName == "manifest" && manifest.getAttribute("package") == "com.stremio.one") {
        "Unexpected Stremio manifest root"
    }
    val application = document.getElementsByTagName("application").singleElement()
    application.setAttribute("android:allowBackup", "false")
    application.setAttribute("android:fullBackupContent", "false")

    val mainActivity = document.getElementsByTagName("activity").elements().single { activity ->
        activity.getAttribute("android:name") == "com.stremio.tv.MainActivity"
    }
    val launcherFilter = mainActivity.childElements("intent-filter").single { filter ->
        filter.childElements("action").any {
            it.getAttribute("android:name") == "android.intent.action.MAIN"
        }
    }
    launcherFilter.childElements().filter { element ->
        val name = element.getAttribute("android:name")
        name == "android.intent.action.MAIN" ||
            name == "android.intent.category.LAUNCHER" ||
            name == "android.intent.category.LEANBACK_LAUNCHER"
    }.forEach { launcherFilter.removeChild(it) }

    val chooser = document.createElement("activity").apply {
        setAttribute("android:clearTaskOnLaunch", "true")
        setAttribute("android:exported", "true")
        setAttribute("android:launchMode", "singleTask")
        setAttribute("android:name", "com.stremio.morphe.ProfileChooserActivity")
        setAttribute("android:process", ":profile_chooser")
        setAttribute("android:screenOrientation", "landscape")
        setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
        appendChild(document.createElement("intent-filter").apply {
            appendChild(document.namedElement("action", "android.intent.action.MAIN"))
            appendChild(document.namedElement("category", "android.intent.category.LAUNCHER"))
            appendChild(document.namedElement("category", "android.intent.category.LEANBACK_LAUNCHER"))
        })
    }
    application.insertBefore(chooser, mainActivity)

    application.appendChild(document.createElement("receiver").apply {
        setAttribute("android:exported", "true")
        setAttribute("android:name", "com.stremio.morphe.AccountSlotReceiver")
        setAttribute("android:permission", "android.permission.DUMP")
        appendChild(document.createElement("intent-filter").apply {
            appendChild(document.namedElement("action", "com.stremio.morphe.GET_ACCOUNT_SLOT"))
            appendChild(document.namedElement("action", "com.stremio.morphe.SET_ACCOUNT_SLOT"))
        })
    })
}

private fun transformMainLayout(document: Document) {
    val root = document.documentElement
    check(root.tagName == "FrameLayout") { "Unexpected activity_main root: ${root.tagName}" }
    document.renameNode(root, null, "com.stremio.morphe.MorpheRootLayout")

    val sideMenu = root.childElements().single { element ->
        element.getAttribute("android:id") == "@id/side_menu_fragment"
    }
    root.insertBefore(document.createElement("View").apply {
        setAttribute("android:id", "@+id/morphe_nav_backdrop")
        setAttribute("android:layout_width", "185dp")
        setAttribute("android:layout_height", "match_parent")
        setAttribute("android:layout_gravity", "start")
        setAttribute("android:background", "#FF09090E")
        setAttribute("android:focusable", "false")
        setAttribute("android:visibility", "gone")
    }, sideMenu)

    val accountView = document.createElement("com.stremio.morphe.MorpheAccountsNavView").apply {
        setAttribute("android:layout_width", "145dp")
        setAttribute("android:layout_height", "48dp")
        setAttribute("android:layout_gravity", "start|top")
        setAttribute("android:layout_marginStart", "20dp")
        setAttribute("android:layout_marginTop", "84dp")
    }
    val next = sideMenu.nextSibling
    if (next == null) root.appendChild(accountView) else root.insertBefore(accountView, next)
}

private fun Document.namedElement(tag: String, androidName: String) = createElement(tag).apply {
    setAttribute("android:name", androidName)
}

private fun org.w3c.dom.NodeList.singleElement(): Element =
    elements().single()

private fun org.w3c.dom.NodeList.elements(): List<Element> =
    (0 until length).mapNotNull { item(it) as? Element }

private fun Element.childElements(tag: String? = null): List<Element> =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }
        .filter { tag == null || it.tagName == tag }
