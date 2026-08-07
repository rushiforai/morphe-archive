.class public Lcom/cmic/sso/sdk/e/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ljava/lang/String; = null

.field private static b:Ljava/lang/String; = null

.field private static c:J = 0x0L

.field private static d:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private static a(Ljava/lang/String;)I
    .locals 2

    .line 151
    sget-object v0, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    sget-object v0, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    goto :goto_0

    .line 153
    :cond_0
    const-string v0, "pre_sim_key"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    sput-object v0, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    .line 155
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p0, 0x0

    return p0

    .line 156
    :cond_1
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x2

    return p0
.end method

.method public static a()J
    .locals 9

    .line 143
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 144
    sget-object v2, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-wide/16 v3, 0x2710

    const-wide/16 v5, 0x0

    if-nez v2, :cond_0

    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v7, Lcom/cmic/sso/sdk/e/h;->c:J

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v7, "PhoneScripUtils"

    invoke-static {v7, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    sget-wide v7, Lcom/cmic/sso/sdk/e/h;->c:J

    :goto_0
    sub-long/2addr v7, v0

    sub-long/2addr v7, v3

    goto :goto_1

    .line 147
    :cond_0
    const-string v2, "phonescripcache"

    const-string v7, ""

    invoke-static {v2, v7}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 148
    const-string v7, "phonescripstarttime"

    invoke-static {v7, v5, v6}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;J)J

    move-result-wide v7

    .line 149
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    move-wide v7, v5

    :goto_1
    const-wide/16 v0, 0x3e8

    .line 150
    div-long/2addr v7, v0

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    .line 131
    sget-object v0, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    const-string v0, "phonescripcache"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 133
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 134
    const-string p0, "PhoneScripUtils"

    const-string v0, "null"

    invoke-static {p0, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    .line 135
    :cond_0
    const-string v2, "phonescripstarttime"

    const-wide/16 v3, 0x0

    invoke-static {v2, v3, v4}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;J)J

    move-result-wide v2

    sput-wide v2, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 136
    const-string v2, "pre_sim_key"

    invoke-static {v2, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    .line 137
    const-string v1, "phonescripversion"

    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;I)I

    move-result v1

    sput v1, Lcom/cmic/sso/sdk/e/h;->d:I

    .line 138
    invoke-static {p0, v0}, Lcom/cmic/sso/sdk/e/b;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    return-object p0

    .line 139
    :cond_1
    sget-object p0, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 130
    invoke-static {p0, p1, p2, p3, p4}, Lcom/cmic/sso/sdk/e/h;->b(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    cmp-long v0, p2, v0

    .line 16
    .line 17
    if-lez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "save phone scrip simKey = "

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "PhoneScripUtils"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sput-object p1, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    const-wide/16 v2, 0x3e8

    .line 45
    .line 46
    mul-long/2addr p2, v2

    .line 47
    add-long/2addr v0, p2

    .line 48
    sput-wide v0, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    sget-wide v1, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, ""

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v1, "sLifeTime"

    .line 70
    .line 71
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    sput-object p4, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    .line 75
    .line 76
    const/4 v0, 0x2

    .line 77
    sput v0, Lcom/cmic/sso/sdk/e/h;->d:I

    .line 78
    .line 79
    const-string v0, "operator"

    .line 80
    .line 81
    invoke-virtual {v0, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p5

    .line 85
    if-nez p5, :cond_0

    .line 86
    .line 87
    new-instance p2, Lcom/cmic/sso/sdk/e/h$1;

    .line 88
    .line 89
    invoke-direct {p2, p0, p1, p4}, Lcom/cmic/sso/sdk/e/h$1;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p2}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_0
    const-wide/32 p0, 0x36ee80

    .line 97
    .line 98
    .line 99
    cmp-long p4, p2, p0

    .line 100
    .line 101
    if-lez p4, :cond_1

    .line 102
    .line 103
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 104
    .line 105
    .line 106
    move-result-wide p2

    .line 107
    add-long/2addr p2, p0

    .line 108
    sput-wide p2, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 112
    .line 113
    .line 114
    move-result-wide p0

    .line 115
    add-long/2addr p0, p2

    .line 116
    sput-wide p0, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 117
    .line 118
    :cond_2
    return-void
.end method

.method public static a(ZZ)V
    .locals 2

    .line 119
    invoke-static {}, Lcom/cmic/sso/sdk/e/k;->a()Lcom/cmic/sso/sdk/e/k$a;

    move-result-object v0

    .line 120
    const-string v1, "phonescripstarttime"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 121
    const-string v1, "phonescripcache"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 122
    const-string v1, "pre_sim_key"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 123
    const-string v1, "phonescripversion"

    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 124
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/e/k$a;->a()V

    goto :goto_0

    .line 125
    :cond_0
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/e/k$a;->b()V

    :goto_0
    if-eqz p0, :cond_1

    const/4 p0, 0x0

    .line 126
    sput-object p0, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    .line 127
    sput-object p0, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    const-wide/16 p0, 0x0

    .line 128
    sput-wide p0, Lcom/cmic/sso/sdk/e/h;->c:J

    const/4 p0, -0x1

    .line 129
    sput p0, Lcom/cmic/sso/sdk/e/h;->d:I

    :cond_1
    return-void
.end method

.method private static a(J)Z
    .locals 5

    .line 140
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 141
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "PhoneScripUtils"

    invoke-static {v4, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    sub-long/2addr p0, v0

    const-wide/16 v0, 0x2710

    cmp-long p0, p0, v0

    if-lez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Lcom/cmic/sso/sdk/a;)Z
    .locals 5

    .line 157
    const-string v0, "scripKey"

    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/cmic/sso/sdk/e/h;->a(Ljava/lang/String;)I

    move-result v0

    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "imsiState"

    invoke-virtual {p0, v2, v1}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "simState = "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "PhoneScripUtils"

    invoke-static {v1, p0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    if-nez v0, :cond_0

    return p0

    .line 160
    :cond_0
    sget v2, Lcom/cmic/sso/sdk/e/h;->d:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 161
    const-string v2, "phonescripversion"

    invoke-static {v2, v3}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;I)I

    move-result v2

    sput v2, Lcom/cmic/sso/sdk/e/h;->d:I

    .line 162
    :cond_1
    sget v2, Lcom/cmic/sso/sdk/e/h;->d:I

    const/4 v3, 0x1

    const/4 v4, 0x2

    if-eq v2, v4, :cond_2

    .line 163
    invoke-static {v3, p0}, Lcom/cmic/sso/sdk/e/h;->a(ZZ)V

    .line 164
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->a()V

    .line 165
    const-string v0, "phoneScriptVersion change"

    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    return p0

    :cond_2
    if-ne v0, v4, :cond_3

    .line 166
    invoke-static {v3, p0}, Lcom/cmic/sso/sdk/e/h;->a(ZZ)V

    return p0

    .line 167
    :cond_3
    invoke-static {}, Lcom/cmic/sso/sdk/e/h;->c()Z

    move-result p0

    return p0
.end method

.method public static synthetic b()J
    .locals 2

    .line 40
    sget-wide v0, Lcom/cmic/sso/sdk/e/h;->c:J

    return-wide v0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lcom/cmic/sso/sdk/e/b;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/cmic/sso/sdk/e/k;->a()Lcom/cmic/sso/sdk/e/k$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "phonescripcache"

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "phonescripstarttime"

    .line 21
    .line 22
    invoke-virtual {p1, p0, p2, p3}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;J)V

    .line 23
    .line 24
    .line 25
    const-string p0, "phonescripversion"

    .line 26
    .line 27
    const/4 p2, 0x2

    .line 28
    invoke-virtual {p1, p0, p2}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    const-string p0, "pre_sim_key"

    .line 32
    .line 33
    invoke-virtual {p1, p0, p4}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/cmic/sso/sdk/e/k$a;->b()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method private static c()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/cmic/sso/sdk/e/h;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/cmic/sso/sdk/e/h;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    sget-wide v1, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "PhoneScripUtils"

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-wide v0, Lcom/cmic/sso/sdk/e/h;->c:J

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/h;->a(J)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    return v0

    .line 45
    :cond_0
    const-string v0, "phonescripcache"

    .line 46
    .line 47
    const-string v1, ""

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "phonescripstarttime"

    .line 54
    .line 55
    const-wide/16 v2, 0x0

    .line 56
    .line 57
    invoke-static {v1, v2, v3}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;J)J

    .line 58
    .line 59
    .line 60
    move-result-wide v1

    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_1

    .line 66
    .line 67
    invoke-static {v1, v2}, Lcom/cmic/sso/sdk/e/h;->a(J)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    return v0

    .line 75
    :cond_1
    const/4 v0, 0x0

    .line 76
    return v0
.end method
