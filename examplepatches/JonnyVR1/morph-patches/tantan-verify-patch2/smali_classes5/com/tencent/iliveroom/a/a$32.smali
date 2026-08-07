.class Lcom/tencent/iliveroom/a/a$32;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setLocalMixConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "set local mix config:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v1, "null"

    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x1

    .line 28
    const-string v3, ""

    .line 29
    .line 30
    invoke-static {v2, v0, v3, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "TRTCAdapter: set local mix config:"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "TRTCAdapter-ext"

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    iget-object v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->mixUsers:Ljava/util/List;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/4 v4, 0x2

    .line 67
    if-ne v0, v4, :cond_5

    .line 68
    .line 69
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 72
    .line 73
    iget-wide v4, v0, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 74
    .line 75
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->mixUsers:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    if-eqz v6, :cond_2

    .line 88
    .line 89
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    check-cast v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;

    .line 94
    .line 95
    iget-wide v6, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->userId:J

    .line 96
    .line 97
    cmp-long v8, v6, v4

    .line 98
    .line 99
    if-eqz v8, :cond_1

    .line 100
    .line 101
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 102
    .line 103
    iput-wide v6, v0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 104
    .line 105
    :cond_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/c/a;->b()V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 113
    .line 114
    iget-wide v4, v0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 115
    .line 116
    const-wide/16 v6, -0x1

    .line 117
    .line 118
    cmp-long v0, v4, v6

    .line 119
    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    const-string v0, "TRTCAdapter: set local mix config success."

    .line 123
    .line 124
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 128
    .line 129
    iget-object v4, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 130
    .line 131
    invoke-static {v0, v4}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->a:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 135
    .line 136
    iget-boolean v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->onlyMixAudio:Z

    .line 137
    .line 138
    if-nez v0, :cond_3

    .line 139
    .line 140
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 141
    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    iget-object v4, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 148
    .line 149
    iget-wide v4, v4, Lcom/tencent/iliveroom/a/a;->i:J

    .line 150
    .line 151
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$32;->b:Lcom/tencent/iliveroom/a/a;

    .line 162
    .line 163
    invoke-static {v0, v1, v2, v2, p0}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_3
    const-string p0, "TRTCAdapter: set local mix config, is pure mode, not need set video render listener."

    .line 168
    .line 169
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_4
    const-string p0, "TRTCAdapter: set local mix config fail. can\'t find target user id."

    .line 174
    .line 175
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_5
    const-string p0, "TRTCAdapter: set local mix config fail."

    .line 180
    .line 181
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method
