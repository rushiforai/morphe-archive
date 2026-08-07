.class public final Ll/x94;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static k:I = -0x1

.field public static l:I = -0x1

.field public static m:I = -0x1

.field private static n:Ll/x94;

.field static final o:I


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ll/m94;

.field private c:Landroid/hardware/Camera;

.field private d:Landroid/graphics/Rect;

.field private e:Landroid/graphics/Rect;

.field private f:Z

.field private g:Z

.field private final h:Z

.field private final i:Ll/oq80;

.field private final j:Ll/te1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    const/16 v0, 0x2710

    .line 9
    .line 10
    :goto_0
    sput v0, Ll/x94;->o:I

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x94;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance v0, Ll/m94;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/m94;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/x94;->b:Ll/m94;

    .line 12
    .line 13
    sget-object p1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v1, 0x3

    .line 20
    if-le p1, v1, :cond_0

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    :goto_0
    iput-boolean p1, p0, Ll/x94;->h:Z

    .line 26
    .line 27
    new-instance v1, Ll/oq80;

    .line 28
    .line 29
    invoke-direct {v1, v0, p1}, Ll/oq80;-><init>(Ll/m94;Z)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/x94;->i:Ll/oq80;

    .line 33
    .line 34
    new-instance p1, Ll/te1;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/te1;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/x94;->j:Ll/te1;

    .line 40
    .line 41
    return-void
.end method

.method public static c()Ll/x94;
    .locals 1

    .line 1
    sget-object v0, Ll/x94;->n:Ll/x94;

    .line 2
    .line 3
    return-object v0
.end method

.method public static i(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-object v0, Ll/x94;->n:Ll/x94;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/x94;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/x94;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/x94;->n:Ll/x94;

    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public a([BII)Ll/vc80;
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/x94;->g()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/x94;->b:Ll/m94;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/m94;->e()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object p0, p0, Ll/x94;->b:Ll/m94;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/m94;->f()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v2, 0x10

    .line 18
    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    const/16 v2, 0x11

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    const-string v2, "yuv420p"

    .line 26
    .line 27
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    new-instance v3, Ll/vc80;

    .line 34
    .line 35
    iget v7, v0, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    iget v8, v0, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 40
    .line 41
    .line 42
    move-result v9

    .line 43
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 44
    .line 45
    .line 46
    move-result v10

    .line 47
    move-object v4, p1

    .line 48
    move v5, p2

    .line 49
    move v6, p3

    .line 50
    invoke-direct/range {v3 .. v10}, Ll/vc80;-><init>([BIIIIII)V

    .line 51
    .line 52
    .line 53
    return-object v3

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 55
    .line 56
    new-instance p2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string p3, "Unsupported picture format: "

    .line 59
    .line 60
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const/16 p3, 0x2f

    .line 67
    .line 68
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p1

    .line 82
    :cond_1
    move-object v1, p1

    .line 83
    move v2, p2

    .line 84
    move v3, p3

    .line 85
    move-object p0, v0

    .line 86
    new-instance v0, Ll/vc80;

    .line 87
    .line 88
    iget v4, p0, Landroid/graphics/Rect;->left:I

    .line 89
    .line 90
    iget v5, p0, Landroid/graphics/Rect;->top:I

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    invoke-direct/range {v0 .. v7}, Ll/vc80;-><init>([BIIIIII)V

    .line 101
    .line 102
    .line 103
    return-object v0
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/tsi;->a()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d()Ll/te1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x94;->j:Ll/te1;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Landroid/graphics/Rect;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/x94;->b:Ll/m94;

    .line 3
    .line 4
    invoke-virtual {v1}, Ll/m94;->g()Landroid/graphics/Point;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    sget v3, Ll/x94;->k:I

    .line 16
    .line 17
    sub-int/2addr v2, v3

    .line 18
    div-int/lit8 v2, v2, 0x2

    .line 19
    .line 20
    sget v3, Ll/x94;->m:I

    .line 21
    .line 22
    const/4 v4, -0x1

    .line 23
    if-eq v3, v4, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    sget v3, Ll/x94;->l:I

    .line 29
    .line 30
    sub-int/2addr v1, v3

    .line 31
    div-int/lit8 v3, v1, 0x2

    .line 32
    .line 33
    :goto_0
    new-instance v1, Landroid/graphics/Rect;

    .line 34
    .line 35
    sget v4, Ll/x94;->k:I

    .line 36
    .line 37
    add-int/2addr v4, v2

    .line 38
    sget v5, Ll/x94;->l:I

    .line 39
    .line 40
    add-int/2addr v5, v3

    .line 41
    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/x94;->d:Landroid/graphics/Rect;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    return-object v1

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public g()Landroid/graphics/Rect;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/x94;->e:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/x94;->f()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/x94;->b:Ll/m94;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/m94;->c()Landroid/graphics/Point;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Ll/x94;->b:Ll/m94;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/m94;->g()Landroid/graphics/Point;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    iget v4, v1, Landroid/graphics/Point;->y:I

    .line 29
    .line 30
    mul-int/2addr v3, v4

    .line 31
    iget v5, v2, Landroid/graphics/Point;->x:I

    .line 32
    .line 33
    div-int/2addr v3, v5

    .line 34
    iput v3, v0, Landroid/graphics/Rect;->left:I

    .line 35
    .line 36
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 37
    .line 38
    mul-int/2addr v3, v4

    .line 39
    div-int/2addr v3, v5

    .line 40
    iput v3, v0, Landroid/graphics/Rect;->right:I

    .line 41
    .line 42
    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 45
    .line 46
    mul-int/2addr v3, v1

    .line 47
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 48
    .line 49
    div-int/2addr v3, v2

    .line 50
    iput v3, v0, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    mul-int/2addr v3, v1

    .line 55
    div-int/2addr v3, v2

    .line 56
    iput v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 57
    .line 58
    iput-object v0, p0, Ll/x94;->e:Landroid/graphics/Rect;

    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Ll/x94;->e:Landroid/graphics/Rect;

    .line 61
    .line 62
    return-object p0
.end method

.method public h()Ll/oq80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x94;->i:Ll/oq80;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/x94;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/x94;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public l(Landroid/view/SurfaceHolder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 14
    .line 15
    .line 16
    iget-boolean p1, p0, Ll/x94;->f:Z

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Ll/x94;->f:Z

    .line 22
    .line 23
    iget-object p1, p0, Ll/x94;->b:Ll/m94;

    .line 24
    .line 25
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/m94;->h(Landroid/hardware/Camera;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Ll/x94;->b:Ll/m94;

    .line 31
    .line 32
    iget-object p0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ll/m94;->i(Landroid/hardware/Camera;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/tsi;->b()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    new-instance p0, Ljava/io/IOException;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_2
    return-void
.end method

.method public m(Landroid/os/Handler;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/x94;->g:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/x94;->j:Ll/te1;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ll/te1;->a(Landroid/os/Handler;I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 15
    .line 16
    iget-object p0, p0, Ll/x94;->j:Ll/te1;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public n(Landroid/os/Handler;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/x94;->g:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/x94;->i:Ll/oq80;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ll/oq80;->a(Landroid/os/Handler;I)V

    .line 12
    .line 13
    .line 14
    iget-boolean p1, p0, Ll/x94;->h:Z

    .line 15
    .line 16
    iget-object p2, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/x94;->i:Ll/oq80;

    .line 21
    .line 22
    invoke-virtual {p2, p0}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p0, p0, Ll/x94;->i:Ll/oq80;

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public o(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/x94;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/x94;->g:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Ll/x94;->g:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/x94;->g:Z

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/x94;->h:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/x94;->c:Landroid/hardware/Camera;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/x94;->i:Ll/oq80;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v2, v1}, Ll/oq80;->a(Landroid/os/Handler;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/x94;->j:Ll/te1;

    .line 29
    .line 30
    invoke-virtual {v0, v2, v1}, Ll/te1;->a(Landroid/os/Handler;I)V

    .line 31
    .line 32
    .line 33
    iput-boolean v1, p0, Ll/x94;->g:Z

    .line 34
    .line 35
    :cond_1
    return-void
.end method
