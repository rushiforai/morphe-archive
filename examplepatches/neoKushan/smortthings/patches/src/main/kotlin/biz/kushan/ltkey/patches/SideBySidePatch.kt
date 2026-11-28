package biz.kushan.ltkey.patches

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import biz.kushan.ltkey.patches.shared.Constants.COMPATIBILITY_SMARTTHINGS
import biz.kushan.ltkey.patches.shared.Constants.SMARTTHINGS_PACKAGE
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val DEFAULT_CLONE_PACKAGE = "app.smortthings.clone"
private const val DEFAULT_CLONE_APP_NAME = "Smortthings"
private const val CLONE_ICON_BACKGROUND = "@android:color/holo_orange_dark"
private val ICON_ADAPTIVE_DIRS = listOf("mipmap-anydpi-v26", "mipmap-anydpi", "drawable-anydpi-v26")

/**
 * EXPERIMENTAL — opt-in, off by default. Renames the patched app's application id so it installs
 * **alongside** stock SmartThings instead of replacing it. The intended use: keep the official,
 * Samsung-signed
 * SmartThings for things that need it (e.g. SmartTag/Find trackers, which a re-signed app can't do),
 * and use this renamed copy only to onboard a device and read its LocalThings OwnerPSK.
 *
 * How the rename works:
 *  - Changing the root `<manifest package>` attribute is Morphe's trigger to rename the resource
 *    table + `@<pkg>:` resource references to the new application id (handled by the patcher's
 *    PackageRenamingProcessor during resource encoding).
 *  - That processor does NOT touch the manifest, so this patch also rewrites the two things that
 *    otherwise block a side-by-side install when stock SmartThings is present:
 *      1. `<provider android:authorities>` — content-provider authorities must be globally unique,
 *         else install fails with INSTALL_FAILED_CONFLICTING_PROVIDER. Own-namespace authorities
 *         follow the rename; any foreign authority (e.g. `com.samsung.android.pluginplatform.*`) is
 *         prefixed with the clone id so it can't collide with the stock app's identical one.
 *      2. Custom permissions — own-namespace `<permission>`/`<uses-permission>` names and component
 *         guards follow the rename; foreign `<permission>` *declarations* are removed (the clone can
 *         still *use* them via `<uses-permission>`), else two packages redeclaring the same custom
 *         permission fail with INSTALL_FAILED_DUPLICATE_PERMISSION.
 *    Component class names (`android:name` on activities/services/etc.) are fully-qualified in the
 *    shipped APK and are left untouched, so changing the package does not rebase them.
 *  - The launcher label (`android:label` on `<application>` and on the launcher activities) is set
 *    to the clone name so the copy is distinguishable from stock SmartThings on the home screen.
 *  - The launcher icon's adaptive background is recoloured (best-effort) to a framework colour so
 *    the clone's icon is visually distinct; the original foreground logo is kept.
 *  - Process identity: SmartThings' `ProcessConfig` matches the running process name against
 *    literals baked into dex ("com.samsung.android.oneconnect:Core", `BuildConfig.APPLICATION_ID`),
 *    so a renamed clone's processes fail its "which process am I" check and it crashes with
 *    "not core process" on launch. Renaming the processes in the manifest trips an Android
 *    install-parser bug, so instead this replaces `ContextUtil.getCurrentProcessName()` (extension
 *    `DtProc`) to map the clone's process names back to the original package.
 *  - Provider access: the app addresses its own content-providers by literal authority strings in
 *    dex (e.g. `content://com.samsung.android.oneconnect.db.internaldb/...`). With the manifest
 *    authorities renamed, those literals would resolve to *stock's* providers and be denied, so the
 *    clone can't persist its session and sign-in silently fails. Step 7 rewrites those const-string
 *    authority literals in the dex to match the renamed manifest, so the clone uses its own
 *    providers. Verified end-to-end: the clone installs next to stock, signs into the Samsung
 *    account, and syncs the real account / location / devices.
 *
 * Known residual risks:
 *  - The device *control* screen is a downloaded web plugin that calls Samsung-framework APIs
 *    (`android.os.SemSystemProperties`); it crashes on non-Samsung hardware (and the emulator). The
 *    native OwnerPSK *Edit* screen (reached via long-press -> Edit) does not use it and renders fine.
 *  - Foreign/shared providers (e.g. `com.samsung.android.pluginplatform.*`) are only prefixed in the
 *    manifest, not repointed in dex, so plugin-platform features may be degraded in the clone.
 *  - A device shows its OwnerPSK only after being locally onboarded *on this phone*; a device synced
 *    from the account (onboarded elsewhere) shows "No local key for this device yet" until re-added.
 */
@Suppress("unused")
val sideBySidePatch = patch(
    name = "Install alongside SmartThings (experimental)",
    description = "EXPERIMENTAL — opt-in. Installs the patched app next to the stock SmartThings so " +
        "you keep the official app (for SmartTag etc.) and use this copy only to read a device's " +
        "LocalThings OwnerPSK. Renames the application id, launcher name/icon, process identity and " +
        "the in-dex provider authorities so the clone installs, launches, signs in and syncs devices " +
        "alongside stock. The device control web-plugin may not work on non-Samsung phones; read the " +
        "key from the device's Edit screen (long-press the device -> Edit). Please report results.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SMARTTHINGS)

    extendWith("extensions/extension.mpe")

    val clonePackageOption = stringOption(
        key = "clonePackageName",
        default = DEFAULT_CLONE_PACKAGE,
        title = "Clone application id",
        description = "The application id for the renamed copy so it installs next to stock " +
            "SmartThings. Must be a valid, unused Android package name.",
        required = true,
    )

    val cloneAppNameOption = stringOption(
        key = "cloneAppName",
        default = DEFAULT_CLONE_APP_NAME,
        title = "Clone app name",
        description = "The launcher name shown for the renamed copy, so it is distinguishable from " +
            "stock SmartThings on the home screen.",
        required = true,
    )

    execute {
        val oldPackage = SMARTTHINGS_PACKAGE
        val newPackage = clonePackageOption.value?.trim().orEmpty().ifEmpty { DEFAULT_CLONE_PACKAGE }
        if (newPackage == oldPackage) return@execute

        // Process identity: SmartThings' ProcessConfig compares the running process name to literals
        // baked into dex ("com.samsung.android.oneconnect:Core", BuildConfig.APPLICATION_ID, ...). A
        // renamed clone's processes ("<clone>:Core") don't match, so the app throws "not core
        // process" and crashes on launch. We can't rename the processes in the manifest (that trips
        // an install-parser bug), so instead replace ContextUtil.getCurrentProcessName() — the single
        // source those checks read — to map the clone's process names back to the original package.
        GetCurrentProcessNameFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, Lbiz/kushan/ltkey/DtProc;->currentProcessName(Landroid/content/Context;)Ljava/lang/String;
                move-result-object p0
                return-object p0
            """,
        )

        // Rewrite an identifier in the app's own namespace to the new package; leave everything else
        // (system permissions, foreign authorities, component class names) exactly as-is.
        fun reown(value: String): String = when {
            value == oldPackage -> newPackage
            value.startsWith("$oldPackage.") -> newPackage + value.substring(oldPackage.length)
            else -> value
        }

        // Adaptive icon resource names to recolour in step 6. `ic_qconnect` is SmartThings' actual
        // launcher icon (the `ic_launcher` mipmaps are stubs); the generic defaults cover other apps;
        // step 5 also adds whatever the manifest's android:icon/roundIcon actually point at.
        val cloneIconNames = linkedSetOf("ic_qconnect", "ic_launcher", "ic_launcher_round")

        // Own-namespace provider authorities renamed below (old -> new). The dex addresses these
        // providers by the original authority, so step 7 repoints those literals to match; without
        // it the clone's queries resolve to stock's providers and are denied, blocking sign-in.
        val authorityRewrites = LinkedHashMap<String, String>()

        document("AndroidManifest.xml").use { document ->
            // 1. The application id itself → triggers the resource-table rename.
            document.documentElement.setAttribute("package", newPackage)

            // 2. Provider authorities must be globally unique, or the install is rejected with
            //    INSTALL_FAILED_CONFLICTING_PROVIDER. Authorities in the app's own namespace follow
            //    the package rename; any other authority (e.g. Samsung's shared
            //    com.samsung.android.pluginplatform.* providers) is prefixed with the clone id so it
            //    cannot collide with the stock app's identical declaration.
            fun uniqueAuthority(authority: String): String = when {
                authority.isEmpty() -> authority
                authority == oldPackage || authority.startsWith("$oldPackage.") -> reown(authority)
                else -> "$newPackage.$authority"
            }
            val providers = document.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val element = providers.item(i) as? Element ?: continue
                val authorities = element.getAttribute("android:authorities")
                if (authorities.isEmpty()) continue
                val renamed = authorities.split(";").joinToString(";") { authority ->
                    val unique = uniqueAuthority(authority)
                    if (unique != authority &&
                        (authority == oldPackage || authority.startsWith("$oldPackage."))
                    ) {
                        authorityRewrites[authority] = unique
                    }
                    unique
                }
                if (renamed != authorities) element.setAttribute("android:authorities", renamed)
            }

            // 3. Custom permissions.
            //  - Foreign <permission> *declarations* (outside the app's namespace) are removed so
            //    they can't collide with the stock app's identical declaration across the two
            //    installs (INSTALL_FAILED_DUPLICATE_PERMISSION). The clone can still *use* them via
            //    <uses-permission>; only the redundant re-declaration is dropped.
            val foreignPermissions = ArrayList<Node>()
            val permissionDecls = document.getElementsByTagName("permission")
            for (i in 0 until permissionDecls.length) {
                val element = permissionDecls.item(i) as? Element ?: continue
                val name = element.getAttribute("android:name")
                if (name.isNotEmpty() && name != oldPackage && !name.startsWith("$oldPackage.")) {
                    foreignPermissions.add(element)
                }
            }
            foreignPermissions.forEach { it.parentNode?.removeChild(it) }

            //  - The app's own permission names (declarations, requests, guards) follow the rename.
            for (tag in PERMISSION_TAGS) {
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as? Element ?: continue
                    val name = element.getAttribute("android:name")
                    if (name.isEmpty()) continue
                    val renamed = reown(name)
                    if (renamed != name) element.setAttribute("android:name", renamed)
                }
            }

            // 4. Component guards that reference one of the app's own permissions.
            val all = document.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as? Element ?: continue
                for (attribute in PERMISSION_ATTRIBUTES) {
                    val value = element.getAttribute(attribute)
                    if (value.isEmpty()) continue
                    val renamed = reown(value)
                    if (renamed != value) element.setAttribute(attribute, renamed)
                }
            }

            // 5. Rebrand the launcher label so the clone is distinguishable from stock SmartThings.
            val appName = cloneAppNameOption.value?.trim().orEmpty().ifEmpty { DEFAULT_CLONE_APP_NAME }
            val applications = document.getElementsByTagName("application")
            for (i in 0 until applications.length) {
                val application = applications.item(i) as? Element ?: continue
                application.setAttribute("android:label", appName)
                // Note which adaptive icon(s) the app actually uses, for the recolour below.
                resourceEntryName(application.getAttribute("android:icon"))?.let(cloneIconNames::add)
                resourceEntryName(application.getAttribute("android:roundIcon"))?.let(cloneIconNames::add)
            }
            // Launcher activities/aliases override the application label on the home screen.
            for (tag in listOf("activity", "activity-alias")) {
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val element = nodes.item(i) as? Element ?: continue
                    if (isLauncherComponent(element)) element.setAttribute("android:label", appName)
                }
            }
        }

        // 6. Best-effort: give the clone a visually distinct icon by recolouring its adaptive
        //    icon's background layer to a framework colour. The original foreground (the
        //    SmartThings logo) is kept, so the icon stays recognisable but on a different colour.
        //    Guarded per file: a non-adaptive icon or unexpected layout just leaves it unchanged.
        for (name in cloneIconNames) {
            for (dir in ICON_ADAPTIVE_DIRS) {
                try {
                    document("res/$dir/$name.xml").use { icon ->
                        val backgrounds = icon.getElementsByTagName("background")
                        for (i in 0 until backgrounds.length) {
                            (backgrounds.item(i) as? Element)
                                ?.setAttribute("android:drawable", CLONE_ICON_BACKGROUND)
                        }
                    }
                } catch (_: Throwable) {
                    // No such icon variant (or not adaptive) — skip it, leave the icon as-is.
                }
            }
        }

        // 7. Repoint the app's own provider authorities in the DEX. The code addresses its providers
        //    by the original authority (e.g. Uri.parse("content://com.samsung.android.oneconnect.db
        //    .internaldb/internal")) which — with stock installed — resolves to stock's providers and
        //    is denied, so the clone can't read/write its own settings/data and sign-in can't persist.
        //    Rewrite every const-string containing a renamed own-authority to the clone authority,
        //    matching the manifest. The full authority strings are distinctive (only used in
        //    content:// URIs), so this is safe; always emit const-string/jumbo so any string-pool
        //    index is valid.
        for ((oldAuthority, newAuthority) in authorityRewrites) {
            for (classDef in classDefByStrings(oldAuthority, StringComparisonType.CONTAINS)) {
                mutableClassDefBy(classDef).methods.forEach { method ->
                    val implementation = method.implementation ?: return@forEach
                    implementation.instructions.toList().forEachIndexed { index, instruction ->
                        if (instruction.opcode != Opcode.CONST_STRING &&
                            instruction.opcode != Opcode.CONST_STRING_JUMBO
                        ) return@forEachIndexed
                        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                            ?.string ?: return@forEachIndexed
                        if (!value.contains(oldAuthority)) return@forEachIndexed
                        val register = (instruction as OneRegisterInstruction).registerA
                        implementation.replaceInstruction(
                            index,
                            BuilderInstruction31c(
                                Opcode.CONST_STRING_JUMBO,
                                register,
                                ImmutableStringReference(value.replace(oldAuthority, newAuthority)),
                            ),
                        )
                    }
                }
            }
        }
    }
}

/** True if the activity / activity-alias is a home-screen launcher entry (MAIN + LAUNCHER). */
private fun isLauncherComponent(component: Element): Boolean {
    val filters = component.getElementsByTagName("intent-filter")
    for (i in 0 until filters.length) {
        val filter = filters.item(i) as? Element ?: continue
        var isMain = false
        var isLauncher = false
        val actions = filter.getElementsByTagName("action")
        for (j in 0 until actions.length) {
            if ((actions.item(j) as? Element)?.getAttribute("android:name") == "android.intent.action.MAIN") isMain = true
        }
        val categories = filter.getElementsByTagName("category")
        for (j in 0 until categories.length) {
            val category = (categories.item(j) as? Element)?.getAttribute("android:name")
            if (category == "android.intent.category.LAUNCHER" || category == "android.intent.category.LEANBACK_LAUNCHER") isLauncher = true
        }
        if (isMain && isLauncher) return true
    }
    return false
}

/** Entry name of a resource reference like `@mipmap/ic_launcher` (-> `ic_launcher`), else null. */
private fun resourceEntryName(reference: String): String? {
    val slash = reference.lastIndexOf('/')
    if (!reference.startsWith("@") || slash < 0) return null
    return reference.substring(slash + 1).ifEmpty { null }
}

private val PERMISSION_TAGS = listOf(
    "permission",
    "uses-permission",
    "uses-permission-sdk-23",
    "permission-tree",
    "permission-group",
)

private val PERMISSION_ATTRIBUTES = listOf(
    "android:permission",
    "android:readPermission",
    "android:writePermission",
)
