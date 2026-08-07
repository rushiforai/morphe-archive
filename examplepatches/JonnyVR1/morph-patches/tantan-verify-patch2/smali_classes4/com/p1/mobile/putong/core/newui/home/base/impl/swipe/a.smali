.class public abstract Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/g6m<",
        "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;",
        "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/vxd0;

.field public final b:Ll/byd0;

.field public final c:J

.field public d:Z

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vxd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "profile_purpose_dialog_show_count_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->a:Ll/vxd0;

    .line 33
    .line 34
    new-instance v0, Ll/byd0;

    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v3, "profile_purpose_dialog_last_show_time_"

    .line 39
    .line 40
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-wide/16 v3, 0x0

    .line 59
    .line 60
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-direct {v0, v1, v3}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->b:Ll/byd0;

    .line 68
    .line 69
    const-wide/32 v0, 0x927c0

    .line 70
    .line 71
    .line 72
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->c:J

    .line 73
    .line 74
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->d:Z

    .line 75
    .line 76
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->f:Z

    .line 79
    .line 80
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/r4a;->t:I

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/User;ZZZILcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p10}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->l(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/User;ZZZILcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->m(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;ZLjava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final f(Lcom/p1/mobile/putong/core/data/MissMatch;)Z
    .locals 7

    .line 1
    invoke-static {}, Ll/pzi0;->n()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 14
    .line 15
    double-to-long v2, v2

    .line 16
    invoke-static {v2, v3}, Ll/tzi0;->c(J)J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    sub-long/2addr v0, v2

    .line 21
    const-wide/32 v2, 0x5265c00

    .line 22
    .line 23
    .line 24
    div-long/2addr v0, v2

    .line 25
    long-to-int p0, v0

    .line 26
    int-to-double v0, p0

    .line 27
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/MissMatch;->actived_duration:D

    .line 28
    .line 29
    cmpg-double p0, v0, v2

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    if-gez p0, :cond_0

    .line 33
    .line 34
    return v0

    .line 35
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Q0:Ll/vxd0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-ltz p0, :cond_3

    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MissMatch;->interval_day:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MissMatch;->interval_day:Ljava/util/List;

    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Q0:Ll/vxd0;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const/4 v2, 0x1

    .line 81
    sub-int/2addr v1, v2

    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MissMatch;->interval_day:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    sub-int/2addr p1, v2

    .line 89
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    check-cast p0, Ljava/lang/Double;

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 104
    .line 105
    .line 106
    move-result-wide p0

    .line 107
    const-wide/16 v3, 0x0

    .line 108
    .line 109
    cmpg-double v1, p0, v3

    .line 110
    .line 111
    if-gez v1, :cond_2

    .line 112
    .line 113
    return v0

    .line 114
    :cond_2
    const-wide/high16 v3, 0x4038000000000000L    # 24.0

    .line 115
    .line 116
    mul-double/2addr p0, v3

    .line 117
    double-to-int p0, p0

    .line 118
    invoke-static {}, Ll/pzi0;->o()J

    .line 119
    .line 120
    .line 121
    move-result-wide v3

    .line 122
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P0:Ll/byd0;

    .line 127
    .line 128
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Ljava/lang/Long;

    .line 133
    .line 134
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 135
    .line 136
    .line 137
    move-result-wide v5

    .line 138
    sub-long/2addr v3, v5

    .line 139
    int-to-long p0, p0

    .line 140
    sget-object v1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 141
    .line 142
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 143
    .line 144
    invoke-virtual {v5, p0, p1, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 145
    .line 146
    .line 147
    move-result-wide p0

    .line 148
    cmp-long p0, v3, p0

    .line 149
    .line 150
    if-ltz p0, :cond_3

    .line 151
    .line 152
    return v2

    .line 153
    :cond_3
    :goto_0
    return v0
.end method

.method public final g()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dj()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_3

    .line 14
    .line 15
    invoke-static {}, Ll/gra;->p0()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {}, Ll/gra;->q0()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez p0, :cond_0

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 28
    .line 29
    iget v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P1:I

    .line 30
    .line 31
    if-eq v1, p0, :cond_1

    .line 32
    .line 33
    :cond_0
    if-lez v0, :cond_3

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 38
    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O1:I

    .line 40
    .line 41
    if-ne p0, v0, :cond_3

    .line 42
    .line 43
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 46
    .line 47
    iget-object p0, p0, Ll/dkb;->J4:Ll/vxd0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {}, Ll/gra;->o0()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-ge p0, v0, :cond_3

    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-virtual {p0, v0}, Ll/dkb;->b8(Z)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    iget-object p0, p0, Ll/dkb;->O4:Ll/byd0;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Ljava/lang/Long;

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_3

    .line 97
    .line 98
    invoke-static {}, Ll/gra;->n0()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-lez p0, :cond_3

    .line 103
    .line 104
    invoke-static {}, Ll/gra;->o0()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-lez p0, :cond_3

    .line 109
    .line 110
    invoke-static {}, Ll/pzi0;->o()J

    .line 111
    .line 112
    .line 113
    move-result-wide v1

    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 117
    .line 118
    iget-object p0, p0, Ll/dkb;->K4:Ll/byd0;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    check-cast p0, Ljava/lang/Long;

    .line 125
    .line 126
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    sub-long/2addr v1, v3

    .line 131
    invoke-static {}, Ll/gra;->n0()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    mul-int/lit8 p0, p0, 0x18

    .line 136
    .line 137
    int-to-long v3, p0

    .line 138
    const-wide/32 v5, 0x36ee80

    .line 139
    .line 140
    .line 141
    mul-long/2addr v3, v5

    .line 142
    cmp-long p0, v1, v3

    .line 143
    .line 144
    if-gez p0, :cond_2

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 150
    .line 151
    iget-object p0, p0, Ll/dkb;->O4:Ll/byd0;

    .line 152
    .line 153
    invoke-static {}, Ll/pzi0;->o()J

    .line 154
    .line 155
    .line 156
    move-result-wide v1

    .line 157
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 167
    .line 168
    iget-object p0, p0, Ll/dkb;->K4:Ll/byd0;

    .line 169
    .line 170
    invoke-static {}, Ll/pzi0;->o()J

    .line 171
    .line 172
    .line 173
    move-result-wide v1

    .line 174
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 184
    .line 185
    iget-object p0, p0, Ll/dkb;->J4:Ll/vxd0;

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    check-cast v1, Ljava/lang/Integer;

    .line 192
    .line 193
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    add-int/lit8 v1, v1, 0x1

    .line 198
    .line 199
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-virtual {p0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    new-instance p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 207
    .line 208
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 209
    .line 210
    .line 211
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->MarryAdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 212
    .line 213
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 214
    .line 215
    const-string v1, "VirtualCard"

    .line 216
    .line 217
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 218
    .line 219
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 222
    .line 223
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 224
    .line 225
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 226
    .line 227
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 228
    .line 229
    .line 230
    :cond_3
    :goto_0
    return-void
.end method

.method public h()Lcom/p1/mobile/putong/data/Counter;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Lcom/p1/mobile/putong/data/User;ZZZLcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZZ",
            "Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;",
            ")V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v3, p4

    move-object/from16 v2, p10

    .line 1
    invoke-static {}, Ll/gra;->E1()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-static/range {p3 .. p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    move-object/from16 v5, p3

    iget-object v4, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_4

    :cond_0
    move-object/from16 v5, p3

    .line 5
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    move-object/from16 v9, p5

    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/core/newui/home/d;->e(Ljava/util/Map;)V

    .line 6
    invoke-static {}, Ll/d79;->j0()Z

    move-result v0

    const/4 v4, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_2

    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 7
    invoke-virtual {v7}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    move-result-object v7

    iget-object v7, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ll/b240;->j6(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v4

    goto :goto_0

    :cond_2
    move v0, v6

    .line 8
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    move-result-object v14

    .line 9
    invoke-static {}, Ll/gra;->E1()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 10
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 11
    invoke-virtual {v7}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v7

    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 12
    invoke-virtual {v7}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v7

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 13
    invoke-virtual {v7}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v7

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    iget-object v8, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 14
    invoke-virtual {v8}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v8

    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 15
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 16
    const-string v7, "cityC"

    invoke-static {v7}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v7

    iput-object v7, v14, Lcom/p1/mobile/putong/data/LikeExtraData;->status:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 17
    :cond_3
    new-instance v7, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    invoke-direct {v7}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    move/from16 v8, p8

    .line 18
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    if-eqz p9, :cond_4

    .line 19
    sget-object v8, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->PROFILE:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    :goto_1
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    :cond_4
    sget-object v8, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    goto :goto_1

    .line 20
    :goto_2
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    move/from16 v8, p1

    .line 21
    invoke-virtual {v7, v8}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    move/from16 v10, p2

    .line 22
    invoke-virtual {v7, v10}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    .line 23
    invoke-virtual {v7, v3}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    .line 24
    const-string v11, "p_suggest_users_home_view"

    invoke-virtual {v7, v11}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    move-result-object v7

    .line 25
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    move-result-object v7

    iput-object v7, v14, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 26
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v12, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v12}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v12

    iput-object v12, v7, Lcom/p1/mobile/putong/core/api/CoreSuggested;->f0:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v7

    invoke-interface {v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v7

    .line 29
    invoke-interface {v7, v11}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xa(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 30
    iput-boolean v6, v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    .line 31
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    move-result-object v7

    iput-boolean v6, v7, Ll/e3i;->a:Z

    .line 32
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    move-result-object v7

    invoke-virtual {v7}, Ll/e3i;->f()V

    .line 33
    iget-boolean v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez v7, :cond_7

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 34
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    move-result v7

    if-nez v7, :cond_7

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 35
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v7

    sget-object v11, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {v7, v11}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    move-result v7

    if-nez v7, :cond_5

    goto :goto_3

    .line 36
    :cond_5
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    move-result-object v7

    invoke-virtual {v7}, Ll/e3i;->b()Z

    move-result v7

    iput-boolean v7, v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    goto :goto_3

    .line 37
    :cond_6
    iput-boolean v6, v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    .line 38
    :cond_7
    :goto_3
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    move-result-object v7

    iget-boolean v7, v7, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->enable:Z

    if-eqz v7, :cond_9

    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    sget-object v11, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-eq v7, v11, :cond_8

    sget-object v11, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    if-ne v7, v11, :cond_9

    .line 39
    :cond_8
    invoke-static {}, Ll/v4j0;->h()V

    .line 40
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v7, v7, Ll/dkb;->N3:Lrx/subjects/b;

    sget-object v11, Ll/uxj0;->a:Ll/uxj0;

    invoke-virtual {v7, v11}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 41
    :cond_9
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    move-result-object v7

    iget-object v11, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v7, v11}, Ll/bpe0;->d(Ljava/lang/String;)I

    move-result v18

    .line 42
    const-string v7, "home"

    invoke-static {v7}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    move-result-object v12

    .line 43
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v11, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v11, v11, Ll/b240;->Q:Ljava/lang/String;

    iget-object v13, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 44
    invoke-virtual {v13}, Lcom/p1/mobile/putong/core/newui/home/d;->i()I

    move-result v15

    const/16 v17, 0x1

    const/16 v19, 0x0

    const/4 v10, 0x0

    const/4 v13, 0x1

    const/16 v16, 0x0

    move-object v6, v7

    move v7, v8

    move/from16 v8, p2

    .line 45
    invoke-virtual/range {v6 .. v19}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a8(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;ZIZ)Lrx/c;

    move-result-object v11

    move v8, v0

    move/from16 v9, v18

    new-instance v0, Ll/c6;

    move/from16 v6, p2

    move-object/from16 v10, p6

    move/from16 v7, p7

    move v12, v4

    move/from16 v4, p1

    invoke-direct/range {v0 .. v10}, Ll/c6;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/User;ZZZILcom/p1/mobile/putong/data/User;)V

    new-instance v3, Ll/d6;

    invoke-direct {v3, v1, v2, v7}, Ll/d6;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Z)V

    .line 46
    invoke-static {v0, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    move-result-object v0

    .line 47
    invoke-virtual {v11, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->j(Z)V

    .line 49
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->M:Lcom/p1/mobile/putong/core/newui/home/c;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 50
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/b;->M:Lcom/p1/mobile/putong/core/newui/home/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/c;->c:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_a

    .line 51
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    const-wide/32 v1, 0x2bf20

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/location/a;->u(J)V

    return-void

    :cond_a
    const/4 v1, 0x5

    if-eq v0, v1, :cond_b

    const/4 v1, 0x3

    if-eq v0, v1, :cond_b

    if-eq v0, v12, :cond_b

    if-nez v0, :cond_c

    .line 52
    :cond_b
    iget-object v0, v2, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ll/b240;->L8(Z)V

    :cond_c
    :goto_4
    return-void
.end method

.method public final j(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yy6;->E()Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    if-nez p1, :cond_6

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 22
    .line 23
    const-string v1, "male"

    .line 24
    .line 25
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_6

    .line 30
    .line 31
    invoke-static {}, Ll/rbb0;->q()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_6

    .line 36
    .line 37
    iget p1, v0, Lcom/p1/mobile/putong/core/data/MissMatch;->num_limited_left:I

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Q0:Ll/vxd0;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iget v1, v0, Lcom/p1/mobile/putong/core/data/MissMatch;->num_limited_left:I

    .line 58
    .line 59
    if-ge p1, v1, :cond_6

    .line 60
    .line 61
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->f(Lcom/p1/mobile/putong/core/data/MissMatch;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_2

    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O0:Ll/byd0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ljava/lang/Long;

    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide p0

    .line 85
    invoke-static {p0, p1}, Ll/pzi0;->D(J)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_3

    .line 90
    .line 91
    invoke-static {}, Ll/pzi0;->o()J

    .line 92
    .line 93
    .line 94
    move-result-wide v0

    .line 95
    cmp-long p0, p0, v0

    .line 96
    .line 97
    if-gez p0, :cond_3

    .line 98
    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->N0:Ll/vxd0;

    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O0:Ll/byd0;

    .line 118
    .line 119
    invoke-static {}, Ll/pzi0;->o()J

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->N0:Ll/vxd0;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    add-int/lit8 p1, p1, 0x1

    .line 147
    .line 148
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->N0:Ll/vxd0;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    check-cast p0, Ljava/lang/Integer;

    .line 166
    .line 167
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 172
    .line 173
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 174
    .line 175
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 180
    .line 181
    double-to-long v0, v0

    .line 182
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    const/16 v0, 0xa

    .line 187
    .line 188
    if-eqz p1, :cond_4

    .line 189
    .line 190
    if-lt p0, v0, :cond_4

    .line 191
    .line 192
    rem-int/lit8 p1, p0, 0x5

    .line 193
    .line 194
    if-nez p1, :cond_4

    .line 195
    .line 196
    const/16 p1, 0xc8

    .line 197
    .line 198
    if-lt p0, p1, :cond_5

    .line 199
    .line 200
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 203
    .line 204
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 209
    .line 210
    double-to-long v1, v1

    .line 211
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-nez p1, :cond_6

    .line 216
    .line 217
    if-ne p0, v0, :cond_6

    .line 218
    .line 219
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 222
    .line 223
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->R0:Lrx/subjects/a;

    .line 224
    .line 225
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 226
    .line 227
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    :cond_6
    :goto_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-eq p0, p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/User;ZZZILcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 12

    move-object/from16 v1, p4

    move/from16 v2, p8

    move-object/from16 v3, p10

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 2
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 3
    invoke-virtual {v4}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v4

    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 4
    invoke-virtual {v4}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 5
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 6
    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v4}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    iget v4, v4, Lcom/p1/mobile/putong/core/data/IntlInsertCardData;->cardType:I

    goto :goto_0

    :cond_0
    move v4, v5

    .line 7
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    move-result v6

    if-nez v6, :cond_2

    if-eqz p3, :cond_1

    .line 8
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    invoke-virtual {v6, v1, p2, v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L8(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;I)V

    goto :goto_1

    .line 9
    :cond_1
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    invoke-virtual {v6, v1, p2, v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->K8(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;I)V

    .line 10
    :cond_2
    :goto_1
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/a;->Companion:Lcom/p1/mobile/putong/core/newui/home/a$a;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->j()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 11
    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v6

    invoke-static {v6}, Ll/hni0;->b(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->e()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 13
    sget-object v6, Lcom/p1/mobile/putong/core/ui/likeminded/a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/likeminded/a;

    iget-object v7, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v7

    invoke-virtual {v6, v7, v5}, Lcom/p1/mobile/putong/core/ui/likeminded/a;->f(Lcom/p1/mobile/android/app/Act;Z)V

    .line 14
    :cond_4
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->d()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 15
    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v6

    invoke-static {v6}, Ll/c06;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    :cond_5
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->f()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_6

    .line 17
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v6, v6, Ll/dkb;->P0:Ll/byd0;

    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sget-object v6, Ll/ix60;->INSTANCE:Ll/ix60;

    .line 18
    invoke-virtual {v6}, Ll/ix60;->k()I

    move-result v10

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-nez v8, :cond_6

    .line 19
    invoke-virtual {v6}, Ll/ix60;->x()Ll/jxd0;

    move-result-object v8

    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-nez v8, :cond_6

    .line 20
    invoke-virtual {v6}, Ll/ix60;->d0()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 21
    invoke-virtual {v6, v1}, Ll/ix60;->m(Lcom/p1/mobile/putong/data/User;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 22
    invoke-virtual {v6}, Ll/ix60;->f0()V

    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v1

    .line 25
    invoke-virtual {v6, v1, v7}, Ll/ix60;->e0(Lcom/p1/mobile/android/app/Act;I)V

    .line 26
    :cond_6
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->g()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 27
    sget-object v1, Ll/xnf0;->INSTANCE:Ll/xnf0;

    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 28
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v6

    .line 29
    invoke-virtual {v1, v6, v7}, Ll/xnf0;->n(Lcom/p1/mobile/android/app/Act;I)V

    .line 30
    :cond_7
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->i()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 31
    sget-object v1, Ll/udo;->INSTANCE:Ll/udo;

    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 32
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v6

    .line 33
    invoke-virtual {v1, v6, v7}, Ll/udo;->n(Lcom/p1/mobile/android/app/Act;I)V

    .line 34
    :cond_8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v1}, Ll/rfe0;->a(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 35
    invoke-static {}, Ll/d79;->e0()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 36
    sget-object v1, Ll/haw;->Companion:Ll/haw$a;

    invoke-virtual {v1}, Ll/haw$a;->a()Ll/haw;

    move-result-object v1

    invoke-virtual {v1}, Ll/haw;->s1()V

    .line 37
    :cond_9
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/a$a;->b()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 38
    sget-object v1, Ll/sp0;->INSTANCE:Ll/sp0;

    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 39
    invoke-virtual {v4}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    iget-object v6, v6, Ll/dkb;->P0:Ll/byd0;

    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 40
    invoke-virtual {v1, v4, v8, v9}, Ll/sp0;->n(Lcom/p1/mobile/android/app/Act;J)V

    .line 41
    :cond_a
    sget-object v1, Ll/ur40;->INSTANCE:Ll/ur40;

    invoke-virtual {v1}, Ll/ur40;->m()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 42
    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v4}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    invoke-virtual {v1, v4}, Ll/ur40;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 43
    :cond_b
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    if-nez p3, :cond_d

    if-eqz p5, :cond_c

    goto :goto_2

    :cond_c
    move v4, v5

    goto :goto_3

    :cond_d
    :goto_2
    move v4, v7

    :goto_3
    invoke-virtual {v1, v4, v3}, Ll/r4a;->c(ZLcom/p1/mobile/putong/data/Relationship;)V

    .line 44
    invoke-static {}, Ll/spl0;->s()Z

    move-result v1

    if-eqz v1, :cond_e

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez v1, :cond_e

    .line 45
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    move-result-object v1

    iget-object v4, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 47
    invoke-virtual {v4}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v4

    new-instance v6, Ll/e6;

    invoke-direct {v6, p1}, Ll/e6;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    .line 48
    invoke-virtual {v1, v4, v7, v6}, Ll/rj50;->L(Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    .line 49
    :cond_e
    invoke-static {}, Ll/spl0;->u()Z

    move-result v1

    const-string v4, "matched"

    if-nez v1, :cond_f

    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez v1, :cond_f

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    iget-object v6, v3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 51
    invoke-static {v6, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    .line 52
    invoke-virtual {p0, v1, p1, v6}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->o(Lcom/p1/mobile/putong/core/api/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Z)Z

    :cond_f
    if-eqz p6, :cond_11

    .line 53
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 54
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 55
    sget-object v6, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 56
    invoke-virtual {v6}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    move-result-wide v8

    long-to-double v8, v8

    iget-object v6, p2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-wide v10, v6, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    sub-double/2addr v8, v10

    const-wide v10, 0x408f400000000000L    # 1000.0

    div-double/2addr v8, v10

    double-to-long v8, v8

    goto :goto_4

    :cond_10
    const-wide/16 v8, 0x0

    move v1, v5

    .line 57
    :goto_4
    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    new-instance v10, Ll/pf60;

    const-string v11, "distance_content"

    .line 58
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v10, v11, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    invoke-virtual {v6, v10}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    new-instance v6, Ll/pf60;

    const-string v10, "time_content"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-direct {v6, v10, v8}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v6}, Lcom/p1/mobile/putong/core/newui/home/d;->b(Ll/pf60;)Lcom/p1/mobile/putong/core/newui/home/d;

    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v6, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    const-string v8, "success"

    invoke-virtual {v1, v6, v8}, Ll/b240;->P8(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/String;)V

    .line 62
    :cond_11
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    iget v6, v1, Ll/lqb;->R:I

    add-int/2addr v6, v7

    iput v6, v1, Ll/lqb;->R:I

    if-eqz p5, :cond_12

    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K3()Z

    move-result v1

    if-nez v1, :cond_12

    if-nez p7, :cond_12

    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    const/16 v6, 0x514

    invoke-virtual {v1, v6}, Lcom/p1/mobile/putong/core/newui/home/b;->o6(I)V

    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v1

    invoke-static {v1}, Ll/z5h0;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 66
    :cond_12
    invoke-static {}, Ll/spl0;->Z()Z

    move-result v1

    const/4 v6, 0x0

    if-eqz v1, :cond_15

    if-eqz p5, :cond_14

    if-le v2, v7, :cond_14

    .line 67
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v1

    invoke-virtual {v1, v5, v6}, Ll/z5h0;->z(ZLjava/lang/String;)V

    .line 68
    invoke-static {}, Ll/z5h0;->j()Ll/z5h0;

    move-result-object v1

    iput-object v6, v1, Ll/z5h0;->m:Ljava/lang/String;

    .line 69
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    move-result-object v1

    iget-object v8, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ll/bpe0;->e(Ljava/lang/String;)Ll/bpe0$b;

    move-result-object v1

    .line 70
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_14

    .line 71
    invoke-virtual {v1}, Ll/bpe0$b;->a()Z

    move-result v8

    if-eqz v8, :cond_13

    const-string v8, "click"

    goto :goto_5

    :cond_13
    const-string v8, "combo"

    .line 72
    :goto_5
    iget-object v9, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 73
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    move-result-object v9

    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->pageId()Ljava/lang/String;

    move-result-object v9

    const-string v10, "other_user_id"

    iget-object v11, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    invoke-static {v10, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v10

    .line 75
    invoke-virtual {v1}, Ll/bpe0$b;->c()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v11, "superlike_quantity"

    invoke-static {v11, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v1

    const-string v11, "superlike_types"

    .line 76
    invoke-static {v11, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v8

    filled-new-array {v10, v1, v8}, [Ll/pf60;

    move-result-object v1

    .line 77
    const-string v8, "e_send_superlike"

    invoke-static {v8, v9, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 78
    :cond_14
    invoke-static {}, Ll/bpe0;->f()Ll/bpe0;

    move-result-object v1

    invoke-virtual {v1}, Ll/bpe0;->h()V

    .line 79
    :cond_15
    invoke-static {}, Ll/h7d0;->m0()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 80
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    move-result-object v1

    invoke-virtual {v1}, Ll/h7d0;->l0()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 81
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G0:Ll/s07;

    invoke-virtual {v1}, Ll/s07;->t3()V

    goto :goto_6

    .line 82
    :cond_16
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    move-result-object v1

    .line 83
    invoke-virtual {v1}, Ll/h7d0;->h0()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 84
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    move-result-object v1

    invoke-virtual {v1}, Ll/h7d0;->e0()V

    if-nez p3, :cond_17

    .line 85
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    move-result-object v1

    invoke-virtual {v1}, Ll/h7d0;->n0()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    const-wide/16 v8, 0xbb8

    invoke-virtual {v1, v8, v9}, Lcom/p1/mobile/putong/core/newui/home/b;->B6(J)V

    .line 87
    invoke-static {}, Ll/h7d0;->i0()Ll/h7d0;

    move-result-object v1

    .line 88
    invoke-virtual {v1, v5}, Ll/h7d0;->r0(Z)V

    .line 89
    :cond_17
    :goto_6
    invoke-static {}, Ll/spl0;->T()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 90
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    invoke-virtual {v1}, Ll/qf7;->f3()V

    .line 92
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    invoke-virtual {v1}, Ll/qf7;->d3()V

    .line 93
    :cond_18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    invoke-virtual {v1}, Ll/qf7;->g3()V

    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->o2:Ll/qf7;

    invoke-virtual {v1}, Ll/qf7;->e3()V

    .line 95
    :cond_19
    invoke-static {}, Ll/gra;->Y1()Z

    move-result v1

    if-eqz v1, :cond_1b

    if-eqz p3, :cond_1b

    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    invoke-virtual {v1}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v1

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    if-eqz v1, :cond_1b

    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/IdealInfo;->fitIdeals:Ljava/util/List;

    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1b

    .line 98
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    iget-object v1, v1, Ll/mk8;->a0:Ll/byd0;

    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-static {v8, v9}, Ll/pzi0;->D(J)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    iget-object v1, v1, Ll/mk8;->b0:Ll/vxd0;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v1, v8}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    goto :goto_7

    .line 100
    :cond_1a
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    iget-object v1, v1, Ll/mk8;->b0:Ll/vxd0;

    invoke-virtual {v1, v7}, Ll/vxd0;->a(I)V

    .line 101
    :goto_7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    iget-object v1, v1, Ll/mk8;->a0:Ll/byd0;

    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v1, v8}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 102
    :cond_1b
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 103
    invoke-static {}, Ll/spl0;->U()Z

    move-result v1

    if-nez v1, :cond_1c

    invoke-static {}, Ll/s7a;->s()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 104
    :cond_1c
    sget-object v1, Ll/s0e0;->INSTANCE:Ll/s0e0;

    invoke-virtual {v1}, Ll/s0e0;->e()V

    .line 105
    :cond_1d
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput v5, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O1:I

    .line 106
    iput v5, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 107
    iput v5, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A0:I

    .line 108
    iput v5, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 109
    iput v5, v2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G0:I

    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    iput v5, v1, Ll/r4a;->t:I

    .line 111
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    const-string v2, "xmasActivity"

    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3f

    .line 112
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0xd

    if-eqz v1, :cond_21

    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/MatchFrom;

    const-string v4, "letter"

    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 113
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 114
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 115
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 116
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1e

    move v1, v7

    goto :goto_8

    :cond_1e
    move v1, v5

    :goto_8
    if-eqz v1, :cond_1f

    if-eqz p7, :cond_1f

    const/16 v1, 0x27

    goto/16 :goto_b

    :cond_1f
    if-eqz v1, :cond_20

    const/16 v1, 0x25

    goto/16 :goto_b

    :cond_20
    const/16 v1, 0x26

    goto/16 :goto_b

    .line 117
    :cond_21
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_22

    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 118
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/MatchFrom;

    const-string v4, "superLikedEach"

    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    :goto_9
    move v1, v2

    goto/16 :goto_b

    .line 119
    :cond_22
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v4, 0xc

    if-eqz v1, :cond_23

    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 120
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/MatchFrom;

    const-string v8, "superLiked"

    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_24

    .line 121
    :cond_23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result v1

    if-eqz v1, :cond_27

    :cond_24
    if-eqz p5, :cond_25

    .line 122
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result v1

    if-nez v1, :cond_25

    :goto_a
    move v1, v4

    goto :goto_b

    :cond_25
    if-eqz p5, :cond_26

    .line 123
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    move-result v1

    if-eqz v1, :cond_26

    goto :goto_9

    :cond_26
    const/16 v1, 0xb

    goto :goto_b

    .line 124
    :cond_27
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, v3, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 125
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/MatchFrom;

    const-string v8, "secretcrush"

    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    move v1, v7

    goto :goto_b

    .line 126
    :cond_28
    sget-object v1, Ll/qap;->Companion:Ll/qap$a;

    iget-object v8, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 127
    invoke-virtual {v8}, Ll/ik4;->e()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object v8

    .line 128
    invoke-virtual {v1, v8}, Ll/qap$a;->m(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    move-result v1

    if-eqz v1, :cond_29

    const/16 v1, 0x2f

    goto :goto_b

    :cond_29
    if-eqz p5, :cond_2a

    goto :goto_a

    :cond_2a
    move v1, v5

    .line 129
    :goto_b
    invoke-static {}, Ll/d79;->j0()Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 130
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 131
    :cond_2b
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v4

    .line 132
    iget-object v8, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    if-eqz v4, :cond_2e

    .line 133
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v3

    .line 134
    invoke-static {v3, p2}, Ll/pci;->J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    move-result v0

    if-nez v0, :cond_2c

    .line 136
    invoke-static {}, Ll/toh0;->s()V

    :cond_2c
    if-ne v1, v2, :cond_3f

    .line 137
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    move-result-object v0

    .line 138
    invoke-virtual {v0}, Ll/tx0;->B()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 139
    invoke-static {}, Ll/spl0;->F()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 140
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    move-result-object v0

    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 143
    invoke-virtual {v0, v1, v5, v7}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 144
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 145
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v0

    const/high16 v1, 0x40a00000    # 5.0f

    const-string v2, "superlike"

    .line 146
    invoke-static {v0, v5, v1, v2}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    goto/16 :goto_11

    .line 147
    :cond_2e
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    move-result-object v2

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 148
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 149
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v2

    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    .line 150
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v3, v3, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    check-cast v3, Ljava/util/ArrayList;

    .line 151
    invoke-static {}, Ll/gra;->S1()Z

    move-result v4

    if-nez v4, :cond_30

    .line 152
    invoke-static {}, Ll/gra;->j2()Z

    move-result v4

    if-eqz v4, :cond_2f

    goto :goto_c

    :cond_2f
    move-object v4, v6

    goto :goto_d

    .line 153
    :cond_30
    :goto_c
    const-string v4, "tmp_from_home_swipe"

    .line 154
    :goto_d
    invoke-static {v2, v0, v1, v3, v4}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 155
    const-string v1, "picks_guide_bubble_user"

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 156
    const-string v1, "picks_guide_bubble_direction"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 157
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    move-result-object v1

    .line 159
    invoke-static {}, Ll/gra;->n3()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 160
    new-instance v2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$a;

    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$a;-><init>()V

    goto :goto_e

    .line 161
    :cond_31
    new-instance v2, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    invoke-direct {v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 162
    :goto_e
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Frag;->w4(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 164
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    move-result-object v0

    iput-boolean v7, v0, Ll/e3i;->a:Z

    .line 165
    :cond_32
    invoke-static {}, Ll/gra;->d3()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 166
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    goto/16 :goto_11

    :cond_33
    if-eqz p3, :cond_36

    .line 167
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y0:I

    .line 168
    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    .line 169
    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G0:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G0:I

    .line 170
    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O1:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->O1:I

    .line 171
    iput v5, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P1:I

    .line 172
    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A0:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A0:I

    .line 173
    invoke-static {}, Ll/spl0;->U()Z

    move-result v1

    if-eqz v1, :cond_35

    if-eqz p3, :cond_34

    .line 174
    sget-object v1, Ll/s0e0;->INSTANCE:Ll/s0e0;

    invoke-virtual {v1}, Ll/s0e0;->d()V

    .line 175
    :cond_34
    sget-object v1, Ll/s0e0;->INSTANCE:Ll/s0e0;

    invoke-virtual {v1}, Ll/s0e0;->a()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 176
    invoke-virtual {v1}, Ll/s0e0;->c()V

    .line 177
    :cond_35
    invoke-static {}, Ll/s7a;->s()Z

    move-result v1

    if-eqz v1, :cond_37

    if-eqz p3, :cond_37

    .line 178
    sget-object v1, Ll/s0e0;->INSTANCE:Ll/s0e0;

    invoke-virtual {v1}, Ll/s0e0;->d()V

    .line 179
    invoke-virtual {v1}, Ll/s0e0;->a()Z

    move-result v3

    if-eqz v3, :cond_37

    .line 180
    invoke-virtual {v1}, Ll/s0e0;->c()V

    goto :goto_f

    .line 181
    :cond_36
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P1:I

    add-int/2addr v3, v7

    iput v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->P1:I

    .line 182
    iput v5, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A0:I

    .line 183
    :cond_37
    :goto_f
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->g()V

    .line 184
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez v1, :cond_38

    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z0:I

    const/16 v3, 0xa

    if-lt v1, v3, :cond_38

    .line 185
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    move-object/from16 v3, p9

    invoke-virtual {v1, v3}, Ll/b240;->d9(Lcom/p1/mobile/putong/data/User;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 186
    iput-boolean v7, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 187
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->B0:Lrx/subjects/b;

    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    invoke-virtual {v1, v3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 188
    :cond_38
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v3, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G0:I

    const/4 v4, 0x5

    if-lt v3, v4, :cond_39

    .line 189
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I0:Lrx/subjects/a;

    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    invoke-virtual {v1, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 190
    :cond_39
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez v1, :cond_3a

    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    iget v1, v1, Ll/lqb;->R:I

    const/16 v3, 0x1e

    if-lt v1, v3, :cond_3a

    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v1, v1, Ll/b240;->x:Ll/jxd0;

    .line 191
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_3a

    .line 192
    invoke-static {}, Ll/a5i0;->v()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 193
    invoke-static {}, Ll/a5i0;->P()Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 194
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v3

    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    iget-object v1, v1, Ll/m27;->U:Ll/byd0;

    .line 195
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 196
    invoke-static {v3, v4, v5, v6, v7}, Ll/tzi0;->h(JJI)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 197
    iput-boolean v7, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 198
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    iget-object v1, v1, Ll/b240;->v:Lrx/subjects/b;

    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    invoke-virtual {v1, v3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 199
    :cond_3a
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/a;->L()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 200
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->i6()V

    :cond_3b
    if-eqz p5, :cond_3c

    if-le v2, v7, :cond_3c

    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 202
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object v1

    .line 203
    invoke-static {v1, p2}, Ll/z5h0;->F(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 204
    :cond_3c
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 205
    invoke-static {}, Ll/pgj;->c()Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 206
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    invoke-virtual {v2}, Ll/b240;->n5()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3d

    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 207
    invoke-virtual {v2}, Ll/b240;->n5()Ljava/lang/String;

    move-result-object v2

    .line 208
    invoke-static {v1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v3

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3d

    .line 209
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 210
    invoke-virtual {v3}, Ll/b240;->n5()Ljava/lang/String;

    move-result-object v3

    .line 211
    invoke-virtual {v2, v3}, Ll/fsb0;->R(Ljava/lang/String;)V

    .line 212
    :cond_3d
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 213
    invoke-static {v1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v1

    .line 214
    invoke-virtual {v2, v1}, Ll/b240;->S8(Ljava/lang/String;)V

    goto :goto_10

    .line 215
    :cond_3e
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 216
    invoke-static {v1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    move-result-object v1

    .line 217
    invoke-virtual {v2, v1}, Ll/fsb0;->R(Ljava/lang/String;)V

    goto :goto_10

    .line 218
    :cond_3f
    :goto_11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    move-result v0

    if-eqz v0, :cond_40

    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    if-eqz p0, :cond_40

    .line 219
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    move-result-object p0

    iget-boolean p0, p0, Ll/e3i;->a:Z

    if-nez p0, :cond_40

    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    if-nez p0, :cond_40

    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 220
    invoke-virtual {p0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object p0

    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    move-result p0

    if-nez p0, :cond_40

    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 221
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object p0

    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    move-result p0

    if-eqz p0, :cond_40

    .line 222
    iput-boolean v7, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    move-result-object p0

    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    move-result-object p1

    const-string v0, "p_suggest_users_home_view"

    .line 225
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    :cond_40
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;ZLjava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/a;->e:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/e3i;->c()Ll/e3i;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-boolean p0, p0, Ll/e3i;->a:Z

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 24
    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/b240;->T4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isDialogShowing()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_0

    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "p_suggest_users_home_view"

    .line 67
    .line 68
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cj(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    if-eqz p2, :cond_1

    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->a:Ll/b240;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->f:Lcom/p1/mobile/putong/core/newui/home/d;

    .line 76
    .line 77
    invoke-virtual {p0, p1, p3}, Ll/b240;->O8(Lcom/p1/mobile/putong/core/newui/home/d;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-static {p3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public n()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final o(Lcom/p1/mobile/putong/core/api/d0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
