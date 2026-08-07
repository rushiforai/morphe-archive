.class public final synthetic Ll/n970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

.field public final synthetic c:Ll/n570;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/n570;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iput-object p2, p0, Ll/n970;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iput-object p3, p0, Ll/n970;->c:Ll/n570;

    iput-object p4, p0, Ll/n970;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/n970;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/n970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;

    iget-object v1, p0, Ll/n970;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    iget-object v2, p0, Ll/n970;->c:Ll/n570;

    iget-object v3, p0, Ll/n970;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/n970;->e:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;->f(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentDetailsView;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/n570;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
