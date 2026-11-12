.class public final synthetic Ljl4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lx9n;
.implements Lfjc;
.implements Lxo4;
.implements Lp9g;
.implements Ln5o;
.implements Lvlf;
.implements Lkjm;
.implements Lav4;
.implements Li6f;
.implements Lm94;
.implements Lq5n;
.implements Lh93;
.implements Lnl5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Ljl4;->a:B

    iput-object p1, p0, Ljl4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lxm5;Lhkf;)V
    .registers 3

    const/16 p1, 0x17

    iput-byte p1, p0, Ljl4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljl4;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final E(Lcom/opera/android/custom_views/CheckBox;)V
    .registers 3

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lql5;

    iget-boolean p1, p1, Lcom/opera/android/custom_views/CheckBox;->n:Z

    xor-int/lit8 p1, p1, 0x1

    iget-object p0, p0, Lql5;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "show_conflicting_settings_warning"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final a(I)V
    .registers 4

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lkl4;

    iput p1, p0, Lkl4;->g:I

    iget-object v0, p0, Lkl4;->f:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_13

    const/16 v1, 0x64

    if-ne p1, v1, :cond_13

    iget-object p0, p0, Lkl4;->e:Lnv6;

    invoke-virtual {p0, v0}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    :cond_13
    return-void
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 4

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lxob;

    new-instance v0, Lwg5;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lwg5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lxob;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    const-string p0, "Job.asListenableFuture"

    return-object p0
.end method

.method public final b(I)V
    .registers 8

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Ltc6;

    const/4 v0, 0x1

    if-ne p1, v0, :cond_34

    iget-object p1, p0, Ltc6;->w:Lorm;

    check-cast p1, Lx5f;

    iget-boolean v1, p1, Lx5f;->h:Z

    if-eqz v1, :cond_25

    iget-object v1, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v3, 0x9

    const-wide/16 v4, 0x1

    invoke-virtual {v1, v3, v0, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v2}, Lx5f;->U0(Lx56;)V

    :cond_25
    iget-object p1, p0, Ltc6;->x:Lxi5;

    iget-object v0, p1, Lxi5;->c:Lqy4;

    invoke-virtual {v0}, Lqy4;->d()V

    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1, v0, v1}, Lxi5;->h(JJ)V

    invoke-virtual {p0}, Ltc6;->H0()V

    :cond_34
    return-void
.end method

.method public final c(Lvzk;)Lup4;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v0, v0, Ljl4;->b:Ljava/lang/Object;

    check-cast v0, Lvp4;

    const-string v2, "CctTransportBackend"

    iget-object v3, v1, Lvzk;->a:Ljava/lang/Object;

    check-cast v3, Ljava/net/URL;

    const-string v4, "TRuntime.CctTransportBackend"

    const/4 v5, 0x4

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_20

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "Making request to: %s"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_20
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    const/16 v6, 0x7530

    invoke-virtual {v3, v6}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    const v6, 0x1fbd0

    invoke-virtual {v3, v6}, Ljava/net/URLConnection;->setReadTimeout(I)V

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const/4 v7, 0x0

    invoke-virtual {v3, v7}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v8, "POST"

    invoke-virtual {v3, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v8, "User-Agent"

    const-string v9, "datatransport/5.0.0 android/"

    invoke-virtual {v3, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "Content-Encoding"

    const-string v9, "gzip"

    invoke-virtual {v3, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "application/json"

    const-string v11, "Content-Type"

    invoke-virtual {v3, v11, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "Accept-Encoding"

    invoke-virtual {v3, v10, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v10, v1, Lvzk;->c:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_69

    const-string v12, "NID="

    invoke-virtual {v12, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v12, "Cookie"

    invoke-virtual {v3, v12, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_69
    iget-object v10, v1, Lvzk;->d:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_74

    const-string v12, "X-Goog-Api-Key"

    invoke-virtual {v3, v12, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_74
    :try_start_74
    invoke-virtual {v3}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10
    :try_end_78
    .catch Ljava/net/ConnectException; {:try_start_74 .. :try_end_78} :catch_1cb
    .catch Ljava/net/UnknownHostException; {:try_start_74 .. :try_end_78} :catch_1cb
    .catch Lq28; {:try_start_74 .. :try_end_78} :catch_1bc
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_78} :catch_1bc

    :try_start_78
    new-instance v12, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v12, v10}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_7d
    .catchall {:try_start_78 .. :try_end_7d} :catchall_1af

    :try_start_7d
    iget-object v0, v0, Lvp4;->a:Leq6;

    iget-object v1, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Ltm2;

    new-instance v14, Ljava/io/BufferedWriter;

    new-instance v13, Ljava/io/OutputStreamWriter;

    invoke-direct {v13, v12}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v14, v13}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    new-instance v13, Lysb;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lmqb;

    iget-object v15, v0, Lmqb;->a:Ljava/util/HashMap;

    move/from16 p0, v6

    iget-object v6, v0, Lmqb;->b:Ljava/util/HashMap;

    move/from16 v19, v7

    iget-object v7, v0, Lmqb;->c:Ljqb;

    iget-boolean v0, v0, Lmqb;->d:Z

    move/from16 v18, v0

    move-object/from16 v16, v6

    move-object/from16 v17, v7

    invoke-direct/range {v13 .. v18}, Lysb;-><init>(Ljava/io/Writer;Ljava/util/HashMap;Ljava/util/HashMap;Ljqb;Z)V

    invoke-virtual {v13, v1}, Lysb;->a(Ljava/lang/Object;)Lysb;

    invoke-virtual {v13}, Lysb;->c()V

    iget-object v0, v13, Lysb;->b:Landroid/util/JsonWriter;

    invoke-virtual {v0}, Landroid/util/JsonWriter;->flush()V
    :try_end_b3
    .catchall {:try_start_7d .. :try_end_b3} :catchall_1a4

    :try_start_b3
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_b6
    .catchall {:try_start_b3 .. :try_end_b6} :catchall_1af

    if-eqz v10, :cond_bb

    :try_start_b8
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_bb
    .catch Ljava/net/ConnectException; {:try_start_b8 .. :try_end_bb} :catch_1cb
    .catch Ljava/net/UnknownHostException; {:try_start_b8 .. :try_end_bb} :catch_1cb
    .catch Lq28; {:try_start_b8 .. :try_end_bb} :catch_1bc
    .catch Ljava/io/IOException; {:try_start_b8 .. :try_end_bb} :catch_1bc

    :cond_bb
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_d2

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Status Code: %d"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_d2
    const-string v0, "Content-Type: %s"

    invoke-virtual {v3, v11}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2, v0}, Lmkh;->q(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Content-Encoding: %s"

    invoke-virtual {v3, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v2, v0}, Lmkh;->q(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x12e

    if-eq v14, v0, :cond_18d

    const/16 v0, 0x12d

    if-eq v14, v0, :cond_18d

    const/16 v0, 0x133

    if-eq v14, v0, :cond_18d

    const/16 v0, 0xc8

    if-eq v14, v0, :cond_ff

    new-instance v13, Lup4;

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v13 .. v18}, Lup4;-><init>(ILjava/net/URL;JLjava/lang/String;)V

    return-object v13

    :cond_ff
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    :try_start_103
    invoke-virtual {v3, v8}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_114

    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v0, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_112
    .catchall {:try_start_103 .. :try_end_112} :catchall_180

    move-object v2, v0

    goto :goto_115

    :cond_114
    move-object v2, v1

    :goto_115
    :try_start_115
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-static {v0}, Lao2;->a(Ljava/io/BufferedReader;)Lao2;

    move-result-object v0

    iget-wide v4, v0, Lao2;->a:J

    new-instance v13, Lup4;

    const-string v0, "Set-Cookie"

    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_15c

    const-string v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v3, v0

    move/from16 v6, v19

    :goto_138
    if-ge v6, v3, :cond_15c

    aget-object v7, v0, v6

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "="

    const/4 v9, 0x2

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    if-ne v8, v9, :cond_159

    aget-object v8, v7, v19

    aget-object v7, v7, p0

    const-string v9, "NID"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_159

    :goto_156
    move-object/from16 v18, v7

    goto :goto_15e

    :cond_159
    add-int/lit8 v6, v6, 0x1

    goto :goto_138

    :cond_15c
    const/4 v7, 0x0

    goto :goto_156

    :goto_15e
    const/4 v15, 0x0

    move-wide/from16 v16, v4

    invoke-direct/range {v13 .. v18}, Lup4;-><init>(ILjava/net/URL;JLjava/lang/String;)V
    :try_end_164
    .catchall {:try_start_115 .. :try_end_164} :catchall_171

    if-eqz v2, :cond_169

    :try_start_166
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_169
    .catchall {:try_start_166 .. :try_end_169} :catchall_180

    :cond_169
    if-eqz v1, :cond_16e

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_16e
    return-object v13

    :goto_16f
    move-object v3, v0

    goto :goto_173

    :catchall_171
    move-exception v0

    goto :goto_16f

    :goto_173
    if-eqz v2, :cond_17d

    :try_start_175
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_178
    .catchall {:try_start_175 .. :try_end_178} :catchall_179

    goto :goto_17d

    :catchall_179
    move-exception v0

    :try_start_17a
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_17d
    :goto_17d
    throw v3
    :try_end_17e
    .catchall {:try_start_17a .. :try_end_17e} :catchall_180

    :goto_17e
    move-object v2, v0

    goto :goto_182

    :catchall_180
    move-exception v0

    goto :goto_17e

    :goto_182
    if-eqz v1, :cond_18c

    :try_start_184
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_187
    .catchall {:try_start_184 .. :try_end_187} :catchall_188

    goto :goto_18c

    :catchall_188
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_18c
    :goto_18c
    throw v2

    :cond_18d
    const-string v0, "Location"

    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v13, Lup4;

    new-instance v15, Ljava/net/URL;

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v13 .. v18}, Lup4;-><init>(ILjava/net/URL;JLjava/lang/String;)V

    return-object v13

    :goto_1a2
    move-object v1, v0

    goto :goto_1a6

    :catchall_1a4
    move-exception v0

    goto :goto_1a2

    :goto_1a6
    :try_start_1a6
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_1a9
    .catchall {:try_start_1a6 .. :try_end_1a9} :catchall_1aa

    goto :goto_1ae

    :catchall_1aa
    move-exception v0

    :try_start_1ab
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1ae
    throw v1
    :try_end_1af
    .catchall {:try_start_1ab .. :try_end_1af} :catchall_1af

    :catchall_1af
    move-exception v0

    move-object v1, v0

    if-eqz v10, :cond_1bb

    :try_start_1b3
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_1b6
    .catchall {:try_start_1b3 .. :try_end_1b6} :catchall_1b7

    goto :goto_1bb

    :catchall_1b7
    move-exception v0

    :try_start_1b8
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1bb
    :goto_1bb
    throw v1
    :try_end_1bc
    .catch Ljava/net/ConnectException; {:try_start_1b8 .. :try_end_1bc} :catch_1cb
    .catch Ljava/net/UnknownHostException; {:try_start_1b8 .. :try_end_1bc} :catch_1cb
    .catch Lq28; {:try_start_1b8 .. :try_end_1bc} :catch_1bc
    .catch Ljava/io/IOException; {:try_start_1b8 .. :try_end_1bc} :catch_1bc

    :catch_1bc
    invoke-static {v2}, Lmkh;->v(Ljava/lang/String;)Ljava/lang/String;

    new-instance v3, Lup4;

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/16 v4, 0x190

    const/4 v5, 0x0

    invoke-direct/range {v3 .. v8}, Lup4;-><init>(ILjava/net/URL;JLjava/lang/String;)V

    goto :goto_1da

    :catch_1cb
    invoke-static {v2}, Lmkh;->v(Ljava/lang/String;)Ljava/lang/String;

    new-instance v4, Lup4;

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/16 v5, 0x1f4

    const/4 v6, 0x0

    invoke-direct/range {v4 .. v9}, Lup4;-><init>(ILjava/net/URL;JLjava/lang/String;)V

    move-object v3, v4

    :goto_1da
    return-object v3
.end method

.method public final e()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Ljl4;->a:B

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_68

    check-cast p0, Ljava/lang/Class;

    :try_start_a
    sget-object v0, Lanm;->a:Lanm;

    invoke-virtual {v0, p0}, Lanm;->a(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_10} :catch_11

    goto :goto_1d

    :catch_11
    move-exception v0

    const-string v2, "Unable to create instance of "

    const-string v3, ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem."

    invoke-static {p0, v2, v3}, Lfki;->q(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lh9o;->s(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1d
    return-object v1

    :pswitch_1e
    check-cast p0, Ljava/lang/reflect/Constructor;

    const-string v0, "\' with no args"

    const-string v2, "Failed to invoke constructor \'"

    :try_start_24
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_28
    .catch Ljava/lang/InstantiationException; {:try_start_24 .. :try_end_28} :catch_4e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_24 .. :try_end_28} :catch_32
    .catch Ljava/lang/IllegalAccessException; {:try_start_24 .. :try_end_28} :catch_29

    goto :goto_4d

    :catch_29
    move-exception p0

    sget-object v0, Lyqh;->a:Lu0h;

    const-string v0, "Unexpected IllegalAccessException occurred (Gson 2.13.2). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers."

    invoke-static {v0, p0}, Lh9o;->s(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4d

    :catch_32
    move-exception v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lyqh;->b(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {p0, v0}, Lh9o;->s(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_4d
    return-object v1

    :catch_4e
    move-exception v1

    new-instance v3, Ljava/lang/RuntimeException;

    invoke-static {p0}, Lyqh;->b(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    move-result-object p0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v3, p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :pswitch_data_68
    .packed-switch 0x13
        :pswitch_1e
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ljl4;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_134

    check-cast p0, Lvk6;

    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lvk6;->a:Lrv0;

    iget-object p1, p1, Lrv0;->a:Ly5i;

    new-instance v0, Ly2;

    const/16 v3, 0x12

    invoke-direct {v0, v3}, Ly2;-><init>(B)V

    invoke-static {p1, v2, v1, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lvk6;->a:Lrv0;

    iget-object p0, p0, Lrv0;->a:Ly5i;

    new-instance v0, Ly2;

    const/16 v3, 0x11

    invoke-direct {v0, v3}, Ly2;-><init>(B)V

    invoke-static {p0, v1, v2, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    return-object p1

    :sswitch_2d
    check-cast p0, Ltn;

    check-cast p1, Ljava/lang/String;

    :try_start_31
    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    new-instance v1, Lfvh;

    invoke-direct {v1}, Lfvh;-><init>()V

    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Lhra;

    iput-object p0, v1, Lfvh;->a:Lhra;

    const-string p0, "application/json"

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;

    invoke-static {p0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object p0

    invoke-static {p1, p0}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object p0

    const-string p1, "POST"

    invoke-virtual {v1, p1, p0}, Lfvh;->e(Ljava/lang/String;Lrvh;)V

    new-instance p0, Lkvh;

    invoke-direct {p0, v1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {v0, p0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    invoke-interface {p0}, Lv84;->execute()Lpzh;

    move-result-object p0

    iget-boolean p0, p0, Lpzh;->q:Z
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_64} :catch_64

    :catch_64
    const/4 p0, 0x0

    return-object p0

    :sswitch_66
    check-cast p0, Ljava/io/File;

    check-cast p1, Lkotlin/Unit;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v3, "Contents of "

    const-string v4, "\n"

    invoke-static {v3, v0, v4}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p0, v1, v1}, Lfsp;->d(Ljava/lang/StringBuilder;Ljava/io/File;IZ)V

    const-string v0, "\nLargest folders:\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lkotlin/io/FileWalkDirection;->a:Lkotlin/io/FileWalkDirection;

    invoke-static {p0, v0}, Ly29;->f(Ljava/io/File;Lkotlin/io/FileWalkDirection;)Ln29;

    move-result-object v0

    new-instance v1, Lwx1;

    const/4 v3, 0x4

    invoke-direct {v1, p0, v3}, Lwx1;-><init>(Ljava/io/File;B)V

    invoke-static {v0, v1}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v0

    new-instance v1, Ltb6;

    invoke-direct {v1, v2}, Ltb6;-><init>(B)V

    new-instance v2, Lm2m;

    invoke-direct {v2, v0, v1}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lyg9;

    const/16 v1, 0x19

    invoke-direct {v0, v1}, Lyg9;-><init>(B)V

    new-instance v1, Lec7;

    const/4 v3, 0x2

    invoke-direct {v1, v2, v0, v3}, Lec7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/16 v0, 0x32

    invoke-static {v1, v0}, Ly1j;->f(Lkotlin/sequences/Sequence;I)Lkotlin/sequences/Sequence;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/Pair;

    iget-object v2, v1, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    iget-object v1, v1, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    new-instance v1, Ljava/io/File;

    invoke-static {v2, p0}, Lz29;->k(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/ ("

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " bytes)\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b4

    :cond_f6
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_fb
    check-cast p0, Lwz5;

    check-cast p1, Landroid/content/Intent;

    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_109
    check-cast p0, Lt25;

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Lt25;->g:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const-wide/16 v2, 0x0

    :goto_115
    if-ge v1, p1, :cond_12e

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    check-cast v0, Lre7;

    invoke-virtual {v0}, Lre7;->e()Ldd7;

    move-result-object v4

    if-nez v4, :cond_128

    iget-wide v4, v0, Lre7;->j:J

    goto :goto_12c

    :cond_128
    invoke-virtual {v4}, Ldd7;->j()J

    move-result-wide v4

    :goto_12c
    add-long/2addr v2, v4

    goto :goto_115

    :cond_12e
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_134
    .sparse-switch
        0xa -> :sswitch_109
        0x16 -> :sswitch_fb
        0x19 -> :sswitch_66
        0x1c -> :sswitch_2d
    .end sparse-switch
.end method

.method public final invoke(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ljl4;->a:B

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c

    check-cast p0, Lrb3;

    check-cast p1, Leig;

    const/4 v0, 0x1

    invoke-interface {p1, p0, v0}, Leig;->K(Lgql;I)V

    return-void

    :pswitch_10
    check-cast p0, Lfzl;

    check-cast p1, Leig;

    invoke-interface {p1, p0}, Leig;->G(Lfzl;)V

    return-void

    :pswitch_18
    check-cast p0, Lpyl;

    check-cast p1, Leig;

    iget-object p0, p0, Lpyl;->e:Ljava/lang/Object;

    check-cast p0, Lfzl;

    invoke-interface {p1, p0}, Leig;->G(Lfzl;)V

    return-void

    :pswitch_24
    check-cast p0, Lzh8;

    check-cast p1, Leig;

    invoke-interface {p1, p0}, Leig;->F(Lrhg;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_24
        :pswitch_18
        :pswitch_10
    .end packed-switch
.end method

.method public final k([I[Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lz0c;

    iget-object p1, p0, Lz0c;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/api/Callback;

    iget-object p0, p0, Lz0c;->c:Ljava/lang/Object;

    check-cast p0, Lsz4;

    invoke-static {p0}, Lyi4;->y(Lsz4;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 4

    iget-byte v0, p0, Ljl4;->a:B

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    check-cast p0, [Lcom/google/android/gms/cast/MediaQueueItem;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v0, v1}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueInsertItems([Lcom/google/android/gms/cast/MediaQueueItem;ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    :pswitch_10
    check-cast p0, [J

    invoke-virtual {p1, p0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->setActiveMediaTracks([J)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_18
    .packed-switch 0x5
        :pswitch_10
    .end packed-switch
.end method

.method public final o(Ljjm;Lhjm;)V
    .registers 3

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lxg5;

    iget-object p2, p0, Lxg5;->b:Lo93;

    if-ne p1, p2, :cond_21

    const/4 p1, 0x0

    iput-object p1, p0, Lxg5;->b:Lo93;

    iget-object p2, p0, Lxg5;->a:Llld;

    iget-object p2, p2, Llld;->b:Ljava/lang/Object;

    check-cast p2, Lt0g;

    invoke-virtual {p2, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-boolean p2, p0, Lxg5;->d:Z

    if-nez p2, :cond_21

    iget-object p2, p0, Lxg5;->c:Lmim;

    iput-object p1, p0, Lxg5;->c:Lmim;

    if-eqz p2, :cond_21

    invoke-virtual {p2}, Lmim;->run()V

    :cond_21
    return-void
.end method

.method public final onUnhandledKeyEvent(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 3

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lhkf;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x1

    if-eqz p0, :cond_14

    if-ne p0, p1, :cond_f

    const/4 p1, 0x6

    goto :goto_14

    :cond_f
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_14
    :goto_14
    invoke-static {}, Lc37;->r()Lc37;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lc37;->l(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    check-cast p0, Lsb6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p0

    if-eqz p0, :cond_19

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    if-eqz p0, :cond_21

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_21
    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, Ljl4;->a:B

    iget-object p0, p0, Ljl4;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_28

    :pswitch_7
    check-cast p0, Ligi;

    iget-object p0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string p1, "compression"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_13
    check-cast p0, Lp35;

    iget-object p1, p0, Lp35;->v:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "exit_dialog_enabled"

    invoke-virtual {p1, p2, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {p0}, Lp35;->G0()V

    return-void

    :pswitch_20
    check-cast p0, Le35;

    iget-object p0, p0, Le35;->z:Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void

    :pswitch_data_28
    .packed-switch 0xb
        :pswitch_20
        :pswitch_7
        :pswitch_13
    .end packed-switch
.end method
