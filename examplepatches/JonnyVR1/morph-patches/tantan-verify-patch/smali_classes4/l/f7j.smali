.class public Ll/f7j;
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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f7j;->o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;

    .line 5
    .line 6
    if-eqz p3, :cond_2

    .line 7
    .line 8
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;

    .line 9
    .line 10
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 11
    .line 12
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 13
    .line 14
    .line 15
    iget-object p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 16
    .line 17
    invoke-virtual {p0, p3, p1, p4}, Ll/em2;->m(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 21
    .line 22
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 23
    .line 24
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 25
    .line 26
    sget-object p4, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;->MOMENT_CARD:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 27
    .line 28
    const/4 p5, 0x0

    .line 29
    const/4 v0, 0x1

    .line 30
    if-ne p3, p4, :cond_0

    .line 31
    .line 32
    move p3, v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move p3, p5

    .line 35
    :goto_0
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 39
    .line 40
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 41
    .line 42
    iget-object p3, p3, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;

    .line 43
    .line 44
    if-ne p3, p4, :cond_1

    .line 45
    .line 46
    move p5, v0

    .line 47
    :cond_1
    invoke-static {p0, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->S(Ll/oql;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d$a;->a(Z)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public d(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 0

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
    move-result p0

    .line 10
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 11
    .line 12
    const/high16 p0, 0x42dc0000    # 110.0f

    .line 13
    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 19
    .line 20
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->e()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method
