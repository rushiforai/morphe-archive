package app.zonghome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

internal val rowStylingPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        data class Hook(val type: String, val name: String, val parameters: List<String>, val register: Int, val holder: Boolean)
        val adapters = setOf("UsageDetailsAdapter", "UsageAdapter", "UsageSummaryAdapter", "BundleAdapter",
            "ParentBundleAdapter", "ResourcesBundleAdapter", "BundleFilterAdapter", "BundleFilterRangeAdapter", "DynamicSearchAdapter")
        val hooks = mutableListOf<Hook>()
        classDefForEach { cls ->
            val adapter = cls.type.substringAfterLast('/').substringBefore('$').removeSuffix(";")
            if (cls.type.startsWith("Lcom/zong/customercare/view/adapter/") && adapter in adapters) for (method in cls.methods) {
                if (method.implementation == null || method.returnType != "V") continue
                val parameters = method.parameterTypes.map { it.toString() }
                if (method.name == "onBindViewHolder" && method.accessFlags and 0x48 == 0 && parameters.firstOrNull()?.startsWith("L") == true)
                    hooks.add(Hook(cls.type, method.name, parameters, 1, true))
                if (method.name == "<init>" && "Landroid/view/View;" in parameters) {
                    var register = 1
                    for (parameter in parameters) {
                        if (parameter == "Landroid/view/View;") {
                            hooks.add(Hook(cls.type, method.name, parameters, register, false))
                            break
                        }
                        register += if (parameter == "J" || parameter == "D") 2 else 1
                    }
                }
            }
        }
        check(hooks.isNotEmpty()) { "Missing adapter row styling entry points" }
        for (hook in hooks) {
            val method = mutableClassDefBy(hook.type).methods.single {
                it.name == hook.name && it.parameterTypes.map { p -> p.toString() } == hook.parameters && it.returnType == "V"
            }
            // Parameters have their declared types here. Optimized code can reuse them later.
            val callback = if (hook.holder) "onBound(Ljava/lang/Object;)V" else "onInflatedView(Landroid/view/View;)V"
            method.addInstruction(0,
                "invoke-static/range {p${hook.register} .. p${hook.register}}, Lapp/zonghome/extension/RowStyling;->$callback")
        }
    }
}
