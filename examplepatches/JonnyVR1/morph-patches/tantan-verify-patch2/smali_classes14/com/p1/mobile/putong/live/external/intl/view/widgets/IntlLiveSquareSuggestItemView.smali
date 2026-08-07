.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public b:Lv/VFrame;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

.field public e:Landroid/view/ViewStub;

.field public f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

.field public g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

.field public h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

.field public i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

.field public j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

.field public k:Landroid/view/ViewStub;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->c:Lv/VFrame;

    .line 8
    .line 9
    sget v0, Ll/nbc0;->s0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a9o;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAnchorGrade(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->hierarchy:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->s()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Ll/j6t;->e(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->l:Lv/VDraweeView;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->l:Lv/VDraweeView;

    .line 39
    .line 40
    sget v0, Ll/i0k;->a:I

    .line 41
    .line 42
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->s()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setAudienceAmount(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->n:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDistance(Lcom/p1/mobile/putong/data/Location;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->o:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setLiveName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->m:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    if-nez v0, :cond_2

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->e:Landroid/view/ViewStub;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    .line 27
    .line 28
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->p:Landroid/view/View;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareSuggestItemView;->b:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
