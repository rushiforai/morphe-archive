.class public Ll/oqp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

.field public b:Ll/kcg0;

.field public c:Ll/dq1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dq1<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/ner;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;Ll/ner;Ll/dq1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;",
            "Ll/ner;",
            "Ll/dq1<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 5
    .line 6
    iput-object p3, p0, Ll/oqp;->c:Ll/dq1;

    .line 7
    .line 8
    iput-object p2, p0, Ll/oqp;->d:Ll/ner;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/oqp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oqp;->d(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/oqp;Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;JLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/oqp;->c(Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;JLjava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public final synthetic c(Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;JLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    add-int/lit8 p6, p6, 0x1

    .line 6
    .line 7
    if-lt p6, p2, :cond_0

    .line 8
    .line 9
    const/4 p6, 0x0

    .line 10
    :cond_0
    invoke-virtual {p1, p6}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 14
    .line 15
    invoke-interface {p3, p6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;

    .line 20
    .line 21
    move p3, p2

    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->j0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;ZIJ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/oqp;->b:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oqp;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 9

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fk3;->q()Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/oqp;->h()V

    .line 14
    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getActivities()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i0()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getActivities()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x1

    .line 43
    if-le v1, v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getActivities()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iget-object v5, p0, Ll/oqp;->c:Ll/dq1;

    .line 50
    .line 51
    iget-object v6, p0, Ll/oqp;->d:Ll/ner;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getUpdatedTime()J

    .line 54
    .line 55
    .line 56
    move-result-wide v7

    .line 57
    move-object v3, p0

    .line 58
    invoke-virtual/range {v3 .. v8}, Ll/oqp;->g(Ljava/util/List;Ll/dq1;Ll/ner;J)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    move-object v3, p0

    .line 63
    iget-object p0, v3, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getActivities()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean;->getUpdatedTime()J

    .line 77
    .line 78
    .line 79
    move-result-wide v2

    .line 80
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->k0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;J)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    move-object v3, p0

    .line 85
    iget-object p0, v3, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->i0()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final g(Ljava/util/List;Ll/dq1;Ll/ner;J)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;",
            ">;",
            "Ll/dq1<",
            "Ljava/lang/Object;",
            ">;",
            "Ll/ner;",
            "J)V"
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
    iget-object p0, p0, Ll/oqp;->b:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v9, 0x0

    .line 23
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    move-object v4, v0

    .line 28
    check-cast v4, Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;

    .line 29
    .line 30
    move v6, v3

    .line 31
    iget-object v3, p0, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    move-wide v7, p4

    .line 35
    invoke-virtual/range {v3 .. v8}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->j0(Lcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;ZIJ)V

    .line 36
    .line 37
    .line 38
    move-object p4, v4

    .line 39
    move v3, v6

    .line 40
    move-wide v5, v7

    .line 41
    iget-object p5, p0, Ll/oqp;->b:Ll/kcg0;

    .line 42
    .line 43
    invoke-static {p5}, Ll/psd0;->z(Ll/kcg0;)V

    .line 44
    .line 45
    .line 46
    const-wide/16 v0, 0x3

    .line 47
    .line 48
    sget-object p5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 49
    .line 50
    invoke-static {v0, v1, p5}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p5

    .line 54
    invoke-virtual {p2, p3, p5}, Ll/dq1;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p2, p3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    new-instance v0, Ll/mqp;

    .line 67
    .line 68
    move-object v1, p0

    .line 69
    move-object v4, p1

    .line 70
    invoke-direct/range {v0 .. v6}, Ll/mqp;-><init>(Ll/oqp;Ljava/util/concurrent/atomic/AtomicInteger;ILjava/util/List;J)V

    .line 71
    .line 72
    .line 73
    new-instance p0, Ll/nqp;

    .line 74
    .line 75
    invoke-direct {p0, v1}, Ll/nqp;-><init>(Ll/oqp;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iput-object p0, v1, Ll/oqp;->b:Ll/kcg0;

    .line 87
    .line 88
    iget-object p0, v1, Ll/oqp;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;

    .line 89
    .line 90
    invoke-virtual {p0, v9, p4}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlVoiceActivitiesInChatView;->a0(ZLcom/p1/mobile/putong/live/base/apibean/IntlVoiceLiveActivitiesCellBean$RelationUser;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oqp;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
