.class public final Ll/h3r0;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/h3r0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/h3r0;->b(Landroid/content/Context;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static b(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/h3r0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/h3r0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    int-to-long p0, p1

    .line 11
    invoke-virtual {v0, v1, p0, p1}, Ll/r5r0;->f(Ljava/lang/Runnable;J)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/guq0;->a()Ll/guq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/guq0;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/lrq0;->j(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    return v0

    .line 24
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 25
    return v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Ll/vxq0;->f()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    :try_start_1
    iget-object v0, p0, Ll/h3r0;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Ll/lrq0;->j(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/guq0;->a()Ll/guq0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/h3r0;->a:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v1}, Ll/l5r0;->c(Landroid/content/Context;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ll/guq0;->k(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_1
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :cond_0
    invoke-static {}, Lcom/apm/lite/nativecrash/NativeImpl;->u()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-static {}, Ll/k5r0;->c()Ll/k5r0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/ayq0;->d()Ljava/util/Map;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {}, Ll/vuq0;->i()Lorg/json/JSONArray;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v1, v2}, Ll/k5r0;->f(Ljava/util/Map;Lorg/json/JSONArray;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/r5r0;->a()Landroid/os/Handler;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/cyq0;->a()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    :goto_1
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/r5r0;->a()Landroid/os/Handler;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p0, p0, Ll/h3r0;->a:Landroid/content/Context;

    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/xxq0;->a(Landroid/os/Handler;Landroid/content/Context;)Ll/xxq0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ll/xxq0;->b()V

    .line 81
    .line 82
    .line 83
    goto :goto_3

    .line 84
    :goto_2
    :try_start_2
    invoke-static {v0}, Ll/q5r0;->g(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/k5r0;->c()Ll/k5r0;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Ll/ayq0;->d()Ljava/util/Map;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {}, Ll/vuq0;->i()Lorg/json/JSONArray;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v0, v1, v2}, Ll/k5r0;->f(Ljava/util/Map;Lorg/json/JSONArray;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/r5r0;->a()Landroid/os/Handler;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    invoke-static {}, Ll/cyq0;->a()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    if-eqz v0, :cond_1

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_1
    :goto_3
    return-void

    .line 124
    :catchall_2
    move-exception v0

    .line 125
    invoke-static {}, Ll/k5r0;->c()Ll/k5r0;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v2}, Ll/ayq0;->d()Ljava/util/Map;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-static {}, Ll/vuq0;->i()Lorg/json/JSONArray;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v1, v2, v3}, Ll/k5r0;->f(Ljava/util/Map;Lorg/json/JSONArray;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Ll/r5r0;->a()Landroid/os/Handler;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    if-eqz v1, :cond_2

    .line 153
    .line 154
    invoke-static {}, Ll/cyq0;->a()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    if-eqz v1, :cond_2

    .line 159
    .line 160
    invoke-static {}, Ll/c5r0;->b()Ll/r5r0;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ll/r5r0;->a()Landroid/os/Handler;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iget-object p0, p0, Ll/h3r0;->a:Landroid/content/Context;

    .line 169
    .line 170
    invoke-static {v1, p0}, Ll/xxq0;->a(Landroid/os/Handler;Landroid/content/Context;)Ll/xxq0;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0}, Ll/xxq0;->b()V

    .line 175
    .line 176
    .line 177
    :cond_2
    throw v0
.end method
