package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.applyHomeTabs(
    hideFeaturedTab: Boolean,
    hidePlazaTab: Boolean,
    hideCampaignTabs: Boolean,
    hideSubscriptionsTab: Boolean,
    hideAnimeTab: Boolean,
    hideShortsTab: Boolean,
    hideOpusTab: Boolean,
    simplifySinglePageHome: Boolean,
    hideSearch: Boolean,
) {
    if (simplifySinglePageHome) installSingleHomePageLayout(hideSearch)

    val uriPatterns = buildList {
        if (hideFeaturedTab == true) {
            add("pegasus/promo")
        }
        if (hidePlazaTab == true) {
            add("pegasus/channel")
            add("plaza")
        }
        if (hideCampaignTabs == true) {
            add("activity")
            add("operation")
        }
        if (hideSubscriptionsTab == true) {
            add("main/subscriptions")
        }
        if (hideAnimeTab == true) {
            add("anime/cartoon")
        }
        if (hideShortsTab == true) {
            add("anime/shorts")
        }
        if (hideOpusTab == true) {
            add("main/opus")
        }
    }

    val namePatterns = buildList {
        if (hideFeaturedTab == true) {
            add("Featured")
            add("For You")
            add("Untuk Anda")
        }
        if (hidePlazaTab == true) {
            add("Plaza")
            add("plaza")
        }
        if (hideCampaignTabs == true) {
            add("Itabag")
            add("itabag")
            add("Gratis")
            add("gratis")
            add("Sementara")
            add("sementara")
        }
        if (hideSubscriptionsTab == true) {
            add("Subscriptions")
            add("Langganan")
        }
        if (hideAnimeTab == true) {
            add("Anime")
        }
        if (hideShortsTab == true) {
            add("Shorts")
        }
        if (hideOpusTab == true) {
            add("Opus")
        }
    }

    if (uriPatterns.isEmpty() && namePatterns.isEmpty()) return

    val method = HomeNavigationInfoFingerprint.method
    val classDef = HomeNavigationInfoFingerprint.classDef

    val uriCheckBranches = uriPatterns.joinToString("\n") { pattern ->
        """
            const-string v4, "$pattern"
            invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v5
            if-nez v5, :remove_item
        """.trimIndent()
    }

    val nameCheckBranches = namePatterns.joinToString("\n") { pattern ->
        """
            const-string v4, "$pattern"
            invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v5
            if-nez v5, :remove_item
        """.trimIndent()
    }

    val filterBody = """
        if-eqz p0, :cond_done

        invoke-interface {p0}, Ljava/util/List;->size()I
        move-result v0
        const/4 v1, 0x1
        if-le v0, v1, :cond_done

        invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
        move-result-object v0

        :loop_start
        invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
        move-result v1
        if-eqz v1, :cond_done

        invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v1
        if-eqz v1, :loop_start

        instance-of v2, v1, Lnf1/f;
        if-eqz v2, :loop_start

        check-cast v1, Lnf1/f;
        iget-object v2, v1, Lnf1/f;->c:Ljava/lang/String;
        iget-object v3, v1, Lnf1/f;->b:Ljava/lang/String;

        if-eqz v2, :check_name
        $uriCheckBranches

        :check_name
        if-eqz v3, :loop_start
        $nameCheckBranches

        goto :loop_start

        :remove_item
        invoke-interface {p0}, Ljava/util/List;->size()I
        move-result v6
        const/4 v5, 0x1
        if-le v6, v5, :cond_done

        invoke-interface {v0}, Ljava/util/Iterator;->remove()V
        goto :loop_start

        :cond_done
        return-object p0
    """.trimIndent()

    val filterMethod = MutableMethod(
        ImmutableMethod(
            classDef.type,
            "filterHomeTabs",
            listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null)),
            "Ljava/util/List;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(8),
        ),
    )
    filterMethod.addInstructions(0, filterBody)
    classDef.methods.add(filterMethod)

    method.addInstructions(
        0,
        """
            invoke-static {p1}, ${classDef.type}->filterHomeTabs(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """.trimIndent(),
    )
}

private fun Method.homePageCalls() = implementation!!.instructions.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}

private fun BytecodePatchContext.installSingleHomePageLayout(hideSearch: Boolean) {
    listOf(HomeViewCreatedFingerprint, HomeRefreshFingerprint, HomePageSelectionFingerprint,
        HomePageCallbackFingerprint, HomePageBindingFingerprint).forEach { it.matchAll(1..1) }
    val home = HomeViewCreatedFingerprint.classDef
    fun resolve(reference: MethodReference) = classDefBy(reference.definingClass).methods.single {
        it.name == reference.name && it.parameterTypes == reference.parameterTypes && it.returnType == reference.returnType
    }

    val currentIndex = HomeRefreshFingerprint.originalMethod.homePageCalls().single {
        it.definingClass == HOME_PAGE_BASE && it.parameterTypes.isEmpty() && it.returnType == "I"
    }
    val getter = resolve(currentIndex)
    val getterInstructions = getter.implementation!!.instructions.toList()
    check(getter.accessFlags == AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)
    check(getterInstructions.map { it.opcode } == listOf(Opcode.IGET, Opcode.RETURN)) { "Unexpected current-page getter" }
    val currentField = (getterInstructions.first() as ReferenceInstruction).reference as FieldReference
    check(currentField.definingClass == HOME_PAGE_BASE && currentField.type == "I")

    val callback = HomePageCallbackFingerprint.originalMethod
    check(callback.implementation!!.instructions.map { it.opcode } ==
        listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID)) { "Unexpected page callback forwarding" }
    val bridge = resolve(callback.homePageCalls().single())
    check(bridge.accessFlags == AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or
        AccessFlags.FINAL.value or AccessFlags.SYNTHETIC.value)
    check(bridge.implementation!!.instructions.map { it.opcode } ==
        listOf(Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID)) { "Unexpected page callback bridge" }
    val selected = bridge.homePageCalls().single()
    check(selected.definingClass == HOME_PAGE_BASE && selected.parameterTypes == listOf("I") && selected.returnType == "V")
    val handler = resolve(selected)
    check(handler.accessFlags == AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)
    check(handler.implementation!!.instructions.any {
        it.opcode == Opcode.IPUT && (it as ReferenceInstruction).reference == currentField
    }) { "Native page handler does not update the saved index" }

    val pagerId = 0x7f0a0b23 // pager2
    val tabsLayoutId = 0x7f0a0fc8 // tabs_layout
    val searchId = 0x7f0a0e34 // search_ll
    val boundIds = HomePageBindingFingerprint.originalMethod.implementation!!.instructions.mapNotNull {
        if (it.opcode != Opcode.SGET) return@mapNotNull null
        val field = (it as ReferenceInstruction).reference as FieldReference
        val value = classDefBy(field.definingClass).fields.single { candidate ->
            candidate.name == field.name && candidate.type == field.type
        }.initialValue
        (value as? IntEncodedValue)?.value
    }
    check(boundIds.containsAll(listOf(pagerId, tabsLayoutId, searchId))) { "Unexpected native Home view bindings" }

    val helperName = "morpheReconcileSingleHomePage"
    val hiddenFlag = "morpheSingleHomeTabsHidden"
    check(home.methods.none { it.name == helperName } && home.fields.none { it.name == hiddenFlag })
    home.fields.add(MutableField(ImmutableField(home.type, hiddenFlag, "Z", AccessFlags.PRIVATE.value,
        null, emptySet(), emptySet())))
    val helper = MutableMethod(ImmutableMethod(home.type, helperName,
        listOf(ImmutableMethodParameter(home.type, emptySet(), null)), "V",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        MutableMethodImplementation(7)))
    val restoreSearch = if (hideSearch) """
        const v1, $searchId
        invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v0
        invoke-static {v0}, ${home.type}->hideHomeSearchBar(Landroid/view/View;)V
    """.trimIndent() else ""
    helper.addInstructions(0, """
        invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;
        move-result-object v0
        if-eqz v0, :done
        const v1, $pagerId
        invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v1
        instance-of v2, v1, Landroidx/viewpager2/widget/ViewPager2;
        if-eqz v2, :done
        check-cast v1, Landroidx/viewpager2/widget/ViewPager2;
        invoke-virtual {v1}, Landroidx/viewpager2/widget/ViewPager2;->getAdapter()Landroidx/recyclerview/widget/RecyclerView${'$'}Adapter;
        move-result-object v1
        if-eqz v1, :done
        invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView${'$'}Adapter;->getItemCount()I
        move-result v1
        const v2, $tabsLayoutId
        invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v2
        instance-of v3, v2, Landroid/widget/FrameLayout;
        if-eqz v3, :done
        check-cast v2, Landroid/widget/FrameLayout;
        const/4 v3, 0x1
        if-ne v1, v3, :restore
        const/4 v4, 0x0
        invoke-virtual {p0, v4}, ${HomePageSelectionFingerprint.originalMethod}
        invoke-virtual {p0}, $currentIndex
        move-result v1
        if-eqz v1, :synchronized
        invoke-virtual {p0, v4}, $selected
        :synchronized
        invoke-virtual {v2}, Landroid/view/View;->getVisibility()I
        move-result v1
        const/16 v5, 0x8
        if-eq v1, v5, :search
        invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V
        iput-boolean v3, p0, ${home.type}->$hiddenFlag:Z
        :search
        const v1, $searchId
        invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;
        move-result-object v0
        instance-of v1, v0, Lcom/bilibili/magicasakura/widgets/TintLinearLayout;
        if-eqz v1, :done
        check-cast v0, Lcom/bilibili/magicasakura/widgets/TintLinearLayout;
        invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;
        move-result-object v1
        instance-of v2, v1, Lcom/bilibili/magicasakura/widgets/TintFrameLayout;
        if-eqz v2, :done
        check-cast v1, Lcom/bilibili/magicasakura/widgets/TintFrameLayout;
        invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V
        invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V
        return-void
        :restore
        iget-boolean v1, p0, ${home.type}->$hiddenFlag:Z
        if-eqz v1, :restore_search
        const/4 v1, 0x0
        invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V
        iput-boolean v1, p0, ${home.type}->$hiddenFlag:Z
        :restore_search
        $restoreSearch
        :done
        return-void
    """.trimIndent())
    home.methods.add(helper)

    listOf(HomeViewCreatedFingerprint.method, HomeRefreshFingerprint.method).forEach { method ->
        val returns = method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(returns.isNotEmpty())
        returns.asReversed().forEach { (index, _) ->
            // Replace the return so existing branches to it also run reconciliation.
            method.replaceInstruction(index, "invoke-static/range {p0 .. p0}, ${home.type}->$helperName(${home.type})V")
            method.addInstructions(index + 1, "return-void")
        }
    }
}

