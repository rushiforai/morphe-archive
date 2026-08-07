.class public final synthetic Ll/bdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bdh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;

    iput-object p2, p0, Ll/bdh;->b:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bdh;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;

    iget-object p0, p0, Ll/bdh;->b:Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;->j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/live/FeedLiveRecommendView;Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;Ljava/util/List;)V

    return-void
.end method
