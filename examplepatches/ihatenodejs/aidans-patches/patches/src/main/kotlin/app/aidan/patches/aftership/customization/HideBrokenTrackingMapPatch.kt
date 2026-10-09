package app.aidan.patches.aftership.customization

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val TRACKING_MAP_FRAGMENT = "LA6/c0;"

@Suppress("unused")
val hideBrokenTrackingMapPatch = bytecodePatch(
    name = "Hide Broken Tracking Map",
    description = "Suppresses the unauthenticated blank white Google Maps view when neither a custom Google Maps API key nor OpenStreetMap is used.",
    default = false
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        patchTrackingMapFragment()
    }
}

/**
 * Makes TrackingMapFragment.b3 show the native fallback image and text, remove an
 * existing Google Maps child fragment when the binding is available, and return
 * before the original map-rendering code runs.
 *
 * @throws PatchException if the fragment class or implemented b3 method is missing.
 */
private fun BytecodePatchContext.patchTrackingMapFragment() {
    val classDef = classDefByOrNull(TRACKING_MAP_FRAGMENT)
        ?: throw PatchException("Class $TRACKING_MAP_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val b3Method = mutableClass.methods.firstOrNull {
        it.name == "b3" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method b3 not found in $TRACKING_MAP_FRAGMENT")

    // Inject const/4 v0, 0x1 at the beginning of the method to force v0=true
    b3Method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            const-string v5, "tracking-map"
            const-string v1, "showNotLocationView"
            invoke-static {v1, v5}, LD2/a;->c(Ljava/lang/Object;Ljava/lang/String;)V
            iget-object v0, p0, LA6/c0;->p:Lg3/b;
            if-eqz v0, :cond_skip_all
            const/4 v1, 0x0
            iget-object v2, v0, Lg3/b;->b:Ljava/lang/Object;
            check-cast v2, Landroid/widget/ImageView;
            if-eqz v2, :cond_skip_img
            invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V
            :cond_skip_img
            iget-object v0, v0, Lg3/b;->c:Ljava/lang/Object;
            check-cast v0, Landroid/widget/TextView;
            if-eqz v0, :cond_skip_txt
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            :cond_skip_txt
            invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;
            move-result-object v0
            const-string v1, "tag_google_map_fragment"
            invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->E(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
            move-result-object v0
            instance-of v1, v0, LS9/d;
            if-eqz v1, :cond_skip_all
            invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;
            move-result-object v1
            new-instance v2, Landroidx/fragment/app/a;
            invoke-direct {v2, v1}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/FragmentManager;)V
            invoke-virtual {v2, v0}, Landroidx/fragment/app/a;->k(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;
            const/4 v0, 0x0
            invoke-virtual {v2, v0}, Landroidx/fragment/app/a;->f(Z)I
            :cond_skip_all
            return-void
        """.trimIndent()
    )
}
