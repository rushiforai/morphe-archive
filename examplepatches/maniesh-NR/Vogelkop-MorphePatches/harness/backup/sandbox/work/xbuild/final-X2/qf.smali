.class public final Lqf;
.super Ldej;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lmej;Ljava/lang/Object;B)V
    .registers 4

    .line 9
    iput-byte p3, p0, Lqf;->c:B

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lqf;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxq3;Lmej;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lqf;->c:B

    .line 10
    iput-object p1, p0, Lqf;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Ldej;-><init>(Lmej;)V

    return-void
.end method

.method public constructor <init>(Lxq3;Lmej;Lb2l;)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Lqf;->c:B

    iput-object p1, p0, Lqf;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Ldej;-><init>(Lmej;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lqf;->c:B

    const v3, 0x7f0a06c5

    const v4, 0x7f0a06b5

    const v5, 0x7f0a01c0

    const v6, 0x7f0a0322

    const/16 v7, 0x8

    iget-object v8, v0, Lqf;->d:Ljava/lang/Object;

    const-string v9, "Missing required view with ID: "

    const/4 v10, 0x2

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    packed-switch v2, :pswitch_data_32a

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0482

    invoke-virtual {v1, v2, v13, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_89

    const v6, 0x7f0a069e

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v2, :cond_89

    const v6, 0x7f0a069f

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v3, :cond_89

    const v6, 0x7f0a06a0

    invoke-static {v6, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v4, :cond_89

    move-object v13, v1

    check-cast v13, Landroid/widget/LinearLayout;

    new-instance v1, Lgnn;

    invoke-direct {v1, v0, v12}, Lgnn;-><init>(Lqf;B)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lgnn;

    invoke-direct {v1, v0, v11}, Lgnn;-><init>(Lqf;B)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lgnn;

    invoke-direct {v1, v0, v10}, Lgnn;-><init>(Lqf;B)V

    invoke-virtual {v2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string v0, "xiaomi"

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_98

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "Redmi"

    invoke-static {v0, v1, v12}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_98

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_98

    :cond_89
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :cond_98
    :goto_98
    return-object v13

    :pswitch_99
    check-cast v8, Lxq3;

    invoke-virtual {v8, v1}, Lxq3;->b(Landroid/content/Context;)V

    iget-object v2, v8, Lxq3;->c:Ljava/lang/Object;

    check-cast v2, Lbmn;

    new-instance v3, Ljvg;

    const/16 v4, 0xd

    invoke-direct {v3, v2, v0, v4}, Ljvg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v1, v0, v3}, Lbmn;->b(Landroid/content/Context;Lqf;Ljvg;)Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0

    :pswitch_ae
    check-cast v8, Lgua;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v14, 0x7f0d0210

    invoke-virtual {v2, v14, v13, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    if-eqz v14, :cond_26f

    invoke-static {v14}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v17

    const v5, 0x7f0a0231

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    check-cast v14, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v14, :cond_26f

    const v5, 0x7f0a0232

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    move-object/from16 v18, v14

    check-cast v18, Landroid/widget/FrameLayout;

    if-eqz v18, :cond_26f

    const v5, 0x7f0a0272

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    move-object/from16 v19, v14

    check-cast v19, Landroid/widget/FrameLayout;

    if-eqz v19, :cond_26f

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v20, :cond_26d

    const v5, 0x7f0a056f

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v21, v6

    check-cast v21, Lcom/opera/android/widget/AspectRatioImageView;

    if-eqz v21, :cond_26f

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v22, v5

    check-cast v22, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v22, :cond_26b

    const v4, 0x7f0a0a46

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v23, v5

    check-cast v23, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v23, :cond_26b

    const v4, 0x7f0a0aea

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v24, v5

    check-cast v24, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v24, :cond_26b

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v25, v4

    check-cast v25, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz v25, :cond_270

    new-instance v15, Lov0;

    move-object/from16 v16, v2

    check-cast v16, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    invoke-direct/range {v15 .. v25}, Lov0;-><init>(Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/widget/AspectRatioImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/custom_views/DialogTitle;Lcom/opera/android/custom_views/DialogTitle;)V

    move-object v10, v15

    move-object/from16 v13, v16

    move-object/from16 v2, v17

    move-object/from16 v14, v18

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v4, v22

    move-object/from16 v9, v24

    move-object/from16 v15, v25

    iget-object v7, v8, Lgua;->a:Lfua;

    iget-object v11, v8, Lgua;->e:Lpxh;

    iget-object v12, v8, Lgua;->d:Llxh;

    if-eqz v7, :cond_160

    new-instance v7, Lbua;

    const/4 v1, 0x0

    invoke-direct {v7, v5, v8, v1}, Lbua;-><init>(Lcom/opera/android/custom_views/StylingImageView;Lgua;B)V

    invoke-static {v5, v7}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v7, v5}, Lbua;->a(Landroid/view/View;)V

    goto :goto_18b

    :cond_160
    iget-object v1, v8, Lgua;->b:Llxh;

    if-eqz v1, :cond_186

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v1, v7}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v8, Lgua;->m:Ldxh;

    if-eqz v1, :cond_18b

    new-instance v1, Lbua;

    const/4 v7, 0x1

    invoke-direct {v1, v5, v8, v7}, Lbua;-><init>(Lcom/opera/android/custom_views/StylingImageView;Lgua;B)V

    invoke-static {v5}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v7

    if-eqz v7, :cond_182

    invoke-static {v7, v5, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_182
    invoke-virtual {v1, v5}, Lbua;->a(Landroid/view/View;)V

    goto :goto_18b

    :cond_186
    const/16 v1, 0x8

    invoke-virtual {v5, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_18b
    :goto_18b
    iget-object v1, v8, Lgua;->c:Lc37;

    if-nez v1, :cond_195

    if-nez v12, :cond_195

    const/4 v7, 0x0

    :goto_192
    move-object/from16 v20, v1

    goto :goto_197

    :cond_195
    const/4 v7, 0x1

    goto :goto_192

    :goto_197
    iget-boolean v1, v8, Lgua;->n:Z

    if-eqz v7, :cond_1bd

    if-eqz v20, :cond_1a5

    invoke-virtual/range {v20 .. v20}, Lc37;->i()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1b0

    :cond_1a5
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v12, v5}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_1b0
    invoke-static {v13}, Lfsp;->m(Landroid/view/View;)Lpde;

    move-result-object v5

    new-instance v6, Lcua;

    invoke-direct {v6, v10, v1}, Lcua;-><init>(Lov0;Z)V

    invoke-static {v5, v13, v6}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    goto :goto_1c2

    :cond_1bd
    const/16 v5, 0x8

    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_1c2
    invoke-virtual {v15}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v11, v5}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v15, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v7, :cond_1e4

    if-eqz v1, :cond_1e4

    const/high16 v5, 0x42200000    # 40.0f

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v5, v6}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    invoke-virtual {v15}, Landroid/view/View;->getPaddingEnd()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_1e8

    :cond_1e4
    invoke-virtual {v15}, Landroid/view/View;->getPaddingEnd()I

    move-result v5

    :goto_1e8
    invoke-virtual {v15}, Landroid/view/View;->getPaddingStart()I

    move-result v6

    invoke-virtual {v15}, Landroid/view/View;->getPaddingTop()I

    move-result v7

    invoke-virtual {v15}, Landroid/view/View;->getPaddingBottom()I

    move-result v10

    invoke-virtual {v15, v6, v7, v5, v10}, Landroid/view/View;->setPaddingRelative(IIII)V

    const/16 v5, 0x8

    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v6, v8, Lgua;->f:Lpxh;

    if-eqz v6, :cond_20c

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v6, v7}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_20f

    :cond_20c
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_20f
    iget-object v4, v8, Lgua;->g:Landroid/view/ViewGroup;

    if-eqz v4, :cond_21b

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_21c

    :cond_21b
    const/4 v4, 0x0

    :goto_21c
    iget-object v3, v2, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    iget-object v5, v8, Lgua;->h:Lpxh;

    if-eqz v5, :cond_236

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v5, v6}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v5, Ldua;

    invoke-direct {v5, v8, v0, v4}, Ldua;-><init>(Lgua;Lqf;B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_23b

    :cond_236
    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_23b
    iget-object v2, v2, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    iget-object v3, v8, Lgua;->j:Lpxh;

    if-eqz v3, :cond_256

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v3, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Ldua;

    const/4 v7, 0x1

    invoke-direct {v3, v8, v0, v7}, Ldua;-><init>(Lgua;Lqf;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_25b

    :cond_256
    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    :goto_25b
    if-eqz v1, :cond_27f

    const/4 v1, 0x0

    invoke-virtual {v14, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Ldua;

    const/4 v2, 0x2

    invoke-direct {v1, v8, v0, v2}, Ldua;-><init>(Lgua;Lqf;B)V

    invoke-virtual {v14, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_27f

    :cond_26b
    move v3, v4

    goto :goto_270

    :cond_26d
    move v3, v6

    goto :goto_270

    :cond_26f
    move v3, v5

    :cond_270
    :goto_270
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :cond_27f
    :goto_27f
    return-object v13

    :pswitch_280
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0300

    invoke-virtual {v0, v1, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a026e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    check-cast v8, Lxq3;

    iget-object v2, v8, Lxq3;->b:Ljava/lang/Object;

    check-cast v2, Lebf;

    invoke-interface {v2, v1, v8}, Lebf;->j(Landroid/view/ViewStub;Labf;)V

    return-object v0

    :pswitch_29e
    invoke-static/range {p1 .. p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d039b

    const/4 v6, 0x0

    invoke-virtual {v1, v2, v13, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_318

    invoke-static {v2}, Lpq3;->a(Landroid/view/View;)Lpq3;

    move-result-object v2

    const v5, 0x7f0a0514

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v6, :cond_318

    const v5, 0x7f0a051c

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_318

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_316

    move-object v4, v1

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v6, :cond_319

    const v1, 0x7f1401b7

    move-object/from16 v3, p1

    invoke-virtual {v3, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v6, 0x7f1410fb

    invoke-virtual {v3, v6, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v2, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const v5, 0x7f140b36

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    new-instance v5, Lnf;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v3, v6}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v2, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const v2, 0x7f1403bf

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    new-instance v2, Lgf;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v3}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v13, v4

    goto :goto_328

    :cond_316
    move v3, v4

    goto :goto_319

    :cond_318
    move v3, v5

    :cond_319
    :goto_319
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_328
    return-object v13

    nop

    :pswitch_data_32a
    .packed-switch 0x0
        :pswitch_29e
        :pswitch_280
        :pswitch_ae
        :pswitch_99
    .end packed-switch
.end method
