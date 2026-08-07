.class public Ll/t7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z7o0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/z7o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;->c(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/t7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 13
    .line 14
    new-instance p0, Ll/s7o0;

    .line 15
    .line 16
    invoke-direct {p0, p2}, Ll/s7o0;-><init>(Ll/z7o0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;->setOnJumpClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/z7o0;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->dismiss()Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/kny;->b(Ll/i6t;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Ll/z7o0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/jic0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;->b:Lv/VRecyclerView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7o0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/member/voiceleaderboard/VoiceMemberLeaderView;->c:Lv/VLinear;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z7o0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/t7o0;->b(Ll/z7o0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
