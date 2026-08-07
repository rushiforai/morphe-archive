.class public final Lv/VList_ViewBuffer$a;
.super Landroid/widget/EdgeEffect;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VList_ViewBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Rect;

.field public final synthetic c:Lv/VList_ViewBuffer;


# direct methods
.method public constructor <init>(Lv/VList_ViewBuffer;Landroid/content/Context;ILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_ViewBuffer$a;->c:Lv/VList_ViewBuffer;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/EdgeEffect;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    iput p3, p0, Lv/VList_ViewBuffer$a;->a:I

    .line 7
    .line 8
    iput-object p4, p0, Lv/VList_ViewBuffer$a;->b:Landroid/graphics/Rect;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lv/VList_ViewBuffer$a;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VList_ViewBuffer$a;->b(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_ViewBuffer$a;->c:Lv/VList_ViewBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)Z
    .locals 2

    .line 1
    iget v0, p0, Lv/VList_ViewBuffer$a;->a:I

    .line 2
    .line 3
    neg-int v0, v0

    .line 4
    int-to-float v0, v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 7
    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/widget/EdgeEffect;->draw(Landroid/graphics/Canvas;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget p0, p0, Lv/VList_ViewBuffer$a;->a:I

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 17
    .line 18
    .line 19
    return v0
.end method

.method public onRelease()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/syk0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/syk0;-><init>(Lv/VList_ViewBuffer$a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v1, 0x3e8

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 25
    .line 26
    .line 27
    invoke-super {p0}, Landroid/widget/EdgeEffect;->onRelease()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
