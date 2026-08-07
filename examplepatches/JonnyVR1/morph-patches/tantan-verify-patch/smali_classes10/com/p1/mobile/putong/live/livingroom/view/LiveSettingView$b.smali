.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F

.field public final synthetic b:Landroid/graphics/Paint;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;FLandroid/graphics/Paint;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->a:F

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->b:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f(Ll/e80;Ll/e80;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e80;->r1()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/e80;->r1()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/e80;->isFirst()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 7
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->J(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Ll/ds3;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    invoke-virtual {p4}, Ll/ds3;->y()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p4

    .line 11
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/e80;

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 25
    .line 26
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->G(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    const/high16 v0, 0x41a00000    # 20.0f

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    const/4 v2, 0x4

    .line 34
    if-ge p3, v2, :cond_1

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 37
    .line 38
    invoke-static {v3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->K(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->I(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move v3, v1

    .line 57
    :goto_0
    if-ge v3, v2, :cond_4

    .line 58
    .line 59
    sub-int v4, p3, v3

    .line 60
    .line 61
    invoke-interface {p4, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Ll/e80;

    .line 66
    .line 67
    invoke-virtual {v4}, Ll/e80;->isFirst()Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_3

    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 74
    .line 75
    invoke-static {v3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->K(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 82
    .line 83
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->I(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    goto :goto_1

    .line 88
    :cond_2
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    goto :goto_1

    .line 93
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    move v0, v1

    .line 97
    :goto_1
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-ge p3, v3, :cond_5

    .line 102
    .line 103
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    check-cast v3, Ll/e80;

    .line 108
    .line 109
    new-instance v4, Ll/fpt;

    .line 110
    .line 111
    invoke-direct {v4, v3}, Ll/fpt;-><init>(Ll/e80;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p4, v4}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    add-int/lit8 v5, p3, 0x1

    .line 119
    .line 120
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    if-ge v5, v6, :cond_5

    .line 125
    .line 126
    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p4

    .line 130
    check-cast p4, Ll/e80;

    .line 131
    .line 132
    invoke-virtual {v3}, Ll/e80;->r1()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    invoke-virtual {p4}, Ll/e80;->r1()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p4

    .line 140
    invoke-static {v3, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p4

    .line 144
    if-nez p4, :cond_5

    .line 145
    .line 146
    sub-int/2addr p3, v4

    .line 147
    rem-int/2addr p3, v2

    .line 148
    rsub-int/lit8 p2, p3, 0x3

    .line 149
    .line 150
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 151
    .line 152
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->H(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 153
    .line 154
    .line 155
    move-result p3

    .line 156
    mul-int/2addr p2, p3

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 158
    .line 159
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->G(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    add-int/2addr p2, p0

    .line 164
    :cond_5
    invoke-virtual {p1, v1, v0, p2, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->K(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/e80;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/e80;->isFirst()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v2}, Ll/e80;->r1()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    int-to-float v3, p3

    .line 46
    int-to-float v1, v1

    .line 47
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->a:F

    .line 48
    .line 49
    add-float/2addr v1, v4

    .line 50
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->c:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;

    .line 51
    .line 52
    invoke-static {v4}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;->I(Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    int-to-float v4, v4

    .line 57
    sub-float/2addr v1, v4

    .line 58
    const/high16 v4, 0x41700000    # 15.0f

    .line 59
    .line 60
    invoke-static {v4}, Ll/bnl0;->w(F)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    int-to-float v4, v4

    .line 65
    add-float/2addr v1, v4

    .line 66
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingView$b;->b:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-virtual {p1, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    :goto_1
    return-void
.end method
