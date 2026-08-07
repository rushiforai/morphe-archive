.class public Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->m5()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 10
    .line 11
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget p3, p3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 35
    .line 36
    invoke-static {p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->k5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;II)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p2, p1}, Ll/fam;->h(Landroid/graphics/SurfaceTexture;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->X4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 61
    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->h5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 75
    .line 76
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->Y4(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fe00;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-interface {p1, p2}, Ll/fam;->b(Ll/fe00;)Z

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 84
    .line 85
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {p0}, Ll/fam;->g()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_1
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-interface {p1}, Ll/fam;->f()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 104
    .line 105
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p0}, Ll/fam;->g()V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->d5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Ll/fam;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;->e5(Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;)Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

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
