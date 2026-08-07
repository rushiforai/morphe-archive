.class public Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->s(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->s(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->s(Landroid/content/Context;)V

    return-void
.end method

.method private s(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/n2i;->b(Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/data/BubbleInfo;I)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->a:Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedVDraweeView;->u(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->d:Lv/VDraweeView;

    .line 17
    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/MineAskPostState;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->c:Lv/VDraweeView;

    .line 30
    .line 31
    sget v1, Ll/lbc0;->F0:I

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->e:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->d:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    goto/16 :goto_1

    .line 47
    .line 48
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->c:Lv/VDraweeView;

    .line 49
    .line 50
    sget v2, Ll/lbc0;->G0:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->e:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/ksg;->F0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->e:Lv/VDraweeView;

    .line 65
    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->d:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-nez v1, :cond_1

    .line 90
    .line 91
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    .line 92
    .line 93
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 94
    .line 95
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-direct {v1, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 99
    .line 100
    .line 101
    :try_start_0
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :catch_0
    move-exception p1

    .line 124
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    const-string v3, "#FFFFFF"

    .line 129
    .line 130
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    .line 136
    .line 137
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->d:Lv/VDraweeView;

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_1
    new-instance p1, Landroid/graphics/drawable/ShapeDrawable;

    .line 147
    .line 148
    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    .line 149
    .line 150
    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-direct {p1, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    const-string v2, "#000000"

    .line 161
    .line 162
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 167
    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->d:Lv/VDraweeView;

    .line 170
    .line 171
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 172
    .line 173
    .line 174
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateHeaderItem;->b:Landroid/widget/TextView;

    .line 175
    .line 176
    if-nez p2, :cond_2

    .line 177
    .line 178
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 179
    .line 180
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->d2:I

    .line 181
    .line 182
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    goto :goto_2

    .line 190
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    .line 194
    .line 195
    :goto_2
    return-void
.end method
