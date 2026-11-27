package app.polishapps.patches.inpost.banners

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.constructorStrings
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.AccessFlags

private const val CAROUSEL_BANNER_NETWORK = "Lpl/inpost/inmobile/networkModel/user/CarouselBannerNetwork;"
private const val ON_IN_APP_LISTENER = "Lcom/synerise/sdk/injector/inapp/OnInAppListener;"
private const val IN_APP_MESSAGE_DATA = "Lcom/synerise/sdk/injector/inapp/InAppMessageData;"

@Suppress("unused")
val hidePromotionalBannersPatch = bytecodePatch(
    name = "Hide promotional banners",
    description = "Removes the promotional banner carousel from the home screen, " +
        "blocks Synerise full-screen in-app ads, and suppresses the animated splash video.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INPOST)

    execute {
        // --- Carousel banner (home screen) ---

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

        // --- Synerise full-screen in-app messages ---

        val inAppListener = singleMethod("Synerise OnInAppListener.shouldShow") { classDef, method ->
            classDef.superclass == ON_IN_APP_LISTENER &&
                !classDef.type.startsWith("Lcom/synerise/") &&
                method.name == "shouldShow" &&
                method.returnType == "Z" &&
                method.parameterTypeNames() == listOf(IN_APP_MESSAGE_DATA)
        }
        inAppListener.prependReturn(
            """
                const/4 p0, 0x0
                return p0
            """,
        )

        // --- Animated splash video on startup ---

        val shouldShowSplash = singleMethod("ShouldShowAnimatedSplashUseCaseImpl") { classDef, method ->
            classDef.constructorStrings().contains("dateTimeProvider") &&
                method.name != "<init>" && method.name != "<clinit>" &&
                method.returnType == "Z" &&
                method.parameterTypes.size == 1 &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL &&
                        ((instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                            ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                            ?.definingClass == "Lorg/threeten/bp/ZonedDateTime;"
                } == true
        }
        shouldShowSplash.prependReturn(
            """
                const/4 p0, 0x0
                return p0
            """,
        )
    }
}
