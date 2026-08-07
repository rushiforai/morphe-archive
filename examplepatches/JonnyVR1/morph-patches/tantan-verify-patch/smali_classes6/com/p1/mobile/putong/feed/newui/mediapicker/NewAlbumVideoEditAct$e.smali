.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
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

.field public final e:I

.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->c:I

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->d:I

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->e:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->E(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->k2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    div-float/2addr v0, p0

    .line 14
    float-to-double v0, v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    double-to-int p0, v0

    .line 20
    add-int/lit8 p0, p0, 0x2

    .line 21
    .line 22
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 p1, 0x2

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 5
    .line 6
    new-instance p2, Lv/VImage;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {p2, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->D2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Lv/VImage;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    invoke-static {}, Ll/bnl0;->y0()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sub-int/2addr p2, v0

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_0
    if-nez p2, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 59
    .line 60
    new-instance p2, Lv/VImage;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    invoke-direct {p2, v0}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->E2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;Lv/VImage;)V

    .line 70
    .line 71
    .line 72
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 73
    .line 74
    invoke-static {}, Ll/bnl0;->y0()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 88
    .line 89
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const/4 p2, 0x0

    .line 103
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 111
    .line 112
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_1
    new-instance p1, Lv/VDraweeView;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    invoke-direct {p1, p0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 124
    .line 125
    .line 126
    return-object p1
.end method

.method public E(Landroid/view/View;Ljava/lang/String;II)V
    .locals 3

    .line 1
    const/4 p2, 0x2

    .line 2
    if-ne p3, p2, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 15
    .line 16
    invoke-static {}, Ll/bnl0;->y0()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 21
    .line 22
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    sub-int/2addr p2, p3

    .line 27
    if-eq p1, p2, :cond_4

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Ll/bnl0;->y0()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 44
    .line 45
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    sub-int/2addr p2, p3

    .line 50
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lv/VImage;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const/4 v0, 0x1

    .line 67
    if-ne p3, v0, :cond_4

    .line 68
    .line 69
    check-cast p1, Lv/VDraweeView;

    .line 70
    .line 71
    rem-int/lit8 p3, p4, 0x2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 74
    .line 75
    if-nez p3, :cond_1

    .line 76
    .line 77
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 83
    .line 84
    .line 85
    move-result p3

    .line 86
    :goto_0
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->C()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    sub-int/2addr p3, p2

    .line 94
    const/4 p2, 0x0

    .line 95
    if-ne p4, p3, :cond_2

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    check-cast p3, Ll/wlj;

    .line 102
    .line 103
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 104
    .line 105
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 109
    .line 110
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    int-to-float v1, v1

    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 116
    .line 117
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    int-to-float v2, v2

    .line 122
    invoke-virtual {v0, p2, v1, v2, p2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p3, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 127
    .line 128
    .line 129
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 130
    .line 131
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 132
    .line 133
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->A2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 138
    .line 139
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->C()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    add-int/lit8 v1, v1, -0x3

    .line 148
    .line 149
    mul-int/2addr v0, v1

    .line 150
    sub-int/2addr p3, v0

    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 152
    .line 153
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    if-ne p4, v0, :cond_3

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 164
    .line 165
    .line 166
    move-result-object p3

    .line 167
    check-cast p3, Ll/wlj;

    .line 168
    .line 169
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 170
    .line 171
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 175
    .line 176
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    int-to-float v1, v1

    .line 181
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 182
    .line 183
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    int-to-float v2, v2

    .line 188
    invoke-virtual {v0, v1, p2, p2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-virtual {p3, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 193
    .line 194
    .line 195
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 196
    .line 197
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 198
    .line 199
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 200
    .line 201
    .line 202
    move-result p3

    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 204
    .line 205
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_3
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    check-cast p3, Ll/wlj;

    .line 218
    .line 219
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 220
    .line 221
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, p2, p2, p2, p2}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    invoke-virtual {p3, p2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 229
    .line 230
    .line 231
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 232
    .line 233
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 234
    .line 235
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 236
    .line 237
    .line 238
    move-result p3

    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 240
    .line 241
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    invoke-direct {p2, p3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 246
    .line 247
    .line 248
    :goto_1
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    .line 250
    .line 251
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 252
    .line 253
    .line 254
    move-result-object p2

    .line 255
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 256
    .line 257
    .line 258
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->f:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 259
    .line 260
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->q2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;)Lrx/subjects/a;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    new-instance p2, Landroid/util/Pair;

    .line 265
    .line 266
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 267
    .line 268
    .line 269
    move-result-object p3

    .line 270
    invoke-direct {p2, p3, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    :cond_4
    return-void
.end method

.method public F(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->F(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct$e;->C()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    sub-int/2addr p0, v0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_1
    return v0
.end method
