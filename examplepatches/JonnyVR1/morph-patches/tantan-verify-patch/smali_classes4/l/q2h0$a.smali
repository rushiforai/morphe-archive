.class public Ll/q2h0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q2h0;->p(Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Ll/pf60;

.field public final synthetic f:Landroid/animation/Animator;

.field public final synthetic g:Ll/q2h0;


# direct methods
.method public constructor <init>(Ll/q2h0;IILl/pf60;Landroid/animation/Animator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q2h0$a;->g:Ll/q2h0;

    .line 2
    .line 3
    iput p2, p0, Ll/q2h0$a;->c:I

    .line 4
    .line 5
    iput p3, p0, Ll/q2h0$a;->d:I

    .line 6
    .line 7
    iput-object p4, p0, Ll/q2h0$a;->e:Ll/pf60;

    .line 8
    .line 9
    iput-object p5, p0, Ll/q2h0$a;->f:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/q2h0$a;->a:Z

    .line 16
    .line 17
    iput p2, p0, Ll/q2h0$a;->b:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget v0, p0, Ll/q2h0$a;->d:I

    .line 12
    .line 13
    sub-int v0, p1, v0

    .line 14
    .line 15
    iget-object v1, p0, Ll/q2h0$a;->e:Ll/pf60;

    .line 16
    .line 17
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ll/q3m;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/t3m;->W()Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-boolean v2, p0, Ll/q2h0$a;->a:Z

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    iget v2, p0, Ll/q2h0$a;->b:I

    .line 30
    .line 31
    neg-int v2, v2

    .line 32
    add-int/2addr v2, p1

    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v1, v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 35
    .line 36
    .line 37
    iput p1, p0, Ll/q2h0$a;->b:I

    .line 38
    .line 39
    iget p1, p0, Ll/q2h0$a;->d:I

    .line 40
    .line 41
    if-gt v0, p1, :cond_0

    .line 42
    .line 43
    iget-object p1, p0, Ll/q2h0$a;->g:Ll/q2h0;

    .line 44
    .line 45
    iget-object v0, p0, Ll/q2h0$a;->e:Ll/pf60;

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/q2h0;->m(Ll/q2h0;Ll/pf60;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v0, p0, Ll/q2h0$a;->f:Landroid/animation/Animator;

    .line 52
    .line 53
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/p2h0;

    .line 57
    .line 58
    invoke-direct {v1, v0}, Ll/p2h0;-><init>(Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x1

    .line 68
    iput-boolean p1, p0, Ll/q2h0$a;->a:Z

    .line 69
    .line 70
    :cond_0
    return-void
.end method
