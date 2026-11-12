.class public final synthetic Lcxl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbf9;

.field public final synthetic c:Lzzh;


# direct methods
.method public synthetic constructor <init>(Lbf9;Lzzh;B)V
    .registers 4

    iput-byte p3, p0, Lcxl;->a:B

    iput-object p1, p0, Lcxl;->b:Lbf9;

    iput-object p2, p0, Lcxl;->c:Lzzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lcxl;->a:B

    const/16 v2, 0x1a

    const/4 v3, 0x0

    const/16 v4, 0x1b

    const/16 v5, 0x191

    sget-object v6, Lixl;->b:Lixl;

    const/4 v7, 0x0

    iget-object v8, v0, Lcxl;->c:Lzzh;

    iget-object v0, v0, Lcxl;->b:Lbf9;

    packed-switch v1, :pswitch_data_d8

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v7, v0, Lbf9;->p:Lmgh;

    invoke-virtual {v8, v6}, Lzzh;->run(Ljava/lang/Object;)V

    iget v1, v1, Lq43;->a:I

    if-ne v1, v5, :cond_25

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_25
    return-void

    :pswitch_26
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lbf9;->v(Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_43

    iget-object v5, v0, Lbf9;->p:Lmgh;

    new-instance v6, Lzzh;

    invoke-direct {v6, v8, v4}, Lzzh;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lzzh;

    invoke-direct {v4, v6, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3, v4}, Lbf9;->R(Ljava/util/List;ZLcom/opera/api/Callback;)Lcrk;

    move-result-object v0

    iput-object v0, v5, Lmgh;->b:Ljava/lang/Object;

    goto :goto_48

    :cond_43
    iput-object v7, v0, Lbf9;->p:Lmgh;

    invoke-virtual {v8, v6}, Lzzh;->run(Ljava/lang/Object;)V

    :goto_48
    return-void

    :pswitch_49
    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iput-object v7, v0, Lbf9;->p:Lmgh;

    invoke-virtual {v8, v6}, Lzzh;->run(Ljava/lang/Object;)V

    iget v1, v1, Lq43;->a:I

    if-ne v1, v5, :cond_59

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_59
    return-void

    :pswitch_5a
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v10, v0, Lbf9;->e:Lle9;

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v5

    const/4 v9, 0x2

    if-lt v5, v9, :cond_a2

    invoke-virtual {v0, v1}, Lbf9;->J(Ljava/util/List;)Lpwl;

    move-result-object v12

    invoke-virtual {v0}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v1

    if-eqz v12, :cond_9c

    if-eqz v1, :cond_9c

    iget-object v2, v0, Lbf9;->k:Ljava/util/HashSet;

    iget-object v3, v12, Lpwl;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v2, v0, Lbf9;->p:Lmgh;

    invoke-virtual {v1}, Ljavax/crypto/spec/SecretKeySpec;->getEncoded()[B

    move-result-object v11

    new-instance v13, Lnpl;

    const/4 v1, 0x6

    invoke-direct {v13, v0, v8, v1}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v14, Lcxl;

    const/4 v1, 0x1

    invoke-direct {v14, v0, v8, v1}, Lcxl;-><init>(Lbf9;Lzzh;B)V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Luf;

    const/4 v15, 0x4

    invoke-direct/range {v9 .. v15}, Luf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v9, v14}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object v0

    iput-object v0, v2, Lmgh;->b:Ljava/lang/Object;

    goto :goto_d6

    :cond_9c
    iput-object v7, v0, Lbf9;->p:Lmgh;

    invoke-virtual {v8, v6}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_d6

    :cond_a2
    invoke-virtual {v0, v1}, Lbf9;->v(Ljava/util/List;)Z

    move-result v5

    iget-object v6, v0, Lbf9;->p:Lmgh;

    if-eqz v5, :cond_bb

    new-instance v5, Lzzh;

    invoke-direct {v5, v8, v4}, Lzzh;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lzzh;

    invoke-direct {v4, v5, v2}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3, v4}, Lbf9;->R(Ljava/util/List;ZLcom/opera/api/Callback;)Lcrk;

    move-result-object v0

    iput-object v0, v6, Lmgh;->b:Ljava/lang/Object;

    goto :goto_d6

    :cond_bb
    new-instance v1, Lcxl;

    invoke-direct {v1, v0, v8, v9}, Lcxl;-><init>(Lbf9;Lzzh;B)V

    new-instance v2, Lcxl;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v8, v3}, Lcxl;-><init>(Lbf9;Lzzh;B)V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lvdi;

    const/16 v3, 0xa

    invoke-direct {v0, v10, v1, v2, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object v0

    iput-object v0, v6, Lmgh;->b:Ljava/lang/Object;

    :goto_d6
    return-void

    nop

    :pswitch_data_d8
    .packed-switch 0x0
        :pswitch_5a
        :pswitch_49
        :pswitch_26
    .end packed-switch
.end method
