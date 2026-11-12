.class public final synthetic Lws1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;
.implements Lbqb;
.implements Lm9n;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lgx6;
.implements Ldkj;
.implements Lswl;
.implements Lcom/google/android/gms/tasks/OnFailureListener;
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    iput-byte p5, p0, Lws1;->a:B

    iput-object p1, p0, Lws1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lws1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lws1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lws1;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 11

    iget-byte v0, p0, Lws1;->a:B

    iget-object v1, p0, Lws1;->e:Ljava/lang/Object;

    iget-object v2, p0, Lws1;->d:Ljava/lang/Object;

    iget-object v3, p0, Lws1;->c:Ljava/lang/Object;

    iget-object p0, p0, Lws1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_78

    check-cast p0, Lpgf;

    move-object v6, v3

    check-cast v6, Ljava/lang/String;

    check-cast v2, Ldx3;

    check-cast v1, Landroid/content/Intent;

    sget-object v4, Ls9g;->h:Ls9g;

    sget-object v8, Lkag;->b:Lkag;

    const/4 v9, 0x1

    const/4 v5, 0x0

    sget-object v7, Llag;->g:Llag;

    invoke-virtual/range {v4 .. v9}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    sget-object v0, Lnl0;->c:Lnl0;

    invoke-virtual {p0, v0}, Lpgf;->c(Lnl0;)V

    invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_2a
    check-cast p0, Ljg7;

    check-cast v3, Lre7;

    check-cast v2, Lre7;

    check-cast v1, Ljava/lang/String;

    iget-object v0, p0, Ljg7;->b:Lrf7;

    iget-object v4, p0, Ljg7;->j:Lvwh;

    invoke-virtual {v0, v3, v4}, Lrf7;->c(Lre7;Lvwh;)V

    invoke-virtual {p0, v2, v1}, Ljg7;->e(Lre7;Ljava/lang/String;)V

    return-void

    :pswitch_3d
    check-cast p0, Ldx3;

    check-cast v3, Lre7;

    check-cast v2, Ljava/lang/Runnable;

    check-cast v1, Lue7;

    new-instance v0, Landroid/content/Intent;

    const-string v4, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Lre7;->g()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v0, v4}, Lmdb;->i(Landroid/content/Intent;Landroid/net/Uri;)V

    const-string v4, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "android.intent.extra.LOCAL_ONLY"

    const/4 v5, 0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v4, v3, Lre7;->m:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_68

    const-string v4, "*/*"

    :cond_68
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v4, p0, Ldx3;->j:Lqi;

    new-instance v5, Lse7;

    invoke-direct {v5, p0, v3, v2, v1}, Lse7;-><init>(Ldx3;Lre7;Ljava/lang/Runnable;Lue7;)V

    const/4 p0, 0x0

    invoke-virtual {v4, v0, v5, p0}, Lorg/chromium/ui/base/WindowAndroid;->t(Landroid/content/Intent;Lr1o;Ljava/lang/Integer;)Z

    return-void

    nop

    :pswitch_data_78
    .packed-switch 0x5
        :pswitch_3d
        :pswitch_2a
    .end packed-switch
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 34

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lws1;->a:B

    iget-object v3, v0, Lws1;->e:Ljava/lang/Object;

    iget-object v4, v0, Lws1;->d:Ljava/lang/Object;

    iget-object v5, v0, Lws1;->c:Ljava/lang/Object;

    iget-object v0, v0, Lws1;->b:Ljava/lang/Object;

    sparse-switch v2, :sswitch_data_290

    check-cast v0, Lx2l;

    check-cast v5, Lb3c;

    move-object v9, v4

    check-cast v9, Lv8a;

    move-object v15, v3

    check-cast v15, Lyqa;

    new-instance v6, Lh85;

    iget-object v7, v0, Lx2l;->e:Lpde;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const-string v10, "Missing required view with ID: "

    const v12, 0x7f0a06c5

    const v13, 0x7f0a096b

    const v14, 0x7f0a04f1

    const v4, 0x7f0a026e

    const v5, 0x7f0a0231

    const/4 v8, 0x0

    if-eqz v3, :cond_19f

    const/4 v11, 0x1

    if-eq v3, v11, :cond_10f

    const/4 v11, 0x2

    if-eq v3, v11, :cond_7d

    const/4 v4, 0x3

    if-ne v3, v4, :cond_77

    invoke-static {v2, v1}, Lq5g;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;

    move-result-object v1

    new-instance v16, Li85;

    iget-object v2, v1, Lq5g;->b:Landroid/view/ViewGroup;

    move-object/from16 v17, v2

    check-cast v17, Landroidx/constraintlayout/widget/ConstraintLayout;

    sget-object v18, Lpe5;->i:Lpe5;

    iget-object v2, v1, Lq5g;->c:Ljava/lang/Object;

    move-object/from16 v20, v2

    check-cast v20, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v1, v1, Lq5g;->d:Ljava/lang/Object;

    move-object/from16 v22, v1

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v19, v17

    invoke-direct/range {v16 .. v27}, Li85;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lk1g;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Landroid/view/View;)V

    move-object/from16 v8, v16

    goto/16 :goto_20b

    :cond_77
    invoke-static {}, Lh9o;->p()V

    :goto_7a
    const/4 v6, 0x0

    goto/16 :goto_233

    :cond_7d
    const v3, 0x7f0d03fe

    invoke-virtual {v2, v3, v1, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v27, v2

    check-cast v27, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v27, :cond_fd

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v30

    if-eqz v30, :cond_fb

    const v2, 0x7f0a0277

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_f9

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v2, :cond_f7

    invoke-static {v13, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v28, v4

    check-cast v28, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v28, :cond_f5

    const v4, 0x7f0a0aea

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v26, v5

    check-cast v26, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v26, :cond_fb

    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v25, v4

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v25, :cond_f3

    const v4, 0x7f0a0ca9

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v29, v5

    check-cast v29, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v29, :cond_ef

    move-object/from16 v20, v1

    check-cast v20, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v19, Li85;

    new-instance v1, Loe5;

    invoke-direct {v1, v3, v2}, Loe5;-><init>(Landroid/view/View;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V

    const/16 v24, 0x0

    move-object/from16 v22, v20

    move-object/from16 v21, v1

    move-object/from16 v23, v2

    invoke-direct/range {v19 .. v30}, Li85;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lk1g;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Landroid/view/View;)V

    :goto_eb
    move-object/from16 v8, v19

    goto/16 :goto_20b

    :cond_ef
    const v11, 0x7f0a0ca9

    goto :goto_fe

    :cond_f3
    move v11, v12

    goto :goto_fe

    :cond_f5
    move v11, v13

    goto :goto_fe

    :cond_f7
    move v11, v14

    goto :goto_fe

    :cond_f9
    move v11, v2

    goto :goto_fe

    :cond_fb
    move v11, v4

    goto :goto_fe

    :cond_fd
    move v11, v5

    :goto_fe
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_7a

    :cond_10f
    const v3, 0x7f0d03fd

    invoke-virtual {v2, v3, v1, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a01a5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v22

    if-eqz v22, :cond_18b

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v27, v2

    check-cast v27, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v27, :cond_18e

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v30

    if-eqz v30, :cond_189

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v23, v2

    check-cast v23, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v23, :cond_187

    const v2, 0x7f0a0519

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v3, :cond_183

    invoke-static {v13, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v28, v2

    check-cast v28, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v28, :cond_181

    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v25, v2

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v25, :cond_17f

    const v4, 0x7f0a0ca9

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v29, v2

    check-cast v29, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v29, :cond_17b

    move-object/from16 v20, v1

    check-cast v20, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v19, Li85;

    new-instance v1, Lqe5;

    invoke-direct {v1, v3}, Lqe5;-><init>(Landroidx/constraintlayout/widget/Guideline;)V

    const/16 v26, 0x0

    move-object/from16 v24, v23

    move-object/from16 v21, v1

    invoke-direct/range {v19 .. v30}, Li85;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lk1g;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Landroid/view/View;)V

    goto/16 :goto_eb

    :cond_17b
    const v5, 0x7f0a0ca9

    goto :goto_18e

    :cond_17f
    move v5, v12

    goto :goto_18e

    :cond_181
    move v5, v13

    goto :goto_18e

    :cond_183
    const v5, 0x7f0a0519

    goto :goto_18e

    :cond_187
    move v5, v14

    goto :goto_18e

    :cond_189
    move v5, v4

    goto :goto_18e

    :cond_18b
    const v5, 0x7f0a01a5

    :cond_18e
    :goto_18e
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_7a

    :cond_19f
    const v3, 0x7f0d03fc

    invoke-virtual {v2, v3, v1, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a01a5

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v22

    if-eqz v22, :cond_221

    invoke-static {v5, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v27, v2

    check-cast v27, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v27, :cond_222

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v30

    if-eqz v30, :cond_21f

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v23, v2

    check-cast v23, Landroid/widget/TextView;

    if-eqz v23, :cond_21d

    const v2, 0x7f0a0519

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/widget/Guideline;

    if-eqz v3, :cond_221

    invoke-static {v13, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v28, v2

    check-cast v28, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v28, :cond_21b

    invoke-static {v12, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v25, v2

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v25, :cond_219

    const v4, 0x7f0a0ca9

    invoke-static {v4, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v29, v2

    check-cast v29, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v29, :cond_21f

    move-object/from16 v20, v1

    check-cast v20, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v19, Li85;

    new-instance v1, Lqe5;

    invoke-direct {v1, v3}, Lqe5;-><init>(Landroidx/constraintlayout/widget/Guideline;)V

    const/16 v26, 0x0

    move-object/from16 v24, v23

    move-object/from16 v21, v1

    invoke-direct/range {v19 .. v30}, Li85;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lk1g;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Landroid/view/View;)V

    goto/16 :goto_eb

    :goto_20b
    iget-object v10, v0, Lx2l;->f:Lk6l;

    iget-object v11, v0, Lx2l;->j:Lypd;

    iget-object v12, v0, Lx2l;->g:Lu4l;

    iget-object v13, v0, Lx2l;->i:Lpde;

    iget-object v14, v0, Lx2l;->h:Ls9i;

    invoke-direct/range {v6 .. v15}, Lh85;-><init>(Lpde;Li85;Lv8a;Lk6l;Lypd;Lu4l;Lpde;Ls9i;Lyqa;)V

    goto :goto_233

    :cond_219
    move v5, v12

    goto :goto_222

    :cond_21b
    move v5, v13

    goto :goto_222

    :cond_21d
    move v5, v14

    goto :goto_222

    :cond_21f
    move v5, v4

    goto :goto_222

    :cond_221
    move v5, v2

    :cond_222
    :goto_222
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_7a

    :goto_233
    return-object v6

    :sswitch_234
    check-cast v0, Lkze;

    check-cast v5, Lgnh;

    check-cast v4, Likc;

    check-cast v3, Lyqa;

    move-object v2, v0

    new-instance v0, Lcnh;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    invoke-static {v6, v1}, Lpt1;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpt1;

    move-result-object v1

    move-object/from16 v31, v2

    move-object v2, v1

    move-object/from16 v1, v31

    move-object/from16 v31, v5

    move-object v5, v3

    move-object/from16 v3, v31

    invoke-direct/range {v0 .. v5}, Lcnh;-><init>(Likc;Lpt1;Lgnh;Likc;Lyqa;)V

    return-object v0

    :sswitch_259
    check-cast v0, Lb0e;

    move-object v10, v5

    check-cast v10, Lyhe;

    move-object v11, v4

    check-cast v11, Lpde;

    move-object v13, v3

    check-cast v13, Ls9i;

    new-instance v6, Le0e;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-static {v2, v1}, Lsf2;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lsf2;

    move-result-object v7

    iget-object v8, v0, Lb0e;->e:Lpde;

    iget-object v9, v0, Lb0e;->g:Lpde;

    iget-object v12, v0, Lb0e;->i:Lyqa;

    new-instance v14, Ls2;

    iget-object v0, v0, Lb0e;->j:Li0e;

    const/16 v20, 0x0

    const/16 v21, 0xe

    const/4 v15, 0x2

    const-class v17, Li0e;

    const-string v18, "handleTabItemClick"

    const-string v19, "handleTabItemClick(Lcom/opera/android/tabui2/MiniTabAdapter$TabItem;Lcom/opera/android/tabui2/MiniTabViewHolder;)V"

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v21}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct/range {v6 .. v14}, Le0e;-><init>(Lsf2;Lpde;Lpde;Lyhe;Lpde;Lyqa;Ls9i;Ls2;)V

    return-object v6

    :sswitch_data_290
    .sparse-switch
        0xa -> :sswitch_259
        0xe -> :sswitch_234
    .end sparse-switch
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lws1;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lws1;->e:Ljava/lang/Object;

    iget-object v4, p0, Lws1;->d:Ljava/lang/Object;

    iget-object v5, p0, Lws1;->c:Ljava/lang/Object;

    iget-object p0, p0, Lws1;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_15a

    move-object v7, p0

    check-cast v7, Ls14;

    check-cast v5, Ljava/util/List;

    check-cast v4, Lilm;

    move-object v9, v3

    check-cast v9, Landroid/content/ContentResolver;

    iget-object p0, v7, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_29

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-eqz p0, :cond_74

    :cond_29
    new-instance p0, Ljava/util/ArrayList;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    move p1, v2

    :goto_33
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_3f

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    goto :goto_33

    :cond_3f
    new-instance p1, Lh4m;

    invoke-direct {p1, v7, v4, p0}, Lh4m;-><init>(Ls14;Lilm;Ljava/util/ArrayList;)V

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    new-instance v3, Lvr9;

    invoke-direct {v3, p1, v0}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    move v11, v2

    :goto_4e
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result p1

    if-ge v11, p1, :cond_74

    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v10, p1

    check-cast v10, Landroid/net/Uri;

    new-instance v8, Llt2;

    const/4 p1, 0x5

    invoke-direct {v8, p0, v11, v3, p1}, Llt2;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    iget-object p1, v7, Ls14;->d:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v6, Ljln;

    invoke-direct/range {v6 .. v11}, Ljln;-><init>(Ls14;Llt2;Landroid/content/ContentResolver;Landroid/net/Uri;I)V

    invoke-virtual {p1, v6}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p1, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    add-int/lit8 v11, v11, 0x1

    goto :goto_4e

    :cond_74
    return-object v1

    :sswitch_75
    check-cast p0, Lolh;

    check-cast v5, Lcom/opera/android/BrowserActivity;

    check-cast v4, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Lolh;->b:Lcom/opera/android/settings/SettingsManager;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->t(Z)Landroid/net/Uri;

    move-result-object p0

    const-string p1, "multipart/related"

    invoke-static {v4, v3, p1}, LJ/N;->MHVVbhjw(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v5, p0, v0}, Llg7;->d(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "file"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_bd

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_b0

    sget-object v1, Ls29;->a:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    :cond_b0
    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    goto :goto_11a

    :cond_bd
    invoke-static {p0}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Landroid/provider/DocumentsContract;->buildDocumentUriUsingTree(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    :try_start_c5
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v3, "mime_type"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v6 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_d6} :catch_f7
    .catchall {:try_start_c5 .. :try_end_d6} :catchall_f1

    :try_start_d6
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_f8

    invoke-interface {v3, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_f8

    const-string v4, "vnd.android.document/directory"

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_d6 .. :try_end_ec} :catch_f8
    .catchall {:try_start_d6 .. :try_end_ec} :catchall_ed

    goto :goto_f8

    :catchall_ed
    move-exception v0

    move-object p0, v0

    move-object v1, v3

    goto :goto_f3

    :catchall_f1
    move-exception v0

    move-object p0, v0

    :goto_f3
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_f7
    move-object v3, v1

    :catch_f8
    :cond_f8
    :goto_f8
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    if-nez v2, :cond_111

    invoke-static {v5, p0}, Lv61;->d(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_111

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sget-object p0, Ls29;->a:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    :cond_111
    :try_start_111
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-static {p0, v7, p1, v0}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1
    :try_end_119
    .catch Ljava/io/FileNotFoundException; {:try_start_111 .. :try_end_119} :catch_119
    .catch Ljava/lang/IllegalArgumentException; {:try_start_111 .. :try_end_119} :catch_119
    .catch Ljava/lang/IllegalStateException; {:try_start_111 .. :try_end_119} :catch_119
    .catch Ljava/lang/SecurityException; {:try_start_111 .. :try_end_119} :catch_119

    :catch_119
    move-object p0, v1

    :goto_11a
    return-object p0

    :sswitch_11b
    check-cast p0, Lqln;

    check-cast v5, Lorm;

    check-cast v4, Lcom/leanplum/ActionContext;

    check-cast v3, Lok5;

    check-cast p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static {p0, v5, v4, v3, p1}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->b(Lqln;Lorm;Lcom/leanplum/ActionContext;Lok5;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :sswitch_12a
    check-cast p0, Lat1;

    check-cast v5, Lndc;

    check-cast v4, Landroid/content/Context;

    check-cast v3, Lqs1;

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/util/Collection;

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_153

    iget-object p1, p0, Lat1;->e:Lgjm;

    new-instance v0, Lft1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lf9;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v4, v3, v2}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lug;

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v0, v5, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    goto :goto_156

    :cond_153
    invoke-virtual {p0, v4, v3}, Lat1;->h(Landroid/content/Context;Lqs1;)V

    :goto_156
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :sswitch_data_15a
    .sparse-switch
        0x0 -> :sswitch_12a
        0xc -> :sswitch_11b
        0xd -> :sswitch_75
    .end sparse-switch
.end method

.method public final h(ILeyl;[I)Lcsh;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    iget-object v1, v0, Lws1;->b:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lbx6;

    iget-object v1, v0, Lws1;->c:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    iget-object v1, v0, Lws1;->d:Ljava/lang/Object;

    check-cast v1, [I

    iget-object v0, v0, Lws1;->e:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Point;

    aget v7, v1, p1

    if-eqz v0, :cond_1f

    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v0, v0, Landroid/graphics/Point;->y:I

    goto :goto_23

    :cond_1f
    iget v1, v4, Lnyl;->i:I

    iget v0, v4, Lnyl;->j:I

    :goto_23
    iget-boolean v3, v4, Lnyl;->l:Z

    const v9, 0x7fffffff

    if-eq v1, v9, :cond_88

    if-eq v0, v9, :cond_88

    move v8, v9

    const/4 v5, 0x0

    :goto_2e
    iget v12, v2, Leyl;->a:I

    if-ge v5, v12, :cond_86

    iget-object v12, v2, Leyl;->d:[Loj9;

    aget-object v12, v12, v5

    iget v13, v12, Loj9;->u:I

    iget v14, v12, Loj9;->v:I

    if-lez v13, :cond_83

    if-lez v14, :cond_83

    if-eqz v3, :cond_4f

    if-le v13, v14, :cond_44

    const/4 v15, 0x1

    goto :goto_45

    :cond_44
    const/4 v15, 0x0

    :goto_45
    if-le v1, v0, :cond_49

    const/4 v10, 0x1

    goto :goto_4a

    :cond_49
    const/4 v10, 0x0

    :goto_4a
    if-eq v15, v10, :cond_4f

    move v15, v0

    move v10, v1

    goto :goto_51

    :cond_4f
    move v10, v0

    move v15, v1

    :goto_51
    mul-int v11, v13, v10

    mul-int v9, v14, v15

    if-lt v11, v9, :cond_61

    new-instance v10, Landroid/graphics/Point;

    invoke-static {v9, v13}, Ltym;->g(II)I

    move-result v9

    invoke-direct {v10, v15, v9}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_6b

    :cond_61
    new-instance v9, Landroid/graphics/Point;

    invoke-static {v11, v14}, Ltym;->g(II)I

    move-result v11

    invoke-direct {v9, v11, v10}, Landroid/graphics/Point;-><init>(II)V

    move-object v10, v9

    :goto_6b
    iget v9, v12, Loj9;->u:I

    mul-int v11, v9, v14

    iget v12, v10, Landroid/graphics/Point;->x:I

    int-to-float v12, v12

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v13

    float-to-int v12, v12

    if-lt v9, v12, :cond_83

    iget v9, v10, Landroid/graphics/Point;->y:I

    int-to-float v9, v9

    mul-float/2addr v9, v13

    float-to-int v9, v9

    if-lt v14, v9, :cond_83

    if-ge v11, v8, :cond_83

    move v8, v11

    :cond_83
    add-int/lit8 v5, v5, 0x1

    goto :goto_2e

    :cond_86
    move v9, v8

    goto :goto_8b

    :cond_88
    const v9, 0x7fffffff

    :goto_8b
    invoke-static {}, Lh1b;->p()Lz0b;

    move-result-object v10

    const/4 v3, 0x0

    :goto_90
    iget v0, v2, Leyl;->a:I

    if-ge v3, v0, :cond_c2

    iget-object v0, v2, Leyl;->d:[Loj9;

    aget-object v0, v0, v3

    iget v1, v0, Loj9;->u:I

    const/4 v5, -0x1

    if-eq v1, v5, :cond_a6

    iget v0, v0, Loj9;->v:I

    if-eq v0, v5, :cond_a6

    mul-int/2addr v1, v0

    :goto_a2
    const v11, 0x7fffffff

    goto :goto_a8

    :cond_a6
    move v1, v5

    goto :goto_a2

    :goto_a8
    if-eq v9, v11, :cond_b0

    if-eq v1, v5, :cond_ae

    if-le v1, v9, :cond_b0

    :cond_ae
    const/4 v8, 0x0

    goto :goto_b1

    :cond_b0
    const/4 v8, 0x1

    :goto_b1
    new-instance v0, Lix6;

    aget v5, p3, v3

    move/from16 v1, p1

    invoke-direct/range {v0 .. v8}, Lix6;-><init>(ILeyl;ILbx6;ILjava/lang/String;IZ)V

    invoke-virtual {v10, v0}, Lv0b;->c(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v2, p2

    goto :goto_90

    :cond_c2
    invoke-virtual {v10}, Lz0b;->g()Lcsh;

    move-result-object v0

    return-object v0
.end method

.method public final j()V
    .registers 4

    iget-object v0, p0, Lws1;->b:Ljava/lang/Object;

    check-cast v0, Lgyf;

    iget-object v1, p0, Lws1;->c:Ljava/lang/Object;

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, p0, Lws1;->d:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    iget-object p0, p0, Lws1;->e:Ljava/lang/Object;

    check-cast p0, Lzc3;

    invoke-virtual {v0}, Lgyf;->a()V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1f

    return-void

    :cond_1f
    const/4 v0, 0x0

    invoke-virtual {p0, v2, v0}, Lzc3;->z(Landroid/view/View;Z)V

    return-void
.end method

.method public final n(Ltw7;)V
    .registers 7

    iget-object v0, p0, Lws1;->b:Ljava/lang/Object;

    check-cast v0, Lm62;

    iget-object v1, p0, Lws1;->c:Ljava/lang/Object;

    check-cast v1, Lpqh;

    iget-object v2, p0, Lws1;->d:Ljava/lang/Object;

    check-cast v2, Lp62;

    iget-object p0, p0, Lws1;->e:Ljava/lang/Object;

    check-cast p0, Lz42;

    instance-of v3, p1, Lrw7;

    if-eqz v3, :cond_1b

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Leqb;

    goto :goto_3e

    :cond_1b
    instance-of v3, p1, Lsw7;

    if-eqz v3, :cond_44

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    iget-object p1, v1, Lpqh;->a:Ljava/lang/Object;

    if-eqz p1, :cond_3e

    sget-object v1, Lw52;->a:[Lw52;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v2, v3, v4, p1, p0}, Lp62;->c(JLjava/lang/String;Lz42;)V

    iget-object p1, v2, Lp62;->e:La52;

    invoke-virtual {p1, p0}, La52;->a(Lz42;)V

    iget-object p1, v2, Lp62;->f:Lkotlin/jvm/functions/Function1;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e
    :goto_3e
    if-eqz v0, :cond_43

    invoke-virtual {v0}, Lm62;->run()V

    :cond_43
    return-void

    :cond_44
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 7

    iget-object v0, p0, Lws1;->b:Ljava/lang/Object;

    check-cast v0, Lmab;

    iget-object v1, p0, Lws1;->c:Ljava/lang/Object;

    check-cast v1, Lx5f;

    iget-object v2, p0, Lws1;->d:Ljava/lang/Object;

    check-cast v2, Lr0k;

    iget-object p0, p0, Lws1;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/Locale;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Session states: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x4

    invoke-virtual {v1, v3, p1}, Lx5f;->R(ILjava/lang/String;)V

    invoke-virtual {v0, v2, p0, v1}, Lmab;->f0(Lr0k;Ljava/util/Locale;Lx5f;)V

    return-void
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 7

    iget-object v0, p0, Lws1;->b:Ljava/lang/Object;

    check-cast v0, Lkw3;

    iget-object v1, p0, Lws1;->c:Ljava/lang/Object;

    check-cast v1, Lrl;

    iget-object v2, p0, Lws1;->d:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;

    iget-object p0, p0, Lws1;->e:Ljava/lang/Object;

    check-cast p0, Ldg7;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {v0}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    if-eqz v0, :cond_1f

    array-length v3, v0

    const/16 v4, 0x1000

    if-le v3, v4, :cond_20

    :cond_1f
    return-void

    :cond_20
    new-instance v3, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    invoke-direct {v3}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;-><init>()V

    invoke-virtual {v3, v0}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->setBytes([B)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v3, p1}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->setShouldBackupToCloud(Z)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->build()Lcom/google/android/gms/auth/blockstore/StoreBytesData;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/google/android/gms/auth/blockstore/BlockstoreClient;->storeBytes(Lcom/google/android/gms/auth/blockstore/StoreBytesData;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v2, Lxj;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v0, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lqp2;

    const/16 v0, 0xf

    invoke-direct {p1, v1, v0}, Lqp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public final run()Lqwl;
    .registers 13

    iget-byte v0, p0, Lws1;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lws1;->e:Ljava/lang/Object;

    iget-object v3, p0, Lws1;->d:Ljava/lang/Object;

    iget-object v4, p0, Lws1;->c:Ljava/lang/Object;

    iget-object p0, p0, Lws1;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_b2

    move-object v6, p0

    check-cast v6, Lle9;

    move-object v8, v4

    check-cast v8, Ljava/lang/String;

    move-object v9, v3

    check-cast v9, Lcom/opera/api/Callback;

    move-object v10, v2

    check-cast v10, Lcom/opera/api/Callback;

    iget-object p0, v6, Lle9;->d:Loji;

    invoke-virtual {p0}, Loji;->r()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_29

    new-instance v5, Lyd9;

    const/4 v11, 0x3

    invoke-direct/range {v5 .. v11}, Lyd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v5

    :cond_29
    return-object v1

    :sswitch_2a
    check-cast p0, Lle9;

    move-object v7, v4

    check-cast v7, Lvz;

    move-object v8, v3

    check-cast v8, Lcxl;

    move-object v9, v2

    check-cast v9, Lve9;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Loji;->A()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v6

    if-eqz v4, :cond_51

    if-eqz v5, :cond_51

    if-eqz v6, :cond_51

    new-instance v2, Lae9;

    const/4 v10, 0x4

    move-object v3, p0

    invoke-direct/range {v2 .. v10}, Lae9;-><init>(Lle9;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_51
    return-object v1

    :sswitch_52
    check-cast p0, Lle9;

    check-cast v4, Ljava/lang/String;

    move-object v6, v3

    check-cast v6, Ljava/lang/Runnable;

    move-object v7, v2

    check-cast v7, Lcom/opera/api/Callback;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6c

    new-instance v2, Lyd9;

    const/4 v8, 0x2

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lyd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_6c
    return-object v1

    :sswitch_6d
    check-cast p0, Lle9;

    move-object v5, v4

    check-cast v5, Ljava/lang/Long;

    move-object v6, v3

    check-cast v6, Lhu5;

    move-object v7, v2

    check-cast v7, Lj12;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_88

    new-instance v2, Lyd9;

    const/4 v8, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lyd9;-><init>(Lle9;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_88
    return-object v1

    :sswitch_89
    check-cast p0, Lle9;

    move-object v7, v4

    check-cast v7, Ljava/lang/String;

    move-object v8, v3

    check-cast v8, Lsu;

    move-object v9, v2

    check-cast v9, Lve9;

    iget-object v0, p0, Lle9;->d:Loji;

    invoke-virtual {v0}, Loji;->r()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Loji;->A()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v6

    if-eqz v4, :cond_b0

    if-eqz v5, :cond_b0

    if-eqz v6, :cond_b0

    new-instance v2, Lae9;

    const/4 v10, 0x0

    move-object v3, p0

    invoke-direct/range {v2 .. v10}, Lae9;-><init>(Lle9;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V

    move-object v1, v2

    :cond_b0
    return-object v1

    nop

    :sswitch_data_b2
    .sparse-switch
        0x7 -> :sswitch_89
        0x8 -> :sswitch_6d
        0x10 -> :sswitch_52
        0x11 -> :sswitch_2a
    .end sparse-switch
.end method
