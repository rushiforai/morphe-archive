package app.jimaku.patches

/**
 * Every method of Morphe Patches the Jimaku extension calls at runtime, by class descriptor,
 * as name, parameter descriptors and return descriptor.
 *
 * Jimaku is compiled against a stub of these and shipped separately, so a Morphe Patches release
 * that moved or renamed one would still patch and then throw NoSuchMethodError in the app.
 * Checking them at patch time turns that into a patch error that names what is missing.
 */
internal val REQUIRED_HOST_METHODS: Map<String, Set<String>> = mapOf(
    "Lapp/morphe/extension/youtube/addon/AddOnApi;" to setOf(
        "addPlayerOverlayButtonsListener(Ljava/util/function/Consumer;)V",
        "addNewVideoStartedListener(Ljava/lang/Runnable;)V",
        "addVideoIdListener(Ljava/util/function/Consumer;)V",
        "addVideoStateListener(Ljava/util/function/Consumer;)V",
        "addVideoTimeListener(Ljava/util/function/LongConsumer;)V",
    ),
    "Lapp/morphe/extension/shared/Utils;" to setOf(
        "getContext()Landroid/content/Context;",
        "isDarkModeEnabled()Z",
    ),
    "Lapp/morphe/extension/youtube/patches/VideoInformation;" to setOf(
        "getVideoTime()J",
        "getVideoLength()J",
        "lastVideoIdIsShort()Z",
    ),
    "Lapp/morphe/extension/youtube/shared/PlayerType;" to setOf(
        "getCurrent()Lapp/morphe/extension/youtube/shared/PlayerType;",
    ),
    "Lapp/morphe/extension/youtube/shared/PlayerControlsVisibility;" to setOf(
        "getCurrent()Lapp/morphe/extension/youtube/shared/PlayerControlsVisibility;",
    ),
)

/** A method as the host check sees it. */
internal class HostMethod(
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
    val isPublicStatic: Boolean,
) {
    val signature get() = name + "(" + parameterTypes.joinToString("") + ")" + returnType
}

/**
 * The required methods that are missing, changed, or not public and static, by
 * `Class.method(...)`. A missing class is named by itself.
 *
 * @param methodsOf the methods of a class by descriptor, or null if the app has no such class.
 */
internal fun missingHostMethods(
    required: Map<String, Set<String>>,
    methodsOf: (String) -> List<HostMethod>?,
): List<String> = required.flatMap { (classDescriptor, signatures) ->
    val className = classDescriptor.removePrefix("L").removeSuffix(";").replace('/', '.')
    val methods = methodsOf(classDescriptor) ?: return@flatMap listOf(className)
    signatures
        .filter { signature -> methods.none { it.isPublicStatic && it.signature == signature } }
        .map { "$className.$it" }
}.sorted()

internal fun hostIncompatibleMessage(missing: List<String>) =
    "Jimaku needs Morphe's YouTube patches, applied in the same run. " +
        "Select both sources in Expert mode and keep Morphe's default patches on. " +
        "If you did, this Jimaku release doesn't fit the Morphe patches version you use. " +
        "Missing or changed: " + missing.joinToString()
