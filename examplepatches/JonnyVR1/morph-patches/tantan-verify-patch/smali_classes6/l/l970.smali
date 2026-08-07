.class public final synthetic Ll/l970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic c:Lcom/p1/mobile/putong/data/StickerInfo;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iput-object p2, p0, Ll/l970;->b:Lcom/p1/mobile/putong/data/Media;

    iput-object p3, p0, Ll/l970;->c:Lcom/p1/mobile/putong/data/StickerInfo;

    iput-object p4, p0, Ll/l970;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iget-object v1, p0, Ll/l970;->b:Lcom/p1/mobile/putong/data/Media;

    iget-object v2, p0, Ll/l970;->c:Lcom/p1/mobile/putong/data/StickerInfo;

    iget-object p0, p0, Ll/l970;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/data/StickerInfo;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
