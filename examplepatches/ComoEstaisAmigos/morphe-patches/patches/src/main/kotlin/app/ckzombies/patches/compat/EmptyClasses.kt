package app.ckzombies.patches.compat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** Every class of the OpenFeint SDK sits under this package. */
internal const val OPENFEINT_PACKAGE = "Lcom/openfeint/"

/** How many classes of it Glu's v3.1.0 ships. */
internal const val OPENFEINT_CLASSES = 319

private const val OBJECT = "Ljava/lang/Object;"

/**
 * Leaves every class in [classes] an empty shell: no fields, no methods, no annotations, no
 * source file. Morphe cannot delete a class, and this is the closest it gets.
 *
 * The name, access flags, superclass and interfaces stay, so code outside that still names these
 * types verifies exactly as before. A class that is not an interface, and whose superclasses up
 * to `Object` are all in [classes], keeps a public no-arg constructor that only calls its
 * superclass's: two classes outside the set extend such shells and call `super()`. The rest get
 * no constructor at all, since nothing creates them.
 */
internal fun emptyClasses(classes: Collection<MutableClass>) {
    val byType = classes.associateBy { it.type }
    val constructible = HashMap<String, Boolean>()

    fun keepsConstructor(c: MutableClass): Boolean = constructible.getOrPut(c.type) {
        c.accessFlags and AccessFlags.INTERFACE.value == 0 &&
            (c.superclass == OBJECT || byType[c.superclass]?.let(::keepsConstructor) == true)
    }

    // Decided up front: each answer reads superclasses, which emptying leaves as they are.
    val withConstructor = classes.filter(::keepsConstructor)

    // The dex writer reads the split sets (direct and virtual methods, static and instance
    // fields), not methods and fields, so every edit goes to both.
    for (c in classes) {
        c.methods.clear()
        c.directMethods.clear()
        c.virtualMethods.clear()
        c.fields.clear()
        c.staticFields.clear()
        c.instanceFields.clear()
        c.annotations.clear()
        c.setSourceFile(null)
    }

    for (c in withConstructor) {
        val constructor = ImmutableMethod(
            c.type,
            "<init>",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            MutableMethodImplementation(1),
        ).toMutable()
        constructor.addInstructions(
            0,
            """
                invoke-direct {p0}, ${c.superclass}-><init>()V
                return-void
            """,
        )
        c.methods.add(constructor)
        c.directMethods.add(constructor)
    }
}
