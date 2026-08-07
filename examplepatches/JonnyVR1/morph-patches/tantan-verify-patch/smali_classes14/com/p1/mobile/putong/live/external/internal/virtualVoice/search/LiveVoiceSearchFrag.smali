.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field private presenter:Ll/acv;

.field private viewModel:Ll/icv;


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

.method public static synthetic M4(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->P4(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->destroy()V

    return-void
.end method

.method public static O4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private P4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->presenter:Ll/acv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/acv;->C2()V

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
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/icv;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/icv;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->viewModel:Ll/icv;

    .line 10
    .line 11
    new-instance v0, Ll/acv;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/acv;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->presenter:Ll/acv;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->viewModel:Ll/icv;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/cyr;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/rbv;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/rbv;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/sbv;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/sbv;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->viewModel:Ll/icv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/icv;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    const-string p0, "p_audio_search"

    .line 2
    .line 3
    return-object p0
.end method
