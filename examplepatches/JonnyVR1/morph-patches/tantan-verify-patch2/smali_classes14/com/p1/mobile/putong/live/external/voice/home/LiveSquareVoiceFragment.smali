.class public Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/zpn0;

.field public z:Ll/tpn0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->m5()V

    return-void
.end method

.method public static synthetic l5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method private m5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l6t;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public S4(ZIJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x2

    .line 5
    if-ne p2, p3, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 8
    .line 9
    xor-int/lit8 p3, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p2, p3}, Ll/tpn0;->L2(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ll/tpn0;->N3(Z)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->n5()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    return-void
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tpn0;

    .line 5
    .line 6
    new-instance v1, Ll/nus;

    .line 7
    .line 8
    new-instance v2, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    invoke-direct {v2}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-direct {v1, v2, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, p0, v1}, Ll/tpn0;-><init>(Ll/ner;Ll/nus;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 20
    .line 21
    new-instance v0, Ll/zpn0;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ll/zpn0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->A:Ll/zpn0;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/f7u;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/f7u;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/g7u;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/g7u;-><init>(Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->z:Ll/tpn0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/tpn0;->I2()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;->A:Ll/zpn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/zpn0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n5()V
    .locals 3

    .line 1
    new-instance p0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v0, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    const-string v0, "p_audio_explore_recommend"

    .line 11
    .line 12
    iput-object v0, p0, Ll/q4f;->n:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "audio_tab_id"

    .line 15
    .line 16
    const-string v1, "NA"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "audioroom_entertainment"

    .line 23
    .line 24
    const-string v2, "entertainment_version"

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p0, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_audio_explore_recommend"

    .line 2
    .line 3
    return-object p0
.end method
