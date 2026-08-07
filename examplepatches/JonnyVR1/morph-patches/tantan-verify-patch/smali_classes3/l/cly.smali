.class public Ll/cly;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bly;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

.field public b:Ll/bly;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
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
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;->o0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/cly;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Ll/bly;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cly;->b:Ll/bly;

    .line 2
    .line 3
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<VM:",
            "Ll/cly;",
            ">()",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cly;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/p7o0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cly;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;->setMemberData(Ll/p7o0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cly;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;->v0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bly;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cly;->a(Ll/bly;)V

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

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cly;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cly;->b:Ll/bly;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/online/MemberOnLinePageView;->r0(Ll/bly;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
