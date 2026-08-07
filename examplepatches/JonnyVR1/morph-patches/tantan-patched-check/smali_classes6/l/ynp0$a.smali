.class public Ll/ynp0$a;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ynp0;->l(Landroid/view/View;IIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ynp0$a;->a:I

    .line 2
    .line 3
    iput p2, p0, Ll/ynp0$a;->b:I

    .line 4
    .line 5
    iput p3, p0, Ll/ynp0$a;->c:I

    .line 6
    .line 7
    iput p4, p0, Ll/ynp0$a;->d:I

    .line 8
    .line 9
    iput p5, p0, Ll/ynp0$a;->e:I

    .line 10
    .line 11
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Ll/ynp0$a;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/ynp0$a;->b:I

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    sub-int/2addr v3, v4

    .line 16
    iget v4, p0, Ll/ynp0$a;->c:I

    .line 17
    .line 18
    sub-int/2addr v3, v4

    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-int/2addr v4, p1

    .line 28
    iget p1, p0, Ll/ynp0$a;->d:I

    .line 29
    .line 30
    sub-int/2addr v4, p1

    .line 31
    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v0}, Landroid/graphics/Outline;->setRect(Landroid/graphics/Rect;)V

    .line 35
    .line 36
    .line 37
    iget p0, p0, Ll/ynp0$a;->e:I

    .line 38
    .line 39
    if-lez p0, :cond_0

    .line 40
    .line 41
    int-to-float p0, p0

    .line 42
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method
