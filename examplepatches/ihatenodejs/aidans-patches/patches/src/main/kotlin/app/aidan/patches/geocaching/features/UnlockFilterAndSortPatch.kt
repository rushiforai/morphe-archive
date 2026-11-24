package app.aidan.patches.geocaching.features

import app.aidan.patches.geocaching.shared.COMPATIBILITY_GEOCACHING
import app.aidan.patches.geocaching.shared.patchAllPremiumChecksToValue
import app.aidan.patches.geocaching.shared.patchIncludeOwnedDisabledCachesToNull
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
val unlockFilterAndSortPatch = bytecodePatch(
    name = "Unlock Cache Filter and Sorting Tools",
    description = "Unlocks advanced cache search filters and sorting options without prompting for Geocaching Premium.",
    default = true
) {
    category("Features")
    compatibleWith(COMPATIBILITY_GEOCACHING)
    extendWith("extensions/extension.mpe")

    execute {
        patchMapFilterButtons()
        patchFilterViewModel()
        patchFilterScreenDialog()
        patchSortingTools()
        patchFilterPreferences()
        patchCacheTypesOmission()
        patchMapRenderingFilter()
        patchSharedMapViewModel()
        patchMapLibreFragmentOnResume()
    }
}

/**
 * Bypasses the Premium upsell when clicking the map screen top-right filter button,
 * opening the filter navigation graph directly.
 */
private fun BytecodePatchContext.patchMapFilterButtons() {
    // 1. GoogleMapFragment menu selection handler (e.smali)
    val googleMapMenuClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/mainmap/map/e;")
        ?: throw PatchException("GoogleMapFragment menu handler (e) not found")

    val googleMapMenuMethod = googleMapMenuClass.methods.firstOrNull {
        it.name == "c" && it.implementation != null && it.parameterTypes == listOf("Landroid/view/MenuItem;")
    } ?: throw PatchException("GoogleMapFragment menu handler c(MenuItem) not found")

    patchAllPremiumChecksToValue(googleMapMenuMethod, "GoogleMapFragment menu handler (e.c)", value = true)

    // 2. MapLibreFragment menu selection handler (k.smali)
    val mapLibreMenuClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/mainmap/map/k;")
        ?: throw PatchException("MapLibreFragment menu handler (k) not found")

    val mapLibreMenuMethod = mapLibreMenuClass.methods.firstOrNull {
        it.name == "c" && it.implementation != null && it.parameterTypes == listOf("Landroid/view/MenuItem;")
    } ?: throw PatchException("MapLibreFragment menu handler c(MenuItem) not found")

    patchAllPremiumChecksToValue(mapLibreMenuMethod, "MapLibreFragment menu handler (k.c)", value = true)
}

/**
 * Unlocks all 12 filter categories in FilterViewModel (cache types, sizes, difficulty,
 * terrain, attributes, favorite points, placed dates, found, and owned filters).
 */
private fun BytecodePatchContext.patchFilterViewModel() {
    val filterVmClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/geocachefilter/FilterViewModel;")
        ?: throw PatchException("FilterViewModel not found")

    val eMethod = filterVmClass.methods.firstOrNull {
        it.name == "e" && it.implementation != null && it.returnType == "Ljava/util/ArrayList;"
    } ?: throw PatchException("FilterViewModel.e not found")

    patchAllPremiumChecksToValue(eMethod, "FilterViewModel.e", value = true)

    // PopulatePrefs coroutine flow
    val populatePrefsClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/geocachefilter/FilterViewModel\$populatePrefs\$1;")
    if (populatePrefsClass != null) {
        val invokeSuspendMethod = populatePrefsClass.methods.firstOrNull {
            it.name == "invokeSuspend" && it.implementation != null
        }
        if (invokeSuspendMethod != null) {
            patchAllPremiumChecksToValue(invokeSuspendMethod, "FilterViewModel\$populatePrefs\$1.invokeSuspend", value = true)
        }
    }
}

/**
 * Neutralizes any remaining upsell dialog clicks in FilterScreen.
 */
private fun BytecodePatchContext.patchFilterScreenDialog() {
    // The click handler is an anonymous DialogInterface.OnClickListener in the filter surface that
    // launches PremiumUpsellActivity with source "Filter" (was Ljk3; in 10.21.0, now Lap3;).
    val dialogListenerClass = mutableClassDefByOrNull("Lap3;")
        ?: getAllClassesWithString("Filter")
            .map { mutableClassDefBy(it) }
            .firstOrNull { cls ->
                cls.interfaces.any { it == "Landroid/content/DialogInterface\$OnClickListener;" } &&
                    cls.methods.any { method ->
                        method.name == "onClick" &&
                            method.implementation?.instructions?.any { inst ->
                                (inst as? ReferenceInstruction)?.reference?.toString()
                                    ?.contains("premium/upsell/PremiumUpsellActivity") == true
                            } == true
                    }
            }
        ?: return
    val onClickMethod = dialogListenerClass.methods.firstOrNull {
        it.name == "onClick" && it.implementation != null && it.parameterTypes == listOf("Landroid/content/DialogInterface;", "I")
    } ?: return

    onClickMethod.addInstructions(
        0,
        """
        invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
        return-void
        """.trimIndent()
    )
}

/**
 * Unlocks list view and GeoTour sorting options, displaying the sortByDialog without
 * prompting for Geocaching Premium.
 */
private fun BytecodePatchContext.patchSortingTools() {
    // 1. GeocacheListFragment sorting listener (was Lkb4;, now Llg4;)
    val listSortClass = mutableClassDefByOrNull("Llg4;")
        ?: throw PatchException("GeocacheListFragment sort listener (Llg4;) not found")

    val invokeMethod = listSortClass.methods.firstOrNull {
        it.name == "invoke" && it.implementation != null && it.parameterTypes.isEmpty()
    } ?: throw PatchException("GeocacheListFragment sort listener invoke() not found")

    patchAllPremiumChecksToValue(invokeMethod, "GeocacheListFragment sort listener (Llg4;.invoke)", value = true)

    // 2. GeoTour sorting presenter (was Lhf4;.p()Lszb;, now Ldk4;.p()Lkec;)
    val geoTourSortClass = mutableClassDefByOrNull("Ldk4;")
    if (geoTourSortClass != null) {
        val pMethod = geoTourSortClass.methods.firstOrNull {
            it.name == "p" && it.implementation != null && it.returnType == "Lkec;"
        }
        if (pMethod != null) {
            patchAllPremiumChecksToValue(pMethod, "GeoTour sort presenter (Ldk4;.p)", value = true)
        }
    }
}

/**
 * Unlocks FilterPreferences (Lto3;) so that saved user filter criteria (cache types, sizes,
 * difficulty, terrain, attributes, favorite points, found, owned, etc.) are actually loaded into the
 * filter-preference value object (Lso3;) and applied to the map, while nulling out
 * `includeOwnedDisabledCaches` to avoid HTTP 403 Forbidden on the server.
 */
private fun BytecodePatchContext.patchFilterPreferences() {
    // 1. FilterPreferences (was Ldk3;, now Lto3;)
    val filterPrefsClass = mutableClassDefByOrNull("Lto3;")
        ?: throw PatchException("FilterPreferences (Lto3;) not found")

    // Force the premium check in h() so saved preferences are loaded instead of empty defaults
    val hMethod = filterPrefsClass.methods.firstOrNull {
        it.name == "h" && it.returnType == "Lso3;" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("FilterPreferences.h()Lso3; not found")
    patchAllPremiumChecksToValue(hMethod, "FilterPreferences.h", value = true)

    // Null out includeOwnedDisabledCaches so map search avoids HTTP 403 Forbidden
    patchIncludeOwnedDisabledCachesToNull(hMethod)
    sanitizeFilterModelInPlace(hMethod)

    // Force the premium check in b() so saved attributes are loaded instead of EmptyList
    val bMethod = filterPrefsClass.methods.firstOrNull {
        it.name == "b" && it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("FilterPreferences.b not found")
    patchAllPremiumChecksToValue(bMethod, "FilterPreferences.b", value = true)
}

/**
 * In the map/list search query-parameter builder (Lwk0;.invoke), drops the `cacheTypes` value so
 * the parameter is omitted. `Lwa4;->a(List, String, Object)` skips null values.
 *
 * This is the 10.24.0 equivalent of the old cz9.a cacheTypes omission and prevents the Geocaching
 * server from rejecting basic-account searches that include premium cache types.
 */
private fun BytecodePatchContext.patchCacheTypesOmission() {
    val paramBuilder = mutableClassDefByOrNull("Lwk0;")
        ?: getAllClassesWithString("cacheTypes")
            .map { mutableClassDefBy(it) }
            .firstOrNull { cls ->
                cls.methods.any { method ->
                    method.name == "invoke" &&
                        method.implementation?.instructions?.any { inst ->
                            (inst as? ReferenceInstruction)?.reference
                                ?.toString()?.contains("Laj4;->b:Ljava/util/List;") == true
                        } == true
                }
            }
        ?: return

    val invokeMethod = paramBuilder.methods.firstOrNull {
        it.name == "invoke" && it.implementation != null
    } ?: return

    val instructions = invokeMethod.implementation!!.instructions.toList()
    val cacheTypesIdx = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.CONST_STRING &&
            ((inst as? ReferenceInstruction)?.reference as? StringReference)?.string == "cacheTypes"
    }
    if (cacheTypesIdx == -1) return

    val addCallIdx = cacheTypesIdx + 1
    val addCall = instructions.getOrNull(addCallIdx) as? FiveRegisterInstruction ?: return
    val valueReg = addCall.registerE
    val alreadyPatched = instructions.getOrNull(addCallIdx - 2)?.opcode == Opcode.CONST_16 &&
        (instructions.getOrNull(addCallIdx - 2) as? OneRegisterInstruction)?.registerA == valueReg
    if (!alreadyPatched) {
        invokeMethod.addInstructions(addCallIdx, "const/16 v$valueReg, 0x0")
    }
}

/**
 * Injects `GeocacheFilterBridge.sanitizeFilterModel` before the filter preferences value object is
 * returned, nulling inactive toggles that make basic-account map searches fail with HTTP 403.
 */
private fun BytecodePatchContext.sanitizeFilterModelInPlace(method: MutableMethod) {
    val impl = method.implementation ?: return
    val instructions = impl.instructions.toList()
    val alreadyPatched = instructions.any { inst ->
        (inst as? ReferenceInstruction)?.reference?.toString()?.contains("sanitizeFilterModel") == true
    }
    if (alreadyPatched) return

    val returnIdx = (0 until instructions.size).firstOrNull { i ->
        val inst = instructions[i]
        inst.opcode == Opcode.RETURN_OBJECT &&
            (
                instructions.getOrNull(i - 1)?.opcode == Opcode.INVOKE_DIRECT_RANGE ||
                    instructions.getOrNull(i - 1)?.opcode == Opcode.INVOKE_DIRECT
                )
    } ?: -1
    if (returnIdx == -1) return

    val reg = (instructions[returnIdx] as OneRegisterInstruction).registerA
    method.addInstructions(
        returnIdx,
        """
        invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheFilterBridge;->sanitizeFilterModel(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$reg
        check-cast v$reg, Lso3;
        """.trimIndent()
    )
}

/**
 * In MapRendering.e (com.groundspeak.geocaching.intro.map.rendering.a.e), filters map items
 * against the user's active filter criteria before generating pins for the map.
 */
private fun BytecodePatchContext.patchMapRenderingFilter() {
    val mapRenderingClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/map/rendering/a;")
        ?: throw PatchException("Map rendering class (a) not found")

    val eMethod = mapRenderingClass.methods.firstOrNull {
        it.name == "e" &&
            it.implementation != null &&
            it.parameterTypes.firstOrNull() == "Ljava/util/List;" &&
            it.parameterTypes.getOrNull(1) == "Ldic;"
    } ?: throw PatchException("a.e(List, dic, ...) not found")

    eMethod.addInstructions(
        0,
        """
        invoke-static/range {p0 .. p0}, Lapp/aidan/extension/geocaching/GeocacheFilterBridge;->filterMapItems(Ljava/util/List;)Ljava/util/List;
        move-result-object p0
        """.trimIndent()
    )
}

/**
 * In SharedMapViewModel:
 * 1. trySearching$1 / trySearching$2: filters map items emitted to the `s0` pin flow loaded from
 *    the Room database and after network search.
 * 2. reloadPins$1: reapplies active filters on filter change.
 * 3. refreshFilteredState$1: triggers reloadPins (`v()`) whenever filter state is refreshed.
 */
private fun BytecodePatchContext.patchSharedMapViewModel() {
    // 1. trySearching$1 / trySearching$2: filter the list emitted to SharedMapViewModel.s0
    patchFilteredEmission(
        "Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel\$trySearching\$1;",
        "updateAndFilterMapItems"
    )
    patchFilteredEmission(
        "Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel\$trySearching\$2;",
        "updateAndFilterMapItems"
    )

    // 2. reloadPins$1
    val reloadPinsClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel\$reloadPins\$1;")
    if (reloadPinsClass != null) {
        val invokeSuspendMethod = reloadPinsClass.methods.firstOrNull {
            it.name == "invokeSuspend" && it.implementation != null
        }
        if (invokeSuspendMethod != null) {
            val instructions = invokeSuspendMethod.implementation!!.instructions.toList()
            val nCalls = instructions.indices.filter { idx ->
                val inst = instructions[idx]
                inst.opcode == Opcode.INVOKE_VIRTUAL &&
                    (inst as? ReferenceInstruction)?.reference?.toString()?.contains("Lkotlinx/coroutines/flow/n;->n(Ljava/lang/Object;)V") == true
            }
            if (nCalls.size >= 2) {
                val secondCallIdx = nCalls[1]
                val reg = (instructions[secondCallIdx] as? FiveRegisterInstruction)?.registerD
                    ?: (instructions[secondCallIdx] as? RegisterRangeInstruction)?.let { it.startRegister + 1 }
                    ?: 0
                invokeSuspendMethod.addInstructions(
                    secondCallIdx,
                    """
                    invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheFilterBridge;->reapplyFilters(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$reg
                    """.trimIndent()
                )
            }
        }
    }

    // 4. refreshFilteredState$1
    val refreshFilteredClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel\$refreshFilteredState\$1;")
    if (refreshFilteredClass != null) {
        val invokeSuspendMethod = refreshFilteredClass.methods.firstOrNull {
            it.name == "invokeSuspend" && it.implementation != null
        }
        if (invokeSuspendMethod != null) {
            val instructions = invokeSuspendMethod.implementation!!.instructions.toList()
            for ((idx, inst) in instructions.withIndex()) {
                if (inst.opcode == Opcode.INVOKE_VIRTUAL) {
                    val ref = (inst as? ReferenceInstruction)?.reference?.toString() ?: ""
                    if (ref.contains("Lkotlinx/coroutines/flow/n;->o(Ljava/lang/Object;Ljava/lang/Object;)Z")) {
                        invokeSuspendMethod.addInstructions(
                            idx + 1,
                            """
                            iget-object p1, p0, Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel${'$'}refreshFilteredState${'$'}1;->D:Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel;
                            invoke-virtual {p1}, Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel;->v()V
                            """.trimIndent()
                        )
                        break
                    }
                }
            }
        }
    }
}

/**
 * Filters the map-item list that a SharedMapViewModel coroutine emits to its `s0` state flow.
 * In 10.24.0 the view model publishes pins through `s0` (`flow.n.n`) instead of the old `p0` flow.
 */
private fun BytecodePatchContext.patchFilteredEmission(className: String, bridgeMethod: String) {
    val lambdaClass = mutableClassDefByOrNull(className) ?: return
    val invokeSuspendMethod = lambdaClass.methods.firstOrNull {
        it.name == "invokeSuspend" && it.implementation != null
    } ?: return

    val instructions = invokeSuspendMethod.implementation!!.instructions.toList()
    for (idx in instructions.indices) {
        val inst = instructions[idx]
        if (inst.opcode != Opcode.INVOKE_VIRTUAL) continue

        val ref = (inst as? ReferenceInstruction)?.reference?.toString() ?: ""
        if (!ref.contains("Lkotlinx/coroutines/flow/n;->n(Ljava/lang/Object;)V")) continue

        val prevRef = (instructions.getOrNull(idx - 1) as? ReferenceInstruction)?.reference?.toString() ?: ""
        if (!prevRef.contains("SharedMapViewModel;->s0:")) continue

        val reg = (inst as? FiveRegisterInstruction)?.registerD
            ?: (inst as? RegisterRangeInstruction)?.let { it.startRegister + 1 }
            ?: return
        invokeSuspendMethod.addInstructions(
            idx,
            """
            invoke-static {v$reg}, Lapp/aidan/extension/geocaching/GeocacheFilterBridge;->$bridgeMethod(Ljava/util/List;)Ljava/util/List;
            move-result-object v$reg
            """.trimIndent()
        )
        return
    }
}

/**
 * In MapLibreFragment.onResume, triggers SharedMapViewModel.v() (reloadPins)
 * so that when returning from FilterNavHostActivity, MapLibre reloads pins with newly applied filters.
 */
private fun BytecodePatchContext.patchMapLibreFragmentOnResume() {
    val mapLibreClass = mutableClassDefByOrNull("Lcom/groundspeak/geocaching/intro/mainmap/map/MapLibreFragment;")
        ?: throw PatchException("MapLibreFragment not found")

    val onResumeMethod = mapLibreClass.methods.firstOrNull {
        it.name == "onResume" && it.implementation != null && it.parameterTypes.isEmpty()
    } ?: throw PatchException("MapLibreFragment.onResume not found")

    val instructions = onResumeMethod.implementation!!.instructions.toList()
    val superCallIdx = instructions.indexOfFirst { inst ->
        inst.opcode == Opcode.INVOKE_SUPER &&
            (inst as? ReferenceInstruction)?.reference?.toString()?.contains("onResume") == true
    }
    if (superCallIdx != -1) {
        onResumeMethod.addInstructions(
            superCallIdx + 1,
            """
            invoke-virtual {p0}, Lcom/groundspeak/geocaching/intro/mainmap/map/MapLibreFragment;->w()Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel;
            move-result-object v0
            invoke-virtual {v0}, Lcom/groundspeak/geocaching/intro/mainmap/map/SharedMapViewModel;->v()V
            """.trimIndent()
        )
    }
}
