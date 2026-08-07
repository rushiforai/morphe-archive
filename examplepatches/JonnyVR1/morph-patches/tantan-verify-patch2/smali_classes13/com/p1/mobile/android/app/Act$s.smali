.class public Lcom/p1/mobile/android/app/Act$s;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Act;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "s"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FROM:",
        "Lcom/p1/mobile/android/app/Act;",
        "TO:",
        "Lcom/p1/mobile/android/app/Act;",
        ">",
        "Lcom/p1/mobile/android/app/Act$w<",
        "TFROM;TTO;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act$s;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act$s;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget p0, Ll/u7c0;->c:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    sget v0, Ll/u7c0;->d:I

    .line 3
    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act$s;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/qnp0;->Y0(Landroid/app/Activity;Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->enterAnimation()Landroid/animation/Animator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->exitAnimation()Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->initAnimationState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
