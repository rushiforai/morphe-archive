package org.ungoogled.patches.maps.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Target 2: Night Mode State Publisher (anth.a(Z)V)
 */
object NightModeRepositoryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Z"),
    returnType = "V",
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = "Ljava/lang/Boolean;", name = "valueOf")
    )
)

/**
 * Target 3: Protobuf Style Converter (bkjo / bjko)
 */
object StyleConverterFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        filters = listOf(
            string("{"),
            string(", "),
            string("}")
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("L"),
    returnType = "L",
    filters = listOf(
        opcode(Opcode.PACKED_SWITCH)
    )
)

/**
 * Target 4: Map Style Config Provider (bknb)
 */
object MapStyleConfigFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf(
            "SATELLITE_HYBRID",
            "NAVIGATION_LOW_LIGHT",
            "TRANSIT_FOCUSED"
        )
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Z"),
    returnType = "L",
    filters = listOf(
        opcode(Opcode.IF_EQZ),
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        opcode(Opcode.RETURN_OBJECT)
    )
)

/**
 * Target 5: Paint Table Substitution Registry (bkpd / bkpd.i)
 */
object PaintTableRegistryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("I", "L", "L"),
    returnType = "Z",
    filters = listOf(
        string("Legend urls not found (getTableUrl) for epoch = %s, legend = %s")
    )
)

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

        // --- TARGET 2: Night Mode Repository Setter (anth.a(Z)V) ---
        try {
            NightModeRepositoryFingerprint.method.addInstructions(
                0,
                """
                    if-eqz p1, :anth_done

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p1
                    if-eqz p1, :anth_disabled

                    const/4 p1, 0x0
                    goto :anth_done

                    :anth_disabled
                    const/4 p1, 0x1

                    :anth_done
                """.trimIndent()
            )
        } catch (ignored: Exception) {}

        // --- TARGET 3: Intercept Protobuf Style Converter (bkjo) ---
        try {
            StyleConverterFingerprint.method.addInstructions(
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
                    if-ne p0, v0, :check_ciar_terrain_vector
                    sget-object p0, Lciar;->Y:Lciar;          # ROUTE_OVERVIEW (Day)
                    goto :done_ciar_remap

                    :check_ciar_terrain_vector
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

        // --- TARGET 4: Register-safe hook in MapStyleConfigFingerprint (bknb.a(Z)) ---
        try {
            MapStyleConfigFingerprint.method.addInstructions(
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

        // --- TARGET 5: Register-safe hook in PaintTableRegistryFingerprint (bkpd.i) ---
        try {
            val bkjoType = StyleConverterFingerprint.originalClassDef.type

            PaintTableRegistryFingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, $bkjoType->b:$bkjoType          # ROADMAP_DARK
                    if-ne p2, v0, :check_bkpd_overview

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_roadmap_disabled
                    sget-object p2, $bkjoType->a:$bkjoType          # ROADMAP (Day)
                    goto :done_bkpd_remap

                    :bkpd_roadmap_disabled
                    sget-object p2, $bkjoType->b:$bkjoType          # ROADMAP_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_overview
                    sget-object v0, $bkjoType->B:$bkjoType          # ROUTE_OVERVIEW_DARK
                    if-ne p2, v0, :check_bkpd_terrain

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_overview_disabled
                    sget-object p2, $bkjoType->A:$bkjoType          # ROUTE_OVERVIEW (Day)
                    goto :done_bkpd_remap

                    :bkpd_overview_disabled
                    sget-object p2, $bkjoType->B:$bkjoType          # ROUTE_OVERVIEW_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_terrain
                    sget-object v0, $bkjoType->F:$bkjoType          # TERRAIN_VECTOR_CLIENT_DARK
                    if-ne p2, v0, :check_bkpd_transit

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_terrain_disabled
                    sget-object p2, $bkjoType->E:$bkjoType          # TERRAIN_VECTOR_CLIENT (Day)
                    goto :done_bkpd_remap

                    :bkpd_terrain_disabled
                    sget-object p2, $bkjoType->F:$bkjoType          # TERRAIN_VECTOR_CLIENT_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_transit
                    sget-object v0, $bkjoType->H:$bkjoType          # TRANSIT_FOCUSED_DARK
                    if-ne p2, v0, :check_bkpd_nav

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_transit_disabled
                    sget-object p2, $bkjoType->G:$bkjoType          # TRANSIT_FOCUSED (Day)
                    goto :done_bkpd_remap

                    :bkpd_transit_disabled
                    sget-object p2, $bkjoType->H:$bkjoType          # TRANSIT_FOCUSED_DARK (restore)
                    goto :done_bkpd_remap

                    :check_bkpd_nav
                    sget-object v0, $bkjoType->n:$bkjoType          # NAVIGATION_LOW_LIGHT
                    if-ne p2, v0, :done_bkpd_remap

                    invoke-static {}, Lrhubarbshoelaces/patches/maps/extension/ThemeHelper;->isHybridThemeEnabled()Z
                    move-result p2
                    if-eqz p2, :bkpd_nav_disabled
                    sget-object p2, $bkjoType->d:$bkjoType          # NAVIGATION (Day)
                    goto :done_bkpd_remap

                    :bkpd_nav_disabled
                    sget-object p2, $bkjoType->n:$bkjoType          # NAVIGATION_LOW_LIGHT (restore)

                    :done_bkpd_remap
                """.trimIndent()
            )
        } catch (ignored: Exception) {}
    }
}