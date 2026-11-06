package app.onlynazril.patches.tiktok.customfont

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tiktok.shared.callThroughLocals
import app.morphe.patches.tiktok.shared.objectIn
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.findMutableMethodOf
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val BRIDGE = "Lapp/onlynazril/extension/tiktok/CustomFontBridge;"

/**
 * Answers every point in the app that resolves a face of its own.
 *
 * TikTok bundles two families of its own faces (TikTok Display and
 * TikTok Text) and resolves them through several engines, each with its
 * own way in:
 *
 *  - the native factory (a static nine-parameter resolver) for the
 *    app's own views, paints and the live SDK;
 *  - the Compose loader (an instance `(Context, request)` method) for
 *    `AndroidComposeView`'s own FontFamily resolver, which is what the
 *    Settings and privacy screen draws through;
 *  - the app's asset loader (a static `(AssetManager, path)` method that
 *    calls `Typeface.createFromAsset`) for Lynx, whose own TypefaceCache
 *    reads the bundled files through it;
 *  - the WebView font interceptor (a `WebResourceResponse` for a
 *    `WebView`) for hybrid (H5) pages - Activity Center, Manage posts -
 *    which Chromium draws and the app only feeds font bytes.
 *
 * All four are found by shape rather than by name, because the class and
 * method names rename with every build, and all four are hooked while
 * the switch in Tweaks says so. The two face resolvers answer whatever
 * they are asked for; the asset loader and the WebView interceptor are
 * guarded, because they also carry sticker and editor faces (the asset
 * loader) or every request on the page (the interceptor) - the bridge
 * keeps only what is TikTok's own.
 *
 * What it cannot do is keep the weights: the resolvers ask for faces by
 * weight (bold, medium) and the file carries one face, so a style that
 * needs a heavier face draws in the file's own.
 *
 * The picker's answer rides on the foundation activity's
 * onActivityResult, which the activities the Tweaks screen lives
 * in inherit: every activity result in the app passes through it,
 * and the bridge keeps only the font picker's own request.
 */
@Suppress("unused")
val tiktokCustomFontPatch = bytecodePatch(
    name = "Custom font",
    description = "Answers every resolver TikTok gets one of its own faces from - the native " +
        "factory, the Compose loader, the asset loader Lynx reads and the WebView interceptor " +
        "hybrid pages are fed through - so an imported font file replaces TikTok's own text on " +
        "every surface. The switch and the picker are in Tweaks; off by default, and inert until " +
        "a font is imported.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        // The four entry points, each found by its shape rather than its
        // name (both rename with every build). Two of them read the
        // bundled faces in a method of their own; the asset loader and
        // the WebView interceptor take a path or a request instead.
        val nativeFactories = mutableListOf<FontResolver>()
        val composeLoaders = mutableListOf<FontResolver>()
        val assetLoaders = mutableListOf<FontResolver>()
        val webFontMethods = mutableListOf<FontResolver>()
        classDefForEach { classDef ->
            if (classDef.readsBundledFaces()) {
                classDef.methods.firstOrNull { it.isNativeFontFactory() }
                    ?.let { nativeFactories += FontResolver(classDef, it) }
                classDef.methods.firstOrNull { it.isComposeFontLoader() }
                    ?.let { composeLoaders += FontResolver(classDef, it) }
            }
            classDef.methods.firstOrNull { it.isAssetFontLoader() }
                ?.let { assetLoaders += FontResolver(classDef, it) }
            if (classDef.readsTikTokFontAssets()) {
                classDef.methods.filter { it.isWebFontInterceptor() }
                    .forEach { webFontMethods += FontResolver(classDef, it) }
            }
        }

        val nativeFactory = nativeFactories.singleOrNull()
            ?: throw PatchException(
                "Custom font: expected one factory reading ${FONT_KEYS} " +
                    "with the nine-parameter resolver, found ${nativeFactories.size}: " +
                    "${nativeFactories.joinToString { it.holder.type }}.",
            )
        val composeLoader = composeLoaders.singleOrNull()
            ?: throw PatchException(
                "Custom font: expected one Compose loader reading ${FONT_KEYS} " +
                    "with a (Context, request) resolver, found ${composeLoaders.size}: " +
                    "${composeLoaders.joinToString { it.holder.type }}.",
            )
        val assetLoader = assetLoaders.singleOrNull()
            ?: throw PatchException(
                "Custom font: expected one asset loader (AssetManager, path) creating a face " +
                    "from an asset, found ${assetLoaders.size}: " +
                    "${assetLoaders.joinToString { it.holder.type }}.",
            )
        val webFontClasses = webFontMethods.map { it.holder.type }.distinct()
        if (webFontMethods.isEmpty() || webFontClasses.size != 1) {
            throw PatchException(
                "Custom font: expected the WebView font interceptors on one class reading a " +
                    "bundled face, found ${webFontMethods.size} on ${webFontClasses.size}: " +
                    "${webFontClasses.joinToString()}.",
            )
        }

        // The two face resolvers answer whatever they are asked for.
        mutableClassDefBy(nativeFactory.holder.type)
            .findMutableMethodOf(nativeFactory.method)
            .answerWithCustomFont()
        mutableClassDefBy(composeLoader.holder.type)
            .findMutableMethodOf(composeLoader.method)
            .answerWithCustomFont()

        // The asset loader is asked for every asset font, so the bridge
        // answers only the bundled faces by path.
        mutableClassDefBy(assetLoader.holder.type)
            .findMutableMethodOf(assetLoader.method)
            .answerAssetWithCustomFont()

        // The WebView interceptor answers a page's font request with the
        // imported file's bytes; every other request falls through.
        webFontMethods.forEach { resolver ->
            mutableClassDefBy(resolver.holder.type)
                .findMutableMethodOf(resolver.method)
                .answerWebRequestsWithCustomFont(resolver.method.parameterTypes[1].toString())
        }

        // A hybrid page does not always ask for the bundled face, so the
        // interceptor alone can leave the page on its own fonts. The base
        // WebView client every font interceptor extends is where a page
        // reports it finished; the bridge injects the imported face there.
        val pageFinished = findPageFinished(classDefBy(webFontMethods.first().holder.type))
            ?: throw PatchException(
                "Custom font: no onPageFinished on the WebView client behind " +
                    "${webFontMethods.first().holder.type}, so the page cannot be given the face.",
            )
        pageFinished.addInstruction(
            0,
            "invoke-static {p1, p2}, $BRIDGE->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )

        // The picker's answer: the foundation activity delivers every
        // activity result through this method, so the picker's file
        // arrives here whatever activity asked for it. The bridge
        // keeps only its own request code; everything else falls
        // through to the app's own handling.
        BaseActivityOnActivityResultFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static/range {p0 .. p3}, $BRIDGE->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)V
                """.trimIndent(),
            )
        }
    }
}

/** A class that answers a face of TikTok's own, and the method that hands one back. */
private data class FontResolver(val holder: ClassDef, val method: Method)

/** Whether the class reads one of the bundled faces TikTok draws with. */
private fun ClassDef.readsBundledFaces(): Boolean = methods.any { method ->
    method.implementation?.instructions?.any { instruction ->
        instruction is ReferenceInstruction
                && instruction.opcode == Opcode.CONST_STRING
                && (instruction.reference as? StringReference)?.string in FONT_KEYS
    } == true
}

/** Whether the class reads any face TikTok bundles, the variable one included. */
private fun ClassDef.readsTikTokFontAssets(): Boolean = methods.any { method ->
    method.implementation?.instructions?.any { instruction ->
        instruction is ReferenceInstruction
                && instruction.opcode == Opcode.CONST_STRING
                && (instruction.reference as? StringReference)?.string?.startsWith("font/TikTok") == true
    } == true
}

/** The native factory's shape: static, the nine-parameter resolver. */
private fun Method.isNativeFontFactory(): Boolean =
    returnType == FACTORY_RETURN
            && parameterTypes == FACTORY_PARAMETERS
            && implementation != null
            && AccessFlags.STATIC.isSet(accessFlags)

/**
 * The Compose loader's shape: an instance method taking the Context and
 * the app's font request and answering the face. The request type is
 * obfuscated, so it is matched by position and not by name.
 */
private fun Method.isComposeFontLoader(): Boolean =
    returnType == FACTORY_RETURN
            && implementation != null
            && !AccessFlags.STATIC.isSet(accessFlags)
            && parameterTypes.size == 2
            && parameterTypes.first() == COMPOSE_LOADER_CONTEXT

/**
 * The asset loader's shape: static, the AssetManager and the path, and
 * the body creates the face from the asset. What separates it from any
 * other two-parameter `Typeface` method is that body, not its name.
 */
private fun Method.isAssetFontLoader(): Boolean =
    returnType == FACTORY_RETURN
            && implementation != null
            && AccessFlags.STATIC.isSet(accessFlags)
            && parameterTypes == listOf(ASSET_LOADER_ASSET_MANAGER, ASSET_LOADER_PATH)
            && createsFaceFromAsset()

/**
 * The `onPageFinished` the WebView client behind [start] inherits.
 *
 * The interceptor is an anonymous subclass. It often does not override the
 * finished callback, so the method is looked up on the superclass chain. The
 * class names rename every build, but the relationship does not: the client
 * the font interceptor extends is the one a page reports to.
 */
private fun BytecodePatchContext.findPageFinished(start: ClassDef): MutableMethod? {
    var type: String? = start.type
    var depth = 0
    while (type != null && depth++ < 12) {
        val classDef = classDefByOrNull(type) ?: return null
        val method = classDef.methods.firstOrNull {
            it.name == "onPageFinished" &&
                it.parameterTypes == listOf(WEB_FONT_VIEW, WEB_FONT_URL) &&
                it.returnType == "V" &&
                it.implementation != null
        }
        if (method != null) return mutableClassDefBy(type).findMutableMethodOf(method)
        type = classDef.superclass
    }
    return null
}

/** Whether the body calls `Typeface.createFromAsset`. */
private fun Method.createsFaceFromAsset(): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { instruction ->
        instruction is ReferenceInstruction
                && (instruction.reference as? MethodReference)?.let {
                    it.definingClass == FACTORY_RETURN && it.name == "createFromAsset"
                } == true
    }
}

/** The WebView interceptor's shape: a response for a WebView, either overload. */
private fun Method.isWebFontInterceptor(): Boolean =
    returnType == WEB_FONT_RESPONSE
            && implementation != null
            && !AccessFlags.STATIC.isSet(accessFlags)
            && parameterTypes.size == 2
            && parameterTypes.first() == WEB_FONT_VIEW
            && (parameterTypes[1] == WEB_FONT_REQUEST || parameterTypes[1] == WEB_FONT_URL)

/**
 * Answers the bridge's face at the method's entry, and lets the
 * app's own resolution stand when there is none. The result lands in
 * v0, the first local, so the fall-through path never sees a
 * parameter rewritten: the frame carries twelve locals against the
 * nine parameters, and the check below refuses a frame that does not.
 */
private fun MutableMethod.answerWithCustomFont() {
    val patch = "Custom font"
    requireLocals(patch, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $BRIDGE->typeface()Landroid/graphics/Typeface;
            move-result-object v0
            if-eqz v0, :morphe_customfont_keep
            return-object v0
            :morphe_customfont_keep
            nop
        """.trimIndent(),
    )
}

/**
 * Answers the bridge after the asset path, which is the second parameter
 * of the loader: the bridge keeps the app's own resolution for every path
 * that is not one of TikTok's bundled faces.
 */
private fun MutableMethod.answerAssetWithCustomFont() {
    val patch = "Custom font"
    requireLocals(patch, 1)
    val call = callThroughLocals(
        patch,
        "invoke-static",
        "$BRIDGE->typefaceFor($ASSET_LOADER_PATH)$FACTORY_RETURN",
        objectIn("p1"),
    )
    addInstructionsWithLabels(
        0,
        """
            $call
            move-result-object v0
            if-eqz v0, :morphe_customfont_keep
            return-object v0
            :morphe_customfont_keep
            nop
        """.trimIndent(),
    )
}

/**
 * Answers a page's font request with the imported file, and lets every
 * other request fall through to the app's own WebView client. [request]
 * is the interceptor's second parameter, which is the request object or
 * the URL alone, depending on the overload.
 */
private fun MutableMethod.answerWebRequestsWithCustomFont(request: String) {
    val patch = "Custom font"
    requireLocals(patch, 1)
    val call = callThroughLocals(
        patch,
        "invoke-static",
        "$BRIDGE->webFont($WEB_FONT_VIEW$request)$WEB_FONT_RESPONSE",
        objectIn("p1"),
        objectIn("p2"),
    )
    addInstructionsWithLabels(
        0,
        """
            $call
            move-result-object v0
            if-eqz v0, :morphe_customfont_keep
            return-object v0
            :morphe_customfont_keep
            nop
        """.trimIndent(),
    )
}
