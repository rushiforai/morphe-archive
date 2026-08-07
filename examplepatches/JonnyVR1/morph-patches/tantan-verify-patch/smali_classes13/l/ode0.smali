.class public Ll/ode0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()I
    .locals 6

    .line 1
    invoke-static {}, Ll/fiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x6

    .line 6
    new-array v1, v1, [B

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/WindowManager;

    .line 20
    .line 21
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v2, 0x14

    .line 31
    .line 32
    const/4 v3, -0x1

    .line 33
    :try_start_0
    new-array v2, v2, [B

    .line 34
    .line 35
    fill-array-data v2, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/16 v4, 0xe

    .line 47
    .line 48
    new-array v4, v4, [B

    .line 49
    .line 50
    fill-array-data v4, :array_2

    .line 51
    .line 52
    .line 53
    invoke-static {v4}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-class v5, Landroid/util/DisplayMetrics;

    .line 58
    .line 59
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move v0, v3

    .line 78
    :goto_0
    if-gtz v0, :cond_0

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_0
    move v3, v0

    .line 82
    :goto_1
    return v3

    .line 83
    :array_0
    .array-data 1
        0x47t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    nop

    .line 91
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x47t
        0x5et
        0x4t
        0x11t
        0x1et
        0x22t
        0x58t
        0x44t
        0x11t
        0xat
        0x51t
        0x1ft
    .end array-data

    .line 92
    :array_2
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x65t
        0x4t
        0x7t
        0x5ct
        0x2bt
        0x54t
        0x43t
        0x13t
        0xft
        0x53t
        0x15t
    .end array-data
.end method

.method public static b()I
    .locals 6

    .line 1
    invoke-static {}, Ll/fiw;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x6

    .line 6
    new-array v1, v1, [B

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/WindowManager;

    .line 20
    .line 21
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v2, 0x14

    .line 31
    .line 32
    const/4 v3, -0x1

    .line 33
    :try_start_0
    new-array v2, v2, [B

    .line 34
    .line 35
    fill-array-data v2, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {v2}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/16 v4, 0xe

    .line 47
    .line 48
    new-array v4, v4, [B

    .line 49
    .line 50
    fill-array-data v4, :array_2

    .line 51
    .line 52
    .line 53
    invoke-static {v4}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-class v5, Landroid/util/DisplayMetrics;

    .line 58
    .line 59
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move v0, v3

    .line 78
    :goto_0
    if-gtz v0, :cond_0

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_0
    move v3, v0

    .line 82
    :goto_1
    return v3

    .line 83
    :array_0
    .array-data 1
        0x47t
        0xft
        0x5ft
        0x53t
        0xet
        0x11t
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    nop

    .line 91
    :array_1
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x47t
        0x5et
        0x4t
        0x11t
        0x1et
        0x22t
        0x58t
        0x44t
        0x11t
        0xat
        0x51t
        0x1ft
    .end array-data

    .line 92
    :array_2
    .array-data 1
        0x57t
        0x3t
        0x45t
        0x65t
        0x4t
        0x7t
        0x5ct
        0x2bt
        0x54t
        0x43t
        0x13t
        0xft
        0x53t
        0x15t
    .end array-data
.end method
