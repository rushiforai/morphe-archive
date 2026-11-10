package app.zdrgon.patches.strava.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Option
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableBooleanEncodedValue.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableBooleanEncodedValue
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.util.logging.Logger

internal const val STRAVA_EXTENSION = "extensions/strava.mpe"
internal const val HIDE_DISTRACTIONS_CLASS_DESCRIPTOR =
    "Lapp/template/extension/strava/HideDistractionsPatch;"

private const val MODULAR_FRAMEWORK_CLASS_DESCRIPTOR_PREFIX = "Lcom/strava/modularframework"
private const val METHOD_SUFFIX = "\$original"

private data class FilterablePropertyFingerprint(
    val name: String,
    val parameterTypes: List<String> = listOf(),
)

private val fingerprints = arrayOf(
    FilterablePropertyFingerprint("ChildrenEntries"),
    FilterablePropertyFingerprint("Entries"),
    FilterablePropertyFingerprint("Field", listOf("Ljava/lang/String;")),
    FilterablePropertyFingerprint("Fields"),
    FilterablePropertyFingerprint("MenuItems"),
    FilterablePropertyFingerprint("Modules"),
    FilterablePropertyFingerprint("Properties"),
    FilterablePropertyFingerprint("StateMap"),
    FilterablePropertyFingerprint("Submodules"),
)

/**
 * Best-effort: writes each option's value into the static boolean field
 * of the HideDistractionsPatch extension class that has the same name
 * as the option's key, seeding the patch-time default.
 *
 * This write must never fail the patch. Patcher 2.1-dev (Morphe Manager
 * 2.3.0-dev) does not populate the extension class's fields in the
 * class pool at patch-execution time, so the lookup can come up empty
 * even though the field exists. Skipping is harmless: the extension
 * bakes the same defaults as field initializers, and the runtime
 * settings store is the real control surface.
 */
internal fun BytecodePatchContext.writeHideDistractionsOptions(
    options: Array<Option<Boolean>>,
) {
    val logger = Logger.getLogger("StravaModularFilter")
    val extensionClass = mutableClassDefBy(HIDE_DISTRACTIONS_CLASS_DESCRIPTOR)

    options.forEach { option ->
        val field = extensionClass.staticFields.firstOrNull { field -> field.name == option.key }
        if (field == null) {
            logger.warning(
                "Skipping patch-time default for '${option.key}': extension field not " +
                    "visible to this patcher version; the baked-in default applies.",
            )
            return@forEach
        }
        field.initialValue =
            ImmutableBooleanEncodedValue.forBoolean(option.value == true).toMutable()
    }
}

/**
 * Intercepts the property getters of Strava's server-driven modular
 * framework (feed cards, promos, upsells and other modular screens all
 * come through these models). Each intercepted getter is renamed to
 * `<name>$original`, and a same-signature replacement is installed that
 * first calls the matching static `filter<Name>` method of the
 * HideDistractionsPatch extension class, which in turn calls the
 * original getter and drops the elements the user chose to hide.
 *
 * Classes whose getters have no matching extension filter (different
 * parameter type) are skipped silently, so unrelated modular classes
 * are never touched.
 */
internal fun BytecodePatchContext.interceptModularFrameworkGetters() {
    val logger = Logger.getLogger("StravaModularFilter")
    val extensionClass = classDefBy(HIDE_DISTRACTIONS_CLASS_DESCRIPTOR)

    fun MutableMethod.cloneAndIntercept(
        classDef: MutableClass,
        extensionMethodName: String,
        extensionMethodParameterTypes: List<String>,
    ) {
        val extensionMethodReference = ImmutableMethodReference(
            HIDE_DISTRACTIONS_CLASS_DESCRIPTOR,
            extensionMethodName,
            extensionMethodParameterTypes,
            returnType,
        )

        if (extensionClass.directMethods.none { method ->
                MethodUtil.methodSignaturesMatch(method, extensionMethodReference)
            }
        ) {
            // Many Strava classes under modularframework include similarly named getters
            // but are not compatible with this extension hook set. Avoid alarming logs.
            logger.fine("Skipped interception of $this due to missing $extensionMethodReference")
            return
        }

        classDef.virtualMethods -= this

        val clone = ImmutableMethod.of(this).toMutable()

        classDef.virtualMethods += clone

        if (implementation != null) {
            val registers = List(extensionMethodParameterTypes.size) { index -> "p$index" }.joinToString(
                separator = ",",
                prefix = "{",
                postfix = "}",
            )

            clone.addInstructions(
                0,
                """
                    invoke-static $registers, $extensionMethodReference
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )

            logger.fine("Intercepted $this with $extensionMethodReference")
        }

        name += METHOD_SUFFIX

        classDef.virtualMethods += this
    }

    val classDefByType = HashMap<String, ClassDef>().apply {
        classDefForEach { classDef ->
            put(classDef.type, classDef)
        }
    }

    classDefForEach { classDef ->
        // Classes in the modular framework packages, plus any class elsewhere
        // that implements one of the modular framework interfaces. The second
        // case matters: Strava ships obfuscated decorator implementations of
        // ModularEntry outside the framework packages (for example `ipz`, a
        // delegating wrapper). The interception adds $original declarations
        // to the interfaces, so every implementor must be intercepted too,
        // otherwise a call to an $original method on a missed implementor
        // throws AbstractMethodError at runtime.
        if (!classDef.type.startsWith(MODULAR_FRAMEWORK_CLASS_DESCRIPTOR_PREFIX) &&
            classDef.interfaces.none {
                it.startsWith(MODULAR_FRAMEWORK_CLASS_DESCRIPTOR_PREFIX)
            }
        ) {
            return@classDefForEach
        }

        val mutableClass = mutableClassDefBy(classDef)

        classDef.methods.forEach { method ->
            val fingerprint = fingerprints.find { fp ->
                method.name == "get${fp.name}" && method.parameterTypes == fp.parameterTypes
            } ?: return@forEach

            // Upcast to the interface if this is an interface implementation.
            val parameterType = classDef.interfaces.firstOrNull { interfaceType ->
                classDefByType[interfaceType]?.methods?.any { interfaceMethod ->
                    MethodUtil.methodSignaturesMatch(interfaceMethod, method)
                } == true
            } ?: classDef.type

            mutableClass.methods.first { mutableMethod ->
                MethodUtil.methodSignaturesMatch(mutableMethod, method)
            }.cloneAndIntercept(
                mutableClass,
                "filter${fingerprint.name}",
                listOf(parameterType) + fingerprint.parameterTypes,
            )
        }
    }
}
