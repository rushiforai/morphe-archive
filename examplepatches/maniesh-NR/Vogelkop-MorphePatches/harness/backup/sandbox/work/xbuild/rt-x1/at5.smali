.class public final Lat5;
.super Lq73;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final d:Lqs5;

.field public final e:Lk73;

.field public final f:Ld5o;

.field public final g:Lb2l;

.field public final h:B

.field public final i:Lcom/opera/api/Callback;

.field public final j:Lx5f;

.field public final k:Lru9;

.field public l:Z


# direct methods
.method public constructor <init>(Lmej;Lcom/opera/android/browser/chromium/ChromiumContent;Lqs5;Lk73;Lb2l;ILcom/opera/api/Callback;Lx5f;Lru9;)V
    .registers 10

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p3, p0, Lat5;->d:Lqs5;

    iput-object p4, p0, Lat5;->e:Lk73;

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    invoke-virtual {p1}, Ldx3;->N()Lex3;

    move-result-object p1

    invoke-interface {p1}, Lijf;->b()Lcom/opera/android/Lazy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgjm;

    new-instance p2, Ld5o;

    iget-object p3, p0, Ldej;->b:Lmej;

    invoke-interface {p3}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-direct {p2, p3, p1, p4}, Ld5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p2, p0, Lat5;->f:Ld5o;

    iput-object p5, p0, Lat5;->g:Lb2l;

    iput-byte p6, p0, Lat5;->h:B

    iput-object p7, p0, Lat5;->i:Lcom/opera/api/Callback;

    iput-object p8, p0, Lat5;->j:Lx5f;

    iput-object p9, p0, Lat5;->k:Lru9;

    return-void
.end method

.method public static g(Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080240

    invoke-static {v1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0402e3

    const v3, 0x7f06063b

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402bf

    invoke-static {v1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/widget/FrameLayout;)Landroid/view/View;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d00d9

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v3, 0x7f0a0279

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v8, :cond_163

    const v3, 0x7f0a027a

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v9, :cond_163

    const v3, 0x7f0a0623

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v10, :cond_163

    const v3, 0x7f0a0624

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v11, :cond_163

    const v3, 0x7f0a06c5

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v12, :cond_163

    const v3, 0x7f0a0baa

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Landroid/widget/TextSwitcher;

    if-eqz v13, :cond_163

    const v3, 0x7f0a0c64

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v14, :cond_163

    const v3, 0x7f0a0c69

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Landroid/widget/TextSwitcher;

    if-eqz v15, :cond_163

    new-instance v6, Lor2;

    move-object v7, v2

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v6 .. v15}, Lor2;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Landroid/widget/TextSwitcher;Lcom/opera/android/ui/catalog/widget/OperaTextView;Landroid/widget/TextSwitcher;)V

    iget-object v2, v0, Lat5;->d:Lqs5;

    iget-object v3, v2, Lqs5;->n:Ljava/lang/String;

    iget-object v5, v2, Lqs5;->i:Ljava/lang/String;

    iget-object v13, v2, Lqs5;->h:Ljava/lang/String;

    iget-boolean v4, v2, Lqs5;->s:Z

    move-object/from16 v16, v3

    iget-boolean v3, v2, Lqs5;->t:Z

    move/from16 v17, v3

    iget-object v3, v2, Lqs5;->b:Ljava/lang/String;

    const v18, 0x7f08057b

    if-eqz v4, :cond_b7

    iget-object v2, v2, Lqs5;->c:Ljava/lang/String;

    if-eqz v17, :cond_a3

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_a3

    move-object/from16 v16, v13

    goto :goto_d9

    :cond_a3
    if-eqz v17, :cond_ae

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_ae

    move-object/from16 v16, v5

    goto :goto_d9

    :cond_ae
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_d9

    move-object/from16 v16, v2

    goto :goto_d9

    :cond_b7
    if-eqz v17, :cond_d9

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c1

    move-object v3, v13

    goto :goto_d1

    :cond_c1
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c9

    move-object v3, v5

    goto :goto_d1

    :cond_c9
    iget-object v3, v2, Lqs5;->e:Ljava/lang/String;

    invoke-static {v3}, LJ/N;->MSVMeBmV(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_d1
    iget-object v2, v2, Lqs5;->e:Ljava/lang/String;

    const v18, 0x7f080575

    :goto_d6
    move/from16 v5, v18

    goto :goto_dd

    :cond_d9
    :goto_d9
    move-object v2, v3

    move-object/from16 v3, v16

    goto :goto_d6

    :goto_dd
    iget-object v13, v0, Ldej;->b:Lmej;

    move/from16 v16, v4

    invoke-interface {v13}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v5, v4}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v8, v4}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz v17, :cond_10a

    invoke-interface {v13}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070132

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    sget-object v5, Lks5;->b:Lks5;

    new-instance v13, La32;

    const/4 v1, 0x4

    invoke-direct {v13, v0, v8, v9, v1}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v0, Lat5;->e:Lk73;

    invoke-virtual {v1, v4, v5, v13}, Lk73;->v(ILks5;Lls5;)V

    :cond_10a
    invoke-virtual {v12, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_129

    if-eqz v17, :cond_11a

    if-eqz v16, :cond_129

    :cond_11a
    invoke-static {v2}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v14}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_12e

    :cond_129
    const/16 v1, 0x8

    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_12e
    new-instance v1, Lyk4;

    const/4 v3, 0x6

    invoke-direct {v1, v6, v3}, Lyk4;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lks8;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v5}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-nez v17, :cond_141

    if-eqz v16, :cond_14e

    :cond_141
    new-instance v1, Lts5;

    invoke-direct {v1, v0, v2, v3}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    new-instance v2, Lks8;

    invoke-direct {v2, v1, v5}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_14e
    new-instance v1, Lvs5;

    move-object/from16 v2, p1

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v6, v3}, Lvs5;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_15f

    invoke-static {v0, v2, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_15f
    invoke-virtual {v1, v2}, Lvs5;->a(Landroid/view/View;)V

    return-object v7

    :cond_163
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final e(Lqb7;)V
    .registers 16

    iget-object v0, p0, Lat5;->d:Lqs5;

    iget-boolean v1, v0, Lqs5;->s:Z

    iget-boolean v2, v0, Lqs5;->t:Z

    iget-boolean v3, v0, Lqs5;->s:Z

    iget-object v4, v0, Lqs5;->d:Ljava/lang/String;

    iget-object v5, v0, Lqs5;->b:Ljava/lang/String;

    const/4 v6, 0x0

    const v7, 0x7f0804e8

    const v8, 0x7f080533

    const v9, 0x7f0805ef

    const/4 v10, 0x1

    if-eqz v1, :cond_63

    invoke-static {v5}, Landroid/net/MailTo;->isMailTo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_63

    new-instance v1, Lus5;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lus5;-><init>(Lat5;B)V

    const v2, 0x7f140506

    invoke-virtual {p1, v9, v2, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    invoke-static {v4}, Landroid/net/MailTo;->parse(Ljava/lang/String;)Landroid/net/MailTo;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/MailTo;->getTo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_44

    new-instance v2, Lts5;

    invoke-direct {v2, p0, v1, v6}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    const v3, 0x7f1404ec

    invoke-virtual {p1, v7, v3, v2}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_44
    invoke-virtual {p0, p1}, Lat5;->f(Lqb7;)V

    iget-boolean v0, v0, Lqs5;->t:Z

    if-nez v0, :cond_4e

    invoke-virtual {p0, p1}, Lat5;->h(Lqb7;)V

    :cond_4e
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5f

    new-instance v0, Lts5;

    invoke-direct {v0, p0, v1, v10}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    const v1, 0x7f1404f1

    invoke-virtual {p1, v8, v1, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_5f
    invoke-virtual {p0, p1, v10}, Lat5;->k(Lqb7;Z)V

    return-void

    :cond_63
    const/4 v1, 0x2

    if-eqz v3, :cond_108

    invoke-static {v5}, Ly4h;->k(Ljava/lang/String;)Z

    move-result v11

    const-string v12, "sms:"

    if-nez v11, :cond_78

    if-nez v5, :cond_72

    move v11, v6

    goto :goto_76

    :cond_72
    invoke-virtual {v5, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    :goto_76
    if-eqz v11, :cond_108

    :cond_78
    invoke-static {v5}, Ly4h;->k(Ljava/lang/String;)Z

    move-result v2

    const v3, 0x7f140507

    const v11, 0x7f1404ef

    const v13, 0x7f08050c

    if-eqz v2, :cond_90

    new-instance v2, Lus5;

    invoke-direct {v2, p0, v6}, Lus5;-><init>(Lat5;B)V

    invoke-virtual {p1, v13, v11, v2}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    goto :goto_a2

    :cond_90
    if-nez v5, :cond_94

    move v2, v6

    goto :goto_98

    :cond_94
    invoke-virtual {v5, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    :goto_98
    if-eqz v2, :cond_a2

    new-instance v2, Lus5;

    invoke-direct {v2, p0, v10}, Lus5;-><init>(Lat5;B)V

    invoke-virtual {p1, v9, v3, v2}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_a2
    :goto_a2
    invoke-static {v4}, Ly4h;->k(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b2

    if-eqz v4, :cond_ae

    invoke-virtual {v4, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    :cond_ae
    if-nez v6, :cond_b2

    const/4 v2, 0x0

    goto :goto_be

    :cond_b2
    const/16 v2, 0x3a

    invoke-static {v10, v4, v2}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_be
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_e8

    invoke-static {v5}, Ly4h;->k(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d3

    new-instance v4, Lts5;

    invoke-direct {v4, p0, v2, v1}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    invoke-virtual {p1, v9, v3, v4}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    goto :goto_dc

    :cond_d3
    new-instance v1, Lts5;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v2, v3}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    invoke-virtual {p1, v13, v11, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :goto_dc
    new-instance v1, Lts5;

    const/4 v3, 0x4

    invoke-direct {v1, p0, v2, v3}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    const v3, 0x7f1404ed

    invoke-virtual {p1, v7, v3, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_e8
    invoke-virtual {p0, p1}, Lat5;->f(Lqb7;)V

    iget-boolean v0, v0, Lqs5;->t:Z

    if-nez v0, :cond_f2

    invoke-virtual {p0, p1}, Lat5;->h(Lqb7;)V

    :cond_f2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_104

    new-instance v0, Lts5;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v2, v1}, Lts5;-><init>(Lat5;Ljava/lang/String;B)V

    const v1, 0x7f1404f6

    invoke-virtual {p1, v8, v1, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_104
    invoke-virtual {p0, p1, v10}, Lat5;->k(Lqb7;Z)V

    return-void

    :cond_108
    iget-object v4, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v3, :cond_1a5

    iget-boolean v3, v4, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iget-boolean v3, v4, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    sget-object v4, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v5}, LJ/N;->MnqPXHwj(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {p0, v10}, Lat5;->j(I)Z

    move-result v6

    if-eqz v6, :cond_142

    if-eqz v4, :cond_142

    const v6, 0x7f080244

    if-eqz v3, :cond_125

    move v7, v6

    goto :goto_128

    :cond_125
    const v7, 0x7f0804df

    :goto_128
    new-instance v9, Lus5;

    invoke-direct {v9, p0, v1}, Lus5;-><init>(Lat5;B)V

    const v11, 0x7f1404fc

    invoke-virtual {p1, v7, v11, v9}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    if-nez v3, :cond_142

    new-instance v3, Lus5;

    const/16 v7, 0xb

    invoke-direct {v3, p0, v7}, Lus5;-><init>(Lat5;B)V

    const v7, 0x7f1404fe

    invoke-virtual {p1, v6, v7, v3}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_142
    invoke-virtual {p0, v1}, Lat5;->j(I)Z

    move-result v1

    if-eqz v1, :cond_15a

    if-eqz v4, :cond_15a

    new-instance v1, Lus5;

    const/16 v3, 0xc

    invoke-direct {v1, p0, v3}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f0805a5

    const v4, 0x7f1404fd

    invoke-virtual {p1, v3, v4, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_15a
    invoke-virtual {p0, p1}, Lat5;->f(Lqb7;)V

    iget-boolean v1, v0, Lqs5;->t:Z

    if-nez v1, :cond_164

    invoke-virtual {p0, p1}, Lat5;->h(Lqb7;)V

    :cond_164
    new-instance v1, Lus5;

    const/16 v3, 0xd

    invoke-direct {v1, p0, v3}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f08057b

    const v4, 0x7f1404f4

    invoke-virtual {p1, v3, v4, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    if-nez v2, :cond_18b

    iget-object v0, v0, Lqs5;->c:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18b

    new-instance v0, Lus5;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lus5;-><init>(Lat5;B)V

    const v1, 0x7f1404f5

    invoke-virtual {p1, v8, v1, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_18b
    invoke-static {v5}, Lwqm;->t(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a1

    new-instance v0, Lus5;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lus5;-><init>(Lat5;B)V

    const v1, 0x7f080543

    const v2, 0x7f1404f8

    invoke-virtual {p1, v1, v2, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_1a1
    invoke-virtual {p0, p1, v10}, Lat5;->k(Lqb7;Z)V

    return-void

    :cond_1a5
    if-eqz v2, :cond_1ab

    invoke-virtual {p0, p1, v6}, Lat5;->k(Lqb7;Z)V

    return-void

    :cond_1ab
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lat5;->j(I)Z

    move-result v1

    if-eqz v1, :cond_1fa

    iget-object v1, v0, Lqs5;->f:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1fa

    iget-boolean v0, v0, Lqs5;->j:Z

    if-eqz v0, :cond_1fa

    new-instance v0, Lus5;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lus5;-><init>(Lat5;B)V

    const v1, 0x7f0805e5

    const v2, 0x7f1404eb

    invoke-virtual {p1, v1, v2, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/ClipboardManager;

    if-eqz p0, :cond_1fa

    invoke-virtual {p0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result p0

    if-eqz p0, :cond_1fa

    invoke-virtual {v4}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    check-cast p0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    new-instance v0, Lyk4;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lyk4;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f0805ae

    const v1, 0x7f1404ff

    invoke-virtual {p1, p0, v1, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_1fa
    return-void
.end method

.method public final f(Lqb7;)V
    .registers 7

    iget-object v0, p0, Lat5;->d:Lqs5;

    iget-object v1, v0, Lqs5;->b:Ljava/lang/String;

    iget-object v0, v0, Lqs5;->c:Ljava/lang/String;

    sget-object v2, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_c

    const-string v0, ""

    :cond_c
    new-instance v2, Li4d;

    new-instance v3, Le5f;

    const/16 v4, 0xa

    invoke-direct {v3, v1, v0, v4}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v2, v3}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lnf;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v2, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const v1, 0x7f14050a

    invoke-virtual {p1, v1, v0}, Lqb7;->m(ILandroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0a40

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    invoke-static {p1}, Lrmh;->a(Landroid/view/View;)Lrmh;

    move-result-object v0

    new-instance v1, Lxs5;

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v3}, Lxs5;-><init>(Lat5;Landroid/widget/ImageView;B)V

    iget-object p0, p0, Lat5;->g:Lb2l;

    invoke-virtual {v0, v2, p0, v1}, Lrmh;->b(Li4d;Lb2l;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final h(Lqb7;)V
    .registers 7

    iget-object v0, p0, Lat5;->e:Lk73;

    iget-object v0, v0, Lk73;->d:Ljava/lang/Object;

    check-cast v0, Lg1j;

    invoke-interface {v0}, Lg1j;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lat5;->d:Lqs5;

    iget-boolean v2, v1, Lqs5;->t:Z

    const v3, 0x7f140f33

    const v4, 0x7f080558

    if-eqz v2, :cond_22

    new-instance v1, Lws5;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lws5;-><init>(Lat5;Lg1j;B)V

    invoke-virtual {p1, v4, v3, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    return-void

    :cond_22
    iget-boolean v1, v1, Lqs5;->s:Z

    if-eqz v1, :cond_2f

    new-instance v1, Lws5;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lws5;-><init>(Lat5;Lg1j;B)V

    invoke-virtual {p1, v4, v3, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_2f
    return-void
.end method

.method public final j(I)Z
    .registers 2

    iget-byte p0, p0, Lat5;->h:B

    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final k(Lqb7;Z)V
    .registers 17

    iget-object v1, p1, Lqb7;->c:Ljava/lang/Object;

    check-cast v1, Lq73;

    iget-object v7, p0, Lat5;->d:Lqs5;

    iget-boolean v2, v7, Lqs5;->t:Z

    iget-object v8, v7, Lqs5;->e:Ljava/lang/String;

    if-eqz v2, :cond_1a6

    const/4 v2, 0x0

    if-eqz p2, :cond_21

    iget-object v3, p1, Lqb7;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/LayoutInflater;

    iget-object v4, p1, Lqb7;->a:Ljava/lang/Object;

    check-cast v4, Landroid/widget/LinearLayout;

    const v5, 0x7f0d010e

    invoke-virtual {v3, v5, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_21
    const/4 v9, 0x4

    invoke-virtual {p0, v9}, Lat5;->j(I)Z

    move-result v3

    const/4 v10, 0x3

    const/4 v11, 0x1

    iget-object v12, p0, Ldej;->b:Lmej;

    if-eqz v3, :cond_cf

    invoke-static {v8}, Lwqm;->t(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_cf

    invoke-interface {v12}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v3

    invoke-virtual {v3}, Lq6e;->b()Leri;

    move-result-object v13

    invoke-interface {v13}, Leri;->c()Z

    move-result v3

    if-eqz v3, :cond_cf

    sget-object v3, Leti;->a:Lq6e;

    instance-of v3, v13, Lf1a;

    iget-object v4, p0, Lat5;->k:Lru9;

    iget-object v4, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "browser.context_menu.used_google_lens"

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    new-instance v4, Lys5;

    invoke-direct {v4, p0, v3, v2, v13}, Lys5;-><init>(Lat5;ZZLeri;)V

    if-eqz v3, :cond_89

    xor-int/lit8 v6, v2, 0x1

    iget-object v1, v1, Ldej;->b:Lmej;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0803d6

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f140505

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f0d039d

    move-object v1, v2

    const/4 v2, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Lqb7;->j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;

    goto :goto_cf

    :cond_89
    invoke-interface {v12}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-static {v2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-interface {v12}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v13, v2, v0}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    iget-object v1, v1, Ldej;->b:Lmej;

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f140504

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f0d039d

    const/4 v2, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Lqb7;->j(Landroid/graphics/drawable/Drawable;ZLjava/lang/String;Landroid/view/View$OnClickListener;IZ)Landroid/view/View;

    move-result-object v1

    new-instance v2, Le73;

    invoke-direct {v2, p0, v13, v10}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v3, Lq9n;->c:Ll5b;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_cf

    invoke-static {v3, v1, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_cf
    :goto_cf
    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Lat5;->j(I)Z

    move-result v1

    iget-object v2, p0, Lat5;->e:Lk73;

    if-eqz v1, :cond_f9

    invoke-static {v8}, Lwqm;->t(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f9

    iget-object v1, v2, Lk73;->e:Ljava/lang/Object;

    check-cast v1, Ljv0;

    invoke-interface {v1}, Ljv0;->v()Z

    move-result v1

    if-eqz v1, :cond_f9

    new-instance v1, Lus5;

    const/16 v3, 0x9

    invoke-direct {v1, p0, v3}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f0803ec

    const v4, 0x7f1401dc

    invoke-virtual {p1, v3, v4, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_f9
    iget-boolean v1, v7, Lqs5;->s:Z

    if-eqz v1, :cond_10c

    new-instance v1, Lus5;

    invoke-direct {v1, p0, v10}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f080575

    const v4, 0x7f1404f9

    invoke-virtual {p1, v3, v4, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    goto :goto_134

    :cond_10c
    iget-object v1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v3, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v8}, LJ/N;->MnqPXHwj(Ljava/lang/Object;)Z

    move-result v3

    invoke-virtual {p0, v11}, Lat5;->j(I)Z

    move-result v4

    if-eqz v4, :cond_134

    if-eqz v3, :cond_134

    iget-boolean v1, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-eqz v1, :cond_126

    const v1, 0x7f080244

    goto :goto_129

    :cond_126
    const v1, 0x7f0804df

    :goto_129
    new-instance v3, Lus5;

    invoke-direct {v3, p0, v9}, Lus5;-><init>(Lat5;B)V

    const v4, 0x7f1404fa

    invoke-virtual {p1, v1, v4, v3}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_134
    :goto_134
    invoke-static {v8}, Lwqm;->t(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14a

    new-instance v1, Lus5;

    const/16 v3, 0xa

    invoke-direct {v1, p0, v3}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f080543

    const v4, 0x7f140503

    invoke-virtual {p1, v3, v4, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_14a
    new-instance v1, Lus5;

    const/4 v3, 0x7

    invoke-direct {v1, p0, v3}, Lus5;-><init>(Lat5;B)V

    const v3, 0x7f140509

    invoke-virtual {p1, v3, v1}, Lqb7;->m(ILandroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a0a40

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    new-instance v3, Lge5;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v1, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lk73;->u(Lge5;)V

    invoke-virtual/range {p0 .. p1}, Lat5;->h(Lqb7;)V

    new-instance v1, Lus5;

    invoke-direct {v1, p0, v4}, Lus5;-><init>(Lat5;B)V

    const v2, 0x7f080533

    const v3, 0x7f1404f2

    invoke-virtual {p1, v2, v3, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    invoke-interface {v12}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v2, v7, Lqs5;->o:I

    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v3, v3, 0x2

    if-le v2, v3, :cond_1a6

    iget v2, v7, Lqs5;->p:I

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/lit8 v1, v1, 0x2

    if-le v2, v1, :cond_1a6

    new-instance v1, Lus5;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lus5;-><init>(Lat5;B)V

    const p0, 0x7f080631

    const v2, 0x7f140f42

    invoke-virtual {p1, p0, v2, v1}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    :cond_1a6
    return-void
.end method

.method public final l(Lvx3;ZZ)V
    .registers 8

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object v0

    sget-object v1, Lq7j;->b:Lq7j;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_1e

    move v0, v3

    goto :goto_1f

    :cond_1e
    move v0, v2

    :goto_1f
    iget-object v1, p0, Lat5;->g:Lb2l;

    if-eqz v1, :cond_2d

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    iput v1, p1, Lvx3;->g:I

    :cond_2d
    if-nez p3, :cond_37

    if-eqz v0, :cond_37

    iput v3, p1, Lvx3;->d:I

    invoke-virtual {p1, v3}, Lvx3;->d(Z)V

    goto :goto_3a

    :cond_37
    invoke-virtual {p1, v3}, Lvx3;->a(Z)V

    :goto_3a
    invoke-virtual {p1, v3}, Lvx3;->c(Z)V

    iget-object p3, p0, Lat5;->d:Lqs5;

    iget-object p3, p3, Lqs5;->k:Lsqh;

    iput-object p3, p1, Lvx3;->l:Lsqh;

    if-nez p2, :cond_4b

    iget-object p2, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p2, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    if-eqz p2, :cond_4c

    :cond_4b
    move v2, v3

    :cond_4c
    invoke-virtual {p1, v2}, Lvx3;->e(Z)V

    new-instance p2, Lay3;

    invoke-direct {p2, p1}, Lay3;-><init>(Lvx3;)V

    iget-object p0, p0, Lat5;->i:Lcom/opera/api/Callback;

    invoke-interface {p0, p2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final m(Landroid/content/Intent;)V
    .registers 3

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_5
    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_5 .. :try_end_e} :catch_e

    :catch_e
    return-void
.end method
