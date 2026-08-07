.class public Ll/u7b0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u7b0$a;,
        Ll/u7b0$c;,
        Ll/u7b0$b;
    }
.end annotation


# static fields
.field public static final a:Ll/wyd0;

.field public static final b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static c:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ll/u7b0$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "pull_alive_record"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/u7b0;->a:Ll/wyd0;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Ll/u7b0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    new-instance v0, Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/u7b0;->c:Landroid/util/SparseArray;

    .line 26
    .line 27
    new-instance v1, Ll/u7b0$c;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-direct {v1, v2}, Ll/u7b0$c;-><init>(Ll/v7b0;)V

    .line 31
    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Ll/u7b0;->c:Landroid/util/SparseArray;

    .line 38
    .line 39
    new-instance v1, Ll/u7b0$b;

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ll/u7b0$b;-><init>(Ll/v7b0;)V

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x2

    .line 45
    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
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

.method public static a(Lcom/p1/mobile/putong/data/AwakeApp;)Z
    .locals 4
    .param p0    # Lcom/p1/mobile/putong/data/AwakeApp;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->cycleTime:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->count:I

    .line 8
    .line 9
    if-gtz v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->interval:I

    .line 13
    .line 14
    if-gtz v0, :cond_2

    .line 15
    .line 16
    return v1

    .line 17
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->mode:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v0, v2, :cond_4

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->className:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_3

    .line 37
    .line 38
    return v2

    .line 39
    :cond_3
    return v1

    .line 40
    :cond_4
    const/4 v3, 0x2

    .line 41
    if-ne v0, v3, :cond_5

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->action:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    xor-int/2addr p0, v2

    .line 50
    return p0

    .line 51
    :cond_5
    return v1
.end method

.method public static b()V
    .locals 0

    .line 1
    invoke-static {}, Ll/u7b0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_5

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/data/AwakeApp;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget v3, v2, Lcom/p1/mobile/putong/data/AwakeApp;->isOpen:I

    .line 35
    .line 36
    if-gtz v3, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-static {v2}, Ll/u7b0;->a(Lcom/p1/mobile/putong/data/AwakeApp;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_4

    .line 54
    .line 55
    return-object v0

    .line 56
    :cond_4
    return-object v1

    .line 57
    :cond_5
    :goto_1
    return-object v0
.end method

.method public static d(Ljava/util/List;Ljava/util/HashMap;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/AwakeAppRecord;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_4

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/p1/mobile/putong/data/AwakeApp;

    .line 34
    .line 35
    iget-object v4, v3, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-nez v4, :cond_2

    .line 42
    .line 43
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    iget-object v4, v3, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Lcom/p1/mobile/putong/data/AwakeAppRecord;

    .line 54
    .line 55
    iget-wide v5, v4, Lcom/p1/mobile/putong/data/AwakeAppRecord;->startPullAliveTime:J

    .line 56
    .line 57
    sub-long v5, v1, v5

    .line 58
    .line 59
    const-wide/32 v7, 0x36ee80

    .line 60
    .line 61
    .line 62
    div-long/2addr v5, v7

    .line 63
    iget v7, v3, Lcom/p1/mobile/putong/data/AwakeApp;->cycleTime:I

    .line 64
    .line 65
    int-to-long v7, v7

    .line 66
    cmp-long v5, v5, v7

    .line 67
    .line 68
    if-ltz v5, :cond_3

    .line 69
    .line 70
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v3, v4, Lcom/p1/mobile/putong/data/AwakeAppRecord;->package_name:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    iget v5, v4, Lcom/p1/mobile/putong/data/AwakeAppRecord;->hasPullAliveCount:I

    .line 80
    .line 81
    iget v6, v3, Lcom/p1/mobile/putong/data/AwakeApp;->count:I

    .line 82
    .line 83
    if-ge v5, v6, :cond_1

    .line 84
    .line 85
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/AwakeAppRecord;->lastPullAliveTime:J

    .line 86
    .line 87
    sub-long v4, v1, v4

    .line 88
    .line 89
    const-wide/32 v6, 0xea60

    .line 90
    .line 91
    .line 92
    div-long/2addr v4, v6

    .line 93
    iget v6, v3, Lcom/p1/mobile/putong/data/AwakeApp;->interval:I

    .line 94
    .line 95
    int-to-long v6, v6

    .line 96
    cmp-long v4, v4, v6

    .line 97
    .line 98
    if-lez v4, :cond_1

    .line 99
    .line 100
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    return-object v0
.end method

.method public static e(Ljava/util/List;)Ljava/util/HashMap;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/AwakeAppRecord;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/u7b0;->a:Ll/wyd0;

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
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/AwakeAppRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_4

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_4

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_4

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lcom/p1/mobile/putong/data/AwakeAppRecord;

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    const/4 v4, 0x0

    .line 71
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-eqz v5, :cond_3

    .line 76
    .line 77
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lcom/p1/mobile/putong/data/AwakeApp;

    .line 82
    .line 83
    iget-object v6, v2, Lcom/p1/mobile/putong/data/AwakeAppRecord;->package_name:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v5, v5, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v5

    .line 91
    if-eqz v5, :cond_2

    .line 92
    .line 93
    const/4 v4, 0x1

    .line 94
    goto :goto_1

    .line 95
    :cond_3
    if-eqz v4, :cond_1

    .line 96
    .line 97
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    new-instance p0, Ljava/util/HashMap;

    .line 102
    .line 103
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_5

    .line 115
    .line 116
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Lcom/p1/mobile/putong/data/AwakeAppRecord;

    .line 121
    .line 122
    iget-object v2, v1, Lcom/p1/mobile/putong/data/AwakeAppRecord;->package_name:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_5
    return-object p0

    .line 129
    :catch_0
    move-exception p0

    .line 130
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Ljava/util/HashMap;

    .line 134
    .line 135
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 136
    .line 137
    .line 138
    return-object p0
.end method

.method public static f()V
    .locals 8

    .line 1
    sget-object v0, Ll/uqb0;->X:Ll/hj5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    sget-object v1, Ll/u7b0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v1, v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_7

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v0}, Ll/u7b0;->c(Ljava/util/List;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {v0}, Ll/u7b0;->e(Ljava/util/List;)Ljava/util/HashMap;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v0, v2}, Ll/u7b0;->d(Ljava/util/List;Ljava/util/HashMap;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 54
    .line 55
    invoke-static {v1}, Ll/uc60;->e(Landroid/content/Context;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_6

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/p1/mobile/putong/data/AwakeApp;

    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    if-eqz v6, :cond_5

    .line 84
    .line 85
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    check-cast v6, Ll/uc60$a;

    .line 90
    .line 91
    iget-object v7, v4, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v6, v6, Ll/uc60$a;->b:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-eqz v6, :cond_4

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_5
    sget-object v5, Ll/u7b0;->c:Landroid/util/SparseArray;

    .line 103
    .line 104
    iget v6, v4, Lcom/p1/mobile/putong/data/AwakeApp;->mode:I

    .line 105
    .line 106
    invoke-virtual {v5, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Ll/u7b0$a;

    .line 111
    .line 112
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    if-eqz v6, :cond_3

    .line 117
    .line 118
    sget-object v6, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 119
    .line 120
    invoke-interface {v5, v6, v4}, Ll/u7b0$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/AwakeApp;)Z

    .line 121
    .line 122
    .line 123
    invoke-static {v4, v2}, Ll/u7b0;->g(Lcom/p1/mobile/putong/data/AwakeApp;Ljava/util/HashMap;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_6
    sget-object v0, Ll/u7b0;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 130
    .line 131
    .line 132
    :cond_7
    :goto_1
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/data/AwakeApp;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/AwakeAppRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/AwakeAppRecord;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->package_name:Ljava/lang/String;

    .line 18
    .line 19
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    iput-wide v2, v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->startPullAliveTime:J

    .line 26
    .line 27
    iput-wide v2, v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->lastPullAliveTime:J

    .line 28
    .line 29
    iput v1, v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->hasPullAliveCount:I

    .line 30
    .line 31
    iget-object p0, v0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->package_name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AwakeApp;->packageName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/data/AwakeAppRecord;

    .line 44
    .line 45
    iget v0, p0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->hasPullAliveCount:I

    .line 46
    .line 47
    add-int/2addr v0, v1

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->hasPullAliveCount:I

    .line 49
    .line 50
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->lastPullAliveTime:J

    .line 57
    .line 58
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/data/AwakeAppRecord;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget-object p1, Ll/u7b0;->a:Ll/wyd0;

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    return-void
.end method
