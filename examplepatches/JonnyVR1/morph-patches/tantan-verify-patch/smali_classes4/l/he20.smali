.class public abstract Ll/he20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k5f;


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


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


# virtual methods
.method public a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 5

    .line 1
    const-string v0, "Crash time"

    .line 2
    .line 3
    const-string v1, "logcat"

    .line 4
    .line 5
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 6
    .line 7
    new-instance v3, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getCacheDir()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v4, "/"

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getSubEventType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v4, ".dmp"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v2}, Lcom/tantanapp/beatles/nativecore/NativeLogParser;->c(Ljava/io/File;)Ljava/util/Map;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iput-object v2, p0, Ll/he20;->a:Ljava/util/Map;

    .line 48
    .line 49
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v1, v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v1, "meminfo"

    .line 59
    .line 60
    iget-object v2, p0, Ll/he20;->a:Ljava/util/Map;

    .line 61
    .line 62
    const-string v3, "memory info"

    .line 63
    .line 64
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, v1, v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/he20;->a:Ljava/util/Map;

    .line 74
    .line 75
    const-string v2, "pid"

    .line 76
    .line 77
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Ljava/lang/String;

    .line 82
    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v3, ""

    .line 96
    .line 97
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    const-string v3, "currentProcessId"

    .line 105
    .line 106
    invoke-virtual {p1, v3, v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    if-eqz v1, :cond_0

    .line 110
    .line 111
    const-string v3, "crashProcessId"

    .line 112
    .line 113
    invoke-virtual {p1, v3, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const-string v3, "lastProcessId"

    .line 117
    .line 118
    invoke-static {}, Ll/du2;->k()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {p1, v3, v4}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string v3, "lastPage"

    .line 126
    .line 127
    invoke-static {}, Ll/du2;->j()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {p1, v3, v4}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-nez v2, :cond_0

    .line 139
    .line 140
    invoke-virtual {p0, v1, p1}, Ll/he20;->b(Ljava/lang/String;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 141
    .line 142
    .line 143
    :cond_0
    iget-object v1, p0, Ll/he20;->a:Ljava/util/Map;

    .line 144
    .line 145
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    check-cast v1, Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-nez v2, :cond_1

    .line 156
    .line 157
    invoke-static {v1}, Lcom/tantanapp/beatles/nativecore/NativeLogParser;->b(Ljava/lang/String;)J

    .line 158
    .line 159
    .line 160
    move-result-wide v1

    .line 161
    invoke-static {v1, v2}, Ll/p8c;->e(J)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {p1, v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setClientTime(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    :cond_1
    iget-object p0, p0, Ll/he20;->a:Ljava/util/Map;

    .line 169
    .line 170
    const-string v1, "App version"

    .line 171
    .line 172
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    check-cast p0, Ljava/lang/String;

    .line 177
    .line 178
    const-string v1, "Start time"

    .line 179
    .line 180
    invoke-static {v1, v0}, Lcom/tantanapp/beatles/nativecore/NativeLogParser;->a(Ljava/lang/String;Ljava/lang/String;)J

    .line 181
    .line 182
    .line 183
    move-result-wide v0

    .line 184
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getApp()Lcom/tantanapp/beatles/v2/data/App;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    if-nez p1, :cond_2

    .line 189
    .line 190
    new-instance p1, Lcom/tantanapp/beatles/v2/data/App;

    .line 191
    .line 192
    invoke-direct {p1}, Lcom/tantanapp/beatles/v2/data/App;-><init>()V

    .line 193
    .line 194
    .line 195
    :cond_2
    const-wide/16 v2, -0x1

    .line 196
    .line 197
    cmp-long v2, v0, v2

    .line 198
    .line 199
    if-eqz v2, :cond_3

    .line 200
    .line 201
    invoke-virtual {p1, v0, v1}, Lcom/tantanapp/beatles/v2/data/App;->setUpDuration(J)V

    .line 202
    .line 203
    .line 204
    :cond_3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-nez v0, :cond_4

    .line 209
    .line 210
    invoke-virtual {p1, p0}, Lcom/tantanapp/beatles/v2/data/App;->setAppVersion(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .line 212
    .line 213
    :catch_0
    :cond_4
    return-void
.end method

.method public final b(Ljava/lang/String;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/du2;->k()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/du2;->j()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->setTransaction(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
