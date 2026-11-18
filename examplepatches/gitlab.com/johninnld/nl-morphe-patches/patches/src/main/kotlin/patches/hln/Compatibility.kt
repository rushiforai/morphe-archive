package patches.hln

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import patches.shared.uniqueMatch

internal const val MODEL = "Lcom/kubus/module/network/model/"
internal const val FILTER = "${MODEL}SectionResponse;"
internal val hln = Compatibility(name = "HLN", packageName = "be.persgroep.android.news.mobilehln", apkFileType = ApkFileType.APKS,
    signatures = setOf("34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4"),
    // The launch crash on 9.23.3 came from a single hook: `Lgn0;` is the app's startup
    // service locator, and truncating its constructor left `gn0->d` null, so
    // androidx.startup.InitializationProvider threw while building its ComponentName.
    // Every patch set containing "Disable tracking" (including "Skip consent screens",
    // which depends on it) therefore failed at launch. The constructor is no longer
    // touched; startup wiring is verified byte-identical to the original.
    targets = listOf(AppTarget(version = "9.23.3", versionCode = 2009230300, minSdk = 29)))
internal val originalInput = patches.shared.originalInput(hln)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun exact(cls: String, sig: String) = Fingerprint(definingClass = cls, name = sig.substringBefore('('),
    returnType = sig.substringAfter(')'), parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(sig.substringAfter('(').substringBefore(')')).map { it.value }.toList()).uniqueMatch()

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun change(cls: String, sig: String, code: String) = exact(cls, sig).method.addInstructions(0, code.trimIndent())

internal fun helper(name: String, result: String, params: List<String>, locals: Int, code: String) =
    MutableMethod(ImmutableMethod(FILTER, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.sumOf { if (it == "J" || it == "D") 2 else 1 }, emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, code.trimIndent()) }

/** Apply only when the pinned method still exists and is unique: R8 removes
 *  unused methods between releases, and a removed target means the behaviour
 *  it performed is gone from the build. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun changeIfPresent(cls: String, sig: String, code: String) {
    val matches = runCatching {
        Fingerprint(definingClass = cls, name = sig.substringBefore('('),
            returnType = sig.substringAfter(')'),
            parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
                .findAll(sig.substringAfter('(').substringBefore(')')).map { it.value }.toList()).matchAll()
    }.getOrDefault(emptyList())
    if (matches.size == 1) change(cls, sig, code)
}

/** Resolve a method that R8 may have removed between releases. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun optionalExact(cls: String, sig: String) = runCatching {
    Fingerprint(definingClass = cls, name = sig.substringBefore('('),
        returnType = sig.substringAfter(')'),
        parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
            .findAll(sig.substringAfter('(').substringBefore(')')).map { it.value }.toList()).matchAll()
}.getOrDefault(emptyList()).singleOrNull()?.method

internal const val STOP = "return-void"
internal const val FALSE = "const/4 v0, 0x0\nreturn v0"
internal const val TRUE = "const/4 v0, 0x1\nreturn v0"
// 9.23.3 maps kotlin.Unit to `Lifi;` (`.field public static final a:Lifi;`, the only
// class in the app whose toString() is "kotlin.Unit"). The 9.22.0 descriptor `Llbi;`
// now names an unrelated type, so emitting it fails with NoSuchFieldError at runtime.
internal const val UNIT = "sget-object v0, Lifi;->a:Lifi;\nreturn-object v0"
