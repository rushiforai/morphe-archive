package app.hushmessenger.patches.controls

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path

private const val TS = "Lcom/facebook/messaging/model/threads/ThreadSummary;"
private const val TK = "Lcom/facebook/messaging/model/threadkey/ThreadKey;"
private const val CONFIG = "LX/InboxConfig;"
private const val BUILDER = "LX/InboxBuilder;"
private const val COORDINATOR = "LX/InboxCoordinator;"
private const val LIFE = "LX/InboxLifecycle;"
private const val FOLDER = "LX/InboxFolder;"
private const val KEY_KIND = "LX/KeyKind;"

private fun fixtureField(owner: String, name: String, type: String, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    ImmutableField(owner, name, type, flags, null, null, null)
private fun sparse(size: Int, entries: Map<Int, String>) = (0 until size).joinToString("\n") { entries[it] ?: "nop" }
internal fun communityStub(id: String, body: String = "const/4 v0, 0x0\nreturn v0") =
    fixtureMethod(id, body, if (id == MAIN_INBOX_SCOPE) 2 else 1, AccessFlags.STATIC.value)

/**
 * Wiring for 583's closure: the session capture in slot 2, an $onThreadInViewport capture before the trailing flag,
 * a session-gated block before the second read, that read into v1 at [secondRead], and a 13-argument sink that takes
 * the callback after the list. A supported build's profile gets the IDs its record in scripts/profiles holds, not the
 * compiled profile being checked. A profile with no record behind it (the synthetic mapping, or a test's copy of a
 * recorded profile) uses its own line. The
 * community check asks the key's own channel test, then compares the key type with the announcement channel, as 585
 * does; [anyBody] and [channelBody] replace the two, and [inlineCheck] builds 583 and 584's form that compares both
 * types inline.
 *
 * A 15-part line is 586's family B (347215273, 275 and 277), which inlined the key test into the joined predicate, so
 * it names no key methods. No 587 build does that, so a test makes one from a recorded line by dropping its three key
 * IDs and naming the coordinator's scope getter in place of the loader's. Its fixture reads the loader and the loader's coordinator in the render, calls
 * the coordinator's own scope getter, reads the switch's lifecycle field inline, and has 22 registers in the closure,
 * which reads the list into v2 at 76 and keeps the section builder live in v3. [inlineCheck] on a family B record
 * builds 583 and 584's split form with made-up key method IDs.
 */
internal fun communityInboxFixture(anyBody: String? = null, channelBody: String? = null, inlineCheck: Boolean = false,
    secondRead: Int = 63): List<MutableClass> {
    val code = controlProfiles.entries.firstOrNull { it.value === activeProfile }?.key
    val record = code?.let { Files.readAllLines(Path.of("../scripts/profiles/$it.txt")) }
    val ids = (record?.single { it.startsWith("nativeCommunityInbox ") }?.substringAfter(' ') ?: activeProfile.nativeCommunityInbox).split('|')
    val (updateId, ctorId, scopeGetterId, switchId, summaryField) = ids
    val familyB = ids.size == 15
    check(ids.size == 18 || familyB) { "nativeCommunityInbox has ${ids.size} parts" }
    val keyIds = if (familyB) listOf("$TK->A0m($TK)Z", "$TK->A1J()Z", "$TK->A1W()Z") else ids.subList(6, 9)
    val joinedId = ids[5]; val nullableId = keyIds[0]; val anyId = keyIds[1]; val channelId = keyIds[2]
    val rest = ids.drop(if (familyB) 6 else 9)
    val requests = rest[0]; val prefix = rest[1]; val path = rest.subList(2, 7); val folderGetter = rest[7]; val inbox = rest[8]
    val callbackType = path.first().substringBefore("->")
    val COORDINATOR = path[2].substringAfter(':'); val LIFE = path[3].substringAfter(':'); val CONFIG = path[4].substringAfter(':')
    val FOLDER = inbox.substringBefore("->")
    val main = updateId.substringBefore("->")
    val closure = ctorId.substringBefore("->")
    // Main's loader field holds the loader in every build. 348's scope getter is the loader's own.
    val loader = path[1].substringAfter(':')
    val scope = requests.substringBefore("->")
    val model = Regex("L[^;]+;").findAll(updateId.substringAfter('(')).map { it.value }.toList()[1]
    val row = summaryField.substringBefore("->")
    val mainPrefix = "$main->prefix:${prefix.substringAfter(':')}"
    val getter = if (familyB) fixtureMethod(scopeGetterId, """
        iget-object v0, p0, ${path[3]}
        if-nez v0, :life
        const-string v0, "itemSupplierPluginLifecycle"
        invoke-static {v0}, LX/Checks;->named(Ljava/lang/String;)V
        :missing
        invoke-static {}, LX/Checks;->missing()Ljava/lang/IllegalStateException;
        move-result-object v0
        throw v0
        :life
        iget-object v0, v0, ${path[4]}
        invoke-virtual {v0}, $CONFIG->scope()$scope
        move-result-object v1
        if-nez v1, :done
        const-string v0, "INVOKE_RETURN"
        invoke-static {v1, v0}, LX/Checks;->returned(Ljava/lang/Object;Ljava/lang/String;)V
        goto :missing
        :done
        return-object v1
    """.trimIndent(), 3) else fixtureMethod(scopeGetterId, sparse(13, mapOf(
        0 to "iget-object v0, p0, ${path[2]}",
        1 to "iget-object v0, v0, ${path[3]}",
        2 to "if-nez v0, :config", 7 to "throw v0",
        8 to ":config\niget-object v0, v0, ${path[4]}",
        9 to "invoke-virtual {v0}, $CONFIG->scope()$scope", 10 to "move-result-object v0", 12 to "return-object v0")), 2)
    val missing = "invoke-static {}, LX/Checks;->missing()Ljava/lang/IllegalArgumentException;"
    val loaderCtorId = "$loader-><init>(Landroid/content/Context;Lcom/facebook/auth/usersession/FbUserSession;LX/MainBase;LX/Config;LX/Publisher;Ljava/util/List;)V"
    val loaderCtor = fixtureMethod(loaderCtorId, "invoke-direct {v0}, $COORDINATOR-><init>()V\nreturn-void", 7)
    val mainCtor = fixtureMethod("$main-><init>()V", "new-instance v0, $callbackType\ninvoke-direct {v0, p0}, $callbackType-><init>($main)V\niput-object v0, p0, $mainPrefix\ninvoke-direct/range {v0 .. v6}, $loaderCtorId\nreturn-void", 7)
    // 584 reads the loader through a lazy field and a checked static getter on Main.
    val checkedLoaderId = "$main->A04($main)${path[1].substringAfter(':')}"
    val checkedLoader = fixtureMethod(checkedLoaderId, """
        iget-object v0, p0, ${path[1]}
        if-eqz v0, :missing
        return-object v0
        :missing
        invoke-static {}, LX/Checks;->missing()Ljava/lang/IllegalArgumentException;
        move-result-object v0
        throw v0
    """.trimIndent(), 2, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    // Family B reads the loader, tests it with a jump to a throwing tail after the return, then reads its coordinator.
    val loading = if (familyB) mapOf(
        107 to "iget-object v4, v13, ${path[1]}", 108 to "if-eqz v4, :no_loader",
        109 to "iget-object v4, v4, ${path[2]}", 110 to "invoke-virtual {v4}, $scopeGetterId", 111 to "move-result-object v23",
        197 to ":no_loader\n$missing", 198 to "move-result-object v0", 199 to "throw v0")
    else mapOf(
        106 to "iget-object v4, v13, ${path[1]}", 107 to "if-nez v4, :loaded",
        108 to "invoke-static {v13}, $checkedLoaderId", 109 to "move-result-object v4",
        110 to ":loaded\ninvoke-virtual {v4}, $scopeGetterId", 111 to "move-result-object v23")
    val update = fixtureMethod(updateId, sparse(if (familyB) 200 else 197, mapOf(
        12 to "const-string v0, \"InboxFragment_updateSectionTree\"",
        57 to "iget-object v3, v7, $model->rows:$IMMUTABLE_LIST", 58 to "move-object/from16 v26, v3",
        74 to "instance-of v3, v5, $row",
        134 to "iget-object v3, v13, $mainPrefix", 152 to "move-object/from16 v21, v3",
        143 to "new-instance v0, $closure", 155 to "invoke-direct/range {v14 .. v29}, $ctorId", 196 to "return-void") + loading),
        30,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    // Family B's switch reads the lifecycle field into v1 itself and throws from a tail of three when it's null.
    val switch = fixtureMethod(switchId, sparse(if (familyB) 45 else 42, mapOf(
        0 to (if (familyB) "iget-object v1, p0, ${path[1]}" else "invoke-static {p0}, $checkedLoaderId"),
        1 to (if (familyB) "if-eqz v1, :no_loader" else "move-result-object v1"),
        2 to "sget-object v0, $requests", 3 to "if-ne p1, v0, :inbox",
        4 to "sget-object v4, $FOLDER->pending:$FOLDER", 7 to "sget-object v4, $FOLDER->pending:$FOLDER",
        9 to "const-string v1, \"InboxLoaderCoordinator.setFolderAndFilter\"",
        12 to "goto :config", 13 to ":inbox\nsget-object v4, $inbox", 14 to "goto :config",
        15 to ":config\nnop", 25 to "iput-object v5, v1, $BUILDER->scope:$scope",
        28 to "iput-object v4, v1, $BUILDER->folder:$FOLDER", 29 to "const-string v0, \"folderName\"", 37 to "return-void") +
        (if (familyB) mapOf(42 to ":no_loader\n$missing", 43 to "move-result-object v0", 44 to "throw v0") else emptyMap())), 6,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    val ctor = fixtureMethod(ctorId, sparse(19, mapOf(0 to "iput-object v13, v1, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        2 to "iput-object v2, v1, $closure->\$fbUserSession:$FB_USER_SESSION",
        5 to "iput-object v10, v1, $closure->\$threadTypeFilter:$scope",
        9 to "iput-object v8, v1, $prefix", 18 to "return-void")), 17)
    val invokeId = record?.single { it.startsWith("hook community_inbox ") }?.substringAfter("hook community_inbox ")
        ?: activeProfile.hooks.getValue(COMMUNITY_INBOX).single()
    // 587's layout: 84 instructions, the second read at 63, the viewport callback at 69, both aliases at 74 and 75, the sink at 76.
    // 586 read the search icon flag through a two-instruction getter call, so its read sat three earlier at 60; 587 inlines a
    // flag helper into the session-gated block again. A [secondRead] off 63 moves the whole tail with it.
    val shift = secondRead - 63
    // Family B's layout: 98 instructions, the second read into v2 at 76, the viewport callback into v1 at 83, the data key
    // into v0 at 84, the list, callback and key aliases at 87 to 89, the sink at 90, and the section builder live in v3.
    val invoke = if (familyB) fixtureMethod(invokeId, sparse(98 + shift, mapOf(
        5 to "iget-object v0, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        6 to "invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z",
        8 to "if-nez v0, :empty", 27 to "iget-object v1, v4, $closure->\$threadTypeFilter:$scope",
        32 to "const-string v0, \"searchBarSection\"",
        76 + shift to "iget-object v2, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        83 + shift to "iget-object v1, v4, $closure->\$onThreadInViewport:Lkotlin/jvm/functions/Function1;",
        84 + shift to "iget-object v0, v4, $closure->\$dataInstanceKey:Ljava/lang/String;",
        87 + shift to "move-object/from16 v18, v2", 88 + shift to "move-object/from16 v19, v1", 89 + shift to "move-object/from16 v16, v0",
        90 + shift to "invoke-static/range {v7 .. v19}, LX/Section;->build(LX/Session;LX/Scope;LX/Observer;LX/Binder;LX/Header;LX/Footer;LX/Loading;LX/Theme;LX/Publisher;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lkotlin/jvm/functions/Function1;)LX/Section;",
        91 + shift to "move-result-object v0", 92 + shift to "invoke-virtual {v3, v0}, LX/Builder;->add(LX/Section;)V",
        93 + shift to "return-object v3", 94 + shift to ":empty\nconst/4 v6, 0x1", 95 + shift to "goto :end", 97 + shift to "goto :end",
        48 to ":end\nnop")), 22)
    else fixtureMethod(invokeId, sparse(84 + shift, mapOf(
        5 to "iget-object v0, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        6 to "invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z",
        8 to "if-nez v0, :empty", 27 to "iget-object v1, v4, $closure->\$threadTypeFilter:$scope",
        32 to "const-string v0, \"searchBarSection\"",
        secondRead to "iget-object v1, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        69 + shift to "iget-object v0, v4, $closure->\$onThreadInViewport:Lkotlin/jvm/functions/Function1;",
        74 + shift to "move-object/from16 v17, v1", 75 + shift to "move-object/from16 v18, v0",
        76 + shift to "invoke-static/range {v6 .. v18}, LX/Section;->build(LX/Session;LX/Scope;LX/Observer;LX/Binder;LX/Header;LX/Footer;LX/Loading;LX/Theme;LX/Publisher;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lkotlin/jvm/functions/Function1;)LX/Section;",
        77 + shift to "move-result-object v0", 78 + shift to "invoke-virtual {v2, v0}, LX/Builder;->add(LX/Section;)V",
        79 + shift to "return-object v2", 82 + shift to ":empty\nconst/4 v3, 0x0", 83 + shift to "goto :end",
        48 to ":end\nnop")), 21)
    // Family B asks the key's type against both community types inline, then the subscribed flag.
    val joined = if (familyB && !inlineCheck) fixtureMethod(joinedId, """
        iget-object v0, p0, $TS->A0d:$TK
        if-eqz v0, :no
        iget-object v1, v0, $TK->kind:$KEY_KIND
        sget-object v0, $KEY_KIND->channel:$KEY_KIND
        if-eq v1, v0, :community
        sget-object v0, $KEY_KIND->announcement:$KEY_KIND
        if-ne v1, v0, :no
        :community
        const/4 v0, 0x1
        :check
        const/4 v1, 0x0
        if-eqz v0, :done
        iget-boolean v0, p0, $TS->A2N:Z
        if-eqz v0, :done
        const/4 v1, 0x1
        :done
        return v1
        :no
        const/4 v0, 0x0
        goto :check
    """.trimIndent(), 3, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) else fixtureMethod(joinedId, """
        iget-object v0, p0, $TS->A0d:$TK
        invoke-static {v0}, $nullableId
        move-result v0
        const/4 v1, 0x0
        if-eqz v0, :done
        iget-boolean v0, p0, $TS->A2N:Z
        if-eqz v0, :done
        const/4 v1, 0x1
        :done
        return v1
    """.trimIndent(), 3, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    val nullable = fixtureMethod(nullableId, """
        if-eqz p0, :no
        invoke-virtual {p0}, $anyId
        move-result p0
        if-eqz p0, :no
        const/4 p0, 0x1
        return p0
        :no
        const/4 p0, 0x0
        return p0
    """.trimIndent(), 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    val any = fixtureMethod(anyId, anyBody ?: if (inlineCheck) """
        iget-object v1, p0, $TK->kind:$KEY_KIND
        sget-object v0, $KEY_KIND->channel:$KEY_KIND
        if-eq v1, v0, :yes
        sget-object v0, $KEY_KIND->announcement:$KEY_KIND
        if-eq v1, v0, :yes
        const/4 v0, 0x0
        return v0
        :yes
        const/4 v0, 0x1
        return v0
    """.trimIndent() else """
        invoke-virtual {p0}, $channelId
        move-result v0
        if-nez v0, :yes
        iget-object v1, p0, $TK->kind:$KEY_KIND
        sget-object v0, $KEY_KIND->announcement:$KEY_KIND
        if-eq v1, v0, :yes
        const/4 v0, 0x0
        return v0
        :yes
        const/4 v0, 0x1
        return v0
    """.trimIndent(), 3)
    val channel = fixtureMethod(channelId, channelBody ?: """
        iget-object v1, p0, $TK->kind:$KEY_KIND
        sget-object v0, $KEY_KIND->channel:$KEY_KIND
        if-ne v1, v0, :no
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """.trimIndent(), 3)
    fun enum(type: String, names: Map<String, String>) = fixtureClass(type, listOf(fixtureMethod("$type-><clinit>()V",
        names.entries.joinToString("\n") { (label, name) -> "const-string v0, \"$label\"\nsput-object v1, $type->$name:$type" } + "\nreturn-void", 2, AccessFlags.STATIC.value)),
        extraFields = names.values.map { fixtureField(type, it, type, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value) })
    val coordinatorCtor = fixtureMethod("$COORDINATOR-><init>()V", """
        const-string v0, "threadTypeFilter"
        invoke-direct {v0}, $BUILDER-><init>()V
        invoke-direct {v0, v1}, $CONFIG-><init>($BUILDER)V
        return-void
    """.trimIndent())
    fun nativeField(ref: String) = fixtureField(ref.substringBefore("->"), ref.substringAfter("->").substringBefore(':'), ref.substringAfter(':'))
    val callbackCtor = fixtureMethod("$callbackType-><init>($main)V", "iput-object p1, p0, ${path[0]}\ninvoke-direct {p0}, Ljava/lang/Object;-><init>()V\nreturn-void", 2)
    val configFolderGetter = fixtureMethod(folderGetter, """
        iget-object v1, p0, $CONFIG->keys:Ljava/util/Set;
        const-string v0, "folderName"
        invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :default
        iget-object v0, p0, $CONFIG->folder:$FOLDER
        return-object v0
        :default
        sget-object v0, $CONFIG->cached:$FOLDER
        if-nez v0, :done
        monitor-enter p0
        sget-object v0, $CONFIG->cached:$FOLDER
        if-nez v0, :exit
        sget-object v0, $inbox
        sput-object v0, $CONFIG->cached:$FOLDER
        :exit
        monitor-exit p0
        goto :done
        move-exception v0
        monitor-exit p0
        throw v0
        :done
        sget-object v0, $CONFIG->cached:$FOLDER
        return-object v0
    """.trimIndent(), 3)
    // 348's scope getter sits on the loader. Family B's sits on the coordinator, and Main has no checked loader getter.
    val keyMethods = when {
        familyB && inlineCheck -> listOf(nullable, any)
        familyB -> emptyList()
        else -> listOfNotNull(nullable, any, channel.takeUnless { inlineCheck })
    }
    return listOf(fixtureClass(main, listOfNotNull(mainCtor, update, switch, checkedLoader.takeUnless { familyB }), "InboxFragment", superclass = "LX/MainBase;", extraFields = listOf(nativeField(path[1]))),
        fixtureClass(callbackType, listOf(callbackCtor), extraFields = listOf(nativeField(path[0]))),
        fixtureClass(closure, listOf(ctor, invoke)), fixtureClass(model),
        fixtureClass(loader, listOfNotNull(loaderCtor, getter.takeUnless { familyB }), extraFields = listOf(nativeField(path[2]))),
        fixtureClass(COORDINATOR, listOfNotNull(coordinatorCtor, getter.takeIf { familyB }), "InboxLoaderCoordinator", extraFields = listOf(nativeField(path[3]))),
        fixtureClass(LIFE, extraFields = listOf(nativeField(path[4]))),
        fixtureClass(CONFIG, listOf(fixtureMethod("$CONFIG->scope()$scope", "const/4 v0, 0x0\nreturn-object v0"),
            configFolderGetter,
            fixtureMethod("$CONFIG-><init>($BUILDER)V", "return-void"))),
        fixtureClass(BUILDER, listOf(fixtureMethod("$BUILDER-><init>()V", "new-instance v0, Ljava/util/HashSet;\ninvoke-direct {v0}, Ljava/util/HashSet;-><init>()V\nnop\nnop\nreturn-void"))),
        fixtureClass("Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;",
            extraFields = listOf(fixtureField("Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;", "config", CONFIG))),
        fixtureClass(row, extraFields = listOf(fixtureField(row, summaryField.substringAfter("->").substringBefore(':'), TS))),
        fixtureClass(joined.definingClass, listOf(joined)), fixtureClass(TK, keyMethods,
            extraFields = listOf(fixtureField(TK, "kind", KEY_KIND))),
        fixtureClass("LX/SubscriptionLabel;", listOf(fixtureMethod("LX/SubscriptionLabel;->label()V",
            "const-string v0, \"thread.isSubscribed\"\niget-boolean v0, v1, $TS->A2N:Z\nreturn-void"))),
        enum(scope, mapOf("MESSAGE_REQUESTS" to requests.substringAfter("->").substringBefore(':'), "ALL" to "all")),
        enum(FOLDER, mapOf("INBOX" to inbox.substringAfter("->").substringBefore(':'), "PENDING" to "pending")),
        enum(KEY_KIND, mapOf("COMMUNITY_CHANNEL" to "channel", "COMMUNITY_ANNOUNCEMENT_CHANNEL" to "announcement")),
        fixtureClass("LX/CommunitySearch;", originalName = "MessagingTabbedSearchFragment"),
        fixtureClass("LX/CommunitySearchList;", originalName = "SearchListItemFragment"),
        fixtureClass("LX/CommunityFolders;", originalName = "FoldersFragment"),
        fixtureClass(IMMUTABLE_LIST, listOf(fixtureMethod(COMMUNITY_LIST_COPY,
            "const/4 v0, 0x0\nreturn-object v0", 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))))
}
