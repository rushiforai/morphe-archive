.class public Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$TxNetWorkHelperHolder;,
        Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;
    }
.end annotation


# instance fields
.field public volatile a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;",
            ">;"
        }
    .end annotation
.end field

.field public volatile b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

.field public d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;->LEVEL_VERBOSE:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 169
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    new-instance v0, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;

    invoke-direct {v0, p2, p3, p4, p5}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    const-string v0, "txy_comoon_share_data"

    if-nez p1, :cond_1

    goto :goto_0

    .line 170
    :cond_1
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 171
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 172
    :goto_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "_time"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    if-nez p1, :cond_2

    return-void

    .line 173
    :cond_2
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 174
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p2, p4, p5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static a(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-wide/32 v1, 0x5265c00

    .line 4
    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x1

    .line 8
    const-string v5, "TxNetWorkHelper"

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;->getRefreshTime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v6

    .line 30
    sub-long/2addr p0, v6

    .line 31
    cmp-long p0, p0, v1

    .line 32
    .line 33
    if-lez p0, :cond_5

    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "isHostNameIpTimeOut is timeout in cache"

    .line 40
    .line 41
    invoke-virtual {p0, v5, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v4

    .line 45
    :cond_0
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v6, "_time"

    .line 54
    .line 55
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    const-string v6, "txy_comoon_share_data"

    .line 63
    .line 64
    const-wide/16 v7, 0x0

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    :try_start_1
    invoke-virtual {p1, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-interface {v9, v0, v7, v8}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 74
    .line 75
    .line 76
    move-result-wide v7

    .line 77
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 78
    .line 79
    .line 80
    move-result-wide v9

    .line 81
    sub-long/2addr v9, v7

    .line 82
    cmp-long v0, v9, v1

    .line 83
    .line 84
    if-lez v0, :cond_2

    .line 85
    .line 86
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "isHostNameIpTimeOut is timeout"

    .line 91
    .line 92
    invoke-virtual {p0, v5, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return v4

    .line 96
    :catch_0
    move-exception p0

    .line 97
    goto :goto_2

    .line 98
    :cond_2
    if-nez p1, :cond_3

    .line 99
    .line 100
    sget-object p1, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->STRING_INIT:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_3
    invoke-virtual {p1, v6, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    sget-object v0, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->STRING_INIT:Ljava/lang/String;

    .line 108
    .line 109
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_5

    .line 118
    .line 119
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 120
    .line 121
    if-nez v0, :cond_4

    .line 122
    .line 123
    new-instance v0, Ljava/util/HashMap;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 129
    .line 130
    :cond_4
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 131
    .line 132
    new-instance v0, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;

    .line 133
    .line 134
    invoke-direct {v0, p2, p1, v7, v8}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 135
    .line 136
    .line 137
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 138
    .line 139
    .line 140
    :cond_5
    return v3

    .line 141
    :goto_2
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance p2, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    const-string v0, "isHostNameIpTimeOut e: "

    .line 148
    .line 149
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p1, v5, p0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return v4
.end method

.method public static getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$TxNetWorkHelperHolder;->a:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public checkHostName(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->getInstance()Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$2;-><init>(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Landroid/content/Context;Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->addWork(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getHostNameCurrentIp(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 4
    .line 5
    const-wide/32 v2, 0x5265c00

    .line 6
    .line 7
    .line 8
    const-string v4, "TxNetWorkHelper"

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v5

    .line 26
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;->getRefreshTime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v7

    .line 30
    sub-long/2addr v5, v7

    .line 31
    cmp-long v5, v5, v2

    .line 32
    .line 33
    if-gez v5, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string p2, "get hostName use cache: "

    .line 42
    .line 43
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;->getIp()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, v4, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;->getIp()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v5, "_time"

    .line 74
    .line 75
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    const-string v5, "txy_comoon_share_data"

    .line 83
    .line 84
    const-wide/16 v6, 0x0

    .line 85
    .line 86
    const/4 v8, 0x0

    .line 87
    if-nez p1, :cond_1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    :try_start_1
    invoke-virtual {p1, v5, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    invoke-interface {v9, v1, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 95
    .line 96
    .line 97
    move-result-wide v6

    .line 98
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v9

    .line 102
    sub-long/2addr v9, v6

    .line 103
    cmp-long v1, v9, v2

    .line 104
    .line 105
    if-lez v1, :cond_3

    .line 106
    .line 107
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->b:Ljava/util/Set;

    .line 108
    .line 109
    invoke-interface {v1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-nez v1, :cond_2

    .line 114
    .line 115
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const-string v2, "need update dns!"

    .line 120
    .line 121
    invoke-virtual {v1, v4, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, p1, p2, v8}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->checkHostName(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :catch_0
    move-exception p0

    .line 129
    goto :goto_3

    .line 130
    :cond_2
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    const-string p1, "do not need update dns!"

    .line 135
    .line 136
    invoke-virtual {p0, v4, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :goto_1
    return-object v0

    .line 140
    :cond_3
    if-nez p1, :cond_4

    .line 141
    .line 142
    sget-object p1, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->STRING_INIT:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_2

    .line 145
    :cond_4
    invoke-virtual {p1, v5, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    sget-object v1, Lcom/tencent/could/component/common/ai/eventreport/api/EventReportConfig;->STRING_INIT:Ljava/lang/String;

    .line 150
    .line 151
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    :goto_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_6

    .line 160
    .line 161
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 162
    .line 163
    if-nez v1, :cond_5

    .line 164
    .line 165
    new-instance v1, Ljava/util/HashMap;

    .line 166
    .line 167
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 171
    .line 172
    :cond_5
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->a:Ljava/util/Map;

    .line 173
    .line 174
    new-instance v1, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;

    .line 175
    .line 176
    invoke-direct {v1, p2, p1, v6, v7}, Lcom/tencent/could/component/common/ai/net/DnsCacheInfo;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 177
    .line 178
    .line 179
    invoke-interface {p0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 180
    .line 181
    .line 182
    :cond_6
    return-object p1

    .line 183
    :goto_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    const-string p2, "getHostNameCurrentIp error: "

    .line 186
    .line 187
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    return-object v0
.end method

.method public logDebug(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;->LEVEL_DEBUG:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2}, Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;->logger(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public logError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;->LEVEL_ERROR:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 16
    .line 17
    invoke-interface {p0, p1, p2}, Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;->logger(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 7
    .line 8
    :cond_0
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->release()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setAiNetWorkLevel(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_VERBOSE:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_NONE:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_ERROR:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_WARN:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_INFO:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_4
    sget-object p0, Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;->LEVEL_DEBUG:Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;

    .line 38
    .line 39
    :cond_5
    :goto_0
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->setLogLevel(Lcom/tencent/cloud/ai/network/helper/NetworkLogger$LOG_LEVEL;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public setLoggerCallBack(Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;)V
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    invoke-virtual {p0, p1, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->setLoggerCallBack(Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;)V

    return-void
.end method

.method public setLoggerCallBack(Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->c:Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->d:Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$LOG_LEVEL;

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$1;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper$1;-><init>(Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;Lcom/tencent/could/component/common/ai/net/NetWorkLoggerCallBack;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->setLoggerCallBack(Lcom/tencent/cloud/ai/network/helper/NetworkLoggerCallBack;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
