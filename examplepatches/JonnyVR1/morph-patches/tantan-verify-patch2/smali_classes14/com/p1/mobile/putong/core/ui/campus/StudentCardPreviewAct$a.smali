.class public Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/am50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->initSubscription()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;->a:Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c(FF)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    cmpl-float p1, p2, p1

    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/bnl0;->w0()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    invoke-static {}, Ll/bnl0;->w0()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    add-float/2addr v0, p2

    .line 17
    div-float/2addr p1, v0

    .line 18
    const/high16 p2, 0x437f0000    # 255.0f

    .line 19
    .line 20
    mul-float/2addr p1, p2

    .line 21
    float-to-int p1, p1

    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;->a:Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct$a;->a:Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
