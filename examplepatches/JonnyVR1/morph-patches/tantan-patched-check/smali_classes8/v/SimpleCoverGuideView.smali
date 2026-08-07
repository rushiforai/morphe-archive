.class public Lv/SimpleCoverGuideView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/SimpleCoverGuideView$a;
    }
.end annotation


# instance fields
.field public final a:Lv/SimpleCoverGuideView$a;

.field public b:Z


# direct methods
.method public static synthetic a(Lv/SimpleCoverGuideView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/SimpleCoverGuideView;->g(Z)V

    return-void
.end method


# virtual methods
.method public b()Lv/SimpleCoverGuideView$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 4
    .line 5
    invoke-static {p1}, Lv/SimpleCoverGuideView$a;->d(Lv/SimpleCoverGuideView$a;)Ll/x20;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 12
    .line 13
    invoke-static {p1}, Lv/SimpleCoverGuideView$a;->d(Lv/SimpleCoverGuideView$a;)Ll/x20;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/app/Activity;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroid/widget/FrameLayout;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lv/SimpleCoverGuideView;->e(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lv/SimpleCoverGuideView;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 6
    .line 7
    invoke-static {v0}, Lv/SimpleCoverGuideView$a;->a(Lv/SimpleCoverGuideView$a;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 14
    .line 15
    invoke-static {v0}, Lv/SimpleCoverGuideView$a;->c(Lv/SimpleCoverGuideView$a;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    new-instance v2, Ll/uof0;

    .line 20
    .line 21
    invoke-direct {v2, p0, p1}, Ll/uof0;-><init>(Lv/SimpleCoverGuideView;Z)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p1, v2, p1}, Ll/gt0;->h(Ljava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p0, v0, v1, p1}, Ll/gt0;->d(Landroid/view/View;JLandroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0, p1}, Lv/SimpleCoverGuideView;->c(Z)V

    .line 34
    .line 35
    .line 36
    :goto_0
    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lv/SimpleCoverGuideView;->b:Z

    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/SimpleCoverGuideView;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic g(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/SimpleCoverGuideView;->c(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getFadeInDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 2
    .line 3
    invoke-static {p0}, Lv/SimpleCoverGuideView$a;->b(Lv/SimpleCoverGuideView$a;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getOnDismiss()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/SimpleCoverGuideView;->a:Lv/SimpleCoverGuideView$a;

    .line 2
    .line 3
    invoke-static {p0}, Lv/SimpleCoverGuideView$a;->d(Lv/SimpleCoverGuideView$a;)Ll/x20;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
