.class public Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Bitmap;

.field public c:[Landroid/view/View;

.field public d:Landroid/view/View;

.field public e:[Lv/VDraweeView;

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/qec0;->e0:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    new-array v2, v1, [Landroid/view/View;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c:[Landroid/view/View;

    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    new-array v3, v3, [Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 34
    .line 35
    sget v3, Ll/edc0;->v:I

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const/4 v4, 0x0

    .line 42
    aput-object v3, v2, v4

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c:[Landroid/view/View;

    .line 45
    .line 46
    sget v3, Ll/edc0;->w:I

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v5, 0x1

    .line 53
    aput-object v3, v2, v5

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 56
    .line 57
    sget v3, Ll/edc0;->r:I

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lv/VDraweeView;

    .line 64
    .line 65
    aput-object v3, v2, v4

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 68
    .line 69
    sget v3, Ll/edc0;->s:I

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    check-cast v3, Lv/VDraweeView;

    .line 76
    .line 77
    aput-object v3, v2, v5

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 80
    .line 81
    sget v3, Ll/edc0;->t:I

    .line 82
    .line 83
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lv/VDraweeView;

    .line 88
    .line 89
    aput-object v3, v2, v1

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 92
    .line 93
    sget v2, Ll/edc0;->u:I

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    check-cast v2, Lv/VDraweeView;

    .line 100
    .line 101
    const/4 v3, 0x3

    .line 102
    aput-object v2, v1, v3

    .line 103
    .line 104
    sget v1, Ll/edc0;->N0:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->d:Landroid/view/View;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c()V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 p0, -0x1

    .line 17
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final c()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c:[Landroid/view/View;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v1, :cond_0

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 v3, v3, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 17
    .line 18
    array-length v0, p0

    .line 19
    move v1, v2

    .line 20
    :goto_1
    if-ge v1, v0, :cond_1

    .line 21
    .line 22
    aget-object v3, p0, v1

    .line 23
    .line 24
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    return-void
.end method

.method public d(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->d:Landroid/view/View;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-lez v1, :cond_1

    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c:[Landroid/view/View;

    .line 28
    .line 29
    aget-object v3, v3, v0

    .line 30
    .line 31
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 35
    .line 36
    aget-object v3, v3, v0

    .line 37
    .line 38
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 44
    .line 45
    aget-object v4, v4, v0

    .line 46
    .line 47
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v3, v4, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    if-le v1, v2, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 71
    .line 72
    aget-object v0, v0, v2

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 80
    .line 81
    aget-object v3, v3, v2

    .line 82
    .line 83
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 88
    .line 89
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    const/4 v0, 0x2

    .line 105
    if-le v1, v0, :cond_3

    .line 106
    .line 107
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->c:[Landroid/view/View;

    .line 108
    .line 109
    aget-object v3, v3, v2

    .line 110
    .line 111
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 115
    .line 116
    aget-object v3, v3, v0

    .line 117
    .line 118
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 122
    .line 123
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 124
    .line 125
    aget-object v4, v4, v0

    .line 126
    .line 127
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v3, v4, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    const/4 v0, 0x3

    .line 149
    if-le v1, v0, :cond_4

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 152
    .line 153
    aget-object v1, v1, v0

    .line 154
    .line 155
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->e:[Lv/VDraweeView;

    .line 161
    .line 162
    aget-object p0, p0, v0

    .line 163
    .line 164
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {v1, p0, p1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->a:Landroid/graphics/Paint;

    .line 16
    .line 17
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    .line 18
    .line 19
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    .line 20
    .line 21
    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->a:Landroid/graphics/Paint;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-lez p1, :cond_1

    .line 13
    .line 14
    if-lez p2, :cond_1

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->f:I

    .line 17
    .line 18
    if-ne v0, p1, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->g:I

    .line 21
    .line 22
    if-eq v0, p2, :cond_1

    .line 23
    .line 24
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->f:I

    .line 25
    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->g:I

    .line 27
    .line 28
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 29
    .line 30
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b:Landroid/graphics/Bitmap;

    .line 35
    .line 36
    new-instance v0, Landroid/graphics/Canvas;

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->b:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->f:I

    .line 44
    .line 45
    int-to-float v3, p1

    .line 46
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->g:I

    .line 47
    .line 48
    int-to-float v4, p1

    .line 49
    sget p1, Ll/qa00;->i:I

    .line 50
    .line 51
    int-to-float v5, p1

    .line 52
    int-to-float v6, p1

    .line 53
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupAvatarView;->a:Landroid/graphics/Paint;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method
