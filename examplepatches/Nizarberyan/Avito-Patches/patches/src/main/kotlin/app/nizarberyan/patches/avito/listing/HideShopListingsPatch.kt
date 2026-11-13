package app.nizarberyan.patches.avito.listing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.nizarberyan.patches.avito.shared.Constants.COMPATIBILITY_AVITO
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val NULL_IF_SHOP_LISTING_METHOD = "avitoPatchesNullIfShopListing"
private const val SHOULD_HIDE_SHOP_LISTINGS_METHOD = "avitoPatchesShouldHideShopListings"

private fun MutableClass.addHelperMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    accessFlags: Int,
    registers: Int,
    instructions: String,
) = methods.add(
    ImmutableMethod(
        type,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        accessFlags,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable().apply {
        addInstructionsWithLabels(0, instructions)
    },
)

@Suppress("unused")
val hideShopListingsPatch = patch(
    name = "Hide shop listings",
    description = "Hides listings posted by shops (boutiques) from the home feed and from search results. " +
        "Search results show shop listings again when a seller type is selected in the search filters.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AVITO)

    execute {
        val publishedClass = PublishedListingToStringFingerprint.classDef
        val publishedIsStoreField = PublishedListingToStringFingerprint.instructionMatches.last().fieldReference
        val premiumClass = PremiumListingToStringFingerprint.classDef
        val premiumIsStoreField = PremiumListingToStringFingerprint.instructionMatches.last().fieldReference

        val listingAdType = publishedClass.interfaces.singleOrNull()
            ?: throw PatchException("Could not find the listing ad interface")
        if (listingAdType !in premiumClass.interfaces) {
            throw PatchException("Premium listing does not implement the listing ad interface")
        }

        // Helper that returns null instead of the listing, if the listing is posted by a shop.
        val nullIfShopListing =
            "${publishedClass.type}->$NULL_IF_SHOP_LISTING_METHOD(Ljava/lang/Object;)Ljava/lang/Object;"

        publishedClass.addHelperMethod(
            name = NULL_IF_SHOP_LISTING_METHOD,
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;",
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            registers = 2,
            instructions = """
                instance-of v0, p0, ${publishedClass.type}
                if-eqz v0, :premium
                move-object v0, p0
                check-cast v0, ${publishedClass.type}
                iget-boolean v0, v0, $publishedIsStoreField
                goto :check
                :premium
                instance-of v0, p0, ${premiumClass.type}
                if-eqz v0, :keep
                move-object v0, p0
                check-cast v0, ${premiumClass.type}
                iget-boolean v0, v0, $premiumIsStoreField
                :check
                if-eqz v0, :keep
                const/4 v0, 0x0
                return-object v0
                :keep
                return-object p0
            """,
        )

        // Search results.
        val searchLoadMatch = searchPagingLoadFingerprint(listingAdType).match()
        val searchPagingSourceClass = searchLoadMatch.classDef

        val searchQueryType = SearchAdsQueryToStringFingerprint.originalClassDef.type
        val storeIdField = SearchAdsQueryToStringFingerprint.instructionMatches.last().fieldReference
        val searchQueryField = searchPagingSourceClass.fields.singleOrNull { it.type == searchQueryType }
            ?: throw PatchException("Could not find the search query field")
        val selectedSellerTypeMethod =
            selectedSellerTypeFingerprint(searchPagingSourceClass.type).originalMethod

        // Helper that decides if shop listings are hidden from a search.
        // They are kept when browsing the page of a shop,
        // and when a seller type is selected in the search filters.
        searchPagingSourceClass.addHelperMethod(
            name = SHOULD_HIDE_SHOP_LISTINGS_METHOD,
            parameters = listOf(),
            returnType = "Z",
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            registers = 2,
            instructions = """
                iget-object v0, p0, ${searchPagingSourceClass.type}->${searchQueryField.name}:$searchQueryType
                iget-object v0, v0, $storeIdField
                if-nez v0, :show
                invoke-virtual { p0 }, $selectedSellerTypeMethod
                move-result-object v0
                if-nez v0, :show
                const/4 v0, 0x1
                return v0
                :show
                const/4 v0, 0x0
                return v0
            """,
        )

        searchLoadMatch.method.apply {
            val moveResultIndex = searchLoadMatch.instructionMatches[1].index
            val listingRegister = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            val insertIndex = moveResultIndex + 1
            val freeRegister = findFreeRegister(insertIndex, listingRegister)

            // A null listing is skipped by the original code.
            addInstructionsWithLabels(
                insertIndex,
                """
                    invoke-virtual/range { p0 .. p0 }, ${searchPagingSourceClass.type}->$SHOULD_HIDE_SHOP_LISTINGS_METHOD()Z
                    move-result v$freeRegister
                    if-eqz v$freeRegister, :keep
                    invoke-static/range { v$listingRegister .. v$listingRegister }, $nullIfShopListing
                    move-result-object v$listingRegister
                """,
                ExternalLabel("keep", getInstruction(insertIndex)),
            )
        }

        // Home screen feed.
        val recommendedLoadMatch = recommendedPagingLoadFingerprint(
            RecommendedAdsQueryDocumentFingerprint.originalClassDef.type,
            listingAdType,
        ).match()

        recommendedLoadMatch.method.apply {
            val moveResultIndex = recommendedLoadMatch.instructionMatches[2].index
            val listingRegister = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            val addToListIndex = moveResultIndex + 1

            // Skip adding the listing to the list of loaded ads if it is posted by a shop.
            addInstructionsWithLabels(
                addToListIndex,
                """
                    invoke-static/range { v$listingRegister .. v$listingRegister }, $nullIfShopListing
                    move-result-object v$listingRegister
                    if-eqz v$listingRegister, :skip
                """,
                ExternalLabel("skip", getInstruction(addToListIndex + 1)),
            )
        }
    }
}
