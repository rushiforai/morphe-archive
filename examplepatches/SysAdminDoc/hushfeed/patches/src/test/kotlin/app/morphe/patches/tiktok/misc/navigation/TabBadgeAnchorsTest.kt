package app.morphe.patches.tiktok.misc.navigation

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The bottom tab icon's badge setters keep their names while the class is renamed on every
 * build. Each name is one method of that shape in the app, both sit on one class, and that class
 * carries the badge views the setters drive, so the hook lands on the tab icon and nowhere else.
 */
class TabBadgeAnchorsTest {
    @Test
    fun `47_0_3 has one badge setter of each name on one tab icon`() {
        val apks = Fixtures.apks().filter { it.name.contains("47.0.3") }
        assertEquals("one retained 47.0.3 fixture", 1, apks.size)
        val container = DexFileFactory.loadDexContainer(apks.single(), Opcodes.getDefault())
        val classes = HashMap<String, ClassDef>()
        val counts = ArrayList<Method>()
        val dots = ArrayList<Method>()
        container.dexEntryNames.forEach { entry ->
            container.getEntry(entry)!!.dexFile.classes.forEach { classDef ->
                classes.putIfAbsent(classDef.type, classDef)
                classDef.methods.forEach { method ->
                    if (method.returnType != "V" || method.parameterTypes != listOf("I")) return@forEach
                    when (method.name) {
                        "setCountDotVisibility" -> counts += method
                        "setTabDotVisibility" -> dots += method
                    }
                }
            }
        }
        assertEquals("setCountDotVisibility(I)V owners: ${counts.map { it.definingClass }}", 1, counts.size)
        assertEquals("setTabDotVisibility(I)V owners: ${dots.map { it.definingClass }}", 1, dots.size)
        assertEquals("the two setters sit on different classes", counts.single().definingClass, dots.single().definingClass)

        val icon = classes.getValue(counts.single().definingClass)
        assertEquals("the tab icon is not a FrameLayout", "Landroid/widget/FrameLayout;", icon.superclass)
        val names = icon.methods.map { it.name }
        assertTrue("$names", "getCountDotView" in names && "getRedDotVIew" in names && "setCountDotText" in names)
    }
}
