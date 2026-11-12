.class public final Lg13;
.super Lw3a;
.source "SourceFile"


# instance fields
.field public final d:I

.field public final e:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;II)V
    .registers 7

    const v0, 0x800035

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {p1, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iput p2, p0, Lg13;->d:I

    iput p3, p0, Lg13;->e:I

    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lg13;->e:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lg13;->d:I

    return p0
.end method
