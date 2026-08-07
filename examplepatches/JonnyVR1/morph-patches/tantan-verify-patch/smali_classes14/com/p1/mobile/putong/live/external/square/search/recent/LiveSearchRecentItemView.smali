.class public Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rmt;->a(Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/mr2;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v0, p1, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->getCoverUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/high16 v0, 0x430c0000    # 140.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    invoke-static {}, Ll/irn;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v7

    .line 23
    const/4 v8, 0x0

    .line 24
    const-string v0, "context_common"

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;->b:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p1, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 43
    .line 44
    const-string v1, "stopped"

    .line 45
    .line 46
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    xor-int/lit8 v1, v0, 0x1

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;->c:Lv/VText;

    .line 53
    .line 54
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 58
    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    const/4 v0, 0x0

    .line 62
    const-string v2, "recent_browsing"

    .line 63
    .line 64
    const-string v3, "p_live_search"

    .line 65
    .line 66
    invoke-static {v3, v1, v0, v2}, Ll/gnt;->k(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;->c:Lv/VText;

    .line 70
    .line 71
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 72
    .line 73
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 86
    .line 87
    const/4 p1, 0x1

    .line 88
    invoke-static {p0, p1}, Ll/gnt;->e(Ljava/lang/String;Z)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/square/search/recent/LiveSearchRecentItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
