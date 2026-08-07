.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;

.field public b:Landroid/widget/ImageView;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VText;

.field public f:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qdh;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->isNone()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    xor-int/2addr v3, v1

    .line 20
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->d:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 34
    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->selectedImgId:I

    .line 38
    .line 39
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->normalImgId:I

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 49
    .line 50
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->name:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 63
    .line 64
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->all:F

    .line 65
    .line 66
    const/high16 p2, 0x42c80000    # 100.0f

    .line 67
    .line 68
    mul-float/2addr p1, p2

    .line 69
    float-to-int p1, p1

    .line 70
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->d:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 29
    .line 30
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 36
    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 46
    .line 47
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {v0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->d:Landroid/widget/ImageView;

    .line 18
    .line 19
    invoke-static {p3, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 23
    .line 24
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isLocal()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/4 p3, 0x0

    .line 32
    if-eqz p2, :cond_0

    .line 33
    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-static {p2, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 45
    .line 46
    iget p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 47
    .line 48
    invoke-virtual {p2, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->icon:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_1

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 61
    .line 62
    invoke-static {p2, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->icon:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p2, p3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-static {p2, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 81
    .line 82
    sget-object p3, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 83
    .line 84
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 88
    .line 89
    iget p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 90
    .line 91
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 95
    .line 96
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->name:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 102
    .line 103
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 104
    .line 105
    const/high16 p2, 0x42c80000    # 100.0f

    .line 106
    .line 107
    mul-float/2addr p1, p2

    .line 108
    float-to-int p1, p1

    .line 109
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->d:Landroid/widget/ImageView;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {p3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {p3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->c:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 29
    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 33
    .line 34
    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 39
    .line 40
    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->b:Landroid/widget/ImageView;

    .line 44
    .line 45
    sget-object p3, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 46
    .line 47
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->e:Lv/VText;

    .line 51
    .line 52
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 58
    .line 59
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 60
    .line 61
    const/high16 p2, 0x42c80000    # 100.0f

    .line 62
    .line 63
    mul-float/2addr p1, p2

    .line 64
    float-to-int p1, p1

    .line 65
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setValue(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupItemView;->f:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
