package app.morphe.patches.pinedrama.interaction.looping

import app.morphe.Fixtures
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.DexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MultiDexContainer
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #1: the patch reaches into the viewer by shape and by a few names the build made up, and
 * the extension calls those names by reflection. A rename here wouldn't fail patching.
 */
class FullScreenEpisodesAnchorsTest {
    private val series =
        "Lcom/ss/android/ugc/aweme/series/innerfeed/viewmodel/SeriesInnerFeedViewModel;"
    private val pagerAbility =
        "Lcom/ss/android/ugc/aweme/feed/landscape/component/ability/LandscapeFeedViewPagerAbility;"
    private val aweme = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
    private val portraitPager = "Lcom/ss/android/ugc/aweme/common/widget/VerticalViewPager;"
    private val pagerAdapter = "Landroidx/viewpager/widget/PagerAdapter;"

    @Test
    fun everyHookSiteAndReflectedNameIsThere() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val wanted = setOf(
                LANDSCAPE_ENTRANCE, LANDSCAPE_VIEW_MODEL, LANDSCAPE_LOAD_LOGIC, LANDSCAPE_ACTIVITY,
                series, pagerAbility, portraitPager, pagerAdapter,
            )
            val classes = HashMap<String, ClassDef>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type in wanted) classes[classDef.type] = classDef
                }
            }
            for (type in wanted) assertNotNull("$apk: $type", classes[type])

            val entrance = classes.getValue(LANDSCAPE_ENTRANCE).methods.single {
                it.returnType == "V" &&
                    it.parameterTypes.map { p -> p.toString() } == listOf("I", "I", "I", "Ljava/lang/String;")
            }
            assertEquals(
                "$apk: entrance view model read",
                1,
                entrance.implementation!!.instructions.count(::isViewModelRead),
            )

            val seed = classes.getValue(LANDSCAPE_VIEW_MODEL).methods.single {
                it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty()
            }
            val seedCode = seed.implementation!!.instructions.toList()
            val returned = seedCode.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            assertTrue("$apk: seed return", returned > 0)
            assertTrue(
                "$apk: seed state write",
                (0..returned).any { seedCode[it].opcode == Opcode.NEW_INSTANCE },
            )

            val logic = classes.getValue(LANDSCAPE_LOAD_LOGIC)
            val listAndFlag = listOf("Ljava/util/List;", "Z")
            for (name in listOf("Qc", "R3")) {
                assertTrue(
                    "$apk: viewer $name(List, boolean)",
                    logic.methods.any {
                        it.name == name && it.returnType == "V" &&
                            it.parameterTypes.map { p -> p.toString() } == listAndFlag
                    },
                )
            }
            assertTrue(
                "$apk: viewer fr(boolean) marks a load as automatic",
                logic.methods.any {
                    it.name == "fr" && it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("Z")
                },
            )
            assertTrue(
                "$apk: viewer B3(Exception) ends a load",
                logic.methods.any {
                    it.name == "B3" && it.returnType == "V" &&
                        it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Exception;")
                },
            )

            // The merge helper takes (a, b) and builds b + a, so which of these appends only shows
            // by following the arguments through it. Getting this backwards puts new episodes in
            // front of the list, where the pager shifts to stay put and swiping runs out at the end.
            val prepend = logic.methods.single { it.name == "Qc" && it.parameterTypes.size == 2 }
            val appendEntry = logic.methods.single { it.name == "R3" && it.parameterTypes.size == 2 }
            val appendTarget = appendEntry.implementation!!.instructions
                .firstNotNullOf { it.getReference<MethodReference>() }
            val append = logic.methods.single {
                it.name == appendTarget.name &&
                    it.parameterTypes.map { p -> p.toString() } == appendTarget.parameterTypes.map { p -> p.toString() }
            }
            assertTrue("$apk: Qc puts new episodes in front", newEpisodesGoFirst(container, prepend))
            assertFalse("$apk: R3 puts new episodes behind", newEpisodesGoFirst(container, append))

            assertTrue(
                "$apk: viewer Hz() returns the pager ability",
                logic.methods.any { it.name == "Hz" && it.parameterTypes.isEmpty() && it.returnType == pagerAbility },
            )
            assertTrue(
                "$apk: pager ability's current video",
                classes.getValue(pagerAbility).methods.any {
                    it.name == "LLLILZLLLI" && it.parameterTypes.isEmpty() && it.returnType == aweme
                },
            )

            // Leaving full screen moves the portrait pager, once its adapter holds the whole list.
            val portrait = classes.getValue(portraitPager).methods
            assertTrue(
                "$apk: portrait pager setCurrentItem(int)",
                portrait.any { it.name == "setCurrentItem" && it.parameterTypes.map { p -> p.toString() } == listOf("I") },
            )
            assertTrue(
                "$apk: portrait pager getCurrentItem()",
                portrait.any { it.name == "getCurrentItem" && it.parameterTypes.isEmpty() && it.returnType == "I" },
            )
            assertTrue(
                "$apk: portrait pager getAdapter()",
                portrait.any { it.name == "getAdapter" && it.parameterTypes.isEmpty() && it.returnType == pagerAdapter },
            )
            assertTrue(
                "$apk: adapter getCount()",
                classes.getValue(pagerAdapter).methods.any { it.name == "getCount" && it.parameterTypes.isEmpty() },
            )

            val model = classes.getValue(series).methods
            assertTrue("$apk: hasNext", model.any { it.name == "hasNext" && it.parameterTypes.isEmpty() })
            assertTrue("$apk: isLoading", model.any { it.name == "isLoading" && it.parameterTypes.isEmpty() })
            assertTrue(
                "$apk: request(int, X, int, boolean)",
                model.any {
                    val types = it.parameterTypes.map { p -> p.toString() }
                    it.name == "request" && types.size == 4 &&
                        types[0] == "I" && types[2] == "I" && types[3] == "Z"
                },
            )
        }
    }

    /**
     * Follows a viewer merge: the list-difference call's result is the new episodes, and the merge
     * helper after it starts its result with whichever parameter it adds first.
     */
    private fun newEpisodesGoFirst(container: MultiDexContainer<out DexFile>, merging: Method): Boolean {
        val code = merging.implementation!!.instructions.toList()
        val listDifference = code.indexOfFirst {
            val call = it.getReference<MethodReference>()
            it.opcode == Opcode.INVOKE_STATIC && call?.definingClass == LANDSCAPE_LOAD_LOGIC &&
                call.parameterTypes.size == 2 && call.returnType == "Ljava/util/List;"
        }
        assertTrue("${merging.name}: list difference call", listDifference >= 0)
        val fresh = (code[listDifference + 1] as OneRegisterInstruction).registerA
        val merge = code.drop(listDifference + 1).first {
            it.getReference<MethodReference>()?.parameterTypes?.map { p -> p.toString() } ==
                listOf("Ljava/lang/Iterable;", "Ljava/util/Collection;")
        }
        val mergeCall = merge as FiveRegisterInstruction
        assertTrue(
            "${merging.name}: the new episodes reach the merge",
            fresh == mergeCall.registerC || fresh == mergeCall.registerD,
        )
        val freshIsSecondArgument = fresh == mergeCall.registerD

        val helperReference = merge.getReference<MethodReference>()!!
        val helper = container.dexEntryNames.asSequence()
            .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
            .first { it.type == helperReference.definingClass }
            .methods.first { it.name == helperReference.name && it.parameterTypes.size == 2 }
        val helperCode = helper.implementation!!
        val firstAdd = helperCode.instructions.first {
            it.getReference<MethodReference>()?.name == "addAll"
        } as FiveRegisterInstruction
        val helperStartsWithSecond = firstAdd.registerD == helperCode.registerCount - 1
        return freshIsSecondArgument == helperStartsWithSecond
    }
}
