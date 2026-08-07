.class public Ll/s9s;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/s9s;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s9s;->N3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V

    return-void
.end method

.method public static synthetic K3(Ll/s9s;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/s9s;->M3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;)V

    return-void
.end method


# virtual methods
.method public final L3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Landroid/text/SpannableStringBuilder;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getMonstersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getMonsterUrlsCount()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    int-to-long v4, v4

    .line 31
    cmp-long v4, v2, v4

    .line 32
    .line 33
    if-ltz v4, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    long-to-int v2, v2

    .line 37
    invoke-virtual {p1, v2}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getMonsterUrls(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "img"

    .line 42
    .line 43
    invoke-virtual {p2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 44
    .line 45
    .line 46
    new-instance v3, Ll/hi20;

    .line 47
    .line 48
    iget-object v4, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    const/16 v5, 0x12

    .line 51
    .line 52
    invoke-direct {v3, v4, v2, v5}, Ll/hi20;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    invoke-virtual {v3, v2}, Ll/sce;->a(I)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v2, v1, 0x3

    .line 60
    .line 61
    const/16 v4, 0x21

    .line 62
    .line 63
    invoke-virtual {p2, v3, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 64
    .line 65
    .line 66
    move v1, v2

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const-string p0, " "

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic M3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;)V
    .locals 3

    .line 1
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDragonScourgeDisplayChatMessage;->isDisplay:Z

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->openDragonPushMsg()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ll/s9s;->L3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;Landroid/text/SpannableStringBuilder;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getTitle()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getSchema()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget v2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->DRAGON_INFO_CHAT_CATEGORY:I

    .line 42
    .line 43
    invoke-virtual {p2, v1, p1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setDragonModuleInfo(Ljava/lang/String;Ljava/lang/String;ILandroid/text/SpannableStringBuilder;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->addDragonInfoMsg()Ll/v3f$d;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getMonstersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getMonsterUrlsList()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;->getTitle()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Ll/s9s;->O3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public final O3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Ll/aiv;->y0(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/r9s;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/r9s;-><init>(Ll/s9s;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$DragonScourgeRecords;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/aj1;->x1:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/q9s;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/q9s;-><init>(Ll/s9s;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
