.class public Ll/zx2;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

.field public final b:Ll/ner;

.field public final c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

.field public d:Ll/kcg0;

.field public final e:Ll/cm0;

.field public final f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Ll/cm0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/zx2;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 5
    .line 6
    iput-object p1, p0, Ll/zx2;->b:Ll/ner;

    .line 7
    .line 8
    iput-object p4, p0, Ll/zx2;->f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 9
    .line 10
    iput-object p3, p0, Ll/zx2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 11
    .line 12
    iput-object p5, p0, Ll/zx2;->e:Ll/cm0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/zx2;->g:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;Ll/ruf0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zx2;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 5
    .line 6
    iget-object v1, p0, Ll/zx2;->f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 7
    .line 8
    iget-object v2, p0, Ll/zx2;->g:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/zx2;->d:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/zx2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Ll/zx2;->e:Ll/cm0;

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;->grade:I

    .line 29
    .line 30
    iget-object v2, v2, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 31
    .line 32
    invoke-static {v0, v2}, Ll/vag;->h(ILcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/zx2;->b:Ll/ner;

    .line 39
    .line 40
    invoke-interface {v1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/xx2;

    .line 45
    .line 46
    invoke-direct {v1, p1}, Ll/xx2;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/yx2;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/yx2;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Ll/zx2;->d:Ll/kcg0;

    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;->d:Landroid/view/View;

    .line 66
    .line 67
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;->d:Landroid/view/View;

    .line 72
    .line 73
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/zx2;->d:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/zx2;

    .line 20
    .line 21
    iget-object v2, p0, Ll/zx2;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 22
    .line 23
    iget-object v3, p1, Ll/zx2;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 24
    .line 25
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Ll/zx2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 32
    .line 33
    iget-object v3, p1, Ll/zx2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 34
    .line 35
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Ll/zx2;->e:Ll/cm0;

    .line 42
    .line 43
    iget-object v3, p1, Ll/zx2;->e:Ll/cm0;

    .line 44
    .line 45
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Ll/zx2;->f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 52
    .line 53
    iget-object v3, p1, Ll/zx2;->f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 54
    .line 55
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    iget-object p0, p0, Ll/zx2;->g:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p1, Ll/zx2;->g:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zx2;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardRecord;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zx2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardMedal;

    .line 4
    .line 5
    iget-object v2, p0, Ll/zx2;->e:Ll/cm0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/zx2;->f:Lcom/p1/mobile/putong/live/base/data/BLiveLeaderboardUser;

    .line 8
    .line 9
    iget-object p0, p0, Ll/zx2;->g:Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

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

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->g3:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zx2;->J(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zx2;->K(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubBigWigsUserItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
