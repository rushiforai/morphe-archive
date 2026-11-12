.class public final Lqb9;
.super Lxb9;
.source "SourceFile"


# instance fields
.field public final m:Lfge;

.field public final n:Lnb9;

.field private final o:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final p:Landroid/widget/TextView;

.field public final q:Landroid/widget/ImageView;

.field public final r:Landroid/widget/ImageView;

.field public final s:Lcom/opera/android/custom_views/StylingImageButton;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lfge;Lnb9;)V
    .registers 8

    invoke-direct/range {p0 .. p5}, Lxb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;)V

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a0435

    invoke-static {p3, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lqb9;->o:Landroid/widget/TextView;

    const p2, 0x7f0a0a80

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lqb9;->p:Landroid/widget/TextView;

    const p2, 0x7f0a085d

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lqb9;->q:Landroid/widget/ImageView;

    const p2, 0x7f0a0bfc

    invoke-static {p3, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lqb9;->r:Landroid/widget/ImageView;

    const p4, 0x7f0a0046

    invoke-static {p3, p4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    check-cast p3, Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p3, p0, Lqb9;->s:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p6, p0, Lqb9;->m:Lfge;

    iput-object p7, p0, Lqb9;->n:Lnb9;

    invoke-virtual {p0, p1}, Lxb9;->b0(Landroid/widget/TextView;)V

    new-instance p1, Lpb9;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lpb9;-><init>(Lqb9;B)V

    invoke-static {p2, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    iget-object p1, p0, Lxb9;->i:Landroid/widget/TextView;

    new-instance p2, Lpb9;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lpb9;-><init>(Lqb9;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 12

    invoke-super {p0, p1, p2}, Lxb9;->V(Lja2;Z)V

    check-cast p1, Lib9;

    invoke-virtual {p0, p1}, Lxb9;->c0(Lhb9;)I

    move-result p2

    iget-wide v0, p1, Lib9;->j:J

    iget-object v2, p1, Lib9;->e:Ljava/lang/String;

    iget-object v3, p1, Lib9;->k:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne p2, v5, :cond_15

    move p2, v5

    goto :goto_16

    :cond_15
    move p2, v4

    :goto_16
    iget-object v6, p0, Lqb9;->o:Landroid/widget/TextView;

    sget-object v7, Laik;->a:[Ljava/lang/String;

    invoke-static {v2}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    iget-object v7, p0, Lqb9;->p:Landroid/widget/TextView;

    const/16 v8, 0x8

    if-lez v6, :cond_3a

    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v0, v1, v6}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3d

    :cond_3a
    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    :goto_3d
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lqb9;->q:Landroid/widget/ImageView;

    if-eqz v0, :cond_49

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_71

    :cond_49
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    sget-object v0, Lyne;->b:Ldeg;

    invoke-virtual {v0, v3}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v0

    iput-boolean v5, v0, Ldwh;->d:Z

    invoke-virtual {v0}, Ldwh;->a()V

    invoke-static {v3}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_64

    iget-object v3, p0, Lqb9;->n:Lnb9;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_66

    :cond_64
    sget-object v3, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_66
    invoke-virtual {v0, v3}, Ldwh;->m(Ljava/util/List;)V

    iget-object v3, v0, Ldwh;->b:Lgvh;

    iput-boolean v5, v3, Lgvh;->k:Z

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    :goto_71
    if-nez p2, :cond_81

    iget-object p2, p0, Lqb9;->m:Lfge;

    invoke-virtual {p2, p1}, Lfge;->G0(Lib9;)Z

    move-result p2

    if-nez p2, :cond_81

    invoke-virtual {p1}, Lib9;->e()Z

    move-result p2

    if-eqz p2, :cond_82

    :cond_81
    move v4, v8

    :cond_82
    iget-object p2, p0, Lqb9;->s:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p2, v4}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Ljf7;

    const/16 v1, 0xa

    invoke-direct {v0, p0, p1, v1}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lqb9;->r:Landroid/widget/ImageView;

    iget-object p1, p1, Lib9;->h:Ljava/lang/String;

    invoke-static {p0, v2, p1}, Lbc9;->u(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final e0(Lja2;)Z
    .registers 4

    check-cast p1, Lib9;

    iget-object p0, p0, Lqb9;->m:Lfge;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfge;->K0(Lib9;Z)Z

    move-result p0

    const/4 v1, 0x1

    if-eqz p0, :cond_d

    return v1

    :cond_d
    invoke-virtual {p1}, Lib9;->e()Z

    move-result p0

    if-eqz p0, :cond_14

    return v1

    :cond_14
    return v0
.end method

.method public final h0(Lhb9;)Z
    .registers 13

    check-cast p1, Lib9;

    iget-object v0, p1, Lib9;->l:Landroid/net/Uri;

    iget-wide v1, p1, Lib9;->i:J

    const/4 v3, 0x1

    iget-object v4, p0, Lxb9;->i:Landroid/widget/TextView;

    if-eqz v0, :cond_11

    const-string p0, ""

    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v3

    :cond_11
    invoke-virtual {p1}, Lib9;->e()Z

    move-result v0

    xor-int/2addr v0, v3

    iget-object v5, p0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    invoke-virtual {v5, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lib9;->e()Z

    move-result v5

    if-eqz v5, :cond_30

    const v5, 0x7f040316

    const v6, 0x7f060b26

    invoke-static {v5, v0, v6}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_34

    :cond_30
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_34
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1}, Lib9;->e()Z

    move-result v0

    if-eqz v0, :cond_44

    const p0, 0x7f140775

    invoke-virtual {v4, p0}, Landroid/widget/TextView;->setText(I)V

    return v3

    :cond_44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v7, p1, Lhb9;->c:J

    const-wide/16 v9, 0x7d0

    add-long/2addr v7, v9

    cmp-long p1, v7, v5

    if-lez p1, :cond_5c

    const p1, 0x7f14077a

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(I)V

    add-long/2addr v5, v9

    invoke-virtual {p0, v5, v6}, Lxb9;->g0(J)V

    return v3

    :cond_5c
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-static {v0}, Laik;->e(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v3, 0x7f140776

    invoke-virtual {p1, v3, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v1, v2}, Lxb9;->g0(J)V

    const/4 p0, 0x0

    return p0
.end method
