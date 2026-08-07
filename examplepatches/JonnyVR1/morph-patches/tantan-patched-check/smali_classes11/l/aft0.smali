.class public final Ll/aft0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Ljava/lang/String;

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:Z

.field public final k:Z

.field public final l:Z

.field public final m:Z

.field public final n:J

.field public final o:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    move-object v0, v1

    .line 13
    :catch_0
    :cond_0
    const-string p1, "aggressive_media_codec_release"

    .line 14
    .line 15
    sget-object v1, Ll/sgs0;->J:Ll/dgs0;

    .line 16
    .line 17
    invoke-static {v0, p1, v1}, Ll/aft0;->a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Ll/aft0;->a:Z

    .line 22
    .line 23
    const-string p1, "byte_buffer_precache_limit"

    .line 24
    .line 25
    sget-object v1, Ll/sgs0;->l:Ll/dgs0;

    .line 26
    .line 27
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Ll/aft0;->b:I

    .line 32
    .line 33
    const-string p1, "exo_cache_buffer_size"

    .line 34
    .line 35
    sget-object v1, Ll/sgs0;->w:Ll/dgs0;

    .line 36
    .line 37
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Ll/aft0;->c:I

    .line 42
    .line 43
    const-string p1, "exo_connect_timeout_millis"

    .line 44
    .line 45
    sget-object v1, Ll/sgs0;->h:Ll/dgs0;

    .line 46
    .line 47
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, p0, Ll/aft0;->d:I

    .line 52
    .line 53
    const-string p1, "exo_player_version"

    .line 54
    .line 55
    sget-object v1, Ll/sgs0;->g:Ll/dgs0;

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    :try_start_1
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 63
    goto :goto_0

    .line 64
    :catch_1
    :cond_1
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Ljava/lang/String;

    .line 73
    .line 74
    :goto_0
    iput-object p1, p0, Ll/aft0;->e:Ljava/lang/String;

    .line 75
    .line 76
    const-string p1, "exo_read_timeout_millis"

    .line 77
    .line 78
    sget-object v1, Ll/sgs0;->i:Ll/dgs0;

    .line 79
    .line 80
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iput p1, p0, Ll/aft0;->f:I

    .line 85
    .line 86
    const-string p1, "load_check_interval_bytes"

    .line 87
    .line 88
    sget-object v1, Ll/sgs0;->j:Ll/dgs0;

    .line 89
    .line 90
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    iput p1, p0, Ll/aft0;->g:I

    .line 95
    .line 96
    const-string p1, "player_precache_limit"

    .line 97
    .line 98
    sget-object v1, Ll/sgs0;->k:Ll/dgs0;

    .line 99
    .line 100
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    iput p1, p0, Ll/aft0;->h:I

    .line 105
    .line 106
    const-string p1, "socket_receive_buffer_size"

    .line 107
    .line 108
    sget-object v1, Ll/sgs0;->m:Ll/dgs0;

    .line 109
    .line 110
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    iput p1, p0, Ll/aft0;->i:I

    .line 115
    .line 116
    const-string p1, "use_cache_data_source"

    .line 117
    .line 118
    sget-object v1, Ll/sgs0;->i4:Ll/dgs0;

    .line 119
    .line 120
    invoke-static {v0, p1, v1}, Ll/aft0;->a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    iput-boolean p1, p0, Ll/aft0;->j:Z

    .line 125
    .line 126
    const-string p1, "min_retry_count"

    .line 127
    .line 128
    sget-object v1, Ll/sgs0;->n:Ll/dgs0;

    .line 129
    .line 130
    invoke-static {v0, p1, v1}, Ll/aft0;->b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I

    .line 131
    .line 132
    .line 133
    const-string p1, "treat_load_exception_as_non_fatal"

    .line 134
    .line 135
    sget-object v1, Ll/sgs0;->q:Ll/dgs0;

    .line 136
    .line 137
    invoke-static {v0, p1, v1}, Ll/aft0;->a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iput-boolean p1, p0, Ll/aft0;->k:Z

    .line 142
    .line 143
    const-string p1, "enable_multiple_video_playback"

    .line 144
    .line 145
    sget-object v1, Ll/sgs0;->R1:Ll/dgs0;

    .line 146
    .line 147
    invoke-static {v0, p1, v1}, Ll/aft0;->a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iput-boolean p1, p0, Ll/aft0;->l:Z

    .line 152
    .line 153
    const-string p1, "use_range_http_data_source"

    .line 154
    .line 155
    sget-object v1, Ll/sgs0;->T1:Ll/dgs0;

    .line 156
    .line 157
    invoke-static {v0, p1, v1}, Ll/aft0;->a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iput-boolean p1, p0, Ll/aft0;->m:Z

    .line 162
    .line 163
    const-string p1, "range_http_data_source_high_water_mark"

    .line 164
    .line 165
    sget-object v1, Ll/sgs0;->U1:Ll/dgs0;

    .line 166
    .line 167
    invoke-static {v0, p1, v1}, Ll/aft0;->c(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)J

    .line 168
    .line 169
    .line 170
    move-result-wide v1

    .line 171
    iput-wide v1, p0, Ll/aft0;->n:J

    .line 172
    .line 173
    const-string p1, "range_http_data_source_low_water_mark"

    .line 174
    .line 175
    sget-object v1, Ll/sgs0;->V1:Ll/dgs0;

    .line 176
    .line 177
    invoke-static {v0, p1, v1}, Ll/aft0;->c(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)J

    .line 178
    .line 179
    .line 180
    move-result-wide v0

    .line 181
    iput-wide v0, p0, Ll/aft0;->o:J

    .line 182
    .line 183
    return-void
.end method

.method public static final a(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return p0

    .line 22
    :catch_0
    :cond_0
    return p2
.end method

.method public static final b(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)I
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    :cond_0
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public static final c(Lorg/json/JSONObject;Ljava/lang/String;Ll/dgs0;)J
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-wide p0

    .line 8
    :catch_0
    :cond_0
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide p0

    .line 22
    return-wide p0
.end method
