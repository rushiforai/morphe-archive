.class public final synthetic Li4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lala;


# direct methods
.method public synthetic constructor <init>(Lala;B)V
    .registers 3

    iput-byte p2, p0, Li4m;->a:B

    iput-object p1, p0, Li4m;->b:Lala;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Li4m;->a:B

    iget-object v0, v0, Li4m;->b:Lala;

    packed-switch v1, :pswitch_data_1da

    move-object/from16 v1, p1

    check-cast v1, Ln4m;

    iget-object v2, v0, Lala;->a:Ljava/lang/Object;

    check-cast v2, Lpt1;

    if-eqz v1, :cond_1d1

    iget-boolean v3, v1, Ln4m;->i:Z

    iget-object v4, v1, Ln4m;->c:Ljava/lang/String;

    iget-object v5, v1, Ln4m;->d:Lszb;

    iget-byte v6, v1, Ln4m;->f:B

    iget-object v7, v1, Ln4m;->e:Lszb;

    iget-object v8, v1, Ln4m;->g:Ld5m;

    iget-object v9, v2, Lpt1;->c:Landroid/view/View;

    check-cast v9, Lcom/opera/android/custom_views/BottomIndicatorButton;

    iget-object v10, v2, Lpt1;->b:Landroid/view/View;

    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v11, v2, Lpt1;->g:Landroid/view/View;

    check-cast v11, Lcom/opera/android/custom_views/BottomIndicatorButton;

    const/4 v13, 0x1

    if-nez v6, :cond_30

    move v14, v13

    goto :goto_57

    :cond_30
    iget-object v14, v8, Ld5m;->a:Lc5m;

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    if-eqz v14, :cond_4e

    if-eq v14, v13, :cond_3d

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_53

    :cond_3d
    move-object v14, v8

    check-cast v14, Lb5m;

    iget-byte v14, v14, Lb5m;->b:B

    if-eqz v14, :cond_48

    if-eq v14, v13, :cond_48

    const/4 v14, 0x0

    goto :goto_49

    :cond_48
    move v14, v13

    :goto_49
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    goto :goto_53

    :cond_4e
    move-object v14, v8

    check-cast v14, La5m;

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_53
    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    :goto_57
    invoke-virtual {v9}, Lcom/opera/android/custom_views/BottomIndicatorButton;->a()Z

    move-result v15

    const/4 v12, 0x4

    if-eq v15, v14, :cond_72

    iget-object v15, v9, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    iget-object v15, v15, Lov0;->c:Ljava/lang/Object;

    check-cast v15, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v14, :cond_68

    const/4 v14, 0x0

    goto :goto_69

    :cond_68
    move v14, v12

    :goto_69
    invoke-virtual {v15, v14}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    invoke-virtual {v9}, Lcom/opera/android/custom_views/BottomIndicatorButton;->b()V

    :cond_72
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    if-eqz v5, :cond_7d

    invoke-virtual {v5, v14}, Lszb;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    goto :goto_84

    :cond_7d
    const v15, 0x7f1408b1

    invoke-virtual {v14, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    :goto_84
    iget-object v15, v9, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_91

    iput-object v14, v9, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-virtual {v9}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    :cond_91
    iget-object v14, v8, Ld5m;->a:Lc5m;

    invoke-virtual {v14}, Ljava/lang/Enum;->ordinal()I

    move-result v14

    const/4 v15, 0x3

    if-eqz v14, :cond_b0

    if-eq v14, v13, :cond_9f

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_b5

    :cond_9f
    move-object v14, v8

    check-cast v14, Lb5m;

    iget-byte v14, v14, Lb5m;->b:B

    if-eq v14, v15, :cond_aa

    if-eq v14, v12, :cond_aa

    const/4 v14, 0x0

    goto :goto_ab

    :cond_aa
    move v14, v13

    :goto_ab
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    goto :goto_b5

    :cond_b0
    move-object v14, v8

    check-cast v14, La5m;

    sget-object v14, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_b5
    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    invoke-virtual {v11}, Lcom/opera/android/custom_views/BottomIndicatorButton;->a()Z

    move-result v12

    if-eq v12, v14, :cond_d3

    iget-object v12, v11, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    iget-object v12, v12, Lov0;->c:Ljava/lang/Object;

    check-cast v12, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v14, :cond_c9

    const/4 v14, 0x0

    goto :goto_ca

    :cond_c9
    const/4 v14, 0x4

    :goto_ca
    invoke-virtual {v12, v14}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v11}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    invoke-virtual {v11}, Lcom/opera/android/custom_views/BottomIndicatorButton;->b()V

    :cond_d3
    const-string v12, ""

    if-nez v7, :cond_d9

    move-object v14, v12

    goto :goto_e1

    :cond_d9
    invoke-virtual {v11}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v7, v14}, Lszb;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    :goto_e1
    iget-object v15, v11, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_ee

    iput-object v14, v11, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-virtual {v11}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    :cond_ee
    if-eqz v7, :cond_f4

    if-ne v6, v13, :cond_f4

    move v6, v13

    goto :goto_f5

    :cond_f4
    const/4 v6, 0x0

    :goto_f5
    invoke-virtual {v11, v6}, Lcom/opera/android/custom_views/BottomIndicatorButton;->setEnabled(Z)V

    iget-object v2, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    invoke-virtual {v8}, Ld5m;->a()Z

    move-result v6

    if-nez v6, :cond_103

    move-object v9, v11

    :cond_103
    invoke-virtual {v2, v9}, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->a(Lcom/opera/android/custom_views/BottomIndicatorButton;)V

    iget-object v2, v0, Lala;->h:Ljava/lang/Object;

    check-cast v2, Lm3m;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v1, Ln4m;->a:Ljava/util/Set;

    iget-boolean v8, v1, Ln4m;->h:Z

    if-eqz v4, :cond_115

    move v9, v13

    goto :goto_116

    :cond_115
    const/4 v9, 0x0

    :goto_116
    iput-boolean v9, v2, Lm3m;->o:Z

    if-eqz v8, :cond_123

    const/4 v9, 0x0

    invoke-static {v6, v5, v9}, Lm3m;->q(Ljava/util/Set;Lszb;I)Z

    move-result v11

    if-eqz v11, :cond_123

    move v9, v13

    goto :goto_124

    :cond_123
    const/4 v9, 0x0

    :goto_124
    iput-boolean v9, v2, Lm3m;->p:Z

    if-eqz v8, :cond_130

    invoke-static {v6, v5, v13}, Lm3m;->q(Ljava/util/Set;Lszb;I)Z

    move-result v6

    if-eqz v6, :cond_130

    move v9, v13

    goto :goto_131

    :cond_130
    const/4 v9, 0x0

    :goto_131
    iput-boolean v9, v2, Lm3m;->q:Z

    if-eqz v8, :cond_141

    if-eqz v4, :cond_141

    iget-object v6, v1, Ln4m;->b:Ljava/util/Set;

    invoke-interface {v6, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_141

    move v9, v13

    goto :goto_142

    :cond_141
    const/4 v9, 0x0

    :goto_142
    iput-boolean v9, v2, Lm3m;->r:Z

    if-eqz v5, :cond_14e

    iget-object v4, v2, Lm3m;->j:Landroid/content/Context;

    iget v6, v5, Lszb;->b:I

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    :cond_14e
    iput-object v12, v2, Lm3m;->s:Ljava/lang/String;

    if-eqz v5, :cond_15a

    invoke-virtual {v5, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_15a

    move v9, v13

    goto :goto_15b

    :cond_15a
    const/4 v9, 0x0

    :goto_15b
    iput-boolean v9, v2, Lm3m;->t:Z

    invoke-virtual {v2}, Lm3m;->s()V

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_167

    const/4 v13, 0x0

    :cond_167
    if-eq v3, v13, :cond_18a

    const/16 v9, 0x8

    if-eqz v3, :cond_16f

    const/4 v2, 0x0

    goto :goto_170

    :cond_16f
    move v2, v9

    :goto_170
    invoke-virtual {v10, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v0, Lala;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    if-eqz v2, :cond_17f

    if-eqz v3, :cond_17c

    const/4 v9, 0x0

    :cond_17c
    invoke-virtual {v2, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_17f
    iget-object v2, v0, Lala;->d:Ljava/lang/Object;

    check-cast v2, Lpde;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v2, v4}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_18a
    sget-object v2, Lijm;->b:Lijm;

    if-eqz v3, :cond_1ae

    iget-boolean v3, v1, Ln4m;->j:Z

    if-eqz v3, :cond_1ae

    iget-object v3, v0, Lala;->k:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/SettingsManager;

    const-string v4, "feature_tips_notification"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1ae

    iget-object v3, v0, Lala;->c:Ljava/lang/Object;

    check-cast v3, Loz3;

    new-instance v4, Lkt3;

    const/4 v5, 0x3

    invoke-direct {v4, v0, v5}, Lkt3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_1ae
    iget-boolean v1, v1, Ln4m;->k:Z

    if-eqz v1, :cond_1d1

    invoke-virtual {v10}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v1

    new-instance v3, Lxq3;

    iget-object v4, v0, Lala;->j:Ljava/lang/Object;

    check-cast v4, Lf0c;

    new-instance v5, Lk4m;

    const/4 v9, 0x0

    invoke-direct {v5, v0, v9}, Lk4m;-><init>(Lala;B)V

    const/16 v0, 0xd

    invoke-direct {v3, v4, v5, v0}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_1d1
    return-void

    :pswitch_1d2
    move-object/from16 v1, p1

    check-cast v1, Lbtl;

    invoke-virtual {v0}, Lala;->e()V

    return-void

    :pswitch_data_1da
    .packed-switch 0x0
        :pswitch_1d2
    .end packed-switch
.end method
