.class public Ll/azm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Z

.field public p:Z

.field public q:J

.field public r:Ljava/lang/String;

.field public s:Z

.field public t:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 207
    iput-wide v0, p0, Ll/azm0;->q:J

    .line 208
    const-string v0, ""

    iput-object v0, p0, Ll/azm0;->r:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/azm0;->q:J

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Ll/azm0;->r:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Ll/azm0;->e:Ljava/lang/String;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Ll/azm0;->a:Ljava/lang/String;

    .line 35
    .line 36
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Ll/azm0;->b:Ljava/lang/String;

    .line 47
    .line 48
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v0, p0, Ll/azm0;->d:Ljava/lang/String;

    .line 59
    .line 60
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_4

    .line 67
    .line 68
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v0, p0, Ll/azm0;->c:Ljava/lang/String;

    .line 71
    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v0, p0, Ll/azm0;->g:Ljava/lang/String;

    .line 83
    .line 84
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_6

    .line 91
    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v0, p0, Ll/azm0;->f:Ljava/lang/String;

    .line 95
    .line 96
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_7

    .line 103
    .line 104
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v0, p0, Ll/azm0;->h:Ljava/lang/String;

    .line 107
    .line 108
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_8

    .line 115
    .line 116
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v0, p0, Ll/azm0;->i:Ljava/lang/String;

    .line 119
    .line 120
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-nez v0, :cond_9

    .line 127
    .line 128
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v0, p0, Ll/azm0;->j:Ljava/lang/String;

    .line 131
    .line 132
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_a

    .line 139
    .line 140
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 141
    .line 142
    iput-object v0, p0, Ll/azm0;->k:Ljava/lang/String;

    .line 143
    .line 144
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_b

    .line 151
    .line 152
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 153
    .line 154
    iput-object v0, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 155
    .line 156
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_c

    .line 163
    .line 164
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 165
    .line 166
    iput-object v0, p0, Ll/azm0;->l:Ljava/lang/String;

    .line 167
    .line 168
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    const/4 v1, 0x1

    .line 183
    if-eqz v0, :cond_d

    .line 184
    .line 185
    iput-boolean v1, p0, Ll/azm0;->o:Z

    .line 186
    .line 187
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 188
    .line 189
    iput-object v0, p0, Ll/azm0;->n:Ljava/lang/String;

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_d
    const/4 v0, 0x0

    .line 193
    iput-boolean v0, p0, Ll/azm0;->o:Z

    .line 194
    .line 195
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 196
    .line 197
    iput-object v0, p0, Ll/azm0;->n:Ljava/lang/String;

    .line 198
    .line 199
    :goto_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 200
    .line 201
    if-eqz p1, :cond_e

    .line 202
    .line 203
    iput-boolean v1, p0, Ll/azm0;->p:Z

    .line 204
    .line 205
    :cond_e
    return-void
.end method


# virtual methods
.method public a(Ll/azm0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/azm0;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Ll/azm0;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p0, Ll/azm0;->e:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p1, Ll/azm0;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Ll/azm0;->a:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Ll/azm0;->a:Ljava/lang/String;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p1, Ll/azm0;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p1, Ll/azm0;->b:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Ll/azm0;->b:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p1, Ll/azm0;->d:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p1, Ll/azm0;->d:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v0, p0, Ll/azm0;->d:Ljava/lang/String;

    .line 48
    .line 49
    :cond_3
    iget-object v0, p1, Ll/azm0;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    iget-object v0, p1, Ll/azm0;->c:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v0, p0, Ll/azm0;->c:Ljava/lang/String;

    .line 60
    .line 61
    :cond_4
    iget-object v0, p1, Ll/azm0;->g:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_5

    .line 68
    .line 69
    iget-object v0, p1, Ll/azm0;->g:Ljava/lang/String;

    .line 70
    .line 71
    iput-object v0, p0, Ll/azm0;->g:Ljava/lang/String;

    .line 72
    .line 73
    :cond_5
    iget-object v0, p1, Ll/azm0;->f:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_6

    .line 80
    .line 81
    iget-object v0, p1, Ll/azm0;->f:Ljava/lang/String;

    .line 82
    .line 83
    iput-object v0, p0, Ll/azm0;->f:Ljava/lang/String;

    .line 84
    .line 85
    :cond_6
    iget-object v0, p1, Ll/azm0;->h:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_7

    .line 92
    .line 93
    iget-object v0, p1, Ll/azm0;->h:Ljava/lang/String;

    .line 94
    .line 95
    iput-object v0, p0, Ll/azm0;->h:Ljava/lang/String;

    .line 96
    .line 97
    :cond_7
    iget-object v0, p1, Ll/azm0;->i:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_8

    .line 104
    .line 105
    iget-object v0, p1, Ll/azm0;->i:Ljava/lang/String;

    .line 106
    .line 107
    iput-object v0, p0, Ll/azm0;->i:Ljava/lang/String;

    .line 108
    .line 109
    :cond_8
    iget-object v0, p1, Ll/azm0;->j:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_9

    .line 116
    .line 117
    iget-object v0, p1, Ll/azm0;->j:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v0, p0, Ll/azm0;->j:Ljava/lang/String;

    .line 120
    .line 121
    :cond_9
    iget-object v0, p1, Ll/azm0;->k:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_a

    .line 128
    .line 129
    iget-object v0, p1, Ll/azm0;->k:Ljava/lang/String;

    .line 130
    .line 131
    iput-object v0, p0, Ll/azm0;->k:Ljava/lang/String;

    .line 132
    .line 133
    :cond_a
    iget-object v0, p1, Ll/azm0;->m:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_b

    .line 140
    .line 141
    iget-object v0, p1, Ll/azm0;->m:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v0, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 144
    .line 145
    :cond_b
    iget-object v0, p1, Ll/azm0;->l:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_c

    .line 152
    .line 153
    iget-object v0, p1, Ll/azm0;->l:Ljava/lang/String;

    .line 154
    .line 155
    iput-object v0, p0, Ll/azm0;->l:Ljava/lang/String;

    .line 156
    .line 157
    :cond_c
    iget-object v0, p1, Ll/azm0;->n:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_d

    .line 164
    .line 165
    iget-object v0, p1, Ll/azm0;->n:Ljava/lang/String;

    .line 166
    .line 167
    iput-object v0, p0, Ll/azm0;->n:Ljava/lang/String;

    .line 168
    .line 169
    :cond_d
    iget-boolean v0, p1, Ll/azm0;->o:Z

    .line 170
    .line 171
    const/4 v1, 0x1

    .line 172
    if-eqz v0, :cond_e

    .line 173
    .line 174
    iput-boolean v1, p0, Ll/azm0;->o:Z

    .line 175
    .line 176
    :cond_e
    iget-boolean v0, p1, Ll/azm0;->p:Z

    .line 177
    .line 178
    if-eqz v0, :cond_f

    .line 179
    .line 180
    iput-boolean v1, p0, Ll/azm0;->p:Z

    .line 181
    .line 182
    :cond_f
    iget-boolean v0, p1, Ll/azm0;->s:Z

    .line 183
    .line 184
    if-eqz v0, :cond_10

    .line 185
    .line 186
    iput-boolean v1, p0, Ll/azm0;->s:Z

    .line 187
    .line 188
    :cond_10
    iget p1, p1, Ll/azm0;->t:I

    .line 189
    .line 190
    iput p1, p0, Ll/azm0;->t:I

    .line 191
    .line 192
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VoiceCallData{caller=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/azm0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', callee=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/azm0;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', calleeDeviceId=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/azm0;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', callerDeviceId=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Ll/azm0;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\', voiceCallId=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/azm0;->e:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "\', calleeToken=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/azm0;->f:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, "\', callerToken=\'"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/azm0;->g:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, "\', channelName=\'"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/azm0;->h:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "\', appId=\'"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/azm0;->i:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "\', rtcProvider=\'"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/azm0;->j:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, "\', businessType=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/azm0;->k:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', scene=\'"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', otherUserId=\'"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Ll/azm0;->n:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "\', isMeCaller="

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Ll/azm0;->o:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, ", mandatory="

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-boolean v1, p0, Ll/azm0;->p:Z

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, ", duration="

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-wide v1, p0, Ll/azm0;->q:J

    .line 159
    .line 160
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, ", endAction=\'"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Ll/azm0;->r:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "\', endBySelf="

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-boolean v1, p0, Ll/azm0;->s:Z

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, ", roomId=\'"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-object p0, p0, Ll/azm0;->l:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string p0, "\'}"

    .line 194
    .line 195
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    return-object p0
.end method
