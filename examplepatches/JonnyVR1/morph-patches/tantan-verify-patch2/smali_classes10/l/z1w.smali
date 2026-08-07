.class public Ll/z1w;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/data/Connector;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Connector;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "/live-metadata"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "roomId"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "sessionId"

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v1, "liveId"

    .line 20
    .line 21
    invoke-static {v1, p2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string v1, "enterSource"

    .line 26
    .line 27
    invoke-static {v1, p3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    const-string v1, "roomType"

    .line 32
    .line 33
    invoke-static {v1, p4}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    const-string v1, "liveMode"

    .line 38
    .line 39
    invoke-static {v1, p5}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 40
    .line 41
    .line 42
    move-result-object p5

    .line 43
    filled-new-array/range {p0 .. p5}, [Ll/st0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "anchorVerification"

    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/vrv;->h(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance p1, Ll/x1w;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/x1w;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public static d(Ll/r3w;)Lrx/c;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/r3w;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "/live-reconnect-report"

    .line 4
    .line 5
    invoke-static {v1}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "roomId"

    .line 10
    .line 11
    iget-object v3, v0, Ll/r3w;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const-string v2, "sessionId"

    .line 18
    .line 19
    iget-object v3, v0, Ll/r3w;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    const-string v2, "liveId"

    .line 26
    .line 27
    iget-object v3, v0, Ll/r3w;->e:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    iget v2, v0, Ll/r3w;->i:I

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "linkState"

    .line 40
    .line 41
    invoke-static {v3, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    const-string v2, "roomType"

    .line 46
    .line 47
    iget-object v3, v0, Ll/r3w;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    const-string v2, "liveMode"

    .line 54
    .line 55
    iget-object v3, v0, Ll/r3w;->c:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    iget-wide v2, v0, Ll/r3w;->j:J

    .line 62
    .line 63
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const-string v3, "firstLinkTime"

    .line 68
    .line 69
    invoke-static {v3, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    iget-wide v2, v0, Ll/r3w;->l:J

    .line 74
    .line 75
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v3, "interruptLinkTime"

    .line 80
    .line 81
    invoke-static {v3, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 82
    .line 83
    .line 84
    move-result-object v11

    .line 85
    invoke-static {}, Ll/pzi0;->o()J

    .line 86
    .line 87
    .line 88
    move-result-wide v2

    .line 89
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    const-string v3, "currentTime"

    .line 94
    .line 95
    invoke-static {v3, v2}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 96
    .line 97
    .line 98
    move-result-object v12

    .line 99
    const-string v2, "ipHost"

    .line 100
    .line 101
    iget-object v3, v0, Ll/r3w;->n:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 104
    .line 105
    .line 106
    move-result-object v13

    .line 107
    const-string v2, "netType"

    .line 108
    .line 109
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 114
    .line 115
    .line 116
    move-result-object v14

    .line 117
    const-string v2, "interruptLinkReason"

    .line 118
    .line 119
    iget-object v3, v0, Ll/r3w;->p:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v2, v3}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 122
    .line 123
    .line 124
    move-result-object v15

    .line 125
    iget v0, v0, Ll/r3w;->o:I

    .line 126
    .line 127
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const-string v2, "retryCount"

    .line 132
    .line 133
    invoke-static {v2, v0}, Ll/st0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/st0;

    .line 134
    .line 135
    .line 136
    move-result-object v16

    .line 137
    filled-new-array/range {v4 .. v16}, [Ll/st0;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->u(Ljava/lang/String;[Ll/st0;)Ll/rnl;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v1, "reportReconnect"

    .line 146
    .line 147
    invoke-static {v0, v1}, Ll/vrv;->h(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    new-instance v1, Ll/y1w;

    .line 152
    .line 153
    invoke-direct {v1}, Ll/y1w;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    return-object v0
.end method
