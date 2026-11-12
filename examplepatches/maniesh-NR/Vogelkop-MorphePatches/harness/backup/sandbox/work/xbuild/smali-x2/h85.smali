.class public final Lh85;
.super Ljal;
.source "SourceFile"

# interfaces
.implements Lpkb;
.implements Lhlb;
.implements Lklb;


# instance fields
.field public final b:Li85;

.field public final c:Lv8a;

.field public final d:Lk6l;

.field public final e:Lypd;

.field public final f:Lu4l;

.field public final g:Lpde;

.field public final h:Ls9i;

.field public i:Lg2l;

.field public final j:Lne5;

.field public k:Lhal;


# direct methods
.method public constructor <init>(Lpde;Li85;Lv8a;Lk6l;Lypd;Lu4l;Lpde;Ls9i;Lyqa;)V
    .registers 15

    iget-object v0, p2, Li85;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lh85;->b:Li85;

    iput-object p3, p0, Lh85;->c:Lv8a;

    iput-object p4, p0, Lh85;->d:Lk6l;

    iput-object p5, p0, Lh85;->e:Lypd;

    iput-object p6, p0, Lh85;->f:Lu4l;

    iput-object p7, p0, Lh85;->g:Lpde;

    iput-object p8, p0, Lh85;->h:Ls9i;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p5

    invoke-static {p1, p5}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object p1

    new-instance p5, Lg2l;

    sget-object p6, Ll08;->a:Ll08;

    const/4 v1, 0x0

    invoke-direct {p5, p6, v1}, Lg2l;-><init>(Ljava/util/List;I)V

    iput-object p5, p0, Lh85;->i:Lg2l;

    iget-object p5, p2, Li85;->k:Landroid/view/View;

    const/16 p6, 0x1d

    if-eqz p5, :cond_95

    new-instance v2, Lne5;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object p1, v2, Lne5;->a:Ljava/lang/Object;

    iput-object p5, v2, Lne5;->b:Ljava/lang/Object;

    iput-object p9, v2, Lne5;->c:Ljava/lang/Object;

    sget-object p9, Ll08;->a:Ll08;

    iput-object p9, v2, Lne5;->d:Ljava/lang/Object;

    new-instance p9, Ljava/util/ArrayList;

    invoke-direct {p9}, Ljava/util/ArrayList;-><init>()V

    iput-object p9, v2, Lne5;->e:Ljava/lang/Object;

    new-instance p9, Lk4a;

    invoke-direct {p9}, Lk4a;-><init>()V

    iput-object p9, v2, Lne5;->f:Ljava/lang/Object;

    new-instance v3, Ld58;

    const/16 v4, 0x1c

    invoke-direct {v3, v4}, Ld58;-><init>(B)V

    invoke-static {p7, v3}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v3

    invoke-static {v3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v3

    iput-object v3, v2, Lne5;->g:Ljava/lang/Object;

    invoke-virtual {p5, p9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p9, Lpc5;

    const/16 v4, 0x19

    invoke-direct {p9, v2, v4}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v4

    if-eqz v4, :cond_6c

    invoke-static {v4, p5, p9}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_6c
    new-instance p5, Ld58;

    invoke-direct {p5, p6}, Ld58;-><init>(B)V

    invoke-static {v3, p5}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p5

    invoke-static {p5}, Lxf8;->B(Likc;)Ltsd;

    move-result-object p5

    new-instance p9, Lks6;

    const/16 v3, 0x11

    invoke-direct {p9, v2, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p5, p1, p9}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p5, Ltu7;

    const/16 p9, 0x18

    invoke-direct {p5, v2, p9}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p9, Lcl4;

    const/16 v3, 0x1a

    invoke-direct {p9, p5, v3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p9}, Lekc;->k(Lf7f;)V

    goto :goto_96

    :cond_95
    const/4 v2, 0x0

    :goto_96
    iput-object v2, p0, Lh85;->j:Lne5;

    new-instance p5, Lqz;

    const/4 p9, 0x5

    invoke-direct {p5, p0, p9}, Lqz;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lh5k;

    invoke-direct {v2, p1, p7, p2}, Lh5k;-><init>(Ltsd;Lpde;Lre5;)V

    iget-object p7, p2, Li85;->d:Landroid/widget/TextView;

    new-instance v2, Lu7;

    invoke-direct {v2, p0, p6}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p7}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p6

    if-eqz p6, :cond_b3

    invoke-static {p6, p7, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_b3
    new-instance p6, Lf85;

    invoke-direct {p6, p0, v1}, Lf85;-><init>(Ljava/lang/Object;B)V

    new-instance p7, Le85;

    const/4 v2, 0x1

    invoke-direct {p7, p0, v2}, Le85;-><init>(Lh85;B)V

    invoke-static {p3, p1, p6, p7}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p3, Lg85;

    invoke-direct {p3, p0, v1}, Lg85;-><init>(Lh85;B)V

    invoke-virtual {v0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lzt;

    invoke-direct {p3, p0, p9}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p3, p2, Li85;->h:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p3, :cond_dd

    new-instance p6, Lg85;

    invoke-direct {p6, p0, v2}, Lg85;-><init>(Lh85;B)V

    invoke-virtual {p3, p6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_dd
    iget-object p3, p2, Li85;->i:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p3, :cond_ea

    new-instance p6, Lg85;

    const/4 p7, 0x2

    invoke-direct {p6, p0, p7}, Lg85;-><init>(Lh85;B)V

    invoke-virtual {p3, p6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_ea
    iget-object p2, p2, Li85;->j:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p2, :cond_f7

    new-instance p3, Lg85;

    const/4 p6, 0x3

    invoke-direct {p3, p0, p6}, Lg85;-><init>(Lh85;B)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_f7
    iget-object p2, p8, Ls9i;->c:Ljava/lang/Object;

    check-cast p2, Lpde;

    new-instance p3, Ld85;

    invoke-direct {p3, p0, v2}, Ld85;-><init>(Lh85;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p2, p8, Ls9i;->d:Ljava/lang/Object;

    check-cast p2, Lpde;

    new-instance p3, Ld85;

    invoke-direct {p3, p0, v1}, Ld85;-><init>(Lh85;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p2, p4, Lk6l;->s:Lg6l;

    new-instance p3, Le85;

    invoke-direct {p3, p0, v1}, Le85;-><init>(Lh85;B)V

    invoke-static {p2, p1, p5, p3}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 5

    sget-object v0, Lpdb;->a:Lpdb;

    iget-object v1, p0, Lh85;->i:Lg2l;

    iget-object v1, v1, Lg2l;->a:Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lvr0;->z:Lvr0;

    const/4 v3, 0x0

    iget-object p0, p0, Lh85;->e:Lypd;

    invoke-virtual {p0, v1, v0, v2, v3}, Lypd;->g0(Ljava/util/Set;Lpdb;Lvr0;Z)V

    return-void
.end method

.method public final D()V
    .registers 4

    new-instance v0, Lhal;

    iget-object v1, p0, Lh85;->i:Lg2l;

    iget v1, v1, Lg2l;->b:I

    iget-object v2, p0, Lh85;->d:Lk6l;

    iget-object v2, v2, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lhal;-><init>(ILjava/util/List;)V

    iput-object v0, p0, Lh85;->k:Lhal;

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget v0, v0, Lg2l;->b:I

    iget-object p0, p0, Lh85;->e:Lypd;

    invoke-virtual {p0, v0}, Lypd;->q(I)V

    return-void
.end method

.method public final F()V
    .registers 7

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lh85;->g:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-wide v1, p0, Leyj;->C:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-static {v0}, La26;->r(Landroid/view/View;)V

    invoke-static {v0}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v3

    new-instance v4, Luh7;

    const/high16 p0, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v4, p0, p0, v5}, Luh7;-><init>(FFF)V

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    return-void
.end method

.method public final L()V
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lh85;->g:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-wide v1, v1, Leyj;->C:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->B:F

    invoke-static {v0}, La26;->r(Landroid/view/View;)V

    invoke-static {v0}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v3

    new-instance v4, Luh7;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v4, p0, v5, v6}, Luh7;-><init>(FFF)V

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    return-void
.end method

.method public final M(Lial;)V
    .registers 4

    iget-object p1, p1, Lial;->a:Ljava/lang/Iterable;

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget v0, v0, Lg2l;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p1

    sget-object v1, Lvr0;->q:Lvr0;

    iget-object p0, p0, Lh85;->e:Lypd;

    invoke-virtual {p0, v0, p1, v1}, Lypd;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    return-void
.end method

.method public final U()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lh85;->b:Li85;

    iget-object p0, p0, Li85;->c:Landroid/view/View;

    return-object p0
.end method

.method public final V()Lhal;
    .registers 1

    iget-object p0, p0, Lh85;->k:Lhal;

    return-object p0
.end method

.method public final X()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget-object p0, p0, Lg2l;->a:Ljava/util/List;

    return-object p0
.end method

.method public final Y()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lh85;->k:Lhal;

    return-void
.end method

.method public final Z()V
    .registers 4

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget v0, v0, Lg2l;->b:I

    iget-object v1, p0, Lh85;->f:Lu4l;

    invoke-virtual {v1, v0}, Lu4l;->a(I)Lm4l;

    move-result-object v0

    invoke-virtual {v0}, Lm4l;->b()Lk4l;

    move-result-object v0

    iget-object p0, p0, Lh85;->b:Li85;

    iget-object p0, p0, Li85;->d:Landroid/widget/TextView;

    iget-object v1, v0, Lk4l;->a:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, v0, Lk4l;->b:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final a0()V
    .registers 7

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget v0, v0, Lg2l;->b:I

    iget-object v1, p0, Lh85;->f:Lu4l;

    invoke-virtual {v1, v0}, Lu4l;->a(I)Lm4l;

    move-result-object v0

    iget-object v1, p0, Lh85;->b:Li85;

    iget-object v2, v1, Li85;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Lm4l;->c()Lpxh;

    move-result-object v0

    iget-object v3, v1, Li85;->f:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v0, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lh85;->Z()V

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget v0, v0, Lg2l;->b:I

    iget-object p0, p0, Lh85;->c:Lv8a;

    iget-object p0, p0, Lv8a;->g:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu8a;

    const/4 v0, 0x0

    if-eqz p0, :cond_3e

    iget p0, p0, Lu8a;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_3f

    :cond_3e
    move-object p0, v0

    :goto_3f
    if-eqz p0, :cond_88

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    iget-object v2, v1, Li85;->e:Landroid/widget/TextView;

    if-eqz v2, :cond_6c

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%d"

    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v4, :cond_69

    const-string v3, "\u2026"

    :cond_69
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_6c
    iget-object v1, v1, Li85;->g:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v1, :cond_88

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    if-eqz v2, :cond_85

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v3, 0x7f120044

    invoke-virtual {v2, v3, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_85
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_88
    return-void
.end method

.method public final b0()V
    .registers 3

    iget-object v0, p0, Lh85;->b:Li85;

    iget-object v0, v0, Li85;->j:Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Lh85;->i:Lg2l;

    iget-object p0, p0, Lg2l;->a:Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lexg;->g(Ljava/lang/Iterable;)Z

    move-result v1

    invoke-static {p0}, Lexg;->i(Ljava/lang/Iterable;)Z

    move-result p0

    if-nez v1, :cond_1f

    if-nez p0, :cond_1f

    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1f
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    invoke-static {v0, v1}, Llah;->e(Lcom/opera/android/custom_views/StylingImageButton;Z)V

    return-void
.end method

.method public final c()V
    .registers 11

    iget-object v0, p0, Lh85;->k:Lhal;

    if-eqz v0, :cond_6e

    const/4 v1, 0x0

    iput-object v1, p0, Lh85;->k:Lhal;

    iget-object v1, p0, Lh85;->i:Lg2l;

    iget-object v1, v1, Lg2l;->a:Ljava/util/List;

    iget v2, v0, Lhal;->a:I

    iget-object v7, v0, Lhal;->b:Ljava/util/List;

    iget-object p0, p0, Lh85;->e:Lypd;

    iget-object p0, p0, Lypd;->a:Ljava/lang/Object;

    check-cast p0, La21;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6e

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v0, v2, :cond_6e

    iget-object v3, p0, La21;->d:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Lk6l;

    iget-object v3, p0, La21;->g:Ljava/lang/Object;

    check-cast v3, Lu4l;

    invoke-virtual {v3, v0}, Lu4l;->a(I)Lm4l;

    move-result-object v5

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v1

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    new-instance v6, Ls6l;

    invoke-direct {v6, v3, v2}, Ls6l;-><init>(Lb2l;I)V

    invoke-virtual {v1, v6}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_5f
    invoke-static {v1}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v8

    new-instance v3, Ls14;

    const/4 v6, 0x0

    const/16 v9, 0x15

    invoke-direct/range {v3 .. v9}, Ls14;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZLjava/util/List;Ljava/util/List;B)V

    invoke-virtual {p0, v3}, La21;->q(Lr6l;)V

    :cond_6e
    return-void
.end method

.method public final c0()V
    .registers 3

    iget-object v0, p0, Lh85;->h:Ls9i;

    invoke-virtual {v0}, Ls9i;->Y()Z

    move-result v1

    if-eqz v1, :cond_20

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget-object p0, p0, Lg2l;->a:Ljava/util/List;

    move-object v1, p0

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1b

    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {v0, p0}, Ls9i;->J(Ljava/lang/Iterable;)V

    return-void

    :cond_1b
    check-cast p0, Ljava/lang/Iterable;

    invoke-virtual {v0, p0}, Ls9i;->d0(Ljava/lang/Iterable;)V

    :cond_20
    return-void
.end method

.method public final d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final getGroupId()I
    .registers 1

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget p0, p0, Lg2l;->b:I

    return p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;)Z
    .registers 3

    iget-object v0, p0, Lh85;->e:Lypd;

    invoke-virtual {v0, p0, p1}, Lypd;->I(Ljal;Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0
.end method

.method public final o()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final y()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final z(Lial;)Z
    .registers 2

    iget-object p1, p1, Lial;->a:Ljava/lang/Iterable;

    iget-object p0, p0, Lh85;->i:Lg2l;

    iget p0, p0, Lg2l;->b:I

    invoke-static {p1, p0}, Lrm5;->k(Ljava/lang/Iterable;I)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
