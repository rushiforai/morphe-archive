.class public Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProcessHelper"
.end annotation


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

.method public static calcEyeScore([F)[F
    .locals 9

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    aget v0, p0, v0

    .line 4
    .line 5
    const/16 v1, 0x28

    .line 6
    .line 7
    aget v2, p0, v1

    .line 8
    .line 9
    sub-float/2addr v0, v2

    .line 10
    const/16 v2, 0x21

    .line 11
    .line 12
    aget v2, p0, v2

    .line 13
    .line 14
    const/16 v3, 0x29

    .line 15
    .line 16
    aget v4, p0, v3

    .line 17
    .line 18
    sub-float/2addr v2, v4

    .line 19
    mul-float v4, v0, v0

    .line 20
    .line 21
    mul-float v5, v2, v2

    .line 22
    .line 23
    add-float/2addr v4, v5

    .line 24
    float-to-double v4, v4

    .line 25
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    double-to-float v4, v4

    .line 30
    const/16 v5, 0x2c

    .line 31
    .line 32
    aget v5, p0, v5

    .line 33
    .line 34
    aget v1, p0, v1

    .line 35
    .line 36
    sub-float/2addr v5, v1

    .line 37
    const/16 v6, 0x2d

    .line 38
    .line 39
    aget v6, p0, v6

    .line 40
    .line 41
    aget v3, p0, v3

    .line 42
    .line 43
    sub-float/2addr v6, v3

    .line 44
    const/16 v7, 0x24

    .line 45
    .line 46
    aget v7, p0, v7

    .line 47
    .line 48
    sub-float/2addr v7, v1

    .line 49
    const/16 v1, 0x25

    .line 50
    .line 51
    aget v1, p0, v1

    .line 52
    .line 53
    sub-float/2addr v1, v3

    .line 54
    invoke-static {v0, v2, v5, v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v0, v2, v7, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-float/2addr v3, v0

    .line 71
    mul-float/2addr v4, v4

    .line 72
    div-float/2addr v3, v4

    .line 73
    const/16 v0, 0x38

    .line 74
    .line 75
    aget v0, p0, v0

    .line 76
    .line 77
    const/16 v1, 0x30

    .line 78
    .line 79
    aget v2, p0, v1

    .line 80
    .line 81
    sub-float/2addr v0, v2

    .line 82
    const/16 v2, 0x39

    .line 83
    .line 84
    aget v2, p0, v2

    .line 85
    .line 86
    const/16 v4, 0x31

    .line 87
    .line 88
    aget v5, p0, v4

    .line 89
    .line 90
    sub-float/2addr v2, v5

    .line 91
    mul-float v5, v0, v0

    .line 92
    .line 93
    mul-float v6, v2, v2

    .line 94
    .line 95
    add-float/2addr v5, v6

    .line 96
    float-to-double v5, v5

    .line 97
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    double-to-float v5, v5

    .line 102
    const/16 v6, 0x3c

    .line 103
    .line 104
    aget v6, p0, v6

    .line 105
    .line 106
    aget v1, p0, v1

    .line 107
    .line 108
    sub-float/2addr v6, v1

    .line 109
    const/16 v7, 0x3d

    .line 110
    .line 111
    aget v7, p0, v7

    .line 112
    .line 113
    aget v4, p0, v4

    .line 114
    .line 115
    sub-float/2addr v7, v4

    .line 116
    const/16 v8, 0x34

    .line 117
    .line 118
    aget v8, p0, v8

    .line 119
    .line 120
    sub-float/2addr v8, v1

    .line 121
    const/16 v1, 0x35

    .line 122
    .line 123
    aget p0, p0, v1

    .line 124
    .line 125
    sub-float/2addr p0, v4

    .line 126
    invoke-static {v0, v2, v6, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-static {v0, v2, v8, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    add-float/2addr v1, p0

    .line 143
    mul-float/2addr v5, v5

    .line 144
    div-float/2addr v1, v5

    .line 145
    const/4 p0, 0x2

    .line 146
    new-array p0, p0, [F

    .line 147
    .line 148
    const/4 v0, 0x0

    .line 149
    aput v3, p0, v0

    .line 150
    .line 151
    const/4 v0, 0x1

    .line 152
    aput v1, p0, v0

    .line 153
    .line 154
    return-object p0
.end method

.method public static calcMouthScore([F)F
    .locals 4

    .line 1
    const/16 v0, 0x81

    .line 2
    .line 3
    aget v0, p0, v0

    .line 4
    .line 5
    const/16 v1, 0x6d

    .line 6
    .line 7
    aget v1, p0, v1

    .line 8
    .line 9
    add-float/2addr v0, v1

    .line 10
    const/high16 v1, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr v0, v1

    .line 13
    const/16 v2, 0x77

    .line 14
    .line 15
    aget v2, p0, v2

    .line 16
    .line 17
    const/16 v3, 0x61

    .line 18
    .line 19
    aget v3, p0, v3

    .line 20
    .line 21
    add-float/2addr v2, v3

    .line 22
    div-float/2addr v2, v1

    .line 23
    sub-float/2addr v0, v2

    .line 24
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v1, 0x5a

    .line 29
    .line 30
    aget v1, p0, v1

    .line 31
    .line 32
    const/16 v2, 0x66

    .line 33
    .line 34
    aget p0, p0, v2

    .line 35
    .line 36
    sub-float/2addr v1, p0

    .line 37
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    div-float/2addr v0, p0

    .line 42
    return v0
.end method

.method public static convert90PTo5P([F)[F
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "90 to 5 convert size:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    array-length v1, p0

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "ProcessHelper"

    .line 17
    .line 18
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    const/16 v0, 0xb0

    .line 22
    .line 23
    aget v0, p0, v0

    .line 24
    .line 25
    const/16 v1, 0xb1

    .line 26
    .line 27
    aget v1, p0, v1

    .line 28
    .line 29
    const/16 v2, 0xb2

    .line 30
    .line 31
    aget v2, p0, v2

    .line 32
    .line 33
    const/16 v3, 0xb3

    .line 34
    .line 35
    aget v3, p0, v3

    .line 36
    .line 37
    const/16 v4, 0x40

    .line 38
    .line 39
    aget v4, p0, v4

    .line 40
    .line 41
    const/16 v5, 0x41

    .line 42
    .line 43
    aget v5, p0, v5

    .line 44
    .line 45
    const/16 v6, 0x5a

    .line 46
    .line 47
    aget v6, p0, v6

    .line 48
    .line 49
    const/16 v7, 0x5b

    .line 50
    .line 51
    aget v7, p0, v7

    .line 52
    .line 53
    const/16 v8, 0x66

    .line 54
    .line 55
    aget v8, p0, v8

    .line 56
    .line 57
    const/16 v9, 0x67

    .line 58
    .line 59
    aget p0, p0, v9

    .line 60
    .line 61
    const/16 v9, 0xa

    .line 62
    .line 63
    new-array v9, v9, [F

    .line 64
    .line 65
    const/4 v10, 0x0

    .line 66
    aput v0, v9, v10

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    aput v1, v9, v0

    .line 70
    .line 71
    const/4 v0, 0x2

    .line 72
    aput v2, v9, v0

    .line 73
    .line 74
    const/4 v0, 0x3

    .line 75
    aput v3, v9, v0

    .line 76
    .line 77
    const/4 v0, 0x4

    .line 78
    aput v4, v9, v0

    .line 79
    .line 80
    const/4 v0, 0x5

    .line 81
    aput v5, v9, v0

    .line 82
    .line 83
    const/4 v0, 0x6

    .line 84
    aput v6, v9, v0

    .line 85
    .line 86
    const/4 v0, 0x7

    .line 87
    aput v7, v9, v0

    .line 88
    .line 89
    const/16 v0, 0x8

    .line 90
    .line 91
    aput v8, v9, v0

    .line 92
    .line 93
    const/16 v0, 0x9

    .line 94
    .line 95
    aput p0, v9, v0

    .line 96
    .line 97
    return-object v9
.end method

.method public static crossProduct(FFFF)F
    .locals 0

    mul-float/2addr p0, p3

    mul-float/2addr p2, p1

    sub-float/2addr p0, p2

    return p0
.end method

.method public static preCheckCloseEyeScore([F)F
    .locals 9

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    aget v0, p0, v0

    .line 4
    .line 5
    const/16 v1, 0x28

    .line 6
    .line 7
    aget v2, p0, v1

    .line 8
    .line 9
    sub-float/2addr v0, v2

    .line 10
    const/16 v2, 0x21

    .line 11
    .line 12
    aget v2, p0, v2

    .line 13
    .line 14
    const/16 v3, 0x29

    .line 15
    .line 16
    aget v4, p0, v3

    .line 17
    .line 18
    sub-float/2addr v2, v4

    .line 19
    mul-float v4, v0, v0

    .line 20
    .line 21
    mul-float v5, v2, v2

    .line 22
    .line 23
    add-float/2addr v4, v5

    .line 24
    float-to-double v4, v4

    .line 25
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    double-to-float v4, v4

    .line 30
    const/16 v5, 0x2c

    .line 31
    .line 32
    aget v5, p0, v5

    .line 33
    .line 34
    aget v1, p0, v1

    .line 35
    .line 36
    sub-float/2addr v5, v1

    .line 37
    const/16 v6, 0x2d

    .line 38
    .line 39
    aget v6, p0, v6

    .line 40
    .line 41
    aget v3, p0, v3

    .line 42
    .line 43
    sub-float/2addr v6, v3

    .line 44
    const/16 v7, 0x24

    .line 45
    .line 46
    aget v7, p0, v7

    .line 47
    .line 48
    sub-float/2addr v7, v1

    .line 49
    const/16 v1, 0x25

    .line 50
    .line 51
    aget v1, p0, v1

    .line 52
    .line 53
    sub-float/2addr v1, v3

    .line 54
    invoke-static {v0, v2, v5, v6}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v0, v2, v7, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-float/2addr v3, v0

    .line 71
    mul-float/2addr v4, v4

    .line 72
    div-float/2addr v3, v4

    .line 73
    const/16 v0, 0x38

    .line 74
    .line 75
    aget v0, p0, v0

    .line 76
    .line 77
    const/16 v1, 0x30

    .line 78
    .line 79
    aget v2, p0, v1

    .line 80
    .line 81
    sub-float/2addr v0, v2

    .line 82
    const/16 v2, 0x39

    .line 83
    .line 84
    aget v2, p0, v2

    .line 85
    .line 86
    const/16 v4, 0x31

    .line 87
    .line 88
    aget v5, p0, v4

    .line 89
    .line 90
    sub-float/2addr v2, v5

    .line 91
    mul-float v5, v0, v0

    .line 92
    .line 93
    mul-float v6, v2, v2

    .line 94
    .line 95
    add-float/2addr v5, v6

    .line 96
    float-to-double v5, v5

    .line 97
    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    double-to-float v5, v5

    .line 102
    const/16 v6, 0x3c

    .line 103
    .line 104
    aget v6, p0, v6

    .line 105
    .line 106
    aget v1, p0, v1

    .line 107
    .line 108
    sub-float/2addr v6, v1

    .line 109
    const/16 v7, 0x3d

    .line 110
    .line 111
    aget v7, p0, v7

    .line 112
    .line 113
    aget v4, p0, v4

    .line 114
    .line 115
    sub-float/2addr v7, v4

    .line 116
    const/16 v8, 0x34

    .line 117
    .line 118
    aget v8, p0, v8

    .line 119
    .line 120
    sub-float/2addr v8, v1

    .line 121
    const/16 v1, 0x35

    .line 122
    .line 123
    aget p0, p0, v1

    .line 124
    .line 125
    sub-float/2addr p0, v4

    .line 126
    invoke-static {v0, v2, v6, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-static {v0, v2, v8, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$ProcessHelper;->crossProduct(FFFF)F

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    add-float/2addr v1, p0

    .line 143
    mul-float/2addr v5, v5

    .line 144
    div-float/2addr v1, v5

    .line 145
    cmpl-float p0, v3, v1

    .line 146
    .line 147
    if-lez p0, :cond_0

    .line 148
    .line 149
    return v1

    .line 150
    :cond_0
    return v3
.end method
