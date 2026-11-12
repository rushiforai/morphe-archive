.class public abstract Lfs8;
.super Les8;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lth7;
.implements Lgq8;


# instance fields
.field public f:Lhq8;

.field public final g:Lfr8;

.field public final h:Lfr8;


# direct methods
.method public constructor <init>(Lfr8;)V
    .registers 2

    invoke-direct {p0, p1}, Les8;-><init>(Lfr8;)V

    iput-object p1, p0, Lfs8;->g:Lfr8;

    iput-object p1, p0, Lfs8;->h:Lfr8;

    return-void
.end method


# virtual methods
.method public final B()V
    .registers 3

    iget-object v0, p0, Lfs8;->h:Lfr8;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/i;->setIsRecyclable(Z)V

    return-void
.end method

.method public final C()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final E()V
    .registers 3

    iget-object v0, p0, Lfs8;->h:Lfr8;

    iget-object v1, v0, Lfr8;->q:Lzu4;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/i;->setIsRecyclable(Z)V

    return-void
.end method

.method public final I(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final K(Landroidx/recyclerview/widget/i;)V
    .registers 4

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p1

    invoke-virtual {p0}, Lfs8;->Y()Lcom/opera/android/favorites/e;

    move-result-object v0

    iget-object p0, p0, Lfs8;->f:Lhq8;

    iget-object v1, p0, Lhq8;->b:Ltq8;

    invoke-virtual {v0, p0, v1, p1}, Lnr8;->d(Lhq8;Ltq8;I)V

    return-void
.end method

.method public final Q(Lhq8;)V
    .registers 2

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lfs8;->Z(Lhq8;)V

    return-void
.end method

.method public final U(Ljava/lang/StringBuilder;)V
    .registers 4

    invoke-super {p0, p1}, Les8;->U(Ljava/lang/StringBuilder;)V

    iget-object v0, p0, Lfs8;->f:Lhq8;

    if-eqz v0, :cond_3d

    const-string v0, "/-"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lfs8;->f:Lhq8;

    invoke-virtual {v0}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    const-string v1, "null"

    invoke-static {v0, v1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "-/"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lfs8;->f:Lhq8;

    instance-of v0, p0, Ltq8;

    if-eqz v0, :cond_33

    check-cast p0, Ltq8;

    iget-object p0, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_35

    :cond_33
    const-string p0, "x"

    :goto_35
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "/0"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3d
    return-void
.end method

.method public final V()V
    .registers 4

    invoke-super {p0}, Les8;->V()V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v1, Lhs8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lhs8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public final Y()Lcom/opera/android/favorites/e;
    .registers 2

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    check-cast p0, Lcom/opera/android/favorites/e;

    return-object p0
.end method

.method public Z(Lhq8;)V
    .registers 9

    iget-object v0, p0, Lfs8;->f:Lhq8;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz v0, :cond_a

    invoke-virtual {v0, p0}, Lhq8;->o(Lgq8;)V

    :cond_a
    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iput-object p1, p0, Lfs8;->f:Lhq8;

    if-eqz p1, :cond_4a

    invoke-virtual {p1, p0}, Lhq8;->b(Lgq8;)V

    iget-object p1, p0, Lfs8;->f:Lhq8;

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    iget-object v0, p0, Lfs8;->g:Lfr8;

    iget-object v2, v0, Lfr8;->q:Lzu4;

    if-eqz p1, :cond_41

    iget-object p1, v0, Lfr8;->r:Landroid/graphics/Rect;

    iput-object p1, v2, Lzu4;->c:Ljava/lang/Object;

    iget-object v3, v2, Lol7;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_3a

    iget v4, p1, Landroid/graphics/Rect;->left:I

    iget v5, p1, Landroid/graphics/Rect;->top:I

    iget v6, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3, v4, v5, v6, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_3a
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4a

    :cond_41
    const/4 p1, 0x0

    iput-object p1, v2, Lzu4;->c:Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_4a
    :goto_4a
    iget-object p1, p0, Lfs8;->f:Lhq8;

    invoke-virtual {p0, p1, v1}, Lfs8;->a0(Lhq8;Z)V

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 7

    check-cast p1, Lfs8;

    iget-object p1, p1, Lfs8;->f:Lhq8;

    if-eqz p1, :cond_ba

    iget-object v0, p0, Lfs8;->f:Lhq8;

    if-eqz v0, :cond_ba

    instance-of v1, v0, Ltq8;

    if-eqz v1, :cond_22

    instance-of v1, p1, Ltq8;

    if-nez v1, :cond_22

    check-cast v0, Ltq8;

    invoke-virtual {p0}, Lfs8;->Y()Lcom/opera/android/favorites/e;

    move-result-object p0

    iget-object v1, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lnr8;->d(Lhq8;Ltq8;I)V

    return-void

    :cond_22
    invoke-virtual {p0}, Lfs8;->Y()Lcom/opera/android/favorites/e;

    move-result-object v0

    iget-object p0, p0, Lfs8;->f:Lhq8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_8f

    invoke-virtual {p0}, Lhq8;->j()Z

    move-result v1

    if-eqz v1, :cond_63

    check-cast p1, Ltq8;

    check-cast p0, Ltq8;

    invoke-virtual {p0}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_53

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_53

    invoke-virtual {p0, v1}, Lhq8;->q(Ljava/lang/String;)V

    :cond_53
    check-cast p0, Lcom/opera/android/favorites/b;

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    check-cast p1, Lcom/opera/android/favorites/b;

    iget-object p1, p1, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p0, p1}, LJ/N;->MADVX$$f(JJ)V

    return-void

    :cond_63
    move-object v1, p1

    check-cast v1, Lcom/opera/android/favorites/b;

    iget-object v3, p0, Lhq8;->b:Ltq8;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, p0, Lhq8;->b:Ltq8;

    if-ne v4, v3, :cond_71

    iget v2, p0, Lhq8;->c:I

    :cond_71
    if-lez v2, :cond_7d

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v4}, Ltq8;->u(I)Lhq8;

    move-result-object v4

    if-ne v4, p1, :cond_7d

    add-int/lit8 v2, v2, -0x1

    :cond_7d
    const/4 p1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Lnr8;->d(Lhq8;Ltq8;I)V

    check-cast v3, Lcom/opera/android/favorites/b;

    iget-object p0, v3, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-object p1, v1, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, v2, p0, p1}, LJ/N;->Mv32kuYR(JIJ)V

    return-void

    :cond_8f
    iget-object v0, p0, Lhq8;->b:Ltq8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Lhq8;->b:Ltq8;

    if-ne v1, v0, :cond_9a

    iget v2, p0, Lhq8;->c:I

    :cond_9a
    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    const-string v0, ""

    invoke-static {v2, v0}, LJ/N;->M98NjnEk(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    check-cast p0, Lcom/opera/android/favorites/a;

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v1, v0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide v3, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v1, v2, v3, v4}, LJ/N;->MPjvJx9a(JJ)V

    check-cast p1, Lcom/opera/android/favorites/a;

    iget-object p0, p1, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v0, v0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide p0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p0, p1}, LJ/N;->MPjvJx9a(JJ)V

    :cond_ba
    return-void
.end method

.method public a0(Lhq8;Z)V
    .registers 3

    iget-object p0, p0, Les8;->b:Lfr8;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lfr8;->m:Z

    return-void
.end method

.method public final e()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    return-object p0
.end method

.method public final f()Ljava/lang/Object;
    .registers 1

    iget-object p0, p0, Lfs8;->f:Lhq8;

    return-object p0
.end method

.method public final r(ILhq8;)V
    .registers 3

    const/4 p2, 0x7

    if-ne p1, p2, :cond_5

    const/4 p1, 0x1

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    :goto_6
    iget-object p2, p0, Lfs8;->f:Lhq8;

    if-eqz p2, :cond_d

    invoke-virtual {p0, p2, p1}, Lfs8;->a0(Lhq8;Z)V

    :cond_d
    return-void
.end method
