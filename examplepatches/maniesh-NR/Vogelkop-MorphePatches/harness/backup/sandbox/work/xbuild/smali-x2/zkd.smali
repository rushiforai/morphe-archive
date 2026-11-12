.class public final Lzkd;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Lmv1;

.field public c:Ltjg;

.field public final d:Lxkd;

.field public final e:Lwe7;

.field public f:Lykd;

.field public g:Lx79;

.field public h:J

.field public i:I

.field public j:Z

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lx5f;Lmv1;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lve7;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lve7;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lxkd;

    invoke-direct {v2, p0}, Lxkd;-><init>(Lzkd;)V

    iput-object v2, p0, Lzkd;->d:Lxkd;

    new-instance v2, Lwe7;

    invoke-direct {v2, p0, v0, v1}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v2, p0, Lzkd;->e:Lwe7;

    iput-object p1, p0, Lzkd;->a:Lx5f;

    iput-object p2, p0, Lzkd;->b:Lmv1;

    return-void
.end method

.method public static R(Ltjg;Lqjd;)Lrh0;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p1, Lqjd;->e:Lvjd;

    invoke-static {p0}, Lsfe;->d0(Lvjd;)Landroid/net/Uri;

    move-result-object p0

    if-nez p0, :cond_18

    iget-object p0, p1, Lqjd;->b:Lmjd;

    if-eqz p0, :cond_12

    iget-object p0, p0, Lmjd;->a:Landroid/net/Uri;

    goto :goto_18

    :cond_12
    const-string p0, ""

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    :cond_18
    :goto_18
    invoke-static {p0}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result p0

    if-eqz p0, :cond_21

    sget-object p0, Lrh0;->c:Lrh0;

    return-object p0

    :cond_21
    sget-object p0, Lrh0;->b:Lrh0;

    return-object p0
.end method


# virtual methods
.method public final S(Lykd;Lx79;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lzkd;->f:Lykd;

    if-eqz v2, :cond_f

    invoke-virtual {v2, v1}, Lykd;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    return-void

    :cond_f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-object v4, v0, Lzkd;->f:Lykd;

    if-eqz v4, :cond_d1

    iget-wide v5, v0, Lzkd;->h:J

    sub-long v5, v2, v5

    iget-object v7, v4, Lykd;->a:Luh0;

    iget-object v8, v4, Lykd;->b:Lrh0;

    iget-object v9, v4, Lykd;->c:Lsh0;

    iget-object v10, v4, Lykd;->d:Lqh0;

    iget-boolean v4, v4, Lykd;->e:Z

    iget-object v11, v0, Lzkd;->a:Lx5f;

    iget-boolean v12, v11, Lx5f;->h:Z

    if-nez v12, :cond_2e

    move-wide/from16 v16, v2

    goto :goto_9b

    :cond_2e
    iget-object v12, v11, Lx5f;->d:Lzpa;

    new-instance v13, Lth0;

    const/4 v14, -0x1

    const/4 v15, 0x4

    move-wide/from16 v16, v2

    const/16 v2, 0x98b

    invoke-direct {v13, v2, v14, v15}, Ljf0;-><init>(III)V

    const/4 v2, 0x1

    invoke-virtual {v13, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvh0;

    if-nez v3, :cond_51

    invoke-static {}, Lzpa;->A()Lvh0;

    move-result-object v3

    invoke-virtual {v13, v2, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v13, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvh0;

    :cond_51
    invoke-virtual {v3, v2, v2, v8}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v8, 0x0

    invoke-virtual {v3, v8, v2, v9}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez v10, :cond_5c

    move v9, v8

    goto :goto_5d

    :cond_5c
    move v9, v2

    :goto_5d
    const/4 v14, 0x2

    invoke-virtual {v3, v14, v9, v10}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v13, v14, v2, v7}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v13, v8, v2, v5, v6}, Ljf0;->p(IIJ)V

    const/4 v3, 0x3

    invoke-virtual {v13, v3, v2, v4}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v12}, Lx56;->A(Lzpa;)Luc0;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {v4, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_88

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_88

    new-instance v2, Lhf0;

    invoke-direct {v2, v4, v5, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_95

    :cond_88
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v5, v2, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, v4, v5, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_95
    invoke-virtual {v2, v13}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11, v3}, Lx5f;->U0(Lx56;)V

    :goto_9b
    iget-object v2, v0, Lzkd;->g:Lx79;

    if-eqz v2, :cond_d3

    iget-wide v3, v0, Lzkd;->h:J

    sub-long v5, v16, v3

    sget-object v7, Lpn7;->b:Lon7;

    sget-object v7, Lun7;->d:Lun7;

    invoke-static {v3, v4, v7}, Lcs5;->y0(JLun7;)J

    move-result-wide v3

    invoke-static {v5, v6, v7}, Lcs5;->y0(JLun7;)J

    move-result-wide v5

    iget-object v7, v2, Lx79;->a:Ljava/lang/Object;

    check-cast v7, Luy8;

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v9

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v11

    iget-object v3, v2, Lx79;->b:Ljava/lang/Object;

    move-object v13, v3

    check-cast v13, Ljava/lang/String;

    iget-object v2, v2, Lx79;->d:Ljava/lang/Object;

    move-object v14, v2

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Lky8;

    invoke-direct/range {v8 .. v14}, Lky8;-><init>(JJLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Luy8;->c(Ldy8;)V

    goto :goto_d3

    :cond_d1
    move-wide/from16 v16, v2

    :cond_d3
    :goto_d3
    iput-object v1, v0, Lzkd;->f:Lykd;

    move-wide/from16 v1, v16

    iput-wide v1, v0, Lzkd;->h:J

    move-object/from16 v1, p2

    iput-object v1, v0, Lzkd;->g:Lx79;

    return-void
.end method

.method public final T()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lzkd;->e:Lwe7;

    iget-object v2, v1, Lhkg;->a:Lgig;

    const/4 v3, 0x0

    if-eqz v2, :cond_e

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v1

    goto :goto_f

    :cond_e
    move-object v1, v3

    :goto_f
    if-eqz v1, :cond_1c

    invoke-interface {v1}, Lgig;->e0()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Lgig;->g()Lqjd;

    move-result-object v2

    goto :goto_1d

    :cond_1c
    move-object v2, v3

    :goto_1d
    const/4 v4, 0x2

    const-string v5, "com.opera.android.media.AI_POD_REQUEST_ID"

    if-eqz v2, :cond_158

    iget-object v6, v2, Lqjd;->e:Lvjd;

    iget-object v7, v6, Lvjd;->I:Landroid/os/Bundle;

    iget-object v6, v6, Lvjd;->I:Landroid/os/Bundle;

    if-eqz v7, :cond_31

    const-string v8, "com.opera.android.media.AI_POD_ID"

    invoke-virtual {v7, v8, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_32

    :cond_31
    move-object v7, v3

    :goto_32
    if-eqz v6, :cond_3b

    const-string v8, "com.opera.android.media.AI_POD_CATEGORY_ID"

    invoke-virtual {v6, v8, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_3c

    :cond_3b
    move-object v8, v3

    :goto_3c
    if-eqz v6, :cond_43

    invoke-virtual {v6, v5, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_44

    :cond_43
    move-object v6, v3

    :goto_44
    iget-object v9, v0, Lzkd;->c:Ltjg;

    iget-object v9, v9, Ltjg;->w:Lsjg;

    const/4 v10, 0x0

    if-eqz v9, :cond_4e

    iget v9, v9, Lsjg;->a:I

    goto :goto_4f

    :cond_4e
    move v9, v10

    :goto_4f
    iget v11, v0, Lzkd;->i:I

    const/4 v12, 0x5

    if-nez v11, :cond_5a

    if-eq v9, v12, :cond_5a

    sget-object v9, Luh0;->g:Luh0;

    :goto_58
    move-object v14, v9

    goto :goto_80

    :cond_5a
    if-eqz v9, :cond_7d

    invoke-static {v9}, Lvep;->A(I)I

    move-result v9

    packed-switch v9, :pswitch_data_190

    goto :goto_7d

    :pswitch_64
    sget-object v9, Luh0;->j:Luh0;

    goto :goto_58

    :pswitch_67
    sget-object v9, Luh0;->i:Luh0;

    goto :goto_58

    :pswitch_6a
    sget-object v9, Luh0;->f:Luh0;

    goto :goto_58

    :pswitch_6d
    sget-object v9, Luh0;->c:Luh0;

    goto :goto_58

    :pswitch_70
    sget-object v9, Luh0;->e:Luh0;

    goto :goto_58

    :pswitch_73
    iget-boolean v9, v0, Lzkd;->j:Z

    if-eqz v9, :cond_7a

    sget-object v9, Luh0;->d:Luh0;

    goto :goto_58

    :cond_7a
    sget-object v9, Luh0;->b:Luh0;

    goto :goto_58

    :cond_7d
    :goto_7d
    sget-object v9, Luh0;->h:Luh0;

    goto :goto_58

    :goto_80
    iget-object v9, v0, Lzkd;->c:Ltjg;

    invoke-static {v9, v2}, Lzkd;->R(Ltjg;Lqjd;)Lrh0;

    move-result-object v15

    iget-object v9, v0, Lzkd;->c:Ltjg;

    invoke-virtual {v9, v2}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object v2

    sget-object v9, Lkg7;->g:Lkg7;

    if-ne v2, v9, :cond_95

    sget-object v2, Lsh0;->b:Lsh0;

    :goto_92
    move-object/from16 v16, v2

    goto :goto_98

    :cond_95
    sget-object v2, Lsh0;->c:Lsh0;

    goto :goto_92

    :goto_98
    const/4 v2, 0x1

    if-eqz v8, :cond_105

    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v9

    const/4 v11, -0x1

    sparse-switch v9, :sswitch_data_1a2

    goto :goto_e7

    :sswitch_a4
    const-string v9, "voice_top_news"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e7

    const/4 v12, 0x6

    goto :goto_ea

    :sswitch_ae
    const-string v9, "voice_roundup"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_ea

    goto :goto_e7

    :sswitch_b7
    const-string v9, "voice_crime"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e7

    const/4 v12, 0x4

    goto :goto_ea

    :sswitch_c1
    const-string v9, "voice_sports"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e7

    const/4 v12, 0x3

    goto :goto_ea

    :sswitch_cb
    const-string v9, "voice_politics"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e7

    move v12, v4

    goto :goto_ea

    :sswitch_d5
    const-string v9, "voice_entertainment"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e7

    move v12, v2

    goto :goto_ea

    :sswitch_df
    const-string v9, "voice_news"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_e9

    :cond_e7
    :goto_e7
    move v12, v11

    goto :goto_ea

    :cond_e9
    move v12, v10

    :cond_ea
    :goto_ea
    packed-switch v12, :pswitch_data_1c0

    goto :goto_105

    :pswitch_ee
    sget-object v9, Lqh0;->d:Lqh0;

    :goto_f0
    move-object/from16 v17, v9

    goto :goto_107

    :pswitch_f3
    sget-object v9, Lqh0;->b:Lqh0;

    goto :goto_f0

    :pswitch_f6
    sget-object v9, Lqh0;->f:Lqh0;

    goto :goto_f0

    :pswitch_f9
    sget-object v9, Lqh0;->h:Lqh0;

    goto :goto_f0

    :pswitch_fc
    sget-object v9, Lqh0;->e:Lqh0;

    goto :goto_f0

    :pswitch_ff
    sget-object v9, Lqh0;->g:Lqh0;

    goto :goto_f0

    :pswitch_102
    sget-object v9, Lqh0;->c:Lqh0;

    goto :goto_f0

    :cond_105
    :goto_105
    move-object/from16 v17, v3

    :goto_107
    if-eqz v7, :cond_143

    if-eqz v8, :cond_143

    if-eqz v6, :cond_143

    iget-object v9, v0, Lzkd;->g:Lx79;

    if-eqz v9, :cond_132

    iget-object v11, v9, Lx79;->b:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v11, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_132

    iget-object v11, v9, Lx79;->c:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v11, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_132

    iget-object v9, v9, Lx79;->d:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_132

    iget-object v6, v0, Lzkd;->g:Lx79;

    goto :goto_144

    :cond_132
    iget-object v9, v0, Lzkd;->b:Lmv1;

    invoke-virtual {v9}, Lmv1;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Luqe;

    new-instance v11, Lx79;

    iget-object v9, v9, Luqe;->h:Luy8;

    invoke-direct {v11, v9, v7, v8, v6}, Lx79;-><init>(Luy8;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v11

    goto :goto_144

    :cond_143
    move-object v6, v3

    :goto_144
    new-instance v13, Lykd;

    iget-object v7, v0, Lzkd;->c:Ltjg;

    iget-object v7, v7, Ltjg;->h:Lzo4;

    if-eqz v7, :cond_14f

    move/from16 v18, v2

    goto :goto_151

    :cond_14f
    move/from16 v18, v10

    :goto_151
    invoke-direct/range {v13 .. v18}, Lykd;-><init>(Luh0;Lrh0;Lsh0;Lqh0;Z)V

    invoke-virtual {v0, v13, v6}, Lzkd;->S(Lykd;Lx79;)V

    goto :goto_15b

    :cond_158
    invoke-virtual {v0, v3, v3}, Lzkd;->S(Lykd;Lx79;)V

    :goto_15b
    if-eqz v1, :cond_16e

    invoke-interface {v1}, Lgig;->e0()Z

    move-result v2

    if-nez v2, :cond_169

    invoke-interface {v1}, Lgig;->getPlaybackState()I

    move-result v2

    if-ne v2, v4, :cond_16e

    :cond_169
    invoke-interface {v1}, Lgig;->g()Lqjd;

    move-result-object v1

    goto :goto_16f

    :cond_16e
    move-object v1, v3

    :goto_16f
    if-eqz v1, :cond_17b

    iget-object v1, v1, Lqjd;->e:Lvjd;

    iget-object v1, v1, Lvjd;->I:Landroid/os/Bundle;

    if-eqz v1, :cond_17b

    invoke-virtual {v1, v5, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_17b
    iget-object v1, v0, Lzkd;->k:Ljava/lang/String;

    invoke-static {v3, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18e

    if-eqz v3, :cond_18c

    iget-object v1, v0, Lzkd;->a:Lx5f;

    const/16 v2, 0x12

    invoke-virtual {v1, v2}, Lx5f;->S(I)V

    :cond_18c
    iput-object v3, v0, Lzkd;->k:Ljava/lang/String;

    :cond_18e
    return-void

    nop

    :pswitch_data_190
    .packed-switch 0x0
        :pswitch_73
        :pswitch_70
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_64
    .end packed-switch

    :sswitch_data_1a2
    .sparse-switch
        -0x5a4dae40 -> :sswitch_df
        -0x4474ccc5 -> :sswitch_d5
        -0x35a7cc32 -> :sswitch_cb
        0xb84872c -> :sswitch_c1
        0x100297a5 -> :sswitch_b7
        0x2ec3ca9c -> :sswitch_ae
        0x702097ea -> :sswitch_a4
    .end sparse-switch

    :pswitch_data_1c0
    .packed-switch 0x0
        :pswitch_102
        :pswitch_ff
        :pswitch_fc
        :pswitch_f9
        :pswitch_f6
        :pswitch_f3
        :pswitch_ee
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget p1, p0, Lzkd;->i:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lzkd;->i:I

    invoke-virtual {p0}, Lzkd;->T()V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    iget p1, p0, Lzkd;->i:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lzkd;->i:I

    invoke-virtual {p0}, Lzkd;->T()V

    return-void
.end method
