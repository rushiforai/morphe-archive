.class public abstract Ll/irh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/irh0$d;,
        Ll/irh0$c;
    }
.end annotation


# instance fields
.field a:Ll/irh0$c;

.field b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

.field c:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field d:Lcom/ss/android/ttvecamera/c;

.field e:Z

.field public f:I

.field public g:Lcom/ss/android/ttvecamera/TECameraFrame$d;

.field protected h:Lcom/ss/android/ttvecamera/c$e;

.field private i:Ll/irh0$c;

.field private j:Ll/irh0$c;


# direct methods
.method public constructor <init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/irh0;->e:Z

    .line 13
    .line 14
    iput v0, p0, Ll/irh0;->f:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/irh0;->h:Lcom/ss/android/ttvecamera/c$e;

    .line 18
    .line 19
    new-instance v0, Ll/irh0$a;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/irh0$a;-><init>(Ll/irh0;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/irh0;->i:Ll/irh0$c;

    .line 25
    .line 26
    new-instance v0, Ll/irh0$b;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/irh0$b;-><init>(Ll/irh0;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/irh0;->j:Ll/irh0$c;

    .line 32
    .line 33
    iget-object v0, p1, Ll/jrh0$a;->h:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 34
    .line 35
    iput-object v0, p0, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 36
    .line 37
    iget-object v0, p1, Ll/jrh0$a;->c:Ll/irh0$c;

    .line 38
    .line 39
    iput-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 40
    .line 41
    iget-object v0, p1, Ll/jrh0$a;->b:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 42
    .line 43
    iput-object v0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 44
    .line 45
    iput-object p2, p0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 46
    .line 47
    iget-boolean p2, p1, Ll/jrh0$a;->a:Z

    .line 48
    .line 49
    iput-boolean p2, p0, Ll/irh0;->e:Z

    .line 50
    .line 51
    iget p1, p1, Ll/jrh0$a;->f:I

    .line 52
    .line 53
    iput p1, p0, Ll/irh0;->f:I

    .line 54
    .line 55
    return-void
.end method

.method public static a([Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    array-length v1, p0

    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v1, :cond_1

    .line 13
    .line 14
    aget-object v3, p0, v2

    .line 15
    .line 16
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 17
    .line 18
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-direct {v4, v5, v3}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method


# virtual methods
.method public b()Landroid/view/Surface;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c()Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract d()Landroid/view/Surface;
.end method

.method public abstract e()Landroid/graphics/SurfaceTexture;
.end method

.method public f()[Landroid/view/Surface;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract g()I
.end method

.method public h(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 0
    .param p1    # Landroid/hardware/camera2/params/StreamConfigurationMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public abstract i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
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
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/irh0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public k(Lcom/ss/android/ttvecamera/TECameraFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/irh0$c;->onFrameCaptured(Lcom/ss/android/ttvecamera/TECameraFrame;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public abstract l()V
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 2
    .line 3
    instance-of v0, v0, Ll/irh0$d;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/irh0;->j:Ll/irh0$c;

    .line 8
    .line 9
    iput-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/irh0;->i:Ll/irh0$c;

    .line 13
    .line 14
    iput-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 15
    .line 16
    return-void
.end method

.method public n(Lcom/ss/android/ttvecamera/TECameraFrame$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/irh0;->g:Lcom/ss/android/ttvecamera/TECameraFrame$d;

    .line 2
    .line 3
    return-void
.end method

.method public o(Lcom/ss/android/ttvecamera/c$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/irh0;->h:Lcom/ss/android/ttvecamera/c$e;

    .line 2
    .line 3
    return-void
.end method
