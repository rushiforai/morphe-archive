.class public Ll/ugx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qyl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qyl<",
        "Ll/rgx;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

.field public b:Ll/f0r;

.field public c:I

.field public d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

.field public e:Ll/rgx;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ugx;->f:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/ugx;->a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/ugx;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ugx;->f()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/ugx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ugx;->i()V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ugx;->b:Ll/f0r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ugx;->c()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/ugx;->b:Ll/f0r;

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/ugx;->c()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/tgx;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tgx;-><init>(Ll/ugx;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ugx;->a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ugx;->c()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/ui/match/MatchAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugx;->a:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/rgx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ugx;->e:Ll/rgx;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final synthetic f()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugx;->e:Ll/rgx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rgx;->E0()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(II)V
    .locals 1

    .line 1
    iget p2, p0, Ll/ugx;->c:I

    .line 2
    .line 3
    sub-int v0, p1, p2

    .line 4
    .line 5
    if-gtz v0, :cond_2

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sub-int p2, p1, p2

    .line 11
    .line 12
    if-gez p2, :cond_4

    .line 13
    .line 14
    iget-boolean p2, p0, Ll/ugx;->f:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 20
    .line 21
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b0(ZI)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iput-boolean v0, p0, Ll/ugx;->f:Z

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 28
    .line 29
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eqz p2, :cond_3

    .line 35
    .line 36
    iget-boolean p2, p0, Ll/ugx;->f:Z

    .line 37
    .line 38
    if-nez p2, :cond_3

    .line 39
    .line 40
    iget-object p2, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->b0(ZI)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iput-boolean v0, p0, Ll/ugx;->f:Z

    .line 46
    .line 47
    :cond_4
    :goto_1
    iput p1, p0, Ll/ugx;->c:I

    .line 48
    .line 49
    return-void
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ugx;->b:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rgx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ugx;->d(Ll/rgx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->p7:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 9
    .line 10
    iput-object p1, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 11
    .line 12
    return-object p1
.end method

.method public initAnimationState()V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->G0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ugx;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ugx;->d:Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ugx;->e:Ll/rgx;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/k8x;->o0()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ll/sgx;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/sgx;-><init>(Ll/ugx;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/view/MatchSuccessNewLayout;->Y(Ljava/lang/String;Ll/pcj;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
