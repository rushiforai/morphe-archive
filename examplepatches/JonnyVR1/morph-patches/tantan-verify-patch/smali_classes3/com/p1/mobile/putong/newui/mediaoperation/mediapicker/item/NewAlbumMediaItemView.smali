.class public Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/view/View;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/data/Media;

.field public k:I

.field public l:Ll/rn20;

.field public m:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/io20;->a(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Media;Ll/rn20;)Z
    .locals 0

    .line 1
    invoke-interface {p2}, Ll/rn20;->q0()Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Video;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final c(F)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 7
    .line 8
    div-float/2addr p1, v0

    .line 9
    float-to-int p1, p1

    .line 10
    const/16 v0, 0x3c

    .line 11
    .line 12
    if-lt p1, v0, :cond_0

    .line 13
    .line 14
    div-int/lit8 v0, p1, 0x3c

    .line 15
    .line 16
    rem-int/lit8 p1, p1, 0x3c

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, ":"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/16 v0, 0xa

    .line 29
    .line 30
    if-ge p1, v0, :cond_1

    .line 31
    .line 32
    const-string v0, "0"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public d(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->m:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->radioNeedCheckBox:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g:Landroid/widget/TextView;

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g:Landroid/widget/TextView;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/Media;ILjava/lang/String;Ll/rn20;Ljava/lang/Boolean;Ljava/lang/Boolean;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->j:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->k:I

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->l:Ll/rn20;

    .line 6
    .line 7
    iput-object p7, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->m:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 8
    .line 9
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->b:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p2, v0, p3}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->i:Lv/VText;

    .line 17
    .line 18
    const/16 p3, 0x8

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    iget-object p2, p7, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->videoPickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->isRadio()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->d(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, p1, p4, p5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g(Lcom/p1/mobile/putong/data/Media;Ll/rn20;Ljava/lang/Boolean;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object p2, p7, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->imagePickConfig:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;->isRadio()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->d(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1, p4, p6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->f(Lcom/p1/mobile/putong/data/Media;Ll/rn20;Ljava/lang/Boolean;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->f:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    iget p1, p7, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->fromType:I

    .line 55
    .line 56
    const/16 p2, 0xc

    .line 57
    .line 58
    if-eq p1, p2, :cond_1

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const/4 p1, 0x0

    .line 63
    :goto_1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/Media;Ll/rn20;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    const-string p3, ""

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setSelectPosition(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2}, Ll/rn20;->x()Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-interface {p2}, Ll/rn20;->x()Ljava/util/Map;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->j:Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    add-int/2addr p1, v2

    .line 54
    new-instance p2, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setSelectPosition(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->h:Landroid/view/View;

    .line 73
    .line 74
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    invoke-interface {p2}, Ll/rn20;->x()Ljava/util/Map;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Ljava/util/ArrayList;

    .line 94
    .line 95
    invoke-interface {p2}, Ll/rn20;->x()Ljava/util/Map;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->j:Lcom/p1/mobile/putong/data/Media;

    .line 107
    .line 108
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    add-int/2addr p1, v2

    .line 115
    new-instance p2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setSelectPosition(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->h:Landroid/view/View;

    .line 134
    .line 135
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 140
    .line 141
    .line 142
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->d:Lv/VText;

    .line 143
    .line 144
    const/16 p1, 0x8

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/data/Media;Ll/rn20;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->h:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->b(Lcom/p1/mobile/putong/data/Media;Ll/rn20;)Z

    .line 11
    .line 12
    .line 13
    move-result p3

    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    const/4 p3, 0x1

    .line 18
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->h:Landroid/view/View;

    .line 22
    .line 23
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 28
    .line 29
    .line 30
    :goto_0
    move-object p3, p1

    .line 31
    check-cast p3, Lcom/p1/mobile/putong/data/Video;

    .line 32
    .line 33
    iget v1, p3, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    cmpl-float v1, v1, v2

    .line 37
    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p2}, Ll/rn20;->C()Lcom/p1/mobile/android/app/Frag;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/a;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)J

    .line 51
    .line 52
    .line 53
    move-result-wide p1

    .line 54
    long-to-float p1, p1

    .line 55
    iput p1, p3, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 56
    .line 57
    :cond_1
    iget p1, p3, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 58
    .line 59
    cmpl-float p2, p1, v2

    .line 60
    .line 61
    iget-object p3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->d:Lv/VText;

    .line 62
    .line 63
    if-ltz p2, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->c(F)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    sget p1, Lcom/p1/mobile/putong/common/R$string;->v3:I

    .line 74
    .line 75
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 76
    .line 77
    .line 78
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->d:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/ycc0;->p:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->l:Ll/rn20;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->j:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->k:I

    .line 14
    .line 15
    invoke-interface {p1, p0, v0, v1}, Ll/rn20;->G1(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    sget v0, Ll/ycc0;->o0:I

    .line 24
    .line 25
    if-ne p1, v0, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->l:Ll/rn20;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->j:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->k:I

    .line 32
    .line 33
    invoke-interface {p1, p0, v0, v1}, Ll/rn20;->f(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->f:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->a:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/psh0;->a(II)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-super {p0, p1, p1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->m:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 6
    .line 7
    iget-boolean p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isNewUIAb:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/cbc0;->C0:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/cbc0;->D0:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->m:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 21
    .line 22
    iget-boolean p1, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->isNewUIAb:Z

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    sget p1, Ll/cbc0;->E0:I

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_2
    sget p1, Ll/cbc0;->B0:I

    .line 30
    .line 31
    :goto_1
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    :goto_2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setSelectPosition(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->i:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->i:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->e:Lv/VImage;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/16 p1, 0x8

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
