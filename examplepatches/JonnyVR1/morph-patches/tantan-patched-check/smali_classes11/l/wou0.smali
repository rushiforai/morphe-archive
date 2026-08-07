.class public final Ll/wou0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ll/ppu0;

.field public final c:Ll/upu0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ll/ppu0;Ll/upu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wou0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wou0;->b:Ll/ppu0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wou0;->c:Ll/upu0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)Ll/hpr;
    .locals 12

    .line 1
    new-instance v1, Ll/uou0;

    .line 2
    .line 3
    invoke-direct {v1, p0, p1, p2, p3}, Ll/uou0;-><init>(Ll/wou0;Ll/b7w0;Ll/q6w0;Lorg/json/JSONObject;)V

    .line 4
    .line 5
    .line 6
    iget-object v2, p0, Ll/wou0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {v2, v1}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v1, p0, Ll/wou0;->b:Ll/ppu0;

    .line 13
    .line 14
    const-string v3, "images"

    .line 15
    .line 16
    invoke-virtual {v1, p3, v3}, Ll/ppu0;->f(Lorg/json/JSONObject;Ljava/lang/String;)Ll/hpr;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v4, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 21
    .line 22
    iget-object v4, v4, Ll/a7w0;->b:Ll/t6w0;

    .line 23
    .line 24
    iget-object v5, p0, Ll/wou0;->b:Ll/ppu0;

    .line 25
    .line 26
    invoke-virtual {v5, p3, v3, p2, v4}, Ll/ppu0;->g(Lorg/json/JSONObject;Ljava/lang/String;Ll/q6w0;Ll/t6w0;)Ll/hpr;

    .line 27
    .line 28
    .line 29
    move-result-object v9

    .line 30
    const-string v3, "secondary_image"

    .line 31
    .line 32
    invoke-virtual {v5, p3, v3}, Ll/ppu0;->e(Lorg/json/JSONObject;Ljava/lang/String;)Ll/hpr;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "app_icon"

    .line 37
    .line 38
    invoke-virtual {v5, p3, v4}, Ll/ppu0;->e(Lorg/json/JSONObject;Ljava/lang/String;)Ll/hpr;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-string v6, "attribution"

    .line 43
    .line 44
    invoke-virtual {v5, p3, v6}, Ll/ppu0;->d(Lorg/json/JSONObject;Ljava/lang/String;)Ll/hpr;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 49
    .line 50
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 51
    .line 52
    iget-object v5, p0, Ll/wou0;->b:Ll/ppu0;

    .line 53
    .line 54
    invoke-virtual {v5, p3, p2, p1}, Ll/ppu0;->h(Lorg/json/JSONObject;Ll/q6w0;Ll/t6w0;)Ll/hpr;

    .line 55
    .line 56
    .line 57
    move-result-object v8

    .line 58
    const-string p1, "custom_assets"

    .line 59
    .line 60
    iget-object v0, p0, Ll/wou0;->c:Ll/upu0;

    .line 61
    .line 62
    invoke-virtual {v0, p3, p1}, Ll/upu0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ll/hpr;

    .line 63
    .line 64
    .line 65
    move-result-object v11

    .line 66
    const-string p1, "enable_omid"

    .line 67
    .line 68
    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/4 v0, 0x0

    .line 73
    if-nez p1, :cond_0

    .line 74
    .line 75
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    :goto_0
    move-object v10, p1

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    const-string p1, "omid_settings"

    .line 82
    .line 83
    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    if-nez p1, :cond_1

    .line 88
    .line 89
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    const-string v5, "omid_html"

    .line 95
    .line 96
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-eqz v5, :cond_2

    .line 105
    .line 106
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    goto :goto_0

    .line 111
    :cond_2
    iget-object v5, p0, Ll/wou0;->b:Ll/ppu0;

    .line 112
    .line 113
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v10, Ll/you0;

    .line 118
    .line 119
    invoke-direct {v10, v5, p1}, Ll/you0;-><init>(Ll/ppu0;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    sget-object p1, Ll/oct0;->e:Ll/xvw0;

    .line 123
    .line 124
    invoke-static {v0, v10, p1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    goto :goto_0

    .line 129
    :goto_1
    new-instance p1, Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    invoke-interface {p1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    invoke-interface {p1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    invoke-interface {p1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    sget-object v0, Ll/sgs0;->a5:Ll/dgs0;

    .line 159
    .line 160
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    invoke-virtual {v5, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Ljava/lang/Boolean;

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-nez v0, :cond_3

    .line 175
    .line 176
    invoke-interface {p1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    :cond_3
    invoke-static {p1}, Ll/pvw0;->a(Ljava/lang/Iterable;)Ll/ovw0;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    new-instance v0, Ll/vou0;

    .line 184
    .line 185
    move-object v7, p3

    .line 186
    move-object v5, v3

    .line 187
    move-object v3, v1

    .line 188
    move-object v1, p0

    .line 189
    invoke-direct/range {v0 .. v11}, Ll/vou0;-><init>(Ll/wou0;Ll/hpr;Ll/hpr;Ll/hpr;Ll/hpr;Ll/hpr;Lorg/json/JSONObject;Ll/hpr;Ll/hpr;Ll/hpr;Ll/hpr;)V

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Ll/wou0;->a:Ll/xvw0;

    .line 193
    .line 194
    invoke-virtual {p1, v0, p0}, Ll/ovw0;->a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    return-object p0
.end method
