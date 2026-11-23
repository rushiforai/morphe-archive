package patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext

/**
 * Resolve exactly one method with the given owner, name, return type and parameters; zero or
 * several candidates (including legal overloads) fail patching.
 */
context(_: BytecodePatchContext)
internal fun exactMethod(owner: String, name: String, returnType: String, vararg parameters: String) =
    Fingerprint(
        definingClass = owner,
        name = name,
        returnType = returnType,
        parameters = parameters.toList(),
    ).uniqueMatch()
