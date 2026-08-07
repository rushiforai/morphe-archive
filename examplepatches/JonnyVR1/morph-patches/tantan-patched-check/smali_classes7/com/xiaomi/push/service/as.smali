.class Lcom/xiaomi/push/service/as;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static d:I = 0x493e0


# instance fields
.field private a:I

.field private a:J

.field private a:Lcom/xiaomi/push/service/XMPushService;

.field private b:I

.field private c:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 6
    .line 7
    iput v0, p0, Lcom/xiaomi/push/service/as;->c:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 10
    .line 11
    const/16 p1, 0x1f4

    .line 12
    .line 13
    iput p1, p0, Lcom/xiaomi/push/service/as;->a:I

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/xiaomi/push/service/as;->a:J

    .line 18
    .line 19
    return-void
.end method

.method private a()I
    .locals 9

    .line 139
    iget v0, p0, Lcom/xiaomi/push/service/as;->b:I

    const/16 v1, 0x8

    if-le v0, v1, :cond_0

    const p0, 0x493e0

    return p0

    .line 140
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double/2addr v0, v2

    .line 141
    iget v2, p0, Lcom/xiaomi/push/service/as;->b:I

    const/4 v3, 0x4

    if-le v2, v3, :cond_1

    const-wide v2, 0x40ed4c0000000000L    # 60000.0

    :goto_0
    mul-double/2addr v0, v2

    double-to-int p0, v0

    return p0

    :cond_1
    const/4 v4, 0x1

    if-le v2, v4, :cond_2

    const-wide v2, 0x40c3880000000000L    # 10000.0

    goto :goto_0

    .line 142
    :cond_2
    iget-wide v0, p0, Lcom/xiaomi/push/service/as;->a:J

    const-wide/16 v5, 0x0

    cmp-long v0, v0, v5

    const/4 v1, 0x0

    if-nez v0, :cond_3

    return v1

    .line 143
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 144
    iget-wide v7, p0, Lcom/xiaomi/push/service/as;->a:J

    sub-long/2addr v5, v7

    const-wide/32 v7, 0x4baf0

    cmp-long v0, v5, v7

    if-gez v0, :cond_6

    .line 145
    iget v0, p0, Lcom/xiaomi/push/service/as;->a:I

    sget v1, Lcom/xiaomi/push/service/as;->d:I

    if-lt v0, v1, :cond_4

    return v0

    .line 146
    :cond_4
    iget v2, p0, Lcom/xiaomi/push/service/as;->c:I

    add-int/2addr v2, v4

    iput v2, p0, Lcom/xiaomi/push/service/as;->c:I

    if-lt v2, v3, :cond_5

    return v1

    :cond_5
    int-to-double v1, v0

    const-wide/high16 v3, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v1, v3

    double-to-int v1, v1

    .line 147
    iput v1, p0, Lcom/xiaomi/push/service/as;->a:I

    return v0

    :cond_6
    const/16 v0, 0x3e8

    .line 148
    iput v0, p0, Lcom/xiaomi/push/service/as;->a:I

    .line 149
    iput v1, p0, Lcom/xiaomi/push/service/as;->c:I

    return v1
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/push/service/as;->a:J

    .line 137
    iget-object v0, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(I)V

    const/4 v0, 0x0

    .line 138
    iput v0, p0, Lcom/xiaomi/push/service/as;->b:I

    return-void
.end method

.method public a(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/xiaomi/push/service/XMPushService;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(I)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget p1, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 21
    .line 22
    add-int/2addr p1, v1

    .line 23
    iput p1, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Lcom/xiaomi/push/service/XMPushService;->a(I)V

    .line 28
    .line 29
    .line 30
    const-string p1, "ReconnectionManager"

    .line 31
    .line 32
    const-string v0, "-->tryReconnect(): exec ConnectJob"

    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/ouq0;->n(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 38
    .line 39
    new-instance p1, Lcom/xiaomi/push/service/XMPushService$e;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/xiaomi/push/service/XMPushService$e;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/XMPushService;->a(I)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-direct {p0}, Lcom/xiaomi/push/service/as;->a()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iget v0, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 63
    .line 64
    add-int/2addr v0, v1

    .line 65
    iput v0, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "schedule reconnect in "

    .line 70
    .line 71
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, "ms"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/xiaomi/push/service/as;->a:Lcom/xiaomi/push/service/XMPushService;

    .line 90
    .line 91
    new-instance v1, Lcom/xiaomi/push/service/XMPushService$e;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    invoke-direct {v1, v0}, Lcom/xiaomi/push/service/XMPushService$e;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    .line 97
    .line 98
    .line 99
    int-to-long v2, p1

    .line 100
    invoke-virtual {v0, v1, v2, v3}, Lcom/xiaomi/push/service/XMPushService;->a(Lcom/xiaomi/push/service/XMPushService$j;J)V

    .line 101
    .line 102
    .line 103
    iget p1, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 104
    .line 105
    const/4 v0, 0x2

    .line 106
    if-ne p1, v0, :cond_3

    .line 107
    .line 108
    invoke-static {}, Lcom/xiaomi/push/h;->f()Lcom/xiaomi/push/h;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lcom/xiaomi/push/h;->k()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_3

    .line 117
    .line 118
    invoke-static {}, Lcom/xiaomi/push/service/z;->b()V

    .line 119
    .line 120
    .line 121
    :cond_3
    iget p0, p0, Lcom/xiaomi/push/service/as;->b:I

    .line 122
    .line 123
    const/4 p1, 0x3

    .line 124
    if-ne p0, p1, :cond_4

    .line 125
    .line 126
    invoke-static {}, Lcom/xiaomi/push/service/z;->a()V

    .line 127
    .line 128
    .line 129
    :cond_4
    :goto_0
    return-void

    .line 130
    :cond_5
    const-string p0, "should not reconnect as no client or network."

    .line 131
    .line 132
    invoke-static {p0}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method
