.class public Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public i:Lv/VText;

.field public j:Lv/VButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hlt;->a(Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->e:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 21
    .line 22
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Ll/j6t;->e(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->e:Lv/VDraweeView;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->e:Lv/VDraweeView;

    .line 48
    .line 49
    sget v0, Ll/i0k;->a:I

    .line 50
    .line 51
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->e:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/ts2;->e()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->f:Lv/VText;

    .line 15
    .line 16
    invoke-static {p1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface {v1}, Ll/ts2;->i()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 28
    .line 29
    invoke-static {p1}, Ll/jyn0;->e(Ljava/lang/String;)Ll/ts2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/ts2;->c()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 15
    .line 16
    const/high16 v1, 0x430c0000    # 140.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 32
    .line 33
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->d:Lv/VText;

    .line 39
    .line 40
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/search/widgets/LiveSearchAnchorItemView;->j:Lv/VButton;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
