package app.canada.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/** Keep jumps to the old instruction entering the hook, rather than skipping it. */
private fun MutableMethod.insertAtTarget(index: Int, code: String) {
    val oldLocation=instructions[index].location
    val incoming=oldLocation.labels.toList()
    addInstructions(index,code)
    val first=instructions[index].location
    incoming.forEach { oldLocation.labels.remove(it); first.labels.add(it) }
}

/** Capture the root View before the checklist binder reuses p1 for other types.
 * Each extension posts its UI work, so it runs after native onViewCreated finishes.
 */
private fun MutableMethod.afterViewCreatedSuper(code: String) {
    val superCall=instructions.withIndex().single {
        val ref=(it.value as? ReferenceInstruction)?.reference as? MethodReference
        it.value.opcode==Opcode.INVOKE_SUPER && ref?.name=="onViewCreated" &&
            ref.parameterTypes==listOf("Landroid/view/View;","Landroid/os/Bundle;")
    }.index
    insertAtTarget(superCall+1,code)
}

private const val H = "Lapp/canada/walmart/CanadaHooks;"
private const val F = "Lapp/canada/walmart/WalmartFindItemButton;"
private const val TILE = "Lcom/walmart/glass/lists/view/lists/ListDetailTileView;"
private const val L = "Lapp/canada/walmart/ListEnhancements;"
private const val S = "Lapp/canada/walmart/ShoppingMode;"
private const val C = "Lapp/canada/walmart/ChecklistTools;"
private val canada = Compatibility(name="Walmart Canada", packageName="ca.walmart.ecommerceapp",
    apkFileType=ApkFileType.APKM, appIconColor=0x0071CE,
    targets=listOf(AppTarget(version="26.31", isExperimental=true)))

val patchTools = bytecodePatch(name="Patch Tools — Canada",
    description="Replace Sparky's bottom tab with Patch tools: live ad/recording controls, searchable price trends, watchlists and targets, CSV/JSON export and restore, scanner, shopping calculators and diagnostics.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        // CH.b is SparkyBottomTabInfo (implements v51.c). Preserve the internal
        // navigation identity, but replace its user-facing label, icon and action.
        for ((name,ret,code) in listOf(
            Triple("b","Ljava/lang/String;","const-string v0, \"Patch tools\"\nreturn-object v0"),
            Triple("g","I","const v0, 0x1080042\nreturn v0"),
            Triple("e","Z","const/4 v0, 0x1\nreturn v0"))) {
            val getter=Fingerprint(definingClass="LCH/b;",name=name,parameters=emptyList(),returnType=ret).method
            check(getter.implementation!!.tryBlocks.isEmpty())
            getter.removeInstructions(0,getter.instructions.size)
            getter.addInstructions(0,code)
        }
        val click=Fingerprint(definingClass="LCH/b;",name="c",parameters=listOf("Lglass/platform/android/components/widgets/BottomNavigationView;"),returnType="V").method
        check(click.implementation!!.tryBlocks.isEmpty())
        click.removeInstructions(0,click.instructions.size)
        click.addInstructions(0,"invoke-static/range {p1 .. p1}, Lapp/canada/walmart/PatchStatus;->open(Landroid/view/View;)V\nreturn-void")
        for (type in listOf("Lcom/walmart/glass/converse/sparkycallout/SparkyTabCallout;","Lcom/walmart/glass/converse/sparkyessentialscallout/SparkyTabEssentialsAeCallOut;")) {
            val init=Fingerprint(definingClass=type,name="<init>",parameters=listOf("Landroid/content/Context;"),returnType="V").method
            init.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
                init.insertAtTarget(it,"invoke-static/range {p0 .. p0}, Lapp/canada/walmart/SparkyReplacement;->suppress(Landroid/view/View;)V")
            }
        }
        val fab=Fingerprint(definingClass="Lcom/walmart/glass/converse/unified/chat/ui/view/ConverseUnifiedFABView;",name="getView",parameters=emptyList(),returnType="Landroid/view/View;").method
        fab.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}.map{it.index}.reversed().forEach {
            val r=(fab.instructions[it] as OneRegisterInstruction).registerA
            fab.insertAtTarget(it,"invoke-static/range {v$r .. v$r}, Lapp/canada/walmart/SparkyReplacement;->fab(Landroid/view/View;)V")
        }
    }
}

val defaultLists = bytecodePatch(name="Default Lists Tab — Canada",
    description="Open Lists when entering My Items. Walmart Canada 26.31.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->lists()V")
        val method=Fingerprint(definingClass="LYh0/l;",name="onViewCreated",
            parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;"),returnType="V").method
        method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            method.insertAtTarget(it,"invoke-static/range {p1 .. p1}, $H->selectLists(Landroid/view/View;)V")
        }
    }
}
val stock = bytecodePatch(name="Stock Availability — Canada",
    description="Show Walmart's supplied availability and message below list item names. Unknown stays unknown; purchase limits are never treated as inventory counts.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->stock()V")
        val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/h;",name="H",
            parameters=listOf("Lcom/walmart/glass/lists/domain/ListItem\$ListDetailItem;","LS30/j;"),returnType="V").method
        method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            method.insertAtTarget(it,"invoke-static/range {p0 .. p1}, Lapp/canada/walmart/TileHooks;->stock(Ljava/lang/Object;Ljava/lang/Object;)V")
        }
    }
}
val findItem = bytecodePatch(name="Find Item for Linked Items — Canada",
    description="Restore Find item on linked shopping-list products so they can be linked to a different product.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->find()V")
        val action=Fingerprint(definingClass=TILE,name="setActionButton",parameters=listOf("Lb40/p;"),returnType="V").method
        action.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            action.insertAtTarget(it,"invoke-static/range {p0 .. p1}, $F->onSetActionButton(Landroid/view/View;Ljava/lang/Object;)V")
        }
        val listener=Fingerprint(definingClass=TILE,name="setOnActionButtonClicked",parameters=listOf("Lkotlin/jvm/functions/Function1;"),returnType="V").method
        listener.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            listener.insertAtTarget(it,"invoke-static/range {p0 .. p1}, $F->onTileBind(Landroid/view/View;Ljava/lang/Object;)V")
        }
    }
}
val removeShop = bytecodePatch(name="Remove Shop — Canada",
    description="Hide Shop from bottom navigation and redirect the default Shop tab to My Items. Explicit other tabs are preserved.", default=false) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->shop()V")
        val nav=Fingerprint(definingClass="LbT/b;",name="f",parameters=emptyList(),returnType="Ljava/util/Map;").method
        nav.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}.map{it.index}.reversed().forEach {
            val r=(nav.instructions[it] as OneRegisterInstruction).registerA
            nav.insertAtTarget(it,"invoke-static/range {v$r .. v$r}, $H->filterNav(Ljava/util/Map;)Ljava/util/Map;\nmove-result-object v$r")
        }
        val start=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="E",
            parameters=listOf("Landroid/os/Bundle;","Ljava/lang/String;"),returnType="Lv51/i;").method
        start.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_OBJECT}.map{it.index}.reversed().forEach {
            val r=(start.instructions[it] as OneRegisterInstruction).registerA
            start.insertAtTarget(it,"invoke-static/range {v$r .. v$r}, $H->defaultTab(Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v$r\ncheck-cast v$r, Lv51/i;")
        }
    }
}

val priceHistory = bytecodePatch(name="Personal Price History — Canada",
    description="Record exact prices from list cards and search/browse product tiles. Tap History on list cards, or Patch tools → Price history. Recording starts after installation.", default=true) {
    dependsOn(patchTools)
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->history()V")
        val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/h;",name="H",
            parameters=listOf("Lcom/walmart/glass/lists/domain/ListItem\$ListDetailItem;","LS30/j;"),returnType="V").method
        method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            method.insertAtTarget(it,"invoke-static/range {p0 .. p1}, Lapp/canada/walmart/TileHooks;->history(Ljava/lang/Object;Ljava/lang/Object;)V")
        }
        val grid=Fingerprint(definingClass="Lcom/walmart/glass/ui/product/tile/GridProductTileView;",name="B1",
            parameters=listOf("LFW0/I0;","LJW0/e;","LFW0/P0;","LFW0/R0;","Z","Z","Z","Z","Lkotlin/Pair;","Ljava/util/Map;"),returnType="V").method
        val large=Fingerprint(definingClass="Lcom/walmart/glass/ui/product/tile/LargeListProductTileView;",name="z1",
            parameters=listOf("Lcom/walmart/glass/ui/product/tile/LargeListProductTileView;","LFW0/I0;","LJW0/e;","LFW0/P0;","LFW0/R0;","Ljava/lang/Boolean;","Lkotlin/Pair;","Ljava/util/Map;","I"),returnType="V").method
        for (bind in listOf(grid,large)) bind.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            bind.insertAtTarget(it,"invoke-static/range {p0 .. p1}, $L->bindBrowse(Landroid/view/View;Ljava/lang/Object;)V")
        }
    }
}
val unitPrices = bytecodePatch(name="Clearer Unit Prices — Canada",
    description="Show Walmart's supplied price-per-unit in larger bold text on list items, including the shopping checklist. No guessed conversions.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->unit()V")
        val method=Fingerprint(definingClass=TILE,name="setListDetailPerEachPrice",
            parameters=listOf("Ljava/lang/String;"),returnType="V").method
        method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            method.insertAtTarget(it,"invoke-static/range {p0 .. p0}, $L->unitPrice(Landroid/view/View;)V")
        }
    }
}
val shoppingMode = bytecodePatch(name="Shopping Mode — Canada",
    description="Checklist switches for keeping the screen awake, larger checkboxes and hiding collected rows. Show collected restores them without changing your list.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->shopping()V")
        val screen=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/c;",name="onViewCreated",
            parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;"),returnType="V").method
        screen.afterViewCreatedSuper("invoke-static/range {p1 .. p1}, $S->install(Landroid/view/View;)V")
        for (adapter in listOf("Lcom/walmart/glass/lists/view/lists/a;", "Le40/e0;")) {
        val bind=Fingerprint(definingClass=adapter,name="onBindViewHolder",
            parameters=listOf("Landroidx/recyclerview/widget/RecyclerView\$A;","I"),returnType="V").method
        bind.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            bind.insertAtTarget(it,"invoke-static/range {p1 .. p1}, $S->afterBind(Ljava/lang/Object;)V")
        }
        bind.addInstructions(0,"invoke-static/range {p1 .. p1}, $S->beforeBind(Ljava/lang/Object;)V")
        }
        val select=Fingerprint(definingClass=TILE,name="setIsItemSelected",parameters=listOf("Z"),returnType="V").method
        select.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            select.insertAtTarget(it,"invoke-static/range {p0 .. p0}, $S->selected(Landroid/view/View;)V")
        }
    }
}

val aisleSort = bytecodePatch(name="Aisle-Sorted Checklist — Canada",
    description="Group remaining checklist items by supplied aisle, in natural order (A2 before A10). Unknown locations last. No floor-plan routing.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->aisles()V")
        for ((name,params) in listOf("w" to listOf("Ljava/util/List;"), "x" to listOf("Ljava/util/List;","Ljava/lang/Runnable;"))) {
            val method=Fingerprint(definingClass="Landroidx/recyclerview/widget/z;",name=name,parameters=params,returnType="V").method
            method.addInstructions(0,"invoke-static/range {p0 .. p1}, Lapp/canada/walmart/AisleSort;->sortAisles(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;\nmove-result-object p1")
        }
    }
}
val runningTotal = bytecodePatch(name="Running List Total — Canada",
    description="Checklist subtotal, remaining and collected amounts from all loaded items, including offscreen rows. Estimated CAD before tax/fees; missing prices are counted and excluded.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->total()V")
        val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/c;",name="onViewCreated",
            parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;"),returnType="V").method
        method.afterViewCreatedSuper("invoke-static/range {p1 .. p1}, $C->installTotal(Landroid/view/View;)V")
    }
}
val quickScanner = bytecodePatch(name="Quick Scanner — Canada",
    description="Add a Scan barcode shortcut to the shopping checklist, opening Walmart's native scanner and permission flow.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->scanner()V")
        val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/c;",name="onViewCreated",
            parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;"),returnType="V").method
        method.afterViewCreatedSuper("invoke-static/range {p1 .. p1}, $C->installScanner(Landroid/view/View;)V")
    }
}
val promotionCleanup = bytecodePatch(name="Promotion Cleanup — Canada",
    description="Collapse the shopping-list deals promotional banner. Product discounts, expiry conditions, rewards, totals and checkout are preserved. Not an app-wide ad blocker.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->promo()V")
        // The active deals-list adapter binds its layout directly, without the custom-view setters.
        val bind=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/ListsDetailRecyclerView\$c;",name="p",
            parameters=listOf("Ljava/lang/Object;","I","Landroidx/recyclerview/widget/RecyclerView\$A;","Ljava/util/List;"),returnType="V").method
        bind.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            bind.insertAtTarget(it,"invoke-static/range {p3 .. p3}, $C->hidePromotionHolder(Ljava/lang/Object;)V")
        }
        for (name in listOf("setHeader","setCtaText")) {
            val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/ListDealsBottomBanner;",name=name,
                parameters=listOf("Ljava/lang/String;"),returnType="V").method
            method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
                method.insertAtTarget(it,"invoke-static/range {p0 .. p0}, $C->hidePromotionBanner(Landroid/view/View;)V")
            }
        }
    }
}
val saleReminders = bytecodePatch(name="Sale-Ending Reminders — Canada",
    description="Make Walmart's supplied promotion expiry text prominent on list items. In-list reminders only; no invented deadlines or background notifications.", default=true) {
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->expiry()V")
        val method=Fingerprint(definingClass="Lcom/walmart/glass/lists/view/lists/h;",name="H",parameters=listOf("Lcom/walmart/glass/lists/domain/ListItem\$ListDetailItem;","LS30/j;"),returnType="V").method
        method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            method.insertAtTarget(it,"invoke-static/range {p0 .. p1}, Lapp/canada/walmart/TileHooks;->expiry(Ljava/lang/Object;Ljava/lang/Object;)V")
        }
    }
}

val hideAds = bytecodePatch(name="Hide Ads and Sponsored Content — Canada",
    description="Collapse native ad containers and entire sponsored grid/list product cards, restoring organic cards when recycled. Includes display ads and sponsored carousels. Does not block network requests; some layouts may retain empty slots.", default=true) {
    dependsOn(patchTools)
    compatibleWith(canada); extendWith("extensions/canada.mpe")
    execute {
        val report=Fingerprint(definingClass="Lcom/walmart/glass/integration/root/RootActivity;",name="onCreate",parameters=listOf("Landroid/os/Bundle;"),returnType="V").method
        report.addInstructions(0,"invoke-static {}, Lapp/canada/walmart/PatchStatus;->ads()V")
        val constructor=Fingerprint(definingClass="Lcom/walmart/glass/ads/api/AdsView;",name="<init>",
            parameters=listOf("Landroid/content/Context;","Landroid/util/AttributeSet;","I"),returnType="V").method
        constructor.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
            constructor.insertAtTarget(it,"invoke-static/range {p0 .. p0}, Lapp/canada/walmart/AdCleaner;->dedicated(Landroid/view/View;)V")
        }
        for (owner in listOf("GridProductTileView","LargeListProductTileView")) {
            val method=Fingerprint(definingClass="Lcom/walmart/glass/ui/product/tile/$owner;",name="r1",
                parameters=listOf("LfX0/L0;","Lcom/walmart/glass/ui/shared/sponsored/SponsoredContainerView;","LLX0/f;","Lcom/walmart/glass/ui/shared/sponsored/SponsoredContainerView;"),returnType="V").method
            method.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed().forEach {
                method.insertAtTarget(it,"invoke-static/range {p0 .. p1}, Lapp/canada/walmart/AdCleaner;->sponsored(Landroid/view/View;Ljava/lang/Object;)V")
            }
        }
    }
}
