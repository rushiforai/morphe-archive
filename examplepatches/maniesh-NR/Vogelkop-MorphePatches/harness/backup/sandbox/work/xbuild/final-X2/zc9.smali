.class public final synthetic Lzc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrma;


# direct methods
.method public synthetic constructor <init>(Lrma;B)V
    .registers 3

    iput-byte p2, p0, Lzc9;->a:B

    iput-object p1, p0, Lzc9;->b:Lrma;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    iget-byte v1, v0, Lzc9;->a:B

    const-string v2, "device_id"

    const/4 v3, 0x3

    const/4 v4, 0x0

    iget-object v0, v0, Lzc9;->b:Lrma;

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x1

    packed-switch v1, :pswitch_data_196

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v8, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v8, Lbf9;

    iget-object v9, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v9, Lq65;

    iget-object v10, v0, Lrma;->f:Ljava/lang/Object;

    move-object v12, v10

    check-cast v12, Lcd9;

    iget v10, v0, Lrma;->b:I

    if-ne v10, v3, :cond_97

    iput v5, v0, Lrma;->b:I

    iput-object v4, v0, Lrma;->i:Ljava/lang/Object;

    if-nez v1, :cond_32

    invoke-virtual {v9}, Ln1;->S()V

    invoke-virtual {v12, v6}, Lcd9;->A0(I)V

    goto :goto_97

    :cond_32
    iput v7, v12, Lcd9;->n:I

    iput-object v4, v12, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {v12}, Lcd9;->y0()V

    invoke-virtual {v8}, Lbf9;->r()I

    move-result v7

    if-lt v7, v6, :cond_45

    invoke-virtual {v8, v1}, Lbf9;->l(Ljava/lang/String;)Lpwl;

    move-result-object v6

    if-nez v6, :cond_47

    :cond_45
    move-object v7, v4

    goto :goto_5e

    :cond_47
    iget-object v7, v8, Lbf9;->d:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    invoke-interface {v7, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v7, Lfxl;

    iget-object v10, v6, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-direct {v7, v6, v2}, Lfxl;-><init>(Lpwl;Z)V

    :goto_5e
    if-nez v7, :cond_6a

    invoke-virtual {v8, v1}, Lbf9;->g(Ljava/lang/String;)V

    invoke-virtual {v9}, Ln1;->S()V

    invoke-virtual {v12, v3}, Lcd9;->A0(I)V

    goto :goto_97

    :cond_6a
    iget-object v2, v7, Lfxl;->a:Lpwl;

    iget-object v3, v2, Lpwl;->f:Ljava/security/PublicKey;

    invoke-static {v3}, Lp36;->e(Ljava/security/PublicKey;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, LJ/N;->Mmz54ji0(Ljava/lang/Object;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    const/4 v3, 0x4

    iput v3, v0, Lrma;->b:I

    iput-object v4, v0, Lrma;->i:Ljava/lang/Object;

    iget-object v14, v2, Lpwl;->c:Ljava/lang/String;

    new-instance v15, Lhu5;

    const/16 v2, 0xc

    invoke-direct {v15, v0, v1, v2}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v11, Lqn;

    const/16 v16, 0xa

    invoke-direct/range {v11 .. v16}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12, v11}, Lcd9;->z0(Ljava/lang/Runnable;)V

    :cond_97
    :goto_97
    return-void

    :pswitch_98
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget v8, v0, Lrma;->b:I

    if-ne v8, v6, :cond_195

    iput v5, v0, Lrma;->b:I

    iput-object v4, v0, Lrma;->i:Ljava/lang/Object;

    iget-object v8, v0, Lrma;->g:Ljava/lang/Object;

    check-cast v8, Lq65;

    invoke-virtual {v8}, Ln1;->S()V

    iget-object v8, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v8, Lcd9;

    iput v7, v8, Lcd9;->n:I

    iput-object v4, v8, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {v8}, Lcd9;->y0()V

    iget-object v8, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v8, Lq65;

    iget-object v9, v0, Lrma;->e:Ljava/lang/Object;

    check-cast v9, Lumi;

    const-wide/16 v10, 0x78

    sget-object v12, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v9, v10, v11, v12}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-object v8, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v8, Lbf9;

    new-instance v9, Lzc9;

    invoke-direct {v9, v0, v7}, Lzc9;-><init>(Lrma;B)V

    invoke-virtual {v8}, Lbf9;->r()I

    move-result v10

    sget-object v11, Lbf9;->A:Lbxl;

    if-ge v10, v6, :cond_13d

    iget-object v10, v8, Lbf9;->h:Lxl;

    invoke-virtual {v10}, Lxl;->k()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_128

    iget-object v12, v8, Lbf9;->d:Lj4c;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/SharedPreferences;

    invoke-interface {v12, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_128

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_f4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_128

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lpwl;

    iget-object v14, v13, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_f4

    iget-object v13, v13, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_f4

    iget-object v1, v8, Lbf9;->p:Lmgh;

    if-eqz v1, :cond_11a

    invoke-virtual {v8, v10, v5, v9}, Lbf9;->R(Ljava/util/List;ZLcom/opera/api/Callback;)Lcrk;

    move-result-object v11

    goto/16 :goto_191

    :cond_11a
    new-instance v11, Lmgh;

    invoke-virtual {v8, v10, v7, v9}, Lbf9;->R(Ljava/util/List;ZLcom/opera/api/Callback;)Lcrk;

    move-result-object v1

    const/16 v2, 0x8

    invoke-direct {v11, v1, v4, v2}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v11, v8, Lbf9;->p:Lmgh;

    goto :goto_191

    :cond_128
    sget-object v2, Lp36;->a:Lii;

    :try_start_12a
    const-string v2, "AES"

    invoke-static {v2}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v2

    const/16 v5, 0x100

    invoke-virtual {v2, v5}, Ljavax/crypto/KeyGenerator;->init(I)V

    invoke-virtual {v2}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v4
    :try_end_139
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_12a .. :try_end_139} :catch_139

    :catch_139
    invoke-virtual {v8, v4}, Lbf9;->M(Ljavax/crypto/SecretKey;)V

    goto :goto_148

    :cond_13d
    invoke-virtual {v8}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v2

    if-nez v2, :cond_147

    invoke-virtual {v9, v4}, Lzc9;->run(Ljava/lang/Object;)V

    goto :goto_191

    :cond_147
    move-object v4, v2

    :goto_148
    invoke-interface {v4}, Ljava/security/Key;->getEncoded()[B

    move-result-object v14

    new-instance v2, Lhu5;

    const/16 v4, 0x11

    invoke-direct {v2, v9, v1, v4}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8}, Lbf9;->r()I

    move-result v4

    if-lt v4, v6, :cond_18c

    iget-object v4, v8, Lbf9;->n:Lzd2;

    if-nez v4, :cond_18c

    invoke-virtual {v8, v1}, Lbf9;->l(Ljava/lang/String;)Lpwl;

    move-result-object v15

    if-nez v15, :cond_169

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Lhu5;->run(Ljava/lang/Object;)V

    goto :goto_191

    :cond_169
    iget-object v13, v8, Lbf9;->e:Lle9;

    new-instance v1, Lld9;

    invoke-direct {v1, v2, v7}, Lld9;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Ldg7;

    const/16 v5, 0x19

    invoke-direct {v4, v2, v5}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v12, Luf;

    const/16 v18, 0x4

    move-object/from16 v16, v1

    move-object/from16 v17, v4

    invoke-direct/range {v12 .. v18}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v1, v17

    invoke-static {v12, v1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object v11

    goto :goto_191

    :cond_18c
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Lhu5;->run(Ljava/lang/Object;)V

    :goto_191
    iput v3, v0, Lrma;->b:I

    iput-object v11, v0, Lrma;->i:Ljava/lang/Object;

    :cond_195
    return-void

    :pswitch_data_196
    .packed-switch 0x0
        :pswitch_98
    .end packed-switch
.end method
