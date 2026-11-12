.class public final Lev5;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lfdn;Ltah;)V
    .registers 5

    const/4 v0, 0x5

    iput-byte v0, p0, Lev5;->a:B

    .line 140
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 141
    iget-object p1, p1, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    new-instance p1, Lomj;

    const/16 v1, 0x11

    invoke-direct {p1, v1}, Lomj;-><init>(B)V

    invoke-static {v0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 144
    iput-object v0, p0, Lev5;->b:Ljava/lang/Object;

    .line 145
    iput-object p2, p0, Lev5;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqrk;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lev5;->a:B

    .line 150
    iput-object p1, p0, Lev5;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p2, p0, Lev5;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrse;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lev5;->a:B

    iput-object p1, p0, Lev5;->c:Ljava/lang/Object;

    .line 146
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 147
    iget-object p1, p1, Lrse;->r:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsse;

    .line 148
    iget-object p1, p1, Lsse;->b:Lpad;

    if-nez p1, :cond_15

    const/4 p1, 0x0

    .line 149
    :cond_15
    iput-object p1, p0, Lev5;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lu3m;Landroid/content/Context;)V
    .registers 10

    const/4 v0, 0x4

    iput-byte v0, p0, Lev5;->a:B

    iput-object p1, p0, Lev5;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iget-object v0, p1, Lu3m;->v:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    goto :goto_13

    :cond_12
    move v2, v1

    :goto_13
    const/4 v3, 0x1

    if-gt v2, v3, :cond_28

    if-ne v2, v3, :cond_26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lszb;

    iget-object v4, p1, Lu3m;->u:Lszb;

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    :cond_26
    move v2, v1

    goto :goto_29

    :cond_28
    move v2, v3

    :goto_29
    iget-object v4, p1, Lu3m;->s:Ljava/util/Set;

    new-instance v5, Lq3m;

    invoke-direct {v5, p2, v2, p1}, Lq3m;-><init>(Landroid/content/Context;ZLu3m;)V

    invoke-static {v4, v5}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object v4

    invoke-static {v4}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v4

    iput-object v4, p0, Lev5;->b:Ljava/lang/Object;

    new-instance v5, Lomj;

    const/16 v6, 0xd

    invoke-direct {v5, v6}, Lomj;-><init>(B)V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    if-eqz v2, :cond_88

    new-instance v2, Loce;

    invoke-direct {v2, p2, p1, v3}, Loce;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object p1

    invoke-static {p1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p1

    new-instance p2, Lomj;

    const/16 v0, 0xe

    invoke-direct {p2, v0}, Lomj;-><init>(B)V

    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance p2, Lr3m;

    invoke-direct {p2}, Lr3m;-><init>()V

    invoke-virtual {v4, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v0, v1

    :goto_6a
    if-ge v0, p2, :cond_7c

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lr3m;

    iget-object v3, p0, Lev5;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_6a

    :cond_7c
    iget-object p0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    new-instance p1, Lr3m;

    invoke-direct {p1}, Lr3m;-><init>()V

    invoke-virtual {p0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_88
    return-void
.end method

.method public constructor <init>(Lufm;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lev5;->a:B

    .line 137
    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 138
    iput-object p1, p0, Lev5;->b:Ljava/lang/Object;

    .line 139
    iput-object p2, p0, Lev5;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lvyk;[Lcom/opera/android/sync/SyncedSessionTab;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lev5;->a:B

    .line 151
    iput-object p1, p0, Lev5;->c:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    .line 152
    iput-object p2, p0, Lev5;->b:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 153
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 4

    iget-byte v0, p0, Lev5;->a:B

    iget-object v1, p0, Lev5;->c:Ljava/lang/Object;

    iget-object v2, p0, Lev5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_10
    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_17
    check-cast v2, [Lcom/opera/android/sync/SyncedSessionTab;

    array-length p0, v2

    return p0

    :pswitch_1b
    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_22
    iget-object p0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast p0, Lpad;

    iget-object p0, p0, Lpad;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_2f
    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_22
        :pswitch_1b
        :pswitch_17
        :pswitch_10
    .end packed-switch
.end method

.method public final getItemId(I)J
    .registers 3

    iget-byte v0, p0, Lev5;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    iget-object p0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast p0, [Lcom/opera/android/sync/SyncedSessionTab;

    aget-object p0, p0, p1

    iget-wide p0, p0, Lcom/opera/android/sync/SyncedSessionTab;->b:J

    return-wide p0

    nop

    :pswitch_data_14
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 3

    iget-byte v0, p0, Lev5;->a:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr3m;

    iget-object p0, p0, Lr3m;->a:Lszb;

    if-nez p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    return p0

    :pswitch_data_1c
    .packed-switch 0x4
        :pswitch_a
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 14

    iget-byte v0, p0, Lev5;->a:B

    iget-object v1, p0, Lev5;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lev5;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1f2

    check-cast p1, Lkdn;

    iget-object p1, p1, Lkdn;->b:Lbt1;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lfdn;

    iget-object v0, p1, Lbt1;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p2, Lfdn;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lbt1;->b:Landroid/widget/LinearLayout;

    new-instance v0, Lobn;

    invoke-direct {v0, p0, p2, v3}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_29
    check-cast p1, Lt3m;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr3m;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, v0, Lr3m;->a:Lszb;

    if-nez v1, :cond_4c

    invoke-static {p1}, Lmn5;->a(Landroid/view/View;)Lmn5;

    move-result-object p0

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    if-nez p2, :cond_45

    const p1, 0x7f1408b0

    goto :goto_48

    :cond_45
    const p1, 0x7f1408af

    :goto_48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_82

    :cond_4c
    invoke-static {p1}, Ly83;->d(Landroid/view/View;)Ly83;

    move-result-object p2

    iget-object v1, p2, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, v0, Lr3m;->b:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p2, Ly83;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, v0, Lr3m;->a:Lszb;

    iget-object v3, v3, Lszb;->a:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object p1, p2, Ly83;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean v1, v0, Lr3m;->c:Z

    if-nez v1, :cond_71

    const/16 v2, 0x8

    :cond_71
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance p2, Lj5g;

    const/16 v1, 0x17

    invoke-direct {p2, p0, v0, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_82
    return-void

    :pswitch_83
    check-cast p1, Luyk;

    check-cast v4, [Lcom/opera/android/sync/SyncedSessionTab;

    aget-object p0, v4, p2

    iget-object p2, p1, Luyk;->c:Landroid/widget/TextView;

    iget-object v0, p1, Luyk;->d:Landroid/widget/ImageView;

    iget-object v1, p1, Luyk;->e:Lvyk;

    iget-object v4, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v5, 0x7f0a0b24

    invoke-virtual {v4, v5, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    iget-object p1, p1, Luyk;->b:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/opera/android/sync/SyncedSessionTab;->e:Ljava/lang/String;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v6, p0, Lcom/opera/android/sync/SyncedSessionTab;->c:Ljava/lang/String;

    invoke-static {v6}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_e0

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v7, v1, Lvyk;->D:I

    sget p0, Lvmj;->g:I

    const/4 v9, 0x0

    const/16 v10, 0x30

    move v8, v7

    invoke-static/range {v5 .. v10}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    iget p1, v1, Lvyk;->D:I

    invoke-static {p0, p1, p1}, Lscd;->l0(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p0

    iget p1, v1, Lvyk;->D:I

    div-int/lit8 v2, p1, 0x2

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v4, Lp8i;

    invoke-direct {v4, p1, v2, v3, p0}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->s(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v4, p0}, Lp8i;->a(I)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const p0, 0x7f14017c

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_117

    :cond_e0
    sget-object p0, Laik;->a:[Ljava/lang/String;

    invoke-static {v6, p0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lwqm;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_101

    const/16 p1, 0x2f

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    if-ne p1, v4, :cond_101

    invoke-static {v3, v2, v6}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_101
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v5

    iget v7, v1, Lvyk;->D:I

    sget p0, Lvmj;->g:I

    const/4 v9, 0x0

    const/16 v10, 0x30

    move v8, v7

    invoke-static/range {v5 .. v10}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_117
    return-void

    :pswitch_118
    check-cast p1, Lprk;

    rem-int/lit8 p0, p2, 0x2

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    mul-int/2addr v0, p0

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p2, v0

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    add-int/2addr p2, v3

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, ". "

    invoke-static {p2, v0, p0}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    check-cast v4, Lqrk;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0402d7

    const v4, 0x7f060b26

    invoke-static {v3, v1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-direct {p0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    const/16 v1, 0x21

    invoke-virtual {v0, p0, v2, p2, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    iget-object p0, p1, Lprk;->b:Lb7k;

    iget-object p0, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_169
    check-cast p1, Lyjk;

    iget-object v0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast v0, Lpad;

    iget-object v0, v0, Lpad;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Late;

    new-instance v0, Ljri;

    const/16 v1, 0x12

    invoke-direct {v0, p0, p2, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p1, Lyjk;->c:Late;

    iget-object p0, p1, Lyjk;->b:Lb7k;

    iget-object p1, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, p2, Late;->c:Ljava/lang/String;

    new-instance v4, Lqxh;

    invoke-direct {v4, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p1, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p2, p2, Late;->a:Ljava/lang/String;

    const v4, 0x7f0803c5

    invoke-static {v4, p2}, Lvtp;->K(ILjava/lang/String;)I

    move-result p2

    invoke-static {v3, v1, v2, p2}, Lddh;->o(ZLandroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    new-instance v1, Lmxh;

    invoke-direct {v1, p2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    iget-object p0, p0, Lb7k;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p1, Lh4i;

    const/16 p2, 0xf

    invoke-direct {p1, v0, p2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_1be
    check-cast p1, Ldv5;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leqg;

    iget-object p2, p1, Ldv5;->b:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/usercentrics/sdk/ui/components/UCTextView;

    iget-object v0, p0, Leqg;->a:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Ldv5;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/usercentrics/sdk/ui/components/UCTextView;

    iget-object p0, p0, Leqg;->b:Ljava/util/List;

    move-object v0, p0

    check-cast v0, Ljava/lang/Iterable;

    const/4 v5, 0x0

    const/16 v6, 0x3e

    const-string v1, "\n"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_1f2
    .packed-switch 0x0
        :pswitch_1be
        :pswitch_169
        :pswitch_118
        :pswitch_83
        :pswitch_29
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    iget-byte v0, p0, Lev5;->a:B

    iget-object v1, p0, Lev5;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_e2

    new-instance p0, Lkdn;

    const p2, 0x7f0d0452

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0299

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_36

    const p2, 0x7f0a061f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_36

    new-instance p2, Lbt1;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p2, p1, v3, v0}, Lbt1;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;)V

    check-cast v1, Ltah;

    invoke-direct {p0, p2, v1}, Lkdn;-><init>(Lbt1;Ltah;)V

    move-object v2, p0

    goto :goto_47

    :cond_36
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_47
    return-object v2

    :pswitch_48
    new-instance p0, Lt3m;

    const/4 v0, 0x1

    if-eq p2, v0, :cond_4e

    move v0, v3

    :cond_4e
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    if-eqz v0, :cond_66

    const v0, 0x7f0d0385

    invoke-virtual {p2, v0, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lmn5;->a(Landroid/view/View;)Lmn5;

    move-result-object p1

    iget-object p1, p1, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    goto :goto_88

    :cond_66
    invoke-static {p2, p1}, Ly83;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ly83;

    move-result-object p1

    iget-object p2, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p2, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const v0, 0x7f080512

    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    new-instance v0, Lsvk;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v0}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v0, p2}, Lsvk;->a(Landroid/view/View;)V

    iget-object p1, p1, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    :goto_88
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0

    :pswitch_8c
    new-instance p0, Luyk;

    check-cast v1, Lvyk;

    iget-object p2, v1, Ly93;->B:Landroid/view/LayoutInflater;

    const v0, 0x7f0d03ee

    invoke-virtual {p2, v0, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Luyk;-><init>(Lvyk;Landroid/view/View;)V

    return-object p0

    :pswitch_9d
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    new-instance p2, Lprk;

    const v0, 0x7f0d03e3

    invoke-virtual {p0, v0, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-direct {p2, p0}, Lprk;-><init>(Landroid/view/View;)V

    return-object p2

    :pswitch_b2
    new-instance p0, Lyjk;

    const p2, 0x7f0d03d6

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_ca

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lb7k;

    const/4 v0, 0x3

    invoke-direct {p2, v0, p1, p1}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-direct {p0, p2}, Lyjk;-><init>(Lb7k;)V

    move-object v2, p0

    goto :goto_cf

    :cond_ca
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_cf
    return-object v2

    :pswitch_d0
    new-instance p2, Ldv5;

    iget-object p0, p0, Lev5;->b:Ljava/lang/Object;

    check-cast p0, Lufm;

    const v0, 0x7f0d0438

    invoke-static {p1, v0, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Ldv5;-><init>(Lufm;Landroid/view/View;)V

    return-object p2

    nop

    :pswitch_data_e2
    .packed-switch 0x0
        :pswitch_d0
        :pswitch_b2
        :pswitch_9d
        :pswitch_8c
        :pswitch_48
    .end packed-switch
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Lev5;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    check-cast p1, Lyjk;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    const/4 p0, 0x0

    iput-object p0, p1, Lyjk;->c:Late;

    return-void

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
