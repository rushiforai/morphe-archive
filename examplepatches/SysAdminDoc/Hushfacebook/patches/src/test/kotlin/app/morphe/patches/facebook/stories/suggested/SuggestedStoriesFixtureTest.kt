/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.suggested

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.media.taptoplay.isEnumNaming
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The anchors of Hide suggested stories on every declared Facebook build, found the way the patch
 * finds them: one post-processing method building the tray data through its one constructor, one
 * bucket list in it, one classic tray receiver reading that list, one bucket flag a tree class
 * answers with is_story_bucket_suggested, one label enum naming SUGGESTED and one static helper
 * answering it, and one bucket method answering the type enum that names the tray's cards. Then
 * the hook goes first in the constructor, in the list's own register, and the five stubs of the
 * extension the patch merges are filled in.
 */
class SuggestedStoriesFixtureTest {
    /** The tray data constructor's registers and the register of its bucket list, per build. */
    private val expected = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to (7 to 4),
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to (7 to 4),
    )

    /** The bucket interface's type accessor and the enum it answers, per build. */
    private val expectedType = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to ("C9d" to "LX/2LX;"),
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to ("CAm" to "LX/24X;"),
    )

    private fun reference(instruction: Instruction): String {
        val call = (instruction as ReferenceInstruction).reference as MethodReference
        return "${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}"
    }

    private fun body(method: Method) = method.implementation!!.instructions.toList()

    @Test
    fun `each declared build has one tray data list, one suggested flag and one label helper`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", expected.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val postClasses = FixtureDex.classesHolding(bundle, POST_PROCESS_RESULT)
                val posts = postClasses.flatMap { methodsHolding(it, POST_PROCESS_RESULT) }
                assertEquals("${bundle.name}: methods holding \"$POST_PROCESS_RESULT\"", 1, posts.size)
                assertTrue("${bundle.name}: ${posts.single()} isn't the post-processing shape", isPostProcess(posts.single()))
                val data = posts.single().returnType

                val receiverClasses = FixtureDex.classesHolding(bundle, OPTIMISTIC_RECEIVES)
                val receivers = receiverClasses.flatMap { methodsHolding(it, OPTIMISTIC_RECEIVES) }
                assertEquals("${bundle.name}: methods holding \"$OPTIMISTIC_RECEIVES\"", 1, receivers.size)
                val calls = interfaceFlagCalls(receivers.single())
                val interfaces = calls.map { it.definingClass }.toSet()

                val labels = FixtureDex.classesHolding(bundle, LABEL_NAMES.first()).filter { isEnumNaming(it, LABEL_NAMES) }
                assertEquals("${bundle.name}: label enums naming ${LABEL_NAMES.joinToString()}", 1, labels.size)
                val label = labels.single().type
                val typeEnums = FixtureDex.classesHolding(bundle, BUCKET_TYPE_NAMES.first())
                    .filter { isEnumNaming(it, BUCKET_TYPE_NAMES) }

                // One pass for the tree classes answering one of the receiver's flags with the
                // suggested key, and for the static helpers answering a label for a bucket.
                val readers = mutableListOf<ClassDef>()
                val helperClasses = mutableListOf<ClassDef>()
                var helpers = 0
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        val flags = calls.filter { it.definingClass in classDef.interfaces }
                        if (flags.any { call -> classDef.methods.any { it.name == call.name && isTreeFlagReader(it, SUGGESTED_FLAG_FIELD) } }) {
                            readers += ImmutableClassDef.of(classDef)
                        }
                        val found = classDef.methods.count { isLabelHelper(it, interfaces, label) }
                        if (found > 0) {
                            helpers += found
                            helperClasses += ImmutableClassDef.of(classDef)
                        }
                    }
                }
                assertTrue("${bundle.name}: no tree class answers a receiver flag with $SUGGESTED_FLAG_FIELD", readers.isNotEmpty())
                assertEquals("${bundle.name}: static label helpers for a bucket", 1, helpers)

                val support = FixtureDex.classes(bundle, setOf(data, IMMUTABLE_LIST) + interfaces)
                assertEquals("${bundle.name}: a class the patch reads is missing", setOf(data, IMMUTABLE_LIST) + interfaces, support.keys)

                val extension = ExtensionDex.classDef(SUGGESTED_STORIES)
                val context = PatchContexts.of(
                    postClasses + receiverClasses + labels + typeEnums + readers + helperClasses + support.values + extension,
                )
                val tray = with(context) { trayBuckets() }
                assertEquals("${bundle.name}: the tray data", data, tray.constructor.definingClass)
                assertEquals("${bundle.name}: the bucket list is the constructor's fourth parameter", 3, tray.list)
                assertEquals("${bundle.name}: the label enum", label, tray.label)
                assertEquals("${bundle.name}: the bucket type accessor", expectedType.getValue(version), tray.type to tray.typeEnum)
                assertTrue("${bundle.name}: ${tray.typeEnum} isn't among the enums naming the cards",
                    tray.typeEnum in typeEnums.map { it.type })
                assertTrue("${bundle.name}: ${tray.bucket} isn't among the receiver's flags", tray.bucket in interfaces)
                assertTrue("${bundle.name}: ${tray.bucket} isn't public",
                    AccessFlags.PUBLIC.isSet(support.getValue(tray.bucket).accessFlags))

                // The hook goes first in the one constructor, in the list's own register.
                val constructor = with(context) { mutableClassDefBy(data) }.methods.single { it.name == "<init>" }
                val (registers, list) = expected.getValue(version)
                assertEquals("${bundle.name}: constructor registers", registers, constructor.implementation!!.registerCount)
                val own = body(constructor)
                with(context) { fillBucketStubs(tray) }
                constructor.keepOnlyUnsuggestedBuckets(tray.list)
                val hooked = body(constructor)
                assertEquals("${bundle.name}: three instructions in", own.size + 3, hooked.size)
                assertEquals(KEPT_BUCKETS, reference(hooked[0]))
                val call = hooked[0] as RegisterRangeInstruction
                assertEquals("${bundle.name}: the list's register", list to 1, call.startRegister to call.registerCount)
                assertEquals(Opcode.MOVE_RESULT_OBJECT, hooked[1].opcode)
                assertEquals(list, (hooked[1] as OneRegisterInstruction).registerA)
                assertEquals(Opcode.CHECK_CAST, hooked[2].opcode)
                assertEquals(IMMUTABLE_LIST, ((hooked[2] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("${bundle.name}: Facebook's own code follows", own.map { it.opcode }, hooked.drop(3).map { it.opcode })

                // The stubs call what the patch found.
                val stubs = with(context) { mutableClassDefBy(SUGGESTED_STORIES) }.methods
                fun first(name: String) = body(stubs.single { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) })
                assertEquals(tray.bucket, ((first(IS_BUCKET_STUB)[0] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("${tray.bucket}->${tray.flag}()Z", reference(first(SUGGESTED_STUB)[1]))
                assertEquals("${tray.bucket}->${tray.type}()${tray.typeEnum}", reference(first(TYPE_STUB)[1]))
                assertEquals(
                    "${tray.labelHelper.definingClass}->${tray.labelHelper.name}(${tray.bucket})$label",
                    reference(first(LABEL_STUB)[1]),
                )
                assertEquals("$IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST", reference(first(COPY_STUB)[0]))
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
