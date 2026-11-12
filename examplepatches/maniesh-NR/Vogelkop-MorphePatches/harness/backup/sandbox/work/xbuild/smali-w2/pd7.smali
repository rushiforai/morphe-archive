.class public final Lpd7;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final j:Ljava/lang/String;

.field public final k:I

.field public final l:Lulp;

.field public final m:Landroid/content/Context;

.field public n:Ljava/util/Map;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    const-string p2, "newsfeed_article_domains.json"

    iput-object p2, p0, Lpd7;->j:Ljava/lang/String;

    const/4 p2, 0x2

    iput p2, p0, Lpd7;->k:I

    sget-object p2, Lu55;->Ro:Lulp;

    iput-object p2, p0, Lpd7;->l:Lulp;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lpd7;->m:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 9

    :try_start_0
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v1, p0, Lpd7;->m:Landroid/content/Context;

    iget-object p0, p0, Lpd7;->j:Ljava/lang/String;

    invoke-virtual {v1, p0}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object p0

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    new-instance p0, Ljava/io/BufferedReader;

    const/16 v1, 0x2000

    invoke-direct {p0, v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_1b
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_1b} :catch_72
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1b} :catch_72
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1b} :catch_72

    :try_start_1b
    invoke-static {p0}, Ldgh;->l(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1
    :try_end_1f
    .catchall {:try_start_1b .. :try_end_1f} :catchall_6b

    :try_start_1f
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_2c
    if-ge v2, v1, :cond_6a

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "domain"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_53

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lod7;

    const-string v6, "expireTime"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Lod7;-><init>(J)V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    :cond_53
    new-instance p0, Lorg/json/JSONException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " is null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_6a
    .catch Ljava/io/FileNotFoundException; {:try_start_1f .. :try_end_6a} :catch_72
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_6a} :catch_72
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_6a} :catch_72

    :cond_6a
    return-object v0

    :catchall_6b
    move-exception v0

    :try_start_6c
    throw v0
    :try_end_6d
    .catchall {:try_start_6c .. :try_end_6d} :catchall_6d

    :catchall_6d
    move-exception v1

    :try_start_6e
    invoke-static {p0, v0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v1
    :try_end_72
    .catch Ljava/io/FileNotFoundException; {:try_start_6e .. :try_end_72} :catch_72
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_72} :catch_72
    .catch Lorg/json/JSONException; {:try_start_6e .. :try_end_72} :catch_72

    :catch_72
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Ljava/util/Map;

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    if-eqz p1, :cond_19

    new-instance v1, Lwhf;

    const/16 v2, 0x15

    invoke-direct {v1, v0, v2}, Lwhf;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lby1;

    const/4 v3, 0x2

    invoke-direct {v2, v1, v3}, Lby1;-><init>(Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p1, v2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    :cond_19
    :try_start_19
    iget-object p1, p0, Lpd7;->m:Landroid/content/Context;

    iget-object p0, p0, Lpd7;->j:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, p0, v1}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0

    sget-object p1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    new-instance p0, Ljava/io/BufferedWriter;

    const/16 p1, 0x2000

    invoke-direct {p0, v1, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_30} :catch_44

    :try_start_30
    iget-object p1, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_30 .. :try_end_39} :catchall_3d

    :try_start_39
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_3c} :catch_44

    return-void

    :catchall_3d
    move-exception p1

    :try_start_3e
    throw p1
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3f

    :catchall_3f
    move-exception v0

    :try_start_40
    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_44} :catch_44

    :catch_44
    return-void
.end method

.method public final c()I
    .registers 1

    iget p0, p0, Lpd7;->k:I

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Ljava/util/Map;

    iget-object v0, p0, Lpd7;->l:Lulp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    if-eqz p1, :cond_23

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_23

    new-instance v3, Lx41;

    const/4 v4, 0x3

    invoke-direct {v3, v0, v1, v4}, Lx41;-><init>(JB)V

    new-instance v0, Lzx1;

    const/16 v1, 0x8

    invoke-direct {v0, v3, v1}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v2, v0}, Ljava/util/Collection;->removeIf(Ljava/util/function/Predicate;)Z

    :cond_23
    if-nez p1, :cond_2a

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    :cond_2a
    iput-object p1, p0, Lpd7;->n:Ljava/util/Map;

    return-void
.end method
