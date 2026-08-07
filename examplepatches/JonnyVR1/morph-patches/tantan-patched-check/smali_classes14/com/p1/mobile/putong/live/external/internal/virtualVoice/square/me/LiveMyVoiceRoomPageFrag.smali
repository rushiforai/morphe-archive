.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/kbv;

.field public z:Ll/fbv;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->destroy()V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->P4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static O4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private P4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->z:Ll/fbv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fbv;->A2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private destroy()V
    .locals 0

    return-void
.end method


# virtual methods
.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hk4;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hk4;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "1002"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hk4;->d(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/fbv;

    .line 15
    .line 16
    invoke-direct {v1, p0, v0}, Ll/fbv;-><init>(Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;Ll/hk4;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->z:Ll/fbv;

    .line 20
    .line 21
    new-instance v1, Ll/kbv;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/kbv;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->A:Ll/kbv;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->z:Ll/fbv;

    .line 29
    .line 30
    invoke-virtual {v2, v1}, Ll/cyr;->C(Ll/iam;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/n8t;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/n8t;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/o8t;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/o8t;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 47
    .line 48
    const-string v1, "audio_tab_id"

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/hk4;->a()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    filled-new-array {v0}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->A:Ll/kbv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kbv;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_audio_explore_recommend"

    .line 2
    .line 3
    return-object p0
.end method
