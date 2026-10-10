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
 * Synthetic wiring reads independently recorded stock IDs, not the compiled profile being checked.
 * [sessionFirst] builds the 581 closure: the session capture moves to slot 2 and a gated block precedes the second read.
 * [viewport] builds the 582 closure on top of that: an $onThreadInViewport capture before the trailing flag, the second
 * read into v1, and a 13-argument sink that takes the callback after the list.
 */
internal fun communityInboxFixture(sessionFirst: Boolean = false, viewport: Boolean = false): List<MutableClass> {
    val code = controlProfiles.entries.first { it.value === activeProfile }.key
    val record = Files.readAllLines(Path.of("../scripts/profiles/$code.txt"))
    val ids = record.single { it.startsWith("nativeCommunityInbox ") }.substringAfter(' ').split('|')
    val (updateId, recordedCtorId, scopeGetterId, switchId, summaryField) = ids
    val ctorId = if (viewport) recordedCtorId.replace(";Z)V", ";Lkotlin/jvm/functions/Function1;Z)V") else recordedCtorId
    val joinedId = ids[5]; val nullableId = ids[6]; val anyId = ids[7]; val channelId = ids[8]; val requests = ids[9]
    val prefix = ids[10]; val path = ids.subList(11, 16); val folderGetter = ids[16]; val inbox = ids[17]
    val callbackType = path.first().substringBefore("->")
    val COORDINATOR = path[2].substringAfter(':'); val LIFE = path[3].substringAfter(':'); val CONFIG = path[4].substringAfter(':')
    val FOLDER = inbox.substringBefore("->")
    val main = updateId.substringBefore("->")
    val closure = ctorId.substringBefore("->")
    val loader = scopeGetterId.substringBefore("->")
    val scope = requests.substringBefore("->")
    val model = Regex("L[^;]+;").findAll(updateId.substringAfter('(')).map { it.value }.toList()[1]
    val row = summaryField.substringBefore("->")
    val mainPrefix = "$main->prefix:${prefix.substringAfter(':')}"
    val getter = fixtureMethod(scopeGetterId, sparse(13, mapOf(
        0 to "iget-object v0, p0, ${path[2]}",
        1 to "iget-object v0, v0, ${path[3]}",
        2 to "if-nez v0, :config", 7 to "throw v0",
        8 to ":config\niget-object v0, v0, ${path[4]}",
        9 to "invoke-virtual {v0}, $CONFIG->scope()$scope", 10 to "move-result-object v0", 12 to "return-object v0")), 2)
    val loaderCtorId = "$loader-><init>(Landroid/content/Context;Lcom/facebook/auth/usersession/FbUserSession;LX/MainBase;LX/Config;LX/Publisher;Ljava/util/List;)V"
    val loaderCtor = fixtureMethod(loaderCtorId, "invoke-direct {v0}, $COORDINATOR-><init>()V\nreturn-void", 7)
    val mainCtor = fixtureMethod("$main-><init>()V", "new-instance v0, $callbackType\ninvoke-direct {v0, p0}, $callbackType-><init>($main)V\niput-object v0, p0, $mainPrefix\ninvoke-direct/range {v0 .. v6}, $loaderCtorId\nreturn-void", 7)
    val update = fixtureMethod(updateId, sparse(197, mapOf(
        12 to "const-string v0, \"InboxFragment_updateSectionTree\"",
        57 to "iget-object v3, v7, $model->rows:$IMMUTABLE_LIST", 58 to "move-object/from16 v26, v3",
        74 to "instance-of v3, v5, $row",
        108 to "iget-object v4, v13, ${path[1]}", 110 to "invoke-virtual {v4}, $scopeGetterId", 111 to "move-result-object v23",
        134 to "iget-object v3, v13, $mainPrefix", 152 to "move-object/from16 v21, v3",
        143 to "new-instance v0, $closure", 155 to "invoke-direct/range {v14 .. v${if (viewport) 29 else 28}}, $ctorId", 196 to "return-void")),
        if (viewport) 30 else 29,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    val switch = fixtureMethod(switchId, sparse(45, mapOf(
        2 to "sget-object v0, $requests", 3 to "if-ne p1, v0, :inbox",
        4 to "sget-object v4, $FOLDER->pending:$FOLDER", 7 to "sget-object v4, $FOLDER->pending:$FOLDER",
        9 to "const-string v1, \"InboxLoaderCoordinator.setFolderAndFilter\"",
        12 to "goto :config", 13 to ":inbox\nsget-object v4, $inbox", 14 to "goto :config",
        15 to ":config\nnop", 25 to "iput-object v5, v1, $BUILDER->scope:$scope",
        28 to "iput-object v4, v1, $BUILDER->folder:$FOLDER", 29 to "const-string v0, \"folderName\"", 37 to "return-void")), 6,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
    val shift = if (sessionFirst || viewport) 1 else 0
    val ctorSize = if (viewport) 19 else 17
    val ctor = fixtureMethod(ctorId, sparse(ctorSize, mapOf(0 to "iput-object v13, v1, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        4 + shift to "iput-object v10, v1, $closure->\$threadTypeFilter:$scope",
        (if (viewport) 8 else 7) + shift to "iput-object v8, v1, $prefix", ctorSize - 1 to "return-void") +
        (if (shift == 1) mapOf(2 to "iput-object v2, v1, $closure->\$fbUserSession:$FB_USER_SESSION") else emptyMap())), if (viewport) 17 else 16)
    val second = if (sessionFirst) 66 else if (activeProfile in listOf(PROFILE_346013370, PROFILE_346013374)) 55 else 56
    val invokeId = record.single { it.startsWith("hook community_inbox ") }.substringAfter("hook community_inbox ")
    val invoke = if (viewport) fixtureMethod(invokeId, sparse(85, mapOf(
        5 to "iget-object v0, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        6 to "invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z",
        8 to "if-nez v0, :empty", 27 to "iget-object v1, v4, $closure->\$threadTypeFilter:$scope",
        32 to "const-string v0, \"searchBarSection\"",
        64 to "iget-object v1, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        70 to "iget-object v0, v4, $closure->\$onThreadInViewport:Lkotlin/jvm/functions/Function1;",
        75 to "move-object/from16 v17, v1", 76 to "move-object/from16 v18, v0",
        77 to "invoke-static/range {v6 .. v18}, LX/Section;->build(LX/Session;LX/Scope;LX/Observer;LX/Binder;LX/Header;LX/Footer;LX/Loading;LX/Theme;LX/Publisher;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lkotlin/jvm/functions/Function1;)LX/Section;",
        78 to "move-result-object v0", 79 to "invoke-virtual {v2, v0}, LX/Builder;->add(LX/Section;)V",
        80 to "return-object v2", 83 to ":empty\nconst/4 v3, 0x0", 84 to "goto :end",
        48 to ":end\nnop")), 21)
    else fixtureMethod(invokeId, sparse(second + 19, mapOf(
        5 to "iget-object v0, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        6 to "invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z",
        8 to "if-nez v0, :empty", 27 to "iget-object v1, v4, $closure->\$threadTypeFilter:$scope",
        32 to "const-string v0, \"searchBarSection\"",
        second to "iget-object v0, v4, $closure->\$inboxUnitItems:$IMMUTABLE_LIST",
        second + 10 to "move-object/from16 v17, v0",
        second + 11 to "invoke-static/range {v6 .. v17}, LX/Section;->build(LX/Session;LX/Scope;LX/Observer;LX/Binder;LX/Header;LX/Footer;LX/Loading;LX/Theme;LX/Publisher;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)LX/Section;",
        second + 14 to "return-object v2", second + 17 to ":empty\nconst/4 v3, 0x0", second + 18 to "goto :end",
        48 to ":end\nnop")), 20)
    val joined = fixtureMethod(joinedId, """
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
    val any = fixtureMethod(anyId, """
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
    val channel = fixtureMethod(channelId, """
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
    return listOf(fixtureClass(main, listOf(mainCtor, update, switch), "InboxFragment", superclass = "LX/MainBase;", extraFields = listOf(nativeField(path[1]))),
        fixtureClass(callbackType, listOf(callbackCtor), extraFields = listOf(nativeField(path[0]))),
        fixtureClass(closure, listOf(ctor, invoke)), fixtureClass(model), fixtureClass(loader, listOf(loaderCtor, getter), extraFields = listOf(nativeField(path[2]))),
        fixtureClass(COORDINATOR, listOf(coordinatorCtor), "InboxLoaderCoordinator", extraFields = listOf(nativeField(path[3]))),
        fixtureClass(LIFE, extraFields = listOf(nativeField(path[4]))),
        fixtureClass(CONFIG, listOf(fixtureMethod("$CONFIG->scope()$scope", "const/4 v0, 0x0\nreturn-object v0"),
            configFolderGetter,
            fixtureMethod("$CONFIG-><init>($BUILDER)V", "return-void"))),
        fixtureClass(BUILDER, listOf(fixtureMethod("$BUILDER-><init>()V", "new-instance v0, Ljava/util/HashSet;\ninvoke-direct {v0}, Ljava/util/HashSet;-><init>()V\nnop\nnop\nreturn-void"))),
        fixtureClass("Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;",
            extraFields = listOf(fixtureField("Lcom/facebook/messaging/msys/threadlist/plugins/core/itemsupplier/ThreadListItemSupplierImplementation;", "config", CONFIG))),
        fixtureClass(row, extraFields = listOf(fixtureField(row, summaryField.substringAfter("->").substringBefore(':'), TS))),
        fixtureClass(joined.definingClass, listOf(joined)), fixtureClass(TK, listOf(nullable, any, channel),
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
