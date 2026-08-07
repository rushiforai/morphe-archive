.class public Ll/jl70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl70;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->p()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/high16 v1, -0x1000000

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/jl70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeEditAct;

    .line 13
    .line 14
    const/16 v0, 0x10

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jl70;->b(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->i4:I

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
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 9
    .line 10
    iput-object p1, p0, Ll/jl70;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 11
    .line 12
    return-object p1
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl70;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/jl70;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/jl70;->c:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->s(Ll/jl70;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/jl70;->b:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;->m0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
