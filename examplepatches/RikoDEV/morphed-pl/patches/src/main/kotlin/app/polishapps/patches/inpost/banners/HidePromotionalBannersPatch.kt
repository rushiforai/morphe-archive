package app.polishapps.patches.inpost.banners

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.AccessFlags

private const val CAROUSEL_BANNER_NETWORK = "Lpl/inpost/inmobile/networkModel/user/CarouselBannerNetwork;"

@Suppress("unused")
val hidePromotionalBannersPatch = bytecodePatch(
    name = "Hide promotional banners",
    description = "Removes the promotional banner carousel from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INPOST)

    execute {
        val mappers = findMethods { _, method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypeNames() == listOf(CAROUSEL_BANNER_NETWORK) &&
                method.returnType.startsWith("L") &&
                method.returnType != CAROUSEL_BANNER_NETWORK
        }
        val carouselBanner = mappers.map { (_, method) -> method.returnType }.distinct().singleOrNull()
            ?: throw PatchException("Carousel banner mapper not found: ${mappers.map { it.first.type }}")

        val observer = singleMethod("carousel banner observer") { classDef, method ->
            classDef.type != carouselBanner &&
                method.returnType == carouselBanner &&
                method.parameterTypeNames().size == 1 &&
                method.parameterTypeNames()[0] != CAROUSEL_BANNER_NETWORK &&
                method.parameterTypeNames()[0].startsWith("L") &&
                method.createsInstanceOf(carouselBanner)
        }

        observer.prependReturn(
            """
                new-instance v0, $carouselBanner
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p1
                invoke-direct {v0, p1}, $carouselBanner-><init>(Ljava/util/List;)V
                return-object v0
            """,
        )
    }
}
