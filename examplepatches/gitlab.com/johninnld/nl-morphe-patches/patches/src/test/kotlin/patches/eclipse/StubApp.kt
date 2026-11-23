package patches.eclipse

import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.io.DataInputStream
import java.io.File
import java.net.URLDecoder
import java.util.jar.JarFile
import patches.shared.stubTypeToAppType

/**
 * The app as the extension's stubs describe it: every class in the compiled stubs jar, read straight
 * from the class files (no class loading, so the Android types they mention need not exist) and
 * relocated exactly as the patch relocates references (`Lnl/johninnl/eclipse/app/X;` becomes `LX;`).
 * Linking the real extension against it proves every reference the extension makes is declared by a
 * stub; linking it against the real APK at patch time proves the stub matches build 155.
 */
internal object StubApp {
    private const val CONSTRUCTOR = 0x10000
    private const val SYNTHETIC = 0x1000
    private const val ACCESS_BITS = 0x0001 or 0x0002 or 0x0004 or 0x0008 or 0x0010 or 0x0040 or 0x0200 or 0x0400

    fun classes(): Map<String, ClassDef> {
        val anchor = StubApp::class.java.classLoader.getResource("nl/johninnl/eclipse/app/jh0.class")
            ?: error("The Eclipse stubs jar is not on the test classpath")
        val jarPath = URLDecoder.decode(anchor.path.substringAfter("file:").substringBefore("!"), "UTF-8")
        return JarFile(File(jarPath)).use { archive ->
            archive.entries().asSequence().filter { it.name.endsWith(".class") }.map { entry ->
                archive.getInputStream(entry).use { parse(DataInputStream(it.buffered())) }
            }.toList()
        }.associateBy { it.type }
    }

    private fun relocate(internalName: String): String {
        val type = "L$internalName;"
        return stubTypeToAppType("Lnl/johninnl/eclipse/app/", type) ?: type
    }

    /** Relocates every `Lnl/johninnl/eclipse/app/X;` inside a field or method descriptor. */
    private fun relocateDescriptor(descriptor: String): String =
        Regex("Lnl/johninnl/eclipse/app/[^;/]+;").replace(descriptor) { stubTypeToAppType("Lnl/johninnl/eclipse/app/", it.value)!! }

    private fun parse(input: DataInputStream): ClassDef {
        check(input.readInt() == 0xCAFEBABE.toInt()) { "Not a class file" }
        input.readUnsignedShort(); input.readUnsignedShort()
        val count = input.readUnsignedShort()
        val utf8 = arrayOfNulls<String>(count)
        val classNameIndex = IntArray(count)
        var i = 1
        while (i < count) {
            when (val tag = input.readUnsignedByte()) {
                1 -> utf8[i] = input.readUTF()
                3, 4, 9, 10, 11, 12, 17, 18 -> input.skipBytes(4)
                5, 6 -> { input.skipBytes(8); i++ }
                7 -> classNameIndex[i] = input.readUnsignedShort()
                8, 16, 19, 20 -> input.skipBytes(2)
                15 -> input.skipBytes(3)
                else -> error("Unsupported constant pool tag $tag")
            }
            i++
        }
        fun className(index: Int) = utf8[classNameIndex[index]]!!
        val flags = input.readUnsignedShort()
        val type = relocate(className(input.readUnsignedShort()))
        val superIndex = input.readUnsignedShort()
        val superclass = if (superIndex == 0) "Ljava/lang/Object;" else relocate(className(superIndex))
        val interfaces = List(input.readUnsignedShort()) { relocate(className(input.readUnsignedShort())) }
        fun skipAttributes() {
            repeat(input.readUnsignedShort()) { input.skipBytes(2); input.skipBytes(input.readInt()) }
        }
        val fields = ArrayList<Field>()
        repeat(input.readUnsignedShort()) {
            val access = input.readUnsignedShort()
            val name = utf8[input.readUnsignedShort()]!!
            val descriptor = relocateDescriptor(utf8[input.readUnsignedShort()]!!)
            skipAttributes()
            if (access and SYNTHETIC == 0) fields.add(ImmutableField(type, name, descriptor, access and ACCESS_BITS, null, emptySet(), emptySet()))
        }
        val methods = ArrayList<Method>()
        repeat(input.readUnsignedShort()) {
            val access = input.readUnsignedShort()
            val name = utf8[input.readUnsignedShort()]!!
            val descriptor = relocateDescriptor(utf8[input.readUnsignedShort()]!!)
            skipAttributes()
            if (access and SYNTHETIC != 0 || name == "<clinit>") return@repeat
            val parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(descriptor.substringAfter('(').substringBefore(')'))
                .map { ImmutableMethodParameter(it.value, emptySet(), null) }.toList()
            val dexFlags = (access and ACCESS_BITS and 0x0040.inv()) or if (name == "<init>") CONSTRUCTOR else 0
            methods.add(ImmutableMethod(type, name, parameters, descriptor.substringAfter(')'), dexFlags, emptySet(), emptySet(), null))
        }
        return ImmutableClassDef(type, flags and ACCESS_BITS, superclass, interfaces, null, emptySet(), fields, methods)
    }

    fun ClassDef.withoutField(name: String): ClassDef =
        ImmutableClassDef(type, accessFlags, superclass, interfaces, null, emptySet(), fields.filter { it.name != name }, methods)

    fun ClassDef.withoutMethod(name: String): ClassDef =
        ImmutableClassDef(type, accessFlags, superclass, interfaces, null, emptySet(), fields, methods.filter { it.name != name })

    fun ClassDef.withFlags(flags: Int): ClassDef =
        ImmutableClassDef(type, flags, superclass, interfaces, null, emptySet(), fields, methods)

    fun ClassDef.withSuperclass(parent: String): ClassDef =
        ImmutableClassDef(type, accessFlags, parent, interfaces, null, emptySet(), fields, methods)
}
