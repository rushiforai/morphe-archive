.class public final Llro;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Lioo;


# instance fields
.field public o:Lznn;

.field public final p:I

.field public final q:Lxho;

.field public final r:Lzg;

.field public s:Lqb7;

.field public final t:Ljava/util/ArrayList;

.field public final u:Loam;

.field public v:Lnoo;

.field public w:Ljava/lang/ref/WeakReference;

.field public final x:Lfio;

.field public final y:Landroid/content/Context;

.field public final z:Z


# direct methods
.method public constructor <init>(ZLandroid/content/Context;ILzg;Lxho;Ljava/util/ArrayList;Loam;Luuj;Lp12;Lfio;)V
    .registers 11

    invoke-direct {p0, p8, p9}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean p1, p0, Llro;->z:Z

    iput-object p2, p0, Llro;->y:Landroid/content/Context;

    iput p3, p0, Llro;->p:I

    iput-object p4, p0, Llro;->r:Lzg;

    iput-object p5, p0, Llro;->q:Lxho;

    iput-object p6, p0, Llro;->t:Ljava/util/ArrayList;

    iput-object p7, p0, Llro;->u:Loam;

    iput-object p10, p0, Llro;->x:Lfio;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Lbm;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final p(Lqb7;)V
    .registers 2

    iput-object p1, p0, Llro;->s:Lqb7;

    return-void
.end method

.method public final s0(I)V
    .registers 8

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    const-string v1, "impressionts"

    goto :goto_8

    :cond_6
    const-string v1, "clickts"

    :goto_8
    iget-object v2, p0, Llro;->t:Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpho;

    iget v4, v3, Lpho;->a:I

    if-ne v4, p1, :cond_e

    iget-object v3, v3, Lpho;->b:Ljava/util/ArrayList;

    if-eqz v3, :cond_e

    sget-object v4, Lsjo;->a:Ljava/util/List;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4, v3}, Lsjo;->e(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_34
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, p1}, Lphj;->t(Ljava/lang/String;I)V

    goto :goto_34

    :cond_44
    sget-object v1, Lnqo;->a:[I

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    aget p1, v1, p1

    if-eq p1, v0, :cond_59

    const/4 v0, 0x2

    if-ne p1, v0, :cond_60

    iget-object p0, p0, Llro;->v:Lnoo;

    if-eqz p0, :cond_60

    invoke-virtual {p0}, Lsc;->g()V

    return-void

    :cond_59
    iget-object p0, p0, Llro;->v:Lnoo;

    if-eqz p0, :cond_60

    invoke-virtual {p0}, Lsc;->h()V

    :cond_60
    return-void
.end method

.method public final t0(Landroid/app/Activity;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    iget-object v1, v0, Llro;->q:Lxho;

    iget-object v3, v1, Lxho;->g:Ljava/lang/String;

    iget-boolean v4, v1, Lxho;->f:Z

    iget-object v5, v1, Lxho;->e:Ljava/lang/String;

    iget-object v6, v1, Lxho;->d:Ljava/lang/String;

    iget-object v7, v1, Lxho;->b:Ljava/lang/String;

    new-instance v8, Ljava/lang/ref/WeakReference;

    invoke-direct {v8, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v8, v0, Llro;->w:Ljava/lang/ref/WeakReference;

    iget-boolean v8, v0, Llro;->z:Z

    iget-object v10, v0, Llro;->y:Landroid/content/Context;

    if-eqz v8, :cond_27

    const v8, 0x7f0a0076

    invoke-virtual {v2, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    goto :goto_83

    :cond_27
    const v8, 0x7f0a00cb

    invoke-virtual {v2, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/view/ViewGroup;

    const v11, 0x7f0a00c9

    invoke-virtual {v2, v11}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ImageView;

    const v12, 0x7f0a00c2

    invoke-virtual {v2, v12}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    const v13, 0x7f0a00c6

    invoke-virtual {v2, v13}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/ImageView;

    new-instance v14, Lpkm;

    move-object v15, v2

    check-cast v15, Lcom/opera/ad/interstitial/AdActivity;

    const/16 v9, 0x11

    invoke-direct {v14, v15, v9}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v13, v14}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v9, Lsjo;->a:Ljava/util/List;

    :try_start_5a
    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-static {v10}, Lsjo;->m(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9
    :try_end_66
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5a .. :try_end_66} :catch_67

    goto :goto_68

    :catch_67
    const/4 v9, 0x0

    :goto_68
    if-eqz v9, :cond_6d

    invoke-virtual {v11, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_6d
    invoke-virtual {v10}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget v11, v9, Landroid/content/pm/ApplicationInfo;->labelRes:I

    if-nez v11, :cond_7c

    iget-object v9, v9, Landroid/content/pm/ApplicationInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_80

    :cond_7c
    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    :goto_80
    invoke-virtual {v12, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_83
    const v9, 0x7f0a00c8

    invoke-virtual {v2, v9}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ImageView;

    const v11, 0x7f0a00c3

    invoke-virtual {v2, v11}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/view/ViewGroup;

    const v12, 0x7f0a00c7

    invoke-virtual {v2, v12}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/ImageView;

    const v13, 0x7f0a00cc

    invoke-virtual {v2, v13}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    const v14, 0x7f0a00c5

    invoke-virtual {v2, v14}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    const v15, 0x7f0a00c4

    invoke-virtual {v2, v15}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/Button;

    iget-object v1, v1, Lxho;->c:Ljava/lang/String;

    move-object/from16 v16, v8

    const/16 v8, 0x8

    if-eqz v9, :cond_d4

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_cb

    invoke-virtual {v9, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_d4

    :cond_cb
    new-instance v8, Lugo;

    const/4 v2, 0x1

    invoke-direct {v8, v0, v9, v2}, Lugo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v10, v1, v8}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    :cond_d4
    :goto_d4
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f4

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f4

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f4

    if-eqz v4, :cond_ee

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_f4

    :cond_ee
    const/16 v1, 0x8

    invoke-virtual {v11, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_138

    :cond_f4
    const/16 v1, 0x8

    if-eqz v12, :cond_10b

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_102

    invoke-virtual {v12, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_10b

    :cond_102
    new-instance v2, Lugo;

    const/4 v8, 0x1

    invoke-direct {v2, v0, v12, v8}, Lugo;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v10, v7, v2}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    :cond_10b
    :goto_10b
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_115

    invoke-virtual {v13, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_118

    :cond_115
    invoke-virtual {v13, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_118
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_122

    invoke-virtual {v14, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_125

    :cond_122
    invoke-virtual {v14, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_125
    if-eqz v4, :cond_135

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_131

    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_138

    :cond_131
    invoke-virtual {v15, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_138

    :cond_135
    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_138
    const/4 v1, 0x5

    new-array v7, v1, [Landroid/view/View;

    const/4 v1, 0x0

    aput-object v9, v7, v1

    const/16 v17, 0x1

    aput-object v12, v7, v17

    const/4 v1, 0x2

    aput-object v13, v7, v1

    const/4 v1, 0x3

    aput-object v14, v7, v1

    const/4 v1, 0x4

    aput-object v15, v7, v1

    iget-object v1, v0, Llro;->o:Lznn;

    if-nez v1, :cond_158

    new-instance v1, Lznn;

    iget-object v2, v0, Llro;->w:Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Lznn;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v1, v0, Llro;->o:Lznn;

    :cond_158
    move-object v4, v1

    new-instance v1, Lxbf;

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v3, v0, Llro;->r:Lzg;

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v6}, Lxbf;-><init>(Landroid/content/Context;Lzg;Lbl;Laoo;Lltm;)V

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_16c
    :goto_16c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_185

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_16c

    check-cast v4, Landroid/view/View;

    new-instance v5, Ldv2;

    const/16 v6, 0xa

    invoke-direct {v5, v0, v4, v1, v6}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_16c

    :cond_185
    iget-object v2, v0, Llro;->x:Lfio;

    if-eqz v2, :cond_1ba

    iget-byte v4, v2, Lfio;->a:B

    const/4 v8, 0x1

    if-eq v4, v8, :cond_1ba

    iget-byte v5, v2, Lfio;->e:B

    and-int/2addr v5, v4

    if-eqz v5, :cond_1ba

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    new-instance v5, Lroj;

    const/16 v6, 0x17

    invoke-direct {v5, v0, v1, v6}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a2
    :goto_1a2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1ba

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1a2

    check-cast v4, Landroid/view/View;

    new-instance v6, Lxgo;

    const/4 v7, 0x0

    invoke-direct {v6, v5, v7, v2}, Lxgo;-><init>(Lg94;Lu2p;Lfio;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    goto :goto_1a2

    :cond_1ba
    iget-object v1, v0, Llro;->u:Loam;

    if-eqz v1, :cond_1d6

    sget-object v2, Lc26;->q:Ll5b;

    iget-boolean v2, v2, Ll5b;->b:Z

    if-nez v2, :cond_1c7

    invoke-static {v10}, Lc26;->f(Landroid/content/Context;)V

    :cond_1c7
    new-instance v2, Lnoo;

    iget-object v3, v3, Lzg;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    move-object/from16 v8, v16

    const/4 v4, 0x1

    invoke-direct {v2, v8, v3, v1, v4}, Lnoo;-><init>(Landroid/view/View;Ljava/lang/String;Loam;B)V

    iput-object v2, v0, Llro;->v:Lnoo;

    goto :goto_1d7

    :cond_1d6
    const/4 v4, 0x1

    :goto_1d7
    iget-object v1, v0, Llro;->s:Lqb7;

    if-eqz v1, :cond_1de

    invoke-virtual {v1}, Lqb7;->g()V

    :cond_1de
    invoke-virtual {v0, v4}, Llro;->s0(I)V

    return-void
.end method

.method public final v(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/opera/ad/interstitial/AdActivity;->b(Lioo;Lcom/opera/android/BrowserActivity;)V

    return-void
.end method
