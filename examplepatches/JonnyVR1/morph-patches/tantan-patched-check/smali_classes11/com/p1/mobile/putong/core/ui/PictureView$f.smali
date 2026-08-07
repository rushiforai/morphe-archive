.class public Lcom/p1/mobile/putong/core/ui/PictureView$f;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/PictureView;->E()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PictureView$f;->a:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView$f;->a:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/PictureView;->p0:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    :goto_0
    move v5, p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/high16 p0, 0x41a00000    # 20.0f

    .line 19
    .line 20
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-float p0, p0

    .line 25
    goto :goto_0

    .line 26
    :goto_1
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x0

    .line 28
    move-object v0, p2

    .line 29
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
