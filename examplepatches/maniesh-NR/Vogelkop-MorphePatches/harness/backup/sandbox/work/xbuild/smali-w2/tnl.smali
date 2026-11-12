.class public final Ltnl;
.super Lw3a;
.source "SourceFile"


# instance fields
.field public final synthetic d:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .registers 4

    iput p2, p0, Ltnl;->d:I

    const/16 p2, 0x77

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Ltnl;->d:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Ltnl;->d:I

    return p0
.end method
