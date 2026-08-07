.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->c(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->f(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 44
    .line 45
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->h(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->d(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->g(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Ljava/lang/Runnable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 74
    .line 75
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->i:Z

    .line 76
    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    return-void

    .line 80
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/AutoScrollView;)Ljava/lang/Runnable;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-wide/16 v0, 0xbb8

    .line 91
    .line 92
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
