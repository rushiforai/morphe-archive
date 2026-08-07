.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->P(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->P(Landroid/content/Context;)V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->P(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public P(Landroid/content/Context;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const/high16 v1, 0x41800000    # 16.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v1, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x10

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 23
    .line 24
    .line 25
    sget v0, Ll/lbc0;->H6:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->Q(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->R(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final Q(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 7
    .line 8
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 9
    .line 10
    const/high16 v0, 0x41e00000    # 28.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x41600000    # 14.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-direct {p1, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 39
    .line 40
    const/16 v0, 0x11

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 46
    .line 47
    sget v0, Ll/lbc0;->V:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 53
    .line 54
    const/4 v0, -0x1

    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 59
    .line 60
    const/high16 v0, 0x41200000    # 10.0f

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 66
    .line 67
    const-string v0, "\u533f\u540d"

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final R(Landroid/content/Context;)V
    .locals 4

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 7
    .line 8
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 9
    .line 10
    const/4 v0, -0x2

    .line 11
    invoke-direct {p1, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 20
    .line 21
    const/16 v0, 0x13

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 27
    .line 28
    const/high16 v0, 0x40800000    # 4.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/high16 v2, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {p1, v3, v1, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 49
    .line 50
    const-string v0, "#d84d37"

    .line 51
    .line 52
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 60
    .line 61
    const/high16 v0, 0x41600000    # 14.0f

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public getmAnonymousTextView()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getmContent()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public setAnonymousTextViewVisible(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setContentBackgroundResource(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setContentLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setContentText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setContentTextColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListCombineItemView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
