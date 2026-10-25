package app.template.patches.eurosport.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.eurosport.shared.AD_SDKS
import app.template.patches.eurosport.shared.constZero
import app.template.patches.eurosport.shared.disableSdkConfigs
import app.template.patches.eurosport.shared.insertBefore
import app.template.patches.eurosport.shared.returnNull
import app.template.patches.eurosport.shared.single
import app.template.patches.eurosport.shared.singleStaticFactory
import app.template.patches.eurosport.shared.singleStore
import app.template.patches.eurosport.shared.strings
import app.template.patches.shared.Constants.COMPATIBILITY_EUROSPORT
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

/** Whether this invoke (or filled-new-array) passes [register]. */
private fun Instruction.passes(register: Int): Boolean = when (this) {
    is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).contains(register)
    else -> false
}

/**
 * PlayerMediaInfo's adsMetadata field: its only instance field of the [adsMetadata] type, and
 * the field toString() prints after "adsMetadata=" (the first object field read after the
 * instruction that consumes that string, before the next string is loaded). It must be final,
 * so only PlayerMediaInfo's own constructors can write it.
 */
private fun adsMetadataField(playerInfo: ClassDef, toString: MutableMethod, adsMetadata: String): Field {
    val fields = playerInfo.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == adsMetadata }
    val field = fields.singleOrNull()
        ?: throw PatchException("PlayerMediaInfo has ${fields.size} $adsMetadata fields, expected one")
    if (!AccessFlags.FINAL.isSet(field.accessFlags)) {
        throw PatchException("PlayerMediaInfo.${field.name} is not final, so code outside its constructors may set it")
    }
    val insns = toString.implementation!!.instructions.toList()
    val label = insns.indexOfFirst { it.stringRef()?.contains("adsMetadata=") == true }
    val register = (insns[label] as OneRegisterInstruction).registerA
    val consumer = (label + 1 until insns.size).firstOrNull { insns[it].passes(register) }
        ?: throw PatchException("PlayerMediaInfo toString never uses its adsMetadata= string")
    val printed = insns.drop(consumer + 1).takeWhile { it.stringRef() == null }
        .firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.fieldRef()
    if (printed?.definingClass != playerInfo.type || printed.name != field.name || printed.type != adsMetadata) {
        throw PatchException("PlayerMediaInfo toString prints $printed after adsMetadata=, not ${field.name}")
    }
    return field
}

/** Every concrete StorytellerModule implementation in the app (through sub-interfaces too). */
private fun BytecodePatchContext.storytellerModules(): List<String> {
    val interfaces = mutableMapOf<String, List<String>>()
    val concrete = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.interfaces.none { it.startsWith("Lcom/storyteller/") }) return@classDefForEach
        interfaces[classDef.type] = classDef.interfaces.toList()
        if (!AccessFlags.INTERFACE.isSet(classDef.accessFlags) && !AccessFlags.ABSTRACT.isSet(classDef.accessFlags)) {
            concrete += classDef.type
        }
    }
    fun isModule(type: String, seen: Set<String> = emptySet()): Boolean =
        type == STORYTELLER_MODULE ||
            (type !in seen && interfaces[type].orEmpty().any { isModule(it, seen + type) })
    return concrete.filter { isModule(it) }
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes ads, including video pre-rolls on free videos.",
) {
    compatibleWith(COMPATIBILITY_EUROSPORT)

    execute {
        // 1. The remote kill switch reads GOOGLE_AD and TEADS as off: the ad view factory returns a
        // 0x0 view instead of a Google Ad Manager or Teads slot.
        disableSdkConfigs(AD_SDKS)

        // 2. The AdPlaceholderModel factory (8.34.1: static efo.r(at)) answers null, so the feed,
        // article and match page builders add no ad slot. All five callers handle null.
        val placeholder = single(AdPlaceholderToStringFingerprint, "AdPlaceholderModel toString").classDef.type
        val factory = singleStaticFactory(placeholder, "AdPlaceholderModel")
        val providerClasses = UnsupportedAdProviderFingerprint.matchAllOrNull().orEmpty().map { it.classDef.type }
        if (factory.classDef.type !in providerClasses) {
            throw PatchException(
                "The AdPlaceholderModel factory ${factory.classDef.type}->${factory.method.name} is not next to " +
                    "the \"Unsupported provider: \" method (found in $providerClasses)",
            )
        }
        factory.method.returnNull()

        // 3. PlayerMediaInfo stores null as its adsMetadata in every constructor, so the player
        // (VOD and live) gets no ad (IMA) parameters; its one reader (8.34.1: ck.M) skips the ad
        // setup when the field is null. The field is found through its AdsMetadata type and
        // toString(); 8.34.1 has one constructor, which stores p7.
        val playerInfo = single(PlayerMediaInfoToStringFingerprint, "PlayerMediaInfo toString")
        val adsMetadataType = single(AdsMetadataToStringFingerprint, "AdsMetadata toString").classDef.type
        val adsMetadata = adsMetadataField(playerInfo.classDef, playerInfo.method, adsMetadataType)
        val adsMetadataWriters = playerInfo.classDef.methods.filter { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.let { ref ->
                    ref.definingClass == playerInfo.classDef.type && ref.name == adsMetadata.name
                } == true
            } == true
        }
        if (adsMetadataWriters.isEmpty()) throw PatchException("No PlayerMediaInfo constructor stores ${adsMetadata.name}")
        adsMetadataWriters.firstOrNull { it.name != "<init>" }?.let {
            throw PatchException("PlayerMediaInfo.${it.name} stores ${adsMetadata.name} outside a constructor")
        }
        adsMetadataWriters.forEach { constructor ->
            val (index, register) = constructor.singleStore(Opcode.IPUT_OBJECT, adsMetadata.name, adsMetadataType)
            constructor.insertBefore(index, constZero(register))
        }

        // 4. Storyteller Settings: both constructors (the public one and the serializer's, which
        // leads with the field mask) store AdSource.NoAds, so Stories and Clips request no ads.
        // AdSource is the parameter enum whose <clinit> names NoAds, IntegratingApp and Storyteller.
        val settings = mutableClassDefByOrNull(STORYTELLER_SETTINGS)
            ?: throw PatchException("$STORYTELLER_SETTINGS not found")
        val settingsConstructors = settings.methods.filter { it.name == "<init>" && it.implementation != null }
        val adSources = settingsConstructors.flatMap { it.parameterTypes.map(CharSequence::toString) }.toSet()
            .filter { type ->
                classDefByOrNull(type)?.let { enum ->
                    enum.superclass == "Ljava/lang/Enum;" &&
                        enum.methods.firstOrNull { it.name == "<clinit>" }?.strings()
                            ?.containsAll(listOf("NoAds", "IntegratingApp", "Storyteller")) == true
                } == true
            }
        val adSource = adSources.singleOrNull()
            ?: throw PatchException("Expected one Storyteller AdSource parameter type, found $adSources")
        val noAds = classDefByOrNull(adSource)!!.methods.first { it.name == "<clinit>" }.implementation!!.instructions
            .toList().let { clinit ->
                val name = clinit.indexOfFirst { it.stringRef() == "NoAds" }
                clinit.drop(name).firstOrNull { insn ->
                    insn.opcode == Opcode.SPUT_OBJECT && insn.fieldRef()?.let { it.definingClass == adSource && it.type == adSource } == true
                }?.fieldRef()
            } ?: throw PatchException("AdSource $adSource has no NoAds constant")
        val adSourceField = settings.fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == adSource }
            ?: throw PatchException("$STORYTELLER_SETTINGS has no single $adSource field")
        val adSourceConstructors = settingsConstructors.filter { constructor ->
            constructor.parameterTypes.any { it.toString() == adSource }
        }
        val serializerShape = adSourceConstructors.count { it.parameterTypes.firstOrNull()?.toString() == "I" }
        if (serializerShape != 1 || adSourceConstructors.size != 2) {
            throw PatchException("Expected the public and the serializer Settings constructor, found ${adSourceConstructors.size}")
        }
        adSourceConstructors.forEach { constructor ->
            val (index, register) = constructor.singleStore(Opcode.IPUT_OBJECT, adSourceField.name, adSource)
            constructor.insertBefore(index, "sget-object v$register, $adSource->${noAds.name}:$adSource")
        }

        // 5. Clips: no bottom banner and no pre-roll ad, whatever the configuration says.
        val clipsAds = mutableClassDefByOrNull(STORYTELLER_CLIPS_AD_CONFIGURATION)
            ?: throw PatchException("$STORYTELLER_CLIPS_AD_CONFIGURATION not found")
        for (getter in listOf("getBottomBannerEnabled", "getPreRollEnabled")) {
            clipsAds.methods.singleOrNull {
                it.name == getter && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }?.returnEarly(false) ?: throw PatchException("$STORYTELLER_CLIPS_AD_CONFIGURATION.$getter not found")
        }

        // 6. Storyteller gets no modules. The app registers only the Google Ad Manager module
        // (StorytellerGamModule); the patch refuses to run if a non-ads module exists.
        val modules = storytellerModules()
        val nonAdModules = modules.filterNot { it.startsWith(STORYTELLER_ADS_MODULES) }
        if (modules.isEmpty() || nonAdModules.isNotEmpty()) {
            throw PatchException("Storyteller modules other than the ads modules exist: $nonAdModules (all: $modules)")
        }
        val setModules = mutableClassDefByOrNull(STORYTELLER_COMPANION)?.methods?.singleOrNull {
            it.name == "setModules" && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;")
        } ?: throw PatchException("$STORYTELLER_COMPANION.setModules(List)V not found")
        setModules.addInstructionsChecked(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p1
            """,
        )

        // 7. Belt and braces for step 1: the app's Teads view (8.34.1: aom.load) never creates
        // its TeadsAdPlacementMedia. Optional: a build without a Teads view needs nothing here.
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Ltv/teads/")) return@classDefForEach
            fun createsTeadsPlacement(method: Method) =
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as? TypeReference)?.type == TEADS_AD_PLACEMENT_MEDIA
                } == true
            if (classDef.methods.none(::createsTeadsPlacement)) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter(::createsTeadsPlacement).forEach { loader ->
                if (loader.returnType != "V") {
                    throw PatchException("Teads loader ${classDef.type}->${loader.name} does not return void")
                }
                loader.returnEarly()
            }
        }
    }
}
