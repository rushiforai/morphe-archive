package patches.bol.sponsored

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import patches.bol.shared.ModelValue
import patches.bol.shared.clearModelFields

/** Remove marked products, preserving the complete organic item and its label/price information. */
context(context: BytecodePatchContext)
internal fun filterSponsoredLists() {
    val product = Fingerprint(name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
        strings = listOf("Product(id=", ", adAuctionId=", ", isSponsored=")).matchSingle().classDef
    val flag = product.fields.single { it.name == "z" && it.type == "Z" }
    val apiProduct = "Lcom/bol/shop/shopassistant/data/model/Product;"
    val commentary = "Lcom/bol/shop/shopassistant/data/model/CommentaryProduct;"
    val sponsor = "Lcom/bol/shop/shopassistant/data/model/ProductSponsoredResponse;"
    Fingerprint(definingClass = apiProduct, name = "getProductSponsor", parameters = emptyList(), returnType = sponsor).matchSingle()
    Fingerprint(definingClass = commentary, name = "getProductDetails", parameters = emptyList(), returnType = apiProduct).matchSingle()
    val methodName = "morpheFilterSponsored"
    require(product.methods.none { it.name == methodName })
    val helper = MutableMethod(ImmutableMethod(product.type, methodName,
        listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null)), "Ljava/util/List;",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList())))
    helper.addInstructions(0, """
        if-eqz p0, :absent
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        instance-of v3, v2, ${product.type}
        if-eqz v3, :assistant
        move-object v3, v2
        check-cast v3, ${product.type}
        iget-boolean v3, v3, ${flag.definingClass}->${flag.name}:Z
        if-nez v3, :next
        goto :keep
        :assistant
        instance-of v3, v2, $commentary
        if-eqz v3, :direct
        move-object v3, v2
        check-cast v3, $commentary
        invoke-virtual {v3}, $commentary->getProductDetails()$apiProduct
        move-result-object v3
        goto :sponsor
        :direct
        instance-of v3, v2, $apiProduct
        if-eqz v3, :keep
        move-object v3, v2
        check-cast v3, $apiProduct
        :sponsor
        if-eqz v3, :keep
        invoke-virtual {v3}, $apiProduct->getProductSponsor()$sponsor
        move-result-object v3
        if-nez v3, :next
        :keep
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        return-object v0
        :absent
        return-object p0
    """.trimIndent())
    require(product.methods.add(helper))
    val filter = ModelValue.Filter("${product.type}->$methodName")
    clearModelFields("ProductsPage(dominantCategory=", mapOf("h" to filter))
    clearModelFields("ProductList(title=", mapOf("products" to filter))
    clearModelFields("ProductCommentaryResponse(intro=", mapOf("products" to filter))
    clearModelFields("CompareProductResponse(products=", mapOf("products" to filter))
    clearModelFields("PartyCardFragment(title=", mapOf("f" to ModelValue.EmptyListIfSponsored("e")))
    clearModelFields("Party(title=", mapOf("f" to ModelValue.EmptyListIfSponsored("d")))
}
