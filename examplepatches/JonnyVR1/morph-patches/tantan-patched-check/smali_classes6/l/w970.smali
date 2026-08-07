.class public final synthetic Ll/w970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iput-object p2, p0, Ll/w970;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iget-object p0, p0, Ll/w970;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
