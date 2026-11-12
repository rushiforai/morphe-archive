.class public final Lhxn;
.super Lexn;
.source "SourceFile"


# instance fields
.field public final g:Lpt1;

.field public final h:Lztn;


# direct methods
.method public constructor <init>(Lpt1;Ltzi;Lztn;)V
    .registers 5

    iget-object v0, p1, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {p0, v0, p2}, Lexn;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p1, p0, Lhxn;->g:Lpt1;

    iput-object p3, p0, Lhxn;->h:Lztn;

    iget-object p2, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p3, Lgxn;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lgxn;-><init>(Lhxn;B)V

    invoke-static {p3}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p2, Lgxn;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lgxn;-><init>(Lhxn;B)V

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final W(Z)V
    .registers 2

    invoke-virtual {p0}, Lyzi;->f0()V

    invoke-virtual {p0}, Lhxn;->h0()V

    return-void
.end method

.method public final g0(Z)V
    .registers 3

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v0, 0x7f0a0538

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_13

    if-eqz p1, :cond_f

    const/4 p1, 0x0

    goto :goto_10

    :cond_f
    const/4 p1, 0x4

    :goto_10
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_13
    return-void
.end method

.method public final h0()V
    .registers 10

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1412a0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    iget-object v1, p0, Lhxn;->g:Lpt1;

    iget-object v2, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v3, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/AutoResizeTextView;

    iget-object v4, v1, Lpt1;->g:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const v6, 0x7f1412a6

    invoke-virtual {v0, v6, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v2

    iget-object v1, v1, Lpt1;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_3b

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_3f

    :cond_3b
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    :goto_3f
    iget-object v2, p0, Lyzi;->b:Ltzi;

    iget-boolean v2, v2, Ltzi;->g:Z

    const v5, 0x7f1412bc

    const/4 v6, 0x0

    if-eqz v2, :cond_8e

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result v2

    if-eqz v2, :cond_69

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v2, Ls8;->g:Ls8;

    const v3, 0x7f141295

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v4, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v1, Ls8;->h:Ls8;

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_69
    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    sget-object v2, Ls8;->g:Ls8;

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v3, Ls8;->h:Ls8;

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v4, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v2, v0, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_8e
    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v7, Ls8;->g:Ls8;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v8, 0x7f14129f

    invoke-virtual {v0, v8, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v7, v4, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v2, Ls8;->h:Ls8;

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v2, v4, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, v7, p0, v6}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void
.end method

.method public final i0(ZZ)V
    .registers 5

    invoke-super {p0, p1, p2}, Lyzi;->i0(ZZ)V

    const/4 p2, 0x0

    iget-object v0, p0, Lyzi;->d:Landroid/widget/ImageView;

    if-eqz v0, :cond_11

    if-eqz p1, :cond_c

    move v1, p2

    goto :goto_e

    :cond_c
    const/16 v1, 0x8

    :goto_e
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_11
    iget-object p0, p0, Lhxn;->g:Lpt1;

    iget-object p0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/AutoResizeTextView;

    if-eqz p1, :cond_1a

    const/4 p2, 0x4

    :cond_1a
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final j0(Lvtn;)V
    .registers 8

    check-cast p1, Lcom/opera/android/history/g;

    invoke-virtual {p0}, Lyzi;->U()V

    iput-object p1, p0, Ljxn;->f:Lvtn;

    iget-object v0, p0, Lhxn;->g:Lpt1;

    iget-object v1, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/AutoResizeTextView;

    iget-object v2, p1, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v2}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->b()J

    move-result-wide v2

    iget-object v4, p0, Lhxn;->h:Lztn;

    iget-object v4, v4, Lztn;->i:Ljava/text/DateFormat;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Lcom/opera/android/history/g;->e:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object p1, p1, Lcom/opera/android/history/g;->d:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lwqm;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_41

    invoke-static {p1}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_41
    iget-object v2, v0, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x400

    if-le v1, v2, :cond_74

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v1

    const/16 v3, 0x3ff

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v4

    if-eqz v4, :cond_6a

    move v2, v3

    :cond_6a
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v1, "\u2026"

    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_74
    iget-object v0, v0, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lhxn;->h0()V

    return-void
.end method

.method public final k0()V
    .registers 4

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lcom/opera/android/history/g;

    if-eqz v0, :cond_2c

    iget-object v1, p0, Lyzi;->b:Ltzi;

    iget-boolean v2, v1, Ltzi;->g:Z

    if-eqz v2, :cond_18

    iget-object p0, v1, Ltzi;->a:Le5d;

    iget-object v0, v0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Le5d;->d(J)V

    return-void

    :cond_18
    iget-object p0, p0, Lhxn;->h:Lztn;

    iget-object p0, p0, Lztn;->c:Lga6;

    iget-object v0, v0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ldda;

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/opera/android/history/f;->g(Lzda;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2d

    :cond_2c
    return-void

    :cond_2d
    sget-object v0, Llqm;->c:Llqm;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lvx3;->q:Z

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void
.end method
