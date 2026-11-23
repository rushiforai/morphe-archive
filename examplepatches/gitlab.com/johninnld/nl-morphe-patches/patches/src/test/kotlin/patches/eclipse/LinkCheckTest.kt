package patches.eclipse

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Link-check logic on small fixtures: what must pass, and each way a drifted app must fail. */
class LinkCheckTest {
    private val publicFlag = AccessFlags.PUBLIC.value
    private val publicStatic = publicFlag or AccessFlags.STATIC.value
    private val publicFinal = publicFlag or AccessFlags.FINAL.value
    private val publicConstructor = publicFlag or AccessFlags.CONSTRUCTOR.value

    private fun field(owner: String, name: String, type: String, flags: Int): Field =
        ImmutableField(owner, name, type, flags, null, emptySet(), emptySet())

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, flags: Int): Method =
        ImmutableMethod(owner, name, parameters.map { ImmutableMethodParameter(it, emptySet(), null) }, returns, flags,
            emptySet(), emptySet(), null)

    private fun cls(
        type: String, flags: Int = publicFlag, superclass: String? = "Ljava/lang/Object;",
        interfaces: List<String> = emptyList(), fields: List<Field> = emptyList(), methods: List<Method> = emptyList(),
    ): ClassDef = ImmutableClassDef(type, flags, superclass, interfaces, null, emptySet(), fields, methods)

    private fun invoke(opcode: Opcode, owner: String, name: String, parameters: List<String>, returns: String) =
        ImmutableInstruction35c(opcode, 0, 0, 0, 0, 0, 0, ImmutableMethodReference(owner, name, parameters, returns))

    private fun fieldAccess(opcode: Opcode, owner: String, name: String, type: String) =
        if (opcode.name.startsWith("s")) ImmutableInstruction21c(opcode, 0, ImmutableFieldReference(owner, name, type))
        else ImmutableInstruction22c(opcode, 0, 1, ImmutableFieldReference(owner, name, type))

    private fun typeUse(opcode: Opcode, type: String) = ImmutableInstruction21c(opcode, 0, ImmutableTypeReference(type))

    /** An extension class whose single method executes [instructions]. */
    private fun caller(
        vararg instructions: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
        superclass: String? = "Ljava/lang/Object;",
    ): ClassDef {
        val type = "Lnl/johninnl/eclipse/auto/app/Caller;"
        val implementation = ImmutableMethodImplementation(2, instructions.toList(), emptyList(), emptyList())
        val method = ImmutableMethod(type, "run", emptyList(), "V", publicStatic, emptySet(), emptySet(), implementation)
        return ImmutableClassDef(type, publicFlag, superclass, emptyList(), null, emptySet(), emptyList(), listOf(method))
    }

    private fun check(extension: ClassDef, vararg app: ClassDef): LinkReport {
        val byType = app.associateBy { it.type }
        return linkCheck(listOf(extension), byType::get)
    }

    private val player = cls("Ljh0;", fields = listOf(field("Ljh0;", "K0", "Ly0c;", publicStatic or AccessFlags.FINAL.value)),
        methods = listOf(method("Ljh0;", "P", listOf("Ljava/util/List;", "I", "Lke8;"), "V", publicFlag)))

    @Test fun resolvesFieldsMethodsConstructorsAndTypesTheAppDefines() {
        val report = check(caller(
            fieldAccess(Opcode.SGET_OBJECT, "Ljh0;", "K0", "Ly0c;"),
            invoke(Opcode.INVOKE_VIRTUAL, "Ljh0;", "P", listOf("Ljava/util/List;", "I", "Lke8;"), "V"),
            invoke(Opcode.INVOKE_DIRECT, "Lfe8;", "<init>", listOf("Ljava/lang/String;"), "V"),
            typeUse(Opcode.CONST_CLASS, "Ljh0;"),
        ), player, cls("Lfe8;", methods = listOf(method("Lfe8;", "<init>", listOf("Ljava/lang/String;"), "V", publicConstructor))))
        assertEquals(emptyList<LinkMiss>(), report.misses)
        assertEquals(4, report.referencesChecked)
    }

    @Test fun ignoresReferencesTheAppDoesNotOwn() {
        val report = check(caller(
            invoke(Opcode.INVOKE_STATIC, "Landroidx/car/app/Foo;", "bar", emptyList(), "V"),
            invoke(Opcode.INVOKE_STATIC, "Landroid/util/Log;", "d", listOf("Ljava/lang/String;", "Ljava/lang/String;"), "I"),
            invoke(Opcode.INVOKE_STATIC, "Lnl/johninnl/eclipse/auto/internal/retained/Baz;", "x", emptyList(), "V"),
        ))
        assertEquals(emptyList<LinkMiss>(), report.misses)
        assertEquals(0, report.referencesChecked)
    }

    @Test fun reportsADriftedFieldNameWithTheExactReference() {
        val report = check(caller(fieldAccess(Opcode.SGET_OBJECT, "Ljh0;", "K1", "Ly0c;")), player)
        assertEquals(listOf("Ljh0;->K1:Ly0c;"), report.misses.map { it.reference })
        assertTrue(report.misses.single().reason, "no field named K1" in report.misses.single().reason)
    }

    @Test fun reportsADriftedFieldTypeAndNamesWhatTheAppHas() {
        val report = check(caller(fieldAccess(Opcode.SGET_OBJECT, "Ljh0;", "K0", "Lz0c;")), player)
        assertEquals(1, report.misses.size)
        assertTrue(report.misses.single().reason, "Ljh0;->K0:Ly0c;" in report.misses.single().reason)
    }

    @Test fun reportsADriftedMethodDescriptor() {
        val report = check(caller(
            invoke(Opcode.INVOKE_VIRTUAL, "Ljh0;", "P", listOf("Ljava/util/List;", "I"), "V"),
            invoke(Opcode.INVOKE_VIRTUAL, "Ljh0;", "P", listOf("Ljava/util/List;", "I", "Lke8;"), "Z"),
        ), player)
        assertEquals(2, report.misses.size)
        assertTrue(report.misses.all { "no method with this descriptor" in it.reason })
    }

    @Test fun reportsAClassMissingFromTheApp() {
        val report = check(caller(
            invoke(Opcode.INVOKE_STATIC, "Lzzz;", "a", emptyList(), "V"),
            typeUse(Opcode.NEW_INSTANCE, "Lcom/eclipse/android/data/models/Gone;"),
            invoke(Opcode.INVOKE_VIRTUAL, "Landroid/support/v4/media/session/MediaSessionCompat\$Token;", "x", emptyList(), "V"),
        ))
        assertEquals(3, report.misses.size)
        assertTrue(report.misses.all { "does not exist in the app" in it.reason })
    }

    @Test fun reportsNonPublicClassesAndMembers() {
        val hidden = cls("Lhidden;", flags = 0, methods = listOf(method("Lhidden;", "m", emptyList(), "V", publicStatic)))
        val locked = cls("Llocked;", methods = listOf(method("Llocked;", "m", emptyList(), "V", AccessFlags.PRIVATE.value)),
            fields = listOf(field("Llocked;", "f", "I", AccessFlags.PROTECTED.value or AccessFlags.STATIC.value)))
        val report = check(caller(
            invoke(Opcode.INVOKE_STATIC, "Lhidden;", "m", emptyList(), "V"),
            invoke(Opcode.INVOKE_DIRECT, "Llocked;", "m", emptyList(), "V"),
            fieldAccess(Opcode.SGET, "Llocked;", "f", "I"),
        ), hidden, locked)
        assertEquals(setOf("class Lhidden; is not public", "member is not public in the app"), report.misses.map { it.reason }.toSet())
        assertEquals(3, report.misses.size)
    }

    @Test fun reportsStaticnessMismatches() {
        val report = check(caller(
            invoke(Opcode.INVOKE_STATIC, "Ljh0;", "P", listOf("Ljava/util/List;", "I", "Lke8;"), "V"),
            fieldAccess(Opcode.IGET_OBJECT, "Ljh0;", "K0", "Ly0c;"),
        ), player)
        assertEquals(2, report.misses.size)
        assertTrue(report.misses.any { "instance method in the app but called as static" in it.reason })
        assertTrue(report.misses.any { "static in the app but accessed as an instance field" in it.reason })
    }

    @Test fun resolvesInheritedMembersThroughAppSuperclassesAndInterfaces() {
        val base = cls("Lbase;", fields = listOf(field("Lbase;", "f", "I", publicFlag)),
            methods = listOf(method("Lbase;", "m", emptyList(), "V", publicFlag)))
        val api = cls("Lapi;", flags = publicFlag or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
            methods = listOf(method("Lapi;", "i", emptyList(), "V", publicFlag or AccessFlags.ABSTRACT.value)))
        val child = cls("Lchild;", superclass = "Lbase;", interfaces = listOf("Lapi;"))
        val report = check(caller(
            invoke(Opcode.INVOKE_VIRTUAL, "Lchild;", "m", emptyList(), "V"),
            fieldAccess(Opcode.IGET, "Lchild;", "f", "I"),
            invoke(Opcode.INVOKE_VIRTUAL, "Lchild;", "i", emptyList(), "V"),
        ), base, api, child)
        assertEquals(emptyList<LinkMiss>(), report.misses)
        assertEquals(emptyList<String>(), report.unverified)
    }

    @Test fun constructorsAreNeverInheritedAndMustBeConstructors() {
        val base = cls("Lbase;", methods = listOf(method("Lbase;", "<init>", emptyList(), "V", publicConstructor)))
        val child = cls("Lchild;", superclass = "Lbase;")
        val plain = cls("Lplain;", methods = listOf(method("Lplain;", "<init>", emptyList(), "V", publicFlag)))
        val report = check(caller(
            invoke(Opcode.INVOKE_DIRECT, "Lchild;", "<init>", emptyList(), "V"),
            invoke(Opcode.INVOKE_DIRECT, "Lplain;", "<init>", emptyList(), "V"),
        ), base, child, plain)
        assertEquals(2, report.misses.size)
        assertTrue(report.misses.any { it.reference == "Lchild;-><init>()V" })
        assertTrue(report.misses.any { "not a constructor" in it.reason })
    }

    @Test fun membersThatMayComeFromAPlatformSuperclassAreReportedAsUnverifiedNotFailed() {
        val service = cls("Lsvc;", superclass = "Landroid/app/Service;")
        val report = check(caller(
            invoke(Opcode.INVOKE_VIRTUAL, "Lsvc;", "stopSelf", emptyList(), "V"),
            invoke(Opcode.INVOKE_VIRTUAL, "Ljh0;", "hashCode", emptyList(), "I"),
        ), service, player)
        assertEquals(emptyList<LinkMiss>(), report.misses)
        assertEquals(setOf("Lsvc;->stopSelf()V", "Ljh0;->hashCode()I"), report.unverified.toSet())
        // The same name on a class whose whole chain the app defines is a real miss.
        assertEquals(1, check(caller(invoke(Opcode.INVOKE_VIRTUAL, "Ljh0;", "stopSelf", emptyList(), "V")), player).misses.size)
    }

    @Test fun anAppSuperclassMustExistAndNotBeFinal() {
        val sealed = cls("Lsealed;", flags = publicFinal)
        val open = cls("Lopen;")
        assertEquals(listOf("Lnl/johninnl/eclipse/auto/app/Caller; extends Lsealed;"),
            check(caller(superclass = "Lsealed;"), sealed).misses.map { it.reference })
        assertEquals(emptyList<LinkMiss>(), check(caller(superclass = "Lopen;"), open).misses)
        assertEquals(1, check(caller(superclass = "Lmissing;")).misses.size)
    }

    @Test fun theSameBrokenReferenceIsReportedOnce() {
        val report = check(caller(
            fieldAccess(Opcode.SGET_OBJECT, "Ljh0;", "K1", "Ly0c;"),
            fieldAccess(Opcode.SGET_OBJECT, "Ljh0;", "K1", "Ly0c;"),
        ), player)
        assertEquals(1, report.misses.size)
        assertTrue(linkFailure("Eclipse Music", report).contains("Ljh0;->K1:Ly0c;"))
    }
}
