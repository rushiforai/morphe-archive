.class public final Ltech/sud/gip/asr/base/Sudint;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final Sudbyte:Ltech/sud/gip/asr/base/Sudnew;

.field public Sudcase:Z

.field public Sudchar:J

.field public Suddo:I

.field public final Sudelse:Ltech/sud/gip/asr/base/Sudfor;

.field public final Sudfor:J

.field public final Sudgoto:Landroid/os/Handler;

.field public Sudif:Ljava/lang/String;

.field public final Sudint:Ljava/lang/String;

.field public Sudlong:J

.field public final Sudnew:Ljava/lang/String;

.field public final Sudtry:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ltech/sud/gip/asr/base/Sudnew;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ltech/sud/gip/asr/base/Sudfor;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ltech/sud/gip/asr/base/Sudfor;-><init>(Ltech/sud/gip/asr/base/Sudint;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 21
    .line 22
    iput-wide p1, p0, Ltech/sud/gip/asr/base/Sudint;->Sudfor:J

    .line 23
    .line 24
    const-string p1, "volc"

    .line 25
    .line 26
    iput-object p1, p0, Ltech/sud/gip/asr/base/Sudint;->Sudint:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p3, p0, Ltech/sud/gip/asr/base/Sudint;->Sudnew:Ljava/lang/String;

    .line 29
    .line 30
    iput-object p4, p0, Ltech/sud/gip/asr/base/Sudint;->Sudtry:Ljava/lang/String;

    .line 31
    .line 32
    iput-object p5, p0, Ltech/sud/gip/asr/base/Sudint;->Sudbyte:Ltech/sud/gip/asr/base/Sudnew;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final Suddo()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-wide v3, v0, Ltech/sud/gip/asr/base/Sudint;->Sudchar:J

    .line 8
    .line 9
    sub-long/2addr v1, v3

    .line 10
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    iput-wide v3, v0, Ltech/sud/gip/asr/base/Sudint;->Sudchar:J

    .line 15
    .line 16
    const-wide/32 v3, 0xea60

    .line 17
    .line 18
    .line 19
    cmp-long v3, v1, v3

    .line 20
    .line 21
    if-lez v3, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-wide v3, v0, Ltech/sud/gip/asr/base/Sudint;->Sudlong:J

    .line 25
    .line 26
    add-long/2addr v3, v1

    .line 27
    iput-wide v3, v0, Ltech/sud/gip/asr/base/Sudint;->Sudlong:J

    .line 28
    .line 29
    iget v1, v0, Ltech/sud/gip/asr/base/Sudint;->Suddo:I

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    iput v1, v0, Ltech/sud/gip/asr/base/Sudint;->Suddo:I

    .line 34
    .line 35
    iget-object v2, v0, Ltech/sud/gip/asr/base/Sudint;->Sudif:Ljava/lang/String;

    .line 36
    .line 37
    iget-wide v5, v0, Ltech/sud/gip/asr/base/Sudint;->Sudfor:J

    .line 38
    .line 39
    iget-object v7, v0, Ltech/sud/gip/asr/base/Sudint;->Sudint:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v8, v0, Ltech/sud/gip/asr/base/Sudint;->Sudnew:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v9, v0, Ltech/sud/gip/asr/base/Sudint;->Sudtry:Ljava/lang/String;

    .line 44
    .line 45
    const-wide/16 v10, 0x3e7

    .line 46
    .line 47
    add-long/2addr v3, v10

    .line 48
    const-wide/16 v10, 0x3e8

    .line 49
    .line 50
    div-long/2addr v3, v10

    .line 51
    iget-object v0, v0, Ltech/sud/gip/asr/base/Sudint;->Sudbyte:Ltech/sud/gip/asr/base/Sudnew;

    .line 52
    .line 53
    check-cast v0, Ltech/sud/gip/asr/base/Sudif;

    .line 54
    .line 55
    iget-object v10, v0, Ltech/sud/gip/asr/base/Sudif;->Sudif:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v11, Ll/utg0;->e:Ll/i0h0;

    .line 58
    .line 59
    if-eqz v11, :cond_1

    .line 60
    .line 61
    iget-object v11, v11, Ll/i0h0;->c:Ll/gvg0;

    .line 62
    .line 63
    if-eqz v11, :cond_1

    .line 64
    .line 65
    iget-object v11, v11, Ll/gvg0;->p:Ll/ogg0;

    .line 66
    .line 67
    if-eqz v11, :cond_1

    .line 68
    .line 69
    iget-object v11, v11, Ll/ogg0;->a:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v11, :cond_1

    .line 72
    .line 73
    :goto_0
    move-object v13, v11

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    const/4 v11, 0x0

    .line 76
    goto :goto_0

    .line 77
    :goto_1
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v11

    .line 81
    if-eqz v11, :cond_2

    .line 82
    .line 83
    iget-object v0, v0, Ltech/sud/gip/asr/base/Sudif;->Suddo:Ljava/lang/String;

    .line 84
    .line 85
    const-string v1, "error onReportDuration error because url is null"

    .line 86
    .line 87
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string v0, "CommonAsrBillingListener"

    .line 91
    .line 92
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    new-instance v11, Lorg/json/JSONObject;

    .line 97
    .line 98
    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 99
    .line 100
    .line 101
    :try_start_0
    const-string v0, "seq_no"

    .line 102
    .line 103
    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    const-string v0, "session_id"

    .line 107
    .line 108
    invoke-virtual {v11, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string v0, "app_id"

    .line 112
    .line 113
    invoke-virtual {v11, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string v0, "mg_id"

    .line 117
    .line 118
    invoke-virtual {v11, v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    const-string v0, "platform"

    .line 122
    .line 123
    const/4 v1, 0x2

    .line 124
    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    const-string v0, "csp"

    .line 128
    .line 129
    invoke-virtual {v11, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    const-string v0, "user_id"

    .line 133
    .line 134
    invoke-virtual {v11, v0, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    const-string v0, "room_id"

    .line 138
    .line 139
    invoke-virtual {v11, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    .line 141
    .line 142
    const-string v0, "duration"

    .line 143
    .line 144
    invoke-virtual {v11, v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :catch_0
    move-exception v0

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    const-string v2, "error:"

    .line 152
    .line 153
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-static {v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 171
    .line 172
    .line 173
    :goto_2
    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v14

    .line 177
    sget-object v12, Ll/utg0;->b:Ll/uyg0;

    .line 178
    .line 179
    new-instance v16, Ltech/sud/gip/asr/base/Suddo;

    .line 180
    .line 181
    invoke-direct/range {v16 .. v16}, Ltech/sud/gip/asr/base/Suddo;-><init>()V

    .line 182
    .line 183
    .line 184
    const/4 v15, 0x0

    .line 185
    const/16 v17, 0x0

    .line 186
    .line 187
    invoke-virtual/range {v12 .. v17}, Ll/uyg0;->l(Ljava/lang/String;Ljava/lang/String;Ll/yng0;Ll/vlg0;Ll/neg0;)V

    .line 188
    .line 189
    .line 190
    return-void
.end method
