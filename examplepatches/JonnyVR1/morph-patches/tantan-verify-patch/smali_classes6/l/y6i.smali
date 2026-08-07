.class public final synthetic Ll/y6i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/f7i;

.field public final synthetic b:Ll/dj70;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;


# direct methods
.method public synthetic constructor <init>(Ll/f7i;Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y6i;->a:Ll/f7i;

    iput-object p2, p0, Ll/y6i;->b:Ll/dj70;

    iput-object p3, p0, Ll/y6i;->c:Landroid/view/View;

    iput-object p4, p0, Ll/y6i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y6i;->a:Ll/f7i;

    iget-object v1, p0, Ll/y6i;->b:Ll/dj70;

    iget-object v2, p0, Ll/y6i;->c:Landroid/view/View;

    iget-object p0, p0, Ll/y6i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/f7i;->e(Ll/f7i;Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
