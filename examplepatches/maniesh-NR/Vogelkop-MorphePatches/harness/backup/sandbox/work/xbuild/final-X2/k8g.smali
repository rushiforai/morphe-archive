.class public final Lk8g;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Lro9;


# virtual methods
.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lk8g;->c:Lro9;

    iget p0, p0, Lro9;->b:I

    return p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    check-cast p1, Li8g;

    iget-object v1, p0, Lk8g;->c:Lro9;

    iget v3, p0, Lk8g;->a:I

    iget v4, p0, Lk8g;->b:I

    iget-object p0, p1, Li8g;->b:Landroid/widget/ImageView;

    iget-object v0, p1, Li8g;->c:Lro9;

    if-ne v0, v1, :cond_1b

    iget v0, p1, Li8g;->d:I

    if-ne v0, p2, :cond_1b

    iget v0, p1, Li8g;->e:I

    if-ne v0, v3, :cond_1b

    iget v0, p1, Li8g;->f:I

    if-ne v0, v4, :cond_1b

    return-void

    :cond_1b
    iput v3, p1, Li8g;->e:I

    iput v4, p1, Li8g;->f:I

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p0, p1, Li8g;->g:Lj8g;

    if-eqz p0, :cond_37

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_37
    iget-object p0, p1, Li8g;->h:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v0, p1, Li8g;->h:Landroid/graphics/Bitmap;

    :cond_40
    iput-object v1, p1, Li8g;->c:Lro9;

    iput p2, p1, Li8g;->d:I

    new-instance v5, Lo8f;

    const/16 p0, 0xe

    invoke-direct {v5, p1, p0}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lj8g;

    move v2, p2

    invoke-direct/range {v0 .. v5}, Lj8g;-><init>(Lro9;IIILo8f;)V

    iget-object p0, v1, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {v0, p0, p2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    iput-object v0, p1, Li8g;->g:Lj8g;

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 4

    new-instance p0, Li8g;

    const p2, 0x7f0d032b

    const/4 v0, 0x0

    invoke-static {p1, p2, p1, v0}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Li8g;-><init>(Landroid/view/View;)V

    return-object p0
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    iget-object p0, p0, Lk8g;->c:Lro9;

    iget-object p0, p0, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 4

    check-cast p1, Li8g;

    iget-object p0, p1, Li8g;->b:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p0, p1, Li8g;->g:Lj8g;

    if-eqz p0, :cond_12

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    iput-object v0, p1, Li8g;->g:Lj8g;

    :cond_12
    iget-object p0, p1, Li8g;->h:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v0, p1, Li8g;->h:Landroid/graphics/Bitmap;

    :cond_1b
    iput-object v0, p1, Li8g;->c:Lro9;

    const/4 p0, 0x0

    iput p0, p1, Li8g;->f:I

    iput p0, p1, Li8g;->e:I

    return-void
.end method
