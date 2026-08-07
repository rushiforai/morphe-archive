.class public Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/pql;


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vh4;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getBaseInfoLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserContentLayout()Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomDefaultLayout;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
