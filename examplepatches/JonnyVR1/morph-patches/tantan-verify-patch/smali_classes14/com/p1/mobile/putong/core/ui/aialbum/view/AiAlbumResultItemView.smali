.class public Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->q()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->g:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->d:Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->h:I

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
    invoke-static {p0, p1}, Ll/jg0;->a(Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->h:I

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
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->g:I

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
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->h:I

    .line 29
    .line 30
    return-void
.end method

.method public z(Ljava/lang/String;Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->q()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->e:Lv/VDraweeView;

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->g:I

    .line 9
    .line 10
    sget v3, Ll/qa00;->i:I

    .line 11
    .line 12
    sub-int/2addr v2, v3

    .line 13
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->h:I

    .line 14
    .line 15
    sub-int/2addr v4, v3

    .line 16
    invoke-virtual {v0, v1, p1, v2, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 17
    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    const/high16 p1, 0x40e00000    # 7.0f

    .line 22
    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget p1, Ll/qa00;->f:I

    .line 29
    .line 30
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->e:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/aialbum/view/AiAlbumResultItemView;->e:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
