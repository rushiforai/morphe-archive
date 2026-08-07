.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/o8v;

.field public z:Ll/k9v;


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


# virtual methods
.method public Y4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Y4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/o8v;->P2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public c5()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/o8v;

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
    invoke-direct {v0, v1}, Ll/o8v;-><init>(Ll/nus;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 20
    .line 21
    new-instance v0, Ll/k9v;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/k9v;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->z:Ll/k9v;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ll/o8v;->y2(Ll/k9v;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 40
    .line 41
    const-string v2, "source"

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ll/o8v;->T2(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 51
    .line 52
    const-string v1, "tab_id"

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/o8v;->S2(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public d5()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/o8v;->E2()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/o8v;->F2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->z:Ll/k9v;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/k9v;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public k5()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->A:Ll/o8v;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/o8v;->B2()Ll/nus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->notifyLeaveVoiceSquare()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/tantan/library/svga/SVGALoader;->clear()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
