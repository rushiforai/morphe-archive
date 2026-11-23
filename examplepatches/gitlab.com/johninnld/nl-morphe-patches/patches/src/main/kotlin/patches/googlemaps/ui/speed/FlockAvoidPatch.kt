package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

private const val STEER = "Lorg/ungoogled/ui/Steer;"
private const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
private const val LISTENABLE_FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"

/** The directions request builder (classes5.dex) and the request parameters it reads. */
private const val BUILDER = "Lxnb;"
private const val PARAMS = "Lyed;"
/** The directions fetcher (DirectionsFetcherImpl), a request, an answer, a trip and its travel mode. */
private const val FETCHER = "Lwan;"
/** The directions request controller (RequestTriggeringControllerImpl) and its request records. */
private const val CONTROLLER = "Lwrb;"
private const val REQUEST_RECORD = "Lwpw;"
/** The directions screen's request session (its controller is g) and the request record factory. */
private const val SESSION = "Lwqr;"
private const val RECORD_FACTORY = "Lwqq;"
private const val REQUEST = "Lcqkc;"
private const val REQUEST_BODY = "Lcqju;"
private const val RESPONSE = "Lybn;"
private const val TRIP = "Lcqsl;"
private const val TRIP_MODE = "Lcjdw;"
/** A route's points, one point (b() latitude, d() longitude), a position in degrees, a pass-through point. */
private const val POLYLINE = "Lbjpp;"
private const val POINT = "Lbjpk;"
private const val LAT_LNG = "Lbjpd;"
private const val VIA = "Lydh;"

/** The register of parameter [index] (0 = this) of an instance method. */
private fun MutableMethod.parameterRegister(index: Int): Int {
    val sizes = listOf(1) + parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return implementation!!.registerCount - sizes.sum() + sizes.take(index).sum()
}

/**
 * The hooks Avoid Flock cameras works through: Maps' directions request builder reads its (always empty)
 * pass-through list through Steer.vias(); the directions fetcher reports every answer it gets
 * (Steer.response); the directions screen reports its request session as it starts (Steer.session),
 * whose controller can ask again; and the extension's stubs are written against Maps' request, answer
 * and controller classes.
 */
internal val steerHookPatch = bytecodePatch(
    description = "Lets the extension add pass-through points to directions requests.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        // 26.47 renames the whole directions chain; keep the 26.44 values as the default.
        val is2647 = packageMetadata.versionName == "26.47.00.1022347503"
        val BUILDER_A = if (is2647) "Lxqc;" else BUILDER
        val PARAMS_A = if (is2647) "Lyhi;" else PARAMS
        val FETCHER_A = if (is2647) "Lwav;" else FETCHER
        val CONTROLLER_A = if (is2647) "Lwss;" else CONTROLLER
        val REQUEST_RECORD_A = if (is2647) "Lwrm;" else REQUEST_RECORD
        val SESSION_A = if (is2647) "Lwsi;" else SESSION
        val RECORD_FACTORY_A = if (is2647) "Lwsh;" else RECORD_FACTORY
        val REQUEST_A = if (is2647) "Lcqwk;" else REQUEST
        val REQUEST_BODY_A = if (is2647) "Lcqwc;" else REQUEST_BODY
        val RESPONSE_A = if (is2647) "Lyer;" else RESPONSE
        val TRIP_A = if (is2647) "Lcres;" else TRIP
        val TRIP_MODE_A = if (is2647) "Lcjqs;" else TRIP_MODE
        val POLYLINE_A = if (is2647) "Lbjws;" else POLYLINE
        val POINT_A = if (is2647) "Lbjwm;" else POINT
        val LAT_LNG_A = if (is2647) "Lbjwf;" else LAT_LNG
        val VIA_A = if (is2647) "Lygl;" else VIA
        val OPTIONS_A = if (is2647) "Lcqwh;" else "Lcqjz;"
        val OPTIONS_BODY_A = if (is2647) "Lcjqm;" else "Lcjfo;"
        val BODY_LIST_A = if (is2647) "Lcnou;" else "Lcncl;"
        val SESSION_KEY_A = if (is2647) "Layuh;" else "Layje;"
        // The request builder: its loop over the parameters' pass-through list.
        val builder = (mutableClassDefBy(BUILDER_A).methods.singleOrNull {
            it.name == "d" && it.returnType == (if (is2647) "Lcnnx;" else "Lcnbo;") &&
                it.parameterTypes.map { t -> t.toString() } ==
                (if (is2647) listOf(PARAMS_A, "Lcqwq;", "Ljava/util/List;", "Lcqwi;", "Z")
                else listOf(PARAMS_A, "Lcqki;", "Ljava/util/List;", "Lcqka;", "Z"))
        }) ?: throw PatchException("steer: request builder not found")
        val read = builder.implementation!!.instructions.withIndex().filter { (_, i) ->
            i.opcode == Opcode.IGET_OBJECT && ((i as ReferenceInstruction).reference as FieldReference).let {
                it.definingClass == PARAMS_A && it.name == "k" && it.type == IMMUTABLE_LIST
            }
        }.singleOrNull() ?: throw PatchException("request builder no longer reads the pass-through list once")
        val target = (read.value as TwoRegisterInstruction).registerA
        val params = (read.value as TwoRegisterInstruction).registerB
        builder.addInstructions(
            read.index + 1,
            """
                invoke-static { v$params, v$target }, $STEER->vias(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$target
                check-cast v$target, $IMMUTABLE_LIST
            """,
        )

        // The directions screen's onStart starts its request session with wou.b(aydc), prefetched or not.
        val sessionStart = (mutableClassDefBy(SESSION_A).methods.singleOrNull {
            it.name == "b" && it.returnType == "V" && it.parameterTypes.map { t -> t.toString() } == listOf(SESSION_KEY_A)
        }) ?: throw PatchException("steer: session start b($SESSION_KEY_A) not found in $SESSION_A")
        val sessionRegister = sessionStart.parameterRegister(0)
        sessionStart.addInstructions(
            0,
            "invoke-static/range { v$sessionRegister .. v$sessionRegister }, $STEER->session(Ljava/lang/Object;)V",
        )
        // Every answer, online and offline, prefetched or not, passes the fetcher's f(request, answer, z).
        val answer = (mutableClassDefBy(FETCHER_A).methods.singleOrNull {
            it.name == "f" && it.returnType == LISTENABLE_FUTURE &&
                it.parameterTypes.map { t -> t.toString() } == listOf(REQUEST_A, RESPONSE_A, "Z")
        }) ?: throw PatchException("steer: answer callback not found in $FETCHER_A")
        val self = answer.parameterRegister(0)
        answer.addInstructions(
            0,
            "invoke-static/range { v$self .. v${self + 2} }, " +
                "$STEER->response(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        // The extension's stubs, written against Maps' classes.
        val steer = mutableClassDefBy(STEER)
        fun replace(name: String, parameters: List<String>, returnType: String, registers: Int, smali: String) {
            steer.methods.remove(steer.methods.singleOrNull { it.name == name }
                ?: throw PatchException("steer: extension stub $name missing"))
            steer.methods.add(
                ImmutableMethod(
                    STEER, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
                    AccessFlags.STATIC.value, null, null, MutableMethodImplementation(registers),
                ).toMutable().apply { addInstructions(0, smali) },
            )
        }
        replace(
            "counts", listOf("Ljava/lang/Object;"), "[I", 6,
            """
                check-cast p0, $REQUEST_A
                iget-object v0, p0, $REQUEST_A->c:$REQUEST_BODY_A
                if-eqz v0, :none
                iget-object v1, v0, $REQUEST_BODY_A->e:$BODY_LIST_A
                invoke-interface { v1 }, Ljava/util/List;->size()I
                move-result v1
                iget-object v2, v0, $REQUEST_BODY_A->k:$BODY_LIST_A
                invoke-interface { v2 }, Ljava/util/List;->size()I
                move-result v2
                const/4 v3, 0x2
                new-array v3, v3, [I
                const/4 v4, 0x0
                aput v1, v3, v4
                const/4 v4, 0x1
                aput v2, v3, v4
                return-object v3
                :none
                const/4 v3, 0x0
                return-object v3
            """,
        )
        replace(
            "via", listOf("D", "D", "I"), "Ljava/lang/Object;", 7,
            """
                new-instance v0, $LAT_LNG_A
                invoke-direct { v0, p0, p1, p2, p3 }, $LAT_LNG_A-><init>(DD)V
                ${if (is2647) "const/16 v1, 0xc8" else ""}
                invoke-static { v0, p4${if (is2647) ", v1" else ""} }, $VIA_A->a($LAT_LNG_A${if (is2647) "II" else "I"})$VIA_A
                move-result-object v0
                return-object v0
            """,
        )
        replace(
            "waypoints", listOf("Ljava/lang/Object;"), "Ljava/util/List;", 2,
            """
                check-cast p0, $PARAMS_A
                iget-object v0, p0, $PARAMS_A->j:$IMMUTABLE_LIST
                return-object v0
            """,
        )
        replace(
            "requestMode", listOf("Ljava/lang/Object;"), "I", 2,
            """
                check-cast p0, $PARAMS_A
                iget-object v0, p0, $PARAMS_A->a:$OPTIONS_A
                if-eqz v0, :none
                iget-object v0, v0, $OPTIONS_A->f:$OPTIONS_BODY_A
                if-eqz v0, :none
                iget v0, v0, $OPTIONS_BODY_A->c:I
                return v0
                :none
                const/4 v0, -0x1
                return v0
            """,
        )
        replace(
            "immutable", listOf("Ljava/util/List;"), "Ljava/lang/Object;", 1,
            """
                invoke-static { p0 }, $IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST
                move-result-object p0
                return-object p0
            """,
        )
        replace(
            "tripCount", listOf("Ljava/lang/Object;"), "I", 2,
            """
                check-cast p0, $RESPONSE_A
                invoke-virtual { p0 }, $RESPONSE_A->c()I
                move-result v0
                return v0
            """,
        )
        replace(
            "tripMode", listOf("Ljava/lang/Object;", "I"), "I", 3,
            """
                check-cast p0, $RESPONSE_A
                invoke-virtual { p0, p1 }, $RESPONSE_A->x(I)$TRIP_A
                move-result-object v0
                invoke-virtual { v0 }, $TRIP_A->A()$TRIP_MODE_A
                move-result-object v0
                iget v0, v0, $TRIP_MODE_A->c:I
                return v0
            """,
        )
        replace(
            "polyline", listOf("Ljava/lang/Object;", "I"), "[D", 11,
            """
                check-cast p0, $RESPONSE_A
                invoke-virtual { p0, p1 }, $RESPONSE_A->x(I)$TRIP_A
                move-result-object v0
                invoke-virtual { p0, v0 }, $RESPONSE_A->y($TRIP_A)$POLYLINE_A
                move-result-object v1
                if-eqz v1, :none
                invoke-virtual { v1 }, $POLYLINE_A->g()I
                move-result v2
                mul-int/lit8 v3, v2, 0x2
                new-array v3, v3, [D
                const/4 v4, 0x0
                :loop
                if-ge v4, v2, :done
                invoke-virtual { v1, v4 }, $POLYLINE_A->n(I)$POINT_A
                move-result-object v5
                invoke-virtual { v5 }, $POINT_A->b()D
                move-result-wide v6
                mul-int/lit8 v8, v4, 0x2
                aput-wide v6, v3, v8
                invoke-virtual { v5 }, $POINT_A->d()D
                move-result-wide v6
                add-int/lit8 v8, v8, 0x1
                aput-wide v6, v3, v8
                add-int/lit8 v4, v4, 0x1
                goto :loop
                :done
                return-object v3
                :none
                const/4 v3, 0x0
                return-object v3
            """,
        )
        replace(
            "sessionActive", listOf("Ljava/lang/Object;"), "Z", 3,
            """
                check-cast p0, $SESSION_A
                iget-object v0, p0, $SESSION_A->g:$CONTROLLER_A
                if-eqz v0, :no
                iget-object v1, v0, $CONTROLLER_A->k:$SESSION_KEY_A
                if-eqz v1, :no
                const/4 v0, 0x1
                return v0
                :no
                const/4 v0, 0x0
                return v0
            """,
        )
        // What Maps does when a route option changes (RequestTriggeringControllerImpl.onDirectionsOptionsUpdate):
        // the controller wpf issues a type-3 (OPTIONS_CHANGED) record for its session key wpf.k. Its
        // issueDirectionsRequestInternal starts a fresh fetcher and listener, so the screen shows the answer.
        replace(
            "refetch", listOf("Ljava/lang/Object;"), "V", 4,
            """
                check-cast p0, $SESSION_A
                iget-object v0, p0, $SESSION_A->g:$CONTROLLER_A
                if-eqz v0, :none
                iget-object v1, v0, $CONTROLLER_A->k:$SESSION_KEY_A
                if-eqz v1, :none
                iget-object v2, v0, $CONTROLLER_A->d:$RECORD_FACTORY_A
                invoke-virtual { v2, v1 }, $RECORD_FACTORY_A->d($SESSION_KEY_A)$REQUEST_RECORD_A
                move-result-object v2
                invoke-virtual { v0, v2 }, $CONTROLLER_A->c($REQUEST_RECORD_A)V
                :none
                return-void
            """,
        )
    }
}

@Suppress("unused")
val flockAvoidPatch = bytecodePatch(
    name = "Avoid Flock cameras",
    description = "Steers driving directions around Flock cameras: when Google's route passes one, a camera-free " +
        "way is worked out with BRouter, an OpenStreetMap router, and Maps asks Google again for a route through " +
        "it, so Google still times and navigates the trip, and keeps it through reroutes. A detour longer than " +
        "half again the distance is dropped. Off until turned on in Waze & external data source, with Flock " +
        "cameras; your route's start and end go to brouter.de. Trips with stops are left as they are.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(flockCamerasPatch, steerHookPatch)

    execute {
        markPatched("flockAvoidPatched")
    }
}
