.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/psx;->a(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/b9c0;->c:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->e:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget v2, Ll/b9c0;->e:I

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->f:Landroid/view/View;

    .line 32
    .line 33
    const/16 v1, 0x8

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->b:Landroid/widget/ImageView;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 45
    .line 46
    const/high16 v1, 0x42200000    # 40.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 54
    .line 55
    .line 56
    const/high16 v1, 0x41a00000    # 20.0f

    .line 57
    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->b:Landroid/widget/ImageView;

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public d(Ll/ewi;ZLcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V
    .locals 4

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    iget-object p3, p3, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;->allMediasInPhoto:Ll/vg60;

    .line 13
    .line 14
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    check-cast p3, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p3, 0x0

    .line 24
    :goto_0
    if-eqz p2, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget v0, p1, Ll/ewi;->d:I

    .line 28
    .line 29
    iget-object v2, p1, Ll/ewi;->c:Ll/vg60;

    .line 30
    .line 31
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->e:Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v3, "%d"

    .line 52
    .line 53
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->d:Landroid/widget/TextView;

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    if-eqz p2, :cond_3

    .line 64
    .line 65
    sget p1, Lcom/p1/mobile/putong/common/R$string;->G0:I

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 68
    .line 69
    .line 70
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a:Lv/VDraweeView;

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->c(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->b:Landroid/widget/ImageView;

    .line 87
    .line 88
    instance-of p1, p3, Lcom/p1/mobile/putong/data/Video;

    .line 89
    .line 90
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    iget-object p2, p1, Ll/ewi;->a:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p1, Ll/ewi;->c:Ll/vg60;

    .line 104
    .line 105
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    if-lez p2, :cond_4

    .line 112
    .line 113
    iget-object p1, p1, Ll/ewi;->c:Ll/vg60;

    .line 114
    .line 115
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 122
    .line 123
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a:Lv/VDraweeView;

    .line 124
    .line 125
    invoke-static {p2, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->c(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->b:Landroid/widget/ImageView;

    .line 134
    .line 135
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 136
    .line 137
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a:Lv/VDraweeView;

    .line 142
    .line 143
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/MediaFolderItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
