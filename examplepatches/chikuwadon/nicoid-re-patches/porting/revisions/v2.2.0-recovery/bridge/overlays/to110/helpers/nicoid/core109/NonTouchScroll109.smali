.class public final Lnicoid/core109/NonTouchScroll109;
.super Ljava/lang/Object;
.source "NonTouchScroll109.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static scroll(Landroidx/recyclerview/widget/RecyclerView;IILandroid/view/MotionEvent;)V
    .registers 14

    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-eqz v0, :cond_f

    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->x:Z

    if-nez v0, :cond_f

    if-eqz p3, :cond_f

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_f

    .line 9
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result v1

    .line 10
    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, p1

    :goto_0
    if-nez v1, :cond_1

    move v5, v2

    goto :goto_1

    :cond_1
    move v5, p2

    .line 11
    :goto_1
    if-nez v4, :cond_2

    if-nez v5, :cond_2

    return-void

    .line 12
    :cond_2
    const/4 p1, 0x2

    if-eqz v1, :cond_3

    move p2, p1

    goto :goto_2

    :cond_3
    move p2, v2

    :goto_2
    or-int/2addr v0, p2

    .line 13
    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView;->c(I)Z

    move-result v1

    .line 14
    nop

    .line 16
    :try_start_0
    invoke-virtual {p0, v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->i(II)Z

    move-result v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 17
    if-eqz v9, :cond_4

    .line 18
    :try_start_1
    new-array v6, p1, [I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v3, p0

    :try_start_2
    invoke-virtual/range {v3 .. v8}, Landroidx/recyclerview/widget/RecyclerView;->a(II[I[II)Z

    move-result p0

    if-eqz p0, :cond_5

    aget p0, v6, v2

    sub-int/2addr v4, p0

    aget p0, v6, p2

    sub-int/2addr v5, p0

    goto :goto_3

    .line 27
    :catchall_0
    move-exception v0

    move-object v3, p0

    goto :goto_4

    .line 17
    :cond_4
    move-object v3, p0

    .line 21
    :cond_5
    :goto_3
    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-eqz p0, :cond_c

    iget-boolean p0, v3, Landroidx/recyclerview/widget/RecyclerView;->x:Z

    if-nez p0, :cond_c

    .line 22
    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result p0

    if-nez p0, :cond_6

    move v4, v2

    :cond_6
    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_7

    move v2, v5

    .line 23
    :cond_7
    if-nez v4, :cond_9

    if-nez v2, :cond_9

    .line 27
    if-eqz v9, :cond_8

    if-nez v1, :cond_8

    invoke-virtual {v3, p2}, Landroidx/recyclerview/widget/RecyclerView;->f(I)V

    .line 23
    :cond_8
    return-void

    .line 24
    :cond_9
    :try_start_3
    invoke-virtual {v3, v4, v2, p3}, Landroidx/recyclerview/widget/RecyclerView;->a(IILandroid/view/MotionEvent;)Z

    .line 25
    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->e0:Ld/s/c/i;

    if-eqz p0, :cond_a

    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->e0:Ld/s/c/i;

    invoke-virtual {p0, v3, v4, v2}, Ld/s/c/i;->a(Landroidx/recyclerview/widget/RecyclerView;II)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 27
    :cond_a
    if-eqz v9, :cond_b

    if-nez v1, :cond_b

    invoke-virtual {v3, p2}, Landroidx/recyclerview/widget/RecyclerView;->f(I)V

    .line 29
    :cond_b
    return-void

    .line 27
    :cond_c
    if-eqz v9, :cond_d

    if-nez v1, :cond_d

    invoke-virtual {v3, p2}, Landroidx/recyclerview/widget/RecyclerView;->f(I)V

    .line 21
    :cond_d
    return-void

    .line 27
    :catchall_1
    move-exception v0

    :goto_4
    move-object p0, v0

    move v2, v9

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object v3, p0

    move-object p0, v0

    :goto_5
    if-eqz v2, :cond_e

    if-nez v1, :cond_e

    invoke-virtual {v3, p2}, Landroidx/recyclerview/widget/RecyclerView;->f(I)V

    .line 28
    :cond_e
    throw p0

    .line 8
    :cond_f
    return-void
.end method
