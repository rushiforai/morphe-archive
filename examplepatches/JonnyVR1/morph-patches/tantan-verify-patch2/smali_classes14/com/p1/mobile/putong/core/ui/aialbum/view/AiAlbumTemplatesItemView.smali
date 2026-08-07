.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;

.field public e:Lv/VDraweeView;

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->f:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->g:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sget v1, Ll/qa00;->v:I

    .line 16
    .line 17
    sub-int/2addr v0, v1

    .line 18
    div-int/lit8 v0, v0, 0x2

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->f:I

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    const v1, 0x3fa28f5c    # 1.27f

    .line 24
    .line 25
    .line 26
    mul-float/2addr v0, v1

    .line 27
    float-to-int v0, v0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->g:I

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->q()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->f:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    new-array v2, v2, [Landroid/view/View;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    aput-object v1, v2, v3

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->g:I

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rg0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->q()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;->templateUrl:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->f:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v2, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AiAlbumTemplateData;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const/high16 p1, 0x40e00000    # 7.0f

    .line 40
    .line 41
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {p2, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-static {p2, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {p2, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 67
    .line 68
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-static {p2, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 76
    .line 77
    const/4 p1, 0x1

    .line 78
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    const/4 p1, 0x0

    .line 83
    invoke-virtual {p2, p1}, Landroid/view/View;->setSelected(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 87
    .line 88
    const/high16 p2, 0x40a00000    # 5.0f

    .line 89
    .line 90
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {p1, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 98
    .line 99
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-static {p1, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 107
    .line 108
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {p1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumTemplatesItemView;->e:Lv/VDraweeView;

    .line 116
    .line 117
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 122
    .line 123
    .line 124
    return-void
.end method
