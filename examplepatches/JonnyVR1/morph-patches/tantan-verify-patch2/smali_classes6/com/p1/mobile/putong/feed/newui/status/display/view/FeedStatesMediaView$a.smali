.class public Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView$a;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;->d(Lcom/p1/mobile/putong/data/Video;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView$a;->b:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

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
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStatesMediaView$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->D(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
