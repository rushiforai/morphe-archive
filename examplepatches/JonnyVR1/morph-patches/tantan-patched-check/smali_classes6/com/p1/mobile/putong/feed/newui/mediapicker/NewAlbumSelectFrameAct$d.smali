.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:I

.field public final d:I

.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->c:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->E(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 4
    .line 5
    new-instance p2, Lv/VImage;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {p2, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->E2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lv/VImage;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->v2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 35
    .line 36
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lv/VImage;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lv/VImage;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_0
    new-instance p1, Lv/VDraweeView;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    invoke-direct {p1, p0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 57
    .line 58
    .line 59
    return-object p1
.end method

.method public E(Landroid/view/View;Ljava/lang/String;II)V
    .locals 3

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lv/VImage;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    check-cast p1, Lv/VDraweeView;

    .line 18
    .line 19
    rem-int/lit8 p2, p4, 0x2

    .line 20
    .line 21
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 22
    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->C()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    const/4 p3, 0x1

    .line 42
    sub-int/2addr p2, p3

    .line 43
    const/4 v0, 0x0

    .line 44
    if-ne p4, p2, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Ll/wlj;

    .line 51
    .line 52
    new-instance p3, Lcom/facebook/drawee/generic/RoundingParams;

    .line 53
    .line 54
    invoke-direct {p3}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 58
    .line 59
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    int-to-float v1, v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    int-to-float v2, v2

    .line 71
    invoke-virtual {p3, v0, v1, v2, v0}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p2, p3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 76
    .line 77
    .line 78
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 79
    .line 80
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 81
    .line 82
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->A2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->C()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    add-int/lit8 v1, v1, -0x2

    .line 97
    .line 98
    mul-int/2addr v0, v1

    .line 99
    sub-int/2addr p3, v0

    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 101
    .line 102
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    if-ne p4, p3, :cond_3

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    check-cast p2, Ll/wlj;

    .line 117
    .line 118
    new-instance p3, Lcom/facebook/drawee/generic/RoundingParams;

    .line 119
    .line 120
    invoke-direct {p3}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 124
    .line 125
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    int-to-float v1, v1

    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 131
    .line 132
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    int-to-float v2, v2

    .line 137
    invoke-virtual {p3, v1, v0, v0, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    invoke-virtual {p2, p3}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 142
    .line 143
    .line 144
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 145
    .line 146
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 147
    .line 148
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 149
    .line 150
    .line 151
    move-result p3

    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_3
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 163
    .line 164
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 165
    .line 166
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 171
    .line 172
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 177
    .line 178
    .line 179
    :goto_1
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 190
    .line 191
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 192
    .line 193
    .line 194
    move-result-object p2

    .line 195
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h3(Ljava/lang/Integer;Lv/VDraweeView;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public F(I)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;->F(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method
