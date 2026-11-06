package app.custom.patches.sensu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal object ProductCatalogFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("pro_unlock", "themes_all", "pro_everything"),
)

internal object ProductStateGetterFingerprint : Fingerprint(
    isStatic = false,
    parameters = listOf("Ljava/lang/String;"),
    returnType = "I",
    filters = listOf(
        methodCall("Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"),
        literal(4096L),
    ),
    custom = { _, clazz ->
        clazz.fields.any { it.type == "Ljava/util/concurrent/CopyOnWriteArrayList;" }
    },
)

internal object ProductStateRefreshFingerprint : Fingerprint(
    classFingerprint = ProductStateGetterFingerprint,
    isStatic = false,
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/util/List;"),
        methodCall("Ljava/util/HashSet;-><init>()V"),
        methodCall("Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"),
    ),
)

// R8 inlines multiple purchase and signing-status gates into each feature method.
// Match methods by app strings, then discover every gate inside each method.
internal object FeatureGuardsFingerprint : Fingerprint(
    strings = listOf("pie_pro", "purchase.", "signature.", "purchaseState"),
    filters = listOf(
        opcode(Opcode.NEG_INT),
        opcode(Opcode.OR_INT_2ADDR, MatchAfterImmediately()),
        opcode(Opcode.USHR_INT_LIT8, MatchAfterImmediately()),
    ),
)
