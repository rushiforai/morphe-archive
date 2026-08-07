.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/navigationbar/VNavigationTabLayout$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 8
    .line 9
    new-instance v1, Ll/pf60;

    .line 10
    .line 11
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->k2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)[Landroid/widget/TextView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    aget-object p0, p0, p1

    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public b(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 6
    .line 7
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->m2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->h2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x1

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->h2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    move v2, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v2, 0x0

    .line 34
    :goto_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    :cond_1
    if-nez p1, :cond_2

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->B:Lrx/subjects/b;

    .line 40
    .line 41
    new-instance v2, Ll/pf60;

    .line 42
    .line 43
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-direct {v2, v3, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lv/VPager;->setScrollble(Z)V

    .line 57
    .line 58
    .line 59
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct$e;->a:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->k2(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;)[Landroid/widget/TextView;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    aget-object p0, p0, p1

    .line 66
    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 80
    .line 81
    .line 82
    :cond_3
    return-void
.end method
