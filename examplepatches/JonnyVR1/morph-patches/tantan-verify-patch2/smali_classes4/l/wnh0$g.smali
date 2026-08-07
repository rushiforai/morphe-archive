.class public Ll/wnh0$g;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wnh0;->a(Ll/wnh0$i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wnh0$i;

.field public final synthetic b:Landroid/view/ViewPropertyAnimator;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Ll/wnh0;


# direct methods
.method public constructor <init>(Ll/wnh0;Ll/wnh0$i;Landroid/view/ViewPropertyAnimator;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wnh0$g;->d:Ll/wnh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wnh0$g;->a:Ll/wnh0$i;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wnh0$g;->b:Landroid/view/ViewPropertyAnimator;

    .line 6
    .line 7
    iput-object p4, p0, Ll/wnh0$g;->c:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wnh0$g;->b:Landroid/view/ViewPropertyAnimator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/wnh0$g;->c:Landroid/view/View;

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/wnh0$g;->c:Landroid/view/View;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/wnh0$g;->c:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/wnh0$g;->d:Ll/wnh0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/wnh0$g;->a:Ll/wnh0$i;

    .line 28
    .line 29
    iget-object v0, v0, Ll/wnh0$i;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/v;->dispatchChangeFinished(Landroidx/recyclerview/widget/RecyclerView$e0;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/wnh0$g;->d:Ll/wnh0;

    .line 36
    .line 37
    iget-object p1, p1, Ll/wnh0;->i:Ljava/util/ArrayList;

    .line 38
    .line 39
    iget-object v0, p0, Ll/wnh0$g;->a:Ll/wnh0$i;

    .line 40
    .line 41
    iget-object v0, v0, Ll/wnh0$i;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/wnh0$g;->d:Ll/wnh0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wnh0;->dispatchFinishedWhenDone()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/wnh0$g;->d:Ll/wnh0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wnh0$g;->a:Ll/wnh0$i;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wnh0$i;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, p0, v0}, Landroidx/recyclerview/widget/v;->dispatchChangeStarting(Landroidx/recyclerview/widget/RecyclerView$e0;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
