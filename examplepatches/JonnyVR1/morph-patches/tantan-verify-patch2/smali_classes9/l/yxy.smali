.class public Ll/yxy;
.super Ll/rxy;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:I

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/rxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 3
    .line 4
    .line 5
    iput v0, p0, Ll/yxy;->i:I

    .line 6
    .line 7
    iput v0, p0, Ll/yxy;->j:I

    .line 8
    .line 9
    iput v0, p0, Ll/yxy;->k:I

    .line 10
    .line 11
    iput v0, p0, Ll/yxy;->l:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Ll/rxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    const/4 p1, -0x1

    .line 15
    iput p1, p0, Ll/yxy;->i:I

    .line 16
    iput p1, p0, Ll/yxy;->j:I

    .line 17
    iput p1, p0, Ll/yxy;->k:I

    .line 18
    iput p1, p0, Ll/yxy;->l:I

    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/rxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x2

    .line 5
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x1

    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/rxy;->e(I)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 19
    .line 20
    iget p0, p0, Ll/yxy;->l:I

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 27
    .line 28
    iget p0, p0, Ll/yxy;->k:I

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0, p3}, Ll/rxy;->e(I)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget p0, p0, Ll/yxy;->j:I

    .line 41
    .line 42
    if-lez p0, :cond_3

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    iget p0, p0, Ll/yxy;->i:I

    .line 51
    .line 52
    if-lez p0, :cond_3

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 57
    .line 58
    .line 59
    :cond_3
    return-void
.end method

.method public l(I)Ll/yxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/yxy;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(III)I
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr v2, p0

    .line 34
    sub-int/2addr v3, v0

    .line 35
    sub-int/2addr v4, v1

    .line 36
    sub-int/2addr p2, p1

    .line 37
    mul-int/2addr v2, p3

    .line 38
    div-int/lit8 v2, v2, 0x64

    .line 39
    .line 40
    add-int/2addr p0, v2

    .line 41
    mul-int/2addr v3, p3

    .line 42
    div-int/lit8 v3, v3, 0x64

    .line 43
    .line 44
    add-int/2addr v0, v3

    .line 45
    mul-int/2addr v4, p3

    .line 46
    div-int/lit8 v4, v4, 0x64

    .line 47
    .line 48
    add-int/2addr v1, v4

    .line 49
    mul-int/2addr p3, p2

    .line 50
    div-int/lit8 p3, p3, 0x64

    .line 51
    .line 52
    add-int/2addr p1, p3

    .line 53
    invoke-static {p1, p0, v0, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public n(I)Ll/yxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/yxy;->j:I

    .line 2
    .line 3
    return-object p0
.end method
