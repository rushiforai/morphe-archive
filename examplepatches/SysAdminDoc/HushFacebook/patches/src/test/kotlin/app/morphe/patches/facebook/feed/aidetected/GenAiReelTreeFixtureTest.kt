/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the extension's tree reader relies on in the Facebook builds the bundle declares.
 *
 * The S22 counted "no model" for every Reels tab item, because those items keep the reel's model
 * and story one level down. Each declared build has to show it still does: the items Facebook's
 * mutable data helper builds take a holder declaring a field of the reel model's type and one of
 * GraphQLStory's, and hold no such field themselves but raw trees; the model's classes are trees;
 * Facebook's Reels menu reads `ai_generated_detected_info` and its `was_detected_as_ai_generated`
 * on the model it is handed with that holder; and TreeJNI keeps the public `getTree(int)` the
 * reader walks by. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class GenAiReelTreeFixtureTest {
    /** A type and each of its ancestors the bundle declares, nearest first. */
    private fun ancestry(type: String, supers: Map<String, String?>): List<String> {
        val chain = mutableListOf<String>()
        var at: String? = type
        while (at != null && at !in chain) {
            chain += at
            at = supers[at]
        }
        return chain
    }

    @Test
    fun `every declared build keeps the Reels tab's model in a holder, where its menu reads the detected info`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val extensionHolders = ExtensionDex.classes().flatMap { methodsHolding(it, TRANSPARENCY_ATTRIBUTION) }
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name

                // The reel model's type, the way the patch finds it: the attribution finder's parameter.
                val holders = FixtureDex.classesHolding(bundle, TRANSPARENCY_ATTRIBUTION)
                    .flatMap { methodsHolding(it, TRANSPARENCY_ATTRIBUTION) }
                val finder = attributionFinder(holders + extensionHolders)
                val modelType = finder.call?.parameterTypes?.get(0)?.toString()
                    ?: throw AssertionError("$name: ${finder.problem}")

                // One pass over the app: the class tree, and the methods holding the two literals.
                val supers = HashMap<String, String?>()
                val implementors = mutableListOf<String>()
                val menus = mutableListOf<Method>()
                val builders = mutableListOf<Method>()
                FixtureDex.forEach(bundle) { dex ->
                    val menuHere = dex.stringSection.any { it == REEL_MENU_GENAI_LOG }
                    val helperHere = dex.stringSection.any { it == MUTABLE_DATA_HELPER }
                    for (classDef in dex.classes) {
                        supers[classDef.type] = classDef.superclass
                        if (classDef.superclass == modelType || modelType in classDef.interfaces) implementors += classDef.type
                        if (!menuHere && !helperHere) continue
                        for (method in classDef.methods) {
                            if (menuHere && holdsString(method, REEL_MENU_GENAI_LOG)) menus += ImmutableMethod.of(method)
                            if (helperHere && holdsString(method, MUTABLE_DATA_HELPER)) builders += ImmutableMethod.of(method)
                        }
                    }
                }
                fun isTree(type: String) = TREE_JNI in ancestry(type, supers)

                // The model's classes and the story are trees the reader can ask.
                assertTrue("$name: nothing implements the reel model $modelType", implementors.isNotEmpty())
                for (implementor in implementors) {
                    assertTrue("$name: the reel model class $implementor isn't a TreeJNI", isTree(implementor))
                }
                assertTrue("$name: GraphQLStory isn't a TreeJNI", isTree(GRAPHQL_STORY))

                // Facebook's Reels menu is handed the model beside the holder, and reads the detected info on it.
                val menu = menus.singleOrNull()
                    ?: throw AssertionError("$name: ${menus.size} methods log the Reels menu's GenAI line, expected one")
                val parameterTypes = menu.parameterTypes.map { it.toString() }.filter { it.startsWith("L") }.toSet()
                val parameterClasses = FixtureDex.classes(bundle, parameterTypes)
                val holderTypes = parameterClasses.values.filter { isReelHolder(it, modelType) }.map { it.type }
                assertEquals("$name: the Reels menu's holder parameters", 1, holderTypes.size)
                val holderType = holderTypes.single()
                val helperCalls = treeFlagHelperCalls(menu)
                val helperClasses = FixtureDex.classes(bundle, helperCalls.map { it.definingClass }.toSet())
                val helpers = helperCalls.mapNotNull { call ->
                    helperClasses[call.definingClass]?.methods?.firstOrNull { it.name == call.name && it.returnType == "Z" }
                }
                assertTrue("$name: ${menu.definingClass}->${menu.name} doesn't read $DETECTED_INFO_FIELD." +
                    "$DETECTED_FLAG on $modelType", readsDetectedInfoOnModel(menu, modelType, holderType, helpers))

                // The items the mutable data helper builds with that holder: exactly one class, which
                // holds the holder, raw trees, and no model or story of its own.
                val items = builders.flatMap { constructedWith(it, holderType) }.toSet()
                assertEquals("$name: the item classes built with $holderType", 1, items.size)
                val item = items.single()
                val chain = ancestry(item, supers).filter { supers.containsKey(it) }
                val chainClasses: Map<String, ClassDef> = FixtureDex.classes(bundle, chain.toSet())
                val fields = chain.mapNotNull { chainClasses[it] }.flatMap { classDef ->
                    classDef.fields.filterNot { AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }
                }
                assertTrue("$name: $item holds no $holderType", holderType in fields)
                for (classDef in chain.mapNotNull { chainClasses[it] }) {
                    assertFalse("$name: ${classDef.type} holds the model or a story itself, so the typed reader " +
                        "reads it and the tree reader isn't needed there", holdsModelOrStory(classDef, modelType))
                }
                assertTrue("$name: $item holds no raw tree of its own",
                    fields.any { it != holderType && it.startsWith("L") && isTree(it) })

                // The reader the tree is walked by: public, per instance, one int, a tree back.
                val tree = FixtureDex.classes(bundle, setOf(TREE_JNI))[TREE_JNI]
                    ?: throw AssertionError("$name has no $TREE_JNI")
                assertTrue("$name: no public TreeJNI.$TREE_READER(int)", hasPublicTreeReader(tree, TREE_READER))
                assertTrue("$name: TreeJNI.$TREE_READER(int) answers something other than the Tree interface",
                    tree.methods.any {
                        it.name == TREE_READER && it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
                            it.returnType == "Lcom/facebook/graphservice/interfaces/Tree;"
                    })
                assertTrue("$name: no public TreeJNI.isValidGraphServicesJNIModel()", tree.methods.any {
                    it.name == "isValidGraphServicesJNIModel" && it.parameterTypes.isEmpty() && it.returnType == "Z" &&
                        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
                })
                checked += version
            }
        }
        assertEquals("a declared build went unchecked", versions.toSet(), checked)
    }
}
