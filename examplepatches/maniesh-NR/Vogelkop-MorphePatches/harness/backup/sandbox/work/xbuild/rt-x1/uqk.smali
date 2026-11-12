.class public final synthetic Luqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/TimeAnimator$TimeListener;


# instance fields
.field public final synthetic a:Lvqk;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Lvqk;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luqk;->a:Lvqk;

    iput-object p2, p0, Luqk;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final onTimeUpdate(Landroid/animation/TimeAnimator;JJ)V
    .registers 6

    iget-object p1, p0, Luqk;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    if-eqz p2, :cond_10

    invoke-virtual {p2}, Landroidx/recyclerview/widget/e;->h()Z

    move-result p2

    if-eqz p2, :cond_10

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void

    :cond_10
    iget-object p0, p0, Luqk;->a:Lvqk;

    iget-object p0, p0, Lvqk;->u:Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    return-void
.end method
