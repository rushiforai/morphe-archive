.class Ll/tc0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gkl0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->i8(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$b;->d:Ll/tc0;

    .line 2
    .line 3
    iput p2, p0, Ll/tc0$b;->a:I

    .line 4
    .line 5
    iput p3, p0, Ll/tc0$b;->b:I

    .line 6
    .line 7
    iput p4, p0, Ll/tc0$b;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/tc0$b;->a:I

    .line 2
    .line 3
    iget v1, p0, Ll/tc0$b;->b:I

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/tc0$b;->d:Ll/tc0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/tc0;->j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v1, p0, Ll/tc0$b;->c:I

    .line 15
    .line 16
    int-to-long v1, v1

    .line 17
    new-instance v3, Landroid/view/Surface;

    .line 18
    .line 19
    invoke-direct {v3, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/tc0$b;->d:Ll/tc0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/tc0;->D3(Ll/tc0;)Ll/evx;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v2, "onSurfaceTextureReady surfaceTexture:"

    .line 34
    .line 35
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v1, "onSurfaceTextureReady: uid="

    .line 59
    .line 60
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget v1, p0, Ll/tc0$b;->c:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v1, ", size="

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget v1, p0, Ll/tc0$b;->a:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v1, "x"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget p0, p0, Ll/tc0$b;->b:I

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v0, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 93
    .line 94
    invoke-virtual {p1, v0, p0}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method
