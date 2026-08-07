.class public Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct$a;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->X1(Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/jka;->pc(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method
