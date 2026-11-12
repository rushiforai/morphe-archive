.class public final Lqg7;
.super Lyzi;
.source "SourceFile"


# instance fields
.field public final f:Lig2;

.field public final g:Landroid/widget/TextView;

.field public final h:Landroid/view/View;

.field public final i:Lcom/google/android/material/progressindicator/LinearProgressIndicator;

.field public final j:Lcom/opera/android/custom_views/StylingImageView;

.field public final k:Lcom/opera/android/custom_views/StylingImageButton;

.field public final l:Lz;

.field public final m:Landroid/view/View;

.field public final n:Landroid/widget/TextView;

.field public o:I

.field public p:Lre7;

.field public final q:Lpg7;

.field public final r:Lk5o;

.field public final s:Lxbf;

.field public final t:Lng7;

.field public final u:Log7;

.field public final v:Lc5o;

.field public w:I


# direct methods
.method public constructor <init>(Landroid/view/View;Ljg7;Ltzi;Lxbf;)V
    .registers 10

    invoke-direct {p0, p1, p3}, Lyzi;-><init>(Landroid/view/View;Ltzi;)V

    new-instance p3, Lz;

    invoke-direct {p3, p0}, Lz;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lqg7;->l:Lz;

    new-instance p3, Lk5o;

    invoke-direct {p3, p0}, Lk5o;-><init>(Lqg7;)V

    iput-object p3, p0, Lqg7;->r:Lk5o;

    new-instance p3, Lng7;

    invoke-direct {p3, p0}, Lng7;-><init>(Lqg7;)V

    iput-object p3, p0, Lqg7;->t:Lng7;

    new-instance p3, Lc5o;

    const/16 v0, 0x1d

    invoke-direct {p3, v0}, Lc5o;-><init>(B)V

    iput-object p3, p0, Lqg7;->v:Lc5o;

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p3

    if-eqz p3, :cond_29

    const/4 p3, 0x0

    goto :goto_2e

    :cond_29
    new-instance p3, Lpg7;

    invoke-direct {p3, p0}, Lpg7;-><init>(Lqg7;)V

    :goto_2e
    iput-object p3, p0, Lqg7;->q:Lpg7;

    iput-object p4, p0, Lqg7;->s:Lxbf;

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p3, 0x1

    invoke-virtual {p1, p3}, Landroid/view/View;->setLongClickable(Z)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    const p4, 0x7f0a0311

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    iput-object p4, p0, Lqg7;->h:Landroid/view/View;

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p4, 0x7f0a0309

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p4, Landroid/widget/TextView;

    iput-object p4, p0, Lqg7;->g:Landroid/widget/TextView;

    const p4, 0x7f0a031e

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p4, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    iput-object p4, p0, Lqg7;->i:Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    const v0, 0x7f0a0327

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f0a0308

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v1, p0, Lqg7;->j:Lcom/opera/android/custom_views/StylingImageView;

    const v1, 0x7f0a0301

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    iput-object v1, p0, Lqg7;->k:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v2, Lohi;

    const/4 v3, 0x0

    invoke-direct {v2, p2, v3}, Lohi;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0a0302

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p2, p0, Lqg7;->m:Landroid/view/View;

    const p2, 0x7f0a030b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lqg7;->n:Landroid/widget/TextView;

    new-instance p2, Lig2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x41c00000    # 24.0f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-direct {p2, v1, v2}, Lig2;-><init>(Landroid/content/Context;I)V

    iput-object p2, p0, Lqg7;->f:Lig2;

    iput p3, p0, Lqg7;->w:I

    new-instance p2, Log7;

    invoke-direct {p2, v0}, Log7;-><init>(Landroid/widget/TextView;)V

    iput-object p2, p0, Lqg7;->u:Log7;

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_de

    invoke-static {v1, v0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_de
    new-instance p2, Lmg7;

    invoke-direct {p2, p0, v3}, Lmg7;-><init>(Lqg7;B)V

    invoke-static {p4}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_ec

    invoke-static {v0, p4, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_ec
    new-instance p2, Lmg7;

    invoke-direct {p2, p0, p3}, Lmg7;-><init>(Lqg7;B)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    if-nez p0, :cond_fc

    return-void

    :cond_fc
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final e0()V
    .registers 3

    iget-object v0, p0, Lqg7;->p:Lre7;

    const/4 v1, 0x0

    iput-object v1, p0, Lqg7;->p:Lre7;

    iget-object v1, p0, Lqg7;->q:Lpg7;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Lpg7;->a()V

    :cond_c
    iget-object v1, p0, Lqg7;->t:Lng7;

    invoke-virtual {v0, v1}, Lre7;->t(Lqe7;)V

    iget-object v0, p0, Lqg7;->r:Lk5o;

    iget-object v0, v0, Lk5o;->b:Ljava/lang/Object;

    check-cast v0, Lbl6;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-super {p0}, Lyzi;->e0()V

    return-void
.end method

.method public final g0(Z)V
    .registers 3

    iget-object v0, p0, Lqg7;->l:Lz;

    iput-boolean p1, v0, Lz;->a:Z

    invoke-virtual {v0}, Lz;->s()V

    if-eqz p1, :cond_b

    const/4 p1, 0x0

    goto :goto_c

    :cond_b
    const/4 p1, 0x4

    :goto_c
    iget-object p0, p0, Lqg7;->h:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final j0()V
    .registers 7

    iget v0, p0, Lqg7;->o:I

    const/4 v1, 0x3

    iget-object v2, p0, Lqg7;->i:Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-ne v0, v1, :cond_d

    const/16 p0, 0x8

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_d
    if-eqz v0, :cond_64

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lqg7;->o:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const v3, 0x7f06063b

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_2c

    if-eq v1, v4, :cond_24

    move v0, v5

    goto :goto_30

    :cond_24
    const v1, 0x7f0402d3

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    goto :goto_30

    :cond_2c
    invoke-static {v0}, Lf03;->C(Landroid/content/Context;)I

    move-result v0

    :goto_30
    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/material/progressindicator/LinearProgressIndicator;->f([I)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget p0, p0, Lqg7;->o:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_4f

    if-eq p0, v4, :cond_47

    move p0, v5

    goto :goto_56

    :cond_47
    const p0, 0x7f0402d4

    invoke-static {p0, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    goto :goto_56

    :cond_4f
    const p0, 0x7f0402ff

    invoke-static {p0, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    :goto_56
    iget-object v0, v2, Lo83;->a:Lp83;

    iget v1, v0, Lp83;->f:I

    if-eq v1, p0, :cond_61

    iput p0, v0, Lp83;->f:I

    invoke-virtual {v2}, Lo83;->invalidate()V

    :cond_61
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_64
    return-void
.end method

.method public final k0(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    iget-object v1, p0, Lqg7;->m:Landroid/view/View;

    iget-object p0, p0, Lqg7;->n:Landroid/widget/TextView;

    if-eqz v0, :cond_13

    const/16 p1, 0x8

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final l0(Lre7;)V
    .registers 8

    iget-object v0, p0, Lqg7;->q:Lpg7;

    if-eqz v0, :cond_17

    iget-object v1, v0, Lpg7;->e:Lqg7;

    iget-object v2, v1, Lqg7;->p:Lre7;

    invoke-virtual {v2}, Lre7;->m()Z

    move-result v2

    if-eqz v2, :cond_12

    iget-wide v0, v0, Lpg7;->b:D

    double-to-long v0, v0

    goto :goto_19

    :cond_12
    iget-object v0, v1, Lqg7;->p:Lre7;

    iget-wide v0, v0, Lre7;->i:J

    goto :goto_19

    :cond_17
    iget-wide v0, p1, Lre7;->i:J

    :goto_19
    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Llg7;->a:[[I

    invoke-virtual {p1}, Lre7;->i()Z

    move-result v3

    if-nez v3, :cond_37

    invoke-virtual {p1}, Lre7;->i()Z

    move-result v0

    if-eqz v0, :cond_30

    iget-wide v0, p1, Lre7;->j:J

    goto :goto_32

    :cond_30
    iget-wide v0, p1, Lre7;->i:J

    :goto_32
    invoke-static {v0, v1, v2}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_59

    :cond_37
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v0, v1, v2}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lre7;->i()Z

    move-result v1

    if-eqz v1, :cond_48

    iget-wide v4, p1, Lre7;->j:J

    goto :goto_4a

    :cond_48
    iget-wide v4, p1, Lre7;->i:J

    :goto_4a
    invoke-static {v4, v5, v2}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f140622

    invoke-virtual {v3, v1, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_59
    iget-object v1, p0, Lqg7;->u:Log7;

    const/4 v2, 0x0

    iput-boolean v2, v1, Log7;->b:Z

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_85

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean v1, v1, Log7;->b:Z

    if-eqz v1, :cond_7e

    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_82

    :cond_7e
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_82
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_85
    invoke-virtual {p1}, Lre7;->i()Z

    move-result v0

    iget-object p0, p0, Lqg7;->i:Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-eqz v0, :cond_a9

    invoke-virtual {p0, v2}, Lo83;->setIndeterminate(Z)V

    iget-wide v0, p1, Lre7;->j:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_9b

    const-wide/16 v0, 0x0

    goto :goto_a1

    :cond_9b
    iget-wide v2, p1, Lre7;->i:J

    long-to-double v2, v2

    long-to-double v0, v0

    div-double v0, v2, v0

    :goto_a1
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    double-to-int p1, v0

    invoke-virtual {p0, p1}, Lo83;->setProgress(I)V

    return-void

    :cond_a9
    invoke-virtual {p0, v2}, Lo83;->setProgress(I)V

    invoke-virtual {p1}, Lre7;->m()Z

    move-result p1

    if-eqz p1, :cond_b7

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lo83;->setIndeterminate(Z)V

    return-void

    :cond_b7
    invoke-virtual {p0, v2}, Lo83;->setIndeterminate(Z)V

    return-void
.end method

.method public final m0(Lre7;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v1, :cond_165

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Llg7;->a:[[I

    invoke-static {v1}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lre7;->f()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v5

    invoke-virtual {v5, v4, v3}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v3

    invoke-static {v3}, Llg7;->g(Lo29;)Lkg7;

    move-result-object v3

    iget-object v4, v0, Lqg7;->s:Lxbf;

    iget-object v5, v4, Lxbf;->c:Ljava/lang/Object;

    check-cast v5, Lode;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lgig;

    invoke-interface {v5}, Lgig;->g()Lqjd;

    move-result-object v6

    if-eqz v6, :cond_45

    iget-object v4, v4, Lxbf;->b:Ljava/lang/Object;

    check-cast v4, Ltjg;

    iget-object v4, v4, Ltjg;->k:Lokg;

    iget-object v4, v4, Lokg;->e:Ljava/util/HashMap;

    iget-object v6, v6, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Legd;

    goto :goto_46

    :cond_45
    const/4 v4, 0x0

    :goto_46
    invoke-interface {v5}, Lgig;->e0()Z

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v6, :cond_56

    if-eqz v4, :cond_56

    iget-object v9, v4, Legd;->a:Lre7;

    if-ne v1, v9, :cond_56

    move v9, v8

    goto :goto_57

    :cond_56
    move v9, v7

    :goto_57
    const/4 v10, 0x2

    const/4 v11, 0x3

    if-eqz v9, :cond_5d

    move v12, v11

    goto :goto_5e

    :cond_5d
    move v12, v10

    :goto_5e
    const/16 v13, 0x11

    iget-object v14, v0, Lqg7;->f:Lig2;

    if-ne v12, v11, :cond_85

    iget v15, v0, Lqg7;->w:I

    if-eq v15, v12, :cond_82

    invoke-virtual {v14, v7}, Lf3d;->p(I)V

    new-instance v15, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v3, v8, v2}, Lkg7;->g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    new-instance v11, Lw3a;

    invoke-direct {v11, v14, v13, v7}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    new-array v13, v10, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v13, v7

    aput-object v11, v13, v8

    invoke-direct {v15, v13}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v15}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    :cond_82
    move/from16 v16, v8

    goto :goto_a2

    :cond_85
    invoke-virtual {v3, v8, v2}, Lkg7;->h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    new-instance v15, Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v3, v8, v2}, Lkg7;->g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    move/from16 v16, v8

    new-instance v8, Lw3a;

    invoke-direct {v8, v11, v13, v7}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    new-array v11, v10, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v11, v7

    aput-object v8, v11, v16

    invoke-direct {v15, v11}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v15}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    :goto_a2
    iput v12, v0, Lqg7;->w:I

    invoke-virtual {v1}, Lre7;->C()Z

    move-result v2

    iget-object v8, v0, Lqg7;->j:Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_b0

    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_b5

    :cond_b0
    const/16 v2, 0x8

    invoke-virtual {v8, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_b5
    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v3, v2}, Lkg7;->i(Landroid/content/Context;)I

    move-result v2

    iget v3, v14, Lig2;->K:I

    if-eq v3, v2, :cond_c8

    iput v2, v14, Lig2;->K:I

    invoke-virtual {v14}, Lf3d;->invalidateSelf()V

    :cond_c8
    const-string v2, ""

    iget-object v3, v0, Lqg7;->u:Log7;

    if-eqz v9, :cond_154

    iget-object v1, v0, Lqg7;->r:Lk5o;

    iget-object v1, v1, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Lbl6;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v8, 0x3e8

    invoke-static {v1, v8, v9}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {v0, v2}, Lqg7;->k0(Ljava/lang/String;)V

    invoke-interface {v5}, Lgig;->getCurrentPosition()J

    move-result-wide v1

    invoke-interface {v5}, Lgig;->getDuration()J

    move-result-wide v8

    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v5, v8, v10

    iget-object v10, v0, Lqg7;->v:Lc5o;

    if-eqz v5, :cond_114

    invoke-virtual {v4}, Legd;->b()Lo29;

    move-result-object v4

    sget-object v5, Lo29;->c:Lo29;

    if-eq v4, v5, :cond_114

    iget-object v0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v10, v1, v2}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v8, v9}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f140a25

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_118

    :cond_114
    invoke-virtual {v10, v1, v2}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v0

    :goto_118
    iput-boolean v7, v3, Log7;->b:Z

    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_141

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-boolean v1, v3, Log7;->b:Z

    if-eqz v1, :cond_13a

    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_13e

    :cond_13a
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_13e
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_141
    iget-boolean v0, v14, Lig2;->J:Z

    if-eq v0, v6, :cond_165

    iput-boolean v6, v14, Lig2;->J:Z

    if-eqz v6, :cond_14d

    invoke-virtual {v14}, Lf3d;->k()V

    goto :goto_150

    :cond_14d
    invoke-virtual {v14}, Lf3d;->j()V

    :goto_150
    invoke-virtual {v14}, Lf3d;->invalidateSelf()V

    return-void

    :cond_154
    iget v4, v1, Lre7;->f:I

    invoke-static {v4}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_316

    move/from16 v5, v16

    if-eq v4, v5, :cond_25c

    if-eq v4, v10, :cond_1de

    const/4 v5, 0x3

    if-eq v4, v5, :cond_166

    :cond_165
    return-void

    :cond_166
    iget v2, v0, Lqg7;->o:I

    if-eq v2, v5, :cond_16f

    iput v5, v0, Lqg7;->o:I

    invoke-virtual {v0}, Lqg7;->j0()V

    :cond_16f
    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1}, Lre7;->i()Z

    move-result v4

    if-eqz v4, :cond_17e

    iget-wide v4, v1, Lre7;->j:J

    goto :goto_180

    :cond_17e
    iget-wide v4, v1, Lre7;->i:J

    :goto_180
    invoke-static {v4, v5, v2}, Laik;->i(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iput-boolean v7, v3, Log7;->b:Z

    invoke-virtual {v2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1ad

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_1a6

    invoke-static {v2}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v2

    goto :goto_1aa

    :cond_1a6
    invoke-static {v2}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v2

    :goto_1aa
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1ad
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, v1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->n()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/32 v4, 0xea60

    cmp-long v2, v2, v4

    if-gez v2, :cond_1cd

    iget-object v1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1405b3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1da

    :cond_1cd
    new-instance v2, Ljava/util/Date;

    invoke-interface {v1}, Lcom/opera/android/downloads/DownloadItem;->n()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Laik;->e(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    :goto_1da
    invoke-virtual {v0, v1}, Lqg7;->k0(Ljava/lang/String;)V

    return-void

    :cond_1de
    iget v1, v0, Lqg7;->o:I

    const/4 v5, 0x3

    if-eq v1, v5, :cond_1e8

    iput v5, v0, Lqg7;->o:I

    invoke-virtual {v0}, Lqg7;->j0()V

    :cond_1e8
    iget-object v1, v0, Lqg7;->p:Lre7;

    iget-object v4, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v1, v4}, Lre7;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_221

    const/4 v5, 0x1

    iput-boolean v5, v3, Log7;->b:Z

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_258

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_219

    invoke-static {v1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_21d

    :cond_219
    invoke-static {v1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_21d
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_258

    :cond_221
    iget-object v1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f1405ad

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v5, 0x1

    iput-boolean v5, v3, Log7;->b:Z

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_258

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_251

    invoke-static {v1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_255

    :cond_251
    invoke-static {v1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_255
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_258
    :goto_258
    invoke-virtual {v0, v2}, Lqg7;->k0(Ljava/lang/String;)V

    return-void

    :cond_25c
    iget v4, v0, Lqg7;->o:I

    if-eq v4, v10, :cond_265

    iput v10, v0, Lqg7;->o:I

    invoke-virtual {v0}, Lqg7;->j0()V

    :cond_265
    invoke-virtual/range {p0 .. p1}, Lqg7;->l0(Lre7;)V

    iget-object v4, v0, Lqg7;->p:Lre7;

    iget-object v5, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v4, v5}, Lre7;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2e8

    invoke-virtual {v1}, Lre7;->n()Z

    move-result v1

    iget-object v4, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v1, :cond_2b3

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f1405ec

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-boolean v7, v3, Log7;->b:Z

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_312

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_2ab

    invoke-static {v1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_2af

    :cond_2ab
    invoke-static {v1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_2af
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_312

    :cond_2b3
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v4, 0x7f1405eb

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-boolean v7, v3, Log7;->b:Z

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_312

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_2e0

    invoke-static {v1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_2e4

    :cond_2e0
    invoke-static {v1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_2e4
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_312

    :cond_2e8
    const/4 v5, 0x1

    iput-boolean v5, v3, Log7;->b:Z

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v5, v3, Log7;->a:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_312

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v3, v3, Log7;->b:Z

    if-eqz v3, :cond_30b

    invoke-static {v1}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    goto :goto_30f

    :cond_30b
    invoke-static {v1}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :goto_30f
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_312
    :goto_312
    invoke-virtual {v0, v2}, Lqg7;->k0(Ljava/lang/String;)V

    return-void

    :cond_316
    iget v3, v0, Lqg7;->o:I

    const/4 v5, 0x1

    if-eq v3, v5, :cond_320

    iput v5, v0, Lqg7;->o:I

    invoke-virtual {v0}, Lqg7;->j0()V

    :cond_320
    invoke-virtual/range {p0 .. p1}, Lqg7;->l0(Lre7;)V

    invoke-virtual {v0, v2}, Lqg7;->k0(Ljava/lang/String;)V

    return-void
.end method
