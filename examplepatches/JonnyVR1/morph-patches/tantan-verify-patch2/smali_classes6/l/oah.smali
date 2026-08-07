.class public Ll/oah;
.super Ll/r4h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r4h<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:I

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:I

.field public l:Z

.field public m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;IZLjava/lang/String;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "IZ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/r4h;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/oah;->f:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iput-object p1, p0, Ll/oah;->h:Ljava/util/List;

    .line 12
    .line 13
    iput p3, p0, Ll/oah;->k:I

    .line 14
    .line 15
    iput-boolean p4, p0, Ll/oah;->l:Z

    .line 16
    .line 17
    iput-object p5, p0, Ll/oah;->m:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Ll/oah;->g:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public B(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 4

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;

    .line 9
    .line 10
    iget-boolean p4, p0, Ll/oah;->l:Z

    .line 11
    .line 12
    const/high16 v0, 0x41400000    # 12.0f

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object p4, p0, Ll/oah;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    sget v2, Ll/k9c0;->p:I

    .line 26
    .line 27
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 28
    .line 29
    .line 30
    move-result p4

    .line 31
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 42
    .line 43
    .line 44
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 45
    .line 46
    sget-object p4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 47
    .line 48
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 49
    .line 50
    .line 51
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 58
    .line 59
    .line 60
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->b:Lv/VDraweeView;

    .line 61
    .line 62
    sget p4, Ll/lbc0;->U0:I

    .line 63
    .line 64
    invoke-virtual {p3, p4}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->a:Lv/VLinear;

    .line 68
    .line 69
    sget p4, Ll/k9c0;->n0:I

    .line 70
    .line 71
    invoke-virtual {p3, p4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 76
    .line 77
    iget-object v2, p0, Ll/oah;->f:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sget v3, Ll/k9c0;->m:I

    .line 84
    .line 85
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 95
    .line 96
    .line 97
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-virtual {p4, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 100
    .line 101
    .line 102
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 103
    .line 104
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 105
    .line 106
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 107
    .line 108
    .line 109
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->a:Lv/VLinear;

    .line 110
    .line 111
    sget v0, Ll/lbc0;->r4:I

    .line 112
    .line 113
    invoke-virtual {p4, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 114
    .line 115
    .line 116
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup()Z

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    if-eqz p3, :cond_1

    .line 130
    .line 131
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->b:Lv/VDraweeView;

    .line 132
    .line 133
    sget p4, Ll/lbc0;->c1:I

    .line 134
    .line 135
    invoke-virtual {p3, p4}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 136
    .line 137
    .line 138
    :cond_1
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p3

    .line 144
    if-nez p3, :cond_2

    .line 145
    .line 146
    const-string p3, "live_square"

    .line 147
    .line 148
    iget-object p4, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p3

    .line 154
    if-eqz p3, :cond_2

    .line 155
    .line 156
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 157
    .line 158
    iget-object p4, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->b:Lv/VDraweeView;

    .line 159
    .line 160
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {p3, p4, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_2
    iget-object p3, p0, Ll/oah;->m:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->u(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object p2, p0, Ll/oah;->j:Ll/y20;

    .line 171
    .line 172
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p2

    .line 176
    if-eqz p2, :cond_3

    .line 177
    .line 178
    iget-object p0, p0, Ll/oah;->j:Ll/y20;

    .line 179
    .line 180
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    :cond_3
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/oah;->h:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public D(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/oah;->j:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public E(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/oah;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/oah;->B(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;

    .line 2
    .line 3
    iget-object p2, p0, Ll/oah;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Lv/VFrame;

    .line 9
    .line 10
    iget-object v0, p0, Ll/oah;->f:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {p2, v0}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v1, -0x2

    .line 21
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iget-boolean v1, p0, Ll/oah;->l:Z

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    move v1, v2

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/high16 v1, 0x40000000    # 2.0f

    .line 32
    .line 33
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    :goto_0
    iget v3, p0, Ll/oah;->k:I

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 40
    .line 41
    .line 42
    iget-boolean p0, p0, Ll/oah;->l:Z

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->a:Lv/VLinear;

    .line 47
    .line 48
    invoke-static {p0, v2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    return-object p2
.end method
