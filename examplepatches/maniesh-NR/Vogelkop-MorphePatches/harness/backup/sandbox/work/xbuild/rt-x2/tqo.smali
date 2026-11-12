.class public final Ltqo;
.super Landroid/graphics/drawable/DrawableWrapper;
.source "SourceFile"


# static fields
.field public static final h:Lzyk;


# instance fields
.field public final a:Ljava/io/File;

.field public b:Lcno;

.field public final c:Landroid/content/Context;

.field public final d:Lzyk;

.field public final e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public f:Lqt6;

.field public g:Landroid/animation/ObjectAnimator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, La43;->J:La43;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Ltqo;->h:Lzyk;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/io/File;Landroid/util/Size;Lcno;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/graphics/drawable/DrawableWrapper;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object p2, p0, Ltqo;->a:Ljava/io/File;

    iput-object p4, p0, Ltqo;->b:Lcno;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ltqo;->c:Landroid/content/Context;

    new-instance p1, Lqqo;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ltqo;->d:Lzyk;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Ltqo;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p1, Lqt6;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltqo;->f:Lqt6;

    new-instance p1, Lc7p;

    new-instance p2, Lm53;

    const/16 p4, 0x1b

    invoke-direct {p2, p3, p0, p4}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    invoke-direct {p1, p2}, Lc7p;-><init>(Lzyk;)V

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/DrawableWrapper;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Ltqo;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_17

    sget-object v0, Lw2p;->a:La64;

    new-instance v1, Lsqo;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p0}, Lsqo;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v2, 0x3

    invoke-static {v0, v3, v3, v1, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_17
    :try_start_17
    invoke-super {p0, p1}, Landroid/graphics/drawable/DrawableWrapper;->draw(Landroid/graphics/Canvas;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_1a

    :catch_1a
    return-void
.end method

.method public final getAlpha()I
    .registers 2

    iget-object v0, p0, Ltqo;->f:Lqt6;

    if-eqz v0, :cond_f

    iget-object v0, v0, Lqt6;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :cond_f
    invoke-super {p0}, Landroid/graphics/drawable/DrawableWrapper;->getAlpha()I

    move-result p0

    return p0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    iget-object v0, p0, Ltqo;->f:Lqt6;

    if-eqz v0, :cond_b

    iget-object v0, v0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/ColorFilter;

    if-eqz v0, :cond_b

    return-object v0

    :cond_b
    invoke-super {p0}, Landroid/graphics/drawable/DrawableWrapper;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object p0

    return-object p0
.end method

.method public final isAutoMirrored()Z
    .registers 2

    iget-object v0, p0, Ltqo;->f:Lqt6;

    if-eqz v0, :cond_f

    iget-object v0, v0, Lqt6;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_f
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isAutoMirrored()Z

    move-result p0

    return p0
.end method

.method public final isFilterBitmap()Z
    .registers 2

    iget-object v0, p0, Ltqo;->f:Lqt6;

    if-eqz v0, :cond_f

    iget-object v0, v0, Lqt6;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_f
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->isFilterBitmap()Z

    move-result p0

    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-object v0, p0, Ltqo;->f:Lqt6;

    if-eqz v0, :cond_7

    const/4 v1, 0x1

    iput-boolean v1, v0, Lqt6;->a:Z

    :cond_7
    invoke-super {p0}, Landroid/graphics/drawable/DrawableWrapper;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final setAlpha(I)V
    .registers 3

    iget-object v0, p0, Ltqo;->g:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Ltqo;->g:Landroid/animation/ObjectAnimator;

    invoke-super {p0, p1}, Landroid/graphics/drawable/DrawableWrapper;->setAlpha(I)V

    iget-object p0, p0, Ltqo;->f:Lqt6;

    if-nez p0, :cond_12

    return-void

    :cond_12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lqt6;->c:Ljava/lang/Object;

    return-void
.end method

.method public final setAutoMirrored(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setAutoMirrored(Z)V

    iget-object p0, p0, Ltqo;->f:Lqt6;

    if-nez p0, :cond_8

    return-void

    :cond_8
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lqt6;->d:Ljava/lang/Object;

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/DrawableWrapper;->setColorFilter(Landroid/graphics/ColorFilter;)V

    iget-object p0, p0, Ltqo;->f:Lqt6;

    if-nez p0, :cond_8

    return-void

    :cond_8
    iput-object p1, p0, Lqt6;->e:Ljava/lang/Object;

    return-void
.end method

.method public final setFilterBitmap(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    iget-object p0, p0, Ltqo;->f:Lqt6;

    if-nez p0, :cond_8

    return-void

    :cond_8
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lqt6;->f:Ljava/lang/Object;

    return-void
.end method
