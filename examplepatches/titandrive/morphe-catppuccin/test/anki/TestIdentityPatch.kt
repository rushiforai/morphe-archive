// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.anki.test
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

val ankiTestIdentityPatch = bytecodePatch(name="AnkiDroid isolated test identity", default=false) {
    compatibleWith(Compatibility(name="AnkiDroid",packageName="com.ichi2.anki",targets=listOf(AppTarget(version="2.25.1"),AppTarget(version="2.25.2"))))
    dependsOn(resourcePatch {
        execute {
            document("AndroidManifest.xml").use { xml ->
                xml.documentElement.setAttribute("package","com.ichi2.anki.catppuccin.test")
                val nodes=xml.getElementsByTagName("*")
                for(i in 0 until nodes.length) {
                    val node=nodes.item(i) as Element
                    for(name in listOf("android:authorities","android:permission","android:readPermission","android:writePermission")) {
                        if(node.hasAttribute(name)) node.setAttribute(name,node.getAttribute(name).replace("com.ichi2.anki", "com.ichi2.anki.catppuccin.test"))
                    }
                    if(node.tagName in listOf("permission","uses-permission") && node.getAttribute("android:name").startsWith("com.ichi2.anki.")) node.setAttribute("android:name",node.getAttribute("android:name").replace("com.ichi2.anki", "com.ichi2.anki.catppuccin.test"))
                }
                val activities=xml.getElementsByTagName("activity")
                for(i in 0 until activities.length) {
                    val activity=activities.item(i) as Element
                    if(activity.getAttribute("android:name")=="app.morphe.extension.anki.WidgetSettingsActivity")activity.setAttribute("android:exported","true")
                }
                (xml.getElementsByTagName("application").item(0) as Element).apply {
                    setAttribute("android:label","AnkiDroid Patch Test")
                    setAttribute("android:debuggable","true")
                }
            }
            document("res/xml/preferences_appearance.xml").use { xml ->
                val intents=xml.getElementsByTagName("intent")
                for(i in 0 until intents.length) (intents.item(i) as Element).setAttribute("android:targetPackage","com.ichi2.anki.catppuccin.test")
            }
        }
    })
    execute {
        val classes=mutableListOf<ClassDef>();classDefForEach {classes.add(it)}
        classes.forEach { klass -> klass.methods.forEach { method ->
            val changes=method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
                val value=((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if(value=="com.ichi2.anki") index to (instruction as OneRegisterInstruction).registerA else null
            }.orEmpty()
            if(changes.isNotEmpty()) {
                val mutable=mutableClassDefBy(klass).methods.single {it.name==method.name&&it.parameterTypes==method.parameterTypes&&it.returnType==method.returnType}
                changes.forEach {(index,reg)->mutable.replaceInstruction(index,"const-string v$reg, \"com.ichi2.anki.catppuccin.test\"")}
            }
        }}
    }
}
