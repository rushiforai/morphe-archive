.class public Lcom/p1/mobile/putong/core/ui/PictureView$e;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/PictureView;->D(Lcom/p1/mobile/putong/data/Video;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/PictureView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    :goto_0
    move v3, v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    goto :goto_0

    .line 22
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->a:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    :goto_2
    move v4, v0

    .line 33
    goto :goto_3

    .line 34
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    goto :goto_2

    .line 39
    :goto_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->a:Z

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    :goto_4
    move v5, p1

    .line 50
    goto :goto_5

    .line 51
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    goto :goto_4

    .line 56
    :goto_5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->a:Z

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$e;->b:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 61
    .line 62
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->H0:I

    .line 63
    .line 64
    int-to-float p0, p0

    .line 65
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    int-to-float p0, p0

    .line 70
    :goto_6
    move v6, p0

    .line 71
    goto :goto_7

    .line 72
    :cond_3
    const/4 p0, 0x0

    .line 73
    goto :goto_6

    .line 74
    :goto_7
    const/4 v2, 0x0

    .line 75
    move-object v1, p2

    .line 76
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
