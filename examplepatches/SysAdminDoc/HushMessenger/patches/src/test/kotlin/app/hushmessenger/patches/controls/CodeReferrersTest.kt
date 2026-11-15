package app.hushmessenger.patches.controls

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.random.Random
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** The shared walk's reference index: the methods it hands a finder are the ones a walk over every method's code finds. */
class CodeReferrersTest {
    private val caller = fixtureClass("LX/Ref1;", listOf(fixtureMethod("LX/Ref1;->a()V", "invoke-static {}, LX/Ref2;->b()V\nreturn-void")))
    private val idle = fixtureClass("LX/Ref3;", listOf(fixtureMethod("LX/Ref3;->c()V", "return-void")))

    private fun List<Pair<ClassDef, *>>.ids() = map { it.second.toString() }

    @Test fun outsideTheWalkEveryMethodIsACandidate() {
        val classes = listOf(caller, idle)
        assertEquals(listOf("LX/Ref1;->a()V", "LX/Ref3;->c()V"), codeReferrers(classes, methods = listOf("LX/Ref2;->b()V")).ids())
    }

    // A class a patch already rebuilt isn't indexed, so all of its methods stay candidates and its strings are read.
    @Test fun rebuiltClassesAreAlwaysCandidates() {
        val logger = fixtureClass("LX/Ref4;", listOf(fixtureMethod("LX/Ref4;->d()V", "const-string v0, \"hush\"\nreturn-void")))
        val classes = listOf(caller, idle, logger)
        val loads = MethodCheck(loadsString("hush"))
        val (found, loaders) = withSharedWalk(classes, listOf(loads)) {
            codeReferrers(classes, types = listOf("LX/Nowhere;")) to loads.methods(classes)
        }
        assertEquals(listOf("LX/Ref1;->a()V", "LX/Ref3;->c()V", "LX/Ref4;->d()V"), found.ids())
        assertEquals(listOf("LX/Ref4;->d()V"), loaders.map { it.toString() })
    }

    // A check whose test throws in the walk, an Error like a missing method included, or whose test can't be made
    // there, is answered by its own walk, which finds what it always did.
    @Test fun aCheckThatFailsInTheWalkWalksOnItsOwn() {
        val logger = fixtureClass("LX/Ref4;", listOf(fixtureMethod("LX/Ref4;->d()V", "const-string v0, \"hush\"\nreturn-void")))
        val classes = listOf(caller, idle, logger)
        var made = 0
        val throws = MethodCheck {
            val first = made++ == 0
            val loads = loadsString("hush")()
            val test: MethodTest = { cls, method -> if (first) throw NoSuchMethodError("walk") else loads(cls, method) }
            test
        }
        var asked = 0
        val unmade = MethodCheck {
            if (asked++ == 0) throw IllegalStateException("walk")
            loadsString("hush")()
        }
        val found = withSharedWalk(classes, listOf(throws, unmade)) { throws.methods(classes) to unmade.methods(classes) }
        assertEquals(listOf("LX/Ref4;->d()V"), found.first.map { it.toString() })
        assertEquals(listOf("LX/Ref4;->d()V"), found.second.map { it.toString() })
        assertEquals(2, made)
        assertEquals(2, asked)
    }

    // Only the thread running the walk is answered from it; any other thread, and the same one afterwards, walks itself.
    @Test fun theWalkAnswersOnlyItsOwnThread() {
        val classes = listOf(caller, idle)
        var calls = 0
        val counted = methodCheck { _, _ -> calls++; false }
        withSharedWalk(classes, listOf(counted)) {
            assertEquals(2, calls)
            counted.methods(classes)
            assertEquals(2, calls)
            val other = Thread { counted.methods(classes) }
            other.start()
            other.join()
            assertEquals(4, calls)
        }
        counted.methods(classes)
        assertEquals(6, calls)
    }

    @Test fun nativeBuildsFindExactlyTheReferrers() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        for (code in listOf("347415354", "347415262")) {
            val apk = Files.list(Path.of(root!!)).use { files -> files.filter { it.toString().endsWith("-$code.apk") }.toList() }.single()
            val container = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val dexes = container.dexEntryNames.map { container.getEntry(it)!!.dexFile }
            val classes = dexes.flatMap { it.classes }
            // Targets from every dex's own tables, some referenced nowhere, plus ones with huge and overloaded caller sets.
            val random = Random(code.toLong())
            val methods = dexes.flatMap { dex -> List(4) { dex.methodSection[random.nextInt(dex.methodSection.size)].toString() } }.toSet() +
                setOf(INSTALLED_PACKAGES, "Ljava/lang/Object;-><init>()V", "Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;")
            val types = dexes.flatMap { dex -> List(3) { dex.typeSection[random.nextInt(dex.typeSection.size)] } }.toSet() +
                setOf("Ljava/util/ArrayList;", "[Ljava/lang/Object;")
            // Strings from the tables too, most of them names no code loads, and two that a check anchors on.
            val strings = dexes.flatMap { dex -> List(4) { dex.stringSection[random.nextInt(dex.stringSection.size)] } }.toSet() +
                setOf(PHONE_ID_PROVIDER, "text=")
            val walked = (methods + types).associateWith { mutableListOf<String>() }
            val loaded = strings.associateWith { mutableListOf<String>() }
            val anyTarget = mutableListOf<String>()
            for (cls in classes) for (method in cls.methods) {
                val refs = method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference } ?: continue
                val hits = refs.mapNotNullTo(HashSet()) { ref ->
                    when (ref) {
                        is MethodReference -> ref.toString()
                        is TypeReference -> ref.type
                        else -> null
                    }?.takeIf { it in walked }
                }
                for (ref in hits) walked.getValue(ref).add(method.toString())
                if (hits.isNotEmpty()) anyTarget.add(method.toString())
                for (value in refs.mapNotNullTo(HashSet()) { (it as? StringReference)?.string?.takeIf { s -> s in loaded } }) {
                    loaded.getValue(value).add(method.toString())
                }
            }
            val total = classes.sumOf { it.methods.count() }
            val loads = strings.associateWith { MethodCheck(loadsString(it)) }
            withSharedWalk(classes, loads.values.toList()) {
                for (id in methods) assertEquals(walked.getValue(id), codeReferrers(classes, methods = listOf(id)).ids(), "$code $id")
                for (type in types) assertEquals(walked.getValue(type), codeReferrers(classes, types = listOf(type)).ids(), "$code $type")
                assertEquals(anyTarget, codeReferrers(classes, methods, types).ids(), code)
                for ((value, check) in loads) assertEquals(loaded.getValue(value), check.methods(classes).map { it.toString() }, "$code $value")
                // Asked about any other class list, the walk can't answer, and every method is a candidate.
                assertEquals(total, codeReferrers(classes.toList(), methods = listOf(INSTALLED_PACKAGES)).size, code)
            }
            // Outside the walk a check reads each method's strings itself and finds the same methods.
            assertEquals(loaded.getValue(PHONE_ID_PROVIDER), loads.getValue(PHONE_ID_PROVIDER).methods(classes).map { it.toString() }, code)
            assertTrue(walked.getValue(INSTALLED_PACKAGES).isNotEmpty() && loaded.getValue(PHONE_ID_PROVIDER).isNotEmpty() && anyTarget.size < total, code)
        }
    }
}
