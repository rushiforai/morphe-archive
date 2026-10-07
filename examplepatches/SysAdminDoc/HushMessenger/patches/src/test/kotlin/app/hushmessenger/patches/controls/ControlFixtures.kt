package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

internal fun fixtureMethod(
    id: String,
    body: String,
    registers: Int = 8,
    flags: Int = AccessFlags.PUBLIC.value,
): MutableMethod {
    val owner = id.substringBefore("->")
    val name = id.substringAfter("->").substringBefore('(')
    val parameters = Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(id.substringAfter('(').substringBefore(')'))
        .map { ImmutableMethodParameter(it.value, null, null) }.toList()
    return MutableMethod(ImmutableMethod(owner, name, parameters, id.substringAfter(')'), flags,
        null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)))
        .apply { addInstructionsWithLabels(0, body) }
}

internal fun fixtureClass(
    type: String,
    methods: List<Method> = emptyList(),
    originalName: String? = null,
    interfaces: List<String> = emptyList(),
    superclass: String = "Ljava/lang/Object;",
    extraFields: List<Field> = emptyList(),
    flags: Int = AccessFlags.PUBLIC.value,
): MutableClass {
    val fields = originalName?.let {
        listOf(ImmutableField(type, "__redex_internal_original_name", "Ljava/lang/String;",
            AccessFlags.STATIC.value, ImmutableStringEncodedValue(it), null, null))
    }.orEmpty() + extraFields
    return MutableClass(ImmutableClassDef(type, flags, superclass,
        interfaces, null, emptySet(), fields, methods))
}

/** The stock app component factory's two entry points, cut down to the shape the screen-host hooks check. */
internal fun factoryActivity(registers: Int = 12, id: String = INSTANTIATE_ACTIVITY) = fixtureMethod(id, """
    const/4 v0, 0x0
    invoke-super {p0, p1, p2, p3}, Landroid/app/AppComponentFactory;->instantiateActivity(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;
    move-result-object v0
    return-object v0
""".trimIndent(), registers)

internal fun factoryApplication(body: String = """
    invoke-super {p0, p1, p2}, Landroid/app/AppComponentFactory;->instantiateApplication(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroid/app/Application;
    move-result-object v1
    sput-object v1, $FACTORY_TYPE->messengerApp:Landroid/app/Application;
    return-object v1
""".trimIndent()) = fixtureMethod(INSTANTIATE_APPLICATION, body, 5)

internal fun bundledControlsMethod(body: String = "const-string v0, \"\"\nreturn-object v0") =
    fixtureMethod(BUNDLED_CONTROLS, body, 1, AccessFlags.STATIC.value)

internal fun nativeBubbleRoutesMethod(body: String = "const/4 v0, 0x0\nreturn v0") =
    fixtureMethod(NATIVE_BUBBLE_ROUTES, body, 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

/** Native A00/A01 bodies from build 346013440, with the profile's mapped references. */
internal fun bubbleEligibilityMethod(body: String? = null) = fixtureMethod(activeProfile.hooks.getValue("bubbles").single(), body ?: """
    sget v1, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v0, 0x1e
    if-lt v1, v0, :not_eligible
    iget-object v0, p0, ${activeProfile.hooks.getValue("bubbles").single().substringBefore("->")}->A02:LX/17Z;
    iget-object v0, v0, LX/17Z;->A00:LX/0LV;
    invoke-interface {v0}, LX/0LV;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->isLowRamDevice()Z
    move-result v0
    if-nez v0, :not_eligible
    const/4 v0, 0x1
    return v0
    :not_eligible
    const/4 v0, 0x0
    return v0
""".trimIndent(), 3)

internal fun nativeBubbleModeMethod(body: String? = null) = fixtureMethod(activeProfile.hooks.getValue("bubble_mode").single(), body ?: """
    const/4 v2, 0x0
    invoke-static {p1, v2}, LX/33W;->A0j(Ljava/lang/Object;I)V
    invoke-virtual {p0}, ${activeProfile.hooks.getValue("bubbles").single()}
    move-result v0
    if-eqz v0, :not_native
    iget-object v0, p0, ${activeProfile.hooks.getValue("bubbles").single().substringBefore("->")}->A01:LX/17Z;
    iget-object v0, v0, LX/17Z;->A00:LX/0LV;
    invoke-interface {v0}, LX/0LV;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, ${activeProfile.bubbleCapabilityGetter.substringBefore("->")}
    const/16 v0, 0x1c
    invoke-virtual {v1, p1, v0}, ${activeProfile.bubbleCapabilityGetter}
    move-result v0
    if-eqz v0, :not_native
    iget-object v0, p0, ${activeProfile.hooks.getValue("bubbles").single().substringBefore("->")}->A03:LX/17Z;
    iget-object v0, v0, LX/17Z;->A00:LX/0LV;
    invoke-interface {v0}, LX/0LV;->get()Ljava/lang/Object;
    invoke-static {}, LX/1Aa;->A0A()LX/5V6;
    move-result-object v2
    const-wide v0, ${BUBBLE_ROLLOUT}L
    check-cast v2, Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;
    invoke-interface {v2, v0, v1}, ${activeProfile.bubbleRolloutGetter}
    move-result v0
    return v0
    :not_native
    return v2
""".trimIndent(), 5)

internal fun inboxRefreshRouteMethod(body: String = "const-string v0, \"\"\nreturn-object v0", flags: Int = AccessFlags.STATIC.value) =
    fixtureMethod(INBOX_REFRESH_ROUTE, body, 1, flags)

/** The factory and the extension classes every settings run touches, as a supported APK plus the extension has them. */
internal fun screenHostClasses() = listOf(
    fixtureClass(FACTORY_TYPE, listOf(factoryActivity(), factoryApplication())),
    fixtureClass(HOST_SCREENS, listOf(bundledControlsMethod(), nativeBubbleRoutesMethod(), inboxRefreshRouteMethod())),
    fixtureClass(INBOX_REFRESH, listOf(fixtureMethod(INBOX_ITEMS_CALL, "return-void", 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
)

internal const val INBOX_ITEMS_HOOK = "$INBOX_SUPPLIER->A0B()$IMMUTABLE_LIST"
internal const val INBOX_OBSERVER = "LX/34A;"
/** What every supported build resolves: 346013440's subscribe call A04 and listed count A00. */
internal val INBOX_ROUTE = InboxRefreshRoute("$INBOX_SUPPLIER->A04($INBOX_SUPPLIER)V", "$INBOX_SUPPLIER->A00:I")

/** The chat list supplier's items read as 346013440 starts it: the trace, then a check of the listed count. */
internal fun inboxItemsMethod(
    trace: String = INBOX_ITEMS_TRACE,
    listed: String = "A00",
    jumpToStart: Boolean = false,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    id: String = INBOX_ITEMS_HOOK,
): MutableMethod {
    val owner = if (AccessFlags.STATIC.isSet(flags)) "v2" else "p0"
    return fixtureMethod(id, """
        :start
        const-string v1, "$trace"
        invoke-static {v1}, LX/0Bv;->A01(Ljava/lang/String;)V
        iget v0, $owner, $INBOX_SUPPLIER->$listed:I
        ${if (jumpToStart) "if-eqz v0, :start" else "if-nez v0, :listed"}
        :listed
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), registers = 3, flags = flags)
}

/** The supplier's static subscribe call, cut down to its warning and the observer it creates for the loader. */
internal fun inboxSubscribeMethod(
    warning: String = INBOX_SUBSCRIBE_WARNING,
    init: String = "<init>(Ljava/lang/Object;I)V",
    between: String = "",
    name: String = "A04",
) = fixtureMethod("$INBOX_SUPPLIER->$name($INBOX_SUPPLIER)V", """
    move-object v2, p0
    const-string v0, "$warning"
    const/4 v4, 0x0
    new-instance v1, $INBOX_OBSERVER
    $between
    invoke-direct {v1, v2, v4}, $INBOX_OBSERVER->$init
    invoke-static {v1, v2}, LX/0D8;->A00(Ljava/lang/Object;Ljava/lang/Object;)V
    return-void
""".trimIndent(), registers = 6, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value)

internal fun inboxSupplierClass(
    items: Method = inboxItemsMethod(),
    subscribe: List<Method> = listOf(inboxSubscribeMethod()),
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
) = fixtureClass(INBOX_SUPPLIER, listOf(items) + subscribe, flags = flags,
    extraFields = listOf("A00", "A01", "A02", "A03").map { ImmutableField(INBOX_SUPPLIER, it, "I", AccessFlags.PUBLIC.value, null, null, null) })

/** The observer's list callback as 346013440 has it: the size, then 5 or 1 into the listed count. */
internal fun inboxObserverClass(
    high: Int = 5,
    low: Int = 1,
    field: String = "A00",
    branch: String = "if-lt",
    secondWrite: Boolean = false,
    callbacks: Int = 1,
) = fixtureClass(INBOX_OBSERVER, listOf(
    fixtureMethod("$INBOX_OBSERVER-><init>(Ljava/lang/Object;I)V", "invoke-direct {p0}, Ljava/lang/Object;-><init>()V\nreturn-void", 3),
) + (0 until callbacks).map { index ->
    val again = if (!secondWrite) "" else """
        const/4 v2, 0x5
        if-lt v4, v3, :again
        const/4 v2, 0x1
        :again
        iput v2, v0, $INBOX_SUPPLIER->$field:I
    """.trimIndent()
    fixtureMethod("$INBOX_OBSERVER->Cj${'P' + index}(Ljava/util/List;)V", listOf(
        "iget-object v0, p0, $INBOX_OBSERVER->A00:Ljava/lang/Object;",
        "check-cast v0, $INBOX_SUPPLIER",
        "invoke-interface {p1}, Ljava/util/List;->size()I",
        "move-result v4",
        "iget v3, v0, $INBOX_SUPPLIER->A02:I",
        "iput v4, v0, $INBOX_SUPPLIER->A03:I",
        "const/4 v2, $high",
        "$branch v4, v3, :listed",
        "const/4 v2, $low",
        ":listed",
        "iput v2, v0, $INBOX_SUPPLIER->$field:I",
        again,
        "return-void",
    ).joinToString("\n"), registers = 7)
}, flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)

internal fun inboxRefreshClasses() = listOf(inboxSupplierClass(), inboxObserverClass())

internal const val PEOPLE_JEWEL_HOOK = "LX/HAR;->A01(LX/HAR;)Z"
internal const val PEOPLE_TAB_HOOK = "LX/JZ6;->A01(LX/JZ6;)V"

/** The People tab handler's publish step as 346013440 has it: list and filter map to the listener it loads first. */
internal fun peopleTabMethod(
    listener: String = "LX/JZ6;->A09:LX/KIH;",
    call: String = "LX/KIH;->CbW(${IMMUTABLE_LIST}Ljava/util/Map;)V",
    listenerRegister: String = "v2",
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
) = fixtureMethod(PEOPLE_TAB_HOOK, """
    iget-object v2, v3, $listener
    iget-object v1, v3, LX/JZ6;->A00:$IMMUTABLE_LIST
    iget-object v0, v3, LX/JZ6;->A0A:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static {v0}, LX/01Q;->A0A(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v0
    invoke-interface {$listenerRegister, v1, v0}, $call
    return-void
""".trimIndent(), registers = 4, flags = flags)

internal const val PEOPLE_SEARCH_HOOK = "LX/CX5;->DLP(LX/EA8;Ljava/lang/Object;)LX/EBu;"

/** The search screen's suggestions source, cut down to its log strings and the tail that wraps its section. */
internal fun peopleSearchMethod(
    status: String = "LX/0R2;->A0N:Ljava/lang/Integer;",
    wrap: String = "LX/CW4;->A0m(${IMMUTABLE_LIST}Ljava/lang/Integer;)LX/EBu;",
    statusRegister: String = "v0",
    jumpToStatus: Boolean = false,
    flags: Int = AccessFlags.PUBLIC.value,
) = fixtureMethod(PEOPLE_SEARCH_HOOK, """
    const-string v2, "$PEOPLE_SEARCH_SOURCE"
    const-string v2, "Failed to load people you may know"
    const/4 v1, 0x0
    ${if (jumpToStatus) "if-eqz v4, :status" else "nop"}
    invoke-static {v1}, $IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST
    move-result-object v1
    ${if (jumpToStatus) ":status" else "nop"}
    sget-object $statusRegister, $status
    invoke-static {v1, v0}, $wrap
    move-result-object v0
    return-object v0
""".trimIndent(), registers = 6, flags = flags)

/** The handler's fetch, the one place its obfuscated class names the unobfuscated coroutine. */
internal fun peopleTabFetchMethod() = fixtureMethod("LX/JZ6;->A03()V", "new-instance v0, $PEOPLE_TAB_FETCH\nreturn-void", registers = 2)

internal const val STORY_VIEWER = "Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;"
internal const val PEOPLE_STORY_HOOK = "$STORY_VIEWER->A0Y($STORY_VIEWER)V"

/** The story viewer's suggestions request, cut down to its already-requested check, the flag set and the query. */
internal fun peopleStoryMethod(
    checkedFlag: String = "A0x",
    skip: String = "if-nez",
    jumpPastCheck: Boolean = false,
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
) = fixtureMethod(PEOPLE_STORY_HOOK, """
    iget-boolean v0, v3, $STORY_VIEWER->A1S:Z
    if-nez v0, ${if (jumpPastCheck) ":request" else ":done"}
    iget-boolean v0, v3, $STORY_VIEWER->$checkedFlag:Z
    $skip v0, :done
    :request
    iget-object v1, v3, $STORY_VIEWER->A25:LX/17Z;
    const/4 v2, 0x1
    iput-boolean v2, v3, $STORY_VIEWER->A0x:Z
    const-string v0, "$STORY_SUGGESTIONS_QUERY"
    :done
    return-void
""".trimIndent(), registers = 4, flags = flags)

/**
 * Instructions 0-20 match the supported APKs; one instruction stands in for the list reset. With [inlinedReset],
 * 346013423's single call replaces the two calls at 14-15, so the server flag moves from 17 to 16.
 */
internal fun peopleJewelMethod(
    key: String = "LX/JTx;->A01:LX/1BL;",
    resultRegister: String = "v0",
    serverFlag: String = "72344235860374863L",
    serverTarget: String = ":shown",
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    inlinedReset: Boolean = false,
    extraFlag: Boolean = false,
    extraFlagValue: String = serverFlag,
) = fixtureMethod(PEOPLE_JEWEL_HOOK, """
    iget-object v0, p0, LX/HAR;->A07:LX/17Z;
    invoke-static {v0}, LX/17Z;->A0F(LX/17Z;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, LX/JTx;
    iget-object v2, p0, LX/HAR;->A01:Lcom/facebook/auth/usersession/FbUserSession;
    iget-object v0, v0, LX/JTx;->A00:LX/17Z;
    invoke-static {v0}, LX/17Z;->A0C(LX/17Z;)Lcom/facebook/prefs/shared/FbSharedPreferences;
    move-result-object v1
    sget-object v0, $key
    const/4 v4, 0x0
    invoke-interface {v1, v0, v4}, $PREFERENCE_GETTER
    move-result $resultRegister
    if-eqz v0, :shown
    iget-object v0, p0, LX/HAR;->A06:LX/17Z;
    ${if (inlinedReset) "invoke-static {v0, v2}, LX/H7e;->A0T(LX/17Z;Ljava/lang/Object;)LX/4qb;"
      else "invoke-static {v0}, LX/17Z;->A0I(LX/17Z;)V\n    invoke-static {v2, v4}, LX/1Aa;->A07(Ljava/lang/Object;I)LX/4nI;"}
    move-result-object v2
    const-wide v0, $serverFlag
    invoke-static {v2, v0, v1}, LX/16z;->A1Z(Ljava/lang/Object;J)Z
    move-result v0
    if-nez v0, $serverTarget
    iget-object v3, p0, LX/HAR;->A0F:LX/WZw;
    ${if (extraFlag) "const-wide v0, $extraFlagValue" else ""}
    :hidden
    const/4 v0, 0x1
    return v0
    :shown
    return v4
""".trimIndent(), registers = 6, flags = flags)

internal fun peopleJewelKeyHolder() = fixtureClass("LX/JTx;", listOf(fixtureMethod("LX/JTx;-><clinit>()V", """
    const-string v0, "pymk_jewel_section_hidden"
    sput-object v0, LX/JTx;->A01:LX/1BL;
    return-void
""".trimIndent(), flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)))

/** Build 346013440's story preference keys: the card's date key sits between two others. */
internal fun storyCardKeyHolder() = fixtureClass("LX/JVI;", listOf(fixtureMethod("LX/JVI;-><clinit>()V", """
    const-string v0, "story_timestamp"
    sput-object v0, LX/JVI;->A0T:LX/1BL;
    const-string v0, "$STORY_CARD_DATE_KEY"
    sput-object v0, LX/JVI;->A0E:LX/1BL;
    const-string v0, "creation_card_impression_count"
    sput-object v0, LX/JVI;->A08:LX/1BL;
    return-void
""".trimIndent(), flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)))

internal fun debugDumperFixture(
    textGetter: String = "BWn",
    idGetter: String = "B9c",
    unsentGetter: String = "Btc",
    itemType: String = "Lfixture/KKn;",
): MutableClass {
    val method = fixtureMethod("Lfixture/Dumper;->A02(Lfixture/MessageRow;)Ljava/lang/String;", """
        invoke-interface {p1}, $itemType->$unsentGetter()Z
        move-result v0
        const-string v0, "is_unsent="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A09(Ljava/lang/String;Ljava/util/AbstractCollection;Z)V
        invoke-interface {p1}, $itemType->$idGetter()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :skip_id
        const-string v0, "message_id="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A1V(Ljava/lang/String;Ljava/lang/String;Ljava/util/AbstractCollection;)V
        :skip_id
        invoke-interface {p1}, $itemType->$textGetter()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :skip_text
        const-string v0, "text="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A1V(Ljava/lang/String;Ljava/lang/String;Ljava/util/AbstractCollection;)V
        :skip_text
        return-object v1
    """.trimIndent(), registers = 4)
    return fixtureClass("Lfixture/Dumper;", listOf(method))
}

internal fun messageWrapperFixture(
    type: String = "Lfixture/MessageWrapper;",
    interfaceType: String = "Lfixture/MessageRow;",
    textGetter: String = "BWo",
    idGetter: String = "B9d",
    unsentGetter: String = "Btd",
): MutableClass {
    val bwoMethod = fixtureMethod("$type->$textGetter(I)Ljava/lang/String;", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->BWn()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent(), registers = 3)
    val b9dMethod = fixtureMethod("$type->$idGetter(I)Ljava/lang/String;", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->B9c()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent(), registers = 3)
    val btdMethod = fixtureMethod("$type->$unsentGetter(I)Z", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->Btc()Z
        move-result v0
        return v0
    """.trimIndent(), registers = 3)
    val getCountMethod = fixtureMethod("$type->getCount()I", """
        iget-object v0, p0, $type->A00:Ljava/util/List;
        invoke-interface {v0}, Ljava/util/List;->size()I
        move-result v0
        return v0
    """.trimIndent(), registers = 2)
    val fields = listOf(ImmutableField(type, "A00", "Ljava/util/List;", 0, null, null, null))
    return MutableClass(ImmutableClassDef(type,
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
        "Ljava/lang/Object;", listOf(interfaceType), null, emptySet(), fields,
        listOf(bwoMethod, b9dMethod, btdMethod, getCountMethod)))
}

internal fun pluginBody(anchor: String, branch: String = "if-eq") = """
    iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    const/4 v6, 0x1
    const/4 v5, 0x0
    const-string v2, "$anchor"
    iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
    $branch v1, v0, :disabled
    return v6
    :disabled
    return v5
""".trimIndent()

internal const val STORY_MARK_READ_HOOK = "LX/HNV;->C1V(${MONTAGE_CARD}Z)V"
internal const val STORY_READ_SET = "LX/2W3;"
internal const val STORY_READ_SET_ADD = "$STORY_READ_SET->A01(${MONTAGE_CARD}LX/5Jf;LX/56l;)V"
internal const val STORY_READ_SET_INIT = "$STORY_READ_SET-><init>($FB_USER_SESSION)V"

internal const val STORY_MARK_READ_BODY = """const/4 v0, 0x0
iget-object v1, p0, LX/HNV;->A00:Ljava/lang/Object;
if-eqz v1, :local_seen
const-string v2, "MontageMsysMarkReadHandler"
if-eqz p2, :first_view
const-string v3, "StoryOptimisticMarkReadRewatch"
goto :send
:first_view
const-string v3, "StoryOptimisticMarkRead"
:send
invoke-static {v1, v2, v3}, LX/Erv;->A00(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
:local_seen
invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;
move-result-object v1
invoke-static {v1}, LX/5Jf;->A0C(Lcom/google/common/collect/ImmutableList;)V
iget-object v2, p0, LX/HNV;->A05:LX/2W3;
invoke-virtual {v2, p1, v1, v0}, $STORY_READ_SET_ADD
return-void"""

/** The read set's constructor: the session, then an empty set, then nothing that could skip the end. */
internal const val STORY_READ_SET_INIT_BODY = """const/4 v1, 0x0
invoke-direct {p0}, Ljava/lang/Object;-><init>()V
iput-object p1, p0, LX/2W3;->A02:$FB_USER_SESSION
new-instance v0, Ljava/util/HashSet;
invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
iput-object v0, p0, LX/2W3;->A01:Ljava/util/Set;
return-void"""

/** The local update adds each card's ID to the set, then tells the in-memory story lists. */
internal const val STORY_READ_SET_ADD_BODY = """invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;
move-result-object v4
iget-object v1, p0, LX/2W3;->A01:Ljava/util/Set;
iget-object v0, p1, $MONTAGE_CARD->A0K:Ljava/lang/String;
invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
invoke-virtual {p2, v4, p3}, LX/5Jf;->A0C(Lcom/google/common/collect/ImmutableList;LX/56l;)V
return-void"""

internal fun storyReadSetClass(
    init: String = STORY_READ_SET_INIT_BODY,
    add: String = STORY_READ_SET_ADD_BODY,
    fieldTypes: List<String> = listOf("Ljava/util/Set;", FB_USER_SESSION),
    extraMethods: List<Method> = emptyList(),
): MutableClass {
    val fields = fieldTypes.mapIndexed { i, type -> ImmutableField(STORY_READ_SET, "A0${i + 1}", type, AccessFlags.FINAL.value, null, null, null) } +
        ImmutableField(STORY_READ_SET, "A03", "Ljava/lang/String;", AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null, null)
    val methods = listOf(fixtureMethod(STORY_READ_SET_INIT, init, registers = 4), fixtureMethod(STORY_READ_SET_ADD, add, registers = 9)) + extraMethods
    return MutableClass(ImmutableClassDef(STORY_READ_SET, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
        emptyList(), null, emptySet(), fields, methods))
}
