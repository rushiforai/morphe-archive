.class public Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->u0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;->b:Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ie80$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;->b:Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 7
    .line 8
    sget-boolean v1, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->p:Z

    .line 9
    .line 10
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->F(Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
