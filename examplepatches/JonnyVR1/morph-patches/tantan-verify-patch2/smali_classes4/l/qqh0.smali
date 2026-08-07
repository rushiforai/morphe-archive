.class public Ll/qqh0;
.super Ll/irh0;
.source "SourceFile"


# static fields
.field private static final p:Ljava/lang/String; = "qqh0"


# instance fields
.field k:Landroid/hardware/Camera$PreviewCallback;

.field private l:I

.field private m:Landroid/graphics/SurfaceTexture;

.field private n:[[B

.field private o:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Ll/irh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput p2, p0, Ll/qqh0;->l:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/qqh0;->n:[[B

    .line 9
    .line 10
    iput p2, p0, Ll/qqh0;->o:I

    .line 11
    .line 12
    iget-object p1, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    iput-object p1, p0, Ll/qqh0;->m:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic p(Ll/qqh0;[B)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qqh0;->q([B)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private q([B)Z
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move v1, v0

    .line 7
    :goto_0
    const/4 v2, 0x1

    .line 8
    if-lez v1, :cond_6

    .line 9
    .line 10
    iget-object v3, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 11
    .line 12
    if-eqz v3, :cond_6

    .line 13
    .line 14
    iget v4, p0, Ll/qqh0;->l:I

    .line 15
    .line 16
    const/4 v5, 0x3

    .line 17
    if-ge v4, v5, :cond_6

    .line 18
    .line 19
    add-int/2addr v4, v2

    .line 20
    iput v4, p0, Ll/qqh0;->l:I

    .line 21
    .line 22
    iget v4, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 23
    .line 24
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 25
    .line 26
    mul-int/2addr v4, v3

    .line 27
    if-le v4, v1, :cond_1

    .line 28
    .line 29
    sget-object p1, Ll/qqh0;->p:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "checkPreviewData failed: mSize: "

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 39
    .line 40
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, ", length: "

    .line 44
    .line 45
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return v0

    .line 59
    :cond_1
    div-int/lit16 p0, v4, 0x12c

    .line 60
    .line 61
    div-int/lit8 v3, p0, 0x2

    .line 62
    .line 63
    aget-byte v5, p1, v0

    .line 64
    .line 65
    aget-byte v6, p1, v4

    .line 66
    .line 67
    move v7, v0

    .line 68
    :goto_1
    const/16 v8, 0x12c

    .line 69
    .line 70
    if-ge v7, v8, :cond_5

    .line 71
    .line 72
    mul-int v8, v7, p0

    .line 73
    .line 74
    mul-int v9, v7, v3

    .line 75
    .line 76
    add-int/2addr v9, v4

    .line 77
    if-ge v8, v1, :cond_5

    .line 78
    .line 79
    if-lt v9, v1, :cond_2

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_2
    aget-byte v8, p1, v8

    .line 83
    .line 84
    if-ne v5, v8, :cond_4

    .line 85
    .line 86
    aget-byte v8, p1, v9

    .line 87
    .line 88
    if-eq v6, v8, :cond_3

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    :goto_2
    return v2

    .line 95
    :cond_5
    :goto_3
    return v0

    .line 96
    :cond_6
    return v2
.end method


# virtual methods
.method public d()Landroid/view/Surface;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqh0;->m:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

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
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ll/qqh0;->m:Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 20
    .line 21
    iget v0, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 22
    .line 23
    iget p2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 24
    .line 25
    invoke-virtual {p1, v0, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 26
    .line 27
    .line 28
    :cond_1
    new-instance p1, Ll/qqh0$a;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/qqh0$a;-><init>(Ll/qqh0;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/qqh0;->k:Landroid/hardware/Camera$PreviewCallback;

    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public r(I)[[B
    .locals 5

    .line 1
    iget-object v0, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 2
    .line 3
    iget v1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 4
    .line 5
    iget v0, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 6
    .line 7
    mul-int/2addr v1, v0

    .line 8
    mul-int/lit8 v1, v1, 0x3

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    div-int/2addr v1, v0

    .line 12
    sget-object v2, Ll/qqh0;->p:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v4, "getBuffers current bufferSize: "

    .line 17
    .line 18
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v4, " mCallbackBytebufferSize:"

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v4, p0, Ll/qqh0;->o:I

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v2, v3}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v3, p0, Ll/qqh0;->o:I

    .line 42
    .line 43
    if-gt v1, v3, :cond_0

    .line 44
    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    :cond_0
    new-array v0, v0, [I

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    aput v1, v0, v3

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    aput p1, v0, v3

    .line 54
    .line 55
    sget-object p1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 56
    .line 57
    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, [[B

    .line 62
    .line 63
    iput-object p1, p0, Ll/qqh0;->n:[[B

    .line 64
    .line 65
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v0, "new mCallbackBytebuffer size :"

    .line 68
    .line 69
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {v2, p1}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iput v1, p0, Ll/qqh0;->o:I

    .line 83
    .line 84
    :cond_1
    iget-object p0, p0, Ll/qqh0;->n:[[B

    .line 85
    .line 86
    return-object p0
.end method

.method public s()Landroid/hardware/Camera$PreviewCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqh0;->k:Landroid/hardware/Camera$PreviewCallback;

    .line 2
    .line 3
    return-object p0
.end method
