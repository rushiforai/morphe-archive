.class public Ll/mxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:Ljava/lang/String;

.field private final h:Ljava/lang/String;

.field private final i:Ljava/lang/String;

.field private final j:Ljava/lang/String;

.field private final k:Ljava/lang/String;

.field private final l:Ljava/lang/String;

.field private final m:Ljava/lang/String;

.field private final n:Ljava/lang/String;

.field private final o:Ljava/lang/String;

.field private final p:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "power_consumption_stats"

    .line 5
    .line 6
    iput-object v0, p0, Ll/mxq0;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "off_up_ct"

    .line 9
    .line 10
    iput-object v0, p0, Ll/mxq0;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "off_dn_ct"

    .line 13
    .line 14
    iput-object v0, p0, Ll/mxq0;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "off_ping_ct"

    .line 17
    .line 18
    iput-object v0, p0, Ll/mxq0;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "off_pong_ct"

    .line 21
    .line 22
    iput-object v0, p0, Ll/mxq0;->e:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "off_dur"

    .line 25
    .line 26
    iput-object v0, p0, Ll/mxq0;->f:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "on_up_ct"

    .line 29
    .line 30
    iput-object v0, p0, Ll/mxq0;->g:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "on_dn_ct"

    .line 33
    .line 34
    iput-object v0, p0, Ll/mxq0;->h:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "on_ping_ct"

    .line 37
    .line 38
    iput-object v0, p0, Ll/mxq0;->i:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "on_pong_ct"

    .line 41
    .line 42
    iput-object v0, p0, Ll/mxq0;->j:Ljava/lang/String;

    .line 43
    .line 44
    const-string v0, "on_dur"

    .line 45
    .line 46
    iput-object v0, p0, Ll/mxq0;->k:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "start_time"

    .line 49
    .line 50
    iput-object v0, p0, Ll/mxq0;->l:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "end_time"

    .line 53
    .line 54
    iput-object v0, p0, Ll/mxq0;->m:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "xmsf_vc"

    .line 57
    .line 58
    iput-object v0, p0, Ll/mxq0;->n:Ljava/lang/String;

    .line 59
    .line 60
    const-string v0, "android_vc"

    .line 61
    .line 62
    iput-object v0, p0, Ll/mxq0;->o:Ljava/lang/String;

    .line 63
    .line 64
    const-string v0, "uuid"

    .line 65
    .line 66
    iput-object v0, p0, Ll/mxq0;->p:Ljava/lang/String;

    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ll/lxq0;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/lxq0;->a()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "off_up_ct"

    .line 18
    .line 19
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ll/lxq0;->e()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "off_dn_ct"

    .line 31
    .line 32
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Ll/lxq0;->i()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "off_ping_ct"

    .line 44
    .line 45
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ll/lxq0;->m()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "off_pong_ct"

    .line 57
    .line 58
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2}, Ll/lxq0;->b()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "off_dur"

    .line 70
    .line 71
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Ll/lxq0;->q()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "on_up_ct"

    .line 83
    .line 84
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ll/lxq0;->s()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v1, "on_dn_ct"

    .line 96
    .line 97
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2}, Ll/lxq0;->u()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-string v1, "on_ping_ct"

    .line 109
    .line 110
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p2}, Ll/lxq0;->w()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "on_pong_ct"

    .line 122
    .line 123
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ll/lxq0;->f()J

    .line 127
    .line 128
    .line 129
    move-result-wide v0

    .line 130
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v1, "on_dur"

    .line 135
    .line 136
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Ll/lxq0;->j()J

    .line 140
    .line 141
    .line 142
    move-result-wide v0

    .line 143
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-string v1, "start_time"

    .line 148
    .line 149
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2}, Ll/lxq0;->n()J

    .line 153
    .line 154
    .line 155
    move-result-wide v0

    .line 156
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const-string v1, "end_time"

    .line 161
    .line 162
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2}, Ll/lxq0;->y()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v1, "xmsf_vc"

    .line 174
    .line 175
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p2}, Ll/lxq0;->A()I

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    const-string v0, "android_vc"

    .line 187
    .line 188
    invoke-interface {p0, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    const-string p2, "uuid"

    .line 192
    .line 193
    invoke-static {p1}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    invoke-static {}, Ll/t0r0;->b()Ll/t0r0;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    const-string p2, "power_consumption_stats"

    .line 205
    .line 206
    invoke-virtual {p1, p2, p0}, Ll/t0r0;->a(Ljava/lang/String;Ljava/util/Map;)V

    .line 207
    .line 208
    .line 209
    return-void
.end method
