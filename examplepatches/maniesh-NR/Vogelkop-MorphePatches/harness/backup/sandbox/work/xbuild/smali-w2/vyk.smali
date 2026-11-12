.class public Lvyk;
.super Ly93;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ly93;"
    }
.end annotation


# instance fields
.field public D:I


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f141225

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ly93;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)Landroidx/recyclerview/widget/d;
    .registers 10

    check-cast p1, Lcom/opera/android/sync/SyncedSession;

    new-instance p2, Lev5;

    iget-object p1, p1, Lcom/opera/android/sync/SyncedSession;->a:Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MD0ZtbWr(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/opera/android/sync/SyncedSessionWindow;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v1, :cond_2b

    aget-object v3, p1, v2

    iget-object v4, v3, Lcom/opera/android/sync/SyncedSessionWindow;->a:Ljava/lang/String;

    iget-wide v5, v3, Lcom/opera/android/sync/SyncedSessionWindow;->b:J

    invoke-static {v4, v5, v6}, LJ/N;->Mn0q_taN(Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/opera/android/sync/SyncedSessionTab;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_2b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Lcom/opera/android/sync/SyncedSessionTab;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/opera/android/sync/SyncedSessionTab;

    invoke-direct {p2, p0, p1}, Lev5;-><init>(Lvyk;[Lcom/opera/android/sync/SyncedSessionTab;)V

    return-object p2
.end method

.method public final J0(Ljava/lang/Object;)Ljava/util/Date;
    .registers 4

    check-cast p1, Lcom/opera/android/sync/SyncedSession;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Ljava/util/Date;

    iget-object p1, p1, Lcom/opera/android/sync/SyncedSession;->c:Ljava/util/Date;

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    return-object p0
.end method

.method public final K0(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lcom/opera/android/sync/SyncedSession;

    iget-object p0, p1, Lcom/opera/android/sync/SyncedSession;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final N0()V
    .registers 5

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f141224

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0807af

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Ly93;->r:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final O0()V
    .registers 5

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f141209

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0807ae

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lh4i;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f07098e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lvyk;->D:I

    return-void
.end method
