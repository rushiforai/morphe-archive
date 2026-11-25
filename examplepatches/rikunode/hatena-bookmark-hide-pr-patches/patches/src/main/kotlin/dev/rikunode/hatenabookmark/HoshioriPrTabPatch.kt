package dev.rikunode.hatenabookmark

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val ADAPTER = "Lcom/hatena/android/bookmark/presentation/fragment/entrylist/TopFragment\$Adapter;"
private const val TOP = "Lcom/hatena/android/bookmark/presentation/fragment/entrylist/TopFragment;"
private const val PR = "Ldev/rikunode/settings/HoshioriPrTab;"
private const val HOT = "Lcom/hatena/android/bookmark/presentation/fragment/entrylist/HotEntryListFragment;"

/** Append one page to the stock pager, leaving the original enum and saved tab order unchanged. */
@Suppress("unused")
val hoshioriPrTabPatch = bytecodePatch(
    name = "PR article tab",
    description = "Optionally show received PR articles in a separate home tab.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Hatena Bookmark", packageName = "com.hatena.android.bookmark",
        apkFileType = ApkFileType.APK, appIconColor = 0x2A9BD6,
        targets = listOf(AppTarget(version = "5.80", versionCode = 58000)),
    ))
    dependsOn(hideNativePrEntriesPatch)
    execute {
        fun guarded(owner: String, name: String, params: Int, registers: Int, size: Int) =
            classDefBy(owner).methods.singleOrNull {
                it.name == name && it.parameterTypes.size == params &&
                    it.implementation?.registerCount == registers &&
                    it.implementation?.instructions?.sumOf { i -> i.codeUnits } == size
            } ?: throw PatchException("Hatena 5.80 PR pager guard failed: $name")

        val init = guarded(ADAPTER, "<init>", 6, 8, 48)
        val count = guarded(ADAPTER, "getCount", 0, 2, 6)
        val item = guarded(ADAPTER, "getItem", 1, 4, 104)
        val title = guarded(ADAPTER, "getPageTitle", 1, 4, 64)
        val resume = guarded(TOP, "onResume", 0, 4, 74)
        guarded(ADAPTER, "getItemId", 1, 4, 2)
        val viewCreated = guarded(HOT, "onViewCreated", 2, 16, 296)
        guarded(HOT, "reload", 1, 5, 42)
        guarded(HOT, "onShown", 0, 5, 34)
        guarded(HOT, "onDestroyView", 0, 3, 14)
        fun at(method: com.android.tools.smali.dexlib2.iface.Method, offset: Int, opcode: Opcode): Int {
            var pc = 0
            for ((index, instruction) in method.implementation!!.instructions.withIndex()) {
                if (pc == offset && instruction.opcode == opcode) return index
                pc += instruction.codeUnits
            }
            throw PatchException("Hatena 5.80 PR pager call-site guard failed: ${method.name}")
        }
        val initIndex = at(init, 0x2f, Opcode.RETURN_VOID)
        val countIndex = at(count, 5, Opcode.RETURN)
        val resumeIndex = at(resume, 0x2b, Opcode.IF_NEZ)
        val nativeDataIndex = at(viewCreated, 0xea, Opcode.INVOKE_VIRTUAL)
        require((viewCreated.implementation!!.instructions.elementAt(nativeDataIndex) as ReferenceInstruction)
            .reference.toString().endsWith("->getViewLifecycleOwner()Landroidx/lifecycle/LifecycleOwner;"))
        require(item.implementation!!.instructions.first().opcode == Opcode.SGET_OBJECT)
        require(title.implementation!!.instructions.first().opcode == Opcode.SGET_OBJECT)
        val owner = mutableClassDefBy(ADAPTER)
        fun find(name: String, params: Int) = owner.methods.single {
            it.name == name && it.parameterTypes.size == params
        }
        find("<init>", 6).addInstructions(initIndex, """
            iget-object v0, p0, ${ADAPTER}->context:Landroid/content/Context;
            invoke-static { p0, v0 }, ${PR}->initAdapter(Ljava/lang/Object;Landroid/content/Context;)V
        """.trimIndent())
        find("getCount", 0).addInstructions(countIndex, """
            invoke-static { p0, v0 }, ${PR}->count(Ljava/lang/Object;I)I
            move-result v0
        """.trimIndent())
        find("getItem", 1).addInstructionsWithLabels(0, """
            invoke-static { p0, p1 }, ${PR}->isPrPage(Ljava/lang/Object;I)Z
            move-result v0
            if-eqz v0, :original_page
            invoke-static { p0 }, ${PR}->createFragment(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Landroidx/fragment/app/Fragment;
            return-object v0
            :original_page
            nop
        """.trimIndent())
        find("getPageTitle", 1).addInstructionsWithLabels(0, """
            invoke-static { p0, p1 }, ${PR}->isPrPage(Ljava/lang/Object;I)Z
            move-result v0
            if-eqz v0, :original_title
            const-string v0, "PR"
            return-object v0
            :original_title
            nop
        """.trimIndent())
        // Avoid restoring the old 0.7.0 text-list fragment under its old cache ID.
        find("getItemId", 1).addInstructionsWithLabels(0, """
            invoke-static { p0, p1 }, ${PR}->isPrPage(Ljava/lang/Object;I)Z
            move-result v0
            if-eqz v0, :original_id
            const-wide/32 v0, 110071
            return-wide v0
            :original_id
            nop
        """.trimIndent())
        val hot = mutableClassDefBy(HOT)
        // Keep the host adapter, layout, decorations and callbacks; replace only the
        // category flow collection for the marked PR fragment.
        hot.methods.single { it.name == "onViewCreated" && it.parameterTypes.size == 2 }
            .addInstructionsWithLabels(nativeDataIndex, """
                invoke-static { p0 }, ${PR}->attachPage(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :stock_feed
                return-void
                :stock_feed
                nop
            """.trimIndent())
        for (name in listOf("reload", "onShown")) {
            hot.methods.single { it.name == name }.addInstructionsWithLabels(0, """
                invoke-static { p0 }, ${PR}->reloadPage(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :stock_reload
                return-void
                :stock_reload
                nop
            """.trimIndent())
        }
        hot.methods.single { it.name == "onDestroyView" }.addInstructions(0, """
            invoke-static { p0 }, ${PR}->detachPage(Ljava/lang/Object;)V
        """.trimIndent())
        // Reuse the host's existing tab-order-change navigation path.
        mutableClassDefBy(TOP).methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }.addInstructionsWithLabels(resumeIndex, """
            invoke-static { p0 }, ${PR}->configChanged(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :same_config
            const/4 v1, 0x0
            :same_config
            nop
        """.trimIndent())
    }
}
