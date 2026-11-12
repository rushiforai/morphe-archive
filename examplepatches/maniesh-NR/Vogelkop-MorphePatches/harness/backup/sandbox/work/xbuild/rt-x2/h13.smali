.class public final Lh13;
.super Lw3a;
.source "SourceFile"


# instance fields
.field public d:Z


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;II)V
    .registers 5

    new-instance v0, Lg13;

    invoke-direct {v0, p1, p2, p3}, Lg13;-><init>(Landroid/graphics/drawable/Drawable;II)V

    const/16 p1, 0x11

    const/4 p2, 0x1

    invoke-direct {p0, v0, p1, p2}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 3

    iget-boolean v0, p0, Lh13;->d:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0, p1}, Lw3a;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method
