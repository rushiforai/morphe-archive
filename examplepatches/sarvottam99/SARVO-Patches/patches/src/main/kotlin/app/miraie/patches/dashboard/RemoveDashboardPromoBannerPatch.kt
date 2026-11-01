package app.miraie.patches.dashboard

import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val HOME_SCREEN_FRAGMENT =
    "Lcom/panasonic/in/miraie/dashboard/HomeScreenFragment;"

private const val DASHBOARD_RECYCLER_VIEW =
    "Landroidx/recyclerview/widget/RecyclerView;"

private const val ANDROID_NAMESPACE =
    "http://schemas.android.com/apk/res/android"

private const val BANNER_RESOURCE_NAME =
    "dashboard_banner_rv"

private object SetupDashboardTopBannerFingerprint : Fingerprint(
    definingClass = HOME_SCREEN_FRAGMENT,
    name = "setupDashboardTopBanner",
    returnType = "V",
    parameters = emptyList()
)

/*
 * Internal dependency.
 *
 * Hide the banner at XML inflation time. This is deliberately separate from
 * the bytecode patch so the RecyclerView is already GONE before any banner
 * code can try to display or scroll it.
 */
private val hideDashboardBannerLayoutPatch = resourcePatch {
    execute {
        decode("res/layout*")

        val layoutDirectories = get("res")
            .listFiles()
            .orEmpty()
            .filter { it.isDirectory && it.name.startsWith("layout") }

        val layouts = layoutDirectories
            .mapNotNull { directory ->
                directory.resolve("fragment_homescreen.xml")
                    .takeIf { it.isFile }
            }

        if (layouts.size != 3) {
            throw PatchException(
                "Expected 3 MirAIe fragment_homescreen.xml variants, found ${layouts.size}"
            )
        }

        layouts.forEach { file ->
            document(
                "res/${file.parentFile.name}/${file.name}"
            ).use { document ->

                val recyclerViews = document
                    .getElementsByTagName("androidx.recyclerview.widget.RecyclerView")

                if (recyclerViews.length != 1) {
                    throw PatchException(
                        "Expected exactly one dashboard RecyclerView in ${file.path}, " +
                            "found ${recyclerViews.length}"
                    )
                }

                val banner = recyclerViews.item(0) as? Element
                    ?: throw PatchException(
                        "Could not read dashboard RecyclerView in ${file.path}"
                    )

                val id = banner.getAttributeNS(
                    ANDROID_NAMESPACE,
                    "id"
                ).ifBlank {
                    banner.getAttribute("android:id")
                }

                if (!id.contains(BANNER_RESOURCE_NAME)) {
                    throw PatchException(
                        "Unexpected RecyclerView in ${file.path}: id=$id"
                    )
                }

                banner.setAttributeNS(
                    ANDROID_NAMESPACE,
                    "android:visibility",
                    "gone"
                )
            }
        }
    }
}

@Suppress("unused")
val removeDashboardPromoBannerPatch = bytecodePatch(
    name = "Remove dashboard promotional banner",
    description = "Removes the dashboard promotional carousel before it initializes.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MIRAIE)

    dependsOn(hideDashboardBannerLayoutPatch)

    execute {
        val method = SetupDashboardTopBannerFingerprint.method

        val instructions = method.implementation?.instructions
            ?: throw PatchException(
                "MirAIe HomeScreenFragment.setupDashboardTopBanner() has no implementation"
            )

        val hasBannerView = instructions.any { instruction ->
            if (instruction.opcode != Opcode.IGET_OBJECT) {
                false
            } else {
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? FieldReference

                reference?.definingClass == HOME_SCREEN_FRAGMENT &&
                    reference.name == "mDashboardBannerRv" &&
                    reference.type == DASHBOARD_RECYCLER_VIEW
            }
        }

        val configuresAdapter = instructions.any { instruction ->
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL) {
                false
            } else {
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference

                reference?.definingClass == DASHBOARD_RECYCLER_VIEW &&
                    reference.name == "setAdapter" &&
                    reference.returnType == "V"
            }
        }

        if (!hasBannerView || !configuresAdapter) {
            throw PatchException(
                "Unexpected MirAIe dashboard banner implementation; refusing to patch"
            )
        }

        /*
         * Do not inject any Smali.
         *
         * The complete banner initialization is skipped:
         * - no adapter
         * - no PagerSnapHelper
         * - no scroll listener
         * - no touch listener
         * - no Handler/runnable setup
         * - no automatic banner scrolling
         */
        method.returnEarly()
    }
}
