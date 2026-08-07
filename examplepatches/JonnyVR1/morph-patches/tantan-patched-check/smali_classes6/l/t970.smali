.class public final synthetic Ll/t970;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iput-boolean p2, p0, Ll/t970;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t970;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;

    iget-boolean p0, p0, Ll/t970;->b:Z

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->f(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;ZLandroid/view/View;)V

    return-void
.end method
