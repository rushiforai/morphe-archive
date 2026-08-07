.class Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->initAudioDecoder()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/nio/ByteBuffer;IJ)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1300(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit16 v0, v0, 0x3e8

    .line 8
    .line 9
    int-to-long v0, v0

    .line 10
    cmp-long v0, p3, v0

    .line 11
    .line 12
    if-ltz v0, :cond_3

    .line 13
    .line 14
    if-lez p2, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1400(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1500(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    mul-int/lit16 v0, v0, 0x3e8

    .line 41
    .line 42
    int-to-long v0, v0

    .line 43
    cmp-long v0, p3, v0

    .line 44
    .line 45
    if-lez v0, :cond_1

    .line 46
    .line 47
    const-string v0, "AudioSpeedControlPlayer"

    .line 48
    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "Last audio packet pts:"

    .line 52
    .line 53
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1402(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;Z)Z

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1600(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1700(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1700(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-wide/16 v2, 0x5

    .line 94
    .line 95
    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 96
    .line 97
    .line 98
    monitor-exit v1

    .line 99
    goto :goto_0

    .line 100
    :catchall_0
    move-exception v0

    .line 101
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 103
    :catch_0
    :cond_2
    new-instance v2, Ll/ad60;

    .line 104
    .line 105
    invoke-direct {v2, p2}, Ll/ad60;-><init>(I)V

    .line 106
    .line 107
    .line 108
    const/4 v0, 0x0

    .line 109
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    .line 130
    const/4 v5, 0x0

    .line 131
    const/4 v8, 0x0

    .line 132
    const/4 v4, 0x0

    .line 133
    move v3, p2

    .line 134
    move-wide v6, p3

    .line 135
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1800(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/d;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    if-eqz p1, :cond_3

    .line 155
    .line 156
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 157
    .line 158
    invoke-static {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1800(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;)Lcom/immomo/moment/mediautils/d;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0, v2}, Lcom/immomo/moment/mediautils/d;->x(Ll/ad60;)V

    .line 163
    .line 164
    .line 165
    :cond_3
    :goto_1
    return-void
.end method

.method public onFinished()V
    .locals 2

    .line 1
    const-string v0, "AudioSpeedControlPlayer"

    .line 2
    .line 3
    const-string v1, "onFinished"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$c;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p0, v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->access$1902(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;Z)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
