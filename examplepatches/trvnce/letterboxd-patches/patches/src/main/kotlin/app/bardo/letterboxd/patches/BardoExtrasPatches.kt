package app.bardo.letterboxd.patches

import app.bardo.letterboxd.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION_FILE = "extensions/extension.mpe"
private const val HOME_CLASS = "Lapp/bardo/letterboxd/extension/BardoHome;"
private const val FILTER_CLASS = "Lapp/bardo/letterboxd/extension/BardoWatchlistFilter;"

// -------------------------------------------------------------------------------------------------
// Fingerprints
// -------------------------------------------------------------------------------------------------

/** Inicio: `SignedInPopularFilmsFragment.configureVideoStoreProducts(binding)`, una vez por vista. */
internal object PopularConfigureVideoStoreFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/popular/SignedInPopularFilmsFragment;",
    name = "configureVideoStoreProducts",
    returnType = "V",
    parameters = listOf("Lcom/letterboxd/letterboxd/databinding/FragmentSignedInPopularFilmsBinding;"),
)

/** Filtros: la lista de servicios que enseña el filtro «Service». */
internal object FilterGetFilteredServicesFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/activities/filter/FilterViewModel;",
    name = "getFilteredServices",
    returnType = "Ljava/util/List;",
    parameters = listOf(),
)

/** Filtros: el bind de cada fila del filtro «Service» (cabeceras, opciones y servicios). */
internal object FilterServiceBindFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/item/FilterServiceListAdapter;",
    name = "onBindViewHolder",
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "I"),
)

/** La corrutina que pide cada página de una watchlist, con sus parámetros ya montados. */
internal object WatchlistRequestInvokeSuspendFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/api/requester/WatchlistRequester\$getObservableRequest\$1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

// -------------------------------------------------------------------------------------------------
// Parches
// -------------------------------------------------------------------------------------------------

@Suppress("unused")
val bardoRecentlyAddedPatch = bytecodePatch(
    name = "Bardo recently added",
    description = "Añade al inicio una fila «Recién llegado a Bardo» con las últimas películas de " +
        "tu servidor (en el hueco del Video Store). Bardo solo deja ids de TMDB en el puente; los " +
        "pósters son los de Letterboxd. Necesita «Bardo bridge».",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)
    extendWith(EXTENSION_FILE)

    execute {
        // p0 = SignedInPopularFilmsFragment, p1 = FragmentSignedInPopularFilmsBinding
        PopularConfigureVideoStoreFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p1 }, $HOME_CLASS->onHome(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}

@Suppress("unused")
val bardoWatchlistFilterPatch = bytecodePatch(
    name = "Bardo watchlist filter",
    description = "En los filtros de una watchlist, «Service» ofrece Bardo (con su logo): deja solo las películas " +
        "que están en tu servidor (según lo que Bardo deja en el puente). Necesita «Bardo bridge».",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)
    extendWith(EXTENSION_FILE)

    execute {
        // getFilteredServices(): un único return-object al final; se cambia la lista que devuelve.
        val method = FilterGetFilteredServicesFingerprint.method
        val last = method.instructions.lastIndex
        val ret = method.instructions[last]
        if (ret.opcode != Opcode.RETURN_OBJECT) {
            throw PatchException("getFilteredServices ya no acaba en return-object")
        }
        val register = (ret as OneRegisterInstruction).registerA
        method.addInstructions(
            last,
            """
                invoke-static { v$register, p0 }, $FILTER_CLASS->onServices(Ljava/util/List;Ljava/lang/Object;)Ljava/util/List;
                move-result-object v$register
            """,
        )

        // El icono de la fila de Bardo. El adapter carga el de cada servicio con Glide desde una
        // java.net.URL (solo http/https), así que el logo lo pone la extensión a mano. En la rama
        // de ServiceRow.ServiceItem, tras poner nombre, toque y marca de elegido, el original hace:
        //     invoke-virtual {vItem}, ServiceItem->getService()
        //     move-result-object vService
        //     invoke-virtual {vService}, Service->getIcon()      <- se inserta justo antes
        // No se inserta antes de getService() porque esa instrucción es destino de saltos (los
        // saltos conservarían el destino original y se saltarían el enganche). Como no hay
        // registro libre garantizado, se reutiliza vService y, si la fila no es la de Bardo, se
        // vuelve a pedir el servicio antes de seguir.
        val bind = FilterServiceBindFingerprint.method
        val bindInstructions = bind.instructions
        fun referenceAt(index: Int) =
            (bindInstructions.getOrNull(index) as? ReferenceInstruction)?.reference?.toString()

        val getService =
            "Lcom/letterboxd/letterboxd/ui/item/ServiceRow\$ServiceItem;->getService()Lcom/letterboxd/api/model/Service;"
        val getBinding =
            "Lcom/letterboxd/letterboxd/ui/item/FilterServiceListAdapter\$CheckmarkViewHolder;->" +
                "getBinding()Lcom/letterboxd/letterboxd/databinding/ItemCheckRowBinding;"
        val iconIndex = bindInstructions.indices.firstOrNull {
            referenceAt(it) == "Lcom/letterboxd/api/model/Service;->getIcon()Ljava/net/URL;"
        } ?: throw PatchException("FilterServiceListAdapter ya no lee Service.getIcon()")
        if (referenceAt(iconIndex - 2) != getService ||
            bindInstructions[iconIndex - 1].opcode != Opcode.MOVE_RESULT_OBJECT
        ) {
            throw PatchException("FilterServiceListAdapter: la rama de ServiceItem ha cambiado")
        }
        val itemRegister = (bindInstructions[iconIndex - 2] as FiveRegisterInstruction).registerC
        val serviceRegister = (bindInstructions[iconIndex - 1] as OneRegisterInstruction).registerA
        val holderIndex = (iconIndex downTo 0).firstOrNull { referenceAt(it) == getBinding }
            ?: throw PatchException("FilterServiceListAdapter: no se encuentra el ViewHolder")
        val holderRegister = (bindInstructions[holderIndex] as FiveRegisterInstruction).registerC
        bind.addInstructionsWithLabels(
            iconIndex,
            """
                invoke-static { v$holderRegister, v$itemRegister }, $FILTER_CLASS->onBindService(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$serviceRegister
                if-eqz v$serviceRegister, :native
                return-void
                :native
                invoke-virtual { v$itemRegister }, $getService
                move-result-object v$serviceRegister
            """,
        )

        // p0 = la corrutina; su campo $request son los parámetros de la página que va a pedir.
        WatchlistRequestInvokeSuspendFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $FILTER_CLASS->onRequest(Ljava/lang/Object;)V",
        )
    }
}
