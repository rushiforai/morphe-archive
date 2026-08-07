.class public Ll/sgj0;
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

.method public static a(DD)[D
    .locals 12

    .line 1
    const-wide v0, 0x405a400000000000L    # 105.0

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    sub-double/2addr p2, v0

    .line 7
    const-wide v0, 0x4041800000000000L    # 35.0

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    sub-double v0, p0, v0

    .line 13
    .line 14
    invoke-static {p2, p3, v0, v1}, Ll/sgj0;->b(DD)D

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    invoke-static {p2, p3, v0, v1}, Ll/sgj0;->c(DD)D

    .line 19
    .line 20
    .line 21
    move-result-wide p2

    .line 22
    const-wide v0, 0x4066800000000000L    # 180.0

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    div-double/2addr p0, v0

    .line 28
    const-wide v4, 0x400921fb54442d18L    # Math.PI

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    mul-double/2addr p0, v4

    .line 34
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    .line 35
    .line 36
    .line 37
    move-result-wide v6

    .line 38
    const-wide v8, 0x3f7b6a8faf80ef0bL    # 0.006693421622965943

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    mul-double/2addr v8, v6

    .line 44
    mul-double/2addr v8, v6

    .line 45
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 46
    .line 47
    sub-double/2addr v6, v8

    .line 48
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v8

    .line 52
    mul-double/2addr v2, v0

    .line 53
    const-wide v10, 0x41582b102de355c1L    # 6335552.717000426

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    mul-double/2addr v6, v8

    .line 59
    div-double/2addr v10, v6

    .line 60
    mul-double/2addr v10, v4

    .line 61
    div-double/2addr v2, v10

    .line 62
    mul-double/2addr p2, v0

    .line 63
    const-wide v0, 0x415854c140000000L    # 6378245.0

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    div-double/2addr v0, v8

    .line 69
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    .line 70
    .line 71
    .line 72
    move-result-wide p0

    .line 73
    mul-double/2addr v0, p0

    .line 74
    mul-double/2addr v0, v4

    .line 75
    div-double/2addr p2, v0

    .line 76
    const/4 p0, 0x2

    .line 77
    new-array p0, p0, [D

    .line 78
    .line 79
    const/4 p1, 0x0

    .line 80
    aput-wide v2, p0, p1

    .line 81
    .line 82
    const/4 p1, 0x1

    .line 83
    aput-wide p2, p0, p1

    .line 84
    .line 85
    return-object p0
.end method

.method public static b(DD)D
    .locals 16

    .line 1
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 2
    .line 3
    mul-double v2, p0, v0

    .line 4
    .line 5
    const-wide/high16 v4, -0x3fa7000000000000L    # -100.0

    .line 6
    .line 7
    add-double/2addr v4, v2

    .line 8
    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    .line 9
    .line 10
    mul-double v8, p2, v6

    .line 11
    .line 12
    add-double/2addr v4, v8

    .line 13
    const-wide v8, 0x3fc999999999999aL    # 0.2

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double v10, p2, v8

    .line 19
    .line 20
    mul-double v10, v10, p2

    .line 21
    .line 22
    add-double/2addr v4, v10

    .line 23
    const-wide v10, 0x3fb999999999999aL    # 0.1

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    mul-double v10, v10, p0

    .line 29
    .line 30
    mul-double v10, v10, p2

    .line 31
    .line 32
    add-double/2addr v4, v10

    .line 33
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->abs(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide v10

    .line 37
    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v10

    .line 41
    mul-double/2addr v10, v8

    .line 42
    add-double/2addr v4, v10

    .line 43
    const-wide/high16 v8, 0x4018000000000000L    # 6.0

    .line 44
    .line 45
    mul-double v8, v8, p0

    .line 46
    .line 47
    const-wide v10, 0x400921fb54442d18L    # Math.PI

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    mul-double/2addr v8, v10

    .line 53
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide v8

    .line 57
    const-wide/high16 v12, 0x4034000000000000L    # 20.0

    .line 58
    .line 59
    mul-double/2addr v8, v12

    .line 60
    mul-double/2addr v2, v10

    .line 61
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    mul-double/2addr v2, v12

    .line 66
    add-double/2addr v8, v2

    .line 67
    mul-double/2addr v8, v0

    .line 68
    div-double/2addr v8, v6

    .line 69
    add-double/2addr v4, v8

    .line 70
    mul-double v2, p2, v10

    .line 71
    .line 72
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 73
    .line 74
    .line 75
    move-result-wide v8

    .line 76
    mul-double/2addr v8, v12

    .line 77
    div-double v12, p2, v6

    .line 78
    .line 79
    mul-double/2addr v12, v10

    .line 80
    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    .line 81
    .line 82
    .line 83
    move-result-wide v12

    .line 84
    const-wide/high16 v14, 0x4044000000000000L    # 40.0

    .line 85
    .line 86
    mul-double/2addr v12, v14

    .line 87
    add-double/2addr v8, v12

    .line 88
    mul-double/2addr v8, v0

    .line 89
    div-double/2addr v8, v6

    .line 90
    add-double/2addr v4, v8

    .line 91
    const-wide/high16 v8, 0x4028000000000000L    # 12.0

    .line 92
    .line 93
    div-double v8, p2, v8

    .line 94
    .line 95
    mul-double/2addr v8, v10

    .line 96
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v8

    .line 100
    const-wide/high16 v10, 0x4064000000000000L    # 160.0

    .line 101
    .line 102
    mul-double/2addr v8, v10

    .line 103
    const-wide/high16 v10, 0x403e000000000000L    # 30.0

    .line 104
    .line 105
    div-double/2addr v2, v10

    .line 106
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 107
    .line 108
    .line 109
    move-result-wide v2

    .line 110
    const-wide/high16 v10, 0x4074000000000000L    # 320.0

    .line 111
    .line 112
    mul-double/2addr v2, v10

    .line 113
    add-double/2addr v8, v2

    .line 114
    mul-double/2addr v8, v0

    .line 115
    div-double/2addr v8, v6

    .line 116
    add-double/2addr v4, v8

    .line 117
    return-wide v4
.end method

.method public static c(DD)D
    .locals 16

    .line 1
    const-wide v0, 0x4072c00000000000L    # 300.0

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    add-double v2, p0, v0

    .line 7
    .line 8
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 9
    .line 10
    mul-double v6, p2, v4

    .line 11
    .line 12
    add-double/2addr v2, v6

    .line 13
    const-wide v6, 0x3fb999999999999aL    # 0.1

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double v8, p0, v6

    .line 19
    .line 20
    mul-double v10, v8, p0

    .line 21
    .line 22
    add-double/2addr v2, v10

    .line 23
    mul-double v8, v8, p2

    .line 24
    .line 25
    add-double/2addr v2, v8

    .line 26
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->abs(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide v8

    .line 30
    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    mul-double/2addr v8, v6

    .line 35
    add-double/2addr v2, v8

    .line 36
    const-wide/high16 v6, 0x4018000000000000L    # 6.0

    .line 37
    .line 38
    mul-double v6, v6, p0

    .line 39
    .line 40
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    mul-double/2addr v6, v8

    .line 46
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    const-wide/high16 v10, 0x4034000000000000L    # 20.0

    .line 51
    .line 52
    mul-double/2addr v6, v10

    .line 53
    mul-double v12, p0, v4

    .line 54
    .line 55
    mul-double/2addr v12, v8

    .line 56
    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    .line 57
    .line 58
    .line 59
    move-result-wide v12

    .line 60
    mul-double/2addr v12, v10

    .line 61
    add-double/2addr v6, v12

    .line 62
    mul-double/2addr v6, v4

    .line 63
    const-wide/high16 v12, 0x4008000000000000L    # 3.0

    .line 64
    .line 65
    div-double/2addr v6, v12

    .line 66
    add-double/2addr v2, v6

    .line 67
    mul-double v6, p0, v8

    .line 68
    .line 69
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 70
    .line 71
    .line 72
    move-result-wide v6

    .line 73
    mul-double/2addr v6, v10

    .line 74
    div-double v10, p0, v12

    .line 75
    .line 76
    mul-double/2addr v10, v8

    .line 77
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 78
    .line 79
    .line 80
    move-result-wide v10

    .line 81
    const-wide/high16 v14, 0x4044000000000000L    # 40.0

    .line 82
    .line 83
    mul-double/2addr v10, v14

    .line 84
    add-double/2addr v6, v10

    .line 85
    mul-double/2addr v6, v4

    .line 86
    div-double/2addr v6, v12

    .line 87
    add-double/2addr v2, v6

    .line 88
    const-wide/high16 v6, 0x4028000000000000L    # 12.0

    .line 89
    .line 90
    div-double v6, p0, v6

    .line 91
    .line 92
    mul-double/2addr v6, v8

    .line 93
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    .line 94
    .line 95
    .line 96
    move-result-wide v6

    .line 97
    const-wide v10, 0x4062c00000000000L    # 150.0

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    mul-double/2addr v6, v10

    .line 103
    const-wide/high16 v10, 0x403e000000000000L    # 30.0

    .line 104
    .line 105
    div-double v10, p0, v10

    .line 106
    .line 107
    mul-double/2addr v10, v8

    .line 108
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 109
    .line 110
    .line 111
    move-result-wide v8

    .line 112
    mul-double/2addr v8, v0

    .line 113
    add-double/2addr v6, v8

    .line 114
    mul-double/2addr v6, v4

    .line 115
    div-double/2addr v6, v12

    .line 116
    add-double/2addr v2, v6

    .line 117
    return-wide v2
.end method
