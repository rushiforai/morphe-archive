package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ORIGINAL="Lapp/morphe/extension/youtube/patches/PostImageDownloadPatch;"
private const val IMAGE="Lapp/morphe/extension/youtube/patches/PostImageDownloadPatch\$PostImage;"
private const val HOST="Lcom/facebook/litho/ComponentHost;"
private const val ACTIONS="$EXTENSION_PACKAGE/menus/LongPressPostImageActions;"

/** Reuse the selected upstream feature; this dependency does not enable its patch or UI. */
internal val longPressPostImageHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(sharedExtensionPatch,longPressCaptureResourcesPatch)
    execute {
        val original=mutableClassDefBy(ORIGINAL)
        require(original.methods.none {it.name=="afterglow_currentPostImage"})
        Fingerprint(definingClass=ORIGINAL,name="findPostKey",parameters=listOf(HOST),returnType="Ljava/lang/String;",
            filters=listOf(methodCall(smali="$ORIGINAL->collectTexts(${HOST}Ljava/util/List;)V"))).method
        Fingerprint(definingClass=ORIGINAL,name="getImages",parameters=listOf("Ljava/lang/String;"),returnType="Ljava/util/List;",
            filters=listOf(fieldAccess(smali="$ORIGINAL->postImages:Ljava/util/Map;",opcode=Opcode.SGET_OBJECT))).method
        Fingerprint(definingClass=ORIGINAL,name="getShownImages",parameters=listOf(HOST,"Ljava/util/List;"),returnType="Ljava/util/List;",
            filters=listOf(methodCall(smali="$ORIGINAL->getShownIndex(Landroid/support/v7/widget/RecyclerView;)I"))).method
        Fingerprint(definingClass=IMAGE,name="shownUrl",parameters=emptyList(),returnType="Ljava/lang/String;",
            filters=listOf(fieldAccess(smali="$IMAGE->shownUrl:Ljava/lang/String;",opcode=Opcode.IGET_OBJECT))).method
        require(original.fields.single {it.name=="ENABLED"}.let {it.type=="Z"&&AccessFlags.STATIC.isSet(it.accessFlags)})
        original.methods.add(ImmutableMethod(ORIGINAL,"afterglow_currentPostImage",
            listOf(ImmutableMethodParameter("Landroid/view/View;",null,null)),"[Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,null,null,MutableMethodImplementation(5)).toMutable().apply {
            addInstructions(0,"""
                instance-of v0, p0, $HOST
                if-eqz v0, :none
                sget-boolean v0, $ORIGINAL->ENABLED:Z
                if-eqz v0, :none
                check-cast p0, $HOST
                invoke-static { p0 }, $ORIGINAL->findPostKey($HOST)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :none
                invoke-static { v0 }, $ORIGINAL->getImages(Ljava/lang/String;)Ljava/util/List;
                move-result-object v1
                if-eqz v1, :none
                invoke-static { p0, v1 }, $ORIGINAL->getShownImages(${HOST}Ljava/util/List;)Ljava/util/List;
                move-result-object v1
                if-eqz v1, :none
                invoke-interface { v1 }, Ljava/util/List;->size()I
                move-result v2
                const/4 v3, 0x1
                if-ne v2, v3, :none
                const/4 v2, 0x0
                invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $IMAGE
                invoke-virtual { v1 }, $IMAGE->shownUrl()Ljava/lang/String;
                move-result-object v1
                if-eqz v1, :none
                filled-new-array { v0, v1 }, [Ljava/lang/String;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """)
        })
        Fingerprint(definingClass=ACTIONS,name="currentImage",parameters=listOf("Landroid/view/View;"),returnType="[Ljava/lang/String;")
            .method.apply {
                require(AccessFlags.STATIC.isSet(accessFlags))
                require(implementation!!.instructions.map {it.opcode}==listOf(Opcode.CONST_4,Opcode.RETURN_OBJECT)) {
                    "Post image resolver stub changed"
                }
                removeInstructions(0,implementation!!.instructions.size)
                addInstructions(0,"""
                    invoke-static/range { p0 .. p0 }, $ORIGINAL->afterglow_currentPostImage(Landroid/view/View;)[Ljava/lang/String;
                    move-result-object p0
                    return-object p0
                """)
            }
        println("Afterglow post image clipboard: original selected-image resolver, original enable gate, one-image-only result")
    }
}
