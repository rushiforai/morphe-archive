.class public Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Lcom/momocv/segmentation/SegmentationInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private info:Lcom/momocv/segmentation/SegmentationInfo;

.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private mmFrame:Ll/umw;

.field private modelPath:Ljava/lang/String;

.field private params:Ll/lnw;

.field private segmentation:Lcom/momocv/segmentation/Segmentation;


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
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoading:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoadSuccess:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)Lcom/momocv/segmentation/Segmentation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Lcom/momocv/segmentation/Segmentation;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/momocv/segmentation/Segmentation;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 15
    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoading:Z

    .line 17
    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoadSuccess:Z

    .line 21
    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->modelPath:Ljava/lang/String;

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
    iput-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoading:Z

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Thread;

    .line 36
    .line 37
    new-instance v2, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;)V

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
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoadSuccess:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 54
    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    new-instance v0, Ll/lnw;

    .line 58
    .line 59
    const/4 v1, 0x4

    .line 60
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 64
    .line 65
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 66
    .line 67
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 73
    .line 74
    iget v1, p1, Ll/omw;->b:I

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 80
    .line 81
    iget v1, p1, Ll/omw;->c:I

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ll/lnw;->z(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 87
    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    new-instance v0, Ll/umw;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 96
    .line 97
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 98
    .line 99
    const/16 v1, 0x11

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 105
    .line 106
    iget-object v1, p1, Ll/omw;->g:[B

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 112
    .line 113
    iget-object v1, p1, Ll/omw;->g:[B

    .line 114
    .line 115
    array-length v1, v1

    .line 116
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 120
    .line 121
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 129
    .line 130
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 147
    .line 148
    if-nez v0, :cond_6

    .line 149
    .line 150
    new-instance v0, Lcom/momocv/segmentation/SegmentationInfo;

    .line 151
    .line 152
    invoke-direct {v0}, Lcom/momocv/segmentation/SegmentationInfo;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 156
    .line 157
    :cond_6
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 158
    .line 159
    iget-object v0, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 160
    .line 161
    if-eqz v0, :cond_7

    .line 162
    .line 163
    array-length v0, v0

    .line 164
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 165
    .line 166
    invoke-virtual {v1}, Ll/umw;->e()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 171
    .line 172
    invoke-virtual {v2}, Ll/umw;->c()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    mul-int/2addr v1, v2

    .line 177
    if-eq v0, v1, :cond_8

    .line 178
    .line 179
    :cond_7
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 180
    .line 181
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 182
    .line 183
    invoke-virtual {v1}, Ll/umw;->e()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 188
    .line 189
    invoke-virtual {v2}, Ll/umw;->c()I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    mul-int/2addr v1, v2

    .line 194
    new-array v1, v1, [B

    .line 195
    .line 196
    iput-object v1, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 197
    .line 198
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 199
    .line 200
    iget-object v0, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 201
    .line 202
    const/4 v1, -0x1

    .line 203
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 204
    .line 205
    .line 206
    :cond_8
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 207
    .line 208
    invoke-virtual {v0}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {p1, v0}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 216
    .line 217
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->mmFrame:Ll/umw;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->params:Ll/lnw;

    .line 224
    .line 225
    invoke-virtual {v1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    check-cast v1, Lcom/momocv/segmentation/SegmentationParams;

    .line 230
    .line 231
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 232
    .line 233
    invoke-virtual {p1, v0, v1, v2}, Lcom/momocv/segmentation/Segmentation;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/segmentation/SegmentationParams;Lcom/momocv/segmentation/SegmentationInfo;)Z

    .line 234
    .line 235
    .line 236
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 237
    .line 238
    return-object p0
.end method

.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 239
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->process(Ll/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    move-result-object p0

    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/segmentation/Segmentation;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoading:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->isLoadSuccess:Z

    .line 15
    .line 16
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
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/MomoSegmentProcessor;->modelPath:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method
