.class public Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;
.super Lcom/p1/mobile/android/app/Act$s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/match/MatchAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/android/app/Act;",
        ">",
        "Lcom/p1/mobile/android/app/Act$s<",
        "TT;",
        "Lcom/p1/mobile/android/app/Act;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$s;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/z7x;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->enterAnimation()Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    invoke-static {p1, p2, p0}, Ll/z7x;->a(Landroid/app/Activity;Landroid/app/Activity;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->enterAnimation()Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/android/app/Act$s;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Act;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
