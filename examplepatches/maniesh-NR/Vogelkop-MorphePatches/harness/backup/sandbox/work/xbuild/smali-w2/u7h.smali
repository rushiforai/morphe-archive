.class public final Lu7h;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lxo;

.field public final synthetic d:B

.field public final synthetic e:Lw7h;


# direct methods
.method public constructor <init>(Lw7h;Lxo;B)V
    .registers 5

    iput-byte p3, p0, Lu7h;->d:B

    const/4 v0, 0x0

    packed-switch p3, :pswitch_data_2a

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu7h;->e:Lw7h;

    invoke-direct {p0, p1, p2, v0}, Lu7h;-><init>(Lw7h;Lxo;S)V

    return-void

    :pswitch_f
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu7h;->e:Lw7h;

    invoke-direct {p0, p1, p2, v0}, Lu7h;-><init>(Lw7h;Lxo;S)V

    return-void

    :pswitch_18
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu7h;->e:Lw7h;

    invoke-direct {p0, p1, p2, v0}, Lu7h;-><init>(Lw7h;Lxo;S)V

    return-void

    :pswitch_21
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu7h;->e:Lw7h;

    invoke-direct {p0, p1, p2, v0}, Lu7h;-><init>(Lw7h;Lxo;S)V

    return-void

    :pswitch_data_2a
    .packed-switch 0x2
        :pswitch_21
        :pswitch_18
        :pswitch_f
    .end packed-switch
.end method

.method public constructor <init>(Lw7h;Lxo;Lil;)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Lu7h;->d:B

    .line 44
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lu7h;->e:Lw7h;

    const/4 p3, 0x0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Lu7h;-><init>(Lw7h;Lxo;S)V

    return-void
.end method

.method public constructor <init>(Lw7h;Lxo;S)V
    .registers 4

    .line 42
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p1}, Ln1;-><init>(Lw7h;)V

    .line 43
    iput-object p2, p0, Lu7h;->c:Lxo;

    return-void
.end method


# virtual methods
.method public final V(Lcz;)Ldz;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lu7h;->d:B

    iget-object v3, v0, Lu7h;->c:Lxo;

    iget-object v0, v0, Lu7h;->e:Lw7h;

    packed-switch v2, :pswitch_data_fa

    sget-object v2, Lep7;->a:Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqyf;

    new-instance v4, Lxo7;

    iget-object v5, v0, Lw7h;->a:Landroid/app/Activity;

    iget-object v6, v3, Lxo;->h:Lrm;

    iget-object v7, v3, Lxo;->i:Ljava/lang/String;

    iget-object v8, v0, Lw7h;->f:Lpyl;

    iget-object v9, v0, Lw7h;->j:Luwh;

    iget-object v10, v0, Lw7h;->w:Lqfb;

    invoke-virtual {v0, v1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v11

    iget-object v12, v0, Lw7h;->n:Li3j;

    iget v1, v3, Lvo;->e:I

    iget v3, v3, Lvo;->g:I

    invoke-static {v1, v3}, Lap;->b(II)Lap;

    move-result-object v13

    iget-object v14, v0, Lw7h;->s:Lr9g;

    invoke-direct/range {v4 .. v14}, Lxo7;-><init>(Landroid/app/Activity;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;)V

    invoke-virtual {v2, v4}, Lqyf;->s0(Lxo7;)Ldz;

    move-result-object v0

    return-object v0

    :pswitch_3b
    new-instance v2, Loo8;

    iget-object v4, v0, Lw7h;->a:Landroid/app/Activity;

    iget-object v5, v3, Lxo;->h:Lrm;

    iget-object v6, v3, Lxo;->i:Ljava/lang/String;

    iget-object v7, v0, Lw7h;->f:Lpyl;

    iget-object v8, v0, Lw7h;->j:Luwh;

    iget-object v9, v0, Lw7h;->w:Lqfb;

    invoke-virtual {v0, v1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v10

    iget-object v11, v0, Lw7h;->n:Li3j;

    iget v1, v3, Lvo;->e:I

    iget v3, v3, Lvo;->g:I

    invoke-static {v1, v3}, Lap;->b(II)Lap;

    move-result-object v12

    iget-object v13, v0, Lw7h;->s:Lr9g;

    move-object v3, v4

    sget-object v4, Lyo;->f:Lyo;

    const/4 v14, 0x1

    move-object v1, v2

    const-string v2, "oo8"

    invoke-direct/range {v1 .. v14}, Loo8;-><init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;B)V

    return-object v1

    :pswitch_64
    new-instance v2, Loo8;

    iget-object v4, v0, Lw7h;->a:Landroid/app/Activity;

    iget-object v6, v3, Lxo;->h:Lrm;

    iget-object v7, v3, Lxo;->i:Ljava/lang/String;

    iget-object v8, v0, Lw7h;->f:Lpyl;

    iget-object v9, v0, Lw7h;->j:Luwh;

    iget-object v10, v0, Lw7h;->w:Lqfb;

    invoke-virtual {v0, v1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v11

    iget-object v12, v0, Lw7h;->n:Li3j;

    iget v1, v3, Lvo;->e:I

    iget v3, v3, Lvo;->g:I

    invoke-static {v1, v3}, Lap;->b(II)Lap;

    move-result-object v13

    iget-object v14, v0, Lw7h;->s:Lr9g;

    sget-object v5, Lyo;->g:Lyo;

    const/4 v15, 0x0

    const-string v3, "FakeAdAdsProvider"

    invoke-direct/range {v2 .. v15}, Loo8;-><init>(Ljava/lang/String;Landroid/app/Activity;Lyo;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;B)V

    return-object v2

    :pswitch_8b
    new-instance v2, Ls00;

    iget-object v4, v0, Lw7h;->a:Landroid/app/Activity;

    iget-object v5, v0, Lw7h;->c:Lcom/opera/android/settings/SettingsManager;

    iget-object v6, v0, Lw7h;->v:Lesk;

    iget-object v7, v3, Lxo;->h:Lrm;

    iget-object v8, v3, Lxo;->i:Ljava/lang/String;

    iget-object v9, v0, Lw7h;->f:Lpyl;

    iget-object v10, v0, Lw7h;->j:Luwh;

    iget-object v11, v0, Lw7h;->w:Lqfb;

    invoke-virtual {v0, v1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v12

    iget-object v13, v0, Lw7h;->n:Li3j;

    iget v1, v3, Lvo;->e:I

    iget v3, v3, Lvo;->g:I

    invoke-static {v1, v3}, Lap;->b(II)Lap;

    move-result-object v14

    iget-object v15, v0, Lw7h;->s:Lr9g;

    iget-object v1, v0, Lw7h;->m:Li5o;

    iget-object v0, v0, Lw7h;->p:Lzv9;

    move-object/from16 v17, v0

    move-object/from16 v16, v1

    move-object v3, v2

    invoke-direct/range {v3 .. v17}, Ls00;-><init>(Landroid/app/Activity;Lcom/opera/android/settings/SettingsManager;Lesk;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;Li5o;Lzv9;)V

    return-object v3

    :pswitch_ba
    new-instance v4, Lao;

    iget-object v5, v0, Lw7h;->a:Landroid/app/Activity;

    iget-object v6, v0, Lw7h;->b:Lumi;

    iget-object v7, v3, Lxo;->h:Lrm;

    iget-object v8, v3, Lxo;->i:Ljava/lang/String;

    iget-object v9, v0, Lw7h;->f:Lpyl;

    iget-object v10, v0, Lw7h;->j:Luwh;

    iget-object v11, v0, Lw7h;->w:Lqfb;

    invoke-virtual {v0, v1}, Lw7h;->b(Lcz;)Lr68;

    move-result-object v12

    iget-object v13, v0, Lw7h;->n:Li3j;

    iget v1, v3, Lvo;->e:I

    iget v2, v3, Lvo;->g:I

    invoke-static {v1, v2}, Lap;->b(II)Lap;

    move-result-object v14

    iget-object v15, v0, Lw7h;->s:Lr9g;

    iget-boolean v1, v3, Lxo;->j:Z

    new-instance v2, Lt7h;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lt7h;-><init>(Lw7h;B)V

    new-instance v3, Lt7h;

    move/from16 v16, v1

    const/4 v1, 0x4

    invoke-direct {v3, v0, v1}, Lt7h;-><init>(Lw7h;B)V

    new-instance v1, Lt7h;

    move-object/from16 v17, v2

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Lt7h;-><init>(Lw7h;B)V

    move-object/from16 v19, v1

    move-object/from16 v18, v3

    invoke-direct/range {v4 .. v19}, Lao;-><init>(Landroid/app/Activity;Lumi;Lrm;Ljava/lang/String;Lpyl;Luwh;Lqfb;Lr68;Li3j;Lap;Lr9g;ZLesk;Lesk;Lesk;)V

    return-object v4

    :pswitch_data_fa
    .packed-switch 0x0
        :pswitch_ba
        :pswitch_8b
        :pswitch_64
        :pswitch_3b
    .end packed-switch
.end method

.method public final W()Lcz;
    .registers 4

    new-instance v0, Lcz;

    iget-object p0, p0, Lu7h;->c:Lxo;

    iget-object v1, p0, Lvo;->d:Lyo;

    iget-object v2, p0, Lxo;->h:Lrm;

    iget-object p0, p0, Lxo;->i:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0}, Lcz;-><init>(Lyo;Lrm;Ljava/lang/String;)V

    return-object v0
.end method
