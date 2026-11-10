package app.bin0culars.patches.reddit.layout.contenttypefilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/ContentTypeFilterPatch;"

internal fun Instruction.methodRef(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

internal fun Instruction.typeRef(): String? =
    ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

internal fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

private fun fillLeafKindBridge() {
    val groups = listOf(
        1 to listOf(VideoElementFingerprint.classDef.type, YouTubeElementFingerprint.classDef.type),
        2 to listOf(
            PostSelfImageElementFingerprint.classDef.type,
            GalleryElementFingerprint.classDef.type,
            GalleryWithLinkFooterElementFingerprint.classDef.type,
        ),
        3 to listOf(
            PostMediaWebsiteElementFingerprint.classDef.type,
            TitleWithLinkedPreviewElementFingerprint.classDef.type,
            TitleWithThumbnailElementFingerprint.classDef.type,
        ),
        4 to listOf(
            ClassicPostElementFingerprint.classDef.type,
        ),
    )

    val checks = groups.joinToString("\n") { (kind, types) ->
        types.joinToString("\n") { type ->
            """
                instance-of p1, p0, $type
                if-nez p1, :kind_$kind
            """.trimIndent()
        }
    }

    val blocks = groups.joinToString("\n") { (kind, _) ->
        """
            :kind_$kind
            const/4 p1, 0x$kind
            return p1
        """.trimIndent()
    }

    val smali = """
        if-eqz p0, :none
        $checks
        :none
        const/4 p1, 0x0
        return p1
        $blocks
    """.trimIndent()

    fillBridge("leafKind", smali)
}

private fun fillIsPostContainerBridge() {
    val postType = PostElementFingerprint.classDef.type
    val crosspostType = CrosspostElementFingerprint.classDef.type
    val smali = """
        if-eqz p0, :not_container
        instance-of p1, p0, $postType
        if-nez p1, :is_container
        instance-of p1, p0, $crosspostType
        if-nez p1, :is_container
        :not_container
        const/4 p1, 0x0
        return p1
        :is_container
        const/4 p1, 0x1
        return p1
    """.trimIndent()
    fillBridge("isPostContainer", smali)
}

internal fun isAbstractNoArg(method: Method): Boolean =
    (method.accessFlags and AccessFlags.ABSTRACT.value) != 0 && method.parameterTypes.isEmpty()

private fun returnsList(returnType: String): Boolean =
    runCatching { classDefBy(returnType) }.getOrNull()?.interfaces?.contains("Ljava/util/List;") == true

internal fun findChildrenMethod(): Pair<String, Method> {
    val postInterfaces = PostElementFingerprint.classDef.interfaces
    val crosspostInterfaces = CrosspostElementFingerprint.classDef.interfaces.toSet()
    val videoInterfaces = VideoElementFingerprint.classDef.interfaces.toSet()
    val candidateInterfaces = postInterfaces.intersect(crosspostInterfaces) - videoInterfaces
    return candidateInterfaces.asSequence()
        .flatMap { iface -> classDefBy(iface).methods.map { iface to it } }
        .firstOrNull { (_, m) -> isAbstractNoArg(m) && returnsList(m.returnType) }
        ?: throw PatchException("Could not find parent element interface for children() bridge")
}

private fun fillChildrenBridge() {
    val (parentInterface, method) = findChildrenMethod()
    val childrenMethodName = method.name
    val childrenReturnType = method.returnType

    val smali = """
        instance-of p1, p0, $parentInterface
        if-eqz p1, :null_child
        check-cast p0, $parentInterface
        invoke-interface {p0}, $parentInterface->$childrenMethodName()$childrenReturnType
        move-result-object p0
        return-object p0
        :null_child
        const/4 p0, 0x0
        return-object p0
    """.trimIndent()
    fillBridge("children", smali)
}

internal fun fillClassifierBridges() {
    fillLeafKindBridge()
    fillIsPostContainerBridge()
    fillChildrenBridge()
}
