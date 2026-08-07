.class public Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/PlayerView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/graphics/Bitmap;

.field public e:Ljava/lang/String;

.field public f:Lv/VDraweeView;

.field public g:Z

.field public final h:Landroid/content/Context;

.field public i:Lcom/p1/mobile/putong/data/Video;

.field public j:Landroid/view/View;

.field public k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 5
    .line 6
    sget p1, Ll/ibc0;->c4:I

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setCardElevation(F)V

    .line 13
    .line 14
    .line 15
    const/high16 p1, 0x41800000    # 16.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    int-to-float p1, p1

    .line 22
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->l()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->k()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/PlayerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;

    return-object p0
.end method


# virtual methods
.method public f(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz p1, :cond_3

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {p1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->g:Z

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->d:Landroid/graphics/Bitmap;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/DraweeView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->e:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->e:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v3}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->g:Z

    .line 93
    .line 94
    if-eqz p1, :cond_4

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 97
    .line 98
    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 103
    .line 104
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public getCancelView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v1, 0x42700000    # 60.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/high16 v2, 0x42200000    # 40.0f

    .line 19
    .line 20
    invoke-static {v2}, Ll/bnl0;->w(F)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    const/high16 v1, 0x41800000    # 16.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 34
    .line 35
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 36
    .line 37
    const/4 v1, 0x5

    .line 38
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 41
    .line 42
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->y5:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    const/high16 v2, 0x41600000    # 14.0f

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    const/16 v2, 0x11

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 62
    .line 63
    const/4 v2, -0x1

    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 70
    .line 71
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    sget v3, Ll/ibc0;->n4:I

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    new-instance v0, Lv/VImage;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 22
    .line 23
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 29
    .line 30
    const/16 v1, 0x8

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 22
    .line 23
    const/high16 v1, 0x41000000    # 8.0f

    .line 24
    .line 25
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-float v1, v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setRadius(F)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/re80;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/re80;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "chat"

    .line 45
    .line 46
    invoke-interface {v0, v1}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/data/Video;

    .line 55
    .line 56
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 62
    .line 63
    const/16 v1, 0x8

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 9
    .line 10
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/bnl0;->F(Landroid/content/Context;)Landroid/graphics/Point;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 28
    .line 29
    div-int/lit8 v0, v0, 0x3

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-direct {v1, v2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x50

    .line 36
    .line 37
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ll/wlj;

    .line 46
    .line 47
    const/high16 v2, 0x41000000    # 8.0f

    .line 48
    .line 49
    invoke-static {v2}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v0, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->f:Lv/VDraweeView;

    .line 67
    .line 68
    const/16 v0, 0x8

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->j:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public m(Ljava/lang/String;ZF)V
    .locals 3

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->g:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p2, p1}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p3}, Ll/dnd0;->e(F)V

    .line 33
    .line 34
    .line 35
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {p3, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->d:Landroid/graphics/Bitmap;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 47
    .line 48
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 54
    .line 55
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 59
    .line 60
    iput-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 61
    .line 62
    new-instance p3, Lcom/p1/mobile/putong/data/Picture;

    .line 63
    .line 64
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p3, p2, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 68
    .line 69
    new-instance p2, Ll/wel0;

    .line 70
    .line 71
    new-instance p3, Ll/vel0;

    .line 72
    .line 73
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {p3, p1}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-direct {p2, p3, v2, v2}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 81
    .line 82
    .line 83
    :try_start_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 86
    .line 87
    invoke-virtual {p2, v2}, Ll/wel0;->c(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    invoke-static {p3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    iput-object p3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_0
    move-exception p1

    .line 99
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 105
    .line 106
    new-instance p3, Lcom/p1/mobile/putong/data/Dimension;

    .line 107
    .line 108
    invoke-virtual {p2}, Ll/wel0;->k()[I

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-direct {p3, p2}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 113
    .line 114
    .line 115
    iput-object p3, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 118
    .line 119
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 120
    .line 121
    const-string p3, "image/jpeg"

    .line 122
    .line 123
    iput-object p3, p2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 126
    .line 127
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 131
    .line 132
    const/4 p2, 0x1

    .line 133
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setLoopMode(Z)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/PlayerView;->L(Z)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->i:Lcom/p1/mobile/putong/data/Video;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 146
    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->e:Ljava/lang/String;

    .line 148
    .line 149
    return-void
.end method

.method public n(Ljava/lang/String;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget v0, Ll/qa00;->R:I

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-static {p1, v0, v0, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/high16 v0, 0x40800000    # 4.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {p1, v3, v1}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-static {p1, p2, p2, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    invoke-static {p1, p2, v1}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->h:Landroid/content/Context;

    .line 60
    .line 61
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p2, p1}, Ll/end0;->a(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Ll/dnd0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    :goto_0
    return-void

    .line 72
    :cond_4
    const/high16 p2, 0x41c00000    # 24.0f

    .line 73
    .line 74
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    int-to-float p2, p2

    .line 79
    invoke-virtual {p1, p2}, Ll/dnd0;->e(F)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public o(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b:Landroid/widget/ImageView;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->N()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCancelClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setResultViewListener(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->k:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;

    .line 2
    .line 3
    return-void
.end method
