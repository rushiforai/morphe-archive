.class public final Lko3;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Lpp3;

.field public final g:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lx5f;Lfd;Ljze;Lcom/opera/android/settings/SettingsManager;Lfw3;Lcom/opera/android/bar/BottomBar;Lk6l;Lv1f;Lbq3;Lxj;Lpp3;Lw6j;B)V
    .registers 27

    move-object/from16 v2, p7

    move-object/from16 v3, p12

    move-object/from16 v4, p13

    move/from16 v5, p14

    iput-byte v5, p0, Lko3;->e:B

    const v6, 0x7f0a073e

    packed-switch v5, :pswitch_data_5a

    invoke-direct {p0, p1, v2, v4}, Lr22;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;)V

    iput-object v3, p0, Lko3;->f:Lpp3;

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/view/ViewGroup;

    iput-object v7, p0, Lko3;->g:Landroid/view/ViewGroup;

    new-instance v0, Ltah;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Ltah;-><init>(Lcom/opera/android/BrowserActivity;Lx5f;Lfd;Ljze;Lcom/opera/android/settings/SettingsManager;Lfw3;Landroid/view/ViewGroup;Lk6l;Lv1f;Lbq3;Lxj;)V

    return-void

    :pswitch_35
    invoke-direct {p0, p1, v2, v4}, Lr22;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/BottomBar;Lw6j;)V

    iput-object v3, p0, Lko3;->f:Lpp3;

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/view/ViewGroup;

    iput-object v7, p0, Lko3;->g:Landroid/view/ViewGroup;

    new-instance v0, Ltah;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Ltah;-><init>(Lcom/opera/android/BrowserActivity;Lx5f;Lfd;Ljze;Lcom/opera/android/settings/SettingsManager;Lfw3;Landroid/view/ViewGroup;Lk6l;Lv1f;Lbq3;Lxj;)V

    return-void

    :pswitch_data_5a
    .packed-switch 0x1
        :pswitch_35
    .end packed-switch
.end method


# virtual methods
.method public final M(I)V
    .registers 4

    iget-byte v0, p0, Lko3;->e:B

    iget-object v1, p0, Lko3;->f:Lpp3;

    packed-switch v0, :pswitch_data_76

    invoke-super {p0, p1}, Lr22;->M(I)V

    iget-object p0, v1, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->p:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_14
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz3;

    invoke-interface {v0}, Lcz3;->a()V

    goto :goto_14

    :cond_24
    int-to-float p0, p1

    iget-object p1, v1, Lz43;->h:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_2d
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3d

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, p0}, Ly43;->p(F)V

    goto :goto_2d

    :cond_3d
    return-void

    :pswitch_3e
    invoke-super {p0, p1}, Lr22;->M(I)V

    iget-object p0, v1, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->p:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_4b
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz3;

    invoke-interface {v0}, Lcz3;->a()V

    goto :goto_4b

    :cond_5b
    int-to-float p0, p1

    iget-object p1, v1, Lz43;->h:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_64
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_74

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly43;

    invoke-interface {v0, p0}, Ly43;->p(F)V

    goto :goto_64

    :cond_74
    return-void

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_3e
    .end packed-switch
.end method

.method public final N(Lap3;)V
    .registers 4

    iget-byte v0, p0, Lko3;->e:B

    iget-object v1, p0, Lko3;->g:Landroid/view/ViewGroup;

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Lr22;->N(Lap3;)V

    iget-object p0, p1, Lap3;->a:Lzo3;

    iget p0, p0, Lzo3;->a:I

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    :pswitch_12
    invoke-super {p0, p1}, Lr22;->N(Lap3;)V

    iget-object p0, p1, Lap3;->a:Lzo3;

    iget p0, p0, Lzo3;->a:I

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method

.method public final O()Z
    .registers 1

    iget-byte p0, p0, Lko3;->e:B

    const/4 p0, 0x1

    return p0
.end method

.method public final d(Lrsg;)Lno3;
    .registers 6

    iget-byte p0, p0, Lko3;->e:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_56

    iget-boolean p0, p1, Lrsg;->b:Z

    if-eqz p0, :cond_12

    iget-boolean v3, p1, Lrsg;->c:Z

    if-eqz v3, :cond_12

    move v3, v1

    goto :goto_13

    :cond_12
    move v3, v2

    :goto_13
    iget-object p1, p1, Lrsg;->a:Lp8l;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_28

    if-ne p1, v1, :cond_24

    new-instance v0, Lno3;

    xor-int/2addr v3, v1

    invoke-direct {v0, p0, v3, v2}, Lno3;-><init>(ZZZ)V

    goto :goto_2e

    :cond_24
    invoke-static {}, Lh9o;->p()V

    goto :goto_2e

    :cond_28
    new-instance v0, Lno3;

    xor-int/2addr v3, v1

    invoke-direct {v0, v1, v3, v2}, Lno3;-><init>(ZZZ)V

    :goto_2e
    return-object v0

    :pswitch_2f
    iget-boolean p0, p1, Lrsg;->b:Z

    if-eqz p0, :cond_39

    iget-boolean v3, p1, Lrsg;->c:Z

    if-eqz v3, :cond_39

    move v3, v1

    goto :goto_3a

    :cond_39
    move v3, v2

    :goto_3a
    iget-object p1, p1, Lrsg;->a:Lp8l;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_4f

    if-ne p1, v1, :cond_4b

    new-instance v0, Lno3;

    xor-int/2addr v3, v1

    invoke-direct {v0, p0, v3, v2}, Lno3;-><init>(ZZZ)V

    goto :goto_54

    :cond_4b
    invoke-static {}, Lh9o;->p()V

    goto :goto_54

    :cond_4f
    new-instance v0, Lno3;

    invoke-direct {v0, v1, v2, v2}, Lno3;-><init>(ZZZ)V

    :goto_54
    return-object v0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method

.method public final i()Z
    .registers 1

    iget-byte p0, p0, Lko3;->e:B

    const/4 p0, 0x0

    return p0
.end method
