.class public final synthetic Ll/u7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u7i;->a:Lcom/tantan/library/svga/SVGAnimationView;

    iput-object p2, p0, Ll/u7i;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u7i;->a:Lcom/tantan/library/svga/SVGAnimationView;

    iget-object p0, p0, Ll/u7i;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    invoke-static {v0, p0}, Ll/t7i$b;->a(Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    return-void
.end method
