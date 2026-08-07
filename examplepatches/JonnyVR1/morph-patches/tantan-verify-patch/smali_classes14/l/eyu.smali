.class public Ll/eyu;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

.field public final c:Ll/a1u;

.field public d:Ll/qwl;

.field public final e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final f:I

.field public g:J

.field public h:I

.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/a1u;ILl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            "Ll/a1u;",
            "I",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/eyu;->g:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/eyu;->h:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 12
    .line 13
    iput-object p2, p0, Ll/eyu;->c:Ll/a1u;

    .line 14
    .line 15
    iput-object p4, p0, Ll/eyu;->e:Ll/y20;

    .line 16
    .line 17
    iput p3, p0, Ll/eyu;->f:I

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic H(Ll/eyu;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eyu;->R(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic I(Ll/eyu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eyu;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic J(Ll/eyu;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyu;->e:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic K(Ll/eyu;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/eyu;->h:I

    return p0
.end method

.method public static bridge synthetic L(Ll/eyu;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/eyu;->f:I

    return p0
.end method

.method public static bridge synthetic N(Ll/eyu;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/eyu;->g:J

    return-void
.end method

.method public static bridge synthetic O(Ll/eyu;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/eyu;->h:I

    return-void
.end method


# virtual methods
.method public P()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/eyu;->c:Ll/a1u;

    .line 2
    .line 3
    iget-object p0, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "square-curated"

    .line 10
    .line 11
    invoke-virtual {p1, p0, v1, v0}, Ll/a1u;->R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic R(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eyu;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eyu;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->e:Lv/VFrame;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ynp0;->D(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->h:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->f:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->f:Lv/VText;

    .line 31
    .line 32
    iget-object v2, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->g:Lv/VText;

    .line 42
    .line 43
    iget-object v2, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->d:Lv/VDraweeView;

    .line 53
    .line 54
    iget-object v2, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->profilePicture:Ljava/lang/String;

    .line 59
    .line 60
    sget v3, Ll/qa00;->o:I

    .line 61
    .line 62
    const-string v4, "context_livingAct"

    .line 63
    .line 64
    invoke-static {v4, v0, v2, v1, v3}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/cyu;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/cyu;-><init>(Ll/eyu;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 76
    .line 77
    const-string p1, "https://fe-static.tancdn.com/v1/raw/31515b01-0b72-4801-b382-5b9fa7546bb112.svga"

    .line 78
    .line 79
    const/4 v0, -0x1

    .line 80
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->i:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/eyu;->d:Ll/qwl;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-interface {p1, v0}, Ll/qwl;->b(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/eyu;->i:Ll/kcg0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final U()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/eyu;->d:Ll/qwl;

    .line 2
    .line 3
    iget-object v1, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 12
    .line 13
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 16
    .line 17
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 18
    .line 19
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v5, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 24
    .line 25
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 26
    .line 27
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 28
    .line 29
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    move-object v6, v4

    .line 34
    move-object v4, v3

    .line 35
    move-object v3, v6

    .line 36
    invoke-interface/range {v0 .. v5}, Ll/qwl;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput v0, p0, Ll/eyu;->h:I

    .line 41
    .line 42
    iget-object v0, p0, Ll/eyu;->d:Ll/qwl;

    .line 43
    .line 44
    new-instance v1, Ll/eyu$a;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/eyu$a;-><init>(Ll/eyu;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0, v1}, Ll/qwl;->c(Ll/pwl;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public V()Landroid/util/Pair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eyu;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/eyu;->d:Ll/qwl;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/qwl;->b(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-wide v2, p0, Ll/eyu;->g:J

    .line 15
    .line 16
    const-wide/16 v4, 0x0

    .line 17
    .line 18
    cmp-long v0, v2, v4

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide v6

    .line 26
    cmp-long v0, v2, v6

    .line 27
    .line 28
    if-gez v0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    iget-wide v6, p0, Ll/eyu;->g:J

    .line 35
    .line 36
    sub-long/2addr v2, v6

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move-wide v2, v4

    .line 39
    :goto_0
    iget v0, p0, Ll/eyu;->h:I

    .line 40
    .line 41
    and-int/lit8 v6, v0, 0x4

    .line 42
    .line 43
    const/4 v7, 0x0

    .line 44
    if-lez v6, :cond_2

    .line 45
    .line 46
    and-int/lit8 v6, v0, 0x2

    .line 47
    .line 48
    if-lez v6, :cond_2

    .line 49
    .line 50
    iget-wide v8, p0, Ll/eyu;->g:J

    .line 51
    .line 52
    cmp-long v6, v8, v4

    .line 53
    .line 54
    if-lez v6, :cond_2

    .line 55
    .line 56
    iput-wide v4, p0, Ll/eyu;->g:J

    .line 57
    .line 58
    iput v7, p0, Ll/eyu;->h:I

    .line 59
    .line 60
    new-instance p0, Landroid/util/Pair;

    .line 61
    .line 62
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_2
    and-int/lit8 v0, v0, 0x4

    .line 73
    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    move v1, v7

    .line 78
    :goto_1
    iput-wide v4, p0, Ll/eyu;->g:J

    .line 79
    .line 80
    iput v7, p0, Ll/eyu;->h:I

    .line 81
    .line 82
    new-instance p0, Landroid/util/Pair;

    .line 83
    .line 84
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-object p0
.end method

.method public W(Ll/qwl;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eyu;->d:Ll/qwl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/qwl;->b(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/eyu;->i:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/eyu;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {p1}, Ll/qwl;->i()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/eyu;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iput-object p1, p0, Ll/eyu;->d:Ll/qwl;

    .line 37
    .line 38
    invoke-interface {p1}, Ll/qwl;->reset()V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    invoke-interface {p1, v0}, Ll/qwl;->setMute(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/eyu;->a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;->e:Lv/VFrame;

    .line 48
    .line 49
    invoke-interface {p1, v0}, Ll/qwl;->f(Landroid/widget/FrameLayout;)V

    .line 50
    .line 51
    .line 52
    sget-object p1, Ll/iit;->Companion:Ll/iit$a;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/iit$a;->N()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget-object v0, p0, Ll/eyu;->c:Ll/a1u;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-array v1, v1, [Ljava/lang/Object;

    .line 65
    .line 66
    invoke-static {p1, v0, v1}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    new-instance v0, Ll/dyu;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/dyu;-><init>(Ll/eyu;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Ll/eyu;->i:Ll/kcg0;

    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public X(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyu;->d:Ll/qwl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/qwl;->setMute(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->Y0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eyu;->S(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eyu;->T(Lcom/p1/mobile/putong/live/external/view/widgets/LiveSquareLiveVideoItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
