package app.template.patches.strava

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

internal data class StravaMethodTarget(
    val classDef: ClassDef,
    val method: Method,
)

internal data class StravaMethodSpec(
    val classType: String,
    val name: String,
    val returnType: String,
    val parameterTypes: List<String>,
)

internal fun <T> requireExactlyOne(
    label: String,
    matches: List<T>,
): T {
    if (matches.size != 1) {
        throw PatchException(
            "$label resolved to ${matches.size} matches; expected exactly one.",
        )
    }
    return matches.single()
}

internal fun findStravaMethodMatches(
    classDefs: Iterable<ClassDef>,
    specs: List<StravaMethodSpec>,
): List<Pair<ClassDef, Method>> {
    val matches = ArrayList<Pair<ClassDef, Method>>()

    classDefs.forEach { classDef ->
        val classSpecs = specs.filter { it.classType == classDef.type }
        if (classSpecs.isEmpty()) return@forEach

        classDef.methods.forEach { method ->
            val matchesSpec = classSpecs.any { spec ->
                method.name == spec.name &&
                    method.returnType == spec.returnType &&
                    method.parameterTypes == spec.parameterTypes
            }
            if (matchesSpec) matches += classDef to method
        }
    }

    return matches
}

internal fun BytecodePatchContext.resolveStravaMethod(
    label: String,
    specs: List<StravaMethodSpec>,
): StravaMethodTarget {
    val matches = ArrayList<Pair<ClassDef, Method>>()

    classDefForEach { classDef ->
        matches += findStravaMethodMatches(listOf(classDef), specs)
    }

    val (classDef, method) = requireExactlyOne(label, matches)
    return StravaMethodTarget(classDef, method)
}

internal fun BytecodePatchContext.resolveStravaMethod(
    label: String,
    vararg specs: StravaMethodSpec,
): StravaMethodTarget = resolveStravaMethod(label, specs.toList())

internal fun BytecodePatchContext.mutableStravaMethod(
    target: StravaMethodTarget,
): MutableMethod {
    val mutable = mutableClassDefBy(target.classDef).methods.firstOrNull {
        it.name == target.method.name &&
            it.returnType == target.method.returnType &&
            it.parameterTypes == target.method.parameterTypes
    } ?: throw PatchException(
        "Resolved Strava method ${target.classDef.type}->${target.method.name} disappeared.",
    )
    return mutable
}

internal data class StravaFieldTarget(
    val classDef: ClassDef,
    val field: Field,
)

internal fun BytecodePatchContext.resolveStravaField(
    label: String,
    classTypes: Set<String>,
    fieldName: String,
    fieldType: String,
): StravaFieldTarget {
    val matches = ArrayList<Pair<ClassDef, Field>>()

    classDefForEach { classDef ->
        if (classDef.type !in classTypes) return@classDefForEach
        classDef.fields.forEach { field ->
            if (field.name == fieldName && field.type == fieldType) {
                matches += classDef to field
            }
        }
    }

    if (matches.size != 1) {
        throw PatchException(
            "$label resolved to ${matches.size} fields; expected exactly one.",
        )
    }

    val (classDef, field) = matches.single()
    return StravaFieldTarget(classDef, field)
}

internal data class StravaStaticSelfFieldTarget(
    val classDef: ClassDef,
    val field: Field,
)

internal fun findStravaStaticSelfFieldMatches(
    classDefs: Iterable<ClassDef>,
    classTypes: Set<String>,
    literal: String,
): List<Pair<ClassDef, Field>> {
    val matches = ArrayList<Pair<ClassDef, Field>>()

    classDefs.forEach { classDef ->
        if (classDef.type !in classTypes) return@forEach
        val containsLiteral = classDef.methods.any { method ->
            method.implementation?.instructions?.any { instruction ->
                (instruction as? ReferenceInstruction)?.reference is StringReference &&
                    (instruction.reference as StringReference).string == literal
            } == true
        }
        if (!containsLiteral) return@forEach

        classDef.fields
            .filter { field ->
                field.name == "a" &&
                    field.type == classDef.type &&
                    AccessFlags.STATIC.isSet(field.accessFlags)
            }
            .forEach { field -> matches += classDef to field }
    }

    return matches
}

internal fun BytecodePatchContext.resolveStravaStaticSelfFieldWithLiteral(
    label: String,
    classTypes: Set<String>,
    literal: String,
): StravaStaticSelfFieldTarget {
    val matches = ArrayList<Pair<ClassDef, Field>>()

    classDefForEach { classDef ->
        matches += findStravaStaticSelfFieldMatches(
            classDefs = listOf(classDef),
            classTypes = classTypes,
            literal = literal,
        )
    }

    val (classDef, field) = requireExactlyOne(label, matches)
    return StravaStaticSelfFieldTarget(classDef, field)
}

internal object StravaTargets {
    val dispatcher = listOf(
        StravaMethodSpec(
            "Lhts;",
            "a",
            "Lcom/strava/modularframework/data/Module;",
            listOf("Lcom/strava/modularframework/data/GenericLayoutModule;"),
        ),
        StravaMethodSpec(
            "Lq0u;",
            "a",
            "Lcom/strava/modularframework/data/Module;",
            listOf("Lcom/strava/modularframework/data/GenericLayoutModule;"),
        ),
    )

    val mapsRenderer = listOf(
        StravaMethodSpec(
            "Lrl60;",
            "d",
            "V",
            listOf(
                "I",
                "Ljos;",
                "Landroidx/compose/runtime/a;",
                "Lkotlin/jvm/functions/Function0;",
                "Z",
            ),
        ),
        StravaMethodSpec(
            "Lh680;",
            "d",
            "V",
            listOf(
                "I",
                "Lnut;",
                "Landroidx/compose/runtime/a;",
                "Lkotlin/jvm/functions/Function0;",
                "Z",
            ),
        ),
    )

    val upsellSheet = listOf(
        StravaMethodSpec(
            "Lww4;",
            "a",
            "V",
            listOf(
                "Landroidx/fragment/app/FragmentManager;",
                "Lcom/strava/subscriptions/data/models/SubscriptionsUpsellLocation;",
            ),
        ),
        StravaMethodSpec(
            "Lh95;",
            "a",
            "V",
            listOf(
                "Landroidx/fragment/app/FragmentManager;",
                "Lcom/strava/subscriptions/data/models/SubscriptionsUpsellLocation;",
            ),
        ),
    )

    val settingsRenderer = listOf(
        StravaMethodSpec(
            "Lpr5;",
            "a",
            "V",
            listOf(
                "Lky20;",
                "Ljos;",
                "Lkotlin/jvm/functions/Function0;",
                "Landroidx/compose/runtime/a;",
                "I",
            ),
        ),
        StravaMethodSpec(
            "Lm46;",
            "a",
            "V",
            listOf(
                "Lmf40;",
                "Lnut;",
                "Lkotlin/jvm/functions/Function0;",
                "Landroidx/compose/runtime/a;",
                "I",
            ),
        ),
    )

    val settingsCaller = listOf(
        StravaMethodSpec(
            "Lb130;",
            "invoke",
            "Ljava/lang/Object;",
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
        ),
        StravaMethodSpec(
            "Lki40;",
            "invoke",
            "Ljava/lang/Object;",
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
        ),
    )

    val settingsHeader = listOf(
        StravaMethodSpec(
            "Le130;",
            "i",
            "V",
            listOf("I", "Ljos;", "Landroidx/compose/runtime/a;", "Ljava/lang/String;"),
        ),
        StravaMethodSpec(
            "Loi40;",
            "i",
            "V",
            listOf("I", "Lnut;", "Landroidx/compose/runtime/a;", "Ljava/lang/String;"),
        ),
    )

    val viewHolder = listOf(
        StravaMethodSpec(
            "Ldss;",
            "bindView",
            "V",
            listOf("Lcom/strava/modularframework/data/Module;", "Lx1g;"),
        ),
        StravaMethodSpec(
            "Lmzt;",
            "bindView",
            "V",
            listOf("Lcom/strava/modularframework/data/Module;", "Ldlg;"),
        ),
    )

    val predictionsRenderer = listOf(
        StravaMethodSpec(
            "Lfg60;",
            "c",
            "V",
            listOf("Ljos;", "Landroidx/compose/runtime/a;", "I"),
        ),
        StravaMethodSpec(
            "Lw080;",
            "c",
            "V",
            listOf("Lnut;", "Landroidx/compose/runtime/a;", "I"),
        ),
    )

    val telemetryDao = listOf(
        StravaMethodSpec("Lwy0;", "c", "V", listOf("Lnz0;")),
        StravaMethodSpec("Lxa1;", "c", "V", listOf("Lnb1;")),
    )

    val loggerFieldClasses = setOf("Lpss;", "Lyzt;")
    val coroutineMarkerClasses = setOf("Lcmb;", "Lc4c;")

    val raceRepository = listOf(
        StravaMethodSpec(
            "Lcom/strava/performancepredictions/data/RaceBannerRepositoryImpl;",
            "getSuggestedRaces",
            "Ljava/lang/Object;",
            listOf("Lahb;"),
        ),
        StravaMethodSpec(
            "Lcom/strava/performancepredictions/data/RaceBannerRepositoryImpl;",
            "getSuggestedRaces",
            "Ljava/lang/Object;",
            listOf("Lnyb;"),
        ),
    )
}
