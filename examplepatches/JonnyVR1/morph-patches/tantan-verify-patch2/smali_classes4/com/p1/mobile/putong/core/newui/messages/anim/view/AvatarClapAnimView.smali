.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/w600$d;


# static fields
.field public static l:F = 0.6f

.field public static m:F = 0.7f


# instance fields
.field public a:I

.field public b:Landroidx/appcompat/widget/AppCompatImageView;

.field public c:I

.field public d:I

.field public e:Landroid/graphics/Paint;

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->a:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    .line 9
    .line 10
    const/high16 p1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->a:I

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->a:I

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b()V

    return-void
.end method


# virtual methods
.method public a(ZFLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    const v0, 0x3e820c4a    # 0.254f

    .line 2
    .line 3
    .line 4
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->i:F

    .line 5
    .line 6
    const v0, 0x3df7ced9    # 0.121f

    .line 7
    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->j:F

    .line 10
    .line 11
    const/high16 v0, 0x40800000    # 4.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->g:F

    .line 19
    .line 20
    const/high16 v0, 0x41000000    # 8.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v0, v0

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->h:F

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroidx/appcompat/widget/AppCompatImageView;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-direct {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 43
    .line 44
    sget v1, Ll/ibc0;->L:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 56
    .line 57
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->i:F

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 68
    .line 69
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->j:F

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 72
    .line 73
    .line 74
    new-instance v0, Landroid/graphics/Paint;

    .line 75
    .line 76
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->e:Landroid/graphics/Paint;

    .line 80
    .line 81
    const/4 p0, 0x1

    .line 82
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final c()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    .line 2
    .line 3
    const/high16 v1, 0x41200000    # 10.0f

    .line 4
    .line 5
    cmpg-float v2, v0, v1

    .line 6
    .line 7
    const v3, 0x3d4ccccd    # 0.05f

    .line 8
    .line 9
    .line 10
    const/high16 v4, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-gez v2, :cond_0

    .line 13
    .line 14
    div-float/2addr v0, v1

    .line 15
    mul-float/2addr v0, v3

    .line 16
    sub-float/2addr v4, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/high16 v2, 0x41700000    # 15.0f

    .line 19
    .line 20
    cmpg-float v2, v0, v2

    .line 21
    .line 22
    if-gez v2, :cond_1

    .line 23
    .line 24
    const v4, 0x3f733333    # 0.95f

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/high16 v2, 0x41c80000    # 25.0f

    .line 29
    .line 30
    cmpg-float v5, v0, v2

    .line 31
    .line 32
    if-gez v5, :cond_2

    .line 33
    .line 34
    sub-float/2addr v2, v0

    .line 35
    div-float/2addr v2, v1

    .line 36
    mul-float/2addr v2, v3

    .line 37
    sub-float/2addr v4, v2

    .line 38
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 39
    .line 40
    invoke-virtual {v0, v4}, Landroid/view/View;->setScaleX(F)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 44
    .line 45
    invoke-virtual {p0, v4}, Landroid/view/View;->setScaleY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->d:I

    .line 5
    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c:I

    .line 9
    .line 10
    if-lez v0, :cond_1

    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->f:F

    .line 13
    .line 14
    const/high16 v1, 0x41700000    # 15.0f

    .line 15
    .line 16
    cmpg-float v1, v0, v1

    .line 17
    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/high16 v3, 0x41f00000    # 30.0f

    .line 21
    .line 22
    if-gez v1, :cond_0

    .line 23
    .line 24
    :goto_0
    div-float/2addr v0, v3

    .line 25
    add-float/2addr v0, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    sub-float v0, v3, v0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->e:Landroid/graphics/Paint;

    .line 31
    .line 32
    const/high16 v2, 0x42cc0000    # 102.0f

    .line 33
    .line 34
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 35
    .line 36
    mul-float/2addr v3, v2

    .line 37
    float-to-int v2, v3

    .line 38
    const/16 v3, 0xd7

    .line 39
    .line 40
    const/16 v4, 0x4d

    .line 41
    .line 42
    const/16 v5, 0x37

    .line 43
    .line 44
    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c:I

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    sget v2, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->l:F

    .line 55
    .line 56
    mul-float/2addr v1, v2

    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->d:I

    .line 58
    .line 59
    int-to-float v2, v2

    .line 60
    sget v6, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->m:F

    .line 61
    .line 62
    mul-float/2addr v2, v6

    .line 63
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->h:F

    .line 64
    .line 65
    mul-float/2addr v6, v0

    .line 66
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->e:Landroid/graphics/Paint;

    .line 67
    .line 68
    invoke-virtual {p1, v1, v2, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->e:Landroid/graphics/Paint;

    .line 72
    .line 73
    const/high16 v2, 0x43330000    # 179.0f

    .line 74
    .line 75
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 76
    .line 77
    mul-float/2addr v6, v2

    .line 78
    float-to-int v2, v6

    .line 79
    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c:I

    .line 87
    .line 88
    int-to-float v1, v1

    .line 89
    sget v2, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->l:F

    .line 90
    .line 91
    mul-float/2addr v1, v2

    .line 92
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->d:I

    .line 93
    .line 94
    int-to-float v2, v2

    .line 95
    sget v3, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->m:F

    .line 96
    .line 97
    mul-float/2addr v2, v3

    .line 98
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->g:F

    .line 99
    .line 100
    mul-float/2addr v3, v0

    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->e:Landroid/graphics/Paint;

    .line 102
    .line 103
    invoke-virtual {p1, v1, v2, v3, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c:I

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->d:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 17
    .line 18
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->c:I

    .line 19
    .line 20
    int-to-float p2, p2

    .line 21
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->l:F

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->i:F

    .line 24
    .line 25
    sub-float/2addr v0, v1

    .line 26
    mul-float/2addr p2, v0

    .line 27
    float-to-int p2, p2

    .line 28
    int-to-float p2, p2

    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 33
    .line 34
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->d:I

    .line 35
    .line 36
    int-to-float p2, p2

    .line 37
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->m:F

    .line 38
    .line 39
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->j:F

    .line 40
    .line 41
    sub-float/2addr v0, p0

    .line 42
    mul-float/2addr p2, v0

    .line 43
    float-to-int p0, p2

    .line 44
    int-to-float p0, p0

    .line 45
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setAlpha(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->b:Landroidx/appcompat/widget/AppCompatImageView;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/AvatarClapAnimView;->k:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
