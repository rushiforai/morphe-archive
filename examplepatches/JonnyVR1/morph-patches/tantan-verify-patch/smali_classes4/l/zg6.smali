.class public Ll/zg6;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/zg6$a;
    }
.end annotation


# static fields
.field public static a:Ljava/util/concurrent/ExecutorService;

.field public static b:I

.field public static c:Ll/jxd0;

.field public static d:Ll/jxd0;

.field public static e:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static f:[J

.field public static g:Ll/wyd0;

.field public static h:Lcom/p1/mobile/putong/core/data/ConvReportData;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/zg6;->a:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput v0, Ll/zg6;->b:I

    .line 9
    .line 10
    new-instance v1, Ll/jxd0;

    .line 11
    .line 12
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    const-string v3, "user_opt_load_conversation"

    .line 15
    .line 16
    invoke-direct {v1, v3, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Ll/zg6;->c:Ll/jxd0;

    .line 20
    .line 21
    new-instance v1, Ll/jxd0;

    .line 22
    .line 23
    const-string v3, "user_local_sync_conversation"

    .line 24
    .line 25
    invoke-direct {v1, v3, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Ll/zg6;->d:Ll/jxd0;

    .line 29
    .line 30
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 33
    .line 34
    .line 35
    sput-object v1, Ll/zg6;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    new-array v0, v0, [J

    .line 39
    .line 40
    fill-array-data v0, :array_0

    .line 41
    .line 42
    .line 43
    sput-object v0, Ll/zg6;->f:[J

    .line 44
    .line 45
    new-instance v0, Ll/wyd0;

    .line 46
    .line 47
    const-string v1, "conv_request_track_list"

    .line 48
    .line 49
    const-string v2, ""

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Ll/zg6;->g:Ll/wyd0;

    .line 55
    .line 56
    return-void

    .line 57
    :array_0
    .array-data 8
        0x96
        0x96
        0x96
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a()[J
    .locals 1

    .line 1
    sget-object v0, Ll/zg6;->f:[J

    return-object v0
.end method

.method public static b(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/zg6;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    sget-object v0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvReportData;->new_()Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 17
    .line 18
    sget-object v0, Ll/zg6;->g:Ll/wyd0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConvReportData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 39
    .line 40
    sput-object v0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception v0

    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    sget-object v0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 48
    .line 49
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ConvReportData;->requestCount:I

    .line 50
    .line 51
    const/16 v1, 0xc8

    .line 52
    .line 53
    if-lt v0, v1, :cond_2

    .line 54
    .line 55
    :goto_1
    return-void

    .line 56
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v1, "index:"

    .line 59
    .line 60
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object v1, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 64
    .line 65
    iget v1, v1, Lcom/p1/mobile/putong/core/data/ConvReportData;->requestCount:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, "|localTime"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide v1

    .line 79
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v1, "|url:"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, "|type:"

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    if-eqz p2, :cond_3

    .line 96
    .line 97
    const-string p1, "all"

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_3
    const-string p1, "new"

    .line 101
    .line 102
    :goto_2
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p1, "|ids:"

    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-class p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->conversations:Ljava/util/List;

    .line 119
    .line 120
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-nez p1, :cond_4

    .line 125
    .line 126
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_4

    .line 135
    .line 136
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p1, ","

    .line 148
    .line 149
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_4
    sget-object p0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 154
    .line 155
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConvReportData;->requestList:Ljava/util/List;

    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    sget-object p0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 165
    .line 166
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ConvReportData;->requestCount:I

    .line 167
    .line 168
    add-int/lit8 p1, p1, 0x1

    .line 169
    .line 170
    iput p1, p0, Lcom/p1/mobile/putong/core/data/ConvReportData;->requestCount:I

    .line 171
    .line 172
    sget-object p1, Ll/zg6;->g:Ll/wyd0;

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConvReportData;->toJson()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/zg6;->g:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/putong/data/DbLinks;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    sget v0, Ll/zg6;->b:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput v0, Ll/zg6;->b:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DbLinks;->clone()Lcom/p1/mobile/putong/data/DbLinks;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/zg6$a;

    .line 12
    .line 13
    sget v1, Ll/zg6;->b:I

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, v1}, Ll/zg6$a;-><init>(Lcom/p1/mobile/putong/data/DbLinks;Lcom/p1/mobile/putong/data/Envelope;I)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/zg6;->a:Ljava/util/concurrent/ExecutorService;

    .line 19
    .line 20
    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static e()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->k8()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static f()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->df()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static g()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Ll/zg6;->b:I

    .line 3
    .line 4
    sget-object v0, Ll/zg6;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 7
    .line 8
    .line 9
    sget-object v0, Ll/zg6;->a:Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/zg6;->a:Ljava/util/concurrent/ExecutorService;

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvReportData;->new_()Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ll/zg6;->h:Lcom/p1/mobile/putong/core/data/ConvReportData;

    .line 25
    .line 26
    sget-object v0, Ll/zg6;->g:Ll/wyd0;

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 36
    .line 37
    iget-object v0, v0, Ll/dkb;->w1:Ll/byd0;

    .line 38
    .line 39
    const-wide/16 v1, 0x0

    .line 40
    .line 41
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 51
    .line 52
    iget-object v0, v0, Ll/dkb;->x1:Ll/byd0;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "switch account "

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Ll/zg6;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const-string v1, "loadSpeedOpt"

    .line 78
    .line 79
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static h()J
    .locals 5

    .line 1
    sget-object v0, Ll/zg6;->f:[J

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-wide v1, v0, v1

    .line 5
    .line 6
    const/4 v3, 0x1

    .line 7
    aget-wide v3, v0, v3

    .line 8
    .line 9
    add-long/2addr v1, v3

    .line 10
    const/4 v3, 0x2

    .line 11
    aget-wide v3, v0, v3

    .line 12
    .line 13
    add-long/2addr v1, v3

    .line 14
    const-wide/16 v3, 0x3

    .line 15
    .line 16
    div-long/2addr v1, v3

    .line 17
    const-wide/16 v3, 0x96

    .line 18
    .line 19
    sub-long/2addr v1, v3

    .line 20
    const-wide/16 v3, 0x14

    .line 21
    .line 22
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    const-wide/16 v2, 0x1f4

    .line 27
    .line 28
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    return-wide v0
.end method

.method public static i(Z)V
    .locals 1

    .line 1
    sget-object v0, Ll/zg6;->c:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static j(Z)V
    .locals 1

    .line 1
    sget-object v0, Ll/zg6;->d:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
