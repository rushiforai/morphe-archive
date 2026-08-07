.class public Ll/zxt;
.super Ll/z0u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/z0u<",
        "Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;I)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-direct {p0, p1, v0, v1, p3}, Ll/z0u;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;II)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/zxt;->j:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public F(Ll/j80;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public K()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    invoke-static {v0}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTrackShowLabel;->room_name:Ljava/lang/String;

    .line 26
    .line 27
    return-object v0
.end method

.method public bridge synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxt;->W(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxt;->X(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 8
    .line 9
    .line 10
    const/high16 p0, 0x430c0000    # 140.0f

    .line 11
    .line 12
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getTextureView()Landroid/view/TextureView;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    new-array v2, v2, [Landroid/view/View;

    .line 24
    .line 25
    aput-object v1, v2, v0

    .line 26
    .line 27
    invoke-static {p0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->a:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    const/high16 p1, 0x41200000    # 10.0f

    .line 33
    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {p0, p1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public T()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxt;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public U(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V
    .locals 10

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 38
    .line 39
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 40
    .line 41
    const/high16 v0, 0x430c0000    # 140.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    const/4 v8, 0x1

    .line 52
    const/4 v9, 0x0

    .line 53
    const-string v1, "context_livingAct"

    .line 54
    .line 55
    const/4 v6, 0x1

    .line 56
    const/4 v7, 0x0

    .line 57
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->reason:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v1, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 71
    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 87
    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 91
    .line 92
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rd:I

    .line 93
    .line 94
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 95
    .line 96
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    goto :goto_1

    .line 105
    :cond_1
    iget-object v0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->reason:Ljava/lang/String;

    .line 115
    .line 116
    :goto_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->e:Lv/VText;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 124
    .line 125
    if-eqz p0, :cond_3

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->d:Lv/VText;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    :cond_3
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/z0u;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z0u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;->b:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eq v1, v2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-super {p0, p1}, Ll/z0u;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    return v0

    .line 26
    :cond_2
    check-cast p1, Ll/zxt;

    .line 27
    .line 28
    iget-object p0, p0, Ll/zxt;->j:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p1, p1, Ll/zxt;->j:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_3
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    invoke-super {p0}, Ll/z0u;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/zxt;->j:Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxt;->S(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->w3:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxt;->U(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zxt;->V(Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSiderLiveItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
