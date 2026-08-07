.class public Lcom/effectsar/labcv/effectsdk/HairParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;
    }
.end annotation


# instance fields
.field private inited:Z

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreateHandle()I
.end method

.method private native nativeGetShape([I)I
.end method

.method private native nativeInit(Ljava/lang/String;)I
.end method

.method private native nativeParse(Ljava/nio/ByteBuffer;IIIIIZ[B)I
.end method

.method private native nativeRelease()I
.end method

.method private native nativeSetParam(IIZZ)I
.end method


# virtual methods
.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/HairParser;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeCreateHandle()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p3, p4}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-direct {p0, p2}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeInit(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    :cond_1
    if-nez v0, :cond_2

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_2
    const/4 p1, 0x0

    .line 26
    :goto_0
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 27
    .line 28
    return v0

    .line 29
    :cond_3
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 2
    .line 3
    return p0
.end method

.method public parseHair(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;Z)Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;
    .locals 13

    .line 1
    new-instance v9, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;

    .line 2
    .line 3
    invoke-direct {v9, p0}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;-><init>(Lcom/effectsar/labcv/effectsdk/HairParser;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    new-array v1, v1, [I

    .line 8
    .line 9
    invoke-direct {p0, v1}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeGetShape([I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v10, 0x0

    .line 14
    const-string v11, "nativeDetect return "

    .line 15
    .line 16
    const-string v12, "bef_effect_ai"

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aget v3, v1, v2

    .line 22
    .line 23
    invoke-static {v9, v3}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$002(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;I)I

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    aget v3, v1, v3

    .line 28
    .line 29
    invoke-static {v9, v3}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$102(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;I)I

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    aget v1, v1, v3

    .line 34
    .line 35
    invoke-static {v9, v1}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$202(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;I)I

    .line 36
    .line 37
    .line 38
    invoke-static {v9}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$000(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-static {v9}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$100(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    mul-int/2addr v1, v3

    .line 47
    invoke-static {v9}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$200(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    mul-int/2addr v1, v3

    .line 52
    new-array v1, v1, [B

    .line 53
    .line 54
    invoke-static {v9, v1}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$302(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;[B)[B

    .line 55
    .line 56
    .line 57
    invoke-static {v9}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$300(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;)[B

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    move-object/from16 v1, p6

    .line 69
    .line 70
    iget v6, v1, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 71
    .line 72
    invoke-static {v9}, Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;->access$300(Lcom/effectsar/labcv/effectsdk/HairParser$HairMask;)[B

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    move-object v0, p0

    .line 77
    move-object v1, p1

    .line 78
    move/from16 v3, p3

    .line 79
    .line 80
    move/from16 v4, p4

    .line 81
    .line 82
    move/from16 v5, p5

    .line 83
    .line 84
    move/from16 v7, p7

    .line 85
    .line 86
    invoke-direct/range {v0 .. v8}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeParse(Ljava/nio/ByteBuffer;IIIIIZ[B)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v1, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    return-object v10

    .line 108
    :cond_0
    return-object v9

    .line 109
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v0, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v12, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    return-object v10
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeRelease()I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/HairParser;->inited:Z

    .line 10
    .line 11
    return-void
.end method

.method public setParam(IIZZ)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/HairParser;->nativeSetParam(IIZZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
