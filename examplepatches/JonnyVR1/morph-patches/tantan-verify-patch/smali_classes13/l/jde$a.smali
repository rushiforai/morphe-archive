.class public Ll/jde$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h1e0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jde;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;Landroid/graphics/Rect;IIFF)Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget p0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result p5

    .line 7
    add-int/2addr p0, p5

    .line 8
    sub-int/2addr p0, p3

    .line 9
    int-to-float p0, p0

    .line 10
    iget p3, p2, Landroid/graphics/Rect;->top:I

    .line 11
    .line 12
    int-to-float p3, p3

    .line 13
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    sub-int/2addr p2, p4

    .line 18
    int-to-float p2, p2

    .line 19
    const/high16 p4, 0x3f000000    # 0.5f

    .line 20
    .line 21
    mul-float/2addr p2, p4

    .line 22
    add-float/2addr p3, p2

    .line 23
    add-float/2addr p0, p4

    .line 24
    float-to-int p0, p0

    .line 25
    int-to-float p0, p0

    .line 26
    add-float/2addr p3, p4

    .line 27
    float-to-int p2, p3

    .line 28
    int-to-float p2, p2

    .line 29
    invoke-virtual {p1, p0, p2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method
