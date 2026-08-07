.class public Ll/wth0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wth0$a;
    }
.end annotation


# static fields
.field public static final a:Ll/wth0$a;

.field public static final b:Ll/wth0$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/wth0$a;

    .line 2
    .line 3
    const/16 v1, 0x780

    .line 4
    .line 5
    const/16 v2, 0x438

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wth0$a;-><init>(II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/wth0;->a:Ll/wth0$a;

    .line 11
    .line 12
    new-instance v0, Ll/wth0$a;

    .line 13
    .line 14
    const/16 v1, 0xeec

    .line 15
    .line 16
    const/16 v2, 0x870

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/wth0$a;-><init>(II)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/wth0;->b:Ll/wth0$a;

    .line 22
    .line 23
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

.method public static synthetic a(Ll/wth0$a;Ll/wth0$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget v0, p1, Ll/wth0$a;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/wth0$a;->b:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget p1, p1, Ll/wth0$a;->c:I

    .line 8
    .line 9
    iget p0, p0, Ll/wth0$a;->c:I

    .line 10
    .line 11
    if-gt p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic b(Ll/wth0$a;Ll/wth0$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget v0, p1, Ll/wth0$a;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/wth0$a;->b:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p1, Ll/wth0$a;->c:I

    .line 8
    .line 9
    iget v1, p0, Ll/wth0$a;->c:I

    .line 10
    .line 11
    if-gt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/wth0$a;->c(Ll/wth0$a;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic c(Ll/wth0$a;Ll/wth0$a;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/wth0$a;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/wth0$a;->a()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public static synthetic d(Landroid/util/Size;)Ll/wth0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/wth0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-direct {v0, v1, p0}, Ll/wth0$a;-><init>(II)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic e(Landroid/util/Size;)Ll/wth0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/wth0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-direct {v0, v1, p0}, Ll/wth0$a;-><init>(II)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic f(Ll/wth0$a;Ll/wth0$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget v0, p1, Ll/wth0$a;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/wth0$a;->b:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget p1, p1, Ll/wth0$a;->c:I

    .line 8
    .line 9
    iget p0, p0, Ll/wth0$a;->c:I

    .line 10
    .line 11
    if-gt p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic g(Ll/wth0$a;Ll/wth0$a;)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/wth0$a;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/wth0$a;->a()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public static synthetic h(Ll/wth0$a;Ll/wth0$a;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget v0, p1, Ll/wth0$a;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/wth0$a;->b:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p1, Ll/wth0$a;->c:I

    .line 8
    .line 9
    iget v1, p0, Ll/wth0$a;->c:I

    .line 10
    .line 11
    if-gt v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/wth0$a;->c(Ll/wth0$a;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static i(Landroid/view/Display;)Ll/wth0$a;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ll/wth0$a;

    .line 10
    .line 11
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 12
    .line 13
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 14
    .line 15
    invoke-direct {p0, v1, v0}, Ll/wth0$a;-><init>(II)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public static j(Ljava/util/List;II)Landroid/hardware/Camera$Size;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/Camera$Size;",
            ">;II)",
            "Landroid/hardware/Camera$Size;"
        }
    .end annotation

    .line 1
    int-to-double v0, p1

    .line 2
    int-to-double v2, p2

    .line 3
    div-double/2addr v0, v2

    .line 4
    const/4 p1, 0x0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const-wide v3, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    move-wide v5, v3

    .line 18
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    if-eqz v7, :cond_3

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    check-cast v7, Landroid/hardware/Camera$Size;

    .line 29
    .line 30
    iget v8, v7, Landroid/hardware/Camera$Size;->width:I

    .line 31
    .line 32
    int-to-double v8, v8

    .line 33
    iget v10, v7, Landroid/hardware/Camera$Size;->height:I

    .line 34
    .line 35
    int-to-double v10, v10

    .line 36
    div-double/2addr v8, v10

    .line 37
    sub-double/2addr v8, v0

    .line 38
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v8

    .line 42
    const-wide v10, 0x3fb999999999999aL    # 0.1

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    cmpl-double v8, v8, v10

    .line 48
    .line 49
    if-lez v8, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget v8, v7, Landroid/hardware/Camera$Size;->height:I

    .line 53
    .line 54
    sub-int/2addr v8, p2

    .line 55
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    int-to-double v8, v8

    .line 60
    cmpg-double v8, v8, v5

    .line 61
    .line 62
    if-gez v8, :cond_1

    .line 63
    .line 64
    iget p1, v7, Landroid/hardware/Camera$Size;->height:I

    .line 65
    .line 66
    sub-int/2addr p1, p2

    .line 67
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    int-to-double v5, p1

    .line 72
    move-object p1, v7

    .line 73
    goto :goto_0

    .line 74
    :cond_3
    if-nez p1, :cond_5

    .line 75
    .line 76
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :cond_4
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Landroid/hardware/Camera$Size;

    .line 91
    .line 92
    iget v1, v0, Landroid/hardware/Camera$Size;->height:I

    .line 93
    .line 94
    sub-int/2addr v1, p2

    .line 95
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    int-to-double v1, v1

    .line 100
    cmpg-double v1, v1, v3

    .line 101
    .line 102
    if-gez v1, :cond_4

    .line 103
    .line 104
    iget p1, v0, Landroid/hardware/Camera$Size;->height:I

    .line 105
    .line 106
    sub-int/2addr p1, p2

    .line 107
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    int-to-double v1, p1

    .line 112
    move-object p1, v0

    .line 113
    move-wide v3, v1

    .line 114
    goto :goto_1

    .line 115
    :cond_5
    return-object p1
.end method

.method public static k(Landroid/view/Display;Landroid/hardware/camera2/CameraCharacteristics;Ljava/lang/Class;)Ll/wth0$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/view/Display;",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ll/wth0$a;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/wth0;->i(Landroid/view/Display;)Ll/wth0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 12
    .line 13
    invoke-static {p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->isOutputSupportedFor(Ljava/lang/Class;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, Ll/oth0;

    .line 33
    .line 34
    invoke-direct {p2}, Ll/oth0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/pth0;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/pth0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 53
    .line 54
    .line 55
    new-instance p1, Ll/qth0;

    .line 56
    .line 57
    invoke-direct {p1, p0}, Ll/qth0;-><init>(Ll/wth0$a;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ll/wth0$a;

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    new-instance p1, Ll/rth0;

    .line 69
    .line 70
    invoke-direct {p1, p0}, Ll/rth0;-><init>(Ll/wth0$a;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    move-object p1, p0

    .line 78
    check-cast p1, Ll/wth0$a;

    .line 79
    .line 80
    :cond_1
    if-nez p1, :cond_2

    .line 81
    .line 82
    sget-object p0, Ll/wth0;->a:Ll/wth0$a;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_2
    invoke-virtual {p1}, Ll/wth0$a;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    return-object p1

    .line 89
    :cond_3
    :goto_0
    sget-object p0, Ll/wth0;->a:Ll/wth0$a;

    .line 90
    .line 91
    return-object p0
.end method

.method public static l(Landroid/hardware/camera2/CameraCharacteristics;Ll/wth0$a;)Ll/wth0$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Ll/wth0$a;",
            ")",
            "Ll/wth0$a;"
        }
    .end annotation

    .line 1
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 8
    .line 9
    const-class v0, Landroid/media/MediaRecorder;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->isOutputSupportedFor(Ljava/lang/Class;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/sth0;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/sth0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/tth0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/tth0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/uth0;

    .line 54
    .line 55
    invoke-direct {p0, p1}, Ll/uth0;-><init>(Ll/wth0$a;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ll/wth0$a;

    .line 63
    .line 64
    if-nez p0, :cond_1

    .line 65
    .line 66
    new-instance p0, Ll/vth0;

    .line 67
    .line 68
    invoke-direct {p0, p1}, Ll/vth0;-><init>(Ll/wth0$a;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Ll/wth0$a;

    .line 76
    .line 77
    :cond_1
    if-nez p0, :cond_2

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p0}, Ll/wth0$a;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_3
    :goto_0
    return-object p1
.end method

.method public static m(Landroid/view/WindowManager;I)I
    .locals 3

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p1, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p0, :cond_3

    .line 20
    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    if-eq p0, v2, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x3

    .line 27
    if-eq p0, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 v1, 0x10e

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/16 v1, 0xb4

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/16 v1, 0x5a

    .line 37
    .line 38
    :cond_3
    :goto_0
    iget p0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 39
    .line 40
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 41
    .line 42
    if-ne p0, p1, :cond_4

    .line 43
    .line 44
    add-int/2addr v0, v1

    .line 45
    rem-int/lit16 v0, v0, 0x168

    .line 46
    .line 47
    return v0

    .line 48
    :cond_4
    sub-int/2addr v0, v1

    .line 49
    add-int/lit16 v0, v0, 0x168

    .line 50
    .line 51
    rem-int/lit16 v0, v0, 0x168

    .line 52
    .line 53
    return v0
.end method

.method public static n(Landroid/view/WindowManager;ILandroid/hardware/Camera;)I
    .locals 3

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 p1, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p0, :cond_3

    .line 20
    .line 21
    if-eq p0, p1, :cond_2

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    if-eq p0, v2, :cond_1

    .line 25
    .line 26
    const/4 v2, 0x3

    .line 27
    if-eq p0, v2, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 v1, 0x10e

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/16 v1, 0xb4

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/16 v1, 0x5a

    .line 37
    .line 38
    :cond_3
    :goto_0
    iget p0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 39
    .line 40
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 41
    .line 42
    if-ne p0, p1, :cond_4

    .line 43
    .line 44
    add-int/2addr v0, v1

    .line 45
    rem-int/lit16 v0, v0, 0x168

    .line 46
    .line 47
    rsub-int p0, v0, 0x168

    .line 48
    .line 49
    rem-int/lit16 p0, p0, 0x168

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    sub-int/2addr v0, v1

    .line 53
    add-int/lit16 v0, v0, 0x168

    .line 54
    .line 55
    rem-int/lit16 p0, v0, 0x168

    .line 56
    .line 57
    :goto_1
    invoke-virtual {p2, p0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 58
    .line 59
    .line 60
    return p0
.end method
