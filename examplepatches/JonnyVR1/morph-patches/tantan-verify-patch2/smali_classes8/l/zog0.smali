.class public final Ll/zog0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/i0h0;

.field public final synthetic b:Ll/ukg0;

.field public final synthetic c:Ll/xug0;


# direct methods
.method public constructor <init>(Ll/xug0;Ll/i0h0;Ll/ukg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zog0;->c:Ll/xug0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zog0;->a:Ll/i0h0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zog0;->b:Ll/ukg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/zog0;->c:Ll/xug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/xug0;->f:Ll/uyg0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/zog0;->a:Ll/i0h0;

    .line 6
    .line 7
    iget v2, v1, Ll/i0h0;->a:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    sput-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 14
    .line 15
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 16
    .line 17
    iget-object v2, v1, Ll/gvg0;->a:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v2, v0, Ll/uyg0;->i:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, v1, Ll/gvg0;->d:Ll/rhg0;

    .line 22
    .line 23
    iget-object v2, v1, Ll/rhg0;->a:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v2, v0, Ll/uyg0;->d:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, v1, Ll/rhg0;->b:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v2, v0, Ll/uyg0;->e:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, v1, Ll/rhg0;->d:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, v0, Ll/uyg0;->g:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v1, v1, Ll/rhg0;->c:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Ll/uyg0;->h:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, v0, Ll/uyg0;->a:Z

    .line 41
    .line 42
    monitor-enter v0

    .line 43
    :try_start_0
    iget-object v1, v0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 44
    .line 45
    if-nez v1, :cond_0

    .line 46
    .line 47
    const-string v1, "HttpService"

    .line 48
    .line 49
    const-string v2, "error notifyInitSdkSuccess but listenerList is null"

    .line 50
    .line 51
    invoke-static {v1, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    monitor-exit v0

    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    move v5, v4

    .line 64
    :goto_0
    if-ge v5, v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    add-int/lit8 v5, v5, 0x1

    .line 71
    .line 72
    check-cast v6, Ltech/sud/gip/core/ISudListenerInitSDK;

    .line 73
    .line 74
    invoke-interface {v6}, Ltech/sud/gip/core/ISudListenerInitSDK;->onSuccess()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    iput-object v3, v0, Ll/uyg0;->k:Ljava/util/ArrayList;

    .line 79
    .line 80
    iget-object v1, v0, Ll/uyg0;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 81
    .line 82
    invoke-virtual {v1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 83
    .line 84
    .line 85
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    goto :goto_2

    .line 87
    :goto_1
    monitor-exit v0

    .line 88
    throw p0

    .line 89
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    new-instance v5, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v6, "getSDKToken fail appId="

    .line 94
    .line 95
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-object v6, Ll/utg0;->g:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    new-instance v5, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v6, " isTestEnv="

    .line 113
    .line 114
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-boolean v6, Ll/utg0;->c:Z

    .line 118
    .line 119
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v5, " "

    .line 130
    .line 131
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    new-instance v5, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v6, " ret_code="

    .line 137
    .line 138
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget v6, v1, Ll/i0h0;->a:I

    .line 142
    .line 143
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-object v5, v1, Ll/i0h0;->b:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz v5, :cond_3

    .line 156
    .line 157
    const-string v5, " "

    .line 158
    .line 159
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget-object v5, v1, Ll/i0h0;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    :cond_3
    iget v1, v1, Ll/i0h0;->a:I

    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {v0, v1, v2}, Ll/uyg0;->g(ILjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :goto_2
    iput-object v3, v0, Ll/uyg0;->m:Ll/bpg0;

    .line 177
    .line 178
    iget-object p0, p0, Ll/zog0;->b:Ll/ukg0;

    .line 179
    .line 180
    sget-object v0, Ll/fug0;->a:Ljava/lang/String;

    .line 181
    .line 182
    iget-object v0, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 183
    .line 184
    iget v1, p0, Ll/ukg0;->e:I

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    new-instance v2, Ll/nog0;

    .line 191
    .line 192
    invoke-direct {v2, p0, v4, v0, v1}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 193
    .line 194
    .line 195
    invoke-static {v2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method
