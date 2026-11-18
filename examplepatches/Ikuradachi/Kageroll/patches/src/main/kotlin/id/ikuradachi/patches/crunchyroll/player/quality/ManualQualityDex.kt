package id.ikuradachi.patches.crunchyroll.player.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream

internal data class QualityDiscovery(
    val videoQualityBaseType: String,
    val highestQualityType: String,
    val highestQualityInstanceField: FieldReference,
    val heightQualityType: String,
    val heightMethodRef: String,
    val widthMethodRef: String,
    val bitrateMethodRef: String,
    val preferredQualityDataBaseType: String,
    val preferredQualityDataCtor: MethodReference,
    val titleDataField: FieldReference,
    val heightDataField: FieldReference,
    val highestQualityDataType: String,
    val highestQualityDataInstanceField: FieldReference,
    val moderateQualityDataType: String,
    val dataSaverQualityDataType: String,
    val qualitySelectorType: String,
    val playerStateFlowField: FieldReference,
    val stateFlowGetValueMethod: MethodReference,
    val playerStateType: String,
    val adStateField: FieldReference,
    val adIsActiveField: FieldReference,
    val availableQualitiesField: FieldReference,
    val tracksType: String,
    val tracksGroupsField: FieldReference,
    val trackGroupInfoType: String,
    val trackGroupField: FieldReference,
    val trackGroupLengthField: FieldReference,
    val isTrackSupportedMethod: MethodReference,
    val getTrackFormatMethod: MethodReference,
    val trackGroupType: String,
    val trackTypeField: FieldReference,
    val formatWidthField: FieldReference,
    val formatHeightField: FieldReference,
    val formatBitrateField: FieldReference,
    val trackSelectionBuilderType: String,
    val clearOverridesOfTypeMethod: MethodReference,
    val setOverrideForTypeMethod: MethodReference,
    val setMaxVideoSizeMethod: MethodReference,
    val trackSelectionOverrideType: String,
)

internal fun manualQualityDex(ctx: QualityDiscovery): ByteArrayInputStream {
    fun buildMethod(
        definingClass: String,
        name: String,
        params: List<String>,
        returnType: String,
        flags: Int,
        registers: Int,
        body: String,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            params.map { ImmutableMethodParameter(it, emptySet(), null) },
            returnType,
            flags,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(registers),
        ),
    ).also { it.addInstructions(0, body.trimIndent()) }

    val manualQualityDataMethods = listOf(
        buildMethod(
            definingClass = MANUAL_QUALITY_DATA_CLASS,
            name = "<init>",
            params = listOf(ctx.videoQualityBaseType, "I", "I", "Ljava/lang/String;"),
            returnType = "V",
            flags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            registers = 5,
            body = """
                invoke-direct {p0, p1, p2, p3, p4}, ${ctx.preferredQualityDataCtor}
                return-void
            """,
        ),
        buildMethod(
            definingClass = MANUAL_QUALITY_DATA_CLASS,
            name = "equals",
            params = listOf("Ljava/lang/Object;"),
            returnType = "Z",
            flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            registers = 4,
            body = """
                const/4 v0, 0x1
                if-ne p0, p1, :not_same
                return v0

                :not_same
                instance-of v1, p1, $MANUAL_QUALITY_DATA_CLASS
                if-eqz v1, :not_equal
                check-cast p1, $MANUAL_QUALITY_DATA_CLASS
                iget v1, p0, ${ctx.heightDataField}
                iget p1, p1, ${ctx.heightDataField}
                if-ne v1, p1, :not_equal
                return v0

                :not_equal
                const/4 v0, 0x0
                return v0
            """,
        ),
        buildMethod(
            definingClass = MANUAL_QUALITY_DATA_CLASS,
            name = "hashCode",
            params = emptyList(),
            returnType = "I",
            flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            registers = 2,
            body = """
                iget v0, p0, ${ctx.heightDataField}
                return v0
            """,
        ),
        buildMethod(
            definingClass = MANUAL_QUALITY_DATA_CLASS,
            name = "fromQuality",
            params = listOf(ctx.videoQualityBaseType),
            returnType = ctx.preferredQualityDataBaseType,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            registers = 5,
            body = """
                if-eqz p0, :auto
                instance-of v0, p0, ${ctx.highestQualityType}
                if-nez v0, :auto
                invoke-virtual {p0}, ${ctx.heightMethodRef}
                move-result v0
                if-lez v0, :auto
                const v1, 0xffff
                if-gt v0, v1, :auto

                const v1, 0x7e000000
                or-int/2addr v1, v0
                new-instance v2, Ljava/lang/StringBuilder;
                invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
                invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                const-string v3, "p"
                invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v2
                const/4 v3, 0x0
                new-instance v0, $MANUAL_QUALITY_DATA_CLASS
                invoke-direct {v0, p0, v1, v3, v2}, $MANUAL_QUALITY_DATA_CLASS-><init>(${ctx.videoQualityBaseType}IILjava/lang/String;)V
                return-object v0

                :auto
                sget-object v0, ${ctx.highestQualityDataInstanceField}
                return-object v0
            """,
        ),
    )

    val manualQualityDataClass = ImmutableClassDef(
        MANUAL_QUALITY_DATA_CLASS,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        ctx.preferredQualityDataBaseType,
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        manualQualityDataMethods,
    )

    val manualQualityBridgeMethods = listOf(
        buildMethod(
            definingClass = MANUAL_QUALITY_BRIDGE_CLASS,
            name = "discoverVideoQualities",
            params = listOf("Ljava/lang/Object;", ctx.tracksType, "Z", "Ljava/util/List;"),
            returnType = "Ljava/util/List;",
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            registers = 14,
            body = """
                if-eqz p2, :discover
                if-eqz p3, :discover
                return-object p3

                :discover
                invoke-static {}, $QUALITY_HELPER_CLASS->beginDiscovery()Ljava/lang/Object;
                move-result-object v4
                if-eqz p1, :finish
                iget-object v0, p1, ${ctx.tracksGroupsField}
                if-eqz v0, :finish
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0

                :loop_groups
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :finish
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, ${ctx.trackGroupInfoType}
                iget-object v5, v1, ${ctx.trackGroupField}
                iget v2, v5, ${ctx.trackTypeField}
                const/4 v3, 0x2
                if-ne v2, v3, :loop_groups
                iget v2, v1, ${ctx.trackGroupLengthField}
                const/4 v6, 0x0

                :loop_tracks
                if-ge v6, v2, :loop_groups
                invoke-virtual {v1, v6}, ${ctx.isTrackSupportedMethod}
                move-result v3
                if-eqz v3, :next_track
                invoke-virtual {v1, v6}, ${ctx.getTrackFormatMethod}
                move-result-object v3
                if-eqz v3, :next_track
                iget v7, v3, ${ctx.formatWidthField}
                iget v8, v3, ${ctx.formatHeightField}
                iget v9, v3, ${ctx.formatBitrateField}
                invoke-static/range {v4 .. v9}, $QUALITY_HELPER_CLASS->addCandidate(Ljava/lang/Object;Ljava/lang/Object;IIII)V

                :next_track
                add-int/lit8 v6, v6, 0x1
                goto :loop_tracks

                :finish
                invoke-static {p0, v4}, $QUALITY_HELPER_CLASS->finishDiscovery(Ljava/lang/Object;Ljava/lang/Object;)[I
                move-result-object v0
                new-instance v1, Ljava/util/ArrayList;
                invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                sget-object v2, ${ctx.highestQualityInstanceField}
                invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                array-length v2, v0
                const/4 v3, 0x0

                :loop_build
                add-int/lit8 v5, v3, 0x2
                if-ge v5, v2, :done_build
                aget v6, v0, v3
                add-int/lit8 v7, v3, 0x1
                aget v7, v0, v7
                aget v8, v0, v5
                new-instance v9, ${ctx.heightQualityType}
                invoke-direct {v9, v6, v7, v8}, ${ctx.heightQualityType}-><init>(III)V
                invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                add-int/lit8 v3, v3, 0x3
                goto :loop_build

                :done_build
                return-object v1
            """,
        ),
        buildMethod(
            definingClass = MANUAL_QUALITY_BRIDGE_CLASS,
            name = "canonicalizeQuality",
            params = listOf(ctx.videoQualityBaseType, "Ljava/util/List;"),
            returnType = ctx.videoQualityBaseType,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            registers = 6,
            body = """
                if-eqz p0, :return_orig
                if-eqz p1, :return_orig
                instance-of v0, p0, ${ctx.heightQualityType}
                if-eqz v0, :return_orig
                invoke-virtual {p0}, ${ctx.heightMethodRef}
                move-result v0
                if-lez v0, :return_orig
                invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v1

                :loop
                invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                move-result v2
                if-eqz v2, :return_orig
                invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v2
                instance-of v3, v2, ${ctx.heightQualityType}
                if-eqz v3, :loop
                check-cast v2, ${ctx.videoQualityBaseType}
                invoke-virtual {v2}, ${ctx.heightMethodRef}
                move-result v3
                if-ne v3, v0, :loop
                return-object v2

                :return_orig
                return-object p0
            """,
        ),
        buildMethod(
            definingClass = MANUAL_QUALITY_BRIDGE_CLASS,
            name = "applyQualityOverride",
            params = listOf(ctx.qualitySelectorType, ctx.trackSelectionBuilderType, ctx.videoQualityBaseType),
            returnType = ctx.trackSelectionBuilderType,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            registers = 7,
            body = """
                const/4 v0, 0x2
                invoke-virtual {p1, v0}, ${ctx.clearOverridesOfTypeMethod}
                move-result-object p1
                iget-object v0, p0, ${ctx.playerStateFlowField}
                invoke-interface {v0}, ${ctx.stateFlowGetValueMethod}
                move-result-object v0
                check-cast v0, ${ctx.playerStateType}
                iget-object v0, v0, ${ctx.adStateField}
                iget-boolean v0, v0, ${ctx.adIsActiveField}
                if-nez v0, :unbounded
                if-eqz p2, :unbounded
                instance-of v0, p2, ${ctx.highestQualityType}
                if-nez v0, :unbounded
                invoke-virtual {p2}, ${ctx.heightMethodRef}
                move-result v0
                if-lez v0, :unbounded

                invoke-static {p0, v0}, $QUALITY_HELPER_CLASS->findMatchingTrackGroup(Ljava/lang/Object;I)Ljava/lang/Object;
                move-result-object v1
                if-eqz v1, :fallback_cap
                invoke-static {p0, v1, v0}, $QUALITY_HELPER_CLASS->findMatchingTrackIndices(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/util/List;
                move-result-object v2
                if-eqz v2, :fallback_cap
                invoke-interface {v2}, Ljava/util/List;->isEmpty()Z
                move-result v3
                if-nez v3, :fallback_cap
                check-cast v1, ${ctx.trackGroupType}
                new-instance v3, ${ctx.trackSelectionOverrideType}
                invoke-direct {v3, v1, v2}, ${ctx.trackSelectionOverrideType}-><init>(${ctx.trackGroupType}Ljava/util/List;)V
                invoke-virtual {p1, v3}, ${ctx.setOverrideForTypeMethod}
                move-result-object p1

                :unbounded
                const v0, 0x7fffffff
                invoke-virtual {p1, v0, v0}, ${ctx.setMaxVideoSizeMethod}
                move-result-object v0
                return-object v0

                :fallback_cap
                const v1, 0x7fffffff
                invoke-virtual {p1, v1, v0}, ${ctx.setMaxVideoSizeMethod}
                move-result-object v0
                return-object v0
            """,
        ),
    )

    val manualQualityBridgeClass = ImmutableClassDef(
        MANUAL_QUALITY_BRIDGE_CLASS,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        manualQualityBridgeMethods,
    )

    val store = MemoryDataStore()
    try {
        DexPool.writeTo(
            store,
            ImmutableDexFile(
                Opcodes.forApi(26),
                listOf(manualQualityDataClass, manualQualityBridgeClass),
            ),
        )
        return ByteArrayInputStream(store.data)
    } finally {
        store.close()
    }
}
