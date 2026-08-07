.class public Ll/m90;
.super Ll/zh2;
.source "SourceFile"


# instance fields
.field public d:Z

.field public e:Z

.field public f:J

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/zh2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/m90;->f:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/m90;->h:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/m90;->d:Z

    .line 12
    .line 13
    iput-boolean p2, p0, Ll/m90;->e:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/util/List;Ll/pf60;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    iput-boolean p3, p0, Ll/m90;->h:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ll/m90;->d:Z

    .line 5
    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/m90;->e:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, v0, -0x1

    .line 21
    .line 22
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    :goto_0
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 33
    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    iget-wide v4, p0, Ll/m90;->f:J

    .line 45
    .line 46
    sub-long/2addr v2, v4

    .line 47
    const-wide/16 v4, 0x1388

    .line 48
    .line 49
    cmp-long v2, v2, v4

    .line 50
    .line 51
    if-gez v2, :cond_2

    .line 52
    .line 53
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 60
    .line 61
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_2

    .line 70
    .line 71
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 78
    .line 79
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-nez v2, :cond_2

    .line 88
    .line 89
    iget v2, p0, Ll/m90;->g:I

    .line 90
    .line 91
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v3}, Ll/vwt;->l5()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-ge v2, v3, :cond_2

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->msgName:Ljava/lang/String;

    .line 104
    .line 105
    const-string v2, "live.room.enter"

    .line 106
    .line 107
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->msgName:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 124
    .line 125
    .line 126
    move-result-wide v1

    .line 127
    iput-wide v1, p0, Ll/m90;->f:J

    .line 128
    .line 129
    const/4 p3, 0x1

    .line 130
    sub-int/2addr v0, p3

    .line 131
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 140
    .line 141
    .line 142
    invoke-interface {p2, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    iget p1, p0, Ll/m90;->g:I

    .line 146
    .line 147
    add-int/2addr p1, p3

    .line 148
    iput p1, p0, Ll/m90;->g:I

    .line 149
    .line 150
    iput-boolean p3, p0, Ll/m90;->h:Z

    .line 151
    .line 152
    return-object p2

    .line 153
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 154
    .line 155
    .line 156
    move-result-wide v0

    .line 157
    iput-wide v0, p0, Ll/m90;->f:J

    .line 158
    .line 159
    iput p3, p0, Ll/m90;->g:I

    .line 160
    .line 161
    :cond_3
    :goto_1
    return-object p2
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/m90;->h:Z

    .line 2
    .line 3
    return p0
.end method
