.class public Ll/osx;
.super Ll/nsx;
.source "SourceFile"


# instance fields
.field private m:Ll/q210$a;


# direct methods
.method public constructor <init>(Ll/q210$a;)V
    .locals 0
    .param p1    # Ll/q210$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/nsx;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/osx;->m:Ll/q210$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Ll/g220;)I
    .locals 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    const-string v0, "init mVideoCodec"

    .line 2
    .line 3
    const-string v1, "init mAudioCodec"

    .line 4
    .line 5
    iget-object v2, p0, Ll/nsx;->i:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Ll/nsx;->f:Ll/g220;

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    iput-object p1, p0, Ll/nsx;->f:Ll/g220;

    .line 13
    .line 14
    iget v3, p0, Ll/nsx;->j:I

    .line 15
    .line 16
    invoke-interface {p1, v3}, Ll/g220;->H1(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 24
    .line 25
    const/16 v3, 0x5100

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    const/4 v5, 0x0

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 32
    .line 33
    if-nez p1, :cond_3

    .line 34
    .line 35
    new-instance p1, Ll/zrx;

    .line 36
    .line 37
    iget-object v6, p0, Ll/nsx;->f:Ll/g220;

    .line 38
    .line 39
    invoke-direct {p1, v6}, Ll/zrx;-><init>(Ll/g220;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 43
    .line 44
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v6, "Pipeline_Normal_pip->PIPLINE"

    .line 49
    .line 50
    new-instance v7, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/nsx;->e:Ll/zrx;

    .line 56
    .line 57
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p1, v6, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 68
    .line 69
    iget-object v1, p0, Ll/nsx;->h:Landroid/media/MediaFormat;

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Ll/zrx;->e(Landroid/media/MediaFormat;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Ll/nsx;->e:Ll/zrx;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/zrx;->k()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    iput-object v5, p0, Ll/nsx;->d:Ll/zrx;

    .line 84
    .line 85
    iget-object p0, p0, Ll/osx;->m:Ll/q210$a;

    .line 86
    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    const/4 p1, 0x1

    .line 90
    invoke-interface {p0, v3, p1, v4, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :cond_2
    const/4 p0, 0x5

    .line 94
    monitor-exit v2

    .line 95
    return p0

    .line 96
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 97
    .line 98
    if-eqz p1, :cond_6

    .line 99
    .line 100
    iget-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 101
    .line 102
    if-nez p1, :cond_6

    .line 103
    .line 104
    new-instance p1, Ll/zrx;

    .line 105
    .line 106
    iget-object v1, p0, Ll/nsx;->f:Ll/g220;

    .line 107
    .line 108
    invoke-direct {p1, v1}, Ll/zrx;-><init>(Ll/g220;)V

    .line 109
    .line 110
    .line 111
    iput-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 112
    .line 113
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 118
    .line 119
    new-instance v6, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/nsx;->d:Ll/zrx;

    .line 125
    .line 126
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Ll/nsx;->d:Ll/zrx;

    .line 137
    .line 138
    iget-object v0, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Ll/zrx;->e(Landroid/media/MediaFormat;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    iget-object p1, p0, Ll/nsx;->g:Landroid/media/MediaFormat;

    .line 147
    .line 148
    const-string v0, "color-format"

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    const/16 v0, 0x13

    .line 155
    .line 156
    if-ne p1, v0, :cond_6

    .line 157
    .line 158
    iget-object p0, p0, Ll/nsx;->d:Ll/zrx;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/zrx;->k()V

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_4
    iget-object p1, p0, Ll/osx;->m:Ll/q210$a;

    .line 165
    .line 166
    if-eqz p1, :cond_5

    .line 167
    .line 168
    const/4 v0, 0x2

    .line 169
    invoke-interface {p1, v3, v0, v4, v5}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    :cond_5
    iput-object v5, p0, Ll/nsx;->d:Ll/zrx;

    .line 173
    .line 174
    const/4 p0, 0x4

    .line 175
    monitor-exit v2

    .line 176
    return p0

    .line 177
    :cond_6
    :goto_2
    monitor-exit v2

    .line 178
    return v4

    .line 179
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    throw p0
.end method
