package app.morphe.patches.tiktok.feedfilter

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the Feed filter tells a profile's list by, held to each declared build (#35). TikTok parses
 * a profile's posts from /aweme/v1/aweme/post/ straight into a FeedItemList, the class whose
 * getItems the main feed filter hooks, and its profile model stamps the profile's uid on the list
 * in dataUserId. FeedItemsFilter reads that field directly, so a build that renamed it, retyped
 * it, made it private or stopped writing it would put every profile back under the feed's
 * preference filters.
 */
class ProfileListAnchorsTest {
    private val feedItemList = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"

    @Test
    fun `a FeedItemList carries the profile uid a profile model stamps on it`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            var field: Field? = null
            var stamps = 0
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type == feedItemList && field == null) {
                        field = classDef.fields.firstOrNull { it.name == "dataUserId" }
                    }
                    for (method in classDef.methods) {
                        for (instruction in method.implementation?.instructions ?: continue) {
                            if (instruction.opcode != Opcode.IPUT_OBJECT) continue
                            val reference = (instruction as ReferenceInstruction).reference as FieldReference
                            if (reference.definingClass == feedItemList && reference.name == "dataUserId") stamps++
                        }
                    }
                }
            }
            val declared = field
            assertNotNull("FeedItemList declares no dataUserId", declared)
            assertEquals("dataUserId's type", "Ljava/lang/String;", declared!!.type)
            assertTrue("dataUserId is public, since the extension reads it directly",
                AccessFlags.PUBLIC.isSet(declared.accessFlags))
            assertFalse("dataUserId is an instance field", AccessFlags.STATIC.isSet(declared.accessFlags))
            assertTrue("no method stamps a FeedItemList's dataUserId", stamps > 0)
        }
    }

    /**
     * The earlier mark: ProfileApiExecuteFingerprint's method, the one parse every profile list
     * goes through, returns the parsed object, and on each build the only callers asking it for
     * a FeedItemList are the profile fetchers, never the For You feed. FeedItemList also keeps
     * Object's equals and hashCode, which the extension's identity-keyed WeakHashMap relies on.
     */
    @Test
    fun `profile lists are parsed through the one method the Feed filter marks them in`() {
        val impl = "Lcom/ss/android/ugc/aweme/services/ProfileDependentComponentImpl;"
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            var parse: com.android.tools.smali.dexlib2.iface.Method? = null
            var overridesIdentity = false
            val feedListCallers = mutableSetOf<String>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type == impl) {
                        parse = classDef.methods.singleOrNull {
                            it.name == "apiExecuteGetJSONObject" && it.returnType == "Ljava/lang/Object;" &&
                                it.parameterTypes.size == 7 && it.parameterTypes[0] == "I" &&
                                it.parameterTypes[2] == "Ljava/lang/Class;" && it.parameterTypes[5] == "Z"
                        }
                    }
                    if (classDef.type == feedItemList) {
                        overridesIdentity = classDef.methods.any {
                            (it.name == "equals" && it.parameterTypes.size == 1) ||
                                (it.name == "hashCode" && it.parameterTypes.isEmpty())
                        }
                    }
                    for (method in classDef.methods) {
                        val instructions = method.implementation?.instructions?.toList() ?: continue
                        val asksForFeedList = instructions.any {
                            it.opcode == Opcode.CONST_CLASS &&
                                ((it as ReferenceInstruction).reference as TypeReference).type == feedItemList
                        }
                        if (!asksForFeedList) continue
                        val parses = instructions.any {
                            (it.opcode == Opcode.INVOKE_INTERFACE || it.opcode == Opcode.INVOKE_VIRTUAL ||
                                it.opcode == Opcode.INVOKE_INTERFACE_RANGE || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                                ((it as ReferenceInstruction).reference as MethodReference).name == "apiExecuteGetJSONObject"
                        }
                        if (parses) feedListCallers += classDef.type + "->" + method.name
                    }
                }
            }
            val found = parse
            assertNotNull("$impl has no seven-parameter apiExecuteGetJSONObject returning Object", found)
            assertTrue("apiExecuteGetJSONObject returns nothing the hook could mark",
                found!!.implementation!!.instructions.any { it.opcode == Opcode.RETURN_OBJECT })
            assertFalse("FeedItemList overrides equals or hashCode, so a WeakHashMap no longer keys it by identity",
                overridesIdentity)
            assertTrue("nothing parses a FeedItemList through apiExecuteGetJSONObject any more", feedListCallers.isNotEmpty())
            assertTrue("more than the two profile fetchers parse a FeedItemList there: $feedListCallers",
                feedListCallers.size <= 2)
        }
    }
}
