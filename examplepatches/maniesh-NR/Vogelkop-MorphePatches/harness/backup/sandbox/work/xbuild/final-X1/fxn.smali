.class public final Lfxn;
.super Lexn;
.source "SourceFile"


# instance fields
.field public final g:Lor2;

.field public final h:Lztn;

.field public final i:Ljava/util/HashSet;

.field public j:Z


# direct methods
.method public constructor <init>(Lor2;Ltzi;Lztn;)V
    .registers 5

    iget-object v0, p1, Lor2;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {p0, v0, p2}, Lexn;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p1, p0, Lfxn;->g:Lor2;

    iput-object p3, p0, Lfxn;->h:Lztn;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lfxn;->i:Ljava/util/HashSet;

    iget-object p1, p0, Lyzi;->d:Landroid/widget/ImageView;

    if-eqz p1, :cond_24

    new-instance p2, Lpkm;

    const/16 p3, 0x10

    invoke-direct {p2, p0, p3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_24
    return-void
.end method


# virtual methods
.method public final G(JZ)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Lyzi;->G(JZ)V

    iget-object v0, p0, Ljxn;->f:Lvtn;

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lfxn;->h:Lztn;

    iget-object v0, v0, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/history/g;

    if-eqz v0, :cond_3c

    iget-object v1, p0, Ljxn;->f:Lvtn;

    iget-object v0, v0, Lcom/opera/android/history/g;->f:Lwtn;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lfxn;->i:Ljava/util/HashSet;

    if-eqz p3, :cond_31

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_38

    :cond_31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :goto_38
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lfxn;->o0(Z)V

    :cond_3c
    return-void
.end method

.method public final Y()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final Z()Z
    .registers 1

    iget-boolean p0, p0, Lfxn;->j:Z

    return p0
.end method

.method public final a0()V
    .registers 2

    invoke-super {p0}, Lyzi;->a0()V

    iget-boolean v0, p0, Lyzi;->e:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-nez v0, :cond_e

    :cond_d
    return-void

    :cond_e
    invoke-virtual {p0, v0}, Lfxn;->m0(Lwtn;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final h0()V
    .registers 9

    iget-object v0, p0, Lyzi;->d:Landroid/widget/ImageView;

    if-eqz v0, :cond_a

    iget-object v1, p0, Ljxn;->f:Lvtn;

    check-cast v1, Lwtn;

    if-nez v1, :cond_b

    :cond_a
    return-void

    :cond_b
    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-boolean v3, p0, Lfxn;->j:Z

    if-eqz v3, :cond_1a

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_1e

    :cond_1a
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/view/View;->setImportantForAccessibility(I)V

    :goto_1e
    iget-object v3, p0, Lyzi;->b:Ltzi;

    iget-boolean v3, v3, Ltzi;->g:Z

    iget-object v4, p0, Lfxn;->g:Lor2;

    const/4 v5, 0x0

    if-eqz v3, :cond_5e

    iget-object v3, v4, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, v4, Lor2;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    sget-object v3, Ls8;->g:Ls8;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f1412a1

    invoke-virtual {v2, v7, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v3, v6, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v6, Ls8;->h:Ls8;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v7, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v6, v4, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    goto :goto_94

    :cond_5e
    iget-object v3, v4, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, v4, Lor2;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    sget-object v3, Ls8;->g:Ls8;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f1412a3

    invoke-virtual {v2, v7, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v3, v6, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    sget-object v6, Ls8;->h:Ls8;

    invoke-virtual {v4}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v7, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v6, v4, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    :goto_94
    iget-boolean v0, v1, Lwtn;->e:Z

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz v0, :cond_a5

    const v0, 0x7f1412a0

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v3, v0, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void

    :cond_a5
    const v0, 0x7f1412a2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v3, v0, v5}, Lr5n;->k(Landroid/view/View;Ls8;Ljava/lang/String;Lla;)V

    return-void
.end method

.method public final j0(Lvtn;)V
    .registers 12

    check-cast p1, Lwtn;

    invoke-virtual {p0}, Lyzi;->U()V

    iput-object p1, p0, Ljxn;->f:Lvtn;

    invoke-virtual {p0, p1}, Lfxn;->m0(Lwtn;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p1, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    iget-object v2, p0, Lfxn;->g:Lor2;

    if-eqz v0, :cond_2a

    iget-object v3, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean v0, v0, Lwtn;->e:Z

    if-eqz v0, :cond_24

    const v0, 0x7f080520

    goto :goto_27

    :cond_24
    const v0, 0x7f08051a

    :goto_27
    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_2a
    iget-object v0, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, p1, Lwtn;->a:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v3, Lztn;->m:Ljava/text/DateFormat;

    iget-wide v3, p1, Lwtn;->d:J

    iget-wide v5, p1, Lwtn;->c:J

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 v3, 0xe

    const/4 v4, 0x0

    invoke-virtual {v7, v3, v4}, Ljava/util/Calendar;->set(II)V

    const/16 v8, 0xd

    invoke-virtual {v7, v8, v4}, Ljava/util/Calendar;->set(II)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v9

    invoke-virtual {v9, v5, v6}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v9, v3, v4}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v9, v8, v4}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v7, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    iget-object v5, p0, Lfxn;->h:Lztn;

    if-eqz v3, :cond_7f

    iget-wide v6, p1, Lwtn;->c:J

    iget-object p1, v5, Lztn;->i:Ljava/text/DateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v3, 0x7f14082e

    invoke-virtual {v0, v3, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_a4

    :cond_7f
    iget-wide v6, p1, Lwtn;->d:J

    iget-object v3, v5, Lztn;->i:Ljava/text/DateFormat;

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    iget-wide v6, p1, Lwtn;->c:J

    iget-object p1, v5, Lztn;->i:Ljava/text/DateFormat;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {v3, p1}, [Ljava/lang/Object;

    move-result-object p1

    const v3, 0x7f140830

    invoke-virtual {v0, v3, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_a4
    iget-object v3, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, v2, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v3, 0x7f12003c

    invoke-virtual {v0, v3, v2, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ljxn;->f:Lvtn;

    check-cast p1, Lwtn;

    if-eqz p1, :cond_10a

    iget-object v0, p0, Lfxn;->i:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    iget-object p1, p1, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v4

    :cond_db
    :goto_db
    if-ge v2, v1, :cond_107

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lvtn;

    iget-object v5, p0, Lyzi;->b:Ltzi;

    iget-object v5, v5, Ltzi;->a:Le5d;

    invoke-virtual {v3}, Lvtn;->c()J

    move-result-wide v6

    iget-object v5, v5, Le5d;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/LinkedHashSet;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_db

    invoke-virtual {v3}, Lvtn;->c()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_db

    :cond_107
    invoke-virtual {p0, v4}, Lfxn;->o0(Z)V

    :cond_10a
    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p1, Lcom/opera/android/widget/SelectableRelativeLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/opera/android/widget/SelectableRelativeLayout;->d(Z)V

    invoke-virtual {p0}, Lfxn;->h0()V

    return-void
.end method

.method public final k0()V
    .registers 12

    iget-object v0, p0, Ljxn;->f:Lvtn;

    move-object v1, v0

    check-cast v1, Lwtn;

    if-eqz v1, :cond_c4

    iget-object v2, p0, Lyzi;->b:Ltzi;

    iget-boolean v3, v2, Ltzi;->g:Z

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_5f

    iget-boolean v1, v1, Lwtn;->e:Z

    if-eqz v1, :cond_5c

    check-cast v0, Lwtn;

    if-eqz v0, :cond_58

    iget-object v1, p0, Lfxn;->i:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    iget-object v0, v0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v1, v0, :cond_58

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-eqz v0, :cond_5f

    iget-object v0, v0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v3, v4

    :cond_32
    :goto_32
    if-ge v3, v1, :cond_54

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v3, v3, 0x1

    check-cast v6, Lvtn;

    iget-object v7, v2, Ltzi;->a:Le5d;

    invoke-virtual {v6}, Lvtn;->c()J

    move-result-wide v8

    iget-object v6, v7, Le5d;->c:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashSet;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    invoke-virtual {v7, v8, v9, v4}, Le5d;->c(JZ)V

    goto :goto_32

    :cond_54
    invoke-virtual {p0, v5}, Lfxn;->o0(Z)V

    goto :goto_5f

    :cond_58
    invoke-virtual {p0}, Lfxn;->n0()V

    return-void

    :cond_5c
    invoke-virtual {p0}, Lfxn;->n0()V

    :cond_5f
    :goto_5f
    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-eqz v0, :cond_c4

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v1

    iget-object v2, p0, Lfxn;->h:Lztn;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v3, v0, Lwtn;->e:Z

    iget-object v6, v0, Lwtn;->f:Ljava/util/ArrayList;

    iget-object v7, v2, Lztn;->h:Ljava/util/HashSet;

    if-nez v3, :cond_95

    invoke-virtual {v0}, Lwtn;->c()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iput-boolean v5, v0, Lwtn;->e:Z

    iget-object v0, v2, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    add-int/2addr v1, v5

    invoke-virtual {v0, v1, v6}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v2, v1, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    goto :goto_be

    :cond_95
    invoke-virtual {v0}, Lwtn;->c()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iput-boolean v4, v0, Lwtn;->e:Z

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a6
    if-ge v4, v0, :cond_b6

    iget-object v3, v2, Lztn;->g:Lwjj;

    iget-object v3, v3, Lwjj;->d:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_a6

    :cond_b6
    add-int/2addr v1, v5

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {v2, v1, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    :goto_be
    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-nez v0, :cond_c5

    :cond_c4
    return-void

    :cond_c5
    iget-object p0, p0, Lfxn;->g:Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean v0, v0, Lwtn;->e:Z

    if-eqz v0, :cond_d3

    const v0, 0x7f080520

    goto :goto_d6

    :cond_d3
    const v0, 0x7f08051a

    :goto_d6
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void
.end method

.method public final l0()V
    .registers 2

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lyzi;->b:Ltzi;

    invoke-virtual {v0}, Ltzi;->c()V

    invoke-virtual {p0}, Lfxn;->k0()V

    return-void
.end method

.method public final m0(Lwtn;)Landroid/graphics/drawable/Drawable;
    .registers 6

    iget-object v0, p1, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance v1, Lg8i;

    invoke-direct {v1, p0}, Lg8i;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0402ff

    const v3, 0x7f06063b

    invoke-static {v2, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    iput v2, v1, Lg8i;->c:I

    iput-object v0, v1, Lg8i;->e:Ljava/lang/String;

    const v0, 0x7f070258

    iput v0, v1, Lg8i;->g:I

    const v0, 0x7f0402c8

    invoke-static {v0, p0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iput p0, v1, Lg8i;->f:I

    iget-object p0, p1, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/16 p1, 0x63

    if-le p0, p1, :cond_44

    const-string p0, "99+"

    iput-object p0, v1, Lg8i;->e:Ljava/lang/String;

    const p0, 0x7f070259

    iput p0, v1, Lg8i;->g:I

    :cond_44
    invoke-virtual {v1}, Lg8i;->a()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final n0()V
    .registers 10

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v0, v0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_e
    :goto_e
    const/4 v3, 0x1

    if-ge v2, v1, :cond_33

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lvtn;

    iget-object v5, p0, Lyzi;->b:Ltzi;

    iget-object v5, v5, Ltzi;->a:Le5d;

    invoke-virtual {v4}, Lvtn;->c()J

    move-result-wide v6

    iget-object v4, v5, Le5d;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/LinkedHashSet;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-virtual {v5, v6, v7, v3}, Le5d;->c(JZ)V

    goto :goto_e

    :cond_33
    invoke-virtual {p0, v3}, Lfxn;->o0(Z)V

    return-void
.end method

.method public final o0(Z)V
    .registers 4

    iget-object v0, p0, Ljxn;->f:Lvtn;

    check-cast v0, Lwtn;

    if-eqz v0, :cond_16

    iget-object v1, p0, Lfxn;->i:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    iget-object v0, v0, Lwtn;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v1, v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    iget-boolean v1, p0, Lfxn;->j:Z

    if-ne v1, v0, :cond_1e

    if-eqz p1, :cond_1e

    return-void

    :cond_1e
    iput-boolean v0, p0, Lfxn;->j:Z

    invoke-virtual {p0, v0, p1}, Lyzi;->i0(ZZ)V

    return-void
.end method
