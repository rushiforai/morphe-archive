.class public Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Lcom/momocv/stylizeface/StylizefaceInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private mask:Lcom/momocv/stylizeface/StylizefaceInfo;

.field private mmFrame:Ll/umw;

.field private modelPath:Ljava/lang/String;

.field private params:Lcom/momocv/stylizeface/StylizefaceParams;

.field private scaleFactor:F

.field private stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->scaleFactor:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoading:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoadSuccess:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)Lcom/momocv/stylizeface/Stylizeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/momocv/stylizeface/StylizefaceInfo;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Lcom/momocv/stylizeface/Stylizeface;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/momocv/stylizeface/Stylizeface;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 15
    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoading:Z

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoadSuccess:Z

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->modelPath:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iput-boolean v2, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoading:Z

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Thread;

    .line 36
    .line 37
    new-instance v3, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {v1, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoadSuccess:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 54
    .line 55
    if-nez v1, :cond_4

    .line 56
    .line 57
    new-instance v1, Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 58
    .line 59
    invoke-direct {v1}, Lcom/momocv/stylizeface/StylizefaceInfo;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 63
    .line 64
    :cond_4
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/4 v3, 0x0

    .line 69
    if-lt v1, v2, :cond_8

    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 72
    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    new-instance v0, Lcom/momocv/stylizeface/StylizefaceParams;

    .line 76
    .line 77
    invoke-direct {v0}, Lcom/momocv/stylizeface/StylizefaceParams;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 81
    .line 82
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 83
    .line 84
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 87
    .line 88
    iget v1, p1, Ll/omw;->b:I

    .line 89
    .line 90
    iput v1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 91
    .line 92
    iget v1, p1, Ll/omw;->c:I

    .line 93
    .line 94
    iput v1, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 95
    .line 96
    iget v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->scaleFactor:F

    .line 97
    .line 98
    iput v1, v0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 99
    .line 100
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 105
    .line 106
    new-array v2, v0, [[F

    .line 107
    .line 108
    iput-object v2, v1, Lcom/momocv/stylizeface/StylizefaceParams;->orig_landmarks_222_all:[[F

    .line 109
    .line 110
    new-array v2, v0, [[F

    .line 111
    .line 112
    iput-object v2, v1, Lcom/momocv/stylizeface/StylizefaceParams;->eular_all:[[F

    .line 113
    .line 114
    :goto_0
    if-ge v3, v0, :cond_6

    .line 115
    .line 116
    invoke-virtual {p1, v3}, Ll/omw;->j(I)Ll/nuf;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/momocv/stylizeface/StylizefaceParams;->orig_landmarks_222_all:[[F

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/nuf;->q()[F

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    aput-object v4, v2, v3

    .line 129
    .line 130
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 131
    .line 132
    iget-object v2, v2, Lcom/momocv/stylizeface/StylizefaceParams;->eular_all:[[F

    .line 133
    .line 134
    invoke-virtual {v1}, Ll/nuf;->c()[F

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    aput-object v1, v2, v3

    .line 139
    .line 140
    add-int/lit8 v3, v3, 0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_6
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 144
    .line 145
    if-nez v0, :cond_7

    .line 146
    .line 147
    new-instance v0, Ll/umw;

    .line 148
    .line 149
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 153
    .line 154
    :cond_7
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 155
    .line 156
    const/16 v1, 0x11

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 162
    .line 163
    iget-object v1, p1, Ll/omw;->g:[B

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 169
    .line 170
    iget-object v1, p1, Ll/omw;->g:[B

    .line 171
    .line 172
    array-length v1, v1

    .line 173
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 177
    .line 178
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 186
    .line 187
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 195
    .line 196
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 204
    .line 205
    invoke-virtual {p1, v0}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 209
    .line 210
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mmFrame:Ll/umw;

    .line 211
    .line 212
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 217
    .line 218
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 219
    .line 220
    invoke-virtual {p1, v0, v1, v2}, Lcom/momocv/stylizeface/Stylizeface;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/stylizeface/StylizefaceParams;Lcom/momocv/stylizeface/StylizefaceInfo;)Z

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :cond_8
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 225
    .line 226
    iput-object v0, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->warp_mat_all:[[F

    .line 227
    .line 228
    iput-object v0, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 229
    .line 230
    iput v3, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 231
    .line 232
    iput v3, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 233
    .line 234
    :goto_1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 235
    .line 236
    return-object p0
.end method

.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 237
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->process(Ll/omw;)Lcom/momocv/stylizeface/StylizefaceInfo;

    move-result-object p0

    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/stylizeface/Stylizeface;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoading:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->isLoadSuccess:Z

    .line 17
    .line 18
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
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->modelPath:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setScaleFactor(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/liveprocessor/StylizeFaceProcessor;->scaleFactor:F

    .line 2
    .line 3
    return-void
.end method
