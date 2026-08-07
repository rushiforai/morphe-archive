.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public checksum:Ljava/lang/String;

.field public five_points:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public image:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->image:[B

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    invoke-static {v1, v2}, Landroid/util/Base64;->encode([BI)[B

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->image:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->checksum:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->checksum:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const/16 v2, 0xb0

    .line 34
    .line 35
    aget v1, v1, v2

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 45
    .line 46
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 47
    .line 48
    const/16 v2, 0xb1

    .line 49
    .line 50
    aget v1, v1, v2

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 62
    .line 63
    const/16 v2, 0xb2

    .line 64
    .line 65
    aget v1, v1, v2

    .line 66
    .line 67
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 75
    .line 76
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 77
    .line 78
    const/16 v2, 0xb3

    .line 79
    .line 80
    aget v1, v1, v2

    .line 81
    .line 82
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 90
    .line 91
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 92
    .line 93
    const/16 v2, 0x40

    .line 94
    .line 95
    aget v1, v1, v2

    .line 96
    .line 97
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 105
    .line 106
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 107
    .line 108
    const/16 v2, 0x41

    .line 109
    .line 110
    aget v1, v1, v2

    .line 111
    .line 112
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 120
    .line 121
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 122
    .line 123
    const/16 v2, 0x5a

    .line 124
    .line 125
    aget v1, v1, v2

    .line 126
    .line 127
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 135
    .line 136
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 137
    .line 138
    const/16 v2, 0x5b

    .line 139
    .line 140
    aget v1, v1, v2

    .line 141
    .line 142
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 150
    .line 151
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 152
    .line 153
    const/16 v2, 0x66

    .line 154
    .line 155
    aget v1, v1, v2

    .line 156
    .line 157
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;->xys:[F

    .line 167
    .line 168
    const/16 v0, 0x67

    .line 169
    .line 170
    aget p1, p1, v0

    .line 171
    .line 172
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    :cond_0
    return-void
.end method

.method private createFileWithByte(Ljava/lang/String;[B)V
    .locals 2

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_5

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_6

    .line 21
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/io/FileOutputStream;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :try_start_1
    new-instance p0, Ljava/io/BufferedOutputStream;

    .line 30
    .line 31
    invoke-direct {p0, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 32
    .line 33
    .line 34
    :try_start_2
    invoke-virtual {p0, p2}, Ljava/io/OutputStream;->write([B)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 38
    .line 39
    .line 40
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception p1

    .line 45
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :goto_1
    :try_start_4
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 49
    .line 50
    .line 51
    goto :goto_9

    .line 52
    :catchall_1
    move-exception p1

    .line 53
    goto :goto_a

    .line 54
    :catch_2
    move-exception p1

    .line 55
    goto :goto_7

    .line 56
    :catchall_2
    move-exception p0

    .line 57
    goto :goto_2

    .line 58
    :catch_3
    move-exception p0

    .line 59
    goto :goto_4

    .line 60
    :goto_2
    move-object p2, p1

    .line 61
    :goto_3
    move-object p1, v0

    .line 62
    goto :goto_b

    .line 63
    :goto_4
    move-object v1, p1

    .line 64
    move-object p1, p0

    .line 65
    move-object p0, v1

    .line 66
    goto :goto_7

    .line 67
    :goto_5
    move-object p2, p1

    .line 68
    goto :goto_b

    .line 69
    :goto_6
    move-object v0, p1

    .line 70
    move-object p1, p0

    .line 71
    move-object p0, v0

    .line 72
    :goto_7
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 73
    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    :try_start_6
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 78
    .line 79
    .line 80
    goto :goto_8

    .line 81
    :catch_4
    move-exception p1

    .line 82
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 83
    .line 84
    .line 85
    :cond_1
    :goto_8
    if-eqz p0, :cond_2

    .line 86
    .line 87
    :try_start_7
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 88
    .line 89
    .line 90
    goto :goto_9

    .line 91
    :catch_5
    move-exception p0

    .line 92
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_9
    return-void

    .line 96
    :goto_a
    move-object p2, p0

    .line 97
    move-object p0, p1

    .line 98
    goto :goto_3

    .line 99
    :goto_b
    if-eqz p1, :cond_3

    .line 100
    .line 101
    :try_start_8
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 102
    .line 103
    .line 104
    goto :goto_c

    .line 105
    :catch_6
    move-exception p1

    .line 106
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 107
    .line 108
    .line 109
    :cond_3
    :goto_c
    if-eqz p2, :cond_4

    .line 110
    .line 111
    :try_start_9
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 112
    .line 113
    .line 114
    goto :goto_d

    .line 115
    :catch_7
    move-exception p1

    .line 116
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 117
    .line 118
    .line 119
    :cond_4
    :goto_d
    throw p0
.end method
