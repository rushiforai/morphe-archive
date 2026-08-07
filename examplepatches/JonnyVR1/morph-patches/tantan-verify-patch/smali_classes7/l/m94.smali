.class final Ll/m94;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final f:Ljava/util/regex/Pattern;


# instance fields
.field private final a:Landroid/content/Context;

.field private b:Landroid/graphics/Point;

.field private c:Landroid/graphics/Point;

.field private d:I

.field private e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, ","

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/m94;->f:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m94;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method private static a(Ljava/lang/CharSequence;I)I
    .locals 8

    .line 1
    sget-object v0, Ll/m94;->f:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    if-ge v1, v0, :cond_1

    .line 11
    .line 12
    aget-object v3, p0, v1

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    :try_start_0
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 19
    .line 20
    .line 21
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    const-wide/high16 v5, 0x4024000000000000L    # 10.0

    .line 23
    .line 24
    mul-double/2addr v5, v3

    .line 25
    double-to-int v5, v5

    .line 26
    int-to-double v6, p1

    .line 27
    sub-double/2addr v6, v3

    .line 28
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    sub-int v6, p1, v2

    .line 33
    .line 34
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    int-to-double v6, v6

    .line 39
    cmpg-double v3, v3, v6

    .line 40
    .line 41
    if-gez v3, :cond_0

    .line 42
    .line 43
    move v2, v5

    .line 44
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    return p1

    .line 48
    :cond_1
    return v2
.end method

.method private static b(Ljava/lang/CharSequence;Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 10

    .line 1
    sget-object v0, Ll/m94;->f:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length v0, p0

    .line 8
    const/4 v1, 0x0

    .line 9
    const v2, 0x7fffffff

    .line 10
    .line 11
    .line 12
    move v3, v1

    .line 13
    move v4, v3

    .line 14
    move v5, v4

    .line 15
    :goto_0
    if-ge v3, v0, :cond_3

    .line 16
    .line 17
    aget-object v6, p0, v3

    .line 18
    .line 19
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    const/16 v7, 0x78

    .line 24
    .line 25
    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    if-gez v7, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :try_start_0
    invoke-virtual {v6, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    add-int/lit8 v7, v7, 0x1

    .line 41
    .line 42
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    iget v7, p1, Landroid/graphics/Point;->x:I

    .line 51
    .line 52
    sub-int v7, v8, v7

    .line 53
    .line 54
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    iget v9, p1, Landroid/graphics/Point;->y:I

    .line 59
    .line 60
    sub-int v9, v6, v9

    .line 61
    .line 62
    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    add-int/2addr v7, v9

    .line 67
    if-nez v7, :cond_1

    .line 68
    .line 69
    move v5, v6

    .line 70
    move v4, v8

    .line 71
    goto :goto_2

    .line 72
    :cond_1
    if-ge v7, v2, :cond_2

    .line 73
    .line 74
    move v5, v6

    .line 75
    move v2, v7

    .line 76
    move v4, v8

    .line 77
    :catch_0
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    :goto_2
    if-lez v4, :cond_4

    .line 81
    .line 82
    if-lez v5, :cond_4

    .line 83
    .line 84
    new-instance p0, Landroid/graphics/Point;

    .line 85
    .line 86
    invoke-direct {p0, v4, v5}, Landroid/graphics/Point;-><init>(II)V

    .line 87
    .line 88
    .line 89
    return-object p0

    .line 90
    :cond_4
    const/4 p0, 0x0

    .line 91
    return-object p0
.end method

.method private static d(Landroid/hardware/Camera$Parameters;Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 1

    .line 1
    const-string v0, "preview-size-values"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "preview-size-value"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/m94;->b(Ljava/lang/CharSequence;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    :goto_0
    if-nez p0, :cond_2

    .line 24
    .line 25
    new-instance p0, Landroid/graphics/Point;

    .line 26
    .line 27
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    shr-int/lit8 v0, v0, 0x3

    .line 30
    .line 31
    shl-int/lit8 v0, v0, 0x3

    .line 32
    .line 33
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 34
    .line 35
    shr-int/lit8 p1, p1, 0x3

    .line 36
    .line 37
    shl-int/lit8 p1, p1, 0x3

    .line 38
    .line 39
    invoke-direct {p0, v0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-object p0
.end method

.method private j(Landroid/hardware/Camera$Parameters;)V
    .locals 2

    .line 1
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "Behold II"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, "flash-value"

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Ll/x94;->o:I

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-ne p0, v1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    invoke-virtual {p1, v0, p0}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x2

    .line 24
    invoke-virtual {p1, v0, p0}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    :goto_0
    const-string p0, "flash-mode"

    .line 28
    .line 29
    const-string v0, "off"

    .line 30
    .line 31
    invoke-virtual {p1, p0, v0}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private k(Landroid/hardware/Camera$Parameters;)V
    .locals 7

    .line 1
    const-string p0, "zoom-supported"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "max-zoom"

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 23
    .line 24
    const/16 v2, 0x1b

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 29
    .line 30
    .line 31
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    mul-double/2addr v3, v0

    .line 33
    double-to-int v3, v3

    .line 34
    if-le v2, v3, :cond_1

    .line 35
    .line 36
    move v2, v3

    .line 37
    :catch_0
    :cond_1
    const-string v3, "taking-picture-zoom-max"

    .line 38
    .line 39
    invoke-virtual {p1, v3}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    :try_start_1
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 49
    if-le v2, v4, :cond_2

    .line 50
    .line 51
    move v2, v4

    .line 52
    :catch_1
    :cond_2
    const-string v4, "mot-zoom-values"

    .line 53
    .line 54
    invoke-virtual {p1, v4}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    if-eqz v4, :cond_3

    .line 59
    .line 60
    invoke-static {v4, v2}, Ll/m94;->a(Ljava/lang/CharSequence;I)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    :cond_3
    const-string v5, "mot-zoom-step"

    .line 65
    .line 66
    invoke-virtual {p1, v5}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    if-eqz v5, :cond_4

    .line 71
    .line 72
    :try_start_2
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 77
    .line 78
    .line 79
    move-result-wide v5

    .line 80
    mul-double/2addr v5, v0

    .line 81
    double-to-int v5, v5

    .line 82
    const/4 v6, 0x1

    .line 83
    if-le v5, v6, :cond_4

    .line 84
    .line 85
    rem-int v5, v2, v5
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 86
    .line 87
    sub-int/2addr v2, v5

    .line 88
    :catch_2
    :cond_4
    if-nez p0, :cond_5

    .line 89
    .line 90
    if-eqz v4, :cond_6

    .line 91
    .line 92
    :cond_5
    int-to-double v4, v2

    .line 93
    div-double/2addr v4, v0

    .line 94
    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string v0, "zoom"

    .line 99
    .line 100
    invoke-virtual {p1, v0, p0}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_6
    if-eqz v3, :cond_7

    .line 104
    .line 105
    const-string p0, "taking-picture-zoom"

    .line 106
    .line 107
    invoke-virtual {p1, p0, v2}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 108
    .line 109
    .line 110
    :cond_7
    :goto_0
    return-void
.end method


# virtual methods
.method public c()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m94;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/m94;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m94;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m94;->b:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Landroid/hardware/Camera;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/m94;->d:I

    .line 10
    .line 11
    const-string v0, "preview-format"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->get(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/m94;->e:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, p0, Ll/m94;->a:Landroid/content/Context;

    .line 20
    .line 21
    const-string v1, "window"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/WindowManager;

    .line 28
    .line 29
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Landroid/graphics/Point;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/m94;->b:Landroid/graphics/Point;

    .line 47
    .line 48
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    new-instance v0, Landroid/graphics/Point;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/m94;->b:Landroid/graphics/Point;

    .line 57
    .line 58
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 59
    .line 60
    iput v2, v0, Landroid/graphics/Point;->x:I

    .line 61
    .line 62
    iget v2, v1, Landroid/graphics/Point;->y:I

    .line 63
    .line 64
    iput v2, v0, Landroid/graphics/Point;->y:I

    .line 65
    .line 66
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 67
    .line 68
    iget v3, v1, Landroid/graphics/Point;->y:I

    .line 69
    .line 70
    if-ge v2, v3, :cond_0

    .line 71
    .line 72
    iput v3, v0, Landroid/graphics/Point;->x:I

    .line 73
    .line 74
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 75
    .line 76
    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 77
    .line 78
    :cond_0
    invoke-static {p1, v0}, Ll/m94;->d(Landroid/hardware/Camera$Parameters;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Ll/m94;->c:Landroid/graphics/Point;

    .line 83
    .line 84
    iget-object p0, p0, Ll/m94;->b:Landroid/graphics/Point;

    .line 85
    .line 86
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public i(Landroid/hardware/Camera;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/m94;->c:Landroid/graphics/Point;

    .line 6
    .line 7
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/m94;->c:Landroid/graphics/Point;

    .line 11
    .line 12
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    invoke-virtual {v0, v2, v1}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, v0}, Ll/m94;->j(Landroid/hardware/Camera$Parameters;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, v0}, Ll/m94;->k(Landroid/hardware/Camera$Parameters;)V

    .line 23
    .line 24
    .line 25
    const/16 p0, 0x5a

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
