.class public final synthetic Ll/png;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/png;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    iput-object p2, p0, Ll/png;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/png;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/png;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    iget-object v1, p0, Ll/png;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/png;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->i0(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Landroid/view/View;)V

    return-void
.end method
