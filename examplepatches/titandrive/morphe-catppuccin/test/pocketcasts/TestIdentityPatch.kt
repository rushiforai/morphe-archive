// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.pocketcasts.test
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

val pocketCastsTestIdentityPatch = bytecodePatch(name="Pocket Casts isolated test identity", default=false) {
    compatibleWith(Compatibility(name="Pocket Casts",packageName="au.com.shiftyjelly.pocketcasts"))
    dependsOn(resourcePatch {
        execute {
            document("AndroidManifest.xml").use { xml ->
                xml.documentElement.setAttribute("package","au.com.shiftyjelly.pocketcasts.catppuccin.test")
                val nodes=xml.getElementsByTagName("*")
                for(i in 0 until nodes.length) {
                    val node=nodes.item(i) as Element
                    for(name in listOf("android:authorities","android:permission","android:readPermission","android:writePermission")) {
                        if(node.hasAttribute(name)) node.setAttribute(name,node.getAttribute(name).replace("au.com.shiftyjelly.pocketcasts", "au.com.shiftyjelly.pocketcasts.catppuccin.test"))
                    }
                    if(node.tagName=="activity-alias") {
                        val alias=node.getAttribute("android:name")
                        node.setAttribute("android:name",alias.replace("au.com.shiftyjelly.pocketcasts.","au.com.shiftyjelly.pocketcasts.catppuccin.test."))
                    }
                    if(node.tagName=="provider" && node.hasAttribute("android:authorities") && !node.getAttribute("android:authorities").startsWith("au.com.shiftyjelly.pocketcasts.catppuccin.test."))
                        node.setAttribute("android:authorities", "au.com.shiftyjelly.pocketcasts.catppuccin.test."+node.getAttribute("android:authorities"))
                    if(node.tagName in listOf("permission","uses-permission") && node.getAttribute("android:name").startsWith("au.com.shiftyjelly.pocketcasts.")) node.setAttribute("android:name",node.getAttribute("android:name").replace("au.com.shiftyjelly.pocketcasts", "au.com.shiftyjelly.pocketcasts.catppuccin.test"))
                }
                (xml.getElementsByTagName("application").item(0) as Element).apply {
                    setAttribute("android:label","Pocket Casts Theme Test")
                    setAttribute("android:debuggable","true")
                }
            }

        }
    })
    execute {
        val classes=mutableListOf<ClassDef>();classDefForEach {classes.add(it)}
        classes.forEach { klass -> klass.methods.forEach { method ->
            val changes=method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
                val value=((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if(value=="au.com.shiftyjelly.pocketcasts") index to (instruction as OneRegisterInstruction).registerA else null
            }.orEmpty()
            if(changes.isNotEmpty()) {
                val mutable=mutableClassDefBy(klass).methods.single {it.name==method.name&&it.parameterTypes==method.parameterTypes&&it.returnType==method.returnType}
                changes.forEach {(index,reg)->mutable.replaceInstruction(index,"const-string v$reg, \"au.com.shiftyjelly.pocketcasts.catppuccin.test\"")}
            }
        }}
    }
}
