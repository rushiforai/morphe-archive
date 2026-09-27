.class final Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;
.super Ljava/lang/Object;
.source "RawCaptionSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;,
        Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;,
        Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;
    }
.end annotation


# static fields
.field private static final MAX_SOURCE_BYTES:I = 0x1000000


# direct methods
.method constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 135
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_13

    if-eqz p0, :cond_12

    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->isCancelled()Z

    move-result p0

    if-nez p0, :cond_13

    :cond_12
    return-void

    .line 136
    :cond_13
    new-instance p0, Ljava/lang/InterruptedException;

    const-string v0, "source_cancelled"

    invoke-direct {p0, v0}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static fetch(Ljava/lang/String;ZJLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 148
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 149
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->isYouTubeTimedTextUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_172

    if-eqz p1, :cond_10

    .line 152
    invoke-static {p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->refresh(JLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    :cond_10
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->cached()Ljava/lang/String;

    move-result-object v0

    .line 153
    :goto_14
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 154
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    .line 155
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 156
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHook;->openWithYouTubeCronet(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v2

    if-nez v2, :cond_2c

    .line 157
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Ljava/net/HttpURLConnection;

    :cond_2c
    const/4 v1, 0x0

    .line 159
    :try_start_2d
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;

    invoke-direct {v3, v2, p2, p3}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;-><init>(Ljava/net/HttpURLConnection;J)V
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_167

    if-eqz p4, :cond_37

    .line 160
    :try_start_34
    invoke-interface {p4, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    .line 161
    :cond_37
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 162
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v4

    const/16 v5, 0x1388

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 163
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v4, 0x1

    .line 164
    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/4 v5, 0x0

    .line 165
    invoke-virtual {v2, v5}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 166
    const-string v6, "User-Agent"

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/FreshYouTubeCookies;->userAgent()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const-string v6, "Accept"

    const-string v7, "*/*"

    invoke-virtual {v2, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    const-string v6, "Accept-Encoding"

    const-string v7, "identity"

    invoke-virtual {v2, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const-string v6, "Referer"

    const-string v7, "https://www.youtube.com/"

    invoke-virtual {v2, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8f

    const/16 v6, 0xd

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-gez v6, :cond_8f

    const/16 v6, 0xa

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-gez v6, :cond_8f

    .line 171
    const-string v6, "Cookie"

    invoke-virtual {v2, v6, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    :cond_8f
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 173
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 174
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 175
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 176
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I
    :try_end_a3
    .catchall {:try_start_34 .. :try_end_a3} :catchall_15b

    const/16 v6, 0x191

    if-eq v0, v6, :cond_ab

    const/16 v6, 0x193

    if-ne v0, v6, :cond_c3

    :cond_ab
    if-nez p1, :cond_c3

    .line 203
    :try_start_ad
    invoke-virtual {v3}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->close()V
    :try_end_b0
    .catchall {:try_start_ad .. :try_end_b0} :catchall_167

    .line 205
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz p4, :cond_b8

    .line 206
    invoke-interface {p4, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    .line 209
    :cond_b8
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 210
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    .line 211
    invoke-static {p0, v4, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->fetch(Ljava/lang/String;ZJLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;

    move-result-object p0

    return-object p0

    :cond_c3
    const/16 p0, 0xc8

    if-lt v0, p0, :cond_150

    const/16 p0, 0x12c

    if-ge v0, p0, :cond_150

    .line 182
    :try_start_cb
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 183
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result p1

    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 184
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_db
    .catchall {:try_start_cb .. :try_end_db} :catchall_15b

    const/16 v0, 0x2000

    .line 185
    :try_start_dd
    new-array v0, v0, [B

    .line 187
    :goto_df
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 188
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 189
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4
    :try_end_ed
    .catchall {:try_start_dd .. :try_end_ed} :catchall_142

    if-gez v4, :cond_129

    if-eqz p1, :cond_f4

    .line 195
    :try_start_f1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 196
    :cond_f4
    invoke-static {p4}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 197
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    .line 198
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p1

    if-eqz p1, :cond_11d

    .line 200
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object p1

    .line 201
    new-instance p2, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    if-nez p1, :cond_10e

    const-string p1, "application/octet-stream"

    :cond_10e
    invoke-direct {p2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;-><init>([BLjava/lang/String;)V
    :try_end_111
    .catchall {:try_start_f1 .. :try_end_111} :catchall_15b

    .line 203
    :try_start_111
    invoke-virtual {v3}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->close()V
    :try_end_114
    .catchall {:try_start_111 .. :try_end_114} :catchall_167

    .line 205
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz p4, :cond_11c

    .line 206
    invoke-interface {p4, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    :cond_11c
    return-object p2

    .line 199
    :cond_11d
    :try_start_11d
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const-string v5, "empty_response"

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x1

    invoke-direct/range {v4 .. v9}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    throw v4
    :try_end_129
    .catchall {:try_start_11d .. :try_end_129} :catchall_15b

    .line 191
    :cond_129
    :try_start_129
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v4

    const/high16 v7, 0x1000000

    if-gt v6, v7, :cond_136

    .line 193
    invoke-virtual {p0, v0, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_df

    .line 192
    :cond_136
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    const-string v5, "source_too_large"

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v4 .. v9}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;-><init>(Ljava/lang/String;ZJLjava/lang/Throwable;)V

    throw v4
    :try_end_142
    .catchall {:try_start_129 .. :try_end_142} :catchall_142

    :catchall_142
    move-exception v0

    move-object p0, v0

    if-eqz p1, :cond_14f

    .line 184
    :try_start_146
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_149
    .catchall {:try_start_146 .. :try_end_149} :catchall_14a

    goto :goto_14f

    :catchall_14a
    move-exception v0

    move-object p1, v0

    :try_start_14c
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_14f
    :goto_14f
    throw p0

    .line 180
    :cond_150
    const-string p0, "Retry-After"

    invoke-virtual {v2, p0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;->http(ILjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy$Failure;

    move-result-object p0

    throw p0
    :try_end_15b
    .catchall {:try_start_14c .. :try_end_15b} :catchall_15b

    :catchall_15b
    move-exception v0

    move-object p0, v0

    .line 159
    :try_start_15d
    invoke-virtual {v3}, Lapp/yydarlinker/deepseekcaptions/NetworkDeadline;->close()V
    :try_end_160
    .catchall {:try_start_15d .. :try_end_160} :catchall_161

    goto :goto_166

    :catchall_161
    move-exception v0

    move-object p1, v0

    :try_start_163
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_166
    throw p0
    :try_end_167
    .catchall {:try_start_163 .. :try_end_167} :catchall_167

    :catchall_167
    move-exception v0

    move-object p0, v0

    .line 205
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz p4, :cond_171

    .line 206
    invoke-interface {p4, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;->onConnection(Ljava/net/HttpURLConnection;)V

    .line 207
    :cond_171
    throw p0

    .line 150
    :cond_172
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "invalid_source_url"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static load(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 27
    invoke-static {p0, p1, v2, v0, v1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->load(Landroid/content/Context;Ljava/lang/String;ZZLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object p0

    return-object p0
.end method

.method static load(Landroid/content/Context;Ljava/lang/String;Z)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 31
    invoke-static {p0, p1, p2, v0, v1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->load(Landroid/content/Context;Ljava/lang/String;ZZLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object p0

    return-object p0
.end method

.method static load(Landroid/content/Context;Ljava/lang/String;ZZ)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 35
    invoke-static {p0, p1, p2, p3, v0}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->load(Landroid/content/Context;Ljava/lang/String;ZZLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object p0

    return-object p0
.end method

.method static load(Landroid/content/Context;Ljava/lang/String;ZZLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 45
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz p3, :cond_c

    .line 46
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;->json3(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    move-object v4, p3

    goto :goto_d

    :cond_c
    move-object v4, v2

    .line 47
    :goto_d
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sget-object p3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide v5, 0x2cb417800L

    add-long v9, v0, v5

    .line 50
    :try_start_1a
    const-string v5, "SOURCE"

    invoke-static {v9, v10}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v7
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_20} :catch_2c

    const/4 v6, 0x1

    move-object v3, p0

    move-object v8, p4

    :try_start_23
    invoke-static/range {v3 .. v8}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->loadTrack(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;

    move-result-object p0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_27} :catch_28

    goto :goto_47

    :catch_28
    move-exception v0

    move-object v1, v3

    move-object v6, v8

    goto :goto_2f

    :catch_2c
    move-exception v0

    move-object v1, p0

    move-object v6, p4

    :goto_2f
    move-object p0, v0

    .line 52
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5c

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SourceRecoveryPolicy;->formatFallback(Ljava/lang/Throwable;)Z

    move-result p3

    if-eqz p3, :cond_5c

    const/4 v4, 0x1

    .line 53
    invoke-static {v9, v10}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->remaining(J)I

    move-result v5

    const-string v3, "SOURCE"

    invoke-static/range {v1 .. v6}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->loadTrack(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;

    move-result-object p0

    :goto_47
    if-eqz p2, :cond_56

    .line 56
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-interface {p2}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object p2

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->publishSharedTimeline(Ljava/lang/String;Ljava/util/List;)Z

    .line 57
    :cond_56
    new-instance p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    invoke-direct {p1, p0}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;-><init>(Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;)V

    return-object p1

    .line 52
    :cond_5c
    throw p0
.end method

.method private static loadTrack(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    invoke-static {p5}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    if-eqz p3, :cond_a

    .line 100
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    :cond_a
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->referenceKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 101
    :goto_e
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->get(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;

    move-result-object v1

    .line 102
    const-string v2, " bytes"

    if-eqz v1, :cond_5a

    .line 104
    :try_start_16
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;

    iget-object v4, v1, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->body:[B

    iget-object v5, v1, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->contentType:Ljava/lang/String;

    invoke-direct {v3, v4, v5, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    .line 105
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_CACHE_HIT"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_3a

    .line 108
    const-string v6, "\u590d\u7528\u539f\u59cb\u5b57\u5e55\u7f13\u5b58 "

    goto :goto_3c

    :cond_3a
    const-string v6, "\u590d\u7528\u65f6\u95f4\u951a\u7f13\u5b58 "

    :goto_3c
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$Entry;->body:[B

    array-length v1, v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 105
    invoke-static {p0, v4, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_4f} :catch_50

    return-object v3

    .line 112
    :catch_50
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->remove(Landroid/content/Context;Ljava/lang/String;)V

    .line 113
    const-string v1, "SOURCE_CACHE_REJECTED"

    const-string v3, "unreadable_cached_track"

    invoke-static {p0, v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    :cond_5a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_FETCH"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p3, :cond_70

    .line 117
    const-string v3, "\u6b63\u5728\u83b7\u53d6\u539f\u59cb\u5b57\u5e55"

    goto :goto_72

    :cond_70
    const-string v3, "\u6b63\u5728\u83b7\u53d6\u81ea\u52a8\u751f\u6210\u5b57\u5e55\u65f6\u95f4\u951a"

    .line 116
    :goto_72
    invoke-static {p0, v1, v3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v5, p4

    invoke-virtual {v1, v5, v6}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v5

    add-long/2addr v3, v5

    const/4 p4, 0x0

    .line 119
    invoke-static {p1, p4, v3, v4, p5}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->fetch(Ljava/lang/String;ZJLapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;

    move-result-object p4

    .line 124
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;

    iget-object v3, p4, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->body:[B

    iget-object v4, p4, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->contentType:Ljava/lang/String;

    invoke-direct {v1, v3, v4, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    .line 125
    invoke-static {p5}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->checkActive(Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)V

    .line 126
    iget-object p1, p4, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->body:[B

    iget-object p5, p4, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->contentType:Ljava/lang/String;

    invoke-static {p0, v0, p1, p5}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->put(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V

    .line 127
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "_OK"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p3, :cond_b4

    .line 130
    const-string p3, "\u539f\u59cb\u5b57\u5e55 "

    goto :goto_b6

    :cond_b4
    const-string p3, "\u65f6\u95f4\u951a "

    :goto_b6
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p4, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Fetch;->body:[B

    array-length p3, p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 127
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->mark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method static publishSharedTimeline(Ljava/lang/String;Ljava/util/List;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;)Z"
        }
    .end annotation

    .line 74
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->replace(Ljava/lang/String;Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method private static query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 83
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a} :catch_e

    if-nez p0, :cond_d

    return-object v0

    :cond_d
    return-object p0

    :catch_e
    return-object v0
.end method

.method static reference(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 62
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/PageCaptionController;->videoIdFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "lang"

    invoke-static {p1, v1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 64
    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/NativeAsrTrackReference;->candidates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 65
    invoke-static {v3, v1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->sameLanguage(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_29

    goto :goto_12

    .line 66
    :cond_29
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    goto :goto_12

    .line 67
    :cond_34
    new-instance p1, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    .line 68
    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;->json3(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/16 v8, 0x5dc

    const-string v6, "ASR_REFERENCE"

    move-object v4, p0

    move-object v9, p2

    invoke-static/range {v4 .. v9}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->loadTrack(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILapp/yydarlinker/deepseekcaptions/DeepSeekApiClient$RequestControl;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;

    move-result-object p0

    invoke-direct {p1, p0}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;-><init>(Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$LoadedTrack;)V

    return-object p1

    :cond_49
    const/4 p0, 0x0

    return-object p0
.end method

.method static remaining(J)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketTimeoutException;
        }
    .end annotation

    .line 140
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr p0, v0

    const-wide/32 v0, 0xf4240

    div-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-lez v0, :cond_20

    const-wide/16 v0, 0x1

    .line 142
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    const-wide/32 v0, 0x7fffffff

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    long-to-int p0, p0

    return p0

    .line 141
    :cond_20
    new-instance p0, Ljava/net/SocketTimeoutException;

    const-string p1, "source_deadline"

    invoke-direct {p0, p1}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static sourceLanguage(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)Ljava/lang/String;
    .registers 2

    .line 78
    const-string p1, "lang"

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->query(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
