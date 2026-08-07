.class public Ll/ayy;
.super Ll/yxy;
.source "SourceFile"


# instance fields
.field public m:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/yxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/ayy;->m:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2, p3}, Ll/yxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/ayy;->m:I

    return-void
.end method

.method private o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V
    .locals 6

    .line 1
    iget v0, p0, Ll/ayy;->m:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    iget v3, p0, Ll/rxy;->f:I

    .line 12
    .line 13
    and-int/2addr v3, v1

    .line 14
    if-lez v3, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v1, v2

    .line 18
    :goto_1
    const/4 v3, 0x2

    .line 19
    invoke-virtual {p0, v3}, Ll/rxy;->e(I)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eq v0, v1, :cond_6

    .line 24
    .line 25
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_5

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    iget v0, p0, Ll/yxy;->k:I

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    iget v0, p0, Ll/yxy;->i:I

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    if-eqz v3, :cond_4

    .line 52
    .line 53
    iget v0, p0, Ll/yxy;->l:I

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_4
    iget v0, p0, Ll/yxy;->j:I

    .line 57
    .line 58
    :goto_2
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_5
    const/16 v1, 0x64

    .line 63
    .line 64
    filled-new-array {v2, v1}, [I

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-wide/16 v4, 0x118

    .line 73
    .line 74
    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/ayy$a;

    .line 79
    .line 80
    invoke-direct {v2, p0, v0, v3, p1}, Ll/ayy$a;-><init>(Ll/ayy;ZZLcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 87
    .line 88
    .line 89
    :cond_6
    :goto_3
    iget p1, p0, Ll/rxy;->f:I

    .line 90
    .line 91
    iput p1, p0, Ll/ayy;->m:I

    .line 92
    .line 93
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

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
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    iget p2, p0, Ll/rxy;->c:I

    .line 33
    .line 34
    if-lez p2, :cond_1

    .line 35
    .line 36
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 37
    .line 38
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget p2, p0, Ll/rxy;->b:I

    .line 43
    .line 44
    if-lez p2, :cond_1

    .line 45
    .line 46
    iget-object p3, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 47
    .line 48
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Ll/ayy;->o(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
