.class public final Lnicoid/core108/RotaryFling108;
.super Ljava/lang/Object;
.source "RotaryFling108.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/core108/RotaryFling108$Target;
    }
.end annotation


# static fields
.field private static final controllers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Landroidx/core/view/DifferentialMotionFlingController;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lnicoid/core108/RotaryFling108;->controllers:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detach(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    .line 28
    sget-object v0, Lnicoid/core108/RotaryFling108;->controllers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/core/view/DifferentialMotionFlingController;

    .line 29
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroidx/core/view/DifferentialMotionFlingController;->recycle108()V

    .line 30
    :cond_0
    return-void
.end method

.method public static onMotion(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .registers 5

    .line 15
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_5

    .line 16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/high16 v1, 0x400000

    and-int/2addr v0, v1

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->x:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 17
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    goto :goto_0

    .line 18
    :cond_2
    sget-object v0, Lnicoid/core108/RotaryFling108;->controllers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/view/DifferentialMotionFlingController;

    .line 19
    if-nez v0, :cond_4

    .line 20
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 21
    if-nez v0, :cond_3

    return-void

    .line 22
    :cond_3
    new-instance v1, Landroidx/core/view/DifferentialMotionFlingController;

    new-instance v2, Lnicoid/core108/RotaryFling108$Target;

    invoke-direct {v2, p0}, Lnicoid/core108/RotaryFling108$Target;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-direct {v1, v0, v2}, Landroidx/core/view/DifferentialMotionFlingController;-><init>(Landroid/content/Context;Landroidx/core/view/DifferentialMotionFlingTarget;)V

    .line 23
    sget-object v0, Lnicoid/core108/RotaryFling108;->controllers:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    .line 25
    :cond_4
    const/16 p0, 0x1a

    invoke-virtual {v0, p1, p0}, Landroidx/core/view/DifferentialMotionFlingController;->onMotionEvent(Landroid/view/MotionEvent;I)V

    .line 26
    return-void

    .line 17
    :cond_5
    :goto_0
    return-void
.end method
