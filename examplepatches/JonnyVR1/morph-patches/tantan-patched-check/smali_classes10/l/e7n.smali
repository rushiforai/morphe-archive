.class public Ll/e7n;
.super Ll/nn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/nn2<",
        "Ll/rwn0;",
        "Ll/q7n;",
        ">;"
    }
.end annotation


# instance fields
.field public j:J

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public final o:I

.field public p:I

.field public final q:Ll/jxd0;

.field public final r:Ll/xyd0;

.field public s:Ljava/lang/String;

.field public t:Z

.field public u:Ll/c9n;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/nn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->n:I

    .line 5
    .line 6
    iput p1, p0, Ll/e7n;->o:I

    .line 7
    .line 8
    new-instance p1, Ll/jxd0;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "intl_confirm_send_danmaku_dialog_show"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/e7n;->q:Ll/jxd0;

    .line 36
    .line 37
    new-instance p1, Ll/xyd0;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "intl_danmaku_selected_input_hint_"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ljava/util/HashSet;

    .line 60
    .line 61
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-direct {p1, v0, v1}, Ll/xyd0;-><init>(Ljava/lang/String;Ljava/util/HashSet;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Ll/e7n;->r:Ll/xyd0;

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    iput-boolean p1, p0, Ll/e7n;->t:Z

    .line 71
    .line 72
    new-instance p1, Ll/q7n;

    .line 73
    .line 74
    invoke-direct {p1, p0}, Ll/q7n;-><init>(Ll/e7n;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e7n;->u4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic B4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V
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
    iput-object p1, p0, Ll/e7n;->s:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/q7n;

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
    check-cast p1, Ll/q7n;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/q7n;->U()Z

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
    check-cast p1, Ll/q7n;

    .line 40
    .line 41
    iget-object p0, p0, Ll/e7n;->s:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ll/q7n;->d0(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method private M4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/e7n;->t:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->firstInputPlaceholder:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, " "

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/q7n;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->inputPlaceholder:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/q7n;->d0(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object v0, p0, Ll/e7n;->r:Ll/xyd0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/util/HashSet;

    .line 47
    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 55
    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    check-cast v3, Ll/q7n;

    .line 59
    .line 60
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->inputPlaceholder:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v3, p0}, Ll/q7n;->d0(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    check-cast v3, Ll/q7n;

    .line 79
    .line 80
    new-instance v2, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->firstInputPlaceholder:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v3, v1}, Ll/q7n;->d0(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/e7n;->r:Ll/xyd0;

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_3
    :goto_0
    return-void
.end method

.method private Q4()V
    .locals 1

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    iput-object v0, p0, Ll/e7n;->n:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Ll/e7n;->l:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)Ljava/lang/Boolean;
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

.method public static synthetic e4(Ll/e7n;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e7n;->I4(Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic f4(Ll/e7n;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e7n;->G4(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e7n;->J4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic h4(Ll/e7n;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e7n;->E4()V

    return-void
.end method

.method public static synthetic i4(Ll/e7n;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e7n;->L4(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j4(Ll/e7n;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7n;->D4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7n;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic l4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7n;->M4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic m4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e7n;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic n4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7n;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method

.method public static synthetic o4(Ll/e7n;Ll/rz4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7n;->C4(Ll/rz4;)V

    return-void
.end method

.method public static synthetic p4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7n;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V

    return-void
.end method

.method public static synthetic q4(Ll/e7n;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e7n;->F4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic r4(Ll/e7n;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e7n;->A4(Ll/vxj0;)V

    return-void
.end method


# virtual methods
.method public final synthetic C4(Ll/rz4;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/rz4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->getMessageOnly()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "user"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/e7n;->U4(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic D4(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "0"

    .line 3
    .line 4
    invoke-virtual {p0, v0, p1, v1}, Ll/e7n;->X4(ZLjava/lang/CharSequence;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic E4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/q7n;

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
    check-cast p0, Ll/q7n;

    .line 16
    .line 17
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

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

.method public final synthetic F4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/e7n;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G4(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/e7n;->v4(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/widget/CompoundButton;Z)V
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
    check-cast v0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "anchor_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 24
    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "bullet_price"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "bullet_type"

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-eqz p3, :cond_0

    .line 44
    .line 45
    const-string p3, "display_on"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p3, "display_off"

    .line 49
    .line 50
    :goto_0
    const-string v2, "click_op"

    .line 51
    .line 52
    invoke-static {v2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ll/rwn0;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v2, "live_id"

    .line 67
    .line 68
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {v0, v1, p1, p3, p0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "e_live_bullet_popup"

    .line 77
    .line 78
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic I4(Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e7n;->q:Ll/jxd0;

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
    invoke-virtual {p0, p2, p3}, Ll/e7n;->S4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic J4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V
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
    check-cast v0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "anchor_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 24
    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "bullet_price"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "bullet_type"

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v2, "click_op"

    .line 44
    .line 45
    const-string v3, "disappear"

    .line 46
    .line 47
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/rwn0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v3, "live_id"

    .line 62
    .line 63
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    filled-new-array {v0, v1, p1, v2, p0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_live_bullet_popup"

    .line 72
    .line 73
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
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
    check-cast v1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "anchor_id"

    .line 18
    .line 19
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "bullet_price"

    .line 30
    .line 31
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "bullet_type"

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v3, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v3, "click_op"

    .line 44
    .line 45
    const-string v4, "cancel"

    .line 46
    .line 47
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/rwn0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v4, "live_id"

    .line 62
    .line 63
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    filled-new-array {v1, v2, p1, v3, p0}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_live_bullet_popup"

    .line 72
    .line 73
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic L4(Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e7n;->z4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N4(I)V
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
    invoke-virtual {p0, v0}, Ll/e7n;->N4(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public O4(Ljava/lang/Boolean;I)V
    .locals 2

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ll/e7n;->p:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p2, p0, Ll/e7n;->p:I

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    iget p2, p0, Ll/e7n;->p:I

    .line 16
    .line 17
    iget v0, p0, Ll/e7n;->o:I

    .line 18
    .line 19
    add-int/2addr p2, v0

    .line 20
    invoke-virtual {p0, p2}, Ll/e7n;->P4(I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget p2, p0, Ll/e7n;->o:I

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ll/e7n;->N4(I)V

    .line 27
    .line 28
    .line 29
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->keyboardDetectorChange()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v0, Ll/c0r;

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-direct {v0, p1, p2, v1}, Ll/c0r;-><init>(ZIZ)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public P3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/q7n;

    .line 7
    .line 8
    iget-object v0, v0, Ll/q7n;->q:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/n6n;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/n6n;-><init>(Ll/e7n;)V

    .line 16
    .line 17
    .line 18
    const-wide/16 v1, 0xb4

    .line 19
    .line 20
    invoke-virtual {p0, v1, v2, v0}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public P4(I)V
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

.method public R3()V
    .locals 4

    .line 1
    new-instance v0, Ll/c9n;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v3, v2

    .line 8
    check-cast v3, Ll/q7n;

    .line 9
    .line 10
    iget-object v3, v3, Ll/q7n;->n:Lv/VFrame;

    .line 11
    .line 12
    check-cast v2, Ll/q7n;

    .line 13
    .line 14
    iget-object v2, v2, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 15
    .line 16
    invoke-direct {v0, v1, v3, v2, p0}, Ll/c9n;-><init>(Ll/dum;Lv/VFrame;Landroid/view/View;Ll/e7n;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/c9n;

    .line 24
    .line 25
    iput-object v0, p0, Ll/e7n;->u:Ll/c9n;

    .line 26
    .line 27
    new-instance v0, Ll/vbn;

    .line 28
    .line 29
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 30
    .line 31
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v2, Ll/q7n;

    .line 34
    .line 35
    iget-object v2, v2, Ll/q7n;->t:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    invoke-direct {v0, v1, v2}, Ll/vbn;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public R4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/q7n;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q7n;->U()Z

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
    sget v1, Ll/q7n;->C:I

    .line 22
    .line 23
    mul-int/lit8 v2, v1, 0x2

    .line 24
    .line 25
    if-le v0, v2, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J2:I

    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v0, Ll/q7n;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/q7n;->U()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/e7n;->u:Ll/c9n;

    .line 52
    .line 53
    iget-object v0, v0, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0}, Ll/e7n;->T4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/e7n;->u4()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    const-string v0, "user"

    .line 63
    .line 64
    invoke-virtual {p0, p1, v0}, Ll/e7n;->U4(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public S4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1, p2, v0, v1, v2}, Ll/x8n;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    new-instance v0, Ll/s6n;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, Ll/s6n;-><init>(Ll/e7n;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ll/t6n;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/t6n;-><init>(Ll/e7n;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
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
    iput-object v0, p0, Ll/e7n;->s:Ljava/lang/String;

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
    new-instance v1, Ll/v6n;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/v6n;-><init>(Ll/e7n;)V

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
    new-instance v1, Ll/w6n;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/w6n;-><init>(Ll/e7n;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->customChatInputStyle()Ll/v3f$d;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lrx/c;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/x6n;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/x6n;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/y6n;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/y6n;-><init>(Ll/e7n;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/z6n;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/z6n;-><init>(Ll/e7n;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->sendChatMessage()Ll/v3f$d;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Lrx/c;

    .line 158
    .line 159
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/a7n;

    .line 172
    .line 173
    invoke-direct {v1, p0}, Ll/a7n;-><init>(Ll/e7n;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Ll/rwn0;

    .line 188
    .line 189
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Ll/b7n;

    .line 198
    .line 199
    invoke-direct {v1, p0}, Ll/b7n;-><init>(Ll/e7n;)V

    .line 200
    .line 201
    .line 202
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public T4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
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
    iget-object v0, p0, Ll/e7n;->q:Ll/jxd0;

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
    new-instance v3, Ll/o6n;

    .line 54
    .line 55
    invoke-direct {v3, p0, p2}, Ll/o6n;-><init>(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

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
    new-instance v3, Ll/p6n;

    .line 86
    .line 87
    invoke-direct {v3, p0, v1, p1, p2}, Ll/p6n;-><init>(Ll/e7n;Lv/VCheckBox;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v0, Ll/q6n;

    .line 95
    .line 96
    invoke-direct {v0, p0, p2}, Ll/q6n;-><init>(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

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
    new-instance v1, Ll/r6n;

    .line 112
    .line 113
    invoke-direct {v1, p0, p2}, Ll/r6n;-><init>(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

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
    check-cast v0, Ll/rwn0;

    .line 136
    .line 137
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 142
    .line 143
    const-string v1, "anchor_id"

    .line 144
    .line 145
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->price:I

    .line 150
    .line 151
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    const-string v2, "bullet_price"

    .line 156
    .line 157
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    const-string v2, "bullet_type"

    .line 162
    .line 163
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;->type:Ljava/lang/String;

    .line 164
    .line 165
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    check-cast p0, Ll/rwn0;

    .line 174
    .line 175
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    const-string v2, "live_id"

    .line 180
    .line 181
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    filled-new-array {v0, v1, p2, p0}, [Ll/pf60;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    const-string p2, "e_live_bullet_popup"

    .line 190
    .line 191
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_1
    invoke-virtual {p0, p1, p2}, Ll/e7n;->S4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_2
    invoke-virtual {p0, p1, p2}, Ll/e7n;->S4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public U4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/e7n;->s4(Ljava/lang/String;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/vwt;->Y3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance p2, Ll/rz4$a;

    .line 27
    .line 28
    const-string v0, ""

    .line 29
    .line 30
    invoke-direct {p2, v0}, Ll/rz4$a;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    const-string v1, "3"

    .line 50
    .line 51
    iget-object v2, p0, Ll/e7n;->n:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    iget-object v1, p0, Ll/e7n;->l:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 76
    .line 77
    const-string v2, "@"

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_3

    .line 92
    .line 93
    iget-object v1, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v3, p0, Ll/e7n;->l:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v3, p2, Ll/rz4$a;->b:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p2, Ll/rz4$a;->c:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    invoke-direct {p0}, Ll/e7n;->Q4()V

    .line 113
    .line 114
    .line 115
    move-object v1, p1

    .line 116
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    iput-wide v2, p0, Ll/e7n;->j:J

    .line 121
    .line 122
    iput-object v1, p0, Ll/e7n;->k:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ll/rwn0;

    .line 129
    .line 130
    invoke-virtual {v0, v1, p2}, Ll/oo2;->V1(Ljava/lang/String;Ll/rz4$a;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    new-instance v0, Ll/c7n;

    .line 139
    .line 140
    invoke-direct {v0, p0, p1}, Ll/c7n;-><init>(Ll/e7n;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    new-instance p1, Ll/d7n;

    .line 144
    .line 145
    invoke-direct {p1, p0}, Ll/d7n;-><init>(Ll/e7n;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public V4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q7n;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q7n;->i0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W4(Ll/vv4;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Ll/vv4;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/e7n;->n:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "3"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Ll/vv4;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/e7n;->l:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Ll/e7n;->m:Ljava/lang/String;

    .line 23
    .line 24
    :cond_1
    iget-boolean v0, p1, Ll/vv4;->a:Z

    .line 25
    .line 26
    iget-object v1, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p1, p1, Ll/vv4;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1, p1}, Ll/e7n;->X4(ZLjava/lang/CharSequence;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public X4(ZLjava/lang/CharSequence;Ljava/lang/String;)V
    .locals 2

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
    check-cast v1, Ll/q7n;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 12
    .line 13
    .line 14
    const-string v1, "1"

    .line 15
    .line 16
    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    check-cast v1, Ll/q7n;

    .line 25
    .line 26
    const/4 p3, 0x1

    .line 27
    invoke-virtual {v1, p3}, Ll/q7n;->h0(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    check-cast v1, Ll/q7n;

    .line 32
    .line 33
    iget-boolean p3, p0, Ll/e7n;->t:Z

    .line 34
    .line 35
    invoke-virtual {v1, p3}, Ll/q7n;->h0(Z)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 43
    .line 44
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 56
    .line 57
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;->dismissContributeDialog()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-virtual {p3, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p3, Ll/q7n;

    .line 67
    .line 68
    invoke-virtual {p3, p1, p2}, Ll/q7n;->e0(ZLjava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast p0, Ll/q7n;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/q7n;->m0()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final s4(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/e7n;->j:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/vwt;->N4()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/e7n;->t4(Ljava/lang/String;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public final t4(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/vwt;->o4()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide/16 v4, 0x3e8

    .line 14
    .line 15
    mul-long/2addr v2, v4

    .line 16
    iget-wide v4, p0, Ll/e7n;->j:J

    .line 17
    .line 18
    sub-long/2addr v0, v4

    .line 19
    cmp-long p2, v0, v2

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-gez p2, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/e7n;->k:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/2addr p0, v0

    .line 31
    return p0

    .line 32
    :cond_0
    return v0
.end method

.method public u4()V
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
    check-cast v1, Ll/q7n;

    .line 7
    .line 8
    iget-object v1, v1, Ll/q7n;->q:Lv/VEditText;

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    check-cast v0, Ll/q7n;

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
    check-cast v1, Ll/q7n;

    .line 28
    .line 29
    iget-object v1, v1, Ll/q7n;->q:Lv/VEditText;

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
    check-cast p0, Ll/q7n;

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

.method public v4(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v2, 0xa03d

    .line 11
    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/bkg$a;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/bkg$a;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {v0, v1}, Ll/bkg$a;->g(I)Ll/bkg$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "liveGiftDanMuKuClick"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/bkg$a;->j(Ljava/lang/String;)Ll/bkg$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/u6n;

    .line 42
    .line 43
    invoke-direct {v1, p0, p2}, Ll/u6n;-><init>(Ll/e7n;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/bkg$a;->f(Ll/x20;)Ll/bkg$a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Ll/bkg$a;->e()Ll/bkg;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/q7n;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    if-eqz v0, :cond_2

    .line 66
    .line 67
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 68
    .line 69
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 72
    .line 73
    const p2, 0x9ca3

    .line 74
    .line 75
    .line 76
    if-ne p0, p2, :cond_1

    .line 77
    .line 78
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-nez p0, :cond_2

    .line 87
    .line 88
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public final w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/q7n;

    .line 6
    .line 7
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/q7n;->S(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final x4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/q7n;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/q7n;->R(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p2, Ll/q7n;

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSendSuccess()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p2, Ll/z2c;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 41
    .line 42
    invoke-direct {p2, v0, p1}, Ll/z2c;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public y4(Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/snt;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public z4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Ll/q7n;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/q7n;->R(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/e7n;->Q4()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
