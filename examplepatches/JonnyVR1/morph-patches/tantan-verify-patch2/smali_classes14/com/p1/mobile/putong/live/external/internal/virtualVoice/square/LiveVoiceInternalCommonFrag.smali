.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ll/nus;

.field public C:Ll/j7v;

.field public D:Ll/o7v;

.field public E:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ll/nus;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public O4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public S4(ZIJ)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->C:Ll/j7v;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/j7v;->R2(ZIJ)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->D:Ll/o7v;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/o7v;->n(ZIJ)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->Z4(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final X4()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "voice_internal_square_page"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v1, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFrag;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFrag;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFrag;->M4()Ll/nus;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFragNew;->k5()Ll/nus;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->E:Ll/pcj;

    .line 46
    .line 47
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/nus;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 58
    .line 59
    const-string v1, "getHomeInfo null"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/nus;

    .line 68
    .line 69
    new-instance v1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 70
    .line 71
    invoke-direct {v1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-direct {v0, v1, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 75
    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public Y4(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/nus;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->E:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method

.method public final Z4(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    const-string v1, "audio_tab_id"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->z:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "source"

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->A:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Ll/w6u;->b(Ll/l4g0;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-static {p0}, Ll/w6u;->a(Ll/l4g0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d4()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->X4()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->W4(I)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ll/y6s;->e:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->A:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "0"

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->z:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "tab_id_extra"

    .line 30
    .line 31
    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->z:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "source_extra"

    .line 42
    .line 43
    sget-object v2, Ll/y6s;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->A:Ljava/lang/String;

    .line 50
    .line 51
    :cond_0
    new-instance v0, Ll/j7v;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->B:Ll/nus;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->z:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->A:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct {v0, p0, v1, v2, v3}, Ll/j7v;-><init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Ll/nus;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->C:Ll/j7v;

    .line 63
    .line 64
    new-instance v0, Ll/o7v;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/o7v;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;)V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->D:Ll/o7v;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->C:Ll/j7v;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/cyr;->C(Ll/iam;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->C:Ll/j7v;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j7v;->F2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->D:Ll/o7v;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/o7v;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->D:Ll/o7v;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/o7v;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalCommonFrag;->C:Ll/j7v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j7v;->S2()V

    .line 4
    .line 5
    .line 6
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
