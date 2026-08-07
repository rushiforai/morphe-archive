.class public Ll/wnh0$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wnh0;->animateAddImpl(Landroidx/recyclerview/widget/RecyclerView$e0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/ViewPropertyAnimator;

.field public final synthetic d:Ll/wnh0;


# direct methods
.method public constructor <init>(Ll/wnh0;Landroidx/recyclerview/widget/RecyclerView$e0;Landroid/view/View;Landroid/view/ViewPropertyAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wnh0$d;->d:Ll/wnh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wnh0$d;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wnh0$d;->b:Landroid/view/View;

    .line 6
    .line 7
    iput-object p4, p0, Ll/wnh0$d;->c:Landroid/view/ViewPropertyAnimator;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wnh0$d;->b:Landroid/view/View;

    .line 2
    .line 3
    const/high16 p1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wnh0$d;->c:Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/wnh0$d;->d:Ll/wnh0;

    .line 8
    .line 9
    iget-object v0, p0, Ll/wnh0$d;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/v;->dispatchAddFinished(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/wnh0$d;->d:Ll/wnh0;

    .line 15
    .line 16
    iget-object p1, p1, Ll/wnh0;->h:Ljava/util/ArrayList;

    .line 17
    .line 18
    iget-object v0, p0, Ll/wnh0$d;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/wnh0$d;->d:Ll/wnh0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wnh0;->dispatchFinishedWhenDone()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/wnh0$d;->d:Ll/wnh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wnh0$d;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/v;->dispatchAddStarting(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
