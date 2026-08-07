.class public Ll/c060;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ljava/util/LinkedList;

.field public final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance v0, Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/c060;->j:Ljava/util/Map;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/t160;

    .line 22
    .line 23
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationEntryBindings;->h:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;

    .line 28
    .line 29
    invoke-direct {p2, p1, v0}, Ll/t160;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationMessageView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 33
    .line 34
    .line 35
    new-instance p2, Ll/vat;

    .line 36
    .line 37
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationEntryBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;

    .line 42
    .line 43
    invoke-direct {p2, p1, v0}, Ll/vat;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/operation/LiveOperationScrollView;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic K3(Ll/c060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->V3(Ll/q260;)V

    return-void
.end method

.method public static synthetic L3(Ll/c060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->c4(Ll/q260;)V

    return-void
.end method

.method public static synthetic M3(Ll/q260;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q260;->g()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic N3(Ll/c060;Ll/q260;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c060;->b4(Ll/q260;)V

    return-void
.end method

.method public static synthetic O3(Ll/c060;Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;)V

    return-void
.end method

.method public static synthetic P3(Ll/c060;Ll/fat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c060;->a4(Ll/fat;)V

    return-void
.end method

.method public static synthetic R3(Ll/c060;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c060;->W3()V

    return-void
.end method

.method public static synthetic S3(Ll/c060;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->Y3(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V

    return-void
.end method

.method public static synthetic T3(Ll/c060;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    return-void
.end method

.method public static synthetic U3(Ll/c060;Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/c060;->Z3(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V

    return-void
.end method

.method private synthetic a4(Ll/fat;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->REFRESH_UNIT:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 2
    .line 3
    iget-object v1, p1, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Ll/fat;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 12
    .line 13
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->showOperationDrawer:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->operations:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/b060;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/b060;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object p1, p1, Ll/fat;->b:Ljava/util/Map;

    .line 29
    .line 30
    invoke-virtual {p0, v0, p1}, Ll/c060;->f4(Ljava/util/List;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :cond_1
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1, p1}, Ll/c060;->f4(Ljava/util/List;Ljava/util/Map;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private synthetic b4(Ll/q260;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c060;->e4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/b260;->c()Ll/b260;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/b260;->d(Ll/dum;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final V3(Ll/q260;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/hiv;->i:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showOperationsItem()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/q260$a;

    .line 24
    .line 25
    const/16 v1, 0x1fa4

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/q260;->e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    iget-object v0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/c060;->i4()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic W3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperation;->REFRESH_UNIT:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/oo2;->G1(Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 12
    .line 13
    const-string v1, "H5PopUp"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openH5Dlg()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/q260$a;

    .line 32
    .line 33
    const/16 v1, 0x1fa4

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/q260$a;->f(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)Ll/q260$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 55
    .line 56
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->isFirstPriority:Z

    .line 57
    .line 58
    iget-object p0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, v0, p1}, Ljava/util/LinkedList;->add(ILjava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;->l0(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationEntryView;->k0(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardResultNotice;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c4(Ll/q260;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/q260;->g()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->jumpScheme:Ljava/lang/String;

    .line 6
    .line 7
    const/16 v0, 0x1fa4

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->hasShow:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->myCardList:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTurboCardInfo;->myCardList:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMyCardInfo;

    .line 21
    .line 22
    :try_start_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMyCardInfo;->cardType:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;->newBuilder()Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;->setType(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$CardTypeEnum;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMyCardInfo;->url:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;->setUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Ll/oo2;->I1(Lcom/p1/mobile/longlink/msg/livemedal/LongLinkMedalMessage$TurboCardReceiveEvent;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    :cond_0
    return-void
.end method

.method public e4()V
    .locals 3

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 11
    .line 12
    new-instance v0, Ll/a060;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/a060;-><init>(Ll/c060;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x1f4

    .line 18
    .line 19
    invoke-virtual {p0, v1, v2, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f4(Ljava/util/List;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/c060;->j:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-lez p2, :cond_1

    .line 29
    .line 30
    new-instance p2, Ll/sz50;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Ll/sz50;-><init>(Ll/c060;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0}, Ll/c060;->i4()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public g4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openH5Drawer()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/q260$a;

    .line 12
    .line 13
    const/16 v1, 0x1fa4

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ll/q260$a;->f(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)Ll/q260$a;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2, p1}, Ll/q260$a;->e(Ljava/lang/String;)Ll/q260$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public h4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 v0, 0x1fa4

    .line 18
    .line 19
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/16 v0, 0x11

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final i4()V
    .locals 4

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/hiv;->i:Z

    .line 10
    .line 11
    if-nez v0, :cond_4

    .line 12
    .line 13
    iget-object v0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 30
    .line 31
    iget-object v1, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 42
    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    const-string v3, "H5Drawer"

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    const-string v1, "TextDrawer"

    .line 61
    .line 62
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget-object v1, p0, Ll/c060;->j:Ljava/util/Map;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 84
    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openOperationMessage()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    new-instance v2, Ll/q260$a;

    .line 98
    .line 99
    const/16 v3, 0x1fa4

    .line 100
    .line 101
    invoke-direct {v2, v3}, Ll/q260$a;-><init>(I)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, v0}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0, v1}, Ll/q260$a;->c(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ll/q260$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ll/q260$a;->a()Ll/q260;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {p0, v0, v1}, Ll/c060;->g4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_3
    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    instance-of v0, v0, Ll/q260;

    .line 131
    .line 132
    if-eqz v0, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->boostStart()Ll/v3f$d;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iget-object p0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    check-cast p0, Ll/q260;

    .line 151
    .line 152
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_4
    :goto_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/hiv;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, v0, Ll/hiv;->i:Z

    .line 14
    .line 15
    invoke-static {}, Ll/b260;->c()Ll/b260;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/b260;->b()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/c060;->i:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/c060;->j:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Landroid/view/View;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/aj1;->I()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/rz50;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/rz50;-><init>(Ll/c060;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/aj1;->H()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/tz50;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/tz50;-><init>(Ll/c060;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    const-string v0, "anchor"

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const-string v0, "audience"

    .line 84
    .line 85
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0, v1, v2}, Ll/aiv;->P0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/uz50;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/uz50;-><init>(Ll/c060;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Ll/aj1;->E()Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Ll/vz50;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/vz50;-><init>(Ll/c060;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->showEntranceAnim()Ll/v3f$d;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Lrx/c;

    .line 168
    .line 169
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    new-instance v1, Ll/wz50;

    .line 174
    .line 175
    invoke-direct {v1, p0}, Ll/wz50;-><init>(Ll/c060;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->refreshOperationMessage()Ll/v3f$d;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Lrx/c;

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v1, Ll/xz50;

    .line 202
    .line 203
    invoke-direct {v1, p0}, Ll/xz50;-><init>(Ll/c060;)V

    .line 204
    .line 205
    .line 206
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 218
    .line 219
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->openH5Dlg()Ll/v3f$d;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    check-cast v0, Lrx/c;

    .line 228
    .line 229
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    new-instance v1, Ll/yz50;

    .line 234
    .line 235
    invoke-direct {v1}, Ll/yz50;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    new-instance v1, Ll/zz50;

    .line 243
    .line 244
    invoke-direct {v1, p0}, Ll/zz50;-><init>(Ll/c060;)V

    .line 245
    .line 246
    .line 247
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    return-void
.end method
