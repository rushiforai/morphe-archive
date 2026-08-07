.class public Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Ll/evf;",
        ">;"
    }
.end annotation


# instance fields
.field private faceProcessType:I

.field private faceRigPath:Ljava/lang/String;

.field private faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private mmFrame:Ll/umw;

.field private params:Lcom/momocv/facerigv3/FacerigV3Params;

.field private singleFaceRigInfo:Ll/evf;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoading:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoadSuccess:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceProcessType:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;)Lcom/momocv/facerigv3/FaceRigV3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 250
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->process(Ll/omw;)Ll/evf;

    move-result-object p0

    return-object p0
.end method

.method public process(Ll/omw;)Ll/evf;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Lcom/momocv/facerigv3/FaceRigV3;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/momocv/facerigv3/FaceRigV3;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 15
    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoading:Z

    .line 17
    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoadSuccess:Z

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigPath:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    iput-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoading:Z

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Thread;

    .line 36
    .line 37
    new-instance v2, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor$1;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoadSuccess:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 54
    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    new-instance v0, Lcom/momocv/facerigv3/FacerigV3Params;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/momocv/facerigv3/FacerigV3Params;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 63
    .line 64
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 65
    .line 66
    iget v1, p1, Ll/omw;->b:I

    .line 67
    .line 68
    iput v1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 69
    .line 70
    iget v1, p1, Ll/omw;->c:I

    .line 71
    .line 72
    iput v1, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 73
    .line 74
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 75
    .line 76
    iput-boolean v1, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 79
    .line 80
    if-nez v0, :cond_5

    .line 81
    .line 82
    new-instance v0, Ll/umw;

    .line 83
    .line 84
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 88
    .line 89
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 90
    .line 91
    const/16 v1, 0x11

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 97
    .line 98
    iget-object v1, p1, Ll/omw;->g:[B

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 104
    .line 105
    iget-object v1, p1, Ll/omw;->g:[B

    .line 106
    .line 107
    array-length v1, v1

    .line 108
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 121
    .line 122
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->singleFaceRigInfo:Ll/evf;

    .line 139
    .line 140
    if-nez v0, :cond_6

    .line 141
    .line 142
    new-instance v0, Ll/evf;

    .line 143
    .line 144
    invoke-direct {v0}, Ll/evf;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->singleFaceRigInfo:Ll/evf;

    .line 148
    .line 149
    :cond_6
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->singleFaceRigInfo:Ll/evf;

    .line 150
    .line 151
    iget-object v1, p1, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ll/evf;->c(Lcom/momocv/videoprocessor/VideoInfo;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p1, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 159
    .line 160
    if-eqz v0, :cond_9

    .line 161
    .line 162
    array-length v1, v0

    .line 163
    if-lez v1, :cond_9

    .line 164
    .line 165
    const/4 v1, 0x0

    .line 166
    aget-object v0, v0, v1

    .line 167
    .line 168
    iget-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 169
    .line 170
    if-eqz v1, :cond_9

    .line 171
    .line 172
    array-length v2, v1

    .line 173
    if-lez v2, :cond_9

    .line 174
    .line 175
    iget-object v2, v0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 176
    .line 177
    if-eqz v2, :cond_9

    .line 178
    .line 179
    array-length v2, v2

    .line 180
    const/4 v3, 0x2

    .line 181
    if-le v2, v3, :cond_9

    .line 182
    .line 183
    iget-boolean v2, p1, Ll/omw;->a:Z

    .line 184
    .line 185
    if-eqz v2, :cond_7

    .line 186
    .line 187
    const/16 v2, 0x5a

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_7
    const/16 v2, 0x10e

    .line 191
    .line 192
    :goto_0
    iget v3, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceProcessType:I

    .line 193
    .line 194
    if-nez v3, :cond_8

    .line 195
    .line 196
    iget-object v3, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 197
    .line 198
    iget-boolean v3, v3, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 199
    .line 200
    iget-object v4, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 201
    .line 202
    invoke-virtual {v4}, Ll/umw;->e()I

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    iget-object v5, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 207
    .line 208
    invoke-virtual {v5}, Ll/umw;->c()I

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    iget v6, p1, Ll/omw;->A:F

    .line 213
    .line 214
    invoke-static/range {v1 .. v6}, Lcom/momo/mcamera/liveprocessor/ByteDanceToMMPointUtils;->transBytePoint96ToOriginal96([FIZIIF)[F

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iput-object p1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 219
    .line 220
    :cond_8
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 221
    .line 222
    iget-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 223
    .line 224
    iput-object v1, p1, Lcom/momocv/facerigv3/FacerigV3Params;->orig_landmarks_96_:[F

    .line 225
    .line 226
    iget-object v0, v0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 227
    .line 228
    iput-object v0, p1, Lcom/momocv/facerigv3/FacerigV3Params;->face_processor_eulers_:[F

    .line 229
    .line 230
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 231
    .line 232
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->mmFrame:Ll/umw;

    .line 233
    .line 234
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 239
    .line 240
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->singleFaceRigInfo:Ll/evf;

    .line 241
    .line 242
    iget-object v2, v2, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 243
    .line 244
    invoke-virtual {p1, v0, v1, v2}, Lcom/momocv/facerigv3/FaceRigV3;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/facerigv3/FacerigV3Params;Lcom/momocv/facerigv3/FacerigV3Info;)Z

    .line 245
    .line 246
    .line 247
    :cond_9
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->singleFaceRigInfo:Ll/evf;

    .line 248
    .line 249
    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/facerigv3/FaceRigV3;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigV3:Lcom/momocv/facerigv3/FaceRigV3;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoading:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->isLoadSuccess:Z

    .line 15
    .line 16
    return-void
.end method

.method public setFaceProcessType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceProcessType:I

    .line 2
    .line 3
    return-void
.end method

.method public setModelPath(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/lang/String;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/AnimojiProcessor;->faceRigPath:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method
