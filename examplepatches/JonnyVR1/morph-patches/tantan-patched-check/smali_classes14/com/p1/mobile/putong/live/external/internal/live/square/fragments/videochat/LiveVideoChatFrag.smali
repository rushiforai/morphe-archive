.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"


# static fields
.field public static KEY_VIDEO_CHAT_PAGE_SOURCE:Ljava/lang/String; = "key_current_page_in_square"


# instance fields
.field private presenter:Ll/rwu;

.field private source:Ljava/lang/String;

.field private viewModel:Ll/ywu;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static l5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static m5(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->KEY_VIDEO_CHAT_PAGE_SOURCE:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->l5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public S4(ZIJ)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/ywu;->w(ZIJ)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->b5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->presenter:Ll/rwu;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rwu;->C2(ZIJ)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->presenter:Ll/rwu;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rwu;->D2()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ywu;->A()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public b5()Z
    .locals 1

    .line 1
    const-string v0, "source_live_square"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->source:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rwu;

    .line 5
    .line 6
    new-instance v1, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-direct {v1, v2, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ll/rwu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->presenter:Ll/rwu;

    .line 19
    .line 20
    new-instance v0, Ll/ywu;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/ywu;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->presenter:Ll/rwu;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ll/cyr;->C(Ll/iam;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->KEY_VIDEO_CHAT_PAGE_SOURCE:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->source:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, "source_live_square"

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    const/4 v0, 0x6

    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->W4(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->Y4()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->presenter:Ll/rwu;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/rwu;->y2()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ywu;->r()V

    .line 7
    .line 8
    .line 9
    const-string p1, "source_live_square"

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->source:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    xor-int/lit8 p1, p1, 0x1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ywu;->B(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->viewModel:Ll/ywu;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ywu;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k5()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_video_quickchat"

    .line 2
    .line 3
    return-object p0
.end method
