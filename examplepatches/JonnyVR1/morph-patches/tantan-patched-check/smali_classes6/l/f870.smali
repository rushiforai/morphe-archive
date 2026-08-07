.class public final synthetic Ll/f870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-object p2, p0, Ll/f870;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-object p0, p0, Ll/f870;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
