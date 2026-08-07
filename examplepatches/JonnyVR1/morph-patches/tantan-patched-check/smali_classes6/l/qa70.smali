.class public final synthetic Ll/qa70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic c:Lcom/p1/mobile/putong/data/StickerInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qa70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iput-object p2, p0, Ll/qa70;->b:Lcom/p1/mobile/putong/data/Media;

    iput-object p3, p0, Ll/qa70;->c:Lcom/p1/mobile/putong/data/StickerInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qa70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iget-object v1, p0, Ll/qa70;->b:Lcom/p1/mobile/putong/data/Media;

    iget-object p0, p0, Ll/qa70;->c:Lcom/p1/mobile/putong/data/StickerInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Landroid/view/View;)V

    return-void
.end method
