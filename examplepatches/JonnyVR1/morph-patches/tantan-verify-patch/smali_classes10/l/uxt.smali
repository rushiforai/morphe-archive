.class public Ll/uxt;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

.field public final j:Ll/f9c;

.field public final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/vwt;->o5()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/uxt;->i:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 13
    .line 14
    new-instance p1, Ll/f9c;

    .line 15
    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const-string v3, "live_sider_entry_last_click_time"

    .line 20
    .line 21
    invoke-direct {p1, v3, v0, v1, v2}, Ll/f9c;-><init>(Ljava/lang/String;JZ)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/uxt;->j:Ll/f9c;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll/uxt;->k:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic J3(Ll/uxt;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->c4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic K3(Ll/uxt;Ll/i9f0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->a4(Ll/i9f0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/wwt;)Ljava/util/List;
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Ll/wwt;->f(I)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic M3(Ll/uxt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxt;->f4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Ll/uxt;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->d4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O3(Ll/uxt;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->g4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic P3(Ll/uxt;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->e4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/uxt;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uxt;->h4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/uxt;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uxt;->b4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method private synthetic f4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/uxt;->k4()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/uxt;->m4()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/uxt;->X3()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic h4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private l4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/uxt;->W3()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "e_live_room_recommend"

    .line 10
    .line 11
    invoke-static {v1, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lxt;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lxt;-><init>(Ll/uxt;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/i9f0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/mxt;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/mxt;-><init>(Ll/uxt;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final T3(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final U3(Z)Z
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uxt;->Z3()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    xor-int/lit8 p0, p1, 0x1

    .line 21
    .line 22
    return p0
.end method

.method public final V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public final W3()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string v1, "liveId"

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 24
    .line 25
    const-string v1, "onlive"

    .line 26
    .line 27
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const-string p0, "onLive"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "endLive"

    .line 37
    .line 38
    :goto_0
    const-string v1, "liveStatus"

    .line 39
    .line 40
    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_1
    return-object v0
.end method

.method public X3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->p(Z)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Ll/uxt;->T3(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final Y3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final Z3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/ogd0;->U0()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public final synthetic a4(Ll/i9f0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uxt;->Y3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->p(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic c4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->j()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/n6t;->a()Ll/n6t;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/n6t;->e()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic d4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/uxt;->U3(Z)Z

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

.method public final synthetic g4(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/uxt;->j4(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->m(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/uxt;->n4()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->l()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public i4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uxt;->j:Ll/f9c;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/f9c;->b()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->V4(ZZ)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-direct {p0}, Ll/uxt;->l4()V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wrv;->H()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/mjj;->i()V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final j4(I)Z
    .locals 8

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x0

    .line 3
    if-lt p1, v0, :cond_6

    .line 4
    .line 5
    iget-object p1, p0, Ll/uxt;->i:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->motionEffective:Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;

    .line 12
    .line 13
    invoke-static {}, Ll/n6t;->a()Ll/n6t;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->show:Z

    .line 18
    .line 19
    iget-object p0, p0, Ll/uxt;->j:Ll/f9c;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;

    .line 22
    .line 23
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->unopenedEntranceDays:I

    .line 24
    .line 25
    invoke-virtual {p0, v3}, Ll/f9c;->a(I)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->m()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x1

    .line 38
    if-eqz v3, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;

    .line 45
    .line 46
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->unwatchDays:I

    .line 47
    .line 48
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->j(I)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-gt v3, v4, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    move v3, v1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    :goto_0
    move v3, v4

    .line 58
    :goto_1
    invoke-virtual {v0}, Ll/n6t;->c()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;

    .line 63
    .line 64
    iget v7, v6, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->maxShowPerDay:I

    .line 65
    .line 66
    if-ge v5, v7, :cond_3

    .line 67
    .line 68
    move v5, v4

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    move v5, v1

    .line 71
    :goto_2
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->maxShowPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 72
    .line 73
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->n:I

    .line 74
    .line 75
    invoke-virtual {v0, v6}, Ll/n6t;->b(I)I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;

    .line 80
    .line 81
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->maxShowPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 82
    .line 83
    iget v7, v7, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->max:I

    .line 84
    .line 85
    if-ge v6, v7, :cond_4

    .line 86
    .line 87
    move v6, v4

    .line 88
    goto :goto_3

    .line 89
    :cond_4
    move v6, v1

    .line 90
    :goto_3
    invoke-virtual {v0}, Ll/n6t;->d()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;

    .line 95
    .line 96
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceLimitation;->maxShow:I

    .line 97
    .line 98
    if-ge v0, p1, :cond_5

    .line 99
    .line 100
    move p1, v4

    .line 101
    goto :goto_4

    .line 102
    :cond_5
    move p1, v1

    .line 103
    :goto_4
    if-eqz v2, :cond_6

    .line 104
    .line 105
    if-eqz p0, :cond_6

    .line 106
    .line 107
    if-eqz v3, :cond_6

    .line 108
    .line 109
    if-eqz v5, :cond_6

    .line 110
    .line 111
    if-eqz v6, :cond_6

    .line 112
    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    return v4

    .line 116
    :cond_6
    :goto_5
    return v1
.end method

.method public k4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->p(Z)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/uxt;->T3(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final m4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/uxt;->W3()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "e_live_room_recommend"

    .line 10
    .line 11
    invoke-static {v1, v0, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final n4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uxt;->i:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->motionEffective:Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;

    .line 4
    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->k()V

    .line 10
    .line 11
    .line 12
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMotionEffective;->showAfterWatchSeconds:J

    .line 13
    .line 14
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {v0, v1, v2}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/sxt;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/sxt;-><init>(Ll/uxt;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/txt;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/txt;-><init>(Ll/uxt;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uxt;->V3()Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->T4(Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/nxt;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/nxt;-><init>(Ll/uxt;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/oxt;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/oxt;-><init>(Ll/uxt;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/bgd0;

    .line 55
    .line 56
    const/16 v1, 0x6a4

    .line 57
    .line 58
    invoke-direct {v0, v1}, Ll/bgd0;-><init>(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/agd0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/agd0;->t()Ll/v5m;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;

    .line 74
    .line 75
    invoke-interface {v0}, Ll/v5m;->c()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/other/side/entry/LiveSiderEntryView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0}, Ll/v5m;->e()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/pxt;

    .line 87
    .line 88
    invoke-direct {v1}, Ll/pxt;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/qxt;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/qxt;-><init>(Ll/uxt;)V

    .line 102
    .line 103
    .line 104
    new-instance v2, Ll/rxt;

    .line 105
    .line 106
    invoke-direct {v2, p0}, Ll/rxt;-><init>(Ll/uxt;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    return-void
.end method
