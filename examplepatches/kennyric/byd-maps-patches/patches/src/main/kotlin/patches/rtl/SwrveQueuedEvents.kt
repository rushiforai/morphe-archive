package patches.rtl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions

private const val SWRVE_EVENTS = "Lcom/swrve/sdk/SwrveEventsManagerImp;"

/** Keep push/user/device/config work and real responses; discard only optional event types. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressQueuedEngagement() {
    val target = exact(SWRVE_EVENTS, "sendEvents(Ljava/util/LinkedHashMap;)I")
    val method = target.method
    check(method.instructions.size == 55 && method.implementation!!.registerCount == 10 && method.accessFlags == 0x2)
    check(target.classDef.methods.none { it.name == "morpheFilterEvents" })
    target.classDef.methods.add(queueHelper(SWRVE_EVENTS, "morpheFilterEvents",
        listOf(SWRVE_EVENTS, "Ljava/util/LinkedHashMap;"), "Ljava/util/LinkedHashMap;", 14, """
        new-instance v0, Ljava/util/LinkedHashMap;
        invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V
        iget-object v13, p0, $SWRVE_EVENTS->userId:Ljava/lang/String;
        invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;
        move-result-object v1
        invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :outer_next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, Ljava/util/Map${'$'}Entry;
        invoke-interface {v2}, Ljava/util/Map${'$'}Entry;->getValue()Ljava/lang/Object;
        move-result-object v3
        check-cast v3, Ljava/util/Map;
        invoke-interface {v2}, Ljava/util/Map${'$'}Entry;->getKey()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, Lcom/swrve/sdk/localstorage/LocalStorage;
        new-instance v4, Ljava/util/LinkedHashMap;
        invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V
        new-instance v5, Ljava/util/ArrayList;
        invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;
        move-result-object v6
        invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
        move-result-object v6
        :inner_next
        invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
        move-result v7
        if-eqz v7, :inner_done
        invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v7
        check-cast v7, Ljava/util/Map${'$'}Entry;
        invoke-interface {v7}, Ljava/util/Map${'$'}Entry;->getKey()Ljava/lang/Object;
        move-result-object v8
        invoke-interface {v7}, Ljava/util/Map${'$'}Entry;->getValue()Ljava/lang/Object;
        move-result-object v9
        :try_start
        move-object v10, v9
        check-cast v10, Ljava/lang/String;
        new-instance v11, Lorg/json/JSONObject;
        invoke-direct {v11, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
        const-string v10, "type"
        const-string v12, ""
        invoke-virtual {v11, v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v11
        const-string v10, "event"
        invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v10
        if-nez v10, :suppress
        const-string v10, "session_start"
        invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v10
        if-nez v10, :suppress
        :try_end
        goto :keep
        :parse_error
        move-exception v10
        :keep
        invoke-virtual {v4, v8, v9}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        goto :inner_next
        :suppress
        invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :inner_next
        :inner_done
        invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v7
        if-nez v7, :after_delete
        invoke-interface {v2, v13, v5}, Lcom/swrve/sdk/localstorage/LocalStorage;->removeEvents(Ljava/lang/String;Ljava/util/Collection;)V
        :after_delete
        invoke-virtual {v4}, Ljava/util/AbstractMap;->isEmpty()Z
        move-result v7
        if-nez v7, :outer_next
        invoke-virtual {v0, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        goto :outer_next
        :done
        return-object v0
    """, catchParserErrors = true))
    method.addInstructions(0, """
        const/4 v1, 0x0
        const/4 v2, 0x0
        invoke-static/range {p0 .. p1}, $SWRVE_EVENTS->morpheFilterEvents(${SWRVE_EVENTS}Ljava/util/LinkedHashMap;)Ljava/util/LinkedHashMap;
        move-result-object p1
    """.trimIndent())
    // The filter can fail on a native store operation. Retain the original
    // SDK error/log/count outcome rather than bypassing its catch boundary.
    method.implementation!!.addCatch("Ljava/lang/Exception;",
        method.implementation!!.newLabelForIndex(2), method.implementation!!.newLabelForIndex(4),
        method.implementation!!.newLabelForIndex(53))
}
