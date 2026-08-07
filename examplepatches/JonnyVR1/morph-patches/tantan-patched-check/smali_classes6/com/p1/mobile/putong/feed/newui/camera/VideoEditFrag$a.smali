.class public Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

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
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget p3, p3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 27
    .line 28
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-interface {p2, p1}, Ll/fam;->h(Landroid/graphics/SurfaceTexture;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->U4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->g5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 56
    .line 57
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->V4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fe00;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-interface {p1, p2}, Ll/fam;->b(Ll/fe00;)Z

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Ll/fam;->g()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-interface {p1}, Ll/fam;->f()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-interface {p0}, Ll/fam;->g()V

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/fam;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->a5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
