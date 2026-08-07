.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText_NoTopPadding;

.field public c:Lv/VText_NoTopPadding;

.field public d:Lv/VText_NoTopPadding;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->z(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->B(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/lang/Boolean;Ljava/lang/String;)V

    return-void
.end method

.method private setWatchType(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x2

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, -0x1

    .line 14
    sparse-switch v1, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    :goto_0
    move v0, v5

    .line 18
    goto :goto_1

    .line 19
    :sswitch_0
    const-string v1, "watched"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v2

    .line 29
    goto :goto_1

    .line 30
    :sswitch_1
    const-string v1, "watching"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v3

    .line 40
    goto :goto_1

    .line 41
    :sswitch_2
    const-string v1, "to_watch"

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v0, v4

    .line 51
    :goto_1
    const/4 v1, 0x0

    .line 52
    packed-switch v0, :pswitch_data_0

    .line 53
    .line 54
    .line 55
    move-object v0, v1

    .line 56
    goto :goto_2

    .line 57
    :pswitch_0
    const-string v0, "\u770b\u8fc7"

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :pswitch_1
    const-string v0, "\u5728\u770b"

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :pswitch_2
    const-string v0, "\u60f3\u770b"

    .line 64
    .line 65
    :goto_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 66
    .line 67
    if-eqz p1, :cond_6

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    sparse-switch v6, :sswitch_data_1

    .line 79
    .line 80
    .line 81
    :goto_3
    move v2, v5

    .line 82
    goto :goto_4

    .line 83
    :sswitch_3
    const-string v3, "movie"

    .line 84
    .line 85
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_5

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :sswitch_4
    const-string v2, "book"

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_3

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_3
    move v2, v3

    .line 102
    goto :goto_4

    .line 103
    :sswitch_5
    const-string v2, "teleplay"

    .line 104
    .line 105
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-nez p1, :cond_4

    .line 110
    .line 111
    goto :goto_3

    .line 112
    :cond_4
    move v2, v4

    .line 113
    :cond_5
    :goto_4
    packed-switch v2, :pswitch_data_1

    .line 114
    .line 115
    .line 116
    goto :goto_5

    .line 117
    :pswitch_3
    const-string v1, "\u7535\u5f71"

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :pswitch_4
    const-string v1, "\u4e66\u7c4d"

    .line 121
    .line 122
    goto :goto_5

    .line 123
    :pswitch_5
    const-string v1, "\u7535\u89c6\u5267"

    .line 124
    .line 125
    :cond_6
    :goto_5
    if-eqz v0, :cond_7

    .line 126
    .line 127
    if-eqz v1, :cond_7

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->d:Lv/VText_NoTopPadding;

    .line 130
    .line 131
    const-string p1, "%s\u7684%s"

    .line 132
    .line 133
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    :cond_7
    return-void

    .line 145
    :sswitch_data_0
    .sparse-switch
        -0x554cd1f5 -> :sswitch_2
        0x207e6cb3 -> :sswitch_1
        0x431cd9ae -> :sswitch_0
    .end sparse-switch

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :sswitch_data_1
    .sparse-switch
        -0x51131622 -> :sswitch_5
        0x2e3ae9 -> :sswitch_4
        0x6343f30 -> :sswitch_3
    .end sparse-switch

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public final synthetic B(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->w(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-static {}, Ll/xra;->w()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    sget v0, Ll/dbc0;->G6:I

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget v0, Ll/dbc0;->zn:I

    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->F(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->b:Lv/VText_NoTopPadding;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->c:Lv/VText_NoTopPadding;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "book"

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/Literatures;->authors:Ljava/util/List;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/Literatures;->kinds:Ljava/util/List;

    .line 59
    .line 60
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->v(Ljava/util/List;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->setWatchType(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->userID:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->E(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 87
    .line 88
    .line 89
    :cond_3
    if-eqz p2, :cond_4

    .line 90
    .line 91
    new-instance p2, Ll/f63;

    .line 92
    .line 93
    invoke-direct {p2, p0, p1}, Ll/f63;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_2
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->g(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ll/bkj0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->d:Lv/VText_NoTopPadding;

    .line 32
    .line 33
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v0, Ljava/lang/CharSequence;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->d:Lv/VText_NoTopPadding;

    .line 41
    .line 42
    invoke-static {}, Ll/gra;->z()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    const-string v1, "#B2000000"

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const-string v1, "#FE7E1D"

    .line 52
    .line 53
    :goto_0
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {}, Ll/gra;->z()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    sget v1, Ll/dbc0;->M1:I

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    sget v1, Ll/dbc0;->Z8:I

    .line 74
    .line 75
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {}, Ll/gra;->z()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->F(Ljava/lang/String;Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->setWatchType(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final F(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v0, "movie"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x2

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v0, "book"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v2, 0x1

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v0, "teleplay"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    move v2, v1

    .line 46
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :pswitch_0
    invoke-static {}, Ll/gra;->z()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_4

    .line 55
    .line 56
    if-eqz p2, :cond_3

    .line 57
    .line 58
    sget p1, Ll/dbc0;->sh:I

    .line 59
    .line 60
    :goto_1
    move v1, p1

    .line 61
    goto :goto_2

    .line 62
    :cond_3
    sget p1, Ll/dbc0;->rh:I

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_4
    sget p1, Ll/dbc0;->th:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :pswitch_1
    invoke-static {}, Ll/gra;->z()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_6

    .line 73
    .line 74
    if-eqz p2, :cond_5

    .line 75
    .line 76
    sget p1, Ll/dbc0;->oh:I

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_5
    sget p1, Ll/dbc0;->nh:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_6
    sget p1, Ll/dbc0;->ph:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :pswitch_2
    invoke-static {}, Ll/gra;->z()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_8

    .line 90
    .line 91
    if-eqz p2, :cond_7

    .line 92
    .line 93
    sget p1, Ll/dbc0;->wh:I

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_7
    sget p1, Ll/dbc0;->vh:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_8
    sget p1, Ll/dbc0;->xh:I

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :goto_2
    if-eqz v1, :cond_9

    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->a:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    :cond_9
    return-void

    .line 118
    nop

    .line 119
    :sswitch_data_0
    .sparse-switch
        -0x51131622 -> :sswitch_2
        0x2e3ae9 -> :sswitch_1
        0x6343f30 -> :sswitch_0
    .end sparse-switch

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final G(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V
    .locals 4

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 8
    .line 9
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Literatures;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v3, Ll/g63;

    .line 14
    .line 15
    invoke-direct {v3, p0, p1}, Ll/g63;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v2, v1, v3}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->b:Lv/VText_NoTopPadding;

    .line 14
    .line 15
    const-string v1, "#000000"

    .line 16
    .line 17
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->c:Lv/VText_NoTopPadding;

    .line 25
    .line 26
    const-string v1, "#B2000000"

    .line 27
    .line 28
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->d:Lv/VText_NoTopPadding;

    .line 36
    .line 37
    const-string v0, "#33000000"

    .line 38
    .line 39
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h63;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v(Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, " / "

    .line 11
    .line 12
    invoke-static {p0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final w(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "delete"

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/api/p;->f0:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->setWatchType(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    const-string p0, "[profile progress]"

    .line 21
    .line 22
    const-string p1, "delete myrecent from list"

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v0, Ll/pf60;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "artwork_type"

    .line 18
    .line 19
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/pf60;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "teleplay"

    .line 29
    .line 30
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    const-string v2, "tv_show"

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 42
    .line 43
    :goto_0
    const-string v3, "artwork_title"

    .line 44
    .line 45
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "e_artwork_guess_you_like"

    .line 53
    .line 54
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/item/BookMoviesTxtItem;->G(Lcom/p1/mobile/putong/core/data/LiteraturesComments;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
