.class public Ll/mw4;
.super Ll/nn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/nn2<",
        "TD;",
        "Ll/ix4;",
        ">;"
    }
.end annotation


# static fields
.field public static u:Z


# instance fields
.field public j:Ll/cv40;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k:Ll/vw40;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vw40<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final l:I

.field public m:I

.field public final n:Ll/jxd0;

.field public final o:Ll/xyd0;

.field public p:Ljava/lang/String;

.field public q:Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;

.field public r:Ll/pv40;

.field public s:Z

.field public t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/nn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->n:I

    .line 5
    .line 6
    iput v0, p0, Ll/mw4;->l:I

    .line 7
    .line 8
    new-instance v0, Ll/jxd0;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "confirm_send_danmaku_dialog_show"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/mw4;->n:Ll/jxd0;

    .line 36
    .line 37
    new-instance v0, Ll/xyd0;

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "danmaku_selected_input_hint_"

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ljava/util/HashSet;

    .line 60
    .line 61
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-direct {v0, v1, v2}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/mw4;->o:Ll/xyd0;

    .line 68
    .line 69
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/vwt;->i7()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput-boolean v0, p0, Ll/mw4;->s:Z

    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Ll/mw4;->t:Z

    .line 81
    .line 82
    new-instance v0, Ll/ix4;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/ix4;-><init>(Ll/mw4;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 88
    .line 89
    .line 90
    iget-boolean v0, p0, Ll/mw4;->s:Z

    .line 91
    .line 92
    if-eqz v0, :cond_0

    .line 93
    .line 94
    new-instance v0, Ll/pv40;

    .line 95
    .line 96
    invoke-direct {v0, p1}, Ll/pv40;-><init>(Ll/dum;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Ll/pv40;

    .line 104
    .line 105
    iput-object p1, p0, Ll/mw4;->r:Ll/pv40;

    .line 106
    .line 107
    :cond_0
    return-void
.end method

.method public static synthetic d4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mw4;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic e4(Ll/mw4;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/mw4;->w4(Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic f4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mw4;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic g4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mw4;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic h4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mw4;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V

    return-void
.end method

.method public static synthetic i4(Ll/mw4;Ljava/lang/Integer;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mw4;->u4(Ljava/lang/Integer;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j4(Ll/mw4;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mw4;->r4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic k4(Ll/mw4;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mw4;->t4()V

    return-void
.end method

.method public static synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic m4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mw4;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method private synthetic r4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mw4;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ix4;->Y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B4(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;->Hide:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;->SoftKeyBoard:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public C4(Ljava/lang/Boolean;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mw4;->k:Ll/vw40;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vw40;->k4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-lez p2, :cond_1

    .line 12
    .line 13
    iget v1, p0, Ll/mw4;->m:I

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    iput p2, p0, Ll/mw4;->m:I

    .line 18
    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    iget p2, p0, Ll/mw4;->m:I

    .line 26
    .line 27
    iget v1, p0, Ll/mw4;->l:I

    .line 28
    .line 29
    add-int/2addr p2, v1

    .line 30
    invoke-virtual {p0, p2}, Ll/mw4;->E4(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    iget p2, p0, Ll/mw4;->l:I

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/mw4;->B4(I)V

    .line 37
    .line 38
    .line 39
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->keyboardDetectorChange()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v1, Ll/c0r;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-direct {v1, p1, p2, v0}, Ll/c0r;-><init>(ZIZ)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public D4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ix4;->Y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E4(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;->Show:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;->SoftKeyBoard:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public F4(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mw4;->q:Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;

    .line 2
    .line 3
    return-void
.end method

.method public G4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ix4;->Z()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sget v1, Ll/ix4;->F:I

    .line 22
    .line 23
    mul-int/lit8 v1, v1, 0x2

    .line 24
    .line 25
    if-le v0, v1, :cond_0

    .line 26
    .line 27
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->J2:I

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p1, Ll/ix4;->F:I

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v0, Ll/ix4;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/ix4;->Z()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Ll/mw4;->j:Ll/cv40;

    .line 64
    .line 65
    invoke-virtual {v0}, Ll/cv40;->j4()Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, p1, v0}, Ll/mw4;->H4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/mw4;->n4()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    invoke-virtual {p0, p1}, Ll/mw4;->I4(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public H4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->l7()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/mw4;->n:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/yec0;->o0:I

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Ll/mdc0;->q0:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lv/VCheckBox;

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 51
    .line 52
    .line 53
    new-instance v3, Ll/iw4;

    .line 54
    .line 55
    invoke-direct {v3, p0, p2}, Ll/iw4;-><init>(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v3}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3, v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->confirmingText:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 78
    .line 79
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->rd:I

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    new-instance v3, Ll/jw4;

    .line 86
    .line 87
    invoke-direct {v3, p0, v1, p1, p2}, Ll/jw4;-><init>(Ll/mw4;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v0, Ll/kw4;

    .line 95
    .line 96
    invoke-direct {v0, p0, p2}, Ll/kw4;-><init>(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 104
    .line 105
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/lw4;

    .line 112
    .line 113
    invoke-direct {v1, p0, p2}, Ll/lw4;-><init>(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 140
    .line 141
    const-string v1, "anchor_id"

    .line 142
    .line 143
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 148
    .line 149
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    const-string v2, "bullet_price"

    .line 154
    .line 155
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v2, "bullet_type"

    .line 160
    .line 161
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    const-string v2, "live_id"

    .line 176
    .line 177
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    filled-new-array {v0, v1, p2, p0}, [Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    const-string p2, "e_live_bullet_popup"

    .line 186
    .line 187
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 196
    .line 197
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendDanmakuMessage()Ll/v3f$d;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    new-instance v0, Ll/w2c;

    .line 202
    .line 203
    invoke-direct {v0, p1, p2}, Ll/w2c;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    return-void

    .line 210
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendDanmakuMessage()Ll/v3f$d;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    new-instance v0, Ll/w2c;

    .line 221
    .line 222
    invoke-direct {v0, p1, p2}, Ll/w2c;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public I4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/gw40;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/gw40;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public J4(ZLjava/lang/CharSequence;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/mw4;->K4(ZLjava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K4(ZLjava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const/16 v0, 0x27d8

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v1, Ll/ix4;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v1, Ll/ix4;

    .line 17
    .line 18
    iget-boolean v2, p0, Ll/mw4;->s:Z

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/ix4;->i0(Z)V

    .line 21
    .line 22
    .line 23
    iget-boolean v1, p0, Ll/mw4;->s:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    const-string v1, "1"

    .line 28
    .line 29
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-eqz p3, :cond_0

    .line 34
    .line 35
    iget-object p3, p0, Ll/mw4;->j:Ll/cv40;

    .line 36
    .line 37
    invoke-virtual {p3, p4, p5}, Ll/cv40;->i4(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p3, Ll/ix4;

    .line 43
    .line 44
    iget-object p3, p3, Ll/ix4;->r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

    .line 45
    .line 46
    const/4 p4, 0x1

    .line 47
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->setChecked(Z)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-boolean p3, p0, Ll/mw4;->t:Z

    .line 52
    .line 53
    if-eqz p3, :cond_1

    .line 54
    .line 55
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p3, Ll/ix4;

    .line 58
    .line 59
    iget-object p3, p3, Ll/ix4;->r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

    .line 60
    .line 61
    sget-boolean p4, Ll/mw4;->u:Z

    .line 62
    .line 63
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->setChecked(Z)V

    .line 64
    .line 65
    .line 66
    const/4 p3, 0x0

    .line 67
    iput-boolean p3, p0, Ll/mw4;->t:Z

    .line 68
    .line 69
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 74
    .line 75
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 87
    .line 88
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;->dismissContributeDialog()Ll/v3f$d;

    .line 89
    .line 90
    .line 91
    move-result-object p3

    .line 92
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast p3, Ll/ix4;

    .line 98
    .line 99
    invoke-virtual {p3, p1, p2}, Ll/ix4;->g0(ZLjava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 103
    .line 104
    check-cast p0, Ll/ix4;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/ix4;->l0()V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public O3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onChatInputDialogDismiss()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "vipServiceBubble"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Ll/mw4;->B4(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public P3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mw4;->k:Ll/vw40;

    .line 5
    .line 6
    iget-object v1, p0, Ll/mw4;->q:Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;

    .line 7
    .line 8
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v2, Ll/ix4;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/ix4;->Z()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v0, v1, v2}, Ll/vw40;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/ix4;

    .line 22
    .line 23
    iget-object v0, v0, Ll/ix4;->s:Lv/VEditText;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/cw4;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/cw4;-><init>(Ll/mw4;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v1, 0xb4

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public R3()V
    .locals 7

    .line 1
    new-instance v0, Ll/vw40;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/ix4;

    .line 8
    .line 9
    iget-object v2, v2, Ll/ix4;->n:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/vw40;-><init>(Ll/dum;Landroid/widget/LinearLayout;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/vw40;

    .line 19
    .line 20
    iput-object v0, p0, Ll/mw4;->k:Ll/vw40;

    .line 21
    .line 22
    iget-boolean v0, p0, Ll/mw4;->s:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    new-instance v1, Ll/cv40;

    .line 27
    .line 28
    iget-object v2, p0, Ll/xzs;->e:Ll/dum;

    .line 29
    .line 30
    iget-object v4, p0, Ll/mw4;->r:Ll/pv40;

    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    move-object v3, v0

    .line 35
    check-cast v3, Ll/ix4;

    .line 36
    .line 37
    iget-object v5, v3, Ll/ix4;->p:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

    .line 38
    .line 39
    check-cast v0, Ll/ix4;

    .line 40
    .line 41
    iget-object v6, v0, Ll/ix4;->o:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;

    .line 42
    .line 43
    move-object v3, p0

    .line 44
    invoke-direct/range {v1 .. v6}, Ll/cv40;-><init>(Ll/dum;Ll/mw4;Ll/pv40;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ll/cv40;

    .line 52
    .line 53
    iput-object p0, v3, Ll/mw4;->j:Ll/cv40;

    .line 54
    .line 55
    iget-object p0, v3, Ll/cyr;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/ix4;

    .line 58
    .line 59
    iget-object p0, p0, Ll/ix4;->q:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

    .line 60
    .line 61
    new-instance v0, Ll/dw4;

    .line 62
    .line 63
    invoke-direct {v0, v3}, Ll/dw4;-><init>(Ll/mw4;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;->setHeightChangeAction(Lkotlin/jvm/functions/Function1;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xa:I

    .line 5
    .line 6
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/mw4;->p:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lrx/c;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/ew4;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/ew4;-><init>(Ll/mw4;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSelectedItemChange()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lrx/c;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/fw4;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/fw4;-><init>(Ll/mw4;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->customChatInputStyle()Ll/v3f$d;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lrx/c;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/gw4;

    .line 110
    .line 111
    invoke-direct {v1}, Ll/gw4;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Ll/hw4;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/hw4;-><init>(Ll/mw4;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public n4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Ll/ix4;

    .line 7
    .line 8
    iget-object v1, v1, Ll/ix4;->s:Lv/VEditText;

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    check-cast v0, Ll/ix4;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v1, Ll/ix4;

    .line 28
    .line 29
    iget-object v1, v1, Ll/ix4;->s:Lv/VEditText;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/ix4;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public o4(Ljava/lang/String;)Ll/g4$a;
    .locals 1

    .line 1
    const-string v0, "vipServiceBubble"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/ix4;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/mw4;->k:Ll/vw40;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ll/g4$a;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/vw40;->j4(Ljava/lang/String;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v0, p0}, Ll/g4$a;-><init>(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public p4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public q4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ix4;->Z()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->content:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Ll/mw4;->p:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/ix4;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/ix4;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/ix4;->Z()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/ix4;

    .line 40
    .line 41
    iget-object p0, p0, Ll/mw4;->p:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ll/ix4;->f0(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final synthetic t4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/ix4;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/ix4;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic u4(Ljava/lang/Integer;)Lkotlin/Unit;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mw4;->j:Ll/cv40;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cv40;->q4(I)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "anchor_id"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "bullet_price"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "bullet_type"

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p3, :cond_0

    .line 42
    .line 43
    const-string p3, "display_on"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-string p3, "display_off"

    .line 47
    .line 48
    :goto_0
    const-string v2, "click_op"

    .line 49
    .line 50
    invoke-static {v2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v2, "live_id"

    .line 63
    .line 64
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    filled-new-array {v0, v1, p1, p3, p0}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "e_live_bullet_popup"

    .line 73
    .line 74
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic w4(Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mw4;->n:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendDanmakuMessage()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/w2c;

    .line 27
    .line 28
    invoke-direct {v0, p2, p3}, Ll/w2c;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "anchor_id"

    .line 49
    .line 50
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iget v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "bullet_price"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "bullet_type"

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    const-string v1, "click_op"

    .line 75
    .line 76
    const-string v2, "send"

    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v2, "live_id"

    .line 91
    .line 92
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    filled-new-array {p2, v0, p3, v1, p0}, [Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    const-string p2, "e_live_bullet_popup"

    .line 101
    .line 102
    invoke-static {p2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "anchor_id"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "bullet_price"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "bullet_type"

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v2, "click_op"

    .line 42
    .line 43
    const-string v3, "disappear"

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v3, "live_id"

    .line 58
    .line 59
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {v0, v1, p1, v2, p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_live_bullet_popup"

    .line 68
    .line 69
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v2, "anchor_id"

    .line 16
    .line 17
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "bullet_price"

    .line 28
    .line 29
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "bullet_type"

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string v3, "click_op"

    .line 42
    .line 43
    const-string v4, "cancel"

    .line 44
    .line 45
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v4, "live_id"

    .line 58
    .line 59
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    filled-new-array {v1, v2, p1, v3, p0}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "e_live_bullet_popup"

    .line 68
    .line 69
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final z4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->firstInputPlaceholder:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/ix4;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->inputPlaceholder:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ix4;->f0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object v0, p0, Ll/mw4;->o:Ll/xyd0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/util/HashSet;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    check-cast v2, Ll/ix4;

    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->inputPlaceholder:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Ll/ix4;->f0(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    check-cast v2, Ll/ix4;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->firstInputPlaceholder:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ll/ix4;->f0(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/mw4;->o:Ll/xyd0;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :goto_0
    return-void
.end method
