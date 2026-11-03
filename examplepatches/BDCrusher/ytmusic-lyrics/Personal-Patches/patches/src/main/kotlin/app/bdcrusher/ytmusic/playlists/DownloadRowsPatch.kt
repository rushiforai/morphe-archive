/* Copyright 2026 BDCrusher. GPL-3.0. Native contracts verified against original 9.42.52. */
package app.bdcrusher.ytmusic.playlists
import app.bdcrusher.ytmusic.nativeentry.personalRuntimePatch
import app.morphe.patcher.*
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.music.misc.androidauto.*
import app.morphe.patches.music.interaction.downloads.CommandResolverFingerprint
import app.morphe.patches.music.interaction.jam.addBridge
import app.morphe.patches.music.interaction.jam.decode
import app.morphe.patches.music.interaction.jam.implementsType
import app.morphe.patches.music.interaction.jam.resolveProto
import app.morphe.util.cloneParameters
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val ROWS="Lapp/bdcrusher/ytmusic/playlists/PlaylistRows;"
private const val ROW_OWNER="Lapp/bdcrusher/ytmusic/playlists/PlaylistRows\$Owner;"
private object PlaylistRowSchema:Fingerprint(name="<clinit>",filters=listOf(literal(161429595)))
internal fun BytecodePatchContext.installDownloadRows(){
        PlaylistRowSchema.clearMatch()
        val rowDefaults=PlaylistRowSchema.originalMethod.implementation!!.instructions.mapNotNull {it.getReference<FieldReference>()}.filter {it.type==it.definingClass&&implementsType(it.type,"Lcom/google/protobuf/MessageLite;")}.distinct()
        if(rowDefaults.size!=2)throw PatchException("Native playlist row extension schema changed")
        val rowProto=resolveProto(rowDefaults.last().type,"native playlist row")
        val rowBinders=mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach {c->rowBinders+=c.methods.filter {it.implementation!=null&&it.returnType=="V"&&it.parameterTypes.size==3&&it.parameterTypes[1]==rowProto.type&&it.parameterTypes[2]=="I"&&it.parameterTypes[0].startsWith("L")&&!AccessFlags.STATIC.isSet(it.accessFlags)}}
        if(rowBinders.size!=2)throw PatchException("Native playlist row presenter contracts changed")
        val rows=mutableClassDefBy(ROWS)
        for((number,binder) in rowBinders.withIndex()){
            val presenterRow=mutableClassDefBy(binder.definingClass)
            val view=presenterRow.methods.singleOrNull {it.parameterTypes.isEmpty()&&it.returnType=="Landroid/view/View;"}?:throw PatchException("Native playlist row view ownership changed")
            presenterRow.interfaces.add(ROW_OWNER)
            val viewInvoke=if(AccessFlags.PRIVATE.isSet(view.accessFlags))"invoke-direct" else "invoke-virtual"
            val rowInvoke=if(AccessFlags.PRIVATE.isSet(binder.accessFlags))"invoke-direct/range" else "invoke-virtual/range"
            presenterRow.addInterfaceMethod(findInterfaceMethod(ROW_OWNER,"bd_playlistRowView"),1,"$viewInvoke { p0 }, $view\nmove-result-object p0\nreturn-object p0")
            presenterRow.addInterfaceMethod(findInterfaceMethod(ROW_OWNER,"bd_playlistRow"),4,"""
                check-cast p1, ${binder.parameterTypes[0]}
                check-cast p2, ${rowProto.type}
                $rowInvoke { p0 .. p3 }, $binder
                return-void
            """)
            val rewrite="bd_playlistRow$number"
            rows.addBridge(rewrite,listOf(ROW_OWNER,"Ljava/lang/Object;",rowProto.type,"I"),rowProto.type,9,AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,"""
                invoke-virtual { p2 }, ${rowProto.type}->toByteArray()[B
                move-result-object v0
                invoke-static { p0, p1, p2, p3, v0 }, $ROWS->capture(${ROW_OWNER}Ljava/lang/Object;Ljava/lang/Object;I[B)[B
                move-result-object v0
                ${rowProto.decode("v0","v1")}
                return-object v1
            """)
            val bind=presenterRow.methods.single {it.name==binder.name&&it.parameterTypes==binder.parameterTypes}
            bind.addInstructions(0,"invoke-static/range { p0 .. p3 }, $ROWS->$rewrite(${ROW_OWNER}Ljava/lang/Object;${rowProto.type}I)${rowProto.type}\nmove-result-object p2")
        }
}
