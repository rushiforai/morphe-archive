.class public final synthetic Ll/r870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-boolean p2, p0, Ll/r870;->b:Z

    iput-object p3, p0, Ll/r870;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-boolean v1, p0, Ll/r870;->b:Z

    iget-object p0, p0, Ll/r870;->c:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->B(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method
