.class public Ll/s1d0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lorg/json/JSONObject;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1, p2}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static c(Lorg/json/JSONObject;DLjava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0x3ee4f8b588e368f1L    # 1.0E-5

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmpl-double v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static d(Lorg/json/JSONObject;Ll/q4f;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/q4f;->a:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-string v2, "rt"

    .line 5
    .line 6
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p1, Ll/q4f;->b:Z

    .line 10
    .line 11
    const-string v1, "isauto"

    .line 12
    .line 13
    invoke-static {p0, v0, v1}, Ll/s1d0;->a(Lorg/json/JSONObject;ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p1, Ll/q4f;->c:Z

    .line 17
    .line 18
    const-string v1, "atpid"

    .line 19
    .line 20
    invoke-static {p0, v0, v1}, Ll/s1d0;->a(Lorg/json/JSONObject;ZLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 24
    .line 25
    const-string v1, "tt"

    .line 26
    .line 27
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p1, Ll/q4f;->e:D

    .line 31
    .line 32
    const-string v2, "duration"

    .line 33
    .line 34
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->c(Lorg/json/JSONObject;DLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-wide v0, p1, Ll/q4f;->f:J

    .line 38
    .line 39
    const-string v2, "cttm"

    .line 40
    .line 41
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-wide v0, p1, Ll/q4f;->g:J

    .line 45
    .line 46
    const-string v2, "sttm"

    .line 47
    .line 48
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p1, Ll/q4f;->h:Z

    .line 52
    .line 53
    const-string v1, "ntpok"

    .line 54
    .line 55
    invoke-static {p0, v0, v1}, Ll/s1d0;->a(Lorg/json/JSONObject;ZLjava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-wide v0, p1, Ll/q4f;->i:J

    .line 59
    .line 60
    const-string v2, "sdtm"

    .line 61
    .line 62
    invoke-static {p0, v0, v1, v2}, Ll/s1d0;->e(Lorg/json/JSONObject;JLjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-string v0, "seq"

    .line 66
    .line 67
    iget-wide v1, p1, Ll/q4f;->j:J

    .line 68
    .line 69
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    const-string v0, "gseq"

    .line 73
    .line 74
    iget-wide v1, p1, Ll/q4f;->k:J

    .line 75
    .line 76
    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string v0, "state"

    .line 80
    .line 81
    iget v1, p1, Ll/q4f;->l:I

    .line 82
    .line 83
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    const-string v0, "euuid"

    .line 87
    .line 88
    iget-object v1, p1, Ll/q4f;->m:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    iget-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "pid"

    .line 96
    .line 97
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p1, Ll/q4f;->o:Ljava/lang/String;

    .line 101
    .line 102
    const-string v1, "refpid"

    .line 103
    .line 104
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p1, Ll/q4f;->p:Ljava/lang/String;

    .line 108
    .line 109
    const-string v1, "clsnm"

    .line 110
    .line 111
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p1, Ll/q4f;->q:Ljava/lang/String;

    .line 115
    .line 116
    const-string v1, "reqid"

    .line 117
    .line 118
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p1, Ll/q4f;->r:Ljava/lang/String;

    .line 122
    .line 123
    const-string v1, "refreqid"

    .line 124
    .line 125
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 129
    .line 130
    const-string v1, "eid"

    .line 131
    .line 132
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p1, Ll/q4f;->t:Ljava/lang/String;

    .line 136
    .line 137
    const-string v1, "refereid"

    .line 138
    .line 139
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p1, Ll/q4f;->u:Ljava/lang/String;

    .line 143
    .line 144
    const-string v1, "mid"

    .line 145
    .line 146
    invoke-static {p0, v0, v1}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p1, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 150
    .line 151
    const-string v0, "exts"

    .line 152
    .line 153
    invoke-static {p0, p1, v0}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public static e(Lorg/json/JSONObject;JLjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/32 v0, -0x80000000

    .line 8
    .line 9
    .line 10
    cmp-long v0, p1, v0

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of v0, p1, Lorg/json/JSONObject;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    move-object v0, p1

    .line 23
    check-cast v0, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    instance-of v0, p1, Lorg/json/JSONArray;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    move-object v0, p1

    .line 44
    check-cast v0, Lorg/json/JSONArray;

    .line 45
    .line 46
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-lez v0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    if-eqz p1, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method public static g(Ll/q4f;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m4g0;->d()Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v3, "app"

    .line 20
    .line 21
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v3, "ch"

    .line 25
    .line 26
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v3, "intl"

    .line 30
    .line 31
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v3, "tch"

    .line 35
    .line 36
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v3, "lch"

    .line 40
    .line 41
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v3, "pushid"

    .line 45
    .line 46
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v3, "adtk"

    .line 50
    .line 51
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    new-instance v3, Lorg/json/JSONObject;

    .line 55
    .line 56
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v4, "utm_source"

    .line 60
    .line 61
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const-string v4, "utm_medium"

    .line 65
    .line 66
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v4, "utm_term"

    .line 70
    .line 71
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string v4, "utm_content"

    .line 75
    .line 76
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-string v4, "utm_campaign"

    .line 80
    .line 81
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v4, "utm"

    .line 85
    .line 86
    invoke-static {v2, v3, v4}, Ll/s1d0;->f(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string v3, "ls"

    .line 90
    .line 91
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v3, "mode"

    .line 95
    .line 96
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-string v3, "cuid"

    .line 100
    .line 101
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    const-string v3, "sunionid"

    .line 105
    .line 106
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    const-string v3, "suid"

    .line 110
    .line 111
    invoke-static {v2, v0, v3}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    new-instance v3, Lorg/json/JSONObject;

    .line 115
    .line 116
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 117
    .line 118
    .line 119
    const-string v4, "btry"

    .line 120
    .line 121
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v4, "chrg"

    .line 125
    .line 126
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string v4, "unionid"

    .line 130
    .line 131
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v4, "os"

    .line 135
    .line 136
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v4, "osv"

    .line 140
    .line 141
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-string v4, "brand"

    .line 145
    .line 146
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const-string v4, "dm"

    .line 150
    .line 151
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    const-string v4, "sc"

    .line 155
    .line 156
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string v4, "ct"

    .line 160
    .line 161
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    const-string v4, "aad"

    .line 165
    .line 166
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    const-string v4, "localid"

    .line 170
    .line 171
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    const-string v4, "puuid"

    .line 175
    .line 176
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    const-string v4, "net"

    .line 180
    .line 181
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    const-string v4, "mno"

    .line 185
    .line 186
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    const-string v4, "wfs"

    .line 190
    .line 191
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    const-string v4, "bts"

    .line 195
    .line 196
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const-string v4, "gs"

    .line 200
    .line 201
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    const-string v4, "ps"

    .line 205
    .line 206
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    const-string v4, "vs"

    .line 210
    .line 211
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    const-string v4, "locale"

    .line 215
    .line 216
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    const-string v4, "lang"

    .line 220
    .line 221
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    const-string v4, "tz"

    .line 225
    .line 226
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    const-string v4, "odevs"

    .line 230
    .line 231
    invoke-static {v3, v0, v4}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    new-instance v4, Lorg/json/JSONObject;

    .line 235
    .line 236
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 237
    .line 238
    .line 239
    const-string v5, "uid"

    .line 240
    .line 241
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    const-string v5, "lgtp"

    .line 245
    .line 246
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    const-string v5, "sets.arg"

    .line 250
    .line 251
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    const-string v5, "sets.locset"

    .line 255
    .line 256
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    const-string v5, "sets.locuse"

    .line 260
    .line 261
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    const-string v5, "sets.grg"

    .line 265
    .line 266
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    const-string v5, "sets.sex"

    .line 270
    .line 271
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    const-string v5, "sets.pvc"

    .line 275
    .line 276
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    const-string v5, "sets.nt"

    .line 280
    .line 281
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    const-string v5, "sets.osets"

    .line 285
    .line 286
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    const-string v5, "upf"

    .line 290
    .line 291
    invoke-static {v4, v0, v5}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    new-instance v5, Lorg/json/JSONObject;

    .line 295
    .line 296
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 297
    .line 298
    .line 299
    const-string v6, "appv"

    .line 300
    .line 301
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    const-string v6, "sdkv"

    .line 305
    .line 306
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    const-string v6, "build"

    .line 310
    .line 311
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    const-string v6, "pkg"

    .line 315
    .line 316
    invoke-static {v5, v0, v6}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    const-string v6, "source"

    .line 320
    .line 321
    invoke-virtual {v1, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 322
    .line 323
    .line 324
    const-string v2, "device"

    .line 325
    .line 326
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 327
    .line 328
    .line 329
    const-string v2, "sysext"

    .line 330
    .line 331
    invoke-virtual {v0, v2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->d(Ljava/lang/String;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    const-string v3, "sys_extras"

    .line 336
    .line 337
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 338
    .line 339
    .line 340
    const-string v2, "versions"

    .line 341
    .line 342
    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 343
    .line 344
    .line 345
    const-string v2, "tss"

    .line 346
    .line 347
    iget-object p0, p0, Ll/q4f;->v:Ljava/lang/String;

    .line 348
    .line 349
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 350
    .line 351
    .line 352
    const-string p0, "user"

    .line 353
    .line 354
    invoke-virtual {v1, p0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    .line 356
    .line 357
    const-string p0, "ab"

    .line 358
    .line 359
    invoke-static {v1, v0, p0}, Ll/s1d0;->b(Lorg/json/JSONObject;Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    return-object v1
.end method

.method public static h(Ll/q4f;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0}, Ll/s1d0;->d(Lorg/json/JSONObject;Ll/q4f;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
