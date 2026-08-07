.class public final synthetic Ll/g970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-boolean p2, p0, Ll/g970;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-boolean p0, p0, Ll/g970;->b:Z

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;ZLjava/lang/Boolean;)V

    return-void
.end method
