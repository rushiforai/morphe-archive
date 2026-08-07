.class public Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/vbd0;

.field public z:Ll/tbd0;


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

.method public static M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vbd0;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/vbd0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->A:Ll/vbd0;

    .line 14
    .line 15
    new-instance v0, Ll/tbd0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/tbd0;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->z:Ll/tbd0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->A:Ll/vbd0;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->z:Ll/tbd0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tbd0;->a0()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->z:Ll/tbd0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tbd0;->Q0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListFrag;->A:Ll/vbd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vbd0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
