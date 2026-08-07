.class public Ll/eva0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/gva0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/gva0;

.field public b:Landroid/content/Context;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopWebViewFrag;

.field public d:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopWebViewFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eva0;->b:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/eva0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopWebViewFrag;

    .line 7
    .line 8
    return-void
.end method

.method private e(Landroid/view/View;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    iput-object p1, p0, Ll/eva0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 4
    .line 5
    sget v0, Ll/gdc0;->N:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/eva0;->b:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Ll/j9c0;->o:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/eva0;->d()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->b2()Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Ll/eva0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopWebViewFrag;

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->W0(Ll/bqa0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eva0;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Ll/gva0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eva0;->a:Ll/gva0;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eva0;->c:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopWebViewFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eva0;->b:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/eva0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/MKWebViewManager;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gva0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eva0;->a(Ll/gva0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/sec0;->v:I

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
    invoke-direct {p0, p1}, Ll/eva0;->e(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
