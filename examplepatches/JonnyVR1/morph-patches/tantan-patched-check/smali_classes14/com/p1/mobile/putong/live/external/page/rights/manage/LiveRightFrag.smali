.class public Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/bik0;

.field public z:Ll/xhk0;


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

.method public static M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;-><init>()V

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
    new-instance v0, Ll/bik0;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/bik0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->A:Ll/bik0;

    .line 14
    .line 15
    new-instance v0, Ll/xhk0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ll/xhk0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->z:Ll/xhk0;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->A:Ll/bik0;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->A:Ll/bik0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/bik0;->r()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->z:Ll/xhk0;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ll/xhk0;->e0(Landroid/os/Bundle;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightFrag;->A:Ll/bik0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/bik0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
