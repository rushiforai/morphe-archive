package semicoloncolonel.mobilestream.patches.costco.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.costco.shared.Constants

// Costco 26.10.2.2. The home, search, and category pages come from Costco's
// own server, which the app asks with a BffRequest. Besides the page itself,
// the request carries three ad requests: Criteo (sponsored products),
// AdButler, and AdPrism. The server adds the ads they ask for to the page.
// Each is optional, and the app's own default leaves all three empty. The
// request's constructor now clears them, and setCriteoRequest does nothing,
// so the server returns the page without sponsored placements.

private const val BFF_REQUEST = "Lcom/costco/app/core/model/network/BffRequest;"
private const val ADBUTLER = "Lcom/costco/app/core/model/network/AdbutlerRequest;"
private const val CRITEO = "Lcom/costco/app/core/model/network/CriteoRequest;"
private const val ADPRISM = "Lcom/costco/app/core/model/network/AdPrismRequest;"

@Suppress("unused")
val hideSponsoredProductsPatch = bytecodePatch(
    name = "Hide sponsored products",
    description = "Removes the sponsored products and ads from the home page, search results, and category pages.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val request = mutableClassDefBy(BFF_REQUEST)
        // The constructor that takes the ad requests directly (not the
        // serializer's, which starts with an int, nor the defaults bridge).
        val constructor = request.methods.firstOrNull { method ->
            val types = method.parameterTypes.map { it.toString() }
            method.name == "<init>" && types.firstOrNull() == ADBUTLER && types.last() == "Ljava/lang/Boolean;"
        } ?: throw PatchException("Costco: the BffRequest constructor was not found")

        val types = constructor.parameterTypes.map { it.toString() }
        val clears = listOf(ADBUTLER, CRITEO, ADPRISM).map { type ->
            val index = types.indexOf(type)
            if (index < 0) throw PatchException("Costco: $type is not a BffRequest parameter")
            // p0 is this; no parameter before these is a long or double.
            "const/16 p${index + 1}, 0x0"
        }
        constructor.addInstructions(0, clears.joinToString("\n"))

        request.methods.firstOrNull { it.name == "setCriteoRequest" }
            ?.addInstructions(0, "return-void")
            ?: throw PatchException("Costco: setCriteoRequest was not found")
    }
}
