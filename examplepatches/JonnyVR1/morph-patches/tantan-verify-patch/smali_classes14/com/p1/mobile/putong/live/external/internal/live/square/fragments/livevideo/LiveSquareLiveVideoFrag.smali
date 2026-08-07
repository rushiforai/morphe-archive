.class public Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VRecyclerView;

.field public B:Lv/VLinear;

.field public C:Lv/VImage;

.field public D:Lv/VText;

.field public E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

.field public z:Lv/VPullDownRefreshLayout;


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

.method public static synthetic k5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->r5(Ll/mvc0;)V

    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->s5()V

    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->q5(Ll/mvc0;)V

    return-void
.end method

.method private synthetic q5(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->T3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S4(ZIJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->C0()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/b3u;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/b3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p3, 0x1f4

    .line 16
    .line 17
    invoke-static {p1, p2, p3, p4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->S3(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 5
    .line 6
    new-instance p2, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p2, v0, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/a1u;->S2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Y4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->T3()V

    .line 9
    .line 10
    .line 11
    :cond_0
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

.method public d5()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 5
    .line 6
    new-instance v0, Ll/z2u;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/z2u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p1, v0}, Lv/smart_refresh/SmartRefreshLayout;->G(Z)Ll/mvc0;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 21
    .line 22
    new-instance v0, Ll/a3u;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/a3u;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lv/VPullDownRefreshLayout;->M(Ll/tm50;)Ll/mvc0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->o5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->n5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c3u;->b(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o5(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->I2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->B:Lv/VLinear;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_featured"

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic r5(Ll/mvc0;)V
    .locals 0

    .line 1
    const-string p1, "\u6211\u662f\u6709\u5e95\u7ebf\u7684"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->o()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic s5()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/pzm;->a(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/cmp0;->h()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/cmp0;->d()Ll/cmp0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/cmp0;->a()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->E:Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/a;->S3(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public t5(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/rg80;->a()Ll/rg80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/rg80;->e(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->B:Lv/VLinear;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 16
    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->D:Lv/VText;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string v1, "\u5f53\u524d\u7f51\u7edc\u4e0d\u53ef\u7528"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string v1, "\u6682\u65f6\u6ca1\u6709\u65b0\u7684\u5185\u5bb9"

    .line 30
    .line 31
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->C:Lv/VImage;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    sget p1, Ll/nbc0;->F0:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sget p1, Ll/nbc0;->E0:I

    .line 42
    .line 43
    :goto_1
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
