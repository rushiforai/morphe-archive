package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.modelConstructor

// Truth Social 1.28.3. The server sends every poll's vote counts, but the
// app shows them only after you vote. Before you vote, the patch adds each
// option's share of the votes to its label ("Yes · 62%"), so you can see
// the results and still vote. PollPreview does this at the start of the
// Poll constructor, with the options, total, voted, and expired values.
private const val POLL_PREVIEW = "Lsemicoloncolonel/mobilestream/extension/truthsocial/PollPreview;"

@Suppress("unused")
val showPollResultsPatch = bytecodePatch(
    name = "Show poll results",
    description = "Shows each option's share of the votes before you vote. You can still vote.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val constructor = modelConstructor("Lcom/truthsocial/core/data/models/Poll;")
        val names = constructor.parameters.map { parameter ->
            parameter.annotations.firstNotNullOfOrNull { annotation ->
                (annotation.elements.firstOrNull { it.name == "name" }?.value as? StringEncodedValue)?.value
            }
        }
        // Registers of the parameters: p0 is the Poll, and none is wide.
        val implementation = constructor.implementation!!
        val firstParameter = implementation.registerCount - constructor.parameterTypes.size - 1
        fun register(name: String, type: String): Int {
            val index = names.indexOf(name)
            if (index < 0 || constructor.parameterTypes[index].toString() != type) {
                throw PatchException("Poll \"$name\" not found as $type")
            }
            return firstParameter + 1 + index
        }
        val registers = listOf(
            register("options", "Ljava/util/List;"),
            register("votes_count", "I"),
            register("voted", "Ljava/lang/Boolean;"),
            register("expired", "Z"),
        )
        if (registers.any { it > 15 }) throw PatchException("Poll constructor registers out of range")
        constructor.addInstructions(
            0,
            "invoke-static { ${registers.joinToString { "v$it" }} }, " +
                "$POLL_PREVIEW->annotate(Ljava/util/List;ILjava/lang/Boolean;Z)V",
        )
    }
}
