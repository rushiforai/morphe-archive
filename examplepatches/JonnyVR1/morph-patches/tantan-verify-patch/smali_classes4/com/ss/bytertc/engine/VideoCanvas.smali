.class public Lcom/ss/bytertc/engine/VideoCanvas;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final RENDER_MODE_FILL:I = 0x3

.field public static final RENDER_MODE_FIT:I = 0x2

.field public static final RENDER_MODE_HIDDEN:I = 0x1


# instance fields
.field public backgroundColor:I

.field public renderMode:I

.field public renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

.field public renderSurface:Landroid/view/Surface;

.field public renderView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 14
    .line 15
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;I)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    const/4 p1, 0x0

    .line 45
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 46
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    const/4 p1, 0x0

    .line 47
    iput p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 48
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;II)V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    const/4 p1, 0x0

    .line 51
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 52
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 53
    iput p3, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 54
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;I)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    const/4 p1, 0x0

    .line 22
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 23
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 24
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;II)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 34
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 35
    iput p3, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 36
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method

.method public constructor <init>(Landroid/view/TextureView;I)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 28
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 30
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method

.method public constructor <init>(Landroid/view/TextureView;II)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 40
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 41
    iput p3, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 42
    sget-object p1, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    iput-object p1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoCanvas{, textureView="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", surface="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderSurface:Landroid/view/Surface;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", renderMode="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", background_color="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", renderRotation="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const/16 p0, 0x7d

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method
