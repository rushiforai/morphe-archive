package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.hasResourceId
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.bryceaspringfield.morphe.patches.reddit.Constants.COMPATIBILITY_REDDIT
import org.w3c.dom.Element
import java.util.logging.Logger

private const val BRANDING_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/Branding;"
private val brandingLogger = Logger.getLogger("MorpheBrandingPatch")

/** Names the bundle's class loader, which reads the branding files. */
private object BrandingFiles

/** Reddit's loading animations (Lottie files), each shown in place of a page, a list, or a community while it loads. */
private val LOADERS = listOf("page_loader_animation", "inline_loader_animation", "community_loader")

/** Reddit's Snoo logos: the search bar's, the app bar's, and the full-color brand mark. */
private val LOGOS = listOf("icon_global_search_snoo", "icon_snoo_logo", "icon_brand_full_color")

/** The files this patch adds, under resources/morphe-branding/ in the bundle and res/ in the app. */
private val BRANDING_FILES = listOf(
    "raw/morphe_reddit_loader.json",
    "drawable/morphe_reddit_logo.xml",
    "drawable/morphe_reddit_adaptive_background.xml",
    "drawable/morphe_reddit_adaptive_foreground.xml",
    "drawable/morphe_reddit_adaptive_monochrome.xml",
    "mipmap-anydpi/morphe_reddit_launcher.xml",
)

/**
 * Sends each load of a Reddit loader or logo resource ID through the extension, which returns Morphe's when the
 * switch in Settings > Morphe is on.
 */
private val brandingHooksPatch = bytecodePatch {
    dependsOn(keywordFilterSettingsPatch)

    execute {
        fun ids(type: ResourceType, names: List<String>) =
            names.filter { hasResourceId(type, it) }.map { resourceId(type, it) }.toSet()

        val loaders = ids(ResourceType.RAW, LOADERS)
        val logos = ids(ResourceType.DRAWABLE, LOGOS)
        val wanted = loaders + logos
        fun literal(instruction: Instruction) = if (instruction.opcode == Opcode.CONST && instruction is NarrowLiteralInstruction)
            instruction.narrowLiteral.toLong().takeIf { it in wanted } else null

        val found = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lio/github/bryceaspringfield/") || classDef.type.startsWith("Lapp/morphe/")) return@classDefForEach
            if (classDef.methods.any { method -> method.implementation?.instructions?.any { literal(it) != null } == true }) {
                found.add(classDef)
            }
        }
        var hooked = 0
        found.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                val list = method.instructions.toList()
                list.indices.filter { literal(list[it]) != null }.sortedDescending().forEach { index ->
                    val register = (list[index] as OneRegisterInstruction).registerA
                    val kind = if (literal(list[index]) in loaders) "loader" else "logo"
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v$register }, $BRANDING_CLASS->$kind(I)I
                            move-result v$register
                        """
                    )
                    hooked++
                }
            }
        }
        if (hooked == 0) brandingLogger.warning("Could not find Reddit's loaders or logos; Reddit's branding stays")
        else brandingLogger.info("Morphe branding: hooked $hooked loads of ${loaders.size} loaders and ${logos.size} logos in ${found.size} classes")
    }
}

@Suppress("unused")
val morpheBrandingPatch = resourcePatch(
    name = "Morphe branding",
    description = "Adds switches, off until turned on in Settings > Morphe, for the Morphe logo in place of Reddit's " +
            "Snoo, Morphe's loading animation in place of Reddit's, and the Morphe launcher icon. " +
            "",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(brandingHooksPatch)

    execute {
        BRANDING_FILES.forEach { path ->
            val input = BrandingFiles::class.java.classLoader.getResourceAsStream("morphe-branding/$path")
                ?: throw PatchException("The bundle is missing morphe-branding/$path")
            input.use { stream ->
                get("res/$path", copy = false).apply { parentFile.mkdirs() }.outputStream().use { stream.copyTo(it) }
            }
        }
        // A disabled copy of Reddit's default launcher entry with the Morphe icon; its switch enables it.
        document("AndroidManifest.xml").use { document ->
            val aliases = document.getElementsByTagName("activity-alias")
            val original = (0 until aliases.length).map { aliases.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == "launcher.default" }
            if (original == null) {
                brandingLogger.warning("Could not find Reddit's launcher.default entry; the launcher icon switch is left out")
                return@use
            }
            val copy = original.cloneNode(true) as Element
            copy.setAttribute("android:name", "launcher.morphe")
            copy.setAttribute("android:icon", "@mipmap/morphe_reddit_launcher")
            copy.setAttribute("android:roundIcon", "@mipmap/morphe_reddit_launcher")
            copy.setAttribute("android:enabled", "false")
            original.parentNode.insertBefore(copy, original.nextSibling)
        }
    }
}
