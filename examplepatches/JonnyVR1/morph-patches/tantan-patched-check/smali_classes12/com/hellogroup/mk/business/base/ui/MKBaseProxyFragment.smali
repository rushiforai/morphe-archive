.class public Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;
.super Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;
.source "SourceFile"


# instance fields
.field private W:Ll/nxl;

.field protected X:Lcom/hellogroup/mk/business/base/ui/MKWebView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b4()I
    .locals 0

    .line 1
    sget p0, Ll/bec0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public f4(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/pcc0;->f:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->X:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->s4()Ll/nxl;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->W:Ll/nxl;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->t4()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, ""

    .line 24
    .line 25
    invoke-interface {p1, p0, v0}, Ll/ziw;->s(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public m4()V
    .locals 0

    .line 1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->b4()I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->f4(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->W:Ll/nxl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/nxl;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->onDestroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->W:Ll/nxl;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/nxl;->u()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKBaseProxyFragment;->W:Ll/nxl;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Ll/nxl;->v()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public s4()Ll/nxl;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public t4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method
