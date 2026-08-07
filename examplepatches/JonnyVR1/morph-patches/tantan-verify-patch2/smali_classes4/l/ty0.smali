.class public Ll/ty0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ry0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VButton_FakeShadow;

.field public b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ty0;->b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/ty0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ty0;->e(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ty0;->b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_p_appeal_submit_succeed_confirm"

    .line 11
    .line 12
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ty0;->b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->finish()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ty0;->b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/uy0;->b(Ll/ty0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/uy0;->c(Ll/ty0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ll/ry0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ty0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ry0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ty0;->d(Ll/ry0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ty0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ty0;->b:Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->h0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ty0;->a:Lv/VButton_FakeShadow;

    .line 9
    .line 10
    new-instance v1, Ll/sy0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/sy0;-><init>(Ll/ty0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
