.class public Lcom/sauzask/nicoid/NicoidVideoInfoFragment;
.super Landroidx/fragment/app/Fragment;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sauzask/nicoid/NicoidVideoInfoFragment$k;
    }
.end annotation


# instance fields
.field public Y:Landroid/view/View;

.field public Z:Landroid/view/View;

.field public a0:Ljava/lang/String;

.field public b0:Landroid/app/Activity;

.field public c0:Z

.field public d0:Z

.field public e0:I

.field public f0:I

.field public g0:Le/e/a/l3/g;

.field public h0:Landroid/os/Handler;

.field public i0:Landroid/os/Bundle;

.field public j0:Z

.field public k0:Z

.field public l0:Landroid/widget/LinearLayout;

.field public m0:Landroid/widget/LinearLayout;

.field public n0:Landroid/content/SharedPreferences;


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 20

    move-object/from16 v1, p0

    const-string v2, "dic"

    const/4 v3, 0x0

    const v0, 0x7f0b0075

    move-object/from16 v4, p1

    invoke-virtual {v4, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/Fragment;->k()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    .line 1
    iget-object v0, v1, Landroidx/fragment/app/Fragment;->f:Landroid/os/Bundle;

    .line 2
    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/v0;->d(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->c0:Z

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const/4 v4, 0x0

    const-string v5, "taptype"

    invoke-virtual {v0, v5, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->f0:I

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v5, "isInfoOnly"

    invoke-virtual {v0, v5, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->d0:Z

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v5, "isSide"

    invoke-virtual {v0, v5, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->j0:Z

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->d0:Z

    const/4 v5, 0x1

    if-eqz v0, :cond_48

    iput v5, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->f0:I

    :cond_48
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->n0:Landroid/content/SharedPreferences;

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->c0:Z

    const-string v6, "nicovideo_version"

    if-eqz v0, :cond_5d

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    invoke-virtual {v0, v6, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_69

    :cond_5d
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    invoke-static {v0}, Le/e/a/PlaybackSession;->metadataVersion(Landroid/os/Bundle;)I

    move-result v0

    :goto_69
    iput v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v6, 0x7f0800d1

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v6, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_9f

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v6, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v8, 0x7f0f01ef

    invoke-virtual {v6, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setLinksClickable(Z)V

    new-instance v6, Le/e/a/j3;

    iget-object v8, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    iget v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->f0:I

    invoke-direct {v6, v8, v9, v10}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;I)V

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    :cond_9f
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v6, 0x7f0801d4

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->l0:Landroid/widget/LinearLayout;

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v6, 0x7f080184

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->m0:Landroid/widget/LinearLayout;

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->j0:Z

    const/16 v6, 0x8

    if-eqz v0, :cond_cd

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->d0:Z

    if-nez v0, :cond_cd

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Z:Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b(Landroid/view/View;)V

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->l0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_cd
    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->k0:Z

    if-eqz v0, :cond_d6

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->m0:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_d6
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b(Landroid/view/View;)V

    const v8, 0x7f0801ca

    :try_start_de
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v9, 0x7f0801cb

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v10, 0x7f0801c7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    iget-object v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v11, 0x7f0801c9

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/ImageView;

    iget v11, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    if-eqz v11, :cond_115

    iget v11, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    if-ne v11, v7, :cond_108

    goto :goto_115

    :cond_108
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    :goto_110
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_21f

    :cond_115
    :goto_115
    iget-object v11, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v12, "nickname"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_121

    const-string v11, ""

    :cond_121
    invoke-virtual {v0, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->c0:Z

    if-eqz v0, :cond_20b

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v12, "is_favorited"

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13d

    const-string v12, "true"

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13d

    invoke-virtual {v9, v4}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_13d
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v12, "icon_url"

    invoke-virtual {v0, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_201

    invoke-virtual {v10, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance v0, Ljava/lang/Thread;

    new-instance v12, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$b;

    invoke-direct {v12, v1, v10}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$b;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Landroid/widget/ImageView;)V

    invoke-direct {v0, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-direct {v0, v10}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v12, "videoUserId"

    invoke-virtual {v10, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    iget v12, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    if-nez v12, :cond_21f

    iget-object v12, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    const v13, 0x7f0f01f0

    if-eqz v12, :cond_1ba

    invoke-virtual {v9, v4}, Landroid/widget/Button;->setVisibility(I)V

    new-instance v12, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$c;

    invoke-direct {v12, v1, v11, v10, v9}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$c;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Button;)V

    invoke-virtual {v9, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "http://www.nicovideo.jp/user/"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "/video"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    if-eqz v9, :cond_1ab

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v10, 0x7f0f01f1

    invoke-virtual {v9, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$d;

    invoke-direct {v10, v1, v11}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$d;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_1ab
    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v9, v13}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$e;

    invoke-direct {v10, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$e;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;)V

    :goto_1b6
    invoke-virtual {v0, v9, v10}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1d8

    :cond_1ba
    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v10, "channelVideoURL"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    if-nez v9, :cond_1cc

    const-string v9, "http://www.nicovideo.jp/"

    iput-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    :cond_1cc
    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v9, v13}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$f;

    invoke-direct {v10, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$f;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;)V

    goto :goto_1b6

    :goto_1d8
    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a0:Ljava/lang/String;

    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v9, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/RelativeLayout;

    new-instance v10, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$g;

    invoke-direct {v10, v1, v0}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$g;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Landroid/app/AlertDialog$Builder;)V

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v9, 0x7f0801ca

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    new-instance v9, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;

    invoke-direct {v9, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;)V

    invoke-virtual {v0, v9}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_21f

    :cond_201
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    goto/16 :goto_110

    :cond_20b
    const/4 v0, 0x4

    invoke-virtual {v10, v0}, Landroid/widget/ImageView;->setVisibility(I)V
    :try_end_20f
    .catch Ljava/lang/Exception; {:try_start_de .. :try_end_20f} :catch_210

    goto :goto_21f

    :catch_210
    move-exception v0

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v9, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/RelativeLayout;

    invoke-virtual {v8, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_21f
    :goto_21f
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v9, 0x7f0801ca

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_24e

    new-instance v9, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;

    invoke-direct {v9, v1}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$h;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;)V

    invoke-virtual {v0, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v12, 0x7f0801cb

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_24e

    invoke-virtual {v0, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v12, 0x7f0801c9

    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_24e

    invoke-virtual {v0, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_24e
    :try_start_24e
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v6, 0x7f08007a

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;
    :try_end_259
    .catch Ljava/lang/Exception; {:try_start_24e .. :try_end_259} :catch_336

    :try_start_259
    iget-object v6, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v8, "description_original"

    invoke-virtual {v6, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setLinksClickable(Z)V

    new-instance v6, Le/e/a/j3;

    iget-object v8, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->g0:Le/e/a/l3/g;

    iget v10, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->f0:I

    invoke-direct {v6, v8, v9, v10}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;I)V

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V
    :try_end_279
    .catch Ljava/lang/Exception; {:try_start_259 .. :try_end_279} :catch_279

    :catch_279
    :try_start_279
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    const v6, 0x7f0801a7

    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/16 v6, 0x23

    iget-object v8, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-static {v6, v8}, Le/e/a/v0;->b(ILandroid/content/Context;)I

    move-result v6

    const v8, 0x7f07008e

    invoke-virtual {v1, v8, v6}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(II)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    const v9, 0x7f07008d

    invoke-virtual {v1, v9, v6}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->a(II)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-object v9, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v10, "tagList"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_33a

    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10, v9}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x0

    :goto_2aa
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v9, v11, :cond_33a

    invoke-virtual {v10, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    const-string v12, "tag"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-static {v12, v13}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Landroid/widget/Button;

    iget-object v15, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-direct {v14, v15}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const v15, 0x7f07005f

    invoke-static {v14, v15}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    invoke-static {v14, v11}, Le/e/a/TagDictionary;->apply(Landroid/widget/Button;Lorg/json/JSONObject;)V

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2e8

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2e8

    const/4 v11, 0x1

    goto :goto_2e9

    :cond_2e8
    const/4 v11, 0x0

    :goto_2e9
    if-nez v11, :cond_2ed

    move-object v11, v6

    goto :goto_2ee

    :cond_2ed
    move-object v11, v8

    :goto_2ee
    nop

    const/16 v11, 0xa

    invoke-virtual {v14, v11}, Landroid/widget/Button;->setCompoundDrawablePadding(I)V

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v11

    const/16 v15, 0xe

    if-lt v11, v15, :cond_2ff

    invoke-virtual {v14, v4}, Landroid/widget/Button;->setAllCaps(Z)V

    :cond_2ff
    invoke-virtual {v14, v12}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/16 v11, 0x13

    invoke-virtual {v14, v11}, Landroid/widget/Button;->setGravity(I)V

    const/high16 v11, 0x41600000    # 14.0f

    invoke-virtual {v14, v7, v11}, Landroid/widget/Button;->setTextSize(IF)V

    const/high16 v11, -0x1000000

    invoke-virtual {v14, v11}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {v14}, Le/e/a/DynamicTheme;->button(Landroid/widget/Button;)V

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x1

    const/4 v3, -0x2

    invoke-direct {v11, v15, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v11}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;

    invoke-direct {v3, v1, v12}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$i;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Ljava/lang/String;)V

    invoke-virtual {v14, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;

    invoke-direct {v3, v1, v12, v13}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$j;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14, v3}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V
    :try_end_331
    .catch Ljava/lang/Exception; {:try_start_279 .. :try_end_331} :catch_336

    add-int/lit8 v9, v9, 0x1

    const/4 v3, 0x0

    goto/16 :goto_2aa

    :catch_336
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_33a
    iget-object v0, v1, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->Y:Landroid/view/View;

    invoke-static {v0}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    return-object v0
.end method

.method public final a(Landroid/widget/ImageView;)V
    .registers 13

    invoke-virtual {p1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadimage / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    sget-object v1, Le/e/a/y0;->f:Le/e/a/y0$a;

    invoke-virtual {v1, v0}, Ld/e/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    const-string v2, ".*?tn.smilevideo.jp.*?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    const-string v3, ".M"

    const-string v4, ""

    if-nez v2, :cond_32

    const-string v2, ".*?nicovideo.cdn.nimg.jp.*?"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_39

    :cond_32
    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_39

    goto :goto_3a

    :cond_39
    move-object v3, v4

    :goto_3a
    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_103

    const/4 v2, 0x0

    move-object v5, v3

    const/4 v3, 0x0

    :goto_45
    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v6

    if-eqz v6, :cond_144

    :cond_4d
    const/4 v6, 0x3

    if-ge v3, v6, :cond_144

    const/4 v1, 0x0

    :try_start_51
    new-instance v6, Ljava/net/URL;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    const-string v7, "GET"

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v7, "Accept-Language"

    const-string v8, "jp"

    invoke-virtual {v6, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v7, 0x1388

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->connect()V

    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_91
    .catch Ljava/net/SocketTimeoutException; {:try_start_51 .. :try_end_91} :catch_eb
    .catch Ljava/io/FileNotFoundException; {:try_start_51 .. :try_end_91} :catch_d5
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_91} :catch_d0

    :try_start_91
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v9, 0xc8

    if-ne v6, v9, :cond_bf

    const/16 v6, 0x1000

    new-array v6, v6, [B

    :goto_9d
    invoke-virtual {v7, v6}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9
    :try_end_a1
    .catchall {:try_start_91 .. :try_end_a1} :catchall_c8

    const/4 v10, -0x1

    if-eq v9, v10, :cond_ac

    :try_start_a4
    invoke-virtual {v8, v6, v2, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_a7
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_a7} :catch_a8
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_c8

    goto :goto_9d

    :catch_a8
    move-exception v6

    :try_start_a9
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    :cond_ac
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v10, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v10, v9, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v10, v6

    invoke-static {v6, v2, v10, v9}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v6
    :try_end_be
    .catchall {:try_start_a9 .. :try_end_be} :catchall_c8

    goto :goto_c0

    :cond_bf
    move-object v6, v1

    :goto_c0
    :try_start_c0
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    move-object v1, v6

    goto :goto_ff

    :catchall_c8
    move-exception v6

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    throw v6
    :try_end_d0
    .catch Ljava/net/SocketTimeoutException; {:try_start_c0 .. :try_end_d0} :catch_eb
    .catch Ljava/io/FileNotFoundException; {:try_start_c0 .. :try_end_d0} :catch_d5
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_d0} :catch_d0

    :catch_d0
    move-exception v6

    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_ff

    :catch_d5
    move-exception v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "404 Thumbnail / "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v5}, Ljava/io/FileNotFoundException;->printStackTrace()V

    move-object v5, v4

    goto :goto_ff

    :catch_eb
    move-exception v6

    invoke-virtual {v6}, Ljava/net/SocketTimeoutException;->printStackTrace()V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8 Thumbnail / "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :goto_ff
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_45

    :cond_103
    if-eqz v1, :cond_10b

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-eqz v2, :cond_144

    :cond_10b
    :try_start_10b
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/nicoid/nicoid_cache/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".thm"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_136

    return-void

    :cond_136
    new-instance v0, Le/e/a/CacheInputStream;

    invoke-direct {v0, v2}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_13f
    .catch Ljava/lang/Exception; {:try_start_10b .. :try_end_13f} :catch_140

    goto :goto_144

    :catch_140
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_144
    :goto_144
    if-eqz v1, :cond_150

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->h0:Landroid/os/Handler;

    new-instance v2, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$k;

    invoke-direct {v2, p0, v1, p1}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$k;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Landroid/graphics/Bitmap;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_150
    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "first_retrieve"

    const-string v3, ""

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    if-eqz v4, :cond_11

    return-void

    :cond_11
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const v5, 0x7f080059

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const v6, 0x7f0801b4

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-static {v6}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    const v7, 0x7f0801b2

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    const v8, 0x7f080193

    invoke-virtual {v1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const v9, 0x7f080166

    invoke-virtual {v1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    const v10, 0x7f0801b3

    invoke-virtual {v1, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    :try_start_5b
    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v11, "thumbImage"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_81

    iget-boolean v11, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->c0:Z

    if-nez v11, :cond_71

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v11, "videoId"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :cond_71
    invoke-virtual {v7, v10}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    new-instance v10, Ljava/lang/Thread;

    new-instance v11, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$a;

    invoke-direct {v11, v0, v7}, Lcom/sauzask/nicoid/NicoidVideoInfoFragment$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoInfoFragment;Landroid/widget/ImageView;)V

    invoke-direct {v10, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v10}, Ljava/lang/Thread;->start()V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_81} :catch_81

    :catch_81
    :cond_81
    const/4 v11, 0x0

    :try_start_82
    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v13, "category"

    invoke-virtual {v12, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v14, "genreName"

    invoke-virtual {v13, v14}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_92} :catch_195

    const-string v14, "null"

    if-eqz v12, :cond_9e

    :try_start_96
    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_9d

    goto :goto_9e

    :cond_9d
    const/4 v12, 0x0

    :cond_9e
    :goto_9e
    const v15, 0x7f0f01f8

    const v7, 0x7f0f01f9

    if-eqz v13, :cond_eb

    iget-object v12, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v10, "highestRank"

    invoke-virtual {v12, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_c7

    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v7, v15}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v12, v4, [Ljava/lang/Object;

    aput-object v10, v12, v11

    invoke-static {v7, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_d1

    :cond_c7
    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v10, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_d1
    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v12, 0x7f0f01ed

    invoke-virtual {v10, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x2

    new-array v14, v12, [Ljava/lang/Object;

    aput-object v13, v14, v11

    aput-object v7, v14, v4

    invoke-static {v10, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_189

    :cond_eb
    if-eqz v12, :cond_17c

    iget v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    if-nez v10, :cond_166

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v13, "yesterday_rank"

    invoke-virtual {v10, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_112

    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v13, v15}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {v13 .. v13}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    new-array v15, v4, [Ljava/lang/Object;

    aput-object v10, v15, v11

    invoke-static {v13, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_11c

    :cond_112
    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v10, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    :goto_11c
    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v15, "highest_rank"

    invoke-virtual {v13, v15}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_140

    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v14, 0x7f0f01f8

    invoke-virtual {v7, v14}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v14, v4, [Ljava/lang/Object;

    aput-object v13, v14, v11

    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_14a

    :cond_140
    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v13, v7}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_14a
    iget-object v13, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v14, 0x7f0f01fa

    invoke-virtual {v13, v14}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {v13 .. v13}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x3

    new-array v15, v14, [Ljava/lang/Object;

    aput-object v12, v15, v11

    aput-object v10, v15, v4

    const/4 v10, 0x2

    aput-object v7, v15, v10

    invoke-static {v13, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_189

    :cond_166
    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v10, 0x7f0f01ec

    invoke-virtual {v7, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v10, v4, [Ljava/lang/Object;

    aput-object v12, v10, v11

    invoke-static {v7, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_189

    :cond_17c
    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v10, 0x7f0f01eb

    invoke-virtual {v7, v10}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_189
    iget v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->e0:I

    if-ne v10, v4, :cond_18e

    move-object v7, v3

    :cond_18e
    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_195
    .catch Ljava/lang/Exception; {:try_start_96 .. :try_end_195} :catch_195

    :catch_195
    :try_start_195
    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v9, "videoTitle"

    invoke-virtual {v7, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1a4
    .catch Ljava/lang/Exception; {:try_start_195 .. :try_end_1a4} :catch_1a5

    goto :goto_1aa

    :catch_1a5
    const-string v7, "\u30bf\u30a4\u30c8\u30eb\u306e\u53d6\u5f97\u306b\u5931\u6557"

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1aa
    :try_start_1aa
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v9, "viewCount"

    invoke-virtual {v7, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v9, v7

    invoke-virtual {v6, v9, v10}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v7

    iget-object v9, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v10, "commentCount"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v7, v9, v10}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v9

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    const-string v12, "mylistCount"

    invoke-virtual {v10, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    int-to-long v12, v10

    invoke-virtual {v9, v12, v13}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v9

    iget-object v10, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v12, 0x7f0f01f3

    invoke-virtual {v10, v12}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v6, v12, v11

    aput-object v7, v12, v4

    const/4 v6, 0x2

    aput-object v9, v12, v6

    invoke-static {v10, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_20b
    .catch Ljava/lang/Exception; {:try_start_1aa .. :try_end_20b} :catch_20c

    goto :goto_213

    :catch_20c
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_213
    :try_start_213
    const-string v6, "yyyy/MM/dd HH:mm:ss"

    const-string v7, "postedAt"

    iget-object v8, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    invoke-virtual {v8, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_222

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ssZZ"

    goto :goto_223

    :cond_222
    move-object v2, v7

    :goto_223
    new-instance v7, Ljava/text/SimpleDateFormat;

    invoke-direct {v7, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/text/SimpleDateFormat;

    iget-object v8, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v9, 0x7f0f004d

    invoke-virtual {v8, v9}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {v8 .. v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->i0:Landroid/os/Bundle;

    invoke-virtual {v8, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v8, Ljava/text/ParsePosition;

    invoke-direct {v8, v11}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v7, v2, v8}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v2

    iget-object v7, v0, Lcom/sauzask/nicoid/NicoidVideoInfoFragment;->b0:Landroid/app/Activity;

    const v8, 0x7f0f01f2

    invoke-virtual {v7, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v7 .. v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v6, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v11

    invoke-static {v7, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_269
    .catch Ljava/lang/Exception; {:try_start_213 .. :try_end_269} :catch_26a

    goto :goto_26d

    :catch_26a
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_26d
    invoke-virtual {v5, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Le/e/a/VideoInfoUi;->bindStatistics(Ljava/lang/Object;Landroid/view/View;)V

    invoke-static {v0, v1}, Le/e/a/VideoExtras;->bind(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
