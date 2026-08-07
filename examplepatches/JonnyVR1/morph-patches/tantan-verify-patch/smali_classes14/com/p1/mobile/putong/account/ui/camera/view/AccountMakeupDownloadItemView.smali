.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/ImageView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/graphics/drawable/AnimationDrawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-static {p0, p1}, Ll/tr;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->f:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->d:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->e:Lv/VText;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 29
    .line 30
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 36
    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    iget p2, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->selectedImgId:I

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 46
    .line 47
    invoke-virtual {v0, p2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->e:Lv/VText;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->d:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-static {p3, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->e:Lv/VText;

    .line 18
    .line 19
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-boolean p2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 23
    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    iget p2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 27
    .line 28
    if-ne p2, v1, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 31
    .line 32
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 36
    .line 37
    sget p3, Ll/bbc0;->I:I

    .line 38
    .line 39
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 44
    .line 45
    const/4 p3, 0x2

    .line 46
    if-ne p2, p3, :cond_1

    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 54
    .line 55
    sget p3, Ll/bbc0;->J:I

    .line 56
    .line 57
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Landroid/graphics/drawable/AnimationDrawable;

    .line 67
    .line 68
    iput-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->g:Landroid/graphics/drawable/AnimationDrawable;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const/4 p3, 0x4

    .line 75
    if-ne p2, p3, :cond_3

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->g:Landroid/graphics/drawable/AnimationDrawable;

    .line 78
    .line 79
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-eqz p2, :cond_2

    .line 84
    .line 85
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->g:Landroid/graphics/drawable/AnimationDrawable;

    .line 86
    .line 87
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 91
    .line 92
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 96
    .line 97
    sget p3, Ll/bbc0;->I:I

    .line 98
    .line 99
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->c:Landroid/widget/ImageView;

    .line 104
    .line 105
    const/16 p3, 0x8

    .line 106
    .line 107
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->g:Landroid/graphics/drawable/AnimationDrawable;

    .line 111
    .line 112
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    if-eqz p2, :cond_4

    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->g:Landroid/graphics/drawable/AnimationDrawable;

    .line 119
    .line 120
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 121
    .line 122
    .line 123
    :cond_4
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    if-nez p2, :cond_5

    .line 130
    .line 131
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 132
    .line 133
    iget-object p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 134
    .line 135
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->icon:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {p2, p3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 142
    .line 143
    iget p3, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->normalImgId:I

    .line 144
    .line 145
    invoke-virtual {p2, p3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 146
    .line 147
    .line 148
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->b:Lv/VDraweeView;

    .line 149
    .line 150
    sget p3, Ll/bbc0;->F:I

    .line 151
    .line 152
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->e:Lv/VText;

    .line 156
    .line 157
    iget-object p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->name:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->f:Lv/VText;

    .line 163
    .line 164
    iget p1, p1, Lcom/p1/mobile/putong/account/ui/camera/adapter/AccountMakeupPageAdapter$MakeupItem;->all:F

    .line 165
    .line 166
    const/high16 p2, 0x42c80000    # 100.0f

    .line 167
    .line 168
    mul-float/2addr p1, p2

    .line 169
    float-to-int p1, p1

    .line 170
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupDownloadItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
