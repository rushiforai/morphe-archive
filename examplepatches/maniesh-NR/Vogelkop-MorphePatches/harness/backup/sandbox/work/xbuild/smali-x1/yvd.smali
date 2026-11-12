.class public final Lyvd;
.super Ldwd;
.source "SourceFile"


# instance fields
.field public final synthetic g:B

.field public final h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmej;Lib9;Lfge;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lyvd;->g:B

    .line 11
    invoke-direct {p0, p1, p2}, Ldwd;-><init>(Lmej;Lhb9;)V

    .line 12
    iput-object p3, p0, Lyvd;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmej;Ljb9;Ljava/lang/String;Lvk2;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lyvd;->g:B

    invoke-direct {p0, p1, p2}, Ldwd;-><init>(Lmej;Lhb9;)V

    iput-object p3, p0, Lyvd;->h:Ljava/lang/Object;

    iput-object p4, p0, Lyvd;->i:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 23

    move-object/from16 v0, p0

    iget-byte v1, v0, Lyvd;->g:B

    const-string v2, "Missing required view with ID: "

    const/4 v3, 0x1

    const v4, 0x7f0805f4

    iget-object v5, v0, Ldwd;->d:Lhb9;

    iget-object v6, v0, Lyvd;->h:Ljava/lang/Object;

    const v7, 0x7f0a07c6

    const v8, 0x7f0a0514

    const v9, 0x7f0a02df

    const v10, 0x7f0a0279

    const/4 v11, 0x0

    const/4 v12, 0x0

    packed-switch v1, :pswitch_data_17a

    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v13, 0x7f0d01c3

    invoke-virtual {v1, v13, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v13, :cond_9c

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroidx/core/widget/NestedScrollView;

    if-eqz v10, :cond_9a

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/FrameLayout;

    if-eqz v9, :cond_98

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_9d

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    const v10, 0x7f0a06c5

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_9c

    const v10, 0x7f0a0c64

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_9c

    invoke-virtual {v0, v9, v8}, Ldwd;->g(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v13, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    check-cast v5, Ljb9;

    iget-object v1, v5, Ljb9;->g:Ljava/lang/String;

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lzvd;

    invoke-direct {v1, v0, v12}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lawd;

    invoke-direct {v1, v0, v12}, Lawd;-><init>(Lyvd;B)V

    const v2, 0x7f1404f4

    const v5, 0x7f08057b

    invoke-virtual {v0, v2, v5, v1}, Ldwd;->d(IILjava/lang/Runnable;)V

    new-instance v1, Lawd;

    invoke-direct {v1, v0, v3}, Lawd;-><init>(Lyvd;B)V

    const v2, 0x7f14050a

    invoke-virtual {v0, v2, v4, v1}, Ldwd;->d(IILjava/lang/Runnable;)V

    invoke-virtual {v0}, Ldwd;->e()V

    move-object v11, v7

    goto :goto_ac

    :cond_98
    move v7, v8

    goto :goto_9d

    :cond_9a
    move v7, v9

    goto :goto_9d

    :cond_9c
    move v7, v10

    :cond_9d
    :goto_9d
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_ac
    return-object v11

    :pswitch_ad
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v13, 0x7f0d01c2

    invoke-virtual {v1, v13, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v10, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v13

    move-object/from16 v16, v13

    check-cast v16, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v16, :cond_169

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroidx/core/widget/NestedScrollView;

    if-eqz v10, :cond_167

    const v9, 0x7f0a0487

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v17, v10

    check-cast v17, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v17, :cond_167

    invoke-static {v8, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v18, v9

    check-cast v18, Landroid/widget/FrameLayout;

    if-eqz v18, :cond_165

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v19, v8

    check-cast v19, Landroid/widget/LinearLayout;

    if-eqz v19, :cond_16a

    move-object v15, v1

    check-cast v15, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    const v7, 0x7f0a0a80

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v20, v8

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_16a

    new-instance v14, Lvs;

    invoke-direct/range {v14 .. v20}, Lvs;-><init>(Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;)V

    move-object/from16 v9, v18

    move-object/from16 v8, v19

    iput-object v14, v0, Lyvd;->i:Ljava/lang/Object;

    invoke-virtual {v0, v9, v8}, Ldwd;->g(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    check-cast v5, Lib9;

    iget-object v1, v0, Lyvd;->i:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v2, v5, Lib9;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lyvd;->i:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-wide v7, v5, Lib9;->j:J

    const-wide/16 v9, 0x0

    cmp-long v2, v7, v9

    if-lez v2, :cond_132

    move-object/from16 v2, p1

    invoke-static {v7, v8, v2}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_137

    :cond_132
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_137
    check-cast v6, Lfge;

    invoke-virtual {v6, v5}, Lfge;->G0(Lib9;)Z

    move-result v1

    if-eqz v1, :cond_158

    new-instance v1, Lxvd;

    invoke-direct {v1, v0, v5, v12}, Lxvd;-><init>(Lyvd;Lib9;B)V

    const v2, 0x7f14061d

    const v6, 0x7f0805a7

    invoke-virtual {v0, v2, v6, v1}, Ldwd;->d(IILjava/lang/Runnable;)V

    new-instance v1, Lxvd;

    invoke-direct {v1, v0, v5, v3}, Lxvd;-><init>(Lyvd;Lib9;B)V

    const v2, 0x7f140508

    invoke-virtual {v0, v2, v4, v1}, Ldwd;->d(IILjava/lang/Runnable;)V

    :cond_158
    invoke-virtual {v0}, Ldwd;->e()V

    iget-object v0, v0, Lyvd;->i:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    move-object v11, v0

    check-cast v11, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    goto :goto_179

    :cond_165
    move v7, v8

    goto :goto_16a

    :cond_167
    move v7, v9

    goto :goto_16a

    :cond_169
    move v7, v10

    :cond_16a
    :goto_16a
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_179
    return-object v11

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_ad
    .end packed-switch
.end method

.method public final f(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lyvd;->g:B

    packed-switch v0, :pswitch_data_7a

    invoke-super {p0, p1}, Ldwd;->f(Landroid/view/View;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lyvd;->i:Ljava/lang/Object;

    check-cast v0, Lvs;

    if-nez v0, :cond_13

    invoke-super {p0, p1}, Ldwd;->f(Landroid/view/View;)V

    goto :goto_78

    :cond_13
    iget-object v0, p0, Ldwd;->d:Lhb9;

    check-cast v0, Lib9;

    iget-object v1, v0, Lib9;->e:Ljava/lang/String;

    iget-object v0, v0, Lib9;->h:Ljava/lang/String;

    sget-object v2, Llg7;->a:[[I

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v0

    invoke-static {v0}, Llg7;->g(Lo29;)Lkg7;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, v0, Lkg7;->d:I

    const v3, 0x7f06063b

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, p0, Lyvd;->i:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v4, 0x2

    invoke-virtual {v0, v4, v2}, Lkg7;->h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v4, v2}, Lkg7;->g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget v0, v0, Lkg7;->e:I

    invoke-static {v0, p1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Lyvd;->i:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p0, p0, Lyvd;->i:Ljava/lang/Object;

    check-cast p0, Lvs;

    iget-object p0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final h(Lhb9;)V
    .registers 4

    iget-byte v0, p0, Lyvd;->g:B

    packed-switch v0, :pswitch_data_48

    return-void

    :pswitch_6
    check-cast p1, Lib9;

    iget-object p0, p0, Lyvd;->h:Ljava/lang/Object;

    check-cast p0, Lfge;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p1, Lib9;->l:Landroid/net/Uri;

    if-eqz v0, :cond_46

    iget-object v0, p1, Lhb9;->d:Ljava/lang/String;

    iget-object v1, p0, Lfge;->t:Lbf9;

    iget-object v1, v1, Lbf9;->a:Loji;

    invoke-virtual {v1}, Loji;->u()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_46

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object p1, p1, Lib9;->l:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p1

    if-eqz p1, :cond_46

    new-instance v1, Lufe;

    invoke-direct {v1, p0}, Lufe;-><init>(Lfge;)V

    invoke-virtual {v0, p1, v1}, Lrf7;->c(Lre7;Lvwh;)V

    :cond_46
    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final j()V
    .registers 2

    iget-byte v0, p0, Lyvd;->g:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0}, Ldwd;->j()V

    return-void

    :pswitch_9
    const/4 v0, 0x0

    iput-object v0, p0, Ldwd;->f:Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Lyvd;->i:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
