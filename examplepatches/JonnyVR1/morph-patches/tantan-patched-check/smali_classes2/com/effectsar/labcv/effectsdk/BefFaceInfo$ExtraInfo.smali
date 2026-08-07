.class public Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefFaceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtraInfo"
.end annotation


# static fields
.field public static final EYE_BROW_POINTS_NUM:I = 0xd

.field public static final EYE_IRIS_POINTS_NUM:I = 0x14

.field public static final EYE_POINTS_NUM:I = 0x16

.field public static final LIP_POINTS_NUM:I = 0x40


# instance fields
.field eye_count:I

.field eye_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field eye_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field eyebrow_count:I

.field eyebrow_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field eyebrow_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field iris_count:I

.field left_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field lips:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

.field lips_count:I

.field right_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;


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


# virtual methods
.method public getEye_left()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eye_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getEye_right()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eye_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getEyebrow_left()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eyebrow_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getEyebrow_right()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eyebrow_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getLeft_iris()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->left_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getLips()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->lips:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public getRight_iris()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->right_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    new-array p0, p0, [Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 7
    .line 8
    :cond_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ExtraInfo{eye_count="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eye_count:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", eyebrow_count="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eyebrow_count:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", lips_count="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->lips_count:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", iris_count="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->iris_count:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", eye_left="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eye_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 49
    .line 50
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, ", eye_right="

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eye_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 63
    .line 64
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, ", eyebrow_left="

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eyebrow_left:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 77
    .line 78
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, ", eyebrow_right="

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->eyebrow_right:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 91
    .line 92
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, ", lips="

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->lips:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 105
    .line 106
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ", left_iris="

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->left_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 119
    .line 120
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, ", right_iris="

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$ExtraInfo;->right_iris:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 133
    .line 134
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const/16 p0, 0x7d

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0
.end method
