/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.favorites

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #11: the My list bottom tab's History and Favorites pages never pass the refresh gate the
 * profile's pages hand their lists to, so List search and tap to top hooks them on their own.
 *
 * <p>A build where the page stopped coming into view through its own onResume, or where the one
 * getter for its list started returning something that isn't the list, has to fail here and not
 * leave My list without its search bar.
 */
class MyListPageAnchorsTest {
    private val recyclerView = "Landroidx/recyclerview/widget/RecyclerView;"

    private fun forEachBuild(check: (String, Map<String, ClassDef>) -> Unit) {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = HashMap<String, ClassDef>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) classes.putIfAbsent(classDef.type, classDef)
            }
            check(Fixtures.versionOf(apk), classes)
        }
    }

    @Test
    fun `the My list page comes into view through its own onResume, with a free register`() = forEachBuild { version, classes ->
        val page = checkNotNull(classes[MY_LIST_PAGE]) { "$version: no $MY_LIST_PAGE" }
        val taken = page.methods.filter { MyListPageResumeFingerprint.takes(it, page) }
        assertEquals("$version: onResume taken ${taken.map { it.name }}", 1, taken.size)
        assertTrue("$version: no local register for the list", taken.single().implementation!!.registerCount >= 2)
        // The pages are fragments, so onResume is the framework's own and the name can't drift.
        val fragment = "Landroidx/fragment/app/Fragment;"
        var type: String? = page.type
        val chain = ArrayList<String>()
        while (type != null && type != fragment && type in classes) {
            chain += type
            type = classes.getValue(type).superclass
        }
        assertEquals("$version: not a fragment, chain $chain", fragment, type)
    }

    @Test
    fun `the page has one getter for its list and it answers the grid itself`() = forEachBuild { version, classes ->
        val page = checkNotNull(classes[MY_LIST_PAGE]) { "$version: no $MY_LIST_PAGE" }
        val getter = myListPageList(page.methods)
        var type: String? = getter.returnType
        while (type != null && type != recyclerView && type in classes) type = classes.getValue(type).superclass
        assertEquals("$version: ${getter.name} answers ${getter.returnType}, not a list", recyclerView, type)

        // The page reads that list back through the getter, so it is the list the page fills.
        val readers = page.methods.filter { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.getReference<MethodReference>()?.let { it.definingClass == MY_LIST_PAGE && it.name == getter.name } == true
            } == true
        }
        assertTrue("$version: nothing on the page reads ${getter.name}", readers.isNotEmpty())
    }
}
