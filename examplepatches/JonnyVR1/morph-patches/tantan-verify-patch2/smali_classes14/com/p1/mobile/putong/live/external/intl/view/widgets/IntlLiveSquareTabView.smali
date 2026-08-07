.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/ImageView;

.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 66
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/xec0;->K:I

    .line 5
    .line 6
    invoke-static {p1, v0, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->p(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->h:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->d:Lv/VText;

    .line 21
    .line 22
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->d:Lv/VText;

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 31
    .line 32
    .line 33
    const-string p1, "square-suggested"

    .line 34
    .line 35
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->i:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const-string p1, "voice-live"

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    const/4 p1, 0x2

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->i:I

    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const/4 p1, 0x4

    .line 62
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->i:I

    .line 63
    .line 64
    return-void
.end method

.method private I(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private L(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/sft;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "tooltips_type_ui"

    .line 6
    .line 7
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "e_red_dot_live_icon"

    .line 16
    .line 17
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private O(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->L(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->L(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->I(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 18
    .line 19
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public H(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string v0, "red_dot_figure"

    .line 12
    .line 13
    invoke-direct {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->O(ZLjava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const-string v0, "red_dot_normal"

    .line 28
    .line 29
    invoke-direct {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->O(ZLjava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public M(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "red_dot_figure"

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/mqr;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

    .line 22
    .line 23
    :goto_0
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    instance-of p2, p0, Landroid/widget/TextView;

    .line 30
    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    check-cast p0, Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public P(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "red_dot_figure"

    .line 22
    .line 23
    invoke-static {v0, p0, p1}, Ll/sft;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

    .line 28
    .line 29
    const-string v1, ""

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const-string p0, "red_dot_word"

    .line 40
    .line 41
    invoke-static {p0, v1, p1}, Ll/sft;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 46
    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    const-string p0, "red_dot_normal"

    .line 56
    .line 57
    invoke-static {p0, v1, p1}, Ll/sft;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public getTabID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->h:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "-2"

    .line 9
    .line 10
    return-object p0
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/w9o;->a(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

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

.method public setLiveRedDotNum(I)V
    .locals 4

    .line 1
    invoke-static {}, Ll/mqr;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    move v1, v2

    .line 14
    :cond_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 28
    .line 29
    if-lez p1, :cond_2

    .line 30
    .line 31
    move v1, v2

    .line 32
    :cond_2
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->e:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->f:Lv/VText;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSquareTabView;->g:Landroid/widget/ImageView;

    .line 43
    .line 44
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method
