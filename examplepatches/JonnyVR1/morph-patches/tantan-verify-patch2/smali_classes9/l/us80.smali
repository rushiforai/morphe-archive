.class public Ll/us80;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/mu40;",
        "Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;>;"
        }
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/live/base/data/BLive;

.field public k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

.field public l:Lv/VRelative;

.field public m:Z

.field public n:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

.field public o:I

.field public p:Z

.field public q:Lcom/p1/mobile/android/app/Dialog;

.field public r:Z

.field public s:Z

.field public final t:Ll/xs80;

.field public u:Ll/wyd0;

.field public v:Ll/jxd0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Lv/VRelative;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Ll/us80;->o:I

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/us80;->r:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/us80;->s:Z

    .line 16
    .line 17
    new-instance p1, Ll/xs80;

    .line 18
    .line 19
    invoke-direct {p1}, Ll/xs80;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/us80;->t:Ll/xs80;

    .line 23
    .line 24
    new-instance v0, Ll/wyd0;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "liveMode"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "normal"

    .line 47
    .line 48
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/us80;->u:Ll/wyd0;

    .line 52
    .line 53
    new-instance v0, Ll/jxd0;

    .line 54
    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v2, "isAgreement"

    .line 58
    .line 59
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 63
    .line 64
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Ll/us80;->v:Ll/jxd0;

    .line 81
    .line 82
    iput-object p2, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 83
    .line 84
    iput-object p4, p0, Ll/us80;->l:Lv/VRelative;

    .line 85
    .line 86
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ll/xs80;->a()V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Ll/us80;->init()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public static synthetic A4(Ll/us80;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->g5(Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->O4(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C4(Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->P4(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E4(Ljava/util/Map;)V
    .locals 2

    .line 1
    const-string v0, "isFirstTry"

    .line 2
    .line 3
    const-string v1, "false"

    .line 4
    .line 5
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic F4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->d5(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->B5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic H4(Ll/us80;Ll/vs80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->Y4(Ll/vs80;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I4(Ll/us80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->j5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

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

.method public static synthetic J4(Ll/us80;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/us80;->n5(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->h5(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->w5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    return-void
.end method

.method public static bridge synthetic L4(Ll/us80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->T5()V

    return-void
.end method

.method public static synthetic M3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->l5(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)V

    return-void
.end method

.method public static synthetic N3(Ll/us80;Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/us80;->H5(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method public static synthetic O3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->A5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic P3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->C5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private P5()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/us80;->t:Ll/xs80;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xs80;->c()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/us80;->q:Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/us80;->q:Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/us80;->q:Lcom/p1/mobile/android/app/Dialog;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic R3(Ll/us80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/us80;->b5(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic S3(Ll/us80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->y5()V

    return-void
.end method

.method public static synthetic T3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->E5(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    return-void
.end method

.method public static synthetic U3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->G5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V3(Ll/us80;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/us80;->z5(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ll/us80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->r5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X3(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->t5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic Z4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->I5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a4(Ll/us80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->e5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b4(Ll/us80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->m5(Landroid/view/View;)V

    return-void
.end method

.method private synthetic b5(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lrx/subjects/a;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/us80;->j:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 7
    .line 8
    const-string p1, "stopped"

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->F5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->f5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLive;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->S5(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic h4(Ll/us80;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->p5(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->q5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "back-from-official-show"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/us80;->U4()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->c:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->a:Lv/VImage;

    .line 35
    .line 36
    new-instance v1, Ll/ss80;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ss80;-><init>(Ll/us80;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "anchor_preview_show"

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {p0, v0, v1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->h:Lv/VCheckBox;

    .line 57
    .line 58
    iget-object v2, p0, Ll/us80;->v:Ll/jxd0;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->h:Lv/VCheckBox;

    .line 80
    .line 81
    new-instance v2, Ll/vq80;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Ll/vq80;-><init>(Ll/us80;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 90
    .line 91
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 92
    .line 93
    check-cast v0, Ll/mu40;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/mu40;->M2()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_1

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/us80;->U4()V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 105
    .line 106
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 107
    .line 108
    const-string v1, "friends"

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->i0(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget-object v1, p0, Ll/us80;->t:Ll/xs80;

    .line 122
    .line 123
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    new-instance v2, Ll/wq80;

    .line 127
    .line 128
    invoke-direct {v2, v1}, Ll/wq80;-><init>(Ll/xs80;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    new-instance v0, Ll/xq80;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Ll/xq80;-><init>(Ll/us80;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v0}, Ll/us80;->a6(Ll/x20;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Ll/mu40;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v2, Ll/mbt;

    .line 162
    .line 163
    invoke-direct {v2}, Ll/mbt;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v2}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    new-instance v2, Ll/yq80;

    .line 171
    .line 172
    invoke-direct {v2, p0}, Ll/yq80;-><init>(Ll/us80;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object v2, p0, Ll/us80;->t:Ll/xs80;

    .line 191
    .line 192
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    new-instance v3, Ll/wq80;

    .line 196
    .line 197
    invoke-direct {v3, v2}, Ll/wq80;-><init>(Ll/xs80;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ll/us80;->N4()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {p0, v1}, Ll/us80;->a6(Ll/x20;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 214
    .line 215
    new-instance v1, Ll/zq80;

    .line 216
    .line 217
    invoke-direct {v1, p0}, Ll/zq80;-><init>(Ll/us80;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    new-instance v1, Ll/ar80;

    .line 229
    .line 230
    invoke-direct {v1, p0}, Ll/ar80;-><init>(Ll/us80;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    new-instance v1, Ll/cr80;

    .line 238
    .line 239
    invoke-direct {v1, p0}, Ll/cr80;-><init>(Ll/us80;)V

    .line 240
    .line 241
    .line 242
    new-instance v2, Ll/ts80;

    .line 243
    .line 244
    invoke-direct {v2, p0}, Ll/ts80;-><init>(Ll/us80;)V

    .line 245
    .line 246
    .line 247
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 252
    .line 253
    .line 254
    invoke-static {}, Ll/aiv;->E0()Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v1, Ll/rq80;

    .line 263
    .line 264
    invoke-direct {v1, p0}, Ll/rq80;-><init>(Ll/us80;)V

    .line 265
    .line 266
    .line 267
    new-instance v2, Ll/sq80;

    .line 268
    .line 269
    invoke-direct {v2}, Ll/sq80;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 277
    .line 278
    .line 279
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 280
    .line 281
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u4(Ljava/lang/String;)Lrx/c;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    new-instance v1, Ll/tq80;

    .line 294
    .line 295
    invoke-direct {v1, p0}, Ll/tq80;-><init>(Ll/us80;)V

    .line 296
    .line 297
    .line 298
    new-instance p0, Ll/uq80;

    .line 299
    .line 300
    invoke-direct {p0}, Ll/uq80;-><init>()V

    .line 301
    .line 302
    .line 303
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 308
    .line 309
    .line 310
    return-void
.end method

.method public static synthetic j4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->k5(Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;)V

    return-void
.end method

.method public static synthetic k4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->u5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->D5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m4(Ll/us80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/us80;->v5(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n4(Ll/us80;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->c5(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic o4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->i5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic p4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->W5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic q4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r4(Lcom/p1/mobile/putong/live/base/data/BLivePkSeek;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s4(Ll/us80;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->a5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic t4(Ll/us80;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->x5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v4(Ll/us80;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->o5(Ll/jsv;)V

    return-void
.end method

.method public static synthetic w4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x4(Ll/us80;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/us80;->Z4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic y4(Ll/iit;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z4(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->s5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/us80;->o:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/us80;->o:I

    .line 6
    .line 7
    iget-object v0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 8
    .line 9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const-string p1, "anchor_preivew_stop_live"

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, p1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic B5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/us80;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ud:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/us80;->m:Z

    .line 13
    .line 14
    iget-object v0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 15
    .line 16
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/hs80;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/hs80;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "anchor_preivew_start_live"

    .line 31
    .line 32
    invoke-static {p0, v0, p1}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic C5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic D5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/vwt;->b5()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 22
    .line 23
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n5(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic E5(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iput-object p1, p0, Ll/us80;->n:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->m0(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic F5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jsv;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic G5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/mu40;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/jsv;->f()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final synthetic H5(Ll/x20;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->status:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCoverStatus;

    .line 8
    .line 9
    const-string v2, "pending"

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h0(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h0(Z)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->mTempTitle:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->mTempTitle:Ljava/lang/String;

    .line 55
    .line 56
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->n0(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->mTempTitle:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    invoke-interface {p1}, Ll/x20;->call()V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void
.end method

.method public I5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->setPreviewContentVisibility(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public J5()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/us80;->n:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/us80;->Q5(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Ll/us80;->n:Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;

    .line 10
    .line 11
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 12
    .line 13
    if-lez v2, :cond_0

    .line 14
    .line 15
    const-wide/16 v3, 0x3e8

    .line 16
    .line 17
    div-long v3, v0, v3

    .line 18
    .line 19
    const-wide/16 v5, 0x0

    .line 20
    .line 21
    cmp-long v3, v3, v5

    .line 22
    .line 23
    if-gtz v3, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    if-lez v2, :cond_1

    .line 27
    .line 28
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 29
    .line 30
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->X9:I

    .line 31
    .line 32
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {p0, v0, v1}, Ll/tzi0;->e(Landroid/content/Context;J)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v2, v3, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 v0, 0x1

    .line 47
    invoke-static {p0, v0, v0}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 52
    .line 53
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ra:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e0()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public K5()V
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
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/us80;->O5()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ll/wrv;->F0(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

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
    new-instance v1, Ll/rs80;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/rs80;-><init>(Ll/us80;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public L5()V
    .locals 2

    .line 1
    new-instance v0, Ll/c210;

    .line 2
    .line 3
    const/16 v1, 0xa28

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/c210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/szl;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/szl;->f()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final M4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;",
            ")",
            "Lrx/c<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/us80;->X4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 24
    .line 25
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z6(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public M5(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/mu40;->T2(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->pushTypeChanged()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final N4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/us80;->R4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/or80;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/or80;-><init>(Ll/us80;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pr80;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/pr80;-><init>(Ll/us80;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/qr80;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/qr80;-><init>(Ll/us80;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final N5()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->A6()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/cs80;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/cs80;-><init>(Ll/us80;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/ds80;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/ds80;-><init>(Ll/us80;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final O4(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->V4(Lcom/p1/mobile/putong/live/base/data/BLive;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget v2, p0, Ll/us80;->o:I

    .line 9
    .line 10
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/mu40;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/mu40;->M2()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/us80;->W5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget p0, p0, Ll/us80;->o:I

    .line 34
    .line 35
    if-lt p0, v1, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    const/4 v1, 0x0

    .line 39
    :cond_3
    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final O5()V
    .locals 4

    .line 1
    const-string v0, "p_anchor_live_ready"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xs80;->e(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;->clearRoomFakeId()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Ll/us80;->s:Z

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ud:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->getTitle()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 62
    .line 63
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->b7:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->s0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    sget-object v1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 84
    .line 85
    const-string v2, "create_live_room"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 93
    .line 94
    const-string v2, "back-from-official-show"

    .line 95
    .line 96
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 107
    .line 108
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Za:I

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 115
    .line 116
    .line 117
    :cond_2
    const/4 v1, 0x1

    .line 118
    iput-boolean v1, p0, Ll/us80;->m:Z

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Ll/mu40;

    .line 125
    .line 126
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 127
    .line 128
    invoke-virtual {v2}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v1, v0, v2}, Ll/mu40;->L2(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    new-instance v2, Ll/rr80;

    .line 141
    .line 142
    invoke-direct {v2, p0}, Ll/rr80;-><init>(Ll/us80;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    new-instance v2, Ll/sr80;

    .line 150
    .line 151
    invoke-direct {v2, p0}, Ll/sr80;-><init>(Ll/us80;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    new-instance v2, Ll/tr80;

    .line 159
    .line 160
    invoke-direct {v2, p0}, Ll/tr80;-><init>(Ll/us80;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    new-instance v2, Ll/ur80;

    .line 168
    .line 169
    invoke-direct {v2, p0}, Ll/ur80;-><init>(Ll/us80;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    new-instance v2, Ll/vr80;

    .line 177
    .line 178
    invoke-direct {v2, p0}, Ll/vr80;-><init>(Ll/us80;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    new-instance v2, Ll/wr80;

    .line 186
    .line 187
    invoke-direct {v2, p0, v0}, Ll/wr80;-><init>(Ll/us80;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    new-instance v1, Ll/yr80;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/yr80;-><init>(Ll/us80;)V

    .line 201
    .line 202
    .line 203
    new-instance v2, Ll/zr80;

    .line 204
    .line 205
    invoke-direct {v2, p0}, Ll/zr80;-><init>(Ll/us80;)V

    .line 206
    .line 207
    .line 208
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public final P4(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/us80;->r:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->isDefaultCover:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/us80;->r:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/am0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/am0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0, p1}, Ll/am0;->k(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_1
    const-string p0, "room is null"

    .line 50
    .line 51
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return-object p0
.end method

.method public Q4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->C3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final Q5(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)J
    .locals 2

    .line 1
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->availableTime:D

    .line 2
    .line 3
    double-to-long p0, p0

    .line 4
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    sub-long/2addr p0, v0

    .line 11
    return-wide p0
.end method

.method public R2()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_anchor_live_ready"

    .line 2
    .line 3
    return-object p0
.end method

.method public final R4()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/us80;->j:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->C5(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/as80;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/as80;-><init>(Ll/us80;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/bs80;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/bs80;-><init>(Ll/us80;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final R5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/us80;->Q4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->r6()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/us80;->u:Ll/wyd0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/mu40;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mu40;->K2()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public S4()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/mu40;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final S5(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 7
    .line 8
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->on:Z

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCall()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->r6()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->k0()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 24
    .line 25
    iget-object v1, p0, Ll/us80;->u:Ll/wyd0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->i0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    sget-object v0, Ll/htd0;->b:Ll/htd0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/jfv;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/jfv;->f()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W2:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V2:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->A0()Lcom/p1/mobile/android/app/Dialog;

    .line 71
    .line 72
    .line 73
    :cond_1
    new-instance v0, Ll/qq80;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/qq80;-><init>(Ll/us80;)V

    .line 76
    .line 77
    .line 78
    const-class v1, Ll/vs80;

    .line 79
    .line 80
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->dismissBeautyDialog()Ll/v3f$c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lrx/c;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/br80;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/br80;-><init>(Ll/us80;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lrx/c;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/mr80;

    .line 136
    .line 137
    invoke-direct {v1}, Ll/mr80;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v1, Ll/xr80;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/xr80;-><init>(Ll/us80;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    new-instance v0, Ll/w1f;

    .line 157
    .line 158
    const/16 v1, 0xa28

    .line 159
    .line 160
    invoke-direct {v0, v1}, Ll/w1f;-><init>(I)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Ll/wsl;

    .line 168
    .line 169
    new-instance v1, Ll/eft;

    .line 170
    .line 171
    new-instance v2, Ll/us80$a;

    .line 172
    .line 173
    invoke-direct {v2, p0}, Ll/us80$a;-><init>(Ll/us80;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {v1, v2}, Ll/eft;-><init>(Ll/rwl;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v0, v1}, Ll/wsl;->b(Ll/w6m;)V

    .line 180
    .line 181
    .line 182
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Ll/ere;->r()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyRecoverLiveStopped()Ll/v3f$c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v1, Ll/is80;

    .line 200
    .line 201
    invoke-direct {v1, p0}, Ll/is80;-><init>(Ll/us80;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    new-instance v1, Ll/ps80;

    .line 216
    .line 217
    invoke-direct {v1}, Ll/ps80;-><init>()V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-instance v1, Ll/qs80;

    .line 225
    .line 226
    invoke-direct {v1, p0}, Ll/qs80;-><init>(Ll/us80;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public final T4(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "preview"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "start-live-button"

    .line 11
    .line 12
    return-object p0
.end method

.method public final T5()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/us80;->s:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 13
    .line 14
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z9:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->S4:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 49
    .line 50
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->q7:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/lr80;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/lr80;-><init>(Ll/us80;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public U4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public U5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->j0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final V4(Lcom/p1/mobile/putong/live/base/data/BLive;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 2
    .line 3
    const-string v0, "suspended"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 12
    .line 13
    const-string v0, "onlive"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 22
    .line 23
    const-string p1, "born"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public V5()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "beauty"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->setPreviewContentVisibility(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final W4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/pf60;

    .line 16
    .line 17
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final W5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/us80;->u:Ll/wyd0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->i0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "obs"

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget v0, p0, Ll/us80;->o:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    iput v0, p0, Ll/us80;->o:I

    .line 32
    .line 33
    iget-object p0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 34
    .line 35
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    iget-object v0, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->anchorSource:Ljava/lang/String;

    .line 48
    .line 49
    const-string v2, "back-from-official-show"

    .line 50
    .line 51
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->switchRoomData:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    new-instance v0, Ll/vdu;

    .line 64
    .line 65
    invoke-direct {v0}, Ll/vdu;-><init>()V

    .line 66
    .line 67
    .line 68
    iput v1, v0, Ll/vdu;->a:I

    .line 69
    .line 70
    iget-object v2, p0, Ll/us80;->k:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 71
    .line 72
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->switchRoomData:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;

    .line 73
    .line 74
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;->avatarUrl:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v3, v0, Ll/vdu;->b:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$OfficialShowSwitchRoomData;->name:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v2, v0, Ll/vdu;->c:Ljava/lang/String;

    .line 81
    .line 82
    const-string v2, "\u5df2\u7ed3\u675f\u672c\u6b21\u516c\u6f14\uff0c\u611f\u8c22\u53c2\u4e0e\uff5e"

    .line 83
    .line 84
    iput-object v2, v0, Ll/vdu;->d:Ljava/lang/String;

    .line 85
    .line 86
    const-string v2, "\u77e5\u9053\u4e86"

    .line 87
    .line 88
    iput-object v2, v0, Ll/vdu;->e:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->LiveTipEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

    .line 95
    .line 96
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;->showTip()Ll/v3f$d;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_1
    iget-boolean v0, p0, Ll/us80;->s:Z

    .line 104
    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ud:I

    .line 108
    .line 109
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    iput-boolean v1, p0, Ll/us80;->m:Z

    .line 114
    .line 115
    iget-object p0, p0, Ll/us80;->i:Lrx/subjects/a;

    .line 116
    .line 117
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 118
    .line 119
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    invoke-static {p1}, Ll/u9t;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    const/4 v2, 0x0

    .line 136
    if-nez v1, :cond_4

    .line 137
    .line 138
    new-instance p1, Ll/th0$a;

    .line 139
    .line 140
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    invoke-direct {p1, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 143
    .line 144
    .line 145
    const-string v1, "\u60a8\u6709\u4e00\u573a\u516c\u6f14\u6b63\u5728\u8fdb\u884c\u4e2d"

    .line 146
    .line 147
    invoke-virtual {p1, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    const-string v1, "\u53bb\u516c\u6f14"

    .line 152
    .line 153
    invoke-virtual {p1, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    new-instance v1, Ll/es80;

    .line 158
    .line 159
    invoke-direct {v1, p0, v0}, Ll/es80;-><init>(Ll/us80;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    sget p1, Ll/n9c0;->d:I

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 197
    .line 198
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->gb:I

    .line 199
    .line 200
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 209
    .line 210
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->db:I

    .line 211
    .line 212
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    new-instance v3, Ll/fs80;

    .line 217
    .line 218
    invoke-direct {v3, p0, p1}, Ll/fs80;-><init>(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 226
    .line 227
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->fb:I

    .line 228
    .line 229
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    new-instance v3, Ll/gs80;

    .line 234
    .line 235
    invoke-direct {v3, p0, p1}, Ll/gs80;-><init>(Ll/us80;Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    iput-object p1, p0, Ll/us80;->q:Lcom/p1/mobile/android/app/Dialog;

    .line 251
    .line 252
    return-void
.end method

.method public final X4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->getTitle()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    return p0
.end method

.method public final X5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/us80;->W4()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->startLive()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/dft;

    .line 16
    .line 17
    iget-object v2, p0, Ll/us80;->j:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {p0, v3}, Ll/us80;->T4(Ljava/lang/Boolean;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v1, p1, v2, p0}, Ll/dft;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic Y4(Ll/vs80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->U5()Z

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

.method public Y5()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/us80;->S4()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->getTitle()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->mTempTitle:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "from_preview"

    .line 30
    .line 31
    invoke-static {p0, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x64

    .line 36
    .line 37
    invoke-virtual {v1, p0, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Z5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingId:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "quit"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->n6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/js80;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/js80;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/ks80;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/ks80;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingSeekId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingSeekId:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->X3(Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/ls80;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/ls80;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance v2, Ll/ms80;

    .line 70
    .line 71
    invoke-direct {v2}, Ll/ms80;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingInviteId:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingInviteId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W3(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance p1, Ll/ns80;

    .line 104
    .line 105
    invoke-direct {p1}, Ll/ns80;-><init>()V

    .line 106
    .line 107
    .line 108
    new-instance v0, Ll/os80;

    .line 109
    .line 110
    invoke-direct {v0}, Ll/os80;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    :cond_2
    return-void
.end method

.method public final synthetic a5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/us80;->s:Z

    .line 3
    .line 4
    return-void
.end method

.method public final a6(Ll/x20;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mu40;->R2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/dr80;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/dr80;-><init>(Ll/us80;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/er80;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/er80;-><init>(Ll/us80;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/fr80;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/fr80;-><init>(Ll/us80;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/gr80;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/gr80;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/mu40;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/ew40;->f()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/hr80;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/hr80;-><init>(Ll/us80;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/ir80;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/ir80;-><init>(Ll/us80;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/jr80;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1}, Ll/jr80;-><init>(Ll/us80;Ll/x20;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final synthetic c5(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic d5(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mu40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/us80;->V4(Lcom/p1/mobile/putong/live/base/data/BLive;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final synthetic e5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/us80;->m:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLive;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/us80;->j:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 2
    .line 3
    return-object p1
.end method

.method public final synthetic g5(Ll/pf60;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Ll/us80;->p:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 30
    .line 31
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final synthetic h5(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/us80;->W4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/us80;->p:Z

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLive;->isMultiCall()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string v0, "friends"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->role:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bf10;->I(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iput-object p1, p0, Ll/us80;->j:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 36
    .line 37
    iget-boolean p0, p0, Ll/us80;->m:Z

    .line 38
    .line 39
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public final synthetic i5(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/us80;->X5(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic k5(Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x190

    .line 12
    .line 13
    invoke-static {v0}, Ll/px50;->c(I)Ll/px50$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;->jumpUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/px50$a;->x()Ll/px50$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic l5(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 4
    .line 5
    new-instance v1, Ll/nr80;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/nr80;-><init>(Ll/us80;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g0(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic m5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/us80;->l:Lv/VRelative;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->callOnClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n5(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/us80;->v:Ll/jxd0;

    .line 4
    .line 5
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic o5(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Ll/us80;->l:Lv/VRelative;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/us80;->U4()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ll/us80;->P5()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/us80;->R5()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p1, p0, Ll/us80;->l:Lv/VRelative;

    .line 29
    .line 30
    const/4 v0, 0x4

    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 37
    .line 38
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    const-string v1, ""

    .line 51
    .line 52
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->n0(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/us80;->t:Ll/xs80;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xs80;->d()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic p5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/us80;->N5()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-static {p0}, Ll/pn0;->l(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/kr80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/kr80;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic q5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->O5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0x9c41

    .line 10
    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/us80;->O5()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

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
.end method

.method public final synthetic s5(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/us80;->R4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic t5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/us80;->W4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/us80;->V4(Lcom/p1/mobile/putong/live/base/data/BLive;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/us80;->p:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic u5(Lcom/p1/mobile/putong/live/base/data/BLive;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/us80;->p:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ll/mu40;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic v5(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/us80;->M4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic w5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 9
    .line 10
    const-string v0, "create_live_room"

    .line 11
    .line 12
    const-string v1, "checkNeedPatchRoom"

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->startLive()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/dft;

    .line 28
    .line 29
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Ll/us80;->T4(Ljava/lang/Boolean;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v0, v1, v2, p0}, Ll/dft;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic x5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/us80;->m:Z

    .line 10
    .line 11
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 12
    .line 13
    if-eqz p0, :cond_3

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 16
    .line 17
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 18
    .line 19
    const v0, 0xa035

    .line 20
    .line 21
    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 25
    .line 26
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yd:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 36
    .line 37
    const v0, 0xa040

    .line 38
    .line 39
    .line 40
    if-ne p0, v0, :cond_2

    .line 41
    .line 42
    const/4 p0, 0x2

    .line 43
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string p0, "\u4f60\u5df2\u63d0\u4ea4\u4e86\u8ba4\u8bc1\u7533\u8bf7\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85\u5ba1\u6838\u7ed3\u679c"

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void

    .line 61
    :cond_3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 62
    .line 63
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic y5()V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/hve0;->x(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y9:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic z5(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->recoverOfficialShow()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
