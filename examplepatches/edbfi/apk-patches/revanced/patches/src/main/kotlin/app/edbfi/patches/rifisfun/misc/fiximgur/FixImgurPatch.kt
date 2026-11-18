// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.misc.fiximgur

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.EXTENSION
import app.edbfi.patches.rifisfun.misc.extension.extensionPatch
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.rifisfun.misc.requesthook.sendMethod
import app.edbfi.patches.shared.returnString
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod
import app.revanced.com.android.tools.smali.dexlib2.mutable.MutableMethod.Companion.toMutable
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.addInstructionsWithLabels
import app.revanced.patcher.extensions.getInstruction
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch
import app.revanced.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val IMGUR = "$EXTENSION/Imgur;"

// The app's own Imgur client ID, which Imgur still accepts with its full quota.
private const val DEFAULT_CLIENT_ID = "4d7e2f74f1a519c"

@Suppress("unused")
val fixImgurPatch =
    bytecodePatch(
        name = "Fix Imgur",
        description = "Fixes Imgur albums and album thumbnails failing to load, and links with a title in them.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(extensionPatch)

        val clientId by stringOption(
            name = "Imgur client ID",
            default = DEFAULT_CLIENT_ID,
            description = "The Imgur API client ID to load albums with. The default is the app's own.",
            required = true,
        ) { it?.matches(Regex("[A-Za-z0-9]+")) == true }

        apply {
            // The album viewer: a task of the request engine, which sends to the proxy URL it was built with. A new
            // background method in the task skips the send and parses the extension's answer instead.
            val send = sendMethod()
            val engine = send.definingClass
            val parser = albumParserMethod()
            val task = parser.definingClass
            val proxyUrl = proxyAlbumUrlMethod()
            // The task is an inner class of the viewer's model, which builds the proxy URL. This relies on R8 keeping
            // the `Outer$Inner` form of inner class names, an obfuscation detail: should that change, this fails here.
            if (!task.startsWith(proxyUrl.definingClass.removeSuffix(";") + "$")) {
                throw PatchException("The album parser $task isn't in the class of the proxy URL, ${proxyUrl.definingClass}")
            }
            if (!extendsClass(task, engine)) throw PatchException("$task doesn't extend the request engine $engine")
            val background = backgroundMethod(engine, send)
            val requestUri = requestUriMethod(engine)
            val engineParser = engineParserMethod(engine)
            val taskClass = classDefs[task] ?: throw PatchException("No class $task")
            if (taskClass.methods.any { it.name == background.name && it.parameterTypes.map { p -> p.toString() } == listOf("[Ljava/lang/Void;") }) {
                throw PatchException("$task already has its own background method")
            }

            // The thumbnail loader's cover lookups take the link in p1 and return the thumbnail URL.
            val covers = coverMethods()
            covers.forEach { cover ->
                if (cover.implementation!!.registerCount < 3) throw PatchException("${cover.name} has no local register")
                if (cover.getInstruction<BuilderInstruction>(0).location.labels.isNotEmpty()) throw PatchException("A branch lands on the start of ${cover.name}")
            }

            // Assembled before the first change: it checks what it built and can throw.
            val override = albumBackground(task, background.name, engine, requestUri.name, engineParser.name)
            val setClientId = clientIdMethod().returnString(clientId!!)
            val enable = extensionSwitch("Imgur")

            setClientId.apply()
            covers.forEach { cover ->
                cover.addInstructions(
                    0,
                    """
                        invoke-static/range { p1 .. p1 }, $IMGUR->cover(Landroid/net/Uri;)Ljava/lang/String;
                        move-result-object v0
                        return-object v0
                    """,
                )
            }
            // The dex writer reads every method; the virtual set may already be cached apart from it.
            classDefs.getOrReplaceMutable(taskClass).apply {
                methods.add(override)
                virtualMethods.add(override)
            }
            enable.apply()
        }
    }

/** Whether [type] is [ancestor] or extends it. */
private fun BytecodePatchContext.extendsClass(
    type: String,
    ancestor: String,
): Boolean {
    var current: String? = type
    while (current != null) {
        if (current == ancestor) return true
        current = classDefs[current]?.superclass
    }
    return false
}

/**
 * The album task's background method: the album from the extension, parsed by the task's own parser, or null, which
 * the viewer shows as a failed load. A parser exception becomes null too, as in the engine's send method.
 */
private fun albumBackground(
    task: String,
    name: String,
    engine: String,
    requestUri: String,
    parser: String,
): MutableMethod {
    val method =
        ImmutableMethod(
            task,
            name,
            listOf(ImmutableMethodParameter("[Ljava/lang/Void;", null, null)),
            "Ljava/lang/Object;",
            AccessFlags.PROTECTED.value or AccessFlags.VARARGS.value,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable()
    method.addInstructionsWithLabels(
        0,
        """
            invoke-virtual { p0 }, $engine->$requestUri()Landroid/net/Uri;
            move-result-object v0
            invoke-static { v0 }, $IMGUR->album(Landroid/net/Uri;)Ljava/io/InputStream;
            move-result-object v0
            if-eqz v0, :failed
            invoke-virtual { p0, v0 }, $engine->$parser(Ljava/io/InputStream;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
            :failed
            const/4 v0, 0x0
            return-object v0
            move-exception v0
            invoke-static { v0 }, $IMGUR->parseFailed(Ljava/lang/Throwable;)V
            goto :failed
        """,
    )
    // Catch what the parser throws: from its call up to the return after its result, handled by the move-exception.
    // Match its whole signature: R8 may give the URL getter, called first on the same class, the same short name.
    val parse =
        method.instructions.indexOfFirst {
            it.methodReference?.let { ref ->
                ref.definingClass == engine && ref.name == parser && ref.parameterTypes.map { p -> p.toString() } == listOf("Ljava/io/InputStream;")
            } == true
        }
    val handler = method.instructions.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
    if (parse < 0 || method.instructions[parse + 1].opcode != Opcode.MOVE_RESULT_OBJECT || handler <= parse) {
        throw PatchException("The album task's background method didn't assemble as expected")
    }
    val implementation = method.implementation!!
    implementation.addCatch(
        "Ljava/lang/Exception;",
        implementation.newLabelForIndex(parse),
        implementation.newLabelForIndex(parse + 2),
        implementation.newLabelForIndex(handler),
    )
    return method
}
