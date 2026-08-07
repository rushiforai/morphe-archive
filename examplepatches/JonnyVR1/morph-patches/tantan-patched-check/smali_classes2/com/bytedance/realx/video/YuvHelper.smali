.class public Lcom/bytedance/realx/video/YuvHelper;
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

.method public static I420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V
    .locals 17

    .line 1
    move-object/from16 v0, p6

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    if-eqz p2, :cond_2

    .line 6
    .line 7
    if-eqz p4, :cond_2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    add-int/lit8 v1, p8, 0x1

    .line 13
    .line 14
    div-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    add-int/lit8 v2, p7, 0x1

    .line 17
    .line 18
    div-int/lit8 v12, v2, 0x2

    .line 19
    .line 20
    mul-int v2, p7, p8

    .line 21
    .line 22
    mul-int/2addr v1, v12

    .line 23
    mul-int/lit8 v3, v1, 0x2

    .line 24
    .line 25
    add-int/2addr v3, v2

    .line 26
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-lt v4, v3, :cond_1

    .line 31
    .line 32
    add-int/2addr v1, v2

    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v13

    .line 55
    move v14, v12

    .line 56
    move/from16 v15, p7

    .line 57
    .line 58
    move-object/from16 v3, p0

    .line 59
    .line 60
    move/from16 v4, p1

    .line 61
    .line 62
    move-object/from16 v5, p2

    .line 63
    .line 64
    move/from16 v6, p3

    .line 65
    .line 66
    move-object/from16 v7, p4

    .line 67
    .line 68
    move/from16 v8, p5

    .line 69
    .line 70
    move/from16 v10, p7

    .line 71
    .line 72
    move/from16 v16, p8

    .line 73
    .line 74
    invoke-static/range {v3 .. v16}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    const-string v1, " was "

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const-string v2, "Expected destination buffer capacity to be at least "

    .line 85
    .line 86
    invoke-static {v2, v3, v1, v0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    :goto_0
    const-string v0, "YuvHelper"

    .line 91
    .line 92
    const-string v1, "I420Copy params is null"

    .line 93
    .line 94
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static I420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 0

    .line 98
    invoke-static/range {p0 .. p13}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    return-void
.end method

.method public static I420Rotate(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 15

    .line 1
    move-object/from16 v0, p6

    .line 2
    .line 3
    move/from16 v14, p9

    .line 4
    .line 5
    rem-int/lit16 v1, v14, 0xb4

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    move/from16 v7, p7

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move/from16 v7, p8

    .line 13
    .line 14
    :goto_0
    if-nez v1, :cond_1

    .line 15
    .line 16
    move/from16 v1, p8

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move/from16 v1, p7

    .line 20
    .line 21
    :goto_1
    add-int/lit8 v2, v1, 0x1

    .line 22
    .line 23
    div-int/lit8 v2, v2, 0x2

    .line 24
    .line 25
    add-int/lit8 v3, v7, 0x1

    .line 26
    .line 27
    div-int/lit8 v9, v3, 0x2

    .line 28
    .line 29
    mul-int/2addr v1, v7

    .line 30
    mul-int/2addr v2, v9

    .line 31
    mul-int/lit8 v3, v2, 0x2

    .line 32
    .line 33
    add-int/2addr v3, v1

    .line 34
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-lt v4, v3, :cond_2

    .line 39
    .line 40
    add-int/2addr v2, v1

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    move v11, v9

    .line 64
    move-object v0, p0

    .line 65
    move/from16 v1, p1

    .line 66
    .line 67
    move-object/from16 v2, p2

    .line 68
    .line 69
    move/from16 v3, p3

    .line 70
    .line 71
    move-object/from16 v4, p4

    .line 72
    .line 73
    move/from16 v5, p5

    .line 74
    .line 75
    move/from16 v12, p7

    .line 76
    .line 77
    move/from16 v13, p8

    .line 78
    .line 79
    invoke-static/range {v0 .. v14}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420Rotate(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    const-string p0, " was "

    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    const-string v1, "Expected destination buffer capacity to be at least "

    .line 90
    .line 91
    invoke-static {v1, v3, p0, v0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static I420Rotate(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V
    .locals 0

    .line 95
    invoke-static/range {p0 .. p14}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420Rotate(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V

    return-void
.end method

.method public static I420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V
    .locals 16

    .line 1
    move-object/from16 v0, p6

    .line 2
    .line 3
    add-int/lit8 v1, p7, 0x1

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    add-int/lit8 v2, p8, 0x1

    .line 8
    .line 9
    div-int/lit8 v2, v2, 0x2

    .line 10
    .line 11
    mul-int v3, p7, p8

    .line 12
    .line 13
    mul-int/2addr v2, v1

    .line 14
    mul-int/lit8 v2, v2, 0x2

    .line 15
    .line 16
    add-int/2addr v2, v3

    .line 17
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-lt v4, v2, :cond_0

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v10

    .line 31
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v12

    .line 38
    mul-int/lit8 v13, v1, 0x2

    .line 39
    .line 40
    move/from16 v14, p7

    .line 41
    .line 42
    move-object/from16 v4, p0

    .line 43
    .line 44
    move/from16 v5, p1

    .line 45
    .line 46
    move-object/from16 v6, p2

    .line 47
    .line 48
    move/from16 v7, p3

    .line 49
    .line 50
    move-object/from16 v8, p4

    .line 51
    .line 52
    move/from16 v9, p5

    .line 53
    .line 54
    move/from16 v11, p7

    .line 55
    .line 56
    move/from16 v15, p8

    .line 57
    .line 58
    invoke-static/range {v4 .. v15}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const-string v1, " was "

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const-string v3, "Expected destination buffer capacity to be at least "

    .line 69
    .line 70
    invoke-static {v3, v2, v1, v0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static I420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 0

    .line 74
    invoke-static/range {p0 .. p11}, Lcom/bytedance/realx/video/YuvHelper;->nativeI420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    return-void
.end method

.method public static NV12Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;II)V
    .locals 14

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    add-int/lit8 v1, p5, 0x1

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    add-int/lit8 v2, p6, 0x1

    .line 8
    .line 9
    div-int/lit8 v2, v2, 0x2

    .line 10
    .line 11
    mul-int v3, p5, p6

    .line 12
    .line 13
    mul-int/2addr v2, v1

    .line 14
    mul-int/lit8 v2, v2, 0x2

    .line 15
    .line 16
    add-int/2addr v2, v3

    .line 17
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-lt v4, v2, :cond_0

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v10

    .line 38
    mul-int/lit8 v11, v1, 0x2

    .line 39
    .line 40
    move/from16 v12, p5

    .line 41
    .line 42
    move-object v4, p0

    .line 43
    move v5, p1

    .line 44
    move-object/from16 v6, p2

    .line 45
    .line 46
    move/from16 v7, p3

    .line 47
    .line 48
    move/from16 v9, p5

    .line 49
    .line 50
    move/from16 v13, p6

    .line 51
    .line 52
    invoke-static/range {v4 .. v13}, Lcom/bytedance/realx/video/YuvHelper;->nativeNV12Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const-string p0, " was "

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    const-string v0, "Expected destination buffer capacity to be at least "

    .line 63
    .line 64
    invoke-static {v0, v2, p0, p1}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static copyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Lcom/bytedance/realx/video/YuvHelper;->nativeCopyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeCopyPlane(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method

.method private static native nativeI420Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method

.method private static native nativeI420Rotate(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V
.end method

.method private static native nativeI420ToNV12(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method

.method private static native nativeNV12Copy(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;III)V
.end method
