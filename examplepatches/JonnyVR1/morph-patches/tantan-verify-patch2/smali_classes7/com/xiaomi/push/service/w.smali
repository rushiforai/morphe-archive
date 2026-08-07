.class final Lcom/xiaomi/push/service/w;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 2

    .line 139
    new-instance v0, Lcom/xiaomi/push/he;

    invoke-direct {v0}, Lcom/xiaomi/push/he;-><init>()V

    .line 140
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 141
    const-string v1, "package uninstalled"

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 142
    invoke-static {}, Ll/g2r0;->k()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    const/4 v1, 0x0

    .line 143
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->a(Z)Lcom/xiaomi/push/he;

    .line 144
    sget-object v1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    invoke-static {p0, p1, v0, v1}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            ")",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 126
    invoke-static {p0, p1, p2, p3, v0}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hb;

    move-result-object p0

    return-object p0
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hb;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            "Z)",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    .line 127
    invoke-static {p2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    move-result-object p2

    .line 128
    new-instance v0, Lcom/xiaomi/push/hb;

    invoke-direct {v0}, Lcom/xiaomi/push/hb;-><init>()V

    .line 129
    new-instance v1, Lcom/xiaomi/push/gu;

    invoke-direct {v1}, Lcom/xiaomi/push/gu;-><init>()V

    const-wide/16 v2, 0x5

    .line 130
    iput-wide v2, v1, Lcom/xiaomi/push/gu;->a:J

    .line 131
    const-string v2, "fakeid"

    iput-object v2, v1, Lcom/xiaomi/push/gu;->a:Ljava/lang/String;

    .line 132
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gu;)Lcom/xiaomi/push/hb;

    .line 133
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/xiaomi/push/hb;->a(Ljava/nio/ByteBuffer;)Lcom/xiaomi/push/hb;

    .line 134
    invoke-virtual {v0, p3}, Lcom/xiaomi/push/hb;->a(Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 135
    invoke-virtual {v0, p4}, Lcom/xiaomi/push/hb;->b(Z)Lcom/xiaomi/push/hb;

    .line 136
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/hb;->b(Ljava/lang/String;)Lcom/xiaomi/push/hb;

    const/4 p0, 0x0

    .line 137
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/hb;->a(Z)Lcom/xiaomi/push/hb;

    .line 138
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/hb;->a(Ljava/lang/String;)Lcom/xiaomi/push/hb;

    return-object v0
.end method

.method private static a(Lcom/xiaomi/push/hb;)Ljava/lang/String;
    .locals 2

    .line 111
    iget-object v0, p0, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gs;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/xiaomi/push/gs;->b:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 112
    const-string v1, "ext_traffic_source_pkg"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 113
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    .line 114
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".permission.MIPUSH_RECEIVE"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;[B)Ll/w0r0;
    .locals 1

    .line 122
    new-instance v0, Lcom/xiaomi/push/hb;

    invoke-direct {v0}, Lcom/xiaomi/push/hb;-><init>()V

    .line 123
    :try_start_0
    invoke-static {v0, p1}, Lcom/xiaomi/push/m;->d(Lcom/xiaomi/push/hq;[B)V

    .line 124
    invoke-static {p0}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    move-result-object p1

    invoke-static {p1, p0, v0}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/p;Landroid/content/Context;Lcom/xiaomi/push/hb;)Ll/w0r0;

    move-result-object p0
    :try_end_0
    .catch Lcom/xiaomi/push/hu; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 125
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Lcom/xiaomi/push/service/p;Landroid/content/Context;Lcom/xiaomi/push/hb;)Ll/w0r0;
    .locals 5

    .line 1
    const-string p1, "try send mi push message. packagename:"

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Ll/w0r0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    invoke-virtual {v0, v1}, Ll/w0r0;->h(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/hb;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/w0r0;->v(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "SECMSG"

    .line 25
    .line 26
    const-string v2, "message"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/xiaomi/push/service/p;->a:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v2, p2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 34
    .line 35
    const-string v3, "@"

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, v2, Lcom/xiaomi/push/gu;->a:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v2, p2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gu;

    .line 49
    .line 50
    const-string v3, "/"

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    const/4 v4, 0x1

    .line 57
    add-int/2addr v3, v4

    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v2, Lcom/xiaomi/push/gu;->c:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object p0, p0, Lcom/xiaomi/push/service/p;->c:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1, p0}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v4}, Ll/w0r0;->m(S)V

    .line 74
    .line 75
    .line 76
    new-instance p0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p2, Lcom/xiaomi/push/hb;->b:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p1, " action:"

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object p1, p2, Lcom/xiaomi/push/hb;->a:Lcom/xiaomi/push/gf;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    return-object v0

    .line 104
    :catch_0
    move-exception p0

    .line 105
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    return-object p0
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;)V
    .locals 4

    .line 115
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    move-result-object v1

    .line 117
    invoke-virtual {v1, p0}, Lcom/xiaomi/push/service/p;->a(Lcom/xiaomi/push/service/XMPushService;)Lcom/xiaomi/push/service/am$b;

    move-result-object v1

    .line 118
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "prepare account. "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 119
    invoke-static {p0, v1}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/am$b;)V

    .line 120
    invoke-static {}, Lcom/xiaomi/push/service/am;->a()Lcom/xiaomi/push/service/am;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/xiaomi/push/service/am;->a(Lcom/xiaomi/push/service/am$b;)V

    const v1, 0x2a300

    .line 121
    invoke-static {p0, v0, v1}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/p;I)V

    :cond_0
    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/hb;)V
    .locals 3

    .line 155
    invoke-virtual {p1}, Lcom/xiaomi/push/hb;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, -0x1

    .line 156
    invoke-static {v0, v1, p1, v2}, Ll/jxq0;->e(Ljava/lang/String;Landroid/content/Context;Lcom/xiaomi/push/hb;I)V

    .line 157
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->a()Ll/u1r0;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 158
    invoke-virtual {v0}, Ll/u1r0;->q()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 159
    invoke-static {p0}, Lcom/xiaomi/push/service/q;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/p;

    move-result-object v1

    .line 160
    invoke-static {v1, p0, p1}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/p;Landroid/content/Context;Lcom/xiaomi/push/hb;)Ll/w0r0;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 161
    invoke-virtual {v0, p0}, Ll/u1r0;->w(Ll/w0r0;)V

    :cond_0
    return-void

    .line 162
    :cond_1
    new-instance p0, Lcom/xiaomi/push/fi;

    const-string p1, "Don\'t support XMPP connection."

    invoke-direct {p0, p1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    throw p0

    .line 163
    :cond_2
    new-instance p0, Lcom/xiaomi/push/fi;

    const-string p1, "try send msg while connection is null."

    invoke-direct {p0, p1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/am$b;)V
    .locals 1

    const/4 v0, 0x0

    .line 145
    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/am$b;->a(Landroid/os/Messenger;)V

    .line 146
    new-instance v0, Lcom/xiaomi/push/service/w$2;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/w$2;-><init>(Lcom/xiaomi/push/service/XMPushService;)V

    invoke-virtual {p1, v0}, Lcom/xiaomi/push/service/am$b;->a(Lcom/xiaomi/push/service/am$b$a;)V

    return-void
.end method

.method private static a(Lcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/p;I)V
    .locals 7

    .line 110
    invoke-static {p0}, Lcom/xiaomi/push/service/ay;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/ay;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/service/w$1;

    const-string v2, "MSAID"

    int-to-long v3, p2

    move-object v5, p0

    move-object v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/service/w$1;-><init>(Ljava/lang/String;JLcom/xiaomi/push/service/XMPushService;Lcom/xiaomi/push/service/p;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/ay;->a(Lcom/xiaomi/push/service/ay$a;)V

    return-void
.end method

.method public static a(Lcom/xiaomi/push/service/XMPushService;Ljava/lang/String;[B)V
    .locals 2

    .line 147
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0, p2}, Ll/jxq0;->g(Ljava/lang/String;Landroid/content/Context;[B)V

    .line 148
    invoke-virtual {p0}, Lcom/xiaomi/push/service/XMPushService;->a()Ll/u1r0;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 149
    invoke-virtual {v0}, Ll/u1r0;->q()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    invoke-static {p0, p2}, Lcom/xiaomi/push/service/w;->a(Lcom/xiaomi/push/service/XMPushService;[B)Ll/w0r0;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 151
    invoke-virtual {v0, v1}, Ll/u1r0;->w(Ll/w0r0;)V

    return-void

    :cond_0
    const v0, 0x42c1d83

    .line 152
    const-string v1, "not a valid message"

    invoke-static {p0, p1, p2, v0, v1}, Lcom/xiaomi/push/service/t;->a(Landroid/content/Context;Ljava/lang/String;[BILjava/lang/String;)V

    return-void

    .line 153
    :cond_1
    new-instance p0, Lcom/xiaomi/push/fi;

    const-string p1, "Don\'t support XMPP connection."

    invoke-direct {p0, p1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    throw p0

    .line 154
    :cond_2
    new-instance p0, Lcom/xiaomi/push/fi;

    const-string p1, "try send msg while connection is null."

    invoke-direct {p0, p1}, Lcom/xiaomi/push/fi;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lcom/xiaomi/push/hb;
    .locals 2

    .line 1
    new-instance v0, Lcom/xiaomi/push/he;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/he;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/xiaomi/push/he;->b(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 7
    .line 8
    .line 9
    sget-object v1, Lcom/xiaomi/push/gp;->ac:Lcom/xiaomi/push/gp;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/xiaomi/push/gp;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->c(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/xiaomi/push/service/aj;->a()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->a(Ljava/lang/String;)Lcom/xiaomi/push/he;

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/he;->a(Z)Lcom/xiaomi/push/he;

    .line 25
    .line 26
    .line 27
    sget-object v1, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 28
    .line 29
    invoke-static {p0, p1, v0, v1}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;)Lcom/xiaomi/push/hb;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/xiaomi/push/hq<",
            "TT;*>;>(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/xiaomi/push/gf;",
            ")",
            "Lcom/xiaomi/push/hb;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 34
    invoke-static {p0, p1, p2, p3, v0}, Lcom/xiaomi/push/service/w;->a(Ljava/lang/String;Ljava/lang/String;Lcom/xiaomi/push/hq;Lcom/xiaomi/push/gf;Z)Lcom/xiaomi/push/hb;

    move-result-object p0

    return-object p0
.end method
