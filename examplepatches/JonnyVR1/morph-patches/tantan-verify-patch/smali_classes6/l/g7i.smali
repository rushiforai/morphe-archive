.class public final synthetic Ll/g7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f7i$b;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

.field public final synthetic c:Ll/dj70;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/f7i$b;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g7i;->a:Ll/f7i$b;

    iput-object p2, p0, Ll/g7i;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    iput-object p3, p0, Ll/g7i;->c:Ll/dj70;

    iput-object p4, p0, Ll/g7i;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g7i;->a:Ll/f7i$b;

    iget-object v1, p0, Ll/g7i;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    iget-object v2, p0, Ll/g7i;->c:Ll/dj70;

    iget-object p0, p0, Ll/g7i;->d:Landroid/view/View;

    invoke-static {v0, v1, v2, p0}, Ll/f7i$b;->a(Ll/f7i$b;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;Landroid/view/View;)V

    return-void
.end method
