.class public Ll/n2l0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/m2l0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterExplainAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterExplainAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n2l0;->c:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterExplainAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/n2l0;->c:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterExplainAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/o2l0;->b(Ll/n2l0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/m2l0;)V
    .locals 0

    .line 1
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
    check-cast p1, Ll/m2l0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n2l0;->b(Ll/m2l0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/n2l0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n2l0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n2l0;->c:Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterExplainAct;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Nr:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/n2l0;->a:Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/high16 v1, 0x42200000    # 40.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sub-int/2addr v0, v1

    .line 34
    int-to-double v0, v0

    .line 35
    const-wide v2, 0x3fd504816f0068dcL    # 0.3284

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    div-double/2addr v0, v2

    .line 41
    double-to-int v0, v0

    .line 42
    iget-object v1, p0, Ll/n2l0;->b:Lv/VDraweeView;

    .line 43
    .line 44
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 48
    .line 49
    iget-object p0, p0, Ll/n2l0;->b:Lv/VDraweeView;

    .line 50
    .line 51
    const-string v1, "https://auto.tancdn.com/v1/images/eyJpZCI6IkVIVFI2SElOVkZCMk5MN0ZNNUVTR1U2Wk1ZS0pSVDEyIiwidyI6MTAwNSwiaCI6MzA2MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjYxNDg3MDE5MTg5NTY4MDAzMjl9.png"

    .line 52
    .line 53
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
