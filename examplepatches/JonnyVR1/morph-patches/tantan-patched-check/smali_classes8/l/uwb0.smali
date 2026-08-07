.class public Ll/uwb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

.field public b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uwb0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Ll/uwb0;Lcom/p1/mobile/putong/core/data/FeedbackQuestion;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uwb0;->j(Lcom/p1/mobile/putong/core/data/FeedbackQuestion;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m8()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 0

    .line 1
    sget p0, Ll/kec0;->mb:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 4
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iput-object p2, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/d0;->R3()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget p3, Ll/adc0;->o0:I

    .line 18
    .line 19
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    check-cast p3, Lv/VDraweeView;

    .line 24
    .line 25
    sget p4, Ll/adc0;->hb:I

    .line 26
    .line 27
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Landroid/widget/LinearLayout;

    .line 32
    .line 33
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    const-string v0, "https://auto.tancdn.com/v1/raw/28687c8d-6e5d-4ab7-8f1f-1a232c3816df14.webp"

    .line 36
    .line 37
    invoke-virtual {p4, p3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 41
    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    if-eqz p3, :cond_0

    .line 52
    .line 53
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    check-cast p3, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;

    .line 58
    .line 59
    new-instance p4, Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 60
    .line 61
    iget-object v0, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-direct {p4, v0}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    const/high16 v0, 0x41700000    # 15.0f

    .line 67
    .line 68
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 69
    .line 70
    .line 71
    const/16 v0, 0x11

    .line 72
    .line 73
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/c9c0;->p:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p3, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->text:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    sget v0, Ll/qa00;->j:I

    .line 97
    .line 98
    int-to-float v0, v0

    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    new-array v1, v1, [F

    .line 102
    .line 103
    const/4 v2, 0x0

    .line 104
    aput v0, v1, v2

    .line 105
    .line 106
    const/4 v3, 0x1

    .line 107
    aput v0, v1, v3

    .line 108
    .line 109
    const/4 v3, 0x2

    .line 110
    aput v0, v1, v3

    .line 111
    .line 112
    const/4 v3, 0x3

    .line 113
    aput v0, v1, v3

    .line 114
    .line 115
    const/4 v3, 0x4

    .line 116
    aput v0, v1, v3

    .line 117
    .line 118
    const/4 v3, 0x5

    .line 119
    aput v0, v1, v3

    .line 120
    .line 121
    const/4 v3, 0x6

    .line 122
    aput v0, v1, v3

    .line 123
    .line 124
    const/4 v3, 0x7

    .line 125
    aput v0, v1, v3

    .line 126
    .line 127
    new-instance v0, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 128
    .line 129
    const/4 v3, 0x0

    .line 130
    invoke-direct {v0, v1, v3, v3}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 131
    .line 132
    .line 133
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    .line 134
    .line 135
    invoke-direct {v1, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v3, "#D8F5FF"

    .line 143
    .line 144
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p4, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    const/high16 v0, 0x42900000    # 72.0f

    .line 155
    .line 156
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 161
    .line 162
    .line 163
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 164
    .line 165
    const/4 v1, -0x1

    .line 166
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 167
    .line 168
    .line 169
    const/high16 v1, 0x3f800000    # 1.0f

    .line 170
    .line 171
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 172
    .line 173
    sget v1, Ll/qa00;->i:I

    .line 174
    .line 175
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 176
    .line 177
    invoke-virtual {p1, p4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Ll/swb0;

    .line 181
    .line 182
    invoke-direct {v0, p0, p3}, Ll/swb0;-><init>(Ll/uwb0;Lcom/p1/mobile/putong/core/data/FeedbackQuestion;)V

    .line 183
    .line 184
    .line 185
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 186
    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :cond_0
    new-instance p2, Ll/uwb0$a;

    .line 191
    .line 192
    invoke-direct {p2, p0, p1}, Ll/uwb0$a;-><init>(Ll/uwb0;Landroid/widget/LinearLayout;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, p2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    const-string p1, "e_swipe_noverify_inquiry"

    .line 205
    .line 206
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 210
    .line 211
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 212
    .line 213
    const-string p1, "card"

    .line 214
    .line 215
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/d0;->r4(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/core/data/FeedbackQuestion;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/uwb0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->C:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/b;->A2()Ll/f1g0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    invoke-interface {p2, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 12
    .line 13
    .line 14
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->a0:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PartialListOpt;->loaded:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    const/4 v0, 0x1

    .line 35
    if-ne p2, v0, :cond_0

    .line 36
    .line 37
    new-instance p2, Ll/twb0;

    .line 38
    .line 39
    invoke-direct {p2}, Ll/twb0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/FeedbackQuestion;->data:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "stat_id"

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameters(Ljava/lang/String;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-object v0, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    const-string p2, ""

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    const/4 v1, 0x0

    .line 73
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Ljava/lang/String;

    .line 78
    .line 79
    :goto_0
    const-string v1, "inquiry_source"

    .line 80
    .line 81
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    filled-new-array {p2}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    const-string v1, "e_swipe_noverify_inquiry"

    .line 90
    .line 91
    invoke-static {v1, v0, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/uwb0;->b:Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    invoke-static {p0, p1}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method
