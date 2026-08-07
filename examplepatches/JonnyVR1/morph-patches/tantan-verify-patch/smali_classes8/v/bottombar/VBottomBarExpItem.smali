.class public Lv/bottombar/VBottomBarExpItem;
.super Lv/bottombar/VBottomBarDefaultItem;
.source "SourceFile"


# instance fields
.field public h:Landroid/view/View;

.field public i:Lcom/tantan/library/svga/SVGAnimationView;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/bottombar/VBottomBarExpItem;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lv/bottombar/VBottomBarExpItem;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lv/bottombar/VBottomBarExpItem;->c()V

    return-void
.end method

.method public static bridge synthetic e(Lv/bottombar/VBottomBarExpItem;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic f(Lv/bottombar/VBottomBarExpItem;)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    invoke-super {p0}, Lv/bottombar/VBottomBarDefaultItem;->b()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 5
    .line 6
    iget-object v1, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, v1, Lv/bottombar/a;->g:Ljava/lang/String;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, v1, Lv/bottombar/a;->f:Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lv/bottombar/VBottomBarExpItem;->g(Ljava/lang/String;IZ)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, v0, v2}, Lv/bottombar/VBottomBarExpItem;->d(ZZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/gec0;->c:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    const/4 v2, -0x2

    .line 25
    const/4 v3, -0x1

    .line 26
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/vcc0;->k0:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lv/VText;

    .line 46
    .line 47
    iput-object v1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 48
    .line 49
    sget v1, Ll/vcc0;->U:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    .line 56
    .line 57
    sget v1, Ll/vcc0;->L0:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 64
    .line 65
    iput-object v0, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 66
    .line 67
    sget v0, Ll/vcc0;->g:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lv/RedPointView;

    .line 74
    .line 75
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 76
    .line 77
    sget v0, Ll/vcc0;->Y:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lv/VOnlineIndicator;

    .line 84
    .line 85
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 86
    .line 87
    sget v0, Ll/vcc0;->G:I

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lv/VImage;

    .line 94
    .line 95
    iput-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 96
    .line 97
    return-void
.end method

.method public d(ZZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    .line 25
    .line 26
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 27
    .line 28
    iget p2, p2, Lv/bottombar/a;->d:I

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p1, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    .line 35
    .line 36
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 37
    .line 38
    iget p2, p2, Lv/bottombar/a;->d:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 44
    .line 45
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget v2, Ll/z8c0;->w:I

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget v2, Ll/z8c0;->l:I

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    :goto_1
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p1, v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_2
    iget-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 83
    .line 84
    iget-object p2, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    .line 85
    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 89
    .line 90
    iget p1, p1, Lv/bottombar/a;->e:I

    .line 91
    .line 92
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    sget v2, Ll/z8c0;->v:I

    .line 102
    .line 103
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_3
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 112
    .line 113
    iget p1, p1, Lv/bottombar/a;->c:I

    .line 114
    .line 115
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    sget v2, Ll/z8c0;->o:I

    .line 125
    .line 126
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    :goto_2
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 134
    .line 135
    const/4 p2, 0x0

    .line 136
    invoke-virtual {p1, v1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 137
    .line 138
    .line 139
    :goto_3
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 140
    .line 141
    iget-object p1, p1, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 142
    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    iget p2, p1, Lv/bottombar/a$a;->b:I

    .line 146
    .line 147
    iget-boolean v1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 148
    .line 149
    if-eqz v1, :cond_4

    .line 150
    .line 151
    iget-object p1, p1, Lv/bottombar/a$a;->f:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_4
    iget-object p1, p1, Lv/bottombar/a$a;->e:Ljava/lang/String;

    .line 155
    .line 156
    :goto_4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_5

    .line 161
    .line 162
    invoke-virtual {p0, p1, p2, v0}, Lv/bottombar/VBottomBarExpItem;->g(Ljava/lang/String;IZ)V

    .line 163
    .line 164
    .line 165
    :cond_5
    return-void
.end method

.method public final g(Ljava/lang/String;IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarExpItem;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    iput-object p1, p0, Lv/bottombar/VBottomBarExpItem;->j:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lv/bottombar/VBottomBarExpItem;->j:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Lv/bottombar/VBottomBarExpItem$b;

    .line 43
    .line 44
    invoke-direct {p2, p0, p3}, Lv/bottombar/VBottomBarExpItem$b;-><init>(Lv/bottombar/VBottomBarExpItem;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Lv/bottombar/VBottomBarExpItem$a;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Lv/bottombar/VBottomBarExpItem$a;-><init>(Lv/bottombar/VBottomBarExpItem;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public getIconView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarExpItem;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public setDarkMode(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lv/bottombar/VBottomBarDefaultItem;->setDarkMode(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/bottombar/VBottomBarExpItem;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
