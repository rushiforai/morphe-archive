/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by counting the push process's threads on 450 across returns after Android's idle stop
 * (2026-10-10).
 */
package app.morphe.patches.threads.misc.fbns

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.declaredInHierarchy
import app.morphe.util.getReference
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Threads' in-app push service. A manifest name is never obfuscated. */
internal const val PUSH_SERVICE = "Lcom/facebook/rti/pushv2/inapp/InappFbnsService;"

/** [PUSH_SERVICE] as the manifest writes it. */
internal const val PUSH_SERVICE_NAME = "com.facebook.rti.pushv2.inapp.InappFbnsService"

internal const val FBNS_PROCESS = "$EXTENSION_PACKAGE/misc/FbnsProcess;"

private const val PUSH_PROCESS_SUFFIX = ":fbns"

/** The components the manifest runs in the push process, by name. */
internal fun pushProcessComponents(document: Document): List<String> =
    listOf("activity", "activity-alias", "service", "receiver", "provider").flatMap { tag ->
        val nodes = document.getElementsByTagName(tag)
        (0 until nodes.length).map { nodes.item(it) as Element }
    }.filter { it.getAttribute("android:process").endsWith(PUSH_PROCESS_SUFFIX) }
        .map { it.getAttribute("android:name") }

/**
 * Ending the push process is only safe while the in-app push service is all it runs, so the
 * manifest has to say exactly that.
 */
internal val pushProcessManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use(::requirePushServiceAlone)
    }
}

internal fun requirePushServiceAlone(document: Document) {
    val components = pushProcessComponents(document)
    if (components != listOf(PUSH_SERVICE_NAME)) {
        throw PatchException("The push process runs $components rather than $PUSH_SERVICE_NAME alone, so ending it could stop something else")
    }
}

/**
 * Part of every build, with no name to deselect it by: the settings patch, which every HushThreads
 * patch depends on, depends on this one. Android stops the push service about a minute after Threads
 * goes to the background and keeps its process, and every start after that leaves the stopped
 * service's threads behind (#6), on stock Threads as much as on a patched one. The extension ends
 * the process once the service is gone, see FbnsProcess.
 */
internal val pushProcessPatch = bytecodePatch {
    dependsOn(threadsExtensionPatch, pushProcessManifestPatch)

    execute {
        reportPushServiceLifecycle()
    }
}

/** First thing in the push service's onCreate and onDestroy, the extension hears of each. */
internal fun BytecodePatchContext.reportPushServiceLifecycle() {
    val (created, destroyed) = pushServiceLifecycle()
    created.addInstruction(0, "invoke-static {}, $FBNS_PROCESS->serviceCreated()V")
    destroyed.addInstruction(0, "invoke-static {}, $FBNS_PROCESS->serviceDestroyed()V")
}

/**
 * The delegate methods the push service's onCreate and onDestroy run, in the class that implements
 * each. Meta's services forward every lifecycle call from a final method of their shared base to a
 * delegate object, which the base builds from the class name the service returns, its one string.
 */
internal fun BytecodePatchContext.pushServiceLifecycle(): Pair<MutableMethod, MutableMethod> {
    val service = classDefByOrNull(PUSH_SERVICE) ?: throw PatchException("Threads has no $PUSH_SERVICE_NAME")
    val delegate = pushDelegate(service)
    val delegateTypes = superclassChain(delegate).toSet()
    return forwardedTo(delegate, delegateTypes, "onCreate") to forwardedTo(delegate, delegateTypes, "onDestroy")
}

/**
 * The delegate class the push service builds. 452 names it in an override of the service's own
 * no-argument String method. 453 moved that choice into the shared service base, which picks a
 * class by an `instance-of` on the service and then loads the class name: follow that edge, and
 * keep the direct method for builds that still carry it.
 */
private fun BytecodePatchContext.pushDelegate(service: ClassDef): String {
    val named = service.methods
        .filter { it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" }
        .flatMap { method -> method.implementation?.instructions?.mapNotNull { it.getReference<StringReference>()?.string }.orEmpty() }
    val fromInstanceOf = superclassChain(PUSH_SERVICE).flatMap { type ->
        (classDefByOrNull(type)?.methods ?: emptySet()).flatMap { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode != Opcode.INSTANCE_OF || instruction.getReference<TypeReference>()?.type != PUSH_SERVICE) {
                    return@mapIndexedNotNull null
                }
                instructions.drop(index + 1).take(6).firstNotNullOfOrNull { next ->
                    next.getReference<StringReference>()?.string
                }
            }
        }
    }.distinct()
    val names = (named + fromInstanceOf).distinct()
    val delegate = names.singleOrNull()?.let { "L" + it.replace('.', '/') + ";" }
        ?: throw PatchException("$PUSH_SERVICE_NAME doesn't name its delegate in one string: $names")
    if (classDefByOrNull(delegate) == null) throw PatchException("$PUSH_SERVICE_NAME names $delegate, which Threads doesn't have")
    return delegate
}

/** The method of [delegate] that the push service's [lifecycle] call runs. */
private fun BytecodePatchContext.forwardedTo(delegate: String, delegateTypes: Set<String>, lifecycle: String): MutableMethod {
    val calls = declaredInHierarchy(PUSH_SERVICE, lifecycle).implementation!!.instructions.mapNotNull { instruction ->
        instruction.getReference<MethodReference>()?.takeIf {
            instruction.opcode == Opcode.INVOKE_VIRTUAL && it.definingClass in delegateTypes &&
                it.parameterTypes.isEmpty() && it.returnType == "V"
        }
    }
    val call = calls.singleOrNull()
        ?: throw PatchException("$PUSH_SERVICE_NAME's $lifecycle makes ${calls.size} calls to its delegate, expected 1")
    return declaredInHierarchy(delegate, call.name)
}
