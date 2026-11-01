package patches.npostarttv

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.atv.exact

internal val phoneAppAuthDiscoveryCode = """
    const/4 v0, 0x0
    :discovery_try_start
    iget-object v1, p0, Lnl/npo/player/library/ru/k;->a:Landroid/net/Uri;
    invoke-static {v1}, Lnl/npo/player/library/tu/a;->a(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    move-result-object v1
    const-string v2, "GET"
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->setDoInput(Z)V
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
    new-instance v1, Lorg/json/JSONObject;
    invoke-static {v0}, Lnl/npo/player/library/io/b;->G(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v2
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    new-instance v2, Lnl/npo/player/library/ru/n;
    invoke-direct {v2, v1}, Lnl/npo/player/library/ru/n;-><init>(Lorg/json/JSONObject;)V
    new-instance v1, Lnl/npo/player/library/ru/l;
    invoke-direct {v1, v2}, Lnl/npo/player/library/ru/l;-><init>(Lnl/npo/player/library/ru/n;)V
    :discovery_try_end
    goto :discovery_close
    :discovery_io
    move-exception v1
    sget-object v2, Lnl/npo/player/library/ru/c;->d:Lnl/npo/player/library/ru/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/ru/e;->e(Lnl/npo/player/library/ru/e;Ljava/lang/Exception;)Lnl/npo/player/library/ru/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/ru/k;->d:Lnl/npo/player/library/ru/e;
    const/4 v1, 0x0
    goto :discovery_close
    :discovery_json
    move-exception v1
    sget-object v2, Lnl/npo/player/library/ru/c;->f:Lnl/npo/player/library/ru/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/ru/e;->e(Lnl/npo/player/library/ru/e;Ljava/lang/Exception;)Lnl/npo/player/library/ru/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/ru/k;->d:Lnl/npo/player/library/ru/e;
    const/4 v1, 0x0
    goto :discovery_close
    :discovery_missing
    move-exception v1
    sget-object v2, Lnl/npo/player/library/ru/c;->a:Lnl/npo/player/library/ru/e;
    invoke-static {v2, v1}, Lnl/npo/player/library/ru/e;->e(Lnl/npo/player/library/ru/e;Ljava/lang/Exception;)Lnl/npo/player/library/ru/e;
    move-result-object v1
    iput-object v1, p0, Lnl/npo/player/library/ru/k;->d:Lnl/npo/player/library/ru/e;
    const/4 v1, 0x0
    :discovery_handlers_end
    :discovery_close
    invoke-static {v0}, Lnl/npo/player/library/io/b;->b(Ljava/io/InputStream;)V
    return-object v1
    :discovery_catch_all
    move-exception v1
    invoke-static {v0}, Lnl/npo/player/library/io/b;->b(Ljava/io/InputStream;)V
    throw v1
    .catch Ljava/io/IOException; {:discovery_try_start .. :discovery_try_end} :discovery_io
    .catch Lorg/json/JSONException; {:discovery_try_start .. :discovery_try_end} :discovery_json
    .catch Lnl/npo/player/library/ru/m; {:discovery_try_start .. :discovery_try_end} :discovery_missing
    .catchall {:discovery_try_start .. :discovery_try_end} :discovery_catch_all
    .catchall {:discovery_io .. :discovery_handlers_end} :discovery_catch_all
""".trimIndent()

// Phone receiver merges Media3 media buttons (0), noisy audio (1), and network updates (2).
internal val phoneReceiverCode = """
    iget v0, p0, Lnl/npo/player/library/j9/e2;->a:I
    if-eqz v0, :phone_media
    const/4 v1, 0x1
    if-eq v0, v1, :phone_noisy
    iget-object v0, p0, Lnl/npo/player/library/j9/e2;->b:Ljava/lang/Object;
    check-cast v0, Lnl/npo/player/library/v6/s;
    iget-object v0, v0, Lnl/npo/player/library/v6/s;->c:Ljava/lang/Object;
    check-cast v0, Ljava/util/concurrent/Executor;
    new-instance v1, Lio/sentry/g7;
    const/16 v2, 0x17
    invoke-direct {v1, v2, p0, p1}, Lio/sentry/g7;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    return-void
    :phone_noisy
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "android.media.AUDIO_BECOMING_NOISY"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :phone_done
    iget-object v0, p0, Lnl/npo/player/library/j9/e2;->b:Ljava/lang/Object;
    check-cast v0, Lnl/npo/player/library/jv/c;
    iget-object v0, v0, Lnl/npo/player/library/jv/c;->b:Ljava/util/concurrent/CopyOnWriteArraySet;
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :phone_each
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :phone_done
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lnl/npo/player/library/xw/p;
    iget-object v1, v1, Lnl/npo/player/library/xw/p;->h:Lnl/npo/player/library/xw/x;
    iget-object v1, v1, Lnl/npo/player/library/xw/x;->a:Lnl/npo/player/library/bu/d1;
    sget-object v2, Lnl/npo/player/library/fw/i;->a:Lnl/npo/player/library/fw/i;
    invoke-virtual {v1, v2}, Lnl/npo/player/library/bu/d1;->c(Ljava/lang/Object;)Z
    goto :phone_each
    :phone_media
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    const-string v1, "android.intent.action.MEDIA_BUTTON"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :phone_done
    const-string v0, "android.intent.extra.KEY_EVENT"
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v0
    check-cast v0, Landroid/view/KeyEvent;
    if-eqz v0, :phone_done
    iget-object v1, p0, Lnl/npo/player/library/j9/e2;->b:Ljava/lang/Object;
    check-cast v1, Lnl/npo/player/library/j9/g2;
    iget-object v1, v1, Lnl/npo/player/library/j9/g2;->k:Lnl/npo/player/library/k9/r0;
    iget-object v1, v1, Lnl/npo/player/library/k9/r0;->i:Ljava/lang/Object;
    check-cast v1, Lnl/npo/player/library/f9/j;
    iget-object v1, v1, Lnl/npo/player/library/f9/j;->i:Ljava/lang/Object;
    check-cast v1, Lnl/npo/player/library/k9/y;
    iget-object v1, v1, Lnl/npo/player/library/k9/y;->a:Landroid/media/session/MediaController;
    invoke-virtual {v1, v0}, Landroid/media/session/MediaController;->dispatchMediaButtonEvent(Landroid/view/KeyEvent;)Z
    :phone_done
    return-void
""".trimIndent()

context(context: BytecodePatchContext)
internal fun restorePhoneCallbacks() {
    exact("Lnl/npo/player/library/j9/e2;", "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 8, 12)
        .addInstructions(0, phoneReceiverCode)
    exact("Lnl/npo/player/library/ru/k;", "doInBackground([Ljava/lang/Object;)Ljava/lang/Object;", 7, 11)
        .addCallbackWithExceptions(phoneAppAuthDiscoveryCode)
    exact("Lnl/npo/player/library/ll/c;", "doInBackground([Ljava/lang/Object;)Ljava/lang/Object;", 7, 11)
        .addCallbackWithExceptions(phoneBitmapFetchCode, expectedCatchCount = 2)
    exact("Lnl/npo/player/library/m9/a;", "doInBackground([Ljava/lang/Object;)Ljava/lang/Object;", 7, 11)
        .addInstructions(0, phoneRouteIndicatorCode)
}
