.class public Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/core/data/DislikedUsers;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->g(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->f(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static e(I)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    const-string v1, "1km"

    .line 4
    .line 5
    if-gt p0, v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    const/16 v0, 0x3e8

    .line 9
    .line 10
    if-ge p0, v0, :cond_1

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_1
    const v1, 0x186a0

    .line 14
    .line 15
    .line 16
    if-ge p0, v1, :cond_2

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    div-int/2addr p0, v0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, "km"

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "99+km"

    .line 38
    .line 39
    return-object p0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/psj0;->a(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic f(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic g(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p0, p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/data/DislikedUsers;ZLl/x20;Ll/x20;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->h:Lcom/p1/mobile/putong/core/data/DislikedUsers;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DislikedUsers;->userInfo:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->g:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->a:Lv/VDraweeView;

    .line 15
    .line 16
    new-instance v1, Ll/nsj0;

    .line 17
    .line 18
    invoke-direct {v1, p0, p4}, Ll/nsj0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p2, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->e:Lv/VImage;

    .line 25
    .line 26
    new-instance p4, Ll/osj0;

    .line 27
    .line 28
    invoke-direct {p4, p0, p3}, Ll/osj0;-><init>(Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;Ll/x20;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, p4}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 35
    .line 36
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->a:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-virtual {p2, p3, p4, v0}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/ive0;->e()Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-eqz p3, :cond_0

    .line 69
    .line 70
    const-string p3, "\u5c81"

    .line 71
    .line 72
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-nez p3, :cond_1

    .line 80
    .line 81
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 82
    .line 83
    iget p3, p3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 84
    .line 85
    const/16 p4, 0x2710

    .line 86
    .line 87
    if-ge p3, p4, :cond_1

    .line 88
    .line 89
    const-string p3, ", "

    .line 90
    .line 91
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 95
    .line 96
    iget p3, p3, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 97
    .line 98
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->e(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-nez p3, :cond_2

    .line 110
    .line 111
    invoke-static {}, Ll/pzi0;->o()J

    .line 112
    .line 113
    .line 114
    move-result-wide p3

    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 116
    .line 117
    iget-wide v1, v1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 118
    .line 119
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    .line 120
    .line 121
    .line 122
    move-result-wide v1

    .line 123
    sub-long/2addr p3, v1

    .line 124
    const-wide/32 v1, 0x2bf20

    .line 125
    .line 126
    .line 127
    cmp-long p3, p3, v1

    .line 128
    .line 129
    if-gtz p3, :cond_2

    .line 130
    .line 131
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->c:Lv/VText;

    .line 132
    .line 133
    const/4 p4, 0x1

    .line 134
    invoke-static {p3, p4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->c:Lv/VText;

    .line 139
    .line 140
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->d:Lv/VText;

    .line 144
    .line 145
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->e:Lv/VImage;

    .line 149
    .line 150
    sget p3, Ll/gbc0;->p0:I

    .line 151
    .line 152
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    sget p4, Ll/gbc0;->q0:I

    .line 162
    .line 163
    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 17
    .line 18
    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const/4 p1, 0x7

    .line 23
    invoke-static {v0, v1, v3, v4, p1}, Ll/tzi0;->h(JJI)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->f:Lv/VText;

    .line 28
    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    invoke-static {}, Ll/bnl0;->y0()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    sget v2, Ll/qa00;->j:I

    .line 22
    .line 23
    sub-int/2addr v1, v2

    .line 24
    int-to-double v1, v1

    .line 25
    const-wide v3, 0x3ff547ae147ae148L    # 1.33

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    mul-double/2addr v1, v3

    .line 31
    const-wide v3, 0x3fd851eb80000000L    # 0.3799999952316284

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    mul-double/2addr v1, v3

    .line 37
    double-to-int v1, v1

    .line 38
    iget v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 39
    .line 40
    if-eq v2, v1, :cond_0

    .line 41
    .line 42
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/likedusers/tablayout/undolike/UnDoLikedUserItemView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-double v0, v0

    .line 6
    const-wide v2, 0x3ff547ae147ae148L    # 1.33

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    mul-double/2addr v0, v2

    .line 12
    double-to-int v0, v0

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
