.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const/4 p3, 0x0

    .line 20
    aget p2, p2, p3

    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 23
    .line 24
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    const/4 v0, 0x1

    .line 29
    aget p3, p3, v0

    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/fam;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0, p1}, Ll/fam;->h(Landroid/graphics/SurfaceTexture;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/fam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Ll/fam;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/fam;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const/4 p3, 0x0

    .line 20
    aget p2, p2, p3

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p3, 0x1

    .line 29
    aget p0, p0, p3

    .line 30
    .line 31
    invoke-virtual {p1, p2, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    aget v0, v0, v1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)[I

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v1, 0x1

    .line 29
    aget p0, p0, v1

    .line 30
    .line 31
    invoke-virtual {p1, v0, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
