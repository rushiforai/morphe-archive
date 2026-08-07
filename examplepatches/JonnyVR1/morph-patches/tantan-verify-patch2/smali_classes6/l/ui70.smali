.class public final synthetic Ll/ui70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Music;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ui70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    iput-object p2, p0, Ll/ui70;->b:Lcom/p1/mobile/putong/data/Music;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ui70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    iget-object p0, p0, Ll/ui70;->b:Lcom/p1/mobile/putong/data/Music;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Lcom/p1/mobile/putong/data/Music;)V

    return-void
.end method
