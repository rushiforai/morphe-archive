.class public Landroidx/recyclerview/widget/x$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 2
    .line 3
    or-int/2addr p1, v0

    .line 4
    iput p1, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 4

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x7

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget v1, p0, Landroidx/recyclerview/widget/x$a;->d:I

    .line 9
    .line 10
    iget v3, p0, Landroidx/recyclerview/widget/x$a;->b:I

    .line 11
    .line 12
    invoke-virtual {p0, v1, v3}, Landroidx/recyclerview/widget/x$a;->c(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    and-int/2addr v0, v1

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    iget v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 21
    .line 22
    and-int/lit8 v1, v0, 0x70

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget v1, p0, Landroidx/recyclerview/widget/x$a;->d:I

    .line 27
    .line 28
    iget v3, p0, Landroidx/recyclerview/widget/x$a;->c:I

    .line 29
    .line 30
    invoke-virtual {p0, v1, v3}, Landroidx/recyclerview/widget/x$a;->c(II)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    shl-int/lit8 v1, v1, 0x4

    .line 35
    .line 36
    and-int/2addr v0, v1

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    return v2

    .line 40
    :cond_1
    iget v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 41
    .line 42
    and-int/lit16 v1, v0, 0x700

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iget v1, p0, Landroidx/recyclerview/widget/x$a;->e:I

    .line 47
    .line 48
    iget v3, p0, Landroidx/recyclerview/widget/x$a;->b:I

    .line 49
    .line 50
    invoke-virtual {p0, v1, v3}, Landroidx/recyclerview/widget/x$a;->c(II)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    shl-int/lit8 v1, v1, 0x8

    .line 55
    .line 56
    and-int/2addr v0, v1

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    return v2

    .line 60
    :cond_2
    iget v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 61
    .line 62
    and-int/lit16 v1, v0, 0x7000

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    iget v1, p0, Landroidx/recyclerview/widget/x$a;->e:I

    .line 67
    .line 68
    iget v3, p0, Landroidx/recyclerview/widget/x$a;->c:I

    .line 69
    .line 70
    invoke-virtual {p0, v1, v3}, Landroidx/recyclerview/widget/x$a;->c(II)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    shl-int/lit8 p0, p0, 0xc

    .line 75
    .line 76
    and-int/2addr p0, v0

    .line 77
    if-nez p0, :cond_3

    .line 78
    .line 79
    return v2

    .line 80
    :cond_3
    const/4 p0, 0x1

    .line 81
    return p0
.end method

.method public c(II)I
    .locals 0

    .line 1
    if-le p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    if-ne p1, p2, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/4 p0, 0x4

    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Landroidx/recyclerview/widget/x$a;->a:I

    .line 3
    .line 4
    return-void
.end method

.method public e(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/x$a;->b:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/recyclerview/widget/x$a;->c:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/recyclerview/widget/x$a;->d:I

    .line 6
    .line 7
    iput p4, p0, Landroidx/recyclerview/widget/x$a;->e:I

    .line 8
    .line 9
    return-void
.end method
