.class public Ll/obi;
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

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    const/high16 v0, 0x42000000    # 32.0f

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 18
    .line 19
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->f(Lcom/p1/mobile/putong/data/Media;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->e:Lv/VText;

    .line 23
    .line 24
    new-instance p2, Ll/nbi;

    .line 25
    .line 26
    invoke-direct {p2, p1}, Ll/nbi;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->e:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->f:Landroid/widget/TextView;

    .line 43
    .line 44
    const/16 p1, 0x11

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
