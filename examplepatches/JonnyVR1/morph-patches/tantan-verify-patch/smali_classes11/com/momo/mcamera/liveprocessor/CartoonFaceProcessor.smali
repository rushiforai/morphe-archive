.class public Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Lcom/momocv/cartoonface/CartoonfaceInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

.field private mmFrame:Ll/umw;

.field private modelPath:Ljava/lang/String;

.field private params:Lcom/momocv/cartoonface/CartoonfaceParams;

.field private scaleFactor:F


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
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoading:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoadSuccess:Z

    .line 8
    .line 9
    const/high16 v0, -0x40800000    # -1.0f

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->scaleFactor:F

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;)Lcom/momocv/cartoonface/Cartoonface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/momocv/cartoonface/CartoonfaceInfo;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Lcom/momocv/cartoonface/Cartoonface;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/momocv/cartoonface/Cartoonface;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 15
    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoading:Z

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoadSuccess:Z

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->modelPath:Ljava/lang/String;

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
    iput-boolean v2, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoading:Z

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Thread;

    .line 36
    .line 37
    new-instance v3, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor$1;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;)V

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
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoadSuccess:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 54
    .line 55
    if-nez v1, :cond_4

    .line 56
    .line 57
    new-instance v1, Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 58
    .line 59
    invoke-direct {v1}, Lcom/momocv/cartoonface/CartoonfaceInfo;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

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
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 72
    .line 73
    if-nez v0, :cond_5

    .line 74
    .line 75
    new-instance v0, Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 76
    .line 77
    invoke-direct {v0}, Lcom/momocv/cartoonface/CartoonfaceParams;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 81
    .line 82
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

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
    iget v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->scaleFactor:F

    .line 97
    .line 98
    iput v1, v0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 99
    .line 100
    invoke-virtual {p1, v3}, Ll/omw;->j(I)Ll/nuf;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    if-eqz v0, :cond_6

    .line 105
    .line 106
    invoke-virtual {p1, v3}, Ll/omw;->j(I)Ll/nuf;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/nuf;->q()[F

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iput-object v2, v1, Lcom/momocv/cartoonface/CartoonfaceParams;->orig_landmarks_222_:[F

    .line 117
    .line 118
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/nuf;->c()[F

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, v1, Lcom/momocv/cartoonface/CartoonfaceParams;->eular:[F

    .line 125
    .line 126
    :cond_6
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 127
    .line 128
    if-nez v0, :cond_7

    .line 129
    .line 130
    new-instance v0, Ll/umw;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 136
    .line 137
    :cond_7
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 138
    .line 139
    const/16 v1, 0x11

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 145
    .line 146
    iget-object v1, p1, Ll/omw;->g:[B

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 152
    .line 153
    iget-object v1, p1, Ll/omw;->g:[B

    .line 154
    .line 155
    array-length v1, v1

    .line 156
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 160
    .line 161
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 169
    .line 170
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 178
    .line 179
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 187
    .line 188
    invoke-virtual {p1, v0}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 192
    .line 193
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mmFrame:Ll/umw;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 200
    .line 201
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 202
    .line 203
    invoke-virtual {p1, v0, v1, v2}, Lcom/momocv/cartoonface/Cartoonface;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/cartoonface/CartoonfaceParams;Lcom/momocv/cartoonface/CartoonfaceInfo;)Z

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_8
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 208
    .line 209
    iput-object v0, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 210
    .line 211
    iput-object v0, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 212
    .line 213
    iput v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 214
    .line 215
    iput v3, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 216
    .line 217
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 218
    .line 219
    return-object p0
.end method

.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 220
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->process(Ll/omw;)Lcom/momocv/cartoonface/CartoonfaceInfo;

    move-result-object p0

    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/cartoonface/Cartoonface;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoading:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->isLoadSuccess:Z

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
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->modelPath:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setScaleFactor(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/liveprocessor/CartoonFaceProcessor;->scaleFactor:F

    .line 2
    .line 3
    return-void
.end method
