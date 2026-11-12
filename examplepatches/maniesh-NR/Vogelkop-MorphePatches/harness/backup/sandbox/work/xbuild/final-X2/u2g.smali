.class public final synthetic Lu2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lv2g;


# direct methods
.method public synthetic constructor <init>(Lv2g;B)V
    .registers 3

    iput-byte p2, p0, Lu2g;->a:B

    iput-object p1, p0, Lu2g;->b:Lv2g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lu2g;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lu2g;->b:Lv2g;

    packed-switch v0, :pswitch_data_c6

    check-cast p1, Ljava/lang/Integer;

    iget-object p0, p0, Lv2g;->b:Lkqd;

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iput-object v2, p0, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lx79;->T(Z)V

    return-void

    :pswitch_17
    iget-object p0, p0, Lv2g;->b:Lkqd;

    check-cast p1, [B

    new-instance v3, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_25
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-gez v0, :cond_36

    iget-object p1, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p1, Lx79;

    iput-object v2, p1, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lx79;->T(Z)V

    goto/16 :goto_bb

    :cond_36
    invoke-virtual {v3, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    if-gez v4, :cond_49

    iget-object p1, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p1, Lx79;

    iput-object v2, p1, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lx79;->T(Z)V

    goto :goto_bb

    :cond_49
    invoke-virtual {v3, v4}, Ljava/io/DataInputStream;->skipBytes(I)I

    add-int/lit8 v0, v0, 0x8

    add-int/2addr v0, v4

    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    new-instance v4, Ljava/lang/String;

    array-length v5, p1

    invoke-static {p1, v0, v5}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    invoke-direct {v4, p1}, Ljava/lang/String;-><init>([B)V

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-string v4, "ttl"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    int-to-long v8, v4

    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    add-long/2addr v8, v5

    const-string v0, "sites"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v10, v1

    :goto_84
    if-ge v10, v4, :cond_99

    new-instance v11, Lorb;

    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    invoke-direct {v11, v12}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v11, v5, v6, v8, v9}, Lt2g;->a(Lorb;JJ)Ll2g;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_84

    :cond_99
    new-instance v4, Lc3g;

    invoke-direct/range {v4 .. v9}, Lc3g;-><init>(J[BJ)V

    iget-object p1, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p1, Lx79;

    iput-object v2, p1, Lx79;->c:Ljava/lang/Object;

    iput-object v4, p1, Lx79;->d:Ljava/lang/Object;

    iput-object v0, p1, Lx79;->e:Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lx79;->T(Z)V
    :try_end_ac
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_ac} :catch_ad
    .catch Lorg/json/JSONException; {:try_start_25 .. :try_end_ac} :catch_ad
    .catchall {:try_start_25 .. :try_end_ac} :catchall_bf

    goto :goto_bb

    :catch_ad
    move-exception v0

    move-object p1, v0

    :try_start_af
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    iput-object v2, p0, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lx79;->T(Z)V
    :try_end_bb
    .catchall {:try_start_af .. :try_end_bb} :catchall_bf

    :goto_bb
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :catchall_bf
    move-exception v0

    move-object p0, v0

    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    nop

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
