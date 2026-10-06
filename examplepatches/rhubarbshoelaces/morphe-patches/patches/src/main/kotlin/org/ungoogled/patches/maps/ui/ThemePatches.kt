package org.ungoogled.patches.maps.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

val hybridThemePatch = bytecodePatch(
    name = "Hybrid Theme (Dark Menus, Light Map)",
    description = "Allows toggling a light map canvas while keeping app UI in Dark Mode via Customizations menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(regionExtensionPatch)

    execute {
        // --- TARGET 1: Inject UI Row into CustomizationActivity ---
        try {
            val customizationClass = mutableClassDefBy("Lorg/ungoogled/ui/CustomizationActivity;")
            val onCreateMethod = customizationClass.methods.firstOrNull { it.name == "onCreate" }
            onCreateMethod?.let { method ->
                val returnIndex = method.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
                val insertIndex = if (returnIndex != -1) returnIndex else method.instructions.size

                method.addInstructions(
                    insertIndex,
                    """
                        invoke-static { p0 }, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->addHybridThemeRow(Landroid/app/Activity;)V
                    """.trimIndent()
                )
            }
        } catch (ignored: Exception) {}

        // --- TARGET 2: Intercept Protobuf Style Converter Lbkjo;->a(Lciar;)Lbkjo; ---
        try {
            val bkjoClass = mutableClassDefBy("Lbkjo;")
            val convertMethod = bkjoClass.methods.firstOrNull { it.name == "a" }
            convertMethod?.addInstructions(
                0,
                """
                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result v0
                    if-eqz v0, :done_ciar_remap

                    sget-object v0, Lciar;->S:Lciar;          # ROADMAP_DARK
                    if-ne p0, v0, :check_ciar_overview
                    sget-object p0, Lciar;->P:Lciar;          # ROADMAP (Day)
                    goto :done_ciar_remap

                    :check_ciar_overview
                    sget-object v0, Lciar;->Z:Lciar;          # ROUTE_OVERVIEW_DARK
                    if-ne p0, v0, :check_ciar_terrain
                    sget-object p0, Lciar;->Y:Lciar;          # ROUTE_OVERVIEW (Day)
                    goto :done_ciar_remap

                    :check_ciar_terrain
                    sget-object v0, Lciar;->af:Lciar;         # TERRAIN_VECTOR_CLIENT_DARK
                    if-ne p0, v0, :check_ciar_transit
                    sget-object p0, Lciar;->ae:Lciar;         # TERRAIN_VECTOR_CLIENT (Day)
                    goto :done_ciar_remap

                    :check_ciar_transit
                    sget-object v0, Lciar;->ah:Lciar;         # TRANSIT_FOCUSED_DARK
                    if-ne p0, v0, :check_ciar_nav
                    sget-object p0, Lciar;->ag:Lciar;         # TRANSIT_FOCUSED (Day)
                    goto :done_ciar_remap

                    :check_ciar_nav
                    sget-object v0, Lciar;->K:Lciar;          # NAVIGATION_LOW_LIGHT
                    if-ne p0, v0, :done_ciar_remap
                    sget-object p0, Lciar;->r:Lciar;          # NAVIGATION (Day)

                    :done_ciar_remap
                """.trimIndent()
            )
        } catch (ignored: Exception) {}

        // --- TARGET 3: Register-safe hook in Lbknb;->a(Z)Lbknc; ---
        try {
            val bknbClass = mutableClassDefBy("Lbknb;")
            val aMethod = bknbClass.methods.firstOrNull { it.name == "a" }
            aMethod?.addInstructions(
                0,
                """
                    if-eqz p1, :hybrid_check_done

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p1
                    if-eqz p1, :hybrid_disabled

                    const/4 p1, 0x0
                    goto :hybrid_check_done

                    :hybrid_disabled
                    const/4 p1, 0x1

                    :hybrid_check_done
                """.trimIndent()
            )
        } catch (ignored: Exception) {}

        // --- TARGET 4: Register-safe hook in Lbkpd;->i(ILbkjo;Lbkja;)Z ---
        try {
            val bkpdClass = mutableClassDefBy("Lbkpd;")
            val iMethod = bkpdClass.methods.firstOrNull { it.name == "i" }
            iMethod?.addInstructions(
                0,
                """
                    sget-object v0, Lbkjo;->b:Lbkjo;          # ROADMAP_DARK
                    if-ne p2, v0, :check_bkpd_overview

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_roadmap_disabled
                    sget-object p2, Lbkjo;->a:Lbkjo;          # ROADMAP (Day)
                    goto :done_bkpd_remap

                    :bkpd_roadmap_disabled
                    sget-object p2, Lbkjo;->b:Lbkjo;          # ROADMAP_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_overview
                    sget-object v0, Lbkjo;->B:Lbkjo;          # ROUTE_OVERVIEW_DARK
                    if-ne p2, v0, :check_bkpd_terrain

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_overview_disabled
                    sget-object p2, Lbkjo;->A:Lbkjo;          # ROUTE_OVERVIEW (Day)
                    goto :done_bkpd_remap

                    :bkpd_overview_disabled
                    sget-object p2, Lbkjo;->B:Lbkjo;          # ROUTE_OVERVIEW_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_terrain
                    sget-object v0, Lbkjo;->F:Lbkjo;          # TERRAIN_VECTOR_CLIENT_DARK
                    if-ne p2, v0, :check_bkpd_transit

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_terrain_disabled
                    sget-object p2, Lbkjo;->E:Lbkjo;          # TERRAIN_VECTOR_CLIENT (Day)
                    goto :done_bkpd_remap

                    :bkpd_terrain_disabled
                    sget-object p2, Lbkjo;->F:Lbkjo;          # TERRAIN_VECTOR_CLIENT_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_transit
                    sget-object v0, Lbkjo;->H:Lbkjo;          # TRANSIT_FOCUSED_DARK
                    if-ne p2, v0, :check_bkpd_nav

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_transit_disabled
                    sget-object p2, Lbkjo;->G:Lbkjo;          # TRANSIT_FOCUSED (Day)
                    goto :done_bkpd_remap

                    :bkpd_transit_disabled
                    sget-object p2, Lbkjo;->H:Lbkjo;          # TRANSIT_FOCUSED_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_nav
                    sget-object v0, Lbkjo;->n:Lbkjo;          # NAVIGATION_LOW_LIGHT
                    if-ne p2, v0, :done_bkpd_remap

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_nav_disabled
                    sget-object p2, Lbkjo;->d:Lbkjo;          # NAVIGATION (Day)
                    goto :done_bkpd_remap

                    :bkpd_nav_disabled
                    sget-object p2, Lbkjo;->n:Lbkjo;          # NAVIGATION_LOW_LIGHT (restore)

                    :done_bkpd_remap
                """.trimIndent()
            )
        } catch (ignored: Exception) {}
    }
}