.class public Ll/hhb0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hhb0;->L()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hhb0;


# direct methods
.method public constructor <init>(Ll/hhb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hhb0$b;->a:Ll/hhb0;

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

    .line 1
    iget-object p0, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/hhb0;->k(Ll/hhb0;Landroid/animation/AnimatorSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/hhb0;->p:Lv/VImage;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 10
    .line 11
    invoke-static {p1}, Ll/hhb0;->i(Ll/hhb0;)Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 22
    .line 23
    invoke-static {p1}, Ll/hhb0;->i(Ll/hhb0;)Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-wide/16 v0, 0x4b0

    .line 28
    .line 29
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 33
    .line 34
    invoke-static {p0}, Ll/hhb0;->i(Ll/hhb0;)Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/hhb0;->p:Lv/VImage;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/hhb0$b;->a:Ll/hhb0;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/hhb0;->j(Ll/hhb0;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
