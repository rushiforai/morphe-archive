.class public Ll/rsy;
.super Ll/ogk;
.source "SourceFile"


# instance fields
.field private a:Lproject/android/imageprocessing/ext/a;

.field private b:Lproject/android/imageprocessing/ext/a;

.field private c:Lproject/android/imageprocessing/ext/a;

.field private d:Ll/hd2;

.field private e:Ll/hd2;

.field private f:Ll/x120;

.field private g:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/l6x;",
            ">;"
        }
    .end annotation
.end field

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/zej;",
            ">;"
        }
    .end annotation
.end field

.field l:F

.field m:F

.field private n:Z

.field private o:I

.field p:Z

.field private q:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ROOT"

    .line 5
    .line 6
    iput-object v0, p0, Ll/rsy;->g:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/rsy;->i:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 16
    .line 17
    new-instance v1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Ll/rsy;->n:Z

    .line 26
    .line 27
    iput v1, p0, Ll/rsy;->o:I

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/rsy;->p:Z

    .line 30
    .line 31
    iput-boolean v1, p0, Ll/rsy;->q:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Ll/gfj;->useCache:Z

    .line 34
    .line 35
    new-instance v2, Lproject/android/imageprocessing/ext/a;

    .line 36
    .line 37
    invoke-direct {v2}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 41
    .line 42
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 43
    .line 44
    const-string v3, "mDefaultCutFilter"

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Lproject/android/imageprocessing/ext/a;->V1(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Lproject/android/imageprocessing/ext/a;

    .line 50
    .line 51
    invoke-direct {v2}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v2, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 55
    .line 56
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 57
    .line 58
    const-string v3, "mCutFilter"

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Lproject/android/imageprocessing/ext/a;->V1(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Lproject/android/imageprocessing/ext/a;

    .line 64
    .line 65
    invoke-direct {v2}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 69
    .line 70
    const-string v3, "mAgoraCutFilter"

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Lproject/android/imageprocessing/ext/a;->V1(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 76
    .line 77
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 78
    .line 79
    new-instance v2, Ll/hd2;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/hd2;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object v2, p0, Ll/rsy;->d:Ll/hd2;

    .line 85
    .line 86
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 87
    .line 88
    new-instance v2, Ll/hd2;

    .line 89
    .line 90
    invoke-direct {v2}, Ll/hd2;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v2, p0, Ll/rsy;->e:Ll/hd2;

    .line 94
    .line 95
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 96
    .line 97
    iget-object v2, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 103
    .line 104
    invoke-virtual {p0, v2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 108
    .line 109
    invoke-virtual {p0, v2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Ll/rsy;->e:Ll/hd2;

    .line 113
    .line 114
    invoke-virtual {p0, v2}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 118
    .line 119
    iget-object v3, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 122
    .line 123
    .line 124
    new-instance v2, Ll/x120;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/x120;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v2, p0, Ll/rsy;->f:Ll/x120;

    .line 130
    .line 131
    iput-boolean v1, v2, Ll/gfj;->useCache:Z

    .line 132
    .line 133
    iget-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 139
    .line 140
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 146
    .line 147
    iget-object v2, p0, Ll/rsy;->e:Ll/hd2;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 153
    .line 154
    invoke-virtual {p0, v1}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 155
    .line 156
    .line 157
    iget-object v1, p0, Ll/rsy;->d:Ll/hd2;

    .line 158
    .line 159
    invoke-virtual {p0, v1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 163
    .line 164
    iget-object v2, p0, Ll/rsy;->d:Ll/hd2;

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Ll/rsy;->d:Ll/hd2;

    .line 170
    .line 171
    invoke-virtual {v1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 172
    .line 173
    .line 174
    new-instance v1, Ll/ehq0;

    .line 175
    .line 176
    invoke-direct {v1}, Ll/ehq0;-><init>()V

    .line 177
    .line 178
    .line 179
    const/high16 v2, 0x3f000000    # 0.5f

    .line 180
    .line 181
    iput v2, v1, Ll/ehq0;->e:F

    .line 182
    .line 183
    iput v2, v1, Ll/ehq0;->f:F

    .line 184
    .line 185
    iput v2, v1, Ll/ehq0;->c:F

    .line 186
    .line 187
    iput v2, v1, Ll/ehq0;->d:F

    .line 188
    .line 189
    const/4 v2, 0x0

    .line 190
    iput v2, v1, Ll/ehq0;->g:F

    .line 191
    .line 192
    new-instance v2, Ll/l6x;

    .line 193
    .line 194
    iget-object v3, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 195
    .line 196
    invoke-direct {v2, v1, v3}, Ll/l6x;-><init>(Ll/ehq0;Ll/gfj;)V

    .line 197
    .line 198
    .line 199
    iget-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 200
    .line 201
    iput-object v1, v2, Ll/l6x;->j:Ll/gfj;

    .line 202
    .line 203
    iget-object v1, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 204
    .line 205
    iput-object v1, v2, Ll/l6x;->k:Ll/gfj;

    .line 206
    .line 207
    iget-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 208
    .line 209
    invoke-virtual {v1, v2}, Ll/x120;->X1(Ll/l6x;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 213
    .line 214
    invoke-virtual {p0, v0, v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1(Ll/dfj;)V
    .locals 5

    .line 1
    const-string v0, "addCameraTarget  mAgoraCutFilter  width:"

    .line 2
    .line 3
    const-string v1, "addCameraTarget  target:"

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    instance-of v2, p1, Ll/zej;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Ll/rsy;->k:Ljava/util/List;

    .line 11
    .line 12
    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    :try_start_1
    iget-object v3, p0, Ll/rsy;->k:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    iget-object v3, p0, Ll/rsy;->k:Ljava/util/List;

    .line 22
    .line 23
    move-object v4, p1

    .line 24
    check-cast v4, Ll/zej;

    .line 25
    .line 26
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit v2

    .line 33
    goto :goto_2

    .line 34
    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :try_start_2
    throw p1

    .line 36
    :catchall_1
    move-exception p1

    .line 37
    goto/16 :goto_4

    .line 38
    .line 39
    :cond_1
    :goto_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v2, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    instance-of v1, p1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    move-object v1, p1

    .line 71
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    const/4 v2, 0x1

    .line 78
    if-eq v1, v2, :cond_2

    .line 79
    .line 80
    move-object v1, p1

    .line 81
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/4 v2, 0x2

    .line 88
    if-eq v1, v2, :cond_2

    .line 89
    .line 90
    move-object v1, p1

    .line 91
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const/4 v2, 0x3

    .line 98
    if-ne v1, v2, :cond_3

    .line 99
    .line 100
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    move-object v0, p1

    .line 110
    check-cast v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 111
    .line 112
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget v0, v0, Ll/tow;->m:I

    .line 121
    .line 122
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v0, ", height:"

    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    move-object v0, p1

    .line 131
    check-cast v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 132
    .line 133
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget v0, v0, Ll/tow;->n:I

    .line 142
    .line 143
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 158
    .line 159
    move-object v1, p1

    .line 160
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 161
    .line 162
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget v1, v1, Ll/tow;->m:I

    .line 171
    .line 172
    move-object v2, p1

    .line 173
    check-cast v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 174
    .line 175
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    iget v2, v2, Ll/tow;->n:I

    .line 184
    .line 185
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 189
    .line 190
    invoke-virtual {v0}, Ll/wej;->reInitialize()V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/rsy;->e:Ll/hd2;

    .line 194
    .line 195
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Ll/rsy;->e:Ll/hd2;

    .line 199
    .line 200
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 201
    .line 202
    .line 203
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    move-object v1, p1

    .line 208
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 209
    .line 210
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    iget v1, v1, Ll/tow;->m:I

    .line 219
    .line 220
    check-cast p1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 221
    .line 222
    invoke-interface {p1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iget p1, p1, Ll/tow;->n:I

    .line 231
    .line 232
    invoke-virtual {v0, v1, p1}, Ll/u6y;->U(II)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 236
    .line 237
    iget-object v0, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 238
    .line 239
    invoke-virtual {p1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 243
    .line 244
    iget-object v0, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 247
    .line 248
    .line 249
    goto :goto_3

    .line 250
    :cond_3
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 251
    .line 252
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 256
    .line 257
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 258
    .line 259
    .line 260
    :cond_4
    :goto_3
    monitor-exit p0

    .line 261
    return-void

    .line 262
    :goto_4
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 263
    throw p1
.end method

.method public R1(Ll/gfj;Ljava/lang/String;Ll/g510;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "addInputRender:"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, "key"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    invoke-virtual {p1, p2}, Ll/gfj;->setFilterKey(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Lproject/android/imageprocessing/ext/a;

    .line 49
    .line 50
    invoke-direct {v1}, Lproject/android/imageprocessing/ext/a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 54
    .line 55
    .line 56
    new-instance v2, Ll/ehq0;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/ehq0;-><init>()V

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/util/AbstractMap;->values()Ljava/util/Collection;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_1

    .line 76
    .line 77
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Ll/l6x;

    .line 82
    .line 83
    iget-object v4, v4, Ll/l6x;->j:Ll/gfj;

    .line 84
    .line 85
    if-ne v4, p1, :cond_0

    .line 86
    .line 87
    const/4 v3, 0x1

    .line 88
    goto :goto_0

    .line 89
    :catchall_0
    move-exception p0

    .line 90
    goto :goto_1

    .line 91
    :cond_1
    const/4 v3, 0x0

    .line 92
    :goto_0
    new-instance v4, Ll/l6x;

    .line 93
    .line 94
    invoke-direct {v4, v2, p1}, Ll/l6x;-><init>(Ll/ehq0;Ll/gfj;)V

    .line 95
    .line 96
    .line 97
    iput-object p1, v4, Ll/l6x;->j:Ll/gfj;

    .line 98
    .line 99
    iput-object v1, v4, Ll/l6x;->k:Ll/gfj;

    .line 100
    .line 101
    iget-object p0, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 102
    .line 103
    invoke-virtual {p0, p2, v4}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    if-nez v3, :cond_2

    .line 107
    .line 108
    invoke-virtual {p3}, Ll/g510;->u()V

    .line 109
    .line 110
    .line 111
    const/4 p0, 0x0

    .line 112
    invoke-virtual {p3, p0}, Ll/g510;->N(Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    monitor-exit v0

    .line 116
    return-void

    .line 117
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    throw p0
.end method

.method public S1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;Z)V
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "changeRenderSize:width"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v2, p2, Ll/tow;->u:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "height"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p2, Ll/tow;->t:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p3, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p3, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 37
    .line 38
    if-eqz p3, :cond_7

    .line 39
    .line 40
    iget p3, p2, Ll/tow;->u:I

    .line 41
    .line 42
    int-to-float p3, p3

    .line 43
    iput p3, p0, Ll/rsy;->l:F

    .line 44
    .line 45
    iget p3, p2, Ll/tow;->v:I

    .line 46
    .line 47
    int-to-float p3, p3

    .line 48
    iput p3, p0, Ll/rsy;->m:F

    .line 49
    .line 50
    iget-boolean p3, p0, Ll/rsy;->q:Z

    .line 51
    .line 52
    iput-boolean p3, p2, Ll/uow;->F0:Z

    .line 53
    .line 54
    iget-object p3, p0, Ll/rsy;->f:Ll/x120;

    .line 55
    .line 56
    invoke-virtual {p3}, Ll/x120;->T1()Ll/l6x;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iget-boolean v0, p0, Ll/rsy;->q:Z

    .line 61
    .line 62
    iget-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 63
    .line 64
    if-eqz v0, :cond_0

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    invoke-virtual {v1, v0}, Ll/x120;->W1(I)V

    .line 68
    .line 69
    .line 70
    iget-object p3, p3, Ll/l6x;->k:Ll/gfj;

    .line 71
    .line 72
    iget v0, p2, Ll/tow;->v:I

    .line 73
    .line 74
    iget v1, p2, Ll/tow;->u:I

    .line 75
    .line 76
    invoke-virtual {p3, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 77
    .line 78
    .line 79
    iget-object p3, p0, Ll/rsy;->f:Ll/x120;

    .line 80
    .line 81
    iget v0, p2, Ll/tow;->v:I

    .line 82
    .line 83
    iget v1, p2, Ll/tow;->u:I

    .line 84
    .line 85
    invoke-virtual {p3, v0, v1}, Ll/x120;->setRenderSize(II)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    const/4 v0, 0x0

    .line 90
    invoke-virtual {v1, v0}, Ll/x120;->W1(I)V

    .line 91
    .line 92
    .line 93
    iget-object p3, p3, Ll/l6x;->k:Ll/gfj;

    .line 94
    .line 95
    iget v0, p2, Ll/tow;->u:I

    .line 96
    .line 97
    iget v1, p2, Ll/tow;->v:I

    .line 98
    .line 99
    invoke-virtual {p3, v0, v1}, Ll/wej;->setRenderSize(II)V

    .line 100
    .line 101
    .line 102
    iget-object p3, p0, Ll/rsy;->f:Ll/x120;

    .line 103
    .line 104
    iget v0, p2, Ll/tow;->u:I

    .line 105
    .line 106
    iget v1, p2, Ll/tow;->v:I

    .line 107
    .line 108
    invoke-virtual {p3, v0, v1}, Ll/x120;->setRenderSize(II)V

    .line 109
    .line 110
    .line 111
    :goto_0
    iget-object p3, p0, Ll/rsy;->f:Ll/x120;

    .line 112
    .line 113
    invoke-virtual {p3}, Ll/wej;->reInitialize()V

    .line 114
    .line 115
    .line 116
    iget-object p3, p0, Ll/rsy;->k:Ljava/util/List;

    .line 117
    .line 118
    monitor-enter p3

    .line 119
    :try_start_0
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_6

    .line 130
    .line 131
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Ll/zej;

    .line 136
    .line 137
    iget v2, p0, Ll/rsy;->l:F

    .line 138
    .line 139
    float-to-int v2, v2

    .line 140
    iget v3, p0, Ll/rsy;->m:F

    .line 141
    .line 142
    float-to-int v3, v3

    .line 143
    invoke-virtual {v1, v2, v3}, Ll/zej;->setRenderSize(II)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Ll/wej;->reInitialize()V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 150
    .line 151
    if-eqz v2, :cond_5

    .line 152
    .line 153
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    const-string v4, "changeRenderSize mAgoraCutFilter landmode"

    .line 163
    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-boolean v4, p0, Ll/rsy;->q:Z

    .line 168
    .line 169
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v4, ", width:"

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget v4, p2, Ll/tow;->m:I

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v4, ", height:"

    .line 183
    .line 184
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget v4, p2, Ll/tow;->n:I

    .line 188
    .line 189
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    invoke-virtual {v2, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    iget-boolean v2, p0, Ll/rsy;->q:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 204
    .line 205
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 206
    .line 207
    if-eqz v2, :cond_2

    .line 208
    .line 209
    :try_start_1
    iget v2, p2, Ll/tow;->m:I

    .line 210
    .line 211
    iget v4, p2, Ll/tow;->n:I

    .line 212
    .line 213
    invoke-virtual {v3, v2, v4}, Ll/wej;->setRenderSize(II)V

    .line 214
    .line 215
    .line 216
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 217
    .line 218
    invoke-virtual {v2}, Ll/wej;->resetClockDegrees()V

    .line 219
    .line 220
    .line 221
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 222
    .line 223
    const/4 v3, 0x3

    .line 224
    invoke-virtual {v2, v3}, Ll/wej;->rotateCounterClockwise90Degrees(I)V

    .line 225
    .line 226
    .line 227
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 228
    .line 229
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :catchall_0
    move-exception p0

    .line 234
    goto :goto_3

    .line 235
    :cond_2
    iget v2, p2, Ll/tow;->m:I

    .line 236
    .line 237
    iget v4, p2, Ll/tow;->n:I

    .line 238
    .line 239
    invoke-virtual {v3, v2, v4}, Ll/wej;->setRenderSize(II)V

    .line 240
    .line 241
    .line 242
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 243
    .line 244
    invoke-virtual {v2}, Ll/wej;->resetClockDegrees()V

    .line 245
    .line 246
    .line 247
    iget-object v2, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 248
    .line 249
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 250
    .line 251
    .line 252
    :goto_2
    iget-object v2, p0, Ll/rsy;->d:Ll/hd2;

    .line 253
    .line 254
    if-eqz v2, :cond_3

    .line 255
    .line 256
    iget v3, p2, Ll/tow;->m:I

    .line 257
    .line 258
    iget v4, p2, Ll/tow;->n:I

    .line 259
    .line 260
    invoke-virtual {v2, v3, v4}, Ll/hd2;->S1(II)V

    .line 261
    .line 262
    .line 263
    :cond_3
    iget-object v2, p0, Ll/rsy;->e:Ll/hd2;

    .line 264
    .line 265
    if-eqz v2, :cond_4

    .line 266
    .line 267
    iget v3, p2, Ll/tow;->m:I

    .line 268
    .line 269
    iget v4, p2, Ll/tow;->n:I

    .line 270
    .line 271
    invoke-virtual {v2, v3, v4}, Ll/hd2;->S1(II)V

    .line 272
    .line 273
    .line 274
    :cond_4
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    iget v3, p2, Ll/tow;->m:I

    .line 279
    .line 280
    iget v4, p2, Ll/tow;->n:I

    .line 281
    .line 282
    invoke-virtual {v2, v3, v4}, Ll/u6y;->U(II)V

    .line 283
    .line 284
    .line 285
    :cond_5
    instance-of v2, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 286
    .line 287
    if-eqz v2, :cond_1

    .line 288
    .line 289
    const-string v2, "zk"

    .line 290
    .line 291
    new-instance v3, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    const-string v4, "resetCodecmRenderWidth"

    .line 297
    .line 298
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    iget v4, p0, Ll/rsy;->l:F

    .line 302
    .line 303
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    const-string v4, "/mRenderHeight"

    .line 307
    .line 308
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    iget v4, p0, Ll/rsy;->m:F

    .line 312
    .line 313
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    check-cast v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 324
    .line 325
    invoke-interface {p1, v1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->b0(Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_1

    .line 329
    .line 330
    :cond_6
    monitor-exit p3

    .line 331
    return-void

    .line 332
    :goto_3
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 333
    throw p0

    .line 334
    :cond_7
    return-void
.end method

.method public T1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "changeRenderSize:width"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v3, p2, Ll/tow;->u:I

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v3, "height"

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v3, p2, Ll/tow;->t:I

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 37
    .line 38
    if-eqz v0, :cond_8

    .line 39
    .line 40
    iget-boolean v0, p0, Ll/rsy;->q:Z

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget v1, p2, Ll/tow;->u:I

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    iput v1, p0, Ll/rsy;->l:F

    .line 48
    .line 49
    iget v1, p2, Ll/tow;->v:I

    .line 50
    .line 51
    int-to-float v1, v1

    .line 52
    iput v1, p0, Ll/rsy;->m:F

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget v1, p2, Ll/tow;->v:I

    .line 56
    .line 57
    int-to-float v1, v1

    .line 58
    iput v1, p0, Ll/rsy;->l:F

    .line 59
    .line 60
    iget v1, p2, Ll/tow;->u:I

    .line 61
    .line 62
    int-to-float v1, v1

    .line 63
    iput v1, p0, Ll/rsy;->m:F

    .line 64
    .line 65
    :goto_0
    iput-boolean v0, p2, Ll/uow;->F0:Z

    .line 66
    .line 67
    iget-object v0, p0, Ll/rsy;->f:Ll/x120;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/x120;->T1()Ll/l6x;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-boolean v1, p0, Ll/rsy;->q:Z

    .line 74
    .line 75
    iget-object v2, p0, Ll/rsy;->f:Ll/x120;

    .line 76
    .line 77
    if-eqz v1, :cond_1

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    invoke-virtual {v2, v1}, Ll/x120;->W1(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, v0, Ll/l6x;->k:Ll/gfj;

    .line 84
    .line 85
    iget v1, p2, Ll/tow;->u:I

    .line 86
    .line 87
    iget v2, p2, Ll/tow;->v:I

    .line 88
    .line 89
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Ll/rsy;->f:Ll/x120;

    .line 93
    .line 94
    iget v1, p2, Ll/tow;->u:I

    .line 95
    .line 96
    iget v2, p2, Ll/tow;->v:I

    .line 97
    .line 98
    invoke-virtual {v0, v1, v2}, Ll/x120;->setRenderSize(II)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_1
    const/4 v1, 0x0

    .line 103
    invoke-virtual {v2, v1}, Ll/x120;->W1(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, v0, Ll/l6x;->k:Ll/gfj;

    .line 107
    .line 108
    iget v1, p2, Ll/tow;->u:I

    .line 109
    .line 110
    iget v2, p2, Ll/tow;->v:I

    .line 111
    .line 112
    invoke-virtual {v0, v1, v2}, Ll/wej;->setRenderSize(II)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/rsy;->f:Ll/x120;

    .line 116
    .line 117
    iget v1, p2, Ll/tow;->u:I

    .line 118
    .line 119
    iget v2, p2, Ll/tow;->v:I

    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Ll/x120;->setRenderSize(II)V

    .line 122
    .line 123
    .line 124
    :goto_1
    iget-object v0, p0, Ll/rsy;->f:Ll/x120;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/wej;->reInitialize()V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 130
    .line 131
    monitor-enter v0

    .line 132
    :try_start_0
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    if-eqz v2, :cond_7

    .line 143
    .line 144
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Ll/zej;

    .line 149
    .line 150
    iget v3, p0, Ll/rsy;->l:F

    .line 151
    .line 152
    float-to-int v3, v3

    .line 153
    iget v4, p0, Ll/rsy;->m:F

    .line 154
    .line 155
    float-to-int v4, v4

    .line 156
    invoke-virtual {v2, v3, v4}, Ll/zej;->setRenderSize(II)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 160
    .line 161
    .line 162
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 163
    .line 164
    if-eqz v3, :cond_6

    .line 165
    .line 166
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    new-instance v4, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    const-string v5, "changeRenderSize mAgoraCutFilter landmode"

    .line 176
    .line 177
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-boolean v5, p0, Ll/rsy;->q:Z

    .line 181
    .line 182
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v5, ", width:"

    .line 186
    .line 187
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget v5, p2, Ll/tow;->m:I

    .line 191
    .line 192
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v5, ", height:"

    .line 196
    .line 197
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    iget v5, p2, Ll/tow;->n:I

    .line 201
    .line 202
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v3, v4}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    iget-boolean v3, p0, Ll/rsy;->q:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    .line 218
    iget-object v4, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 219
    .line 220
    if-eqz v3, :cond_3

    .line 221
    .line 222
    :try_start_1
    iget v3, p2, Ll/tow;->m:I

    .line 223
    .line 224
    iget v5, p2, Ll/tow;->n:I

    .line 225
    .line 226
    invoke-virtual {v4, v3, v5}, Ll/wej;->setRenderSize(II)V

    .line 227
    .line 228
    .line 229
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 230
    .line 231
    invoke-virtual {v3}, Ll/wej;->resetClockDegrees()V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 235
    .line 236
    const/4 v4, 0x3

    .line 237
    invoke-virtual {v3, v4}, Ll/wej;->rotateCounterClockwise90Degrees(I)V

    .line 238
    .line 239
    .line 240
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 241
    .line 242
    invoke-virtual {v3}, Ll/wej;->reInitialize()V

    .line 243
    .line 244
    .line 245
    goto :goto_3

    .line 246
    :catchall_0
    move-exception p0

    .line 247
    goto :goto_4

    .line 248
    :cond_3
    iget v3, p2, Ll/tow;->m:I

    .line 249
    .line 250
    iget v5, p2, Ll/tow;->n:I

    .line 251
    .line 252
    invoke-virtual {v4, v3, v5}, Ll/wej;->setRenderSize(II)V

    .line 253
    .line 254
    .line 255
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 256
    .line 257
    invoke-virtual {v3}, Ll/wej;->resetClockDegrees()V

    .line 258
    .line 259
    .line 260
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 261
    .line 262
    invoke-virtual {v3}, Ll/wej;->reInitialize()V

    .line 263
    .line 264
    .line 265
    :goto_3
    iget-object v3, p0, Ll/rsy;->d:Ll/hd2;

    .line 266
    .line 267
    if-eqz v3, :cond_4

    .line 268
    .line 269
    iget v4, p2, Ll/tow;->m:I

    .line 270
    .line 271
    iget v5, p2, Ll/tow;->n:I

    .line 272
    .line 273
    invoke-virtual {v3, v4, v5}, Ll/hd2;->S1(II)V

    .line 274
    .line 275
    .line 276
    :cond_4
    iget-object v3, p0, Ll/rsy;->e:Ll/hd2;

    .line 277
    .line 278
    if-eqz v3, :cond_5

    .line 279
    .line 280
    iget v4, p2, Ll/tow;->m:I

    .line 281
    .line 282
    iget v5, p2, Ll/tow;->n:I

    .line 283
    .line 284
    invoke-virtual {v3, v4, v5}, Ll/hd2;->S1(II)V

    .line 285
    .line 286
    .line 287
    :cond_5
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    iget v4, p2, Ll/tow;->m:I

    .line 292
    .line 293
    iget v5, p2, Ll/tow;->n:I

    .line 294
    .line 295
    invoke-virtual {v3, v4, v5}, Ll/u6y;->U(II)V

    .line 296
    .line 297
    .line 298
    :cond_6
    instance-of v3, v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 299
    .line 300
    if-eqz v3, :cond_2

    .line 301
    .line 302
    const-string v3, "zk"

    .line 303
    .line 304
    new-instance v4, Ljava/lang/StringBuilder;

    .line 305
    .line 306
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 307
    .line 308
    .line 309
    const-string v5, "resetCodecmRenderWidth"

    .line 310
    .line 311
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    iget v5, p0, Ll/rsy;->l:F

    .line 315
    .line 316
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    const-string v5, "/mRenderHeight"

    .line 320
    .line 321
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    iget v5, p0, Ll/rsy;->m:F

    .line 325
    .line 326
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    invoke-static {v3, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    .line 335
    .line 336
    check-cast v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 337
    .line 338
    invoke-interface {p1, v2, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->b0(Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 339
    .line 340
    .line 341
    goto/16 :goto_2

    .line 342
    .line 343
    :cond_7
    monitor-exit v0

    .line 344
    return-void

    .line 345
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 346
    throw p0

    .line 347
    :cond_8
    return-void
.end method

.method public U1(Ll/uow;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ll/zej;

    .line 21
    .line 22
    instance-of v2, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    iget v2, p1, Ll/tow;->u:I

    .line 27
    .line 28
    iget v3, p1, Ll/tow;->v:I

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Ll/zej;->setRenderSize(II)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public V1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/zej;

    .line 21
    .line 22
    instance-of v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget v1, p2, Ll/tow;->u:I

    .line 27
    .line 28
    iget v2, p2, Ll/tow;->v:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ll/zej;->setRenderSize(II)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget v2, p2, Ll/tow;->u:I

    .line 38
    .line 39
    iget v3, p2, Ll/tow;->v:I

    .line 40
    .line 41
    invoke-virtual {v1, v2, v3}, Ll/u6y;->n0(II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ll/wej;->reInitialize()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    monitor-exit p1

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    throw p0
.end method

.method public W1(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "changeRenderSize:width"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v3, p2, Ll/tow;->u:I

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v3, "height"

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v3, p2, Ll/tow;->t:I

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Ll/wej;->width:I

    .line 37
    .line 38
    if-lez v0, :cond_7

    .line 39
    .line 40
    iget v0, p0, Ll/wej;->height:I

    .line 41
    .line 42
    if-gtz v0, :cond_0

    .line 43
    .line 44
    goto/16 :goto_3

    .line 45
    .line 46
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 51
    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v3, "setMergeFilterRenderSize:width"

    .line 55
    .line 56
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget v3, p0, Ll/wej;->width:I

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v3, "height"

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v3, p0, Ll/wej;->height:I

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget v0, p2, Ll/tow;->u:I

    .line 82
    .line 83
    iget v1, p2, Ll/tow;->v:I

    .line 84
    .line 85
    invoke-virtual {p0, v0, v1}, Ll/rsy;->setRenderSize(II)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 89
    .line 90
    monitor-enter v0

    .line 91
    :try_start_0
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_6

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Ll/zej;

    .line 108
    .line 109
    instance-of v3, v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 110
    .line 111
    if-nez v3, :cond_2

    .line 112
    .line 113
    iget v3, p2, Ll/tow;->u:I

    .line 114
    .line 115
    iget v4, p2, Ll/tow;->v:I

    .line 116
    .line 117
    invoke-virtual {v2, v3, v4}, Ll/zej;->setRenderSize(II)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :catchall_0
    move-exception p0

    .line 125
    goto/16 :goto_2

    .line 126
    .line 127
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 128
    .line 129
    if-eqz v3, :cond_3

    .line 130
    .line 131
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    new-instance v4, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    const-string v5, "changeRenderSizePushSize  mAgoraCutFilter  width:"

    .line 141
    .line 142
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget v5, p2, Ll/tow;->m:I

    .line 146
    .line 147
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v5, ", height:"

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget v5, p2, Ll/tow;->n:I

    .line 156
    .line 157
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v3, v4}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 172
    .line 173
    iget v4, p2, Ll/tow;->m:I

    .line 174
    .line 175
    iget v5, p2, Ll/tow;->n:I

    .line 176
    .line 177
    invoke-virtual {v3, v4, v5}, Ll/wej;->setRenderSize(II)V

    .line 178
    .line 179
    .line 180
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    iget v4, p2, Ll/tow;->m:I

    .line 185
    .line 186
    iget v5, p2, Ll/tow;->n:I

    .line 187
    .line 188
    invoke-virtual {v3, v4, v5}, Ll/u6y;->U(II)V

    .line 189
    .line 190
    .line 191
    iget-object v3, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 192
    .line 193
    invoke-virtual {v3}, Ll/wej;->reInitialize()V

    .line 194
    .line 195
    .line 196
    :cond_3
    iget-object v3, p0, Ll/rsy;->d:Ll/hd2;

    .line 197
    .line 198
    if-eqz v3, :cond_4

    .line 199
    .line 200
    iget v4, p2, Ll/tow;->m:I

    .line 201
    .line 202
    iget v5, p2, Ll/tow;->n:I

    .line 203
    .line 204
    invoke-virtual {v3, v4, v5}, Ll/hd2;->S1(II)V

    .line 205
    .line 206
    .line 207
    :cond_4
    iget-object v3, p0, Ll/rsy;->e:Ll/hd2;

    .line 208
    .line 209
    if-eqz v3, :cond_5

    .line 210
    .line 211
    iget v4, p2, Ll/tow;->m:I

    .line 212
    .line 213
    iget v5, p2, Ll/tow;->n:I

    .line 214
    .line 215
    invoke-virtual {v3, v4, v5}, Ll/hd2;->S1(II)V

    .line 216
    .line 217
    .line 218
    :cond_5
    instance-of v3, v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 219
    .line 220
    if-eqz v3, :cond_1

    .line 221
    .line 222
    const-string v3, "zk"

    .line 223
    .line 224
    new-instance v4, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    const-string v5, "resetCodecmRenderWidth"

    .line 230
    .line 231
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget v5, p0, Ll/rsy;->l:F

    .line 235
    .line 236
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v5, "/mRenderHeight"

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    iget v5, p0, Ll/rsy;->m:F

    .line 245
    .line 246
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-static {v3, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    iget v3, p2, Ll/tow;->v:I

    .line 257
    .line 258
    iget v4, p2, Ll/tow;->u:I

    .line 259
    .line 260
    const/4 v5, 0x0

    .line 261
    invoke-virtual {v2, v3, v4, v5}, Ll/wej;->setDisplayMode(III)V

    .line 262
    .line 263
    .line 264
    iget v3, p2, Ll/tow;->m:I

    .line 265
    .line 266
    iget v4, p2, Ll/tow;->n:I

    .line 267
    .line 268
    invoke-virtual {v2, v3, v4}, Ll/zej;->setRenderSize(II)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 272
    .line 273
    .line 274
    check-cast v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 275
    .line 276
    invoke-interface {p1, v2, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->b0(Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V

    .line 277
    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :cond_6
    monitor-exit v0

    .line 282
    return-void

    .line 283
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    throw p0

    .line 285
    :cond_7
    :goto_3
    return-void
.end method

.method public X1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rsy;->f:Ll/x120;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x120;->R1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Y1(Ll/gfj;)Ll/l6x;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/gfj;->getFilterKey()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/l6x;

    .line 12
    .line 13
    iget-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/x120;->V1(Ll/l6x;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/gfj;->getFilterKey()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public Z1(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/rsy;->n:Z

    .line 7
    .line 8
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "setCameraCutSize:width"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "height"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, "setCameraCutSize  mCutFilter width:"

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v2, ", height:"

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v2, "hasSetCameraSetSize:"

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-boolean v2, p0, Ll/rsy;->n:Z

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 83
    .line 84
    invoke-virtual {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 85
    .line 86
    .line 87
    :cond_0
    return-void
.end method

.method public a2(ZLcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string p3, "setLandMode"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {p3, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p2, p3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-boolean p1, p0, Ll/rsy;->q:Z

    .line 19
    .line 20
    return-void
.end method

.method public declared-synchronized addTarget(Ll/dfj;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Ll/zej;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 13
    .line 14
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 24
    .line 25
    check-cast p1, Ll/zej;

    .line 26
    .line 27
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit v0

    .line 34
    goto :goto_2

    .line 35
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 37
    :catchall_1
    move-exception p1

    .line 38
    goto :goto_3

    .line 39
    :cond_1
    :goto_2
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :goto_3
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 42
    throw p1
.end method

.method public b2(IIZ)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/rsy;->o:I

    .line 3
    .line 4
    int-to-float v1, p1

    .line 5
    int-to-float v2, p2

    .line 6
    div-float/2addr v1, v2

    .line 7
    const v2, 0x3f666666    # 0.9f

    .line 8
    .line 9
    .line 10
    cmpl-float v2, v1, v2

    .line 11
    .line 12
    if-lez v2, :cond_0

    .line 13
    .line 14
    const/high16 v2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    cmpg-float v1, v1, v2

    .line 17
    .line 18
    if-gtz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    iput-boolean v0, p0, Ll/rsy;->p:Z

    .line 23
    .line 24
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 29
    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v3, "setMergeFilterRenderSize:width"

    .line 33
    .line 34
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v3, "height"

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    if-eqz p3, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2}, Ll/rsy;->setRenderSize(II)V

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object p3, p0, Ll/rsy;->k:Ljava/util/List;

    .line 61
    .line 62
    monitor-enter p3

    .line 63
    :try_start_0
    iget-object p0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/zej;

    .line 80
    .line 81
    instance-of v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 82
    .line 83
    if-nez v1, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0, p1, p2}, Ll/zej;->setRenderSize(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ll/wej;->reInitialize()V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto :goto_2

    .line 94
    :cond_3
    monitor-exit p3

    .line 95
    return-void

    .line 96
    :goto_2
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0
.end method

.method public c2(Ll/gfj;IILjava/lang/String;FFFFFI)V
    .locals 12

    move/from16 v1, p10

    .line 1
    const-string v2, "setPosition:"

    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 2
    :try_start_0
    iget v4, p0, Ll/rsy;->l:F

    mul-float v4, v4, p5

    float-to-int v4, v4

    .line 3
    iget v5, p0, Ll/rsy;->m:F

    mul-float v5, v5, p6

    float-to-int v5, v5

    int-to-float v6, v4

    int-to-float v7, v5

    const/high16 v8, 0x40000000    # 2.0f

    mul-float v9, p5, v8

    div-float v10, p5, v8

    add-float v10, p7, v10

    div-float v8, p6, v8

    add-float v8, p8, v8

    .line 4
    new-instance v11, Ll/ehq0;

    invoke-direct {v11}, Ll/ehq0;-><init>()V

    .line 5
    iput v10, v11, Ll/ehq0;->c:F

    .line 6
    iput v8, v11, Ll/ehq0;->d:F

    .line 7
    iput v9, v11, Ll/ehq0;->e:F

    .line 8
    iput v9, v11, Ll/ehq0;->f:F

    move/from16 v8, p9

    .line 9
    iput v8, v11, Ll/ehq0;->g:F

    .line 10
    iget-object v8, p0, Ll/rsy;->j:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    move-object/from16 v9, p4

    invoke-virtual {v8, v9}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ll/l6x;

    if-eqz v8, :cond_3

    .line 11
    iget-object v9, v8, Ll/l6x;->k:Ll/gfj;

    invoke-virtual {v9}, Ll/wej;->getWidth()I

    move-result v9

    if-lez v9, :cond_0

    int-to-float v9, p2

    .line 12
    iput v9, v11, Ll/ehq0;->a:F

    int-to-float v9, p3

    .line 13
    iput v9, v11, Ll/ehq0;->b:F

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_0
    int-to-float v9, p2

    .line 14
    iput v9, v11, Ll/ehq0;->a:F

    int-to-float v9, p3

    .line 15
    iput v9, v11, Ll/ehq0;->b:F

    .line 16
    :goto_0
    const-string v9, "Pipeline_Normal_pip->PIPLINE"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", yReal:"

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", position.inputWidth:"

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v11, Ll/ehq0;->a:F

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", position.inputHeight:"

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v11, Ll/ehq0;->b:F

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    iget-object v2, v8, Ll/l6x;->k:Ll/gfj;

    if-eqz v2, :cond_2

    .line 18
    invoke-virtual {v2, p2, p3}, Ll/wej;->setRenderSize(II)V

    .line 19
    iget-object p1, v8, Ll/l6x;->k:Ll/gfj;

    invoke-virtual {p1}, Ll/wej;->reInitialize()V

    const/4 p1, 0x1

    if-ne v1, p1, :cond_1

    .line 20
    iget-object p1, v8, Ll/l6x;->k:Ll/gfj;

    invoke-virtual {p1, v4, v5}, Ll/wej;->setRenderSize(II)V

    .line 21
    iget-object p1, v8, Ll/l6x;->k:Ll/gfj;

    invoke-virtual {p1}, Ll/wej;->reInitialize()V

    .line 22
    iput v6, v11, Ll/ehq0;->a:F

    .line 23
    iput v7, v11, Ll/ehq0;->b:F

    .line 24
    :cond_1
    iget-object p1, v8, Ll/l6x;->k:Ll/gfj;

    instance-of v0, p1, Lproject/android/imageprocessing/ext/a;

    if-eqz v0, :cond_2

    .line 25
    check-cast p1, Lproject/android/imageprocessing/ext/a;

    invoke-virtual {p1, v1}, Lproject/android/imageprocessing/ext/a;->U1(I)V

    .line 26
    :cond_2
    invoke-virtual {v8, v11}, Ll/l6x;->d(Ll/ehq0;)V

    .line 27
    iget-object p0, p0, Ll/rsy;->f:Ll/x120;

    invoke-virtual {p0, v8}, Ll/x120;->Q1(Ll/l6x;)V

    .line 28
    :cond_3
    monitor-exit v3

    return-void

    :goto_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/rsy;->f:Ll/x120;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/x120;->destroy()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/rsy;->f:Ll/x120;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    :cond_1
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    instance-of p0, p2, Ll/u94;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/u6y;->P()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public removeTarget(Ll/dfj;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Ll/zej;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/rsy;->k:Ljava/util/List;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/rsy;->k:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    monitor-exit v0

    .line 28
    goto :goto_2

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_1
    :goto_2
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 32
    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    instance-of v0, p1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    move-object v0, p1

    .line 40
    check-cast v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x1

    .line 47
    if-eq v1, v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/4 v2, 0x2

    .line 54
    if-eq v1, v2, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->c1()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v1, 0x3

    .line 61
    if-ne v0, v1, :cond_3

    .line 62
    .line 63
    :cond_2
    iget-object p0, p0, Ll/rsy;->c:Lproject/android/imageprocessing/ext/a;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    iget-object p0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    return-void
.end method

.method public setRenderSize(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "setRenderSize:width"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "height"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, "hasSetCameraSetSize:"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-boolean v3, p0, Ll/rsy;->n:Z

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v3, "Pipeline_Normal_pip->PIPLINE"

    .line 42
    .line 43
    invoke-virtual {v0, v3, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    int-to-float v0, p1

    .line 47
    iput v0, p0, Ll/rsy;->l:F

    .line 48
    .line 49
    int-to-float v0, p2

    .line 50
    iput v0, p0, Ll/rsy;->m:F

    .line 51
    .line 52
    iget-object v0, p0, Ll/rsy;->b:Lproject/android/imageprocessing/ext/a;

    .line 53
    .line 54
    invoke-virtual {v0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 55
    .line 56
    .line 57
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v3, "setRenderSize mDefaultCutFilter  width:"

    .line 64
    .line 65
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v3, ", height:"

    .line 72
    .line 73
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v5, "threadInfo:"

    .line 86
    .line 87
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ll/htx;->a()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-boolean v2, p0, Ll/rsy;->n:Z

    .line 101
    .line 102
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    iget-boolean v0, p0, Ll/rsy;->n:Z

    .line 117
    .line 118
    if-nez v0, :cond_1

    .line 119
    .line 120
    iget v0, p0, Ll/rsy;->o:I

    .line 121
    .line 122
    const/4 v1, 0x1

    .line 123
    if-ne v0, v1, :cond_0

    .line 124
    .line 125
    iget-object v1, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 126
    .line 127
    invoke-virtual {v1, v0}, Lproject/android/imageprocessing/ext/a;->U1(I)V

    .line 128
    .line 129
    .line 130
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v2, "setRenderSize mCutFilter  width:"

    .line 137
    .line 138
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v2, ",threadInfo:"

    .line 151
    .line 152
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/htx;->a()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Ll/rsy;->a:Lproject/android/imageprocessing/ext/a;

    .line 174
    .line 175
    invoke-virtual {v0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget v1, p0, Ll/rsy;->o:I

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ll/u6y;->c0(I)V

    .line 185
    .line 186
    .line 187
    :cond_1
    iget-object p0, p0, Ll/rsy;->f:Ll/x120;

    .line 188
    .line 189
    invoke-virtual {p0, p1, p2}, Ll/x120;->setRenderSize(II)V

    .line 190
    .line 191
    .line 192
    :cond_2
    return-void
.end method
