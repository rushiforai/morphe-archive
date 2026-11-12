.class public final synthetic La32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbcf;
.implements Lyjj;
.implements Lxo4;
.implements Lls5;
.implements Lyyk;
.implements Lgx6;
.implements Ln5o;
.implements Lmr8;
.implements Lcom/google/android/gms/tasks/SuccessContinuation;
.implements Lswl;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lqnb;
.implements Lzpd;
.implements Lop5;
.implements Ldkj;
.implements Lav2;
.implements Ljr9;
.implements Lauk;
.implements Lwdi;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Laqd;Ln3j;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .registers 5

    const/16 p2, 0x12

    iput-byte p2, p0, La32;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La32;->b:Ljava/lang/Object;

    iput-object p3, p0, La32;->c:Ljava/lang/Object;

    iput-object p4, p0, La32;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 14
    iput-byte p4, p0, La32;->a:B

    iput-object p1, p0, La32;->b:Ljava/lang/Object;

    iput-object p2, p0, La32;->c:Ljava/lang/Object;

    iput-object p3, p0, La32;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-byte v0, p0, La32;->a:B

    iget-object v1, p0, La32;->d:Ljava/lang/Object;

    iget-object v2, p0, La32;->c:Ljava/lang/Object;

    iget-object p0, p0, La32;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lorg/chromium/ui/base/WindowAndroid;

    check-cast v2, Ljava/util/List;

    check-cast v1, Lbag;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lf03;->T(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;Lbag;Z)V

    return-void

    :pswitch_22
    check-cast p0, Lpgf;

    check-cast v2, Ldx3;

    check-cast v1, Landroid/content/Intent;

    sget-object v0, Lnl0;->b:Lnl0;

    invoke-virtual {p0, v0}, Lpgf;->c(Lnl0;)V

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x14
        :pswitch_22
    .end packed-switch
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Ljrd;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Ltjd;

    check-cast p1, Lprd;

    iget v0, v0, Lro9;->b:I

    invoke-interface {p1, v0, v1, p0}, Lprd;->e(ILjrd;Ltjd;)V

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, La32;->a:B

    iget-object v1, p0, La32;->d:Ljava/lang/Object;

    iget-object v2, p0, La32;->c:Ljava/lang/Object;

    iget-object p0, p0, La32;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1e6

    check-cast p0, Lydi;

    check-cast v2, Ljn2;

    iget-object v0, v2, Ljn2;->c:Lr18;

    iget-object v3, v2, Ljn2;->a:Ljava/lang/String;

    check-cast v1, Ldp2;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v6

    const-string v7, "PRAGMA page_count"

    invoke-virtual {v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v6

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v6

    invoke-virtual {p0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v8

    const-string v9, "PRAGMA page_size"

    invoke-virtual {v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v8

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J

    move-result-wide v8

    mul-long/2addr v8, v6

    iget-object v6, p0, Lydi;->d:Lkn2;

    iget-wide v10, v6, Lkn2;->a:J

    cmp-long v7, v8, v10

    if-ltz v7, :cond_50

    const-wide/16 v0, 0x1

    sget-object p1, Lxyc;->d:Lxyc;

    invoke-virtual {p0, v0, v1, p1, v3}, Lydi;->n(JLxyc;Ljava/lang/String;)V

    const-wide/16 p0, -0x1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto/16 :goto_1d5

    :cond_50
    invoke-static {p1, v1}, Lydi;->k(Landroid/database/sqlite/SQLiteDatabase;Ldp2;)Ljava/lang/Long;

    move-result-object p0

    const/4 v7, 0x0

    if-eqz p0, :cond_5c

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    goto :goto_8f

    :cond_5c
    new-instance p0, Landroid/content/ContentValues;

    invoke-direct {p0}, Landroid/content/ContentValues;-><init>()V

    const-string v8, "backend_name"

    iget-object v9, v1, Ldp2;->a:Ljava/lang/String;

    invoke-virtual {p0, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v8, v1, Ldp2;->c:Lmyg;

    invoke-static {v8}, Lryg;->a(Lmyg;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "priority"

    invoke-virtual {p0, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v8, "next_request_ms"

    invoke-virtual {p0, v8, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v1, v1, Ldp2;->b:[B

    if-eqz v1, :cond_89

    const-string v8, "extras"

    invoke-static {v1, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v8, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_89
    const-string v1, "transport_contexts"

    invoke-virtual {p1, v1, v7, p0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    :goto_8f
    iget p0, v6, Lkn2;->e:I

    iget-object v1, v0, Lr18;->b:[B

    array-length v6, v1

    const/4 v10, 0x1

    if-gt v6, p0, :cond_99

    move v6, v10

    goto :goto_9a

    :cond_99
    move v6, v4

    :goto_9a
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    const-string v12, "context_id"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v11, v12, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v8, "transport_name"

    invoke-virtual {v11, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v8, v2, Ljn2;->d:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v8, "timestamp_ms"

    invoke-virtual {v11, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-wide v8, v2, Ljn2;->e:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v8, "uptime_ms"

    invoke-virtual {v11, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v0, v0, Lr18;->a:Lp28;

    iget-object v0, v0, Lp28;->a:Ljava/lang/String;

    const-string v3, "payload_encoding"

    invoke-virtual {v11, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "code"

    iget-object v3, v2, Ljn2;->b:Ljava/lang/Integer;

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "num_attempts"

    invoke-virtual {v11, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "inline"

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    if-eqz v6, :cond_e5

    move-object v0, v1

    goto :goto_e7

    :cond_e5
    new-array v0, v4, [B

    :goto_e7
    const-string v3, "payload"

    invoke-virtual {v11, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v0, "product_id"

    iget-object v3, v2, Ljn2;->g:Ljava/lang/Integer;

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "pseudonymous_id"

    iget-object v3, v2, Ljn2;->h:Ljava/lang/String;

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "experiment_ids_clear_blob"

    iget-object v3, v2, Ljn2;->i:[B

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v0, "experiment_ids_encrypted_blob"

    iget-object v3, v2, Ljn2;->j:[B

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    iget-object v0, v2, Ljn2;->k:Ljava/util/ArrayList;

    if-nez v0, :cond_10f

    new-array v0, v4, [B

    goto :goto_13e

    :cond_10f
    new-array v3, v4, [[B

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[B

    array-length v3, v0

    shl-int/lit8 v3, v3, 0x2

    array-length v5, v0

    move v8, v4

    move v9, v8

    :goto_11d
    if-ge v8, v5, :cond_126

    aget-object v12, v0, v8

    array-length v12, v12

    add-int/2addr v9, v12

    add-int/lit8 v8, v8, 0x1

    goto :goto_11d

    :cond_126
    add-int/2addr v9, v3

    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    array-length v5, v0

    :goto_12c
    if-ge v4, v5, :cond_13a

    aget-object v8, v0, v4

    array-length v9, v8

    invoke-virtual {v3, v9}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v8}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    add-int/lit8 v4, v4, 0x1

    goto :goto_12c

    :cond_13a
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    :goto_13e
    const-string v3, "experiment_ids_encrypted_list_blob"

    invoke-virtual {v11, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v0, "pseudonymous_id_update_receiver_class_name"

    iget-object v3, v2, Ljn2;->l:Ljava/lang/String;

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "events"

    invoke-virtual {p1, v0, v7, v11}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-string v0, "event_id"

    if-nez v6, :cond_18f

    array-length v5, v1

    int-to-double v5, v5

    int-to-double v8, p0

    div-double/2addr v5, v8

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v5, v5

    :goto_15d
    if-gt v10, v5, :cond_18f

    add-int/lit8 v6, v10, -0x1

    mul-int/2addr v6, p0

    mul-int v8, v10, p0

    array-length v9, v1

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v1, v6, v8}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v8, v0, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v9, "sequence_num"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v8, v9, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v9, "bytes"

    invoke-virtual {v8, v9, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v6, "event_payloads"

    invoke-virtual {p1, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v10, v10, 0x1

    goto :goto_15d

    :cond_18f
    iget-object p0, v2, Ljn2;->f:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v2, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "name"

    invoke-virtual {v2, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v5, "value"

    invoke-virtual {v2, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "event_metadata"

    invoke-virtual {p1, v1, v7, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_19d

    :cond_1d1
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    :goto_1d5
    return-object p0

    :pswitch_1d6
    check-cast p0, Ltjg;

    check-cast v2, Lzo4;

    check-cast v1, Lzn4;

    check-cast p1, Lokg;

    new-instance v0, Lbp4;

    iget-object p0, p0, Ltjg;->u:Lhp2;

    invoke-direct {v0, v2, v1, p0, p1}, Lbp4;-><init>(Lzo4;Lzn4;Lhp2;Lokg;)V

    return-object v0

    :pswitch_data_1e6
    .packed-switch 0x19
        :pswitch_1d6
    .end packed-switch
.end method

.method public final b(Lnod;)V
    .registers 4

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Laqd;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Landroid/os/Bundle;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Landroid/os/ResultReceiver;

    iget-object v0, v0, Laqd;->f:Lnpd;

    if-nez v1, :cond_12

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_12
    invoke-virtual {v0, p1}, Lnpd;->m(Lnod;)Lr0b;

    move-result-object p1

    if-eqz p0, :cond_23

    new-instance v0, Lhpd;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p0, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lm97;->a:Lm97;

    invoke-virtual {p1, v0, p0}, Lr0b;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :cond_23
    return-void
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 8

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lxj;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Lso3;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lli;

    new-instance v2, Ljv2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d00a1

    const/4 v5, 0x0

    invoke-virtual {v3, v4, p1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lov0;->a(Landroid/view/View;)Lov0;

    move-result-object p1

    invoke-direct {v2, p1, v0, v1, p0}, Ljv2;-><init>(Lov0;Lxj;Lso3;Lli;)V

    return-object v2
.end method

.method public final d(Lhq8;)Z
    .registers 5

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lnr8;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lp6l;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_28

    if-eqz p1, :cond_28

    invoke-virtual {p1, p0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0, v2, v2}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result p0

    if-eqz p0, :cond_28

    instance-of p0, p1, Lcom/opera/android/favorites/g;

    if-nez p0, :cond_28

    const/4 p0, 0x1

    return p0

    :cond_28
    return v2
.end method

.method public final e(II[BII)V
    .registers 7

    iget-object p1, p0, La32;->b:Ljava/lang/Object;

    check-cast p1, Lat5;

    iget-object p2, p0, La32;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p3, :cond_3a

    array-length p4, p3

    if-eqz p4, :cond_3a

    array-length p4, p3

    const/4 p5, 0x0

    invoke-static {p3, p5, p4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p3

    if-eqz p3, :cond_3a

    const/4 p4, 0x1

    iput-boolean p4, p1, Lat5;->l:Z

    const v0, 0x7f080264

    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    invoke-virtual {p2, p4}, Landroid/view/View;->setClipToOutline(Z)V

    const/4 p4, 0x0

    invoke-virtual {p2, p4}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    sget-object p4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p1, Lat5;->d:Lqs5;

    iget-boolean p1, p1, Lqs5;->s:Z

    if-eqz p1, :cond_3a

    invoke-virtual {p0, p5}, Landroid/view/View;->setVisibility(I)V

    :cond_3a
    return-void
.end method

.method public final execute()Ljava/lang/Object;
    .registers 7

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Ldv6;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Ldp2;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Ljn2;

    iget-object v2, v0, Ldv6;->d:Lydi;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v1, Ldp2;->c:Lmyg;

    const-string v4, "TRuntime.SQLiteEventStore"

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_26

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Storing event with priority="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_26
    new-instance v3, La32;

    const/16 v4, 0x1d

    invoke-direct {v3, v2, p0, v1, v4}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v0, Ldv6;->a:Lx77;

    const/4 v0, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lx77;->n(Ldp2;IZ)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Ljava/lang/Integer;)V
    .registers 6

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Lt3g;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Ls3g;

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p1, :cond_29

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v2, -0x1

    if-ne p1, v2, :cond_29

    const p1, 0x7f140c74

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljbd;

    const/16 v3, 0xa

    invoke-direct {v2, v0, v1, p0, v3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v2}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->C(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :cond_29
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, La32;->a:B

    iget-object v1, p0, La32;->d:Ljava/lang/Object;

    iget-object v2, p0, La32;->c:Ljava/lang/Object;

    iget-object p0, p0, La32;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_90

    check-cast p0, Lueh;

    move-object v5, v2

    check-cast v5, Landroid/net/Uri;

    move-object v7, v1

    check-cast v7, Ljava/lang/String;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_32

    const-string p1, "data:text/plain,"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    iget-object v3, p0, Lueh;->z:Lag7;

    iget-object v6, p0, Lueh;->D:Ljava/lang/String;

    iget-wide v9, p0, Lueh;->F:J

    new-instance v11, Ls2g;

    const/4 p1, 0x3

    invoke-direct {v11, p0, v5, v7, p1}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v11}, Lag7;->b(Landroid/net/Uri;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[BJLcom/opera/api/Callback;)V

    goto :goto_37

    :cond_32
    iget-object p0, p0, Lueh;->B:Lj3i;

    invoke-virtual {p0}, Lj3i;->invoke()Ljava/lang/Object;

    :goto_37
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_3a
    check-cast p0, Ljava/lang/String;

    check-cast v2, Lcom/opera/api/Callback;

    check-cast v1, Logf;

    check-cast p1, Logf;

    const/4 v0, 0x0

    if-eqz p1, :cond_5f

    iget-object v3, p1, Logf;->a:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5b

    invoke-static {v3}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5f

    :cond_5b
    invoke-interface {v2, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_7e

    :cond_5f
    if-eqz v1, :cond_7b

    iget-object p1, v1, Logf;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_77

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7b

    :cond_77
    invoke-interface {v2, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_7e

    :cond_7b
    invoke-interface {v2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_7e
    return-object v0

    :sswitch_7f
    check-cast p0, Lre7;

    check-cast v2, Landroid/net/Uri;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lre7;->a:Lxf7;

    iget-object p0, p0, Lxf7;->d:Lag7;

    iget-object p0, p0, Lag7;->b:Landroid/content/Context;

    invoke-static {p0, v2, v1}, Llg7;->d(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_90
    .sparse-switch
        0x7 -> :sswitch_7f
        0x15 -> :sswitch_3a
    .end sparse-switch
.end method

.method public final h(ILeyl;[I)Lcsh;
    .registers 13

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lbx6;

    iget-object v0, p0, La32;->c:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    move-object v8, p0

    check-cast v8, Ljava/lang/String;

    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object p0

    const/4 v0, 0x0

    move v4, v0

    :goto_15
    iget v0, p2, Leyl;->a:I

    if-ge v4, v0, :cond_28

    new-instance v1, Lfx6;

    aget v6, p3, v4

    move v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v8}, Lfx6;-><init>(ILeyl;ILbx6;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lv0b;->c(Ljava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_28
    invoke-virtual {p0}, Lz0b;->g()Lcsh;

    move-result-object p0

    return-object p0
.end method

.method public final i(ZZ)V
    .registers 6

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    sget v2, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz p2, :cond_32

    iget-object p2, v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->c:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lub2;

    iget-object v0, p2, Lub2;->a:Lumi;

    new-instance v2, Ls0o;

    invoke-direct {v2, v1}, Ls0o;-><init>(Ljava/lang/String;)V

    new-instance v1, Lrml;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lt02;

    const/16 v2, 0xb

    invoke-direct {v0, p2, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p2

    invoke-virtual {p2}, Lplk;->l()Loml;

    :cond_32
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final j(Lyo2;)V
    .registers 8

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lyhe;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Lzd4;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lbuk;

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/camera/view/PreviewView;

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-interface {v1}, Lzd4;->g()Lxd4;

    move-result-object v1

    invoke-interface {v1}, Lud4;->j()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_21

    move v1, v3

    goto :goto_22

    :cond_21
    move v1, v2

    :goto_22
    iget-object v4, v0, Landroidx/camera/view/PreviewView;->d:Lywg;

    iget-object p0, p0, Lbuk;->b:Landroid/util/Size;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v5, p1, Lyo2;->a:Landroid/graphics/Rect;

    iput-object v5, v4, Lywg;->b:Landroid/graphics/Rect;

    iget v5, p1, Lyo2;->b:I

    iput v5, v4, Lywg;->c:I

    iget v5, p1, Lyo2;->c:I

    iput v5, v4, Lywg;->e:I

    iput-object p0, v4, Lywg;->a:Landroid/util/Size;

    iput-boolean v1, v4, Lywg;->f:Z

    iget-boolean p0, p1, Lyo2;->d:Z

    iput-boolean p0, v4, Lywg;->g:Z

    iget-object p0, p1, Lyo2;->e:Landroid/graphics/Matrix;

    iput-object p0, v4, Lywg;->d:Landroid/graphics/Matrix;

    const/4 p0, -0x1

    if-eq v5, p0, :cond_55

    iget-object p0, v0, Landroidx/camera/view/PreviewView;->b:Ln1f;

    if-eqz p0, :cond_52

    instance-of p0, p0, Leuk;

    if-nez p0, :cond_55

    :cond_52
    iput-boolean v2, v0, Landroidx/camera/view/PreviewView;->e:Z

    goto :goto_57

    :cond_55
    iput-boolean v3, v0, Landroidx/camera/view/PreviewView;->e:Z

    :goto_57
    invoke-virtual {v0}, Landroidx/camera/view/PreviewView;->b()V

    return-void
.end method

.method public final k()V
    .registers 5

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lyhe;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Lxwg;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lzd4;

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/camera/view/PreviewView;

    iget-object v0, v0, Landroidx/camera/view/PreviewView;->g:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_12
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    sget-object v0, Laxg;->a:Laxg;

    invoke-virtual {v1, v0}, Lxwg;->b(Laxg;)V

    goto :goto_25

    :cond_1f
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eq v3, v1, :cond_12

    :goto_25
    iget-object v0, v1, Lxwg;->e:Lsr9;

    if-eqz v0, :cond_2f

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v2, v1, Lxwg;->e:Lsr9;

    :cond_2f
    invoke-interface {p0}, Lzd4;->b()Lx6f;

    move-result-object p0

    invoke-interface {p0, v1}, Lx6f;->f(Lv6f;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 6

    iget-object p1, p0, La32;->b:Ljava/lang/Object;

    check-cast p1, Lnrl;

    iget-object v0, p0, La32;->c:Ljava/lang/Object;

    check-cast v0, Li22;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Li22;

    const/16 v1, 0x8

    iget-object v2, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v2, v1}, Ld3o;->u(I)Z

    move-result v1

    iput-boolean v1, p1, Lnrl;->a:Z

    invoke-virtual {v0}, Li22;->invoke()Ljava/lang/Object;

    invoke-virtual {p0}, Li22;->invoke()Ljava/lang/Object;

    return-object p2
.end method

.method public final m(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)Lcom/google/android/gms/common/api/PendingResult;
    .registers 6

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lzo4;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, [I

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, [Lcom/google/android/gms/cast/MediaQueueItem;

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v0, v0, Lzo4;->l:[I

    array-length v3, v0

    if-ge v1, v3, :cond_16

    aget v2, v0, v1

    :cond_16
    const/4 v0, 0x0

    invoke-virtual {p1, p0, v2, v0}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->queueInsertItems([Lcom/google/android/gms/cast/MediaQueueItem;ILorg/json/JSONObject;)Lcom/google/android/gms/common/api/PendingResult;

    move-result-object p0

    return-object p0
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 11

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lmab;

    iget-object v0, p0, La32;->c:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lr0k;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lx5f;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->c:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-nez v0, :cond_21

    return-void

    :cond_21
    invoke-virtual {v5}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v6, v5, Lmab;->e:I

    new-instance v7, Lkab;

    const/4 p1, 0x1

    invoke-direct {v7, v5, p1}, Lkab;-><init>(Lmab;B)V

    new-instance v8, Llab;

    invoke-direct {v8, v5, p0, p1}, Llab;-><init>(Lmab;Lx5f;B)V

    new-instance v4, Lz8e;

    invoke-direct {v4, v5, p1}, Lz8e;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static/range {v1 .. v8}, Lu85;->d(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)Lu85;

    move-result-object p0

    iput-object p0, v5, Lmab;->d:Lu85;

    return-void
.end method

.method public final run()Lqwl;
    .registers 11

    iget-byte v0, p0, La32;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, La32;->d:Ljava/lang/Object;

    iget-object v3, p0, La32;->c:Ljava/lang/Object;

    iget-object p0, p0, La32;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_58

    move-object v5, p0

    check-cast v5, Lle9;

    move-object v7, v3

    check-cast v7, Lhu5;

    move-object v8, v2

    check-cast v8, Lhu5;

    iget-object p0, v5, Lle9;->d:Loji;

    invoke-virtual {p0}, Loji;->r()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_24

    new-instance v4, Lzd9;

    const/4 v9, 0x2

    invoke-direct/range {v4 .. v9}, Lzd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v4

    :cond_24
    return-object v1

    :pswitch_25
    check-cast p0, Lle9;

    move-object v5, v3

    check-cast v5, Lcn7;

    move-object v6, v2

    check-cast v6, Lj12;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3d

    new-instance v2, Lzd9;

    const/4 v7, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lzd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_3d
    return-object v1

    :pswitch_3e
    check-cast p0, Lle9;

    move-object v5, v3

    check-cast v5, Lue9;

    move-object v6, v2

    check-cast v6, Lpe9;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_56

    new-instance v2, Lzd9;

    const/4 v7, 0x1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lzd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_56
    return-object v1

    nop

    :pswitch_data_58
    .packed-switch 0xb
        :pswitch_3e
        :pswitch_25
    .end packed-switch
.end method

.method public final run()V
    .registers 7

    iget-byte v0, p0, La32;->a:B

    iget-object v1, p0, La32;->d:Ljava/lang/Object;

    iget-object v2, p0, La32;->c:Ljava/lang/Object;

    iget-object p0, p0, La32;->b:Ljava/lang/Object;

    check-cast p0, Lmnb;

    packed-switch v0, :pswitch_data_30

    check-cast v2, Lqqm;

    check-cast v1, Ljava/lang/String;

    .line 88
    iget-object v0, p0, Lmnb;->a:Lc2n;

    iget-object p0, p0, Lmnb;->d:Lpnb;

    invoke-virtual {v0, p0, v2, v1}, Lc2n;->onRedirectReceived(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/lang/String;)V

    return-void

    .line 89
    :pswitch_19
    check-cast v2, Lorg/chromium/net/UrlResponseInfo;

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 90
    iget-object v0, p0, Lmnb;->d:Lpnb;

    iget-object v3, v0, Lpnb;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v4, 0x5

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 91
    iget-object p0, p0, Lmnb;->a:Lc2n;

    invoke-virtual {p0, v0, v2, v1}, Lc2n;->onReadCompleted(Lorg/chromium/net/UrlRequest;Lorg/chromium/net/UrlResponseInfo;Ljava/nio/ByteBuffer;)V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x10
        :pswitch_19
    .end packed-switch
.end method

.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .registers 11

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Lcom/google/firebase/messaging/FirebaseMessaging;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Lhf7;

    check-cast p1, Ljava/lang/String;

    iget-object v2, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->b:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/firebase/messaging/FirebaseMessaging;->d(Landroid/content/Context;)Lhb6;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/firebase/messaging/FirebaseMessaging;->e()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->j:Lmxd;

    invoke-virtual {v4}, Lmxd;->a()Ljava/lang/String;

    move-result-object v4

    monitor-enter v2

    :try_start_1f
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_b1

    :try_start_23
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "token"

    invoke-virtual {v7, v8, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v8, "appVersion"

    invoke-virtual {v7, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "timestamp"

    invoke-virtual {v7, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_3b
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_3b} :catch_3c
    .catchall {:try_start_23 .. :try_end_3b} :catchall_b1

    goto :goto_41

    :catch_3c
    move-exception v4

    :try_start_3d
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_b1

    const/4 v4, 0x0

    :goto_41
    if-nez v4, :cond_45

    monitor-exit v2

    goto :goto_56

    :cond_45
    :try_start_45
    iget-object v5, v2, Lhb6;->a:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-static {v3, v1}, Lhb6;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v1, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_55
    .catchall {:try_start_45 .. :try_end_55} :catchall_b1

    monitor-exit v2

    :goto_56
    iget-object v1, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->d:Lx79;

    invoke-virtual {v1}, Lx79;->J()Z

    move-result v1

    if-nez v1, :cond_68

    if-eqz p0, :cond_68

    iget-object p0, p0, Lhf7;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_aa

    :cond_68
    const-string p0, "[DEFAULT]"

    iget-object v1, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->a:Lr49;

    invoke-virtual {v1}, Lr49;->a()V

    iget-object v2, v1, Lr49;->b:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_aa

    const-string p0, "FirebaseMessaging"

    const/4 v2, 0x3

    invoke-static {p0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_83

    invoke-virtual {v1}, Lr49;->a()V

    :cond_83
    iget-object p0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->d:Lx79;

    invoke-virtual {p0}, Lx79;->J()Z

    move-result p0

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "token"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p0, :cond_9b

    const-string p0, "com.google.firebase.messaging.FCM_REGISTERED"

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_a0

    :cond_9b
    const-string p0, "com.google.firebase.messaging.NEW_TOKEN"

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    :goto_a0
    new-instance p0, Lesg;

    iget-object v0, v0, Lcom/google/firebase/messaging/FirebaseMessaging;->b:Landroid/content/Context;

    invoke-direct {p0, v0}, Lesg;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Lesg;->z(Landroid/content/Intent;)Lcom/google/android/gms/tasks/Task;

    :cond_aa
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :goto_af
    :try_start_af
    monitor-exit v2
    :try_end_b0
    .catchall {:try_start_af .. :try_end_b0} :catchall_b1

    throw p0

    :catchall_b1
    move-exception p0

    goto :goto_af
.end method
