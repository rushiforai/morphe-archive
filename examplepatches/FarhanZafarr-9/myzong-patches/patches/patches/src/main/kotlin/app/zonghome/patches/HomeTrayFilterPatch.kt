package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption

private const val FILTER = "Lapp/zonghome/extension/HomeTrayFilter;"
private val choices = listOf(
    "Rewards", "Free MBs", "Daraz Hot Deals", "Brief History", "Rs 100 Shop", "20% Off", "IR",
    "Tax Certificate", "Balance Save", "Yaari Load", "Call Blocks", "Book Your Number",
    "Value Added Services", "Business Sales Leads"
)
private fun shortcutKey(label: String): String {
    val normalized = label.lowercase(java.util.Locale.ROOT).filter { it.isLetterOrDigit() }
    return if (normalized in setOf("freembs", "freemb", "freemegabytes")) "rewards" else normalized
}

@Suppress("unused")
val customizeHomeShortcutsPatch = bytecodePatch(
    name = "Home shortcuts",
    description = "Keep only the selected home options. Defaults to Rewards and Rs 100 Shop; no other items are kept automatically.",
    default = true
) {
    category("Home")
    compatibleWith(Compatibility(
        name = "My Zong", packageName = "com.zong.customercare", apkFileType = ApkFileType.APK,
        appIconColor = 0x80c342, targets = listOf(AppTarget(version = "5.19.19.112"))
    ))
    dependsOn(sharedExtensionPatch, hideHomeShortcutsCardPatch, hideMakeYourOwnBundlePatch, hideBachatBazaarPatch, hideZong4uPatch)
    setting("hideShortcutCard", "Show shortcuts tray", true, true, "When off, the entire tray is hidden regardless of the keep list.")
    setting("hideMyob", "Show Make Your Own Bundle", false, true)
    setting("hideBachat", "Show Bachat Bazaar", false, true)
    setting("hideZong4u", "Show Zong4U", false, true)

    // Morphe Manager currently renders List<String> as a list editor, not native checkboxes.
    val kept by stringsOption(
        key = "shortcutsToKeep",
        title = "Home shortcuts to keep",
        default = listOf("Rewards", "Rs 100 Shop"),
        description = "Choose multiple names in this list. Unlisted or future shortcuts stay hidden. " +
            "Use the displayed shortcut names, including any names added by the server. Examples: " + choices.joinToString(", ") + ". An empty list hides all shortcuts.",
        required = true,
        validator = { selected -> selected != null && selected.all { item -> shortcutKey(item).isNotEmpty() } }
    )

    execute {
        val encoded = requireNotNull(kept).map(::shortcutKey).distinct().joinToString("|")
        check(encoded.all { it.isLetterOrDigit() || it == '|' }) { "Invalid shortcut encoding" }
        val config = Fingerprint(
            definingClass = FILTER, name = "selectedKeys", returnType = "Ljava/lang/String;", parameters = emptyList()
        ).method
        check(config.implementation!!.registerCount >= 1) { "No register for tray configuration" }
        config.addInstructions(0, "const-string v0, \"$encoded\"\nreturn-object v0")

        // Fail patching rather than silently guessing a renamed item getter.
        Fingerprint(
            definingClass = "Lcom/zong/customercare/service/database/models/TrayHome;",
            name = "getName", returnType = "Ljava/lang/String;", parameters = emptyList()
        ).method
        val setter = Fingerprint(
            definingClass = "Lcom/zong/customercare/view/adapter/HomeTrayAdapter;",
            name = "setListHomeTray", returnType = "V", parameters = listOf("Ljava/util/List;")
        ).method
        check(setter.implementation!!.registerCount <= 255) { "Unsupported tray-setter register count" }
        setter.addInstructions(0,
            "invoke-static/range {p1 .. p1}, $FILTER->filter(Ljava/util/List;)Ljava/util/List;\nmove-result-object p1"
        )
        // Some initial data reaches the adapter through its constructor rather than its setter.
        // Apply the identical allowlist before the first adapter field assignment/bind.
        val adapter=mutableClassDefBy("Lcom/zong/customercare/view/adapter/HomeTrayAdapter;")
        for(constructor in adapter.methods.filter { it.name=="<init>" }) {
            val lists=constructor.parameterTypes.withIndex().filter { it.value=="Ljava/util/List;" }
            check(lists.size<=1) { "Unexpected multi-list Home tray constructor" }
            if(lists.isEmpty())continue
            var register=1 // instance receiver occupies p0; wide parameters consume two slots.
            for(type in constructor.parameterTypes.take(lists.single().index))register+=if(type=="J" || type=="D")2 else 1
            check(constructor.implementation!!.registerCount<=255)
            constructor.addInstructions(0,
                "invoke-static/range {p$register .. p$register}, $FILTER->filter(Ljava/util/List;)Ljava/util/List;\nmove-result-object p$register")
        }
        Fingerprint(
            definingClass = "Lcom/zong/customercare/view/ui/HomeTrayFrag;",
            name = "onViewCreated", returnType = "V",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        ).method.addInstruction(0, "invoke-static/range {p1 .. p1}, $FILTER->attach(Landroid/view/View;)V")
    }
}
