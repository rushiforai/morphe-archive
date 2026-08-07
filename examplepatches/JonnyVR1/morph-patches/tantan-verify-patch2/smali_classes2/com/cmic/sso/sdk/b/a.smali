.class public Lcom/cmic/sso/sdk/b/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/b/a$a;
    }
.end annotation


# static fields
.field private static a:Lcom/cmic/sso/sdk/b/a;

.field private static b:J


# instance fields
.field private c:Lcom/cmic/sso/sdk/b/a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 6
    .line 7
    return-void
.end method

.method public static a()Lcom/cmic/sso/sdk/b/a;
    .locals 1

    .line 198
    sget-object v0, Lcom/cmic/sso/sdk/b/a;->a:Lcom/cmic/sso/sdk/b/a;

    if-nez v0, :cond_0

    .line 199
    new-instance v0, Lcom/cmic/sso/sdk/b/a;

    invoke-direct {v0}, Lcom/cmic/sso/sdk/b/a;-><init>()V

    sput-object v0, Lcom/cmic/sso/sdk/b/a;->a:Lcom/cmic/sso/sdk/b/a;

    .line 200
    :cond_0
    sget-object v0, Lcom/cmic/sso/sdk/b/a;->a:Lcom/cmic/sso/sdk/b/a;

    return-object v0
.end method

.method private a(Landroid/content/Context;)V
    .locals 6

    .line 1
    const-string v0, "UMCTelephonyManagement"

    .line 2
    .line 3
    const-string v1, "\u53cd\u5c04getDefaultDataSubscriptionId\u9002\u914d\u6210\u529f: dataSubId = "

    .line 4
    .line 5
    const-string v2, "android 7.0\u4ee5\u4e0b\u624b\u673agetDefaultDataSubId\u9002\u914d\u6210\u529f: dataSubId = "

    .line 6
    .line 7
    const-string v3, "android 7.0\u53ca\u4ee5\u4e0a\u624b\u673agetDefaultDataSubscriptionId\u9002\u914d\u6210\u529f: dataSubId = "

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_4

    .line 18
    .line 19
    :try_start_0
    iget-object v4, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 20
    .line 21
    invoke-static {v4}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    const/4 v5, -0x1

    .line 26
    if-ne v4, v5, :cond_0

    .line 27
    .line 28
    iget-object v4, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 29
    .line 30
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubscriptionId()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    invoke-static {v4, v5}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 35
    .line 36
    .line 37
    new-instance v4, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-static {v0, v3}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    const-string v3, "android 7.0\u53ca\u4ee5\u4e0a\u624b\u673agetDefaultDataSubscriptionId\u9002\u914d\u5931\u8d25"

    .line 60
    .line 61
    invoke-static {v0, v3}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    const/4 v3, 0x0

    .line 65
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const-string v5, "getDefaultDataSubId"

    .line 70
    .line 71
    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v4, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    instance-of v5, v4, Ljava/lang/Integer;

    .line 80
    .line 81
    if-nez v5, :cond_1

    .line 82
    .line 83
    instance-of v5, v4, Ljava/lang/Long;

    .line 84
    .line 85
    if-eqz v5, :cond_2

    .line 86
    .line 87
    :cond_1
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 88
    .line 89
    check-cast v4, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-static {v5, v4}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 96
    .line 97
    .line 98
    new-instance v4, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 104
    .line 105
    invoke-static {v2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v0, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catch_1
    const-string v2, "readDefaultDataSubId-->getDefaultDataSubId \u53cd\u5c04\u51fa\u9519"

    .line 121
    .line 122
    invoke-static {v0, v2}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    const-string v4, "getDefaultDataSubscriptionId"

    .line 130
    .line 131
    invoke-virtual {v2, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    instance-of v2, p1, Ljava/lang/Integer;

    .line 140
    .line 141
    if-nez v2, :cond_3

    .line 142
    .line 143
    instance-of v2, p1, Ljava/lang/Long;

    .line 144
    .line 145
    if-eqz v2, :cond_4

    .line 146
    .line 147
    :cond_3
    iget-object v2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 148
    .line 149
    check-cast p1, Ljava/lang/Integer;

    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    invoke-static {v2, p1}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 156
    .line 157
    .line 158
    new-instance p1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 164
    .line 165
    invoke-static {p0}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :catch_2
    const-string p0, "getDefaultDataSubscriptionId-->getDefaultDataSubscriptionId \u53cd\u5c04\u51fa\u9519"

    .line 181
    .line 182
    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    :goto_0
    return-void
.end method

.method private b(Landroid/content/Context;)V
    .locals 10

    .line 1
    const-string v0, "sim_id"

    .line 2
    .line 3
    const-string v1, "_id"

    .line 4
    .line 5
    const-string v2, "readSimInfoDbStart"

    .line 6
    .line 7
    const-string v3, "UMCTelephonyManagement"

    .line 8
    .line 9
    invoke-static {v3, v2}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "content://telephony/siminfo"

    .line 13
    .line 14
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const/4 p1, 0x0

    .line 23
    :try_start_0
    filled-new-array {v1, v0}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    const-string v7, "sim_id>=?"

    .line 28
    .line 29
    const-string v2, "0"

    .line 30
    .line 31
    filled-new-array {v2}, [Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    const/4 v9, 0x0

    .line 36
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 65
    .line 66
    invoke-static {v5}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    const/4 v6, -0x1

    .line 71
    if-ne v5, v6, :cond_1

    .line 72
    .line 73
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 74
    .line 75
    invoke-static {v5}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    if-eq v5, v6, :cond_1

    .line 80
    .line 81
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 82
    .line 83
    invoke-static {v5}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-ne v5, v4, :cond_1

    .line 88
    .line 89
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 90
    .line 91
    invoke-static {v5, v2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 92
    .line 93
    .line 94
    new-instance v5, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    const-string v6, "\u901a\u8fc7\u8bfb\u53d6sim db\u83b7\u53d6\u6570\u636e\u6d41\u91cf\u5361\u7684\u5361\u69fd\u503c\uff1a"

    .line 100
    .line 101
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {v3, v5}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :catchall_0
    move-exception v0

    .line 116
    move-object p0, v0

    .line 117
    goto :goto_4

    .line 118
    :cond_1
    :goto_1
    iget-object v5, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 119
    .line 120
    invoke-static {v5}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-ne v5, v2, :cond_0

    .line 125
    .line 126
    iget-object v2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    .line 127
    .line 128
    invoke-static {v2, v4}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    if-eqz p1, :cond_3

    .line 133
    .line 134
    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :catch_0
    :try_start_1
    const-string p0, "readSimInfoDb error"

    .line 139
    .line 140
    invoke-static {v3, p0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    .line 142
    .line 143
    if-eqz p1, :cond_3

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_3
    :goto_3
    const-string p0, "readSimInfoDbEnd"

    .line 147
    .line 148
    invoke-static {v3, p0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :goto_4
    if-eqz p1, :cond_4

    .line 153
    .line 154
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 155
    .line 156
    .line 157
    :cond_4
    throw p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Z)V
    .locals 4

    .line 186
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/cmic/sso/sdk/b/a;->b:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_0

    .line 187
    :cond_0
    new-instance v0, Lcom/cmic/sso/sdk/b/a$a;

    invoke-direct {v0}, Lcom/cmic/sso/sdk/b/a$a;-><init>()V

    iput-object v0, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    if-nez p2, :cond_1

    :goto_0
    return-void

    .line 188
    :cond_1
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/b/a;->a(Landroid/content/Context;)V

    .line 189
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->e()Z

    move-result p2

    if-nez p2, :cond_2

    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->f()Z

    move-result p2

    if-eqz p2, :cond_7

    :cond_2
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->d()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 190
    const-string p2, "UMCTelephonyManagement"

    const-string v0, "\u534e\u4e3a\u624b\u673a\u517c\u5bb9\u6027\u5904\u7406"

    invoke-static {p2, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result p2

    const/4 v0, -0x1

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result p2

    const/4 v1, 0x1

    if-ne p2, v1, :cond_5

    .line 192
    :cond_3
    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result p2

    if-ne p2, v0, :cond_4

    .line 193
    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result v1

    invoke-static {p2, v1}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 194
    :cond_4
    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2, v0}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;I)I

    .line 195
    :cond_5
    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->b(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result p2

    if-ne p2, v0, :cond_6

    iget-object p2, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    invoke-static {p2}, Lcom/cmic/sso/sdk/b/a$a;->a(Lcom/cmic/sso/sdk/b/a$a;)I

    move-result p2

    if-eq p2, v0, :cond_7

    .line 196
    :cond_6
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/b/a;->b(Landroid/content/Context;)V

    .line 197
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sput-wide p0, Lcom/cmic/sso/sdk/b/a;->b:J

    return-void
.end method

.method public b()Lcom/cmic/sso/sdk/b/a$a;
    .locals 0

    .line 158
    iget-object p0, p0, Lcom/cmic/sso/sdk/b/a;->c:Lcom/cmic/sso/sdk/b/a$a;

    if-nez p0, :cond_0

    .line 159
    new-instance p0, Lcom/cmic/sso/sdk/b/a$a;

    invoke-direct {p0}, Lcom/cmic/sso/sdk/b/a$a;-><init>()V

    :cond_0
    return-object p0
.end method
