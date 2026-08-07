.class public Ll/jrh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jrh0$a;
    }
.end annotation


# static fields
.field public static final b:Ljava/lang/String; = "jrh0"


# instance fields
.field private a:Ll/irh0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 2
    .param p1    # Ll/jrh0$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/ttvecamera/c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/irh0;->m()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p1, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 9
    .line 10
    sget-object v1, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_Recorder:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/ash0;

    .line 15
    .line 16
    invoke-direct {v0, p1, p2}, Ll/ash0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object v1, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_OpenGL_OES:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 23
    .line 24
    if-ne v0, v1, :cond_2

    .line 25
    .line 26
    new-instance v0, Ll/csh0;

    .line 27
    .line 28
    invoke-direct {v0, p1, p2}, Ll/csh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    instance-of v0, p2, Lcom/ss/android/ttvecamera/b;

    .line 35
    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    iget v0, p1, Ll/jrh0$a;->f:I

    .line 39
    .line 40
    if-lez v0, :cond_3

    .line 41
    .line 42
    new-instance v0, Ll/yrh0;

    .line 43
    .line 44
    invoke-direct {v0, p1, p2}, Ll/yrh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    new-instance v0, Ll/xrh0;

    .line 51
    .line 52
    invoke-direct {v0, p1, p2}, Ll/xrh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_4
    new-instance v0, Ll/qqh0;

    .line 59
    .line 60
    invoke-direct {v0, p1, p2}, Ll/qqh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 64
    .line 65
    :goto_0
    invoke-virtual {p2, p0}, Lcom/ss/android/ttvecamera/c;->p0(Ll/jrh0;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public b()Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/irh0;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 15
    .line 16
    const/16 v0, 0x438

    .line 17
    .line 18
    const/16 v1, 0x780

    .line 19
    .line 20
    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public c()Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/irh0;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/irh0;->c()Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public d()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/irh0;->d()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public e()[Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/irh0;->f()[Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public f()Ll/irh0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/irh0;->g()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public h()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/irh0;->e()Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public i(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 1
    .param p1    # Landroid/hardware/camera2/params/StreamConfigurationMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    const/16 v0, -0x70

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Ll/irh0;->h(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    return v0
.end method

.method public j(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ")I"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/irh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/16 p0, -0x70

    .line 11
    .line 12
    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/irh0;->m()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public l(Lcom/ss/android/ttvecamera/c$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jrh0;->a:Ll/irh0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/jrh0;->b:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "provider is null!"

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Ll/irh0;->o(Lcom/ss/android/ttvecamera/c$e;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
