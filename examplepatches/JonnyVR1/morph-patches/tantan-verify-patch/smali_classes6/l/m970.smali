.class public final synthetic Ll/m970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iput-object p2, p0, Ll/m970;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iget-object p0, p0, Ll/m970;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;->h(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
