package patches.npostarttv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import patches.atv.exact

// AppAuth Android 0.11.1 ConfigurationRetrievalAsyncTask.doInBackground behavior,
// expressed through this exact TV build's existing connection, discovery and error helpers.
// The original onPostExecute continuation remains unchanged.
internal val appAuthDiscoveryCode = """
    const/4 v0, 0x0
    :discovery_try_start
    iget-object v1, p0, Lnl/npo/player/library/zt/j;->a:Landroid/net/Uri;
    invoke-static {v1}, Lnl/npo/player/library/bu/a;->a(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    move-result-object v1
    const-string v2, "GET"
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setDoInput(Z)V
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
    new-instance v1, Lorg/json/JSONObject;
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->e(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v2
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    new-instance v2, Lnl/npo/player/library/zt/m;
    invoke-direct {v2, v1}, Lnl/npo/player/library/zt/m;-><init>(Lorg/json/JSONObject;)V
    new-instance v1, Lnl/npo/player/library/zt/k;
    invoke-direct {v1, v2}, Lnl/npo/player/library/zt/k;-><init>(Lnl/npo/player/library/zt/m;)V
    :discovery_try_end
    goto :discovery_close
    :discovery_io
    move-exception v1
    sget-object v2, Lnl/npo/player/library/zt/c;->d:Lnl/npo/player/library/zt/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/zt/e;->e(Lnl/npo/player/library/zt/e;Ljava/lang/Exception;)Lnl/npo/player/library/zt/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/zt/j;->d:Lnl/npo/player/library/zt/e;
    const/4 v1, 0x0
    goto :discovery_close
    :discovery_json
    move-exception v1
    sget-object v2, Lnl/npo/player/library/zt/c;->f:Lnl/npo/player/library/zt/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/zt/e;->e(Lnl/npo/player/library/zt/e;Ljava/lang/Exception;)Lnl/npo/player/library/zt/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/zt/j;->d:Lnl/npo/player/library/zt/e;
    const/4 v1, 0x0
    goto :discovery_close
    :discovery_missing
    move-exception v1
    sget-object v2, Lnl/npo/player/library/zt/c;->a:Lnl/npo/player/library/zt/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/zt/e;->e(Lnl/npo/player/library/zt/e;Ljava/lang/Exception;)Lnl/npo/player/library/zt/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/zt/j;->d:Lnl/npo/player/library/zt/e;
    const/4 v1, 0x0
    :discovery_handlers_end
    :discovery_close
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->b(Ljava/io/InputStream;)V
    return-object v1
    :discovery_catch_all
    move-exception v1
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->b(Ljava/io/InputStream;)V
    throw v1
    .catch Ljava/io/IOException; {:discovery_try_start .. :discovery_try_end} :discovery_io
    .catch Lorg/json/JSONException; {:discovery_try_start .. :discovery_try_end} :discovery_json
    .catch Lnl/npo/player/library/zt/l; {:discovery_try_start .. :discovery_try_end} :discovery_missing
    .catchall {:discovery_try_start .. :discovery_try_end} :discovery_catch_all
    .catchall {:discovery_io .. :discovery_handlers_end} :discovery_catch_all
""".trimIndent()

// Preserve asynchronous network classification through the shipped runnable. Audio route events
// retain the shipped BecomingNoisy -> player event flow used to pause and notify listeners.
internal val networkAudioReceiverCode = """
    iget v0, p0, Lnl/npo/player/library/l6/v;->a:I
    if-nez v0, :receiver_noisy
    iget-object v0, p0, Lnl/npo/player/library/l6/v;->b:Ljava/lang/Object;
    check-cast v0, Lnl/npo/player/library/l6/w;
    iget-object v0, v0, Lnl/npo/player/library/l6/w;->c:Ljava/lang/Object;
    check-cast v0, Ljava/util/concurrent/Executor;
    new-instance v1, Lio/sentry/i7;
    const/16 v2, 0xc
    invoke-direct {v1, v2, p0, p1}, Lio/sentry/i7;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    return-void
    :receiver_noisy
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "android.media.AUDIO_BECOMING_NOISY"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :receiver_done
    iget-object v0, p0, Lnl/npo/player/library/l6/v;->b:Ljava/lang/Object;
    check-cast v0, Lnl/npo/player/library/su/b;
    iget-object v0, v0, Lnl/npo/player/library/su/b;->b:Ljava/util/concurrent/CopyOnWriteArraySet;
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :receiver_each
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :receiver_done
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lnl/npo/player/library/gw/r;
    iget-object v1, v1, Lnl/npo/player/library/gw/r;->h:Lnl/npo/player/library/gw/b0;
    iget-object v1, v1, Lnl/npo/player/library/gw/b0;->a:Lnl/npo/player/library/jt/v0;
    sget-object v2, Lnl/npo/player/library/ov/i;->a:Lnl/npo/player/library/ov/i;
    invoke-virtual {v1, v2}, Lnl/npo/player/library/jt/v0;->c(Ljava/lang/Object;)Z
    goto :receiver_each
    :receiver_done
    return-void
""".trimIndent()

private data class CallbackCatch(val type: String?, val start: String, val end: String, val handler: String)

internal fun MutableMethod.addCallbackWithExceptions(code: String, expectedCatchCount: Int = 5) {
    // addInstructions compiles only instructions: its .catch directives do not update the
    // destination method's exception table. Recreate those ranges using destination labels.
    val labels = mutableMapOf<String, Int>()
    val catches = mutableListOf<CallbackCatch>()
    val catchPattern = Regex("""\.catch(all)?(?: (L[^;]+;))? \{(:\w+) \.\. (:\w+)\} (:\w+)""")
    var index = 0
    for (line in code.lineSequence().map(String::trim).filter(String::isNotEmpty)) {
        when {
            line.startsWith(":") -> check(labels.put(line, index) == null) { "Duplicate callback label: $line" }
            line.startsWith(".catch") -> {
                val match = checkNotNull(catchPattern.matchEntire(line)) { "Unexpected callback exception directive: $line" }
                val (_, type, start, end, handler) = match.destructured
                check((match.groupValues[1] == "all") == type.isEmpty())
                catches += CallbackCatch(type.ifEmpty { null }, start, end, handler)
            }
            else -> {
                check(line.first().isLowerCase()) { "Unexpected callback directive: $line" }
                index++
            }
        }
    }
    check(catches.size == expectedCatchCount && implementation!!.tryBlocks.isEmpty())
    addInstructions(0, code)
    val target = checkNotNull(implementation)
    for (entry in catches) {
        val start = target.newLabelForIndex(labels.getValue(entry.start))
        val end = target.newLabelForIndex(labels.getValue(entry.end))
        val handler = target.newLabelForIndex(labels.getValue(entry.handler))
        if (entry.type == null) target.addCatch(start, end, handler)
        else target.addCatch(entry.type, start, end, handler)
    }
}

internal val runtimeCallbacks = bytecodePatch {
    dependsOn(originalInput, tokenRequestCallbacks)
    execute {
        if (packageMetadata.isNpoPhone) {
            restorePhoneCallbacks()
            return@execute
        }
        exact("Lnl/npo/player/library/l6/v;", "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 8, 12)
            .addInstructions(0, networkAudioReceiverCode)
        exact("Lnl/npo/player/library/zt/j;", "doInBackground([Ljava/lang/Object;)Ljava/lang/Object;", 7, 11)
            .addCallbackWithExceptions(appAuthDiscoveryCode)
    }
}
