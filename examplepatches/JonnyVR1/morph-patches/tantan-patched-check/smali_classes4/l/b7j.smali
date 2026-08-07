.class public Ll/b7j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/b7j;->o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    .line 5
    .line 6
    if-eqz p3, :cond_1

    .line 7
    .line 8
    move-object p3, p2

    .line 9
    check-cast p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    .line 10
    .line 11
    const/4 p5, 0x4

    .line 12
    invoke-virtual {p2, p5}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 16
    .line 17
    invoke-virtual {p0, p2, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1, p4}, Ll/em2;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 28
    .line 29
    sget-object p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->LIVE:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 30
    .line 31
    if-ne p0, p2, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    :goto_0
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 37
    .line 38
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 42
    .line 43
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->Z(Ll/oql;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/em2;->d(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x41800000    # 16.0f

    .line 5
    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 11
    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 17
    .line 18
    return-void
.end method

.method public j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/em2;->j(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Ll/qk4;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/qk4;->c()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/qk4;->c()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    .line 17
    .line 18
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 19
    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->b:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->Y(Ll/oql;Lcom/p1/mobile/putong/data/VoiceLiveState;I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->x1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {p0, p4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zl(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 46
    .line 47
    invoke-virtual {p4, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E6(Lcom/p1/mobile/putong/data/VoiceLiveState;)Z

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    if-eqz p4, :cond_1

    .line 52
    .line 53
    iget-object p2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 54
    .line 55
    iput-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->b:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 56
    .line 57
    const/high16 p0, 0x43220000    # 162.0f

    .line 58
    .line 59
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;I)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x1

    .line 67
    return p0

    .line 68
    :cond_1
    :goto_0
    return p2
.end method
