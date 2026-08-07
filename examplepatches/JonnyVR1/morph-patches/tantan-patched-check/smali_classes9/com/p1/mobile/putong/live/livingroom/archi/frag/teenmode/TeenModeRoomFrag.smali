.class public Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/iam<",
        "Ll/tpi0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VImage;

.field public B:Ll/tpi0;

.field public z:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->S4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->R4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static P4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "LIVE_AUDIENCE_START_DATA"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private R4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "LIVE_AUDIENCE_START_DATA"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->z:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->o(Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic S4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/spi0;->b(Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q4(Ll/tpi0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tpi0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tpi0;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->B:Ll/tpi0;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->B:Ll/tpi0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tpi0;->Z()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->z:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->B:Ll/tpi0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ar2;->a0()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/rpi0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/rpi0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->A:Lv/VImage;

    .line 5
    .line 6
    new-instance v0, Ll/qpi0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/qpi0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tpi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->Q4(Ll/tpi0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/teenmode/TeenModeRoomFrag;->z:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setNeedAdjustUI(Z)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
