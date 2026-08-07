.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget v1, Ll/qa00;->v:I

    .line 12
    .line 13
    sub-int/2addr v0, v1

    .line 14
    div-int/lit8 v0, v0, 0x4

    .line 15
    .line 16
    int-to-float v1, v0

    .line 17
    const v2, 0x3fa3d70a    # 1.28f

    .line 18
    .line 19
    .line 20
    mul-float/2addr v1, v2

    .line 21
    float-to-int v1, v1

    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    new-array v3, v3, [Landroid/view/View;

    .line 26
    .line 27
    const/4 v4, 0x0

    .line 28
    aput-object v2, v3, v4

    .line 29
    .line 30
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ag0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q(Ll/ff0;)V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->e:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p1, Ll/ff0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p1, Ll/ff0;->c:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v2, p1, Ll/ff0;->b:Ljava/lang/String;

    .line 17
    .line 18
    :goto_0
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v0, v1, v2, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->g:Landroid/widget/ImageView;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->f:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget p1, p1, Ll/ff0;->a:I

    .line 34
    .line 35
    if-ne p1, v1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->g:Landroid/widget/ImageView;

    .line 38
    .line 39
    sget p1, Ll/dbc0;->o0:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    const/4 v0, 0x2

    .line 46
    if-ne p1, v0, :cond_2

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->f:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->g:Landroid/widget/ImageView;

    .line 54
    .line 55
    sget p1, Ll/dbc0;->m0:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumPickerItemView;->g:Landroid/widget/ImageView;

    .line 62
    .line 63
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
