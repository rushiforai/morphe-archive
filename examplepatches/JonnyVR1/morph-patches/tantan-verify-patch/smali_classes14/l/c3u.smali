.class public Ll/c3u;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/ldc0;->F1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->z:Lv/VPullDownRefreshLayout;

    .line 10
    .line 11
    sget v0, Ll/ldc0;->t1:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VRecyclerView;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->A:Lv/VRecyclerView;

    .line 20
    .line 21
    sget v0, Ll/ldc0;->S0:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VLinear;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->B:Lv/VLinear;

    .line 30
    .line 31
    sget v0, Ll/ldc0;->C0:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VImage;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->C:Lv/VImage;

    .line 40
    .line 41
    sget v0, Ll/ldc0;->a2:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lv/VText;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;->D:Lv/VText;

    .line 50
    .line 51
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->R0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/c3u;->a(Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
