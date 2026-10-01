/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Every anchor the file name's poster and post day rest on, in every Facebook build the bundle
 * declares: the tree class and the accessors it keeps, the field hashes Facebook's own getters
 * load for a post's actors, a video's owner and its creation story, the poster's name and id on
 * the actor model those hand back, the story card's kept
 * timestamp reading the card's creation time, and the reel's story, which the reel sidebar hands
 * its assembly call and whose creation time Facebook reads. The register the reel button borrows
 * for that story is DownloadReelFixtureTest's to pin, from the patch's own pick. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class PosterAnchorsFixtureTest {
    private fun versions() = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    @Test
    fun `every declared build keeps the tree accessors the extension reads a post through`() {
        val checked = mutableMapOf<String, String>()
        for (version in versions()) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val tree = FixtureDex.classes(bundle, setOf(TREE_JNI))[TREE_JNI] ?: throw AssertionError("$name has no $TREE_JNI")
                assertTrue("$name: $TREE_JNI isn't public", AccessFlags.PUBLIC.isSet(tree.accessFlags))
                for ((accessor, shape) in ACCESSORS) {
                    val (parameters, returns) = shape
                    val method = tree.methods.singleOrNull {
                        it.name == accessor && it.parameterTypes.map(CharSequence::toString) == parameters
                    } ?: throw AssertionError("$name: $TREE_JNI has no $accessor$parameters")
                    assertEquals("$name: $accessor returns", returns, method.returnType)
                    assertTrue("$name: $accessor isn't public", AccessFlags.PUBLIC.isSet(method.accessFlags))
                    assertTrue("$name: $accessor is static", !AccessFlags.STATIC.isSet(method.accessFlags))
                }
                checked[version] = ACCESSORS.keys.joinToString()
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions(), checked.keys)
    }

    /**
     * The hashes the extension reads by are the ones Facebook's own getters load: the post's
     * actors through getCachedModelList and the video's owner through getCachedModel, both typed
     * as the same actor model, and the story card's creation time through TreeJNI.getTimeValue
     * inside its kept getTimestamp.
     */
    @Test
    fun `every declared build's own getters load the poster and post time hashes the extension reads`() {
        val checked = mutableMapOf<String, String>()
        for (version in versions()) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val classes = FixtureDex.classes(bundle, setOf(GRAPHQL_STORY, GRAPHQL_MEDIA, STORY_CARD, REGULAR_STORY_CARD))
                val story = classes[GRAPHQL_STORY] ?: throw AssertionError("$name has no $GRAPHQL_STORY")
                val media = classes[GRAPHQL_MEDIA] ?: throw AssertionError("$name has no $GRAPHQL_MEDIA")

                val actors = modelGetters(story, ACTORS, "getCachedModelList")
                val owner = modelGetters(media, OWNER, "getCachedModel")
                assertEquals("$name: actors getters of $GRAPHQL_STORY: $actors", 1, actors.size)
                assertEquals("$name: owner getters of $GRAPHQL_MEDIA: $owner", 1, owner.size)
                assertEquals("$name: the actors and the owner aren't the same model type", actors.single().second, owner.single().second)
                val creationStory = modelGetters(media, CREATION_STORY, "getCachedModel")
                assertEquals("$name: creation_story getters of $GRAPHQL_MEDIA: $creationStory", 1, creationStory.size)
                assertEquals("$name: the creation story isn't a post", GRAPHQL_STORY, creationStory.single().first)
                assertTrue("$name: the story reads no creation_time", holdsLiteral(story, CREATION_TIME))

                val card = classes[STORY_CARD] ?: throw AssertionError("$name has no $STORY_CARD")
                val timestamp = card.methods.singleOrNull { it.name == "getTimestamp" && it.parameterTypes.isEmpty() }
                    ?: throw AssertionError("$name: $STORY_CARD keeps no getTimestamp()")
                assertEquals("$name: getTimestamp returns", "J", timestamp.returnType)
                val regular = classes[REGULAR_STORY_CARD] ?: throw AssertionError("$name has no $REGULAR_STORY_CARD")
                assertEquals("$name: $REGULAR_STORY_CARD extends", STORY_CARD, regular.superclass)
                val reads = regular.methods.single { it.name == "getTimestamp" && it.parameterTypes.isEmpty() }
                assertTrue("$name: the card's getTimestamp doesn't load creation_time", holdsLiteral(reads, CREATION_TIME))
                assertTrue("$name: the card's getTimestamp doesn't read it through $TREE_JNI->getTimeValue",
                    calls(reads).any { it.definingClass == TREE_JNI && it.name == "getTimeValue" })
                checked[version] = "actor model ${actors.single().first} tag ${actors.single().second}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions(), checked.keys)
    }

    /**
     * The poster PostDetails reads is the actor model the actors and owner getters above hand
     * back, and that model reads the poster's name and id as strings by the hashes PostDetails
     * reads: each hash goes to BaseModelWithTree.getCachedString, directly or through a static
     * helper, and that falls through to the TreeJNI.getString PostDetails calls. So `{owner}` and
     * `{owner_id}` come off the same tree. (On 580 the model is a shared generic one whose tree
     * copies read both fields through such helpers.)
     */
    @Test
    fun `every declared build's actor model reads the poster's name and id as strings off its tree`() {
        val checked = mutableMapOf<String, String>()
        for (version in versions()) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val story = FixtureDex.classes(bundle, setOf(GRAPHQL_STORY))[GRAPHQL_STORY]
                    ?: throw AssertionError("$name has no $GRAPHQL_STORY")
                val actor = modelGetters(story, ACTORS, "getCachedModelList").single().first
                val classes = FixtureDex.classes(bundle, setOf(actor, BASE_MODEL))
                val model = classes[actor] ?: throw AssertionError("$name has no $actor")
                val base = classes[BASE_MODEL] ?: throw AssertionError("$name has no $BASE_MODEL")
                val cached = base.methods.singleOrNull { it.name == CACHED_STRING && it.parameterTypes.map(CharSequence::toString) == listOf("I") }
                    ?: throw AssertionError("$name: $BASE_MODEL has no $CACHED_STRING(I)")
                assertEquals("$name: $CACHED_STRING returns", STRING, cached.returnType)
                assertTrue("$name: $CACHED_STRING doesn't fall through to $TREE_JNI->getString",
                    calls(cached).any { it.definingClass == TREE_JNI && it.name == "getString" })

                val handedTo = POSTER_FIELDS.mapValues { (_, hash) -> callsAfter(model, hash) }
                val helpers = FixtureDex.classes(bundle, handedTo.values.flatten().map { it.definingClass }.toSet())
                fun readsString(reference: MethodReference): Boolean {
                    if (reference.name == CACHED_STRING && reference.returnType == STRING) return true
                    val helper = helpers[reference.definingClass]?.methods?.singleOrNull {
                        it.name == reference.name && it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString)
                    } ?: return false
                    return AccessFlags.STATIC.isSet(helper.accessFlags) &&
                        calls(helper).any { it.definingClass == BASE_MODEL && it.name == CACHED_STRING }
                }
                val reads = handedTo.mapValues { (field, references) ->
                    references.filter(::readsString).map { "${it.definingClass}->${it.name}" }.distinct().also {
                        assertTrue("$name: $actor reads no $field (${POSTER_FIELDS[field]}) through $CACHED_STRING: " +
                            references.map { "${it.definingClass}->${it.name}" }.distinct(), it.isNotEmpty())
                    }
                }
                checked[version] = "$actor ${reads.entries.joinToString { "${it.key} by ${it.value.take(2)}" }}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions(), checked.keys)
    }

    /**
     * The reel sidebar, found the way the patch finds it, hands its assembly call the reel's story:
     * the one argument, besides the session, whose type is also the type of a component field. One
     * class implements that type, a GraphQL tree that reads actors, and Facebook's own reel code
     * reads creation_time off that type through TreeJNI.getTimeValue, as the file name does. (The
     * component's own tree field is the reel's feedback, which knows neither.) Which registers the
     * button's block borrows there, the story's among them, DownloadReelFixtureTest pins by running
     * the patch on each build, whose own liveness pick is what reaches a device. This test doesn't
     * count them again over a window of its own.
     */
    @Test
    fun `every declared build hands the reel sidebar's assembly the reel's story`() {
        val checked = mutableMapOf<String, String>()
        for (version in versions()) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val builders = FixtureDex.classesHolding(bundle, SIDEBAR).flatMap { classDef ->
                    classDef.methods.filter { holdsString(it, SIDEBAR) && it.parameterTypes.size == 1 && callsButtonFactory(it) }
                        .map { classDef to it }
                }
                assertEquals("$name: sidebar builders ${builders.map { "${it.first.type}->${it.second.name}" }}", 1, builders.size)
                val (component, builder) = builders.single()

                val instructions = builder.implementation!!.instructions.toList()
                val assemblyIndex = instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.parameterTypes
                        ?.count { it.toString() == ARRAY_LIST } == 2
                }
                assertTrue("$name: ${builder.name} assembles no sidebar", assemblyIndex >= 0)
                val assembly = (instructions[assemblyIndex] as ReferenceInstruction).reference as MethodReference
                val fieldTypes = component.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }.toSet()
                val stories = assembly.parameterTypes.map(CharSequence::toString)
                    .filter { it.startsWith("L") && it != FB_USER_SESSION && it in fieldTypes }
                assertEquals("$name: assembly arguments ${component.type} also holds: $stories", 1, stories.size)
                val storyType = stories.single()

                val supers = mutableMapOf<String, String?>()
                val implementors = mutableListOf<ClassDef>()
                val timeReaders = mutableListOf<String>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        supers[classDef.type] = classDef.superclass
                        if (storyType in classDef.interfaces) implementors += ImmutableClassDef.of(classDef)
                        for (method in classDef.methods) {
                            if (method.parameterTypes.none { it.toString() == storyType }) continue
                            if (holdsLiteral(method, CREATION_TIME) &&
                                calls(method).any { it.definingClass == TREE_JNI && it.name == "getTimeValue" }
                            ) {
                                timeReaders += "${classDef.type}->${method.name}"
                            }
                        }
                    }
                }
                fun extendsTree(type: String): Boolean {
                    var current: String? = type
                    var depth = 0
                    while (current != null && depth++ < 16) {
                        if (current == TREE_JNI) return true
                        current = supers[current]
                    }
                    return false
                }
                assertEquals("$name: implementors of $storyType: ${implementors.map { it.type }}", 1, implementors.size)
                val story = implementors.single()
                assertTrue("$name: ${story.type} isn't a GraphQL tree", extendsTree(story.type))
                assertTrue("$name: ${story.type} reads no actors", story.methods.any { holdsLiteral(it, ACTORS) })
                assertTrue("$name: nothing reads creation_time off a $storyType through $TREE_JNI->getTimeValue", timeReaders.isNotEmpty())
                checked[version] = "story $storyType (${story.type}), its time read by ${timeReaders.first()}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions(), checked.keys)
    }

    /** The public no-argument getters of [owner] loading [hash] into [accessor], as (model class, type tag). */
    private fun modelGetters(owner: ClassDef, hash: Int, accessor: String): List<Pair<String, Int>> =
        owner.methods.filter { method ->
            method.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && holdsLiteral(method, hash) &&
                calls(method).any { it.name == accessor }
        }.map { method ->
            val instructions = method.implementation!!.instructions.toList()
            val model = instructions.firstNotNullOfOrNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
                ?: throw AssertionError("${method.name} loads no model class")
            val tag = instructions.mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.single { it != hash }
            model to tag
        }

    /** The method each load of [value] in [classDef] is handed to next. */
    private fun callsAfter(classDef: ClassDef, value: Int): List<MethodReference> = classDef.methods.flatMap { method ->
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        instructions.indices.filter { (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral == value }.mapNotNull { index ->
            instructions.drop(index + 1).firstNotNullOfOrNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        }
    }

    private fun holdsLiteral(classDef: ClassDef, value: Int) = classDef.methods.any { holdsLiteral(it, value) }

    private fun holdsLiteral(method: Method, value: Int) =
        method.implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == value } == true

    private fun calls(method: Method): List<MethodReference> =
        method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.orEmpty()

    private fun callsButtonFactory(method: Method) = calls(method).any { reference ->
        reference.parameterTypes.count { it.toString() == FUNCTION1 } == 4 &&
            reference.parameterTypes.firstOrNull()?.toString() == FB_USER_SESSION
    }

    private companion object {
        const val TREE_JNI = "Lcom/facebook/graphservice/tree/TreeJNI;"
        const val GRAPHQL_STORY = "Lcom/facebook/graphql/model/GraphQLStory;"
        const val GRAPHQL_MEDIA = "Lcom/facebook/graphql/model/GraphQLMedia;"
        const val STORY_CARD = "Lcom/facebook/stories/model/StoryCard;"
        const val REGULAR_STORY_CARD = "Lcom/facebook/audience/snacks/model/RegularStoryCard;"
        const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
        const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
        const val ARRAY_LIST = "Ljava/util/ArrayList;"
        const val SIDEBAR = "UDDSideBarComponent"

        /** The Java hash of each GraphQL field name, as PostDetails reads and Facebook's getters load them. */
        val ACTORS = "actors".hashCode()
        val OWNER = "owner".hashCode()
        val CREATION_TIME = "creation_time".hashCode()
        val CREATION_STORY = "creation_story".hashCode()
        val POSTER_FIELDS = mapOf("name" to "name".hashCode(), "id" to "id".hashCode())
        const val STRING = "Ljava/lang/String;"
        const val BASE_MODEL = "Lcom/facebook/graphql/modelutil/BaseModelWithTree;"
        const val CACHED_STRING = "getCachedString"

        /** The accessors PostDetails calls by name, each with its parameters and what it returns. */
        val ACCESSORS = mapOf(
            "getTree" to (listOf("I") to "Lcom/facebook/graphservice/interfaces/Tree;"),
            "getTreeList" to (listOf("I") to "Lcom/google/common/collect/ImmutableList;"),
            "getString" to (listOf("I") to "Ljava/lang/String;"),
            "getTimeValue" to (listOf("I") to "J"),
            "isValidGraphServicesJNIModel" to (emptyList<String>() to "Z"),
        )
    }
}
