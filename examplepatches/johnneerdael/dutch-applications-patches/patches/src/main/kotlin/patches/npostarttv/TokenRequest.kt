package patches.npostarttv

import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

// AppAuth Android 0.11.1 AuthorizationService.TokenRequestTask.doInBackground,
// using the shipped TV request, HTTPS connection, form encoder and error helpers.
// R8 retains only the public-client specialization: client_id in the request body.
// Keep onPostExecute intact for OAuth errors, response parsing and ID-token validation.
internal val appAuthTokenRequestCode = """
    const/4 v0, 0x0
    :token_try_start
    iget-object v2, p0, Lnl/npo/player/library/zt/i;->a:Lnl/npo/player/library/zt/x;
    iget-object v3, v2, Lnl/npo/player/library/zt/x;->a:Lnl/npo/player/library/zt/k;
    iget-object v3, v3, Lnl/npo/player/library/zt/k;->b:Landroid/net/Uri;
    invoke-static {v3}, Lnl/npo/player/library/bu/a;->a(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    move-result-object v1
    const-string v3, "POST"
    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    const-string v3, "Content-Type"
    const-string v4, "application/x-www-form-urlencoded"
    invoke-virtual {v1, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1}, Lnl/npo/player/library/zt/i;->a(Ljava/net/HttpURLConnection;)V
    const/4 v3, 0x1
    invoke-virtual {v1, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V
    invoke-virtual {v2}, Lnl/npo/player/library/zt/x;->a()Ljava/util/HashMap;
    move-result-object v3
    iget-object v4, v2, Lnl/npo/player/library/zt/x;->c:Ljava/lang/String;
    const-string v2, "client_id"
    invoke-static {v2, v4}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;
    move-result-object v2
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V
    invoke-static {v3}, Lnl/npo/player/library/bm/f;->z(Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v2
    const-string v3, "Content-Length"
    invoke-virtual {v2}, Ljava/lang/String;->length()I
    move-result v4
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v1, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    new-instance v3, Ljava/io/OutputStreamWriter;
    invoke-virtual {v1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v4
    invoke-direct {v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V
    invoke-virtual {v3, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    move-result v3
    const/16 v4, 0xc8
    if-lt v3, v4, :token_error_stream
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    move-result v3
    const/16 v4, 0x12c
    if-ge v3, v4, :token_error_stream
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    move-result-object v0
    goto :token_read
    :token_error_stream
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;
    move-result-object v0
    :token_read
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->e(Ljava/io/InputStream;)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Lorg/json/JSONObject;
    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :token_try_end
    goto :token_close
    :token_io
    move-exception v2
    sget-object v3, Lnl/npo/player/library/zt/c;->d:Lnl/npo/player/library/zt/e;
    invoke-static {v3, v2}, Lnl/npo/player/library/zt/e;->e(Lnl/npo/player/library/zt/e;Ljava/lang/Exception;)Lnl/npo/player/library/zt/e;
    move-result-object v2
    iput-object v2, p0, Lnl/npo/player/library/zt/i;->d:Lnl/npo/player/library/zt/e;
    const/4 v3, 0x0
    goto :token_close
    :token_json
    move-exception v2
    sget-object v3, Lnl/npo/player/library/zt/c;->f:Lnl/npo/player/library/zt/e;
    invoke-static {v3, v2}, Lnl/npo/player/library/zt/e;->e(Lnl/npo/player/library/zt/e;Ljava/lang/Exception;)Lnl/npo/player/library/zt/e;
    move-result-object v2
    iput-object v2, p0, Lnl/npo/player/library/zt/i;->d:Lnl/npo/player/library/zt/e;
    const/4 v3, 0x0
    :token_handlers_end
    :token_close
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->b(Ljava/io/InputStream;)V
    return-object v3
    :token_catch_all
    move-exception v2
    invoke-static {v0}, Lnl/npo/player/library/x80/j;->b(Ljava/io/InputStream;)V
    throw v2
    .catch Ljava/io/IOException; {:token_try_start .. :token_try_end} :token_io
    .catch Lorg/json/JSONException; {:token_try_start .. :token_try_end} :token_json
    .catchall {:token_try_start .. :token_try_end} :token_catch_all
    .catchall {:token_io .. :token_handlers_end} :token_catch_all
""".trimIndent()

internal val tokenRequestCallbacks = bytecodePatch {
    dependsOn(originalInput)
    execute {
        // This phone build ships the genuine AppAuth token method outside the VM.
        if (packageMetadata.isNpoPhone) return@execute
        exact("Lnl/npo/player/library/zt/i;", "doInBackground([Ljava/lang/Object;)Ljava/lang/Object;", 7, 11)
            .addCallbackWithExceptions(appAuthTokenRequestCode, expectedCatchCount = 4)
    }
}
