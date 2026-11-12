.class public final Lo2c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(IIZZ)V
    .registers 5

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lo2c;->a:I

    .line 14
    iput p2, p0, Lo2c;->b:I

    .line 15
    iput-boolean p3, p0, Lo2c;->c:Z

    .line 16
    iput-boolean p4, p0, Lo2c;->d:Z

    return-void
.end method

.method public constructor <init>(ZIIZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lo2c;->c:Z

    iput p2, p0, Lo2c;->a:I

    iput p3, p0, Lo2c;->b:I

    iput-boolean p4, p0, Lo2c;->d:Z

    return-void
.end method


# virtual methods
.method public final a(I)I
    .registers 4

    iget-boolean v0, p0, Lo2c;->c:Z

    if-nez v0, :cond_8

    iget-boolean v1, p0, Lo2c;->d:Z

    if-eqz v1, :cond_10

    :cond_8
    if-gez p1, :cond_c

    const/4 p1, 0x0

    goto :goto_10

    :cond_c
    const v1, -0x800008

    and-int/2addr p1, v1

    :cond_10
    :goto_10
    if-eqz v0, :cond_16

    const v0, 0x800003

    or-int/2addr p1, v0

    :cond_16
    iget-boolean p0, p0, Lo2c;->d:Z

    if-eqz p0, :cond_1e

    const p0, 0x800005

    or-int/2addr p1, p0

    :cond_1e
    return p1
.end method

.method public final b(Landroid/view/ViewGroup$MarginLayoutParams;)Z
    .registers 5

    iget v0, p0, Lo2c;->a:I

    const/4 v1, 0x0

    const/16 v2, -0x1388

    if-ne v0, v2, :cond_c

    iget v0, p0, Lo2c;->b:I

    if-eq v0, v2, :cond_1d

    move v0, v1

    :cond_c
    iget p0, p0, Lo2c;->b:I

    if-ne p0, v2, :cond_11

    move p0, v1

    :cond_11
    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v2

    if-ne v2, v0, :cond_1e

    invoke-virtual {p1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v2

    if-ne v2, p0, :cond_1e

    :cond_1d
    return v1

    :cond_1e
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final c(I)Z
    .registers 2

    iget p0, p0, Lo2c;->a:I

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final d(I)Z
    .registers 2

    iget p0, p0, Lo2c;->b:I

    and-int/2addr p0, p1

    if-ne p0, p1, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method
