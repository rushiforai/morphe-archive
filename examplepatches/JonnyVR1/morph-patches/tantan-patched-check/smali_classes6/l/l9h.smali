.class public Ll/l9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z3i;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 6
    .line 7
    const/high16 v0, 0x42000000    # 32.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/wlj;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->f(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 21
    .line 22
    new-instance p1, Ll/k9h;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/k9h;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->setSuccessAttachCallback(Ll/y20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
