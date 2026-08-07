.class public abstract Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;
.super Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
.source "SourceFile"

# interfaces
.implements Ll/u7m;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic j1(Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k1(Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B0(Lcom/p1/mobile/putong/core/newui/home/b;Ll/q7m;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public C()V
    .locals 0

    .line 1
    return-void
.end method

.method public D(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public F()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public R()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public U()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public abstract synthetic getCardData()Ll/ik4;
.end method

.method public abstract synthetic getCardDataProxy()Ll/ik4;
.end method

.method public abstract synthetic getCardView()Landroid/view/View;
.end method

.method public abstract synthetic getCardViewProxy()Landroid/view/View;
.end method

.method public abstract synthetic getMomentInfoProxy()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
.end method

.method public getShowPictureIndexProxy()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public abstract synthetic getUserInfoProxy()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
.end method

.method public abstract synthetic getUserProxy()Lcom/p1/mobile/putong/data/User;
.end method

.method public bridge synthetic getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/q7m;->getVirtualCard()Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    move-result-object p0

    return-object p0
.end method

.method public final l1(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ILjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/mp5;->h()Ll/mp5;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2, p1}, Ll/mp5;->i(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    :goto_0
    return-void

    .line 21
    :cond_1
    invoke-static {}, Ll/mp5;->h()Ll/mp5;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2, p1}, Ll/mp5;->f(Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x1

    .line 30
    invoke-virtual {p1, p2}, Lrx/c;->take(I)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/ugk0;

    .line 39
    .line 40
    invoke-direct {p1, p5}, Ll/ugk0;-><init>(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    new-instance p2, Ll/vgk0;

    .line 44
    .line 45
    invoke-direct {p2, p5}, Ll/vgk0;-><init>(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public q0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public s()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->e1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic setExpandedScrollListener(Ll/atl;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setExpandedScrollListener(Ll/atl;)V

    return-void
.end method

.method public setPageHelper(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public bridge synthetic setUndoClickAction(Ll/x20;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q7m;->setUndoClickAction(Ll/x20;)V

    return-void
.end method

.method public setUsHomeCardAnimHelper(Ll/fqj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
