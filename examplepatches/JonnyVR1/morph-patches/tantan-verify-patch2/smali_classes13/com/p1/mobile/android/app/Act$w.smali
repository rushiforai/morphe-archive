.class public abstract Lcom/p1/mobile/android/app/Act$w;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Act;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "w"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FROM:",
        "Ljava/lang/Object;",
        "TO:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTO;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public abstract c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)",
            "Landroid/animation/Animator;"
        }
    .end annotation
.end method

.method public abstract d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)",
            "Landroid/animation/Animator;"
        }
    .end annotation
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public f(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0, p0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0, p0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TFROM;TTO;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
