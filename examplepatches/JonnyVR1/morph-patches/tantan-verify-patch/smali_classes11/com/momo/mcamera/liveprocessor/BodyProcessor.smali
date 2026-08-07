.class public Lcom/momo/mcamera/liveprocessor/BodyProcessor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/liveprocessor/IProcessor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/mcamera/liveprocessor/IProcessor<",
        "Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;",
        ">;"
    }
.end annotation


# static fields
.field private static bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;


# instance fields
.field private bodyLandmarkPostInfo:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

.field private volatile isLoadSuccess:Z

.field private volatile isLoading:Z

.field private mmFrame:Ll/umw;

.field private modelPath:Ljava/lang/String;

.field private params:Ll/lnw;


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
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoading:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoadSuccess:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/liveprocessor/BodyProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoadSuccess:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/liveprocessor/BodyProcessor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200()Lcom/momocv/bodylandmark/BodyLandmark;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/liveprocessor/BodyProcessor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoading:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;
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
    sget-object v1, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Lcom/momocv/bodylandmark/BodyLandmark;

    .line 10
    .line 11
    invoke-direct {v1}, Lcom/momocv/bodylandmark/BodyLandmark;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v1, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 15
    .line 16
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoading:Z

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoadSuccess:Z

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->modelPath:Ljava/lang/String;

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
    iput-boolean v2, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoading:Z

    .line 34
    .line 35
    new-instance v1, Ljava/lang/Thread;

    .line 36
    .line 37
    new-instance v3, Lcom/momo/mcamera/liveprocessor/BodyProcessor$1;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Lcom/momo/mcamera/liveprocessor/BodyProcessor$1;-><init>(Lcom/momo/mcamera/liveprocessor/BodyProcessor;)V

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
    iget-boolean v1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoadSuccess:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 54
    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    new-instance v0, Ll/umw;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 63
    .line 64
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 65
    .line 66
    const/16 v1, 0x11

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 72
    .line 73
    iget-object v1, p1, Ll/omw;->g:[B

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 79
    .line 80
    iget-object v1, p1, Ll/omw;->g:[B

    .line 81
    .line 82
    array-length v1, v1

    .line 83
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 96
    .line 97
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 105
    .line 106
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 114
    .line 115
    if-nez v0, :cond_5

    .line 116
    .line 117
    new-instance v0, Ll/lnw;

    .line 118
    .line 119
    const/4 v1, 0x5

    .line 120
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 124
    .line 125
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 126
    .line 127
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 133
    .line 134
    iget v1, p1, Ll/omw;->b:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 140
    .line 141
    iget p1, p1, Ll/omw;->c:I

    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ll/lnw;->z(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 147
    .line 148
    invoke-virtual {p1, v2}, Ll/lnw;->H(Z)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmarkPostInfo:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 152
    .line 153
    if-nez p1, :cond_6

    .line 154
    .line 155
    new-instance p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 156
    .line 157
    invoke-direct {p1}, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmarkPostInfo:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 161
    .line 162
    :cond_6
    sget-object p1, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 163
    .line 164
    iget-object v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->mmFrame:Ll/umw;

    .line 165
    .line 166
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iget-object v1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->params:Ll/lnw;

    .line 171
    .line 172
    invoke-virtual {v1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    check-cast v1, Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 177
    .line 178
    iget-object v2, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmarkPostInfo:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 179
    .line 180
    invoke-virtual {p1, v0, v1, v2}, Lcom/momocv/bodylandmark/BodyLandmark;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/bodylandmark/BodyLandmarkParams;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)Z

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmarkPostInfo:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 184
    .line 185
    return-object p0
.end method

.method public bridge synthetic process(Ll/omw;)Ljava/lang/Object;
    .locals 0

    .line 186
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->process(Ll/omw;)Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    move-result-object p0

    return-object p0
.end method

.method public release()V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/bodylandmark/BodyLandmark;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->bodyLandmark:Lcom/momocv/bodylandmark/BodyLandmark;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoading:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->isLoadSuccess:Z

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
    iput-object p1, p0, Lcom/momo/mcamera/liveprocessor/BodyProcessor;->modelPath:Ljava/lang/String;

    .line 17
    .line 18
    :cond_0
    return-void
.end method
