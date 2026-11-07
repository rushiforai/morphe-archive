// SPDX-License-Identifier: GPL-3.0-or-later
package app.morphe.patches.boost.test

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

private const val original = "com.rubenmayayo.reddit"
private const val isolated = "com.rubenmayayo.reddit.catppuccin.test"

val boostTestIdentityPatch = bytecodePatch(name="Boost isolated test identity",default=false) {
    compatibleWith(Compatibility(name="Boost for Reddit",packageName=original,targets=listOf(AppTarget(version="1.14.2"),AppTarget(version="1.14.3"))))
    dependsOn(resourcePatch { execute {
        document("AndroidManifest.xml").use { xml ->
            xml.documentElement.setAttribute("package",isolated)
            val nodes=xml.getElementsByTagName("*")
            for(i in 0 until nodes.length) {
                val node=nodes.item(i) as? Element ?: continue
                for(name in listOf("android:authorities","android:permission","android:readPermission","android:writePermission"))
                    if(node.hasAttribute(name)) node.setAttribute(name,node.getAttribute(name).replace(original,isolated))
                if(node.tagName in listOf("permission","uses-permission") && node.getAttribute("android:name").startsWith(original))
                    node.setAttribute("android:name",node.getAttribute("android:name").replace(original,isolated))
                if(node.tagName=="application") {
                    node.setAttribute("android:label","Boost Theme Test")
                    node.setAttribute("android:allowBackup","false")
                    node.appendChild(xml.createElement("activity").apply {
                        setAttribute("android:name","app.morphe.extension.boost.LinkProbe")
                        setAttribute("android:exported","true")
                    })
                }
            }
        }
        for(path in listOf("res/xml/authenticator.xml","res/xml/syncadapter.xml")) if(get(path).exists()) {
            document(path).use { xml ->
                xml.documentElement.setAttribute("android:accountType","$isolated.account")
                if(xml.documentElement.hasAttribute("android:contentAuthority"))
                    xml.documentElement.setAttribute("android:contentAuthority","$isolated.provider")
            }
        }
    } })
    execute {
        val classes=mutableListOf<ClassDef>();classDefForEach {classes.add(it)}
        for(klass in classes) for(method in klass.methods) {
            val changes=method.implementation?.instructions?.mapIndexedNotNull { i,ins ->
                val value=((ins as? ReferenceInstruction)?.reference as? StringReference)?.string
                if(value in listOf(original,"$original.provider","appid")) Triple(i,(ins as OneRegisterInstruction).registerA,
                    if(value=="appid") "$isolated.account" else value!!.replace(original,isolated)) else null
            }.orEmpty()
            if(changes.isEmpty()) continue
            val target=mutableClassDefBy(klass).methods.single {it.name==method.name && it.parameterTypes==method.parameterTypes && it.returnType==method.returnType}
            for((i,reg,value) in changes) target.replaceInstruction(i,"const-string v$reg, \"$value\"")
        }
        // Set Macchiato once in this copy only; subsequent picker changes persist.
        mutableClassDefBy("Lps2;").methods.single {it.name=="R"}.addInstructionsWithLabels(0,"""
            iget-object v0, p0, Lps2;->a:Landroid/content/SharedPreferences;
            const-string v1, "catppuccin_test_bars"
            const/4 v2, 0
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
            move-result v2
            if-nez v2, :bars_initialized
            invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
            const-string v1, "pref_indent_style"
            const-string v2, "0"
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            const-string v1, "catppuccin_test_bars"
            const/4 v2, 1
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
            invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            :bars_initialized
            iget-object v0, p0, Lps2;->a:Landroid/content/SharedPreferences;
            const-string v1, "catppuccin_test_defaults"
            const/4 v2, 0
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
            move-result v2
            if-nez v2, :initialized
            invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
            move-result-object v0
            const-string v1, "pref_theme"
            const-string v2, "18"
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            const-string v1, "pref_theme_night"
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
            const-string v1, "pref_dynamic_colors"
            const/4 v2, 0
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
            const-string v1, "catppuccin_test_defaults"
            const/4 v2, 1
            invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
            invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            :initialized
            nop
        """)
    }
}
