.class public Ll/lxd0;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/data/OMSDialogShowInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "preferences"

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, p2, v1}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->clone()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->new_()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 11
    .line 12
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/lxd0;->a(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/lxd0;->b(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 6
    .line 7
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-object v0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/lxd0;->c()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/lxd0;->c()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Landroid/content/SharedPreferences$Editor;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/data/DialogShowInfo;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/lxd0;->d()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/lxd0;->e(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/OmsCounter;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/lxd0;->d()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsCounter;->counters:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_5

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;

    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 36
    .line 37
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 44
    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    new-instance v2, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 48
    .line 49
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/DialogShowInfo;-><init>()V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v3, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->version:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v3, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->version:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 61
    .line 62
    iget-wide v4, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->count:J

    .line 63
    .line 64
    long-to-int v4, v4

    .line 65
    iput v4, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->totalShownCount:I

    .line 66
    .line 67
    iget-wide v4, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->latestMs:J

    .line 68
    .line 69
    iput-wide v4, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->lastShowTime:J

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->histories:Ljava/util/List;

    .line 72
    .line 73
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/4 v4, 0x0

    .line 78
    if-nez v3, :cond_3

    .line 79
    .line 80
    iget-object v3, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->constraint:Lcom/p1/mobile/putong/data/OMSConstraint;

    .line 81
    .line 82
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSConstraint;->histories:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    move v5, v4

    .line 89
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-eqz v6, :cond_4

    .line 94
    .line 95
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Ljava/lang/Long;

    .line 100
    .line 101
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 102
    .line 103
    .line 104
    move-result-wide v6

    .line 105
    invoke-static {v6, v7}, Ll/pzi0;->D(J)Z

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-eqz v8, :cond_2

    .line 110
    .line 111
    add-int/lit8 v4, v4, 0x1

    .line 112
    .line 113
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    invoke-static {v6, v7}, Ll/pzi0;->v(J)Z

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-eqz v6, :cond_4

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    move v5, v4

    .line 124
    :cond_4
    iput v4, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByDay:I

    .line 125
    .line 126
    iput v5, v2, Lcom/p1/mobile/putong/data/DialogShowInfo;->countByWeek:I

    .line 127
    .line 128
    iget-object v3, v0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSCounterInfo;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_5
    invoke-virtual {p0, v0}, Ll/lxd0;->e(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)V

    .line 137
    .line 138
    .line 139
    :cond_6
    :goto_3
    return-void
.end method

.method public j(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DialogShowInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/lxd0;->d()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/data/DialogShowInfo;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;->showInfos:Ljava/util/Map;

    .line 29
    .line 30
    iget-object v3, v1, Lcom/p1/mobile/putong/data/DialogShowInfo;->resourceId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, v0}, Ll/lxd0;->e(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic retrieveValue()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lxd0;->f()Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic saveValue(Ljava/lang/Object;)Landroid/content/SharedPreferences$Editor;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogShowInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lxd0;->g(Lcom/p1/mobile/putong/data/OMSDialogShowInfo;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
