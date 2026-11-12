.class public final Lcom/opera/android/tabui2/FadeoutRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/tabui2/FadeoutRecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final G0:Lvzk;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lvzk;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Lvzk;->a:Ljava/lang/Object;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iput-object p2, p1, Lvzk;->b:Ljava/lang/Object;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    iput-object p2, p1, Lvzk;->c:Ljava/lang/Object;

    sget-object p2, Lfo8;->c:Lfo8;

    iput-object p2, p1, Lvzk;->d:Ljava/lang/Object;

    iput-object p1, p0, Lcom/opera/android/tabui2/FadeoutRecyclerView;->G0:Lvzk;

    return-void
.end method


# virtual methods
.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 13

    iget-object v7, p0, Lcom/opera/android/tabui2/FadeoutRecyclerView;->G0:Lvzk;

    iget-object v2, v7, Lvzk;->a:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-virtual {v8}, Landroid/view/View;->getScrollY()I

    move-result v2

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v8}, Landroid/view/View;->getScrollY()I

    move-result v4

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v4

    const/4 v6, 0x0

    invoke-virtual {p1, v6, v2, v3, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :try_start_20
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_a5

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    iget-object v0, v7, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lfo8;

    iget-object v0, v0, Lfo8;->a:Lfvl;

    invoke-virtual {v0}, Lfvl;->a()Z

    move-result v0

    const/4 v9, 0x0

    if-eqz v0, :cond_61

    invoke-virtual {v8}, Landroid/view/View;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v10

    invoke-virtual {p1, v9, v0}, Landroid/graphics/Canvas;->translate(FF)V

    :try_start_3f
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    iget-object v0, v7, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lfo8;

    iget-object v0, v0, Lfo8;->a:Lfvl;

    iget v0, v0, Lfvl;->a:I

    int-to-float v5, v0

    iget-object v0, v7, Lvzk;->b:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    :try_end_58
    .catchall {:try_start_3f .. :try_end_58} :catchall_5c

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_61

    :catchall_5c
    move-exception v0

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw v0

    :cond_61
    :goto_61
    iget-object v0, v7, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lfo8;

    iget-object v0, v0, Lfo8;->b:Lqp3;

    invoke-virtual {v0}, Lqp3;->a()Z

    move-result v0

    if-eqz v0, :cond_a4

    iget-object v0, v7, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Lfo8;

    iget-object v0, v0, Lfo8;->b:Lqp3;

    iget v2, v0, Lqp3;->a:I

    iget v0, v0, Lqp3;->b:I

    add-int/2addr v2, v0

    invoke-virtual {v8}, Landroid/view/View;->getScrollY()I

    move-result v0

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v3

    add-int/2addr v3, v0

    sub-int/2addr v3, v2

    int-to-float v0, v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v10

    invoke-virtual {p1, v9, v0}, Landroid/graphics/Canvas;->translate(FF)V

    :try_start_8a
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    int-to-float v5, v2

    iget-object v0, v7, Lvzk;->c:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
    :try_end_9b
    .catchall {:try_start_8a .. :try_end_9b} :catchall_9f

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    :catchall_9f
    move-exception v0

    invoke-virtual {p1, v10}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw v0

    :cond_a4
    return-void

    :catchall_a5
    move-exception v0

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw v0
.end method
