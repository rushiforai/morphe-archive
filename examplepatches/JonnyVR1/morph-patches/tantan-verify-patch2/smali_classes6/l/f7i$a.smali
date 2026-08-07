.class public Ll/f7i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f7i;->v(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

.field public final synthetic b:Ll/f7i;


# direct methods
.method public constructor <init>(Ll/f7i;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/f7i$a;->b:Ll/f7i;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f7i$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/f7i$a;->b:Ll/f7i;

    .line 2
    .line 3
    iget-object p1, p1, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/f7i$a;->b:Ll/f7i;

    .line 12
    .line 13
    iget-object p1, p1, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/f7i$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 20
    .line 21
    iget-object p0, p0, Ll/f7i$a;->b:Ll/f7i;

    .line 22
    .line 23
    iget-object p0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
