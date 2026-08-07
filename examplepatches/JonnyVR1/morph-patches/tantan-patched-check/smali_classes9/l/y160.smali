.class public Ll/y160;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;",
        "Ll/fat;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Ll/fat;",
            "Ll/fat;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Ll/zod;Ll/fat;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/y160;->D(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;Ll/zod;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p1, Ll/fat;->b:Ljava/util/Map;

    .line 34
    .line 35
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 47
    .line 48
    new-instance p1, Ll/x160;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/x160;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    iget-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->isInit:Z

    .line 60
    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    iput-boolean p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isForPrepare:Z

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableEntranceAnim()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    iput-boolean p0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isForPrepare:Z

    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public static C(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;Ll/zod;)Ll/fat;
    .locals 3

    .line 1
    new-instance v0, Ll/fat;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fat;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->REFRESH_UNIT:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 9
    .line 10
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 17
    .line 18
    new-instance v2, Ll/w160;

    .line 19
    .line 20
    invoke-direct {v2, p1, v0, p0}, Ll/w160;-><init>(Ll/zod;Ll/fat;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-object v0
.end method

.method public static D(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;Ll/zod;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/zod;->d()Ll/m500;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 6
    .line 7
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->templateId:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Ll/zod;->d()Ll/m500;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/hzc0;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/hzc0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, v2, Ll/hzc0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveOperationHierarchy;

    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationHierarchy;->userHierarchy:I

    .line 33
    .line 34
    int-to-long v3, p1

    .line 35
    iput-wide v3, v2, Ll/hzc0;->c:J

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 42
    .line 43
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->templateId:I

    .line 44
    .line 45
    invoke-virtual {p1, v3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->templateFields:Ljava/util/List;

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->addAllFields(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    const/4 v3, 0x0

    .line 68
    if-eqz p1, :cond_0

    .line 69
    .line 70
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->format:Ljava/util/List;

    .line 75
    .line 76
    invoke-virtual {v1, p0, v0, v2}, Ll/m500;->d(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Ljava/util/List;Ll/hzc0;)Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSpan(Landroid/text/SpannableStringBuilder;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_0

    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 91
    .line 92
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_0

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_0

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_0
    return-object v3
.end method


# virtual methods
.method public E(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)Ll/fat;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->showOperationDrawer:Z

    .line 7
    .line 8
    invoke-static {p2}, Ll/f7t;->t(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    filled-new-array {p2}, [Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iput-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 21
    .line 22
    iget-object p0, p0, Ll/mq2;->c:Ll/zod;

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/y160;->C(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;Ll/zod;)Ll/fat;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.operation.popup"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y160;->E(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/y160;->F(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)Ll/fat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
