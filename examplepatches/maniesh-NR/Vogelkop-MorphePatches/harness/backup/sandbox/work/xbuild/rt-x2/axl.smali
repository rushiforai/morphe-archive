.class public final synthetic Laxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbf9;


# direct methods
.method public synthetic constructor <init>(Lbf9;B)V
    .registers 3

    iput-byte p2, p0, Laxl;->a:B

    iput-object p1, p0, Laxl;->b:Lbf9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Laxl;->a:B

    const-string v2, "AES"

    const/4 v3, 0x0

    const/16 v4, 0x191

    const/4 v5, 0x0

    iget-object v0, v0, Laxl;->b:Lbf9;

    packed-switch v1, :pswitch_data_18e

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->m:Lzd2;

    iget v1, v1, Lq43;->a:I

    if-ne v1, v4, :cond_1c

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_1c
    return-void

    :pswitch_1d
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->l:Lzd2;

    return-void

    :pswitch_24
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->n:Lzd2;

    invoke-virtual {v0}, Lbf9;->k()V

    iget-object v1, v0, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_38

    invoke-virtual {v0}, Lbf9;->C()V

    :cond_38
    return-void

    :pswitch_39
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->p:Lmgh;

    iget-object v1, v0, Lbf9;->q:Lh5k;

    iget-object v2, v1, Lh5k;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/api/Callback;

    if-eqz v1, :cond_50

    iget-object v1, v1, Lh5k;->c:Ljava/lang/Object;

    check-cast v1, Lq65;

    invoke-virtual {v1}, Ln1;->S()V

    iput-object v5, v0, Lbf9;->q:Lh5k;

    :cond_50
    if-eqz v2, :cond_55

    invoke-interface {v2, v5}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_55
    return-void

    :pswitch_56
    move-object/from16 v1, p1

    check-cast v1, Lrwl;

    iget-object v4, v0, Lbf9;->a:Loji;

    iput-object v5, v0, Lbf9;->p:Lmgh;

    iget-object v6, v0, Lbf9;->q:Lh5k;

    if-eqz v6, :cond_146

    iget-object v7, v6, Lh5k;->b:Ljava/lang/Object;

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_6a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7e

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lpwl;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v10, v9, Lowl;

    if-eqz v10, :cond_6a

    goto :goto_7f

    :cond_7e
    move-object v9, v5

    :goto_7f
    if-nez v9, :cond_a0

    iget-boolean v8, v6, Lh5k;->a:Z

    if-eqz v8, :cond_a0

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_89
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_a0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lpwl;

    iget-object v11, v10, Lpwl;->a:Ljava/lang/String;

    iget-object v12, v1, Lrwl;->a:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_89

    move-object v9, v10

    :cond_a0
    iget-object v8, v0, Lbf9;->q:Lh5k;

    if-eqz v8, :cond_ad

    iget-object v8, v8, Lh5k;->c:Ljava/lang/Object;

    check-cast v8, Lq65;

    invoke-virtual {v8}, Ln1;->S()V

    iput-object v5, v0, Lbf9;->q:Lh5k;

    :cond_ad
    invoke-virtual {v4}, Loji;->z()Ljava/security/PrivateKey;

    move-result-object v8

    if-eqz v8, :cond_133

    if-eqz v9, :cond_133

    iget-object v10, v9, Lpwl;->a:Ljava/lang/String;

    iget-object v11, v1, Lrwl;->a:Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_133

    invoke-static {v1, v9, v8}, Lbf9;->e(Lrwl;Lpwl;Ljava/security/PrivateKey;)[B

    move-result-object v1

    if-nez v1, :cond_c7

    move-object v8, v5

    goto :goto_cd

    :cond_c7
    new-instance v8, Ljavax/crypto/spec/SecretKeySpec;

    array-length v11, v1

    invoke-direct {v8, v1, v3, v11, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    :goto_cd
    if-eqz v8, :cond_134

    invoke-virtual {v0, v7}, Lbf9;->J(Ljava/util/List;)Lpwl;

    invoke-virtual {v0, v8}, Lbf9;->M(Ljavax/crypto/SecretKey;)V

    invoke-virtual {v0}, Lbf9;->q()Lpc9;

    move-result-object v1

    if-eqz v1, :cond_e5

    new-instance v2, Ldg7;

    const/16 v3, 0x1a

    invoke-direct {v2, v1, v3}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v5, v2}, Lbf9;->p(Ljava/lang/Long;Lcom/opera/api/Callback;)Lih4;

    :cond_e5
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "action"

    const-string v3, "connected"

    :try_start_ee
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_f5
    .catch Lorg/json/JSONException; {:try_start_ee .. :try_end_f5} :catch_12e

    const-string v2, "device_id"

    invoke-virtual {v4}, Loji;->u()Ljava/lang/String;

    move-result-object v3

    :try_start_fb
    invoke-static {v3}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_102
    .catch Lorg/json/JSONException; {:try_start_fb .. :try_end_102} :catch_129

    iget-object v12, v0, Lbf9;->e:Lle9;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v10}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    new-instance v15, Lrl;

    const/4 v1, 0x4

    invoke-direct {v15, v1}, Lrl;-><init>(B)V

    new-instance v1, Lvk2;

    const/16 v2, 0xd

    invoke-direct {v1, v2}, Lvk2;-><init>(B)V

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Luf;

    const/16 v17, 0x5

    move-object/from16 v16, v1

    invoke-direct/range {v11 .. v17}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v11, v1}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    goto :goto_134

    :catch_129
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_146

    :catch_12e
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_146

    :cond_133
    move-object v8, v5

    :cond_134
    :goto_134
    if-nez v8, :cond_139

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_139
    iget-object v0, v6, Lh5k;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/api/Callback;

    if-eqz v0, :cond_146

    if-eqz v8, :cond_143

    iget-object v5, v9, Lpwl;->a:Ljava/lang/String;

    :cond_143
    invoke-interface {v0, v5}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_146
    :goto_146
    return-void

    :pswitch_147
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->r:Lzd2;

    return-void

    :pswitch_14e
    move-object/from16 v1, p1

    check-cast v1, Lrwl;

    iput-object v5, v0, Lbf9;->r:Lzd2;

    iget-object v4, v0, Lbf9;->k:Ljava/util/HashSet;

    iget-object v6, v1, Lrwl;->a:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17f

    iget-object v4, v1, Lrwl;->a:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lbf9;->l(Ljava/lang/String;)Lpwl;

    move-result-object v4

    iget-object v6, v0, Lbf9;->a:Loji;

    invoke-virtual {v6}, Loji;->z()Ljava/security/PrivateKey;

    move-result-object v6

    if-eqz v6, :cond_17f

    if-eqz v4, :cond_17f

    invoke-static {v1, v4, v6}, Lbf9;->e(Lrwl;Lpwl;Ljava/security/PrivateKey;)[B

    move-result-object v1

    if-eqz v1, :cond_17a

    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    array-length v4, v1

    invoke-direct {v5, v1, v3, v4, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    :cond_17a
    if-eqz v5, :cond_17f

    invoke-virtual {v0, v5}, Lbf9;->M(Ljavax/crypto/SecretKey;)V

    :cond_17f
    return-void

    :pswitch_180
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v5, v0, Lbf9;->o:Lih4;

    iget v1, v1, Lq43;->a:I

    if-ne v1, v4, :cond_18d

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_18d
    return-void

    :pswitch_data_18e
    .packed-switch 0x0
        :pswitch_180
        :pswitch_14e
        :pswitch_147
        :pswitch_56
        :pswitch_39
        :pswitch_24
        :pswitch_1d
    .end packed-switch
.end method
