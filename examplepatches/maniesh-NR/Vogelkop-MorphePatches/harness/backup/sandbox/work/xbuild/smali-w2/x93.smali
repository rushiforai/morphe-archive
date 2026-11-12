.class public final Lx93;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 203
    const/4 v0, 0x7

    iput-byte v0, p0, Lx93;->a:B

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 201
    iput-byte p2, p0, Lx93;->a:B

    iput-object p1, p0, Lx93;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/AbstractList;B)V
    .registers 3

    .line 202
    iput-byte p2, p0, Lx93;->a:B

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lx93;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lsa2;[Landroidx/recyclerview/widget/d;)V
    .registers 13

    const/4 v0, 0x1

    iput-byte v0, p0, Lx93;->a:B

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v1, Lrma;

    invoke-direct {v1, p0, p1}, Lrma;-><init>(Lx93;Lsa2;)V

    iput-object v1, p0, Lx93;->b:Ljava/lang/Object;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_15
    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    const/4 v1, 0x0

    if-eqz p2, :cond_bc

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/d;

    iget-object v2, p0, Lx93;->b:Ljava/lang/Object;

    check-cast v2, Lrma;

    iget-object v3, v2, Lrma;->g:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    if-ltz v4, :cond_b0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-gt v4, v6, :cond_b0

    iget v6, v2, Lrma;->b:I

    if-eq v6, v0, :cond_45

    invoke-virtual {p2}, Landroidx/recyclerview/widget/d;->hasStableIds()Z

    move-result v6

    const-string v7, "All sub adapters must have stable ids when stable id mode is ISOLATED_STABLE_IDS or SHARED_STABLE_IDS"

    invoke-static {v7, v6}, Ljpo;->i(Ljava/lang/String;Z)V

    goto :goto_48

    :cond_45
    invoke-virtual {p2}, Landroidx/recyclerview/widget/d;->hasStableIds()Z

    :goto_48
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    move v7, v1

    :goto_4d
    const/4 v8, -0x1

    if-ge v7, v6, :cond_5d

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lxke;

    iget-object v9, v9, Lxke;->c:Landroidx/recyclerview/widget/d;

    if-eq v9, p2, :cond_5e

    add-int/lit8 v7, v7, 0x1

    goto :goto_4d

    :cond_5d
    move v7, v8

    :cond_5e
    if-eq v7, v8, :cond_66

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxke;

    :cond_66
    if-nez v5, :cond_15

    new-instance v5, Lxke;

    iget-object v6, v2, Lrma;->d:Ljava/lang/Object;

    check-cast v6, Lb3g;

    iget-object v7, v2, Lrma;->i:Ljava/lang/Object;

    check-cast v7, Ln2k;

    invoke-interface {v7}, Ln2k;->q()Lm2k;

    move-result-object v7

    invoke-direct {v5, p2, v2, v6, v7}, Lxke;-><init>(Landroidx/recyclerview/widget/d;Lrma;Lb3g;Lm2k;)V

    invoke-virtual {v3, v4, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v3, v2, Lrma;->f:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    :cond_84
    :goto_84
    if-ge v1, v4, :cond_9a

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v1, v1, 0x1

    check-cast v6, Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v6, :cond_84

    invoke-virtual {p2, v6}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_84

    :cond_9a
    iget p2, v5, Lxke;->e:I

    if-lez p2, :cond_ab

    iget-object p2, v2, Lrma;->c:Ljava/lang/Object;

    check-cast p2, Lx93;

    invoke-virtual {v2, v5}, Lrma;->g(Lxke;)I

    move-result v1

    iget v3, v5, Lxke;->e:I

    invoke-virtual {p2, v1, v3}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    :cond_ab
    invoke-virtual {v2}, Lrma;->e()V

    goto/16 :goto_15

    :cond_b0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p0

    const-string p1, ". Given:"

    const-string p2, "Index must be between 0 and "

    invoke-static {p2, p0, v4, p1}, Ls49;->o(Ljava/lang/String;IILjava/lang/Object;)V

    throw v5

    :cond_bc
    iget-object p1, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p1, Lrma;

    iget p1, p1, Lrma;->b:I

    if-ne p1, v0, :cond_c5

    move v0, v1

    :cond_c5
    invoke-super {p0, v0}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final G()I
    .registers 4

    invoke-virtual {p0}, Lx93;->H()Lzlb;

    move-result-object p0

    invoke-virtual {p0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_9
    :goto_9
    move-object v1, p0

    check-cast v1, Lbmb;

    invoke-virtual {v1}, Lbmb;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-virtual {v1}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldn5;

    iget-boolean v2, v1, Ldn5;->e:Z

    if-eqz v2, :cond_9

    iget v1, v1, Ldn5;->a:I

    or-int/2addr v0, v1

    goto :goto_9

    :cond_20
    return v0
.end method

.method public final H()Lzlb;
    .registers 4

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    const-class v0, Ldn5;

    invoke-static {p0, v0}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p0

    new-instance v0, Lo00;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lo00;-><init>(B)V

    new-instance v1, Lzlb;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    return-object v1
.end method

.method public final I(Leph;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->setStateRestorationPolicy(Leph;)V

    return-void
.end method

.method public final J(Lote;I)V
    .registers 5

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lpte;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object p0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcwf;

    iget-object p2, p1, Lote;->b:Lcom/google/android/material/chip/Chip;

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lote;->b:Lcom/google/android/material/chip/Chip;

    iget-object p2, p0, Lcwf;->a:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    if-eqz v0, :cond_37

    iget-boolean p0, p0, Lcwf;->b:Z

    if-eqz p0, :cond_37

    const/4 p0, 0x1

    goto :goto_38

    :cond_37
    move p0, p2

    :goto_38
    invoke-virtual {p1, p0}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    return-void
.end method

.method public final findRelativeAdapterPositionIn(Landroidx/recyclerview/widget/d;Landroidx/recyclerview/widget/i;I)I
    .registers 8

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_50

    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/d;->findRelativeAdapterPositionIn(Landroidx/recyclerview/widget/d;Landroidx/recyclerview/widget/i;I)I

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxke;

    if-nez v0, :cond_1c

    const/4 p0, -0x1

    goto :goto_2f

    :cond_1c
    iget-object v1, v0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, v0}, Lrma;->g(Lxke;)I

    move-result p0

    sub-int/2addr p3, p0

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p0

    if-ltz p3, :cond_30

    if-ge p3, p0, :cond_30

    invoke-virtual {v1, p1, p2, p3}, Landroidx/recyclerview/widget/d;->findRelativeAdapterPositionIn(Landroidx/recyclerview/widget/d;Landroidx/recyclerview/widget/i;I)I

    move-result p0

    :goto_2f
    return p0

    :cond_30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, " which is out of bounds for the adapter with size "

    const-string v2, ".Make sure to immediately call notify methods in your adapter when you change the backing dataviewHolder:"

    const-string v3, "Detected inconsistent adapter updates. The local position of the view holder maps to "

    invoke-static {p3, p0, v3, v1, v2}, Lsko;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, "adapter:"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemCount()I
    .registers 5

    iget-byte v0, p0, Lx93;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_62

    return v1

    :pswitch_7
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_10
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lvxi;

    iget-object p0, p0, Lvxi;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_1d
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lkue;

    iget-object p0, p0, Lkue;->f:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_28
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lpte;

    iget-object p0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_33
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    invoke-virtual {p0}, Lehc;->d()I

    move-result p0

    return p0

    :pswitch_3c
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :goto_49
    if-ge v2, v0, :cond_57

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lxke;

    iget v3, v3, Lxke;->e:I

    add-int/2addr v1, v3

    goto :goto_49

    :cond_57
    return v1

    :pswitch_58
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Ly93;

    iget-object p0, p0, Ly93;->y:Lt93;

    iget p0, p0, Lt93;->b:I

    return p0

    nop

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_58
        :pswitch_3c
        :pswitch_33
        :pswitch_28
        :pswitch_1d
        :pswitch_10
        :pswitch_7
    .end packed-switch
.end method

.method public final getItemId(I)J
    .registers 5

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_40

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide p0

    return-wide p0

    :pswitch_a
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    invoke-virtual {p0, p1}, Lehc;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgn5;

    invoke-interface {p0}, Lgn5;->getId()J

    move-result-wide p0

    return-wide p0

    :pswitch_19
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    invoke-virtual {p0, p1}, Lrma;->k(I)Lz;

    move-result-object p1

    iget-object v0, p1, Lz;->c:Ljava/lang/Object;

    check-cast v0, Lxke;

    iget v1, p1, Lz;->b:I

    iget-object v2, v0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide v1

    iget-object v0, v0, Lxke;->b:Lm2k;

    invoke-interface {v0, v1, v2}, Lm2k;->e(J)J

    move-result-wide v0

    const/4 v2, 0x0

    iput-boolean v2, p1, Lz;->a:Z

    const/4 v2, 0x0

    iput-object v2, p1, Lz;->c:Ljava/lang/Object;

    const/4 v2, -0x1

    iput v2, p1, Lz;->b:I

    iput-object p1, p0, Lrma;->h:Ljava/lang/Object;

    return-wide v0

    nop

    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_19
        :pswitch_a
    .end packed-switch
.end method

.method public final getItemViewType(I)I
    .registers 11

    iget-byte v0, p0, Lx93;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_6a

    :pswitch_6
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result p0

    return p0

    :pswitch_b
    return v1

    :pswitch_c
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    invoke-virtual {p0, p1}, Lehc;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgn5;

    invoke-interface {p0}, Lgn5;->getType()I

    move-result p0

    return p0

    :pswitch_1b
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    invoke-virtual {p0, p1}, Lrma;->k(I)Lz;

    move-result-object p1

    iget-object v0, p1, Lz;->c:Ljava/lang/Object;

    check-cast v0, Lxke;

    iget v2, p1, Lz;->b:I

    iget-object v3, v0, Lxke;->a:Lw7j;

    iget-object v0, v0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/d;->getItemViewType(I)I

    move-result v0

    iget-object v2, v3, Lw7j;->a:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseIntArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_41

    invoke-virtual {v2, v4}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v0

    goto :goto_5f

    :cond_41
    iget-object v4, v3, Lw7j;->d:Ljava/lang/Object;

    check-cast v4, Lb3g;

    iget-object v6, v3, Lw7j;->c:Ljava/lang/Object;

    check-cast v6, Lxke;

    iget v7, v4, Lb3g;->b:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v4, Lb3g;->b:I

    iget-object v4, v4, Lb3g;->a:Landroid/util/SparseArray;

    invoke-virtual {v4, v7, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {v2, v0, v7}, Landroid/util/SparseIntArray;->put(II)V

    iget-object v2, v3, Lw7j;->b:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseIntArray;

    invoke-virtual {v2, v7, v0}, Landroid/util/SparseIntArray;->put(II)V

    move v0, v7

    :goto_5f
    iput-boolean v1, p1, Lz;->a:Z

    const/4 v1, 0x0

    iput-object v1, p1, Lz;->c:Ljava/lang/Object;

    iput v5, p1, Lz;->b:I

    iput-object p1, p0, Lrma;->h:Ljava/lang/Object;

    return v0

    nop

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_c
        :pswitch_6
        :pswitch_b
    .end packed-switch
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 7

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_4a

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object v0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_17
    if-ge v3, v1, :cond_28

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v4

    if-ne v4, p1, :cond_17

    goto :goto_48

    :cond_28
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_38
    if-ge v2, v0, :cond_48

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v2, 0x1

    check-cast v1, Lxke;

    iget-object v1, v1, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_38

    :cond_48
    :goto_48
    return-void

    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 7

    iget-byte v0, p0, Lx93;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_108

    if-eqz p1, :cond_c

    invoke-static {}, Lh9o;->t()V

    :cond_c
    return-void

    :pswitch_d
    check-cast p1, Lpon;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnon;

    iget-object p1, p1, Lpon;->b:Lb7k;

    iget-object p1, p1, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/weather/view/WeatherWidgetView;

    iget-object p2, p0, Lnon;->a:Llon;

    invoke-static {p2}, Lxih;->z(Llon;)Ljava/lang/Integer;

    move-result-object p2

    iget-object p1, p1, Lcom/opera/android/weather/view/WeatherWidgetView;->a:Lvs;

    if-nez p2, :cond_31

    iget-object p2, p1, Lvs;->d:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {p2, v2}, Ln2d;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3c

    :cond_31
    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v0, p2}, Ln2d;->j(I)V

    :goto_3c
    iget-object p0, p0, Lnon;->a:Llon;

    iget-object p0, p0, Llon;->a:Ljava/lang/String;

    iget-object p1, p1, Lvs;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_48
    check-cast p1, Luxi;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lvxi;

    iget-object p0, p0, Lvxi;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;

    iget-object p2, p1, Luxi;->b:Lvs;

    iget-object v0, p2, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getUserName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_6a

    const-string v2, ""

    :cond_6a
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p2, Lvs;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v2, 0x7f14146e

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Luxi;->c:Lvxi;

    new-instance p2, Lj5g;

    const/16 v0, 0xa

    invoke-direct {p2, p1, p0, v0}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_8c
    check-cast p1, Lhue;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lkue;

    iget-object v0, p0, Lkue;->f:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbwf;

    invoke-virtual {v0}, Lbwf;->b()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p1, Lhue;->c:Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget p0, p0, Lkue;->a:I

    if-ne p2, p0, :cond_a8

    const/4 v1, 0x1

    :cond_a8
    iget-object p0, p1, Lhue;->c:Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    return-void

    :pswitch_ae
    check-cast p1, Lote;

    invoke-virtual {p0, p1, p2}, Lx93;->J(Lote;I)V

    return-void

    :pswitch_b4
    check-cast p1, Lbn5;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lehc;

    invoke-virtual {p0, p2}, Lehc;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgn5;

    invoke-virtual {p1, p0, p2}, Lbn5;->U(Lgn5;I)V

    return-void

    :pswitch_c4
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    invoke-virtual {p0, p2}, Lrma;->k(I)Lz;

    move-result-object p2

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/IdentityHashMap;

    iget-object v3, p2, Lz;->c:Ljava/lang/Object;

    check-cast v3, Lxke;

    invoke-virtual {v0, p1, v3}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p2, Lz;->c:Ljava/lang/Object;

    check-cast v0, Lxke;

    iget v3, p2, Lz;->b:I

    iget-object v0, v0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v0, p1, v3}, Landroidx/recyclerview/widget/d;->bindViewHolder(Landroidx/recyclerview/widget/i;I)V

    iput-boolean v1, p2, Lz;->a:Z

    iput-object v2, p2, Lz;->c:Ljava/lang/Object;

    const/4 p1, -0x1

    iput p1, p2, Lz;->b:I

    iput-object p2, p0, Lrma;->h:Ljava/lang/Object;

    return-void

    :pswitch_ec
    check-cast p1, Lv93;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Ly93;

    iget-object p0, p0, Ly93;->y:Lt93;

    iget-object v0, p0, Lt93;->d:Ly93;

    iget-object p0, p0, Lt93;->a:[Ljava/lang/Object;

    aget-object p0, p0, p2

    invoke-virtual {v0, p0}, Ly93;->K0(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lv93;->b:Lcq3;

    iget-object p1, p1, Lcq3;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_108
    .packed-switch 0x0
        :pswitch_ec
        :pswitch_c4
        :pswitch_b4
        :pswitch_ae
        :pswitch_8c
        :pswitch_48
        :pswitch_d
    .end packed-switch
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 10

    iget-byte v0, p0, Lx93;->a:B

    const/4 v1, 0x4

    const-string v2, "rootView"

    const/4 v3, 0x0

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_14c

    return-object v4

    :pswitch_b
    new-instance p0, Lpon;

    const p2, 0x7f0d0487

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0cea

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/weather/view/WeatherWidgetView;

    if-eqz v0, :cond_2c

    new-instance p2, Lb7k;

    check-cast p1, Landroid/widget/FrameLayout;

    const/4 v1, 0x7

    invoke-direct {p2, v1, p1, v0}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-direct {p0, p2}, Lpon;-><init>(Lb7k;)V

    move-object v4, p0

    goto :goto_3d

    :cond_2c
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_3d
    return-object v4

    :pswitch_3e
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-static {p2, p1}, Lvs;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object p1

    new-instance p2, Luxi;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lvxi;

    invoke-direct {p2, p0, p1}, Luxi;-><init>(Lvxi;Lvs;)V

    return-object p2

    :pswitch_54
    new-instance p2, Lhue;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lkue;

    const v0, 0x7f0d02d7

    invoke-static {p1, v0, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lhue;-><init>(Lkue;Landroid/view/View;)V

    return-object p2

    :pswitch_65
    const p2, 0x7f0d02d8

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lote;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lpte;

    invoke-direct {p2, p0, p1}, Lote;-><init>(Lpte;Landroid/view/View;)V

    return-object p2

    :pswitch_76
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v5, 0x1

    const/4 v6, 0x3

    if-eq p2, v5, :cond_c6

    const/4 p0, 0x2

    if-eq p2, p0, :cond_ac

    if-ne p2, v6, :cond_a2

    new-instance p0, Len5;

    const p2, 0x7f0d00d7

    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_9e

    new-instance p2, Lmn5;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p2, p1, v3}, Lmn5;-><init>(Lcom/opera/android/custom_views/StylingTextView;B)V

    invoke-direct {p0, p2}, Len5;-><init>(Lmn5;)V

    :goto_9c
    move-object v4, p0

    goto :goto_e7

    :cond_9e
    invoke-static {v2}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_e7

    :cond_a2
    const-string p0, "Unexpected view type: "

    invoke-static {p2, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_e7

    :cond_ac
    new-instance p0, Len5;

    const p2, 0x7f0d00d8

    invoke-virtual {v0, p2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_c2

    new-instance p2, Ljt;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p2, p1, v1}, Ljt;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V

    invoke-direct {p0, p2}, Len5;-><init>(Ljt;)V

    goto :goto_9c

    :cond_c2
    invoke-static {v2}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_e7

    :cond_c6
    new-instance p2, Lcn5;

    const v1, 0x7f0d00d5

    invoke-virtual {v0, v1, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_e4

    new-instance v0, Ljt;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {v0, p1, v6}, Ljt;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V

    new-instance p1, Ljl4;

    const/16 v1, 0x12

    invoke-direct {p1, p0, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, v0, p1}, Lcn5;-><init>(Ljt;Ljl4;)V

    move-object v4, p2

    goto :goto_e7

    :cond_e4
    invoke-static {v2}, Lt3p;->q(Ljava/lang/String;)V

    :goto_e7
    return-object v4

    :pswitch_e8
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object p0, p0, Lrma;->d:Ljava/lang/Object;

    check-cast p0, Lb3g;

    iget-object p0, p0, Lb3g;->a:Landroid/util/SparseArray;

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxke;

    if-eqz p0, :cond_fc

    move-object v4, p0

    goto :goto_105

    :cond_fc
    const-string p0, "Cannot find the wrapper for global view type "

    invoke-static {p2, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_105
    iget-object p0, v4, Lxke;->a:Lw7j;

    iget-object v0, p0, Lw7j;->b:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseIntArray;

    invoke-virtual {v0, p2}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_116

    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v3

    goto :goto_127

    :cond_116
    const-string v0, "requested global type "

    const-string v1, " does not belong to the adapter:"

    invoke-static {p2, v0, v1}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p0, p0, Lw7j;->c:Ljava/lang/Object;

    check-cast p0, Lxke;

    iget-object p0, p0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-static {p2, p0}, Lbxl;->k(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    :goto_127
    iget-object p0, v4, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, v3}, Landroidx/recyclerview/widget/d;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;

    move-result-object p0

    return-object p0

    :pswitch_12e
    const p2, 0x7f0d03ed

    invoke-static {p1, p2, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_148

    new-instance p2, Lcq3;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-direct {p2, p1, v1}, Lcq3;-><init>(Landroid/view/View;B)V

    new-instance v4, Lv93;

    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Ly93;

    invoke-direct {v4, p0, p2}, Lv93;-><init>(Ly93;Lcq3;)V

    goto :goto_14b

    :cond_148
    invoke-static {v2}, Lt3p;->q(Ljava/lang/String;)V

    :goto_14b
    return-object v4

    :pswitch_data_14c
    .packed-switch 0x0
        :pswitch_12e
        :pswitch_e8
        :pswitch_76
        :pswitch_65
        :pswitch_54
        :pswitch_3e
        :pswitch_b
    .end packed-switch
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 6

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_50

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object v0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_17
    if-ltz v1, :cond_36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_33

    :cond_29
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_36

    :cond_33
    :goto_33
    add-int/lit8 v1, v1, -0x1

    goto :goto_17

    :cond_36
    :goto_36
    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_3f
    if-ge v1, v0, :cond_4f

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lxke;

    iget-object v2, v2, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    goto :goto_3f

    :cond_4f
    return-void

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxke;

    if-eqz v1, :cond_24

    iget-object p0, v1, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2c

    :cond_24
    const-string v0, "Cannot find wrapper for "

    const-string v1, ", seems like it is not bound by this adapter: "

    invoke-static {v0, p1, v1, p0}, Ln57;->f(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    :goto_2c
    return p0

    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    invoke-virtual {p0, p1}, Lrma;->m(Landroidx/recyclerview/widget/i;)Lxke;

    move-result-object p0

    iget-object p0, p0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onViewDetachedFromWindow(Landroidx/recyclerview/widget/i;)V
    .registers 3

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    invoke-virtual {p0, p1}, Lrma;->m(Landroidx/recyclerview/widget/i;)Lxke;

    move-result-object p0

    iget-object p0, p0, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/i;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 4

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_30

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void

    :pswitch_9
    check-cast p1, Lbn5;

    invoke-virtual {p1}, Lbn5;->V()V

    return-void

    :pswitch_f
    iget-object p0, p0, Lx93;->b:Ljava/lang/Object;

    check-cast p0, Lrma;

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxke;

    if-eqz v1, :cond_28

    iget-object p0, v1, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    :cond_28
    const-string v0, "Cannot find wrapper for "

    const-string v1, ", seems like it is not bound by this adapter: "

    invoke-static {v0, p1, v1, p0}, Ln57;->f(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_f
        :pswitch_9
    .end packed-switch
.end method

.method public final setHasStableIds(Z)V
    .registers 3

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void

    :pswitch_9
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Calling setHasStableIds is not allowed on the ConcatAdapter. Use the Config object passed in the constructor to control this behavior"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final setStateRestorationPolicy(Leph;)V
    .registers 3

    iget-byte v0, p0, Lx93;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->setStateRestorationPolicy(Leph;)V

    return-void

    :pswitch_9
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Calling setStateRestorationPolicy is not allowed on the ConcatAdapter. This value is inferred from added adapters"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
