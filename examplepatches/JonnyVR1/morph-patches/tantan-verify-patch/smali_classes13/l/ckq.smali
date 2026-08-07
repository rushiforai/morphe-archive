.class public Ll/ckq;
.super Ll/bkq;
.source "SourceFile"


# instance fields
.field public f:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/bkq;-><init>(II)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/ckq;->f:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/bkq;->e(Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ckq;->f:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Canvas;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Ll/ckq;->f:I

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g(I)Ll/ckq;
    .locals 0

    .line 1
    iput p1, p0, Ll/ckq;->f:I

    .line 2
    .line 3
    return-object p0
.end method
