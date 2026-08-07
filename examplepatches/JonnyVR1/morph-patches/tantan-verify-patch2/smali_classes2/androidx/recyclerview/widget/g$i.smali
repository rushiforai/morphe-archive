.class public Landroidx/recyclerview/widget/g$i;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z


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
.method public a()I
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/g$i;->c:I

    .line 2
    .line 3
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->d:I

    .line 7
    .line 8
    iget p0, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 9
    .line 10
    sub-int/2addr v1, p0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/g$i;->d:I

    .line 2
    .line 3
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->c:I

    .line 7
    .line 8
    iget p0, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 9
    .line 10
    sub-int/2addr v1, p0

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public c()Z
    .locals 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/g$i;->d:I

    .line 2
    .line 3
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->c:I

    .line 7
    .line 8
    iget p0, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 9
    .line 10
    sub-int/2addr v1, p0

    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public d()Landroidx/recyclerview/widget/g$d;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/g$i;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p0, Landroidx/recyclerview/widget/g$i;->e:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroidx/recyclerview/widget/g$d;

    .line 12
    .line 13
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 14
    .line 15
    iget v2, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/g$i;->a()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-direct {v0, v1, v2, p0}, Landroidx/recyclerview/widget/g$d;-><init>(III)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/g$i;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Landroidx/recyclerview/widget/g$d;

    .line 34
    .line 35
    iget v2, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 36
    .line 37
    add-int/lit8 v2, v2, 0x1

    .line 38
    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/g$i;->a()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-direct {v0, v1, v2, p0}, Landroidx/recyclerview/widget/g$d;-><init>(III)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    new-instance v0, Landroidx/recyclerview/widget/g$d;

    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    iget v2, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 52
    .line 53
    invoke-virtual {p0}, Landroidx/recyclerview/widget/g$i;->a()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-direct {v0, v1, v2, p0}, Landroidx/recyclerview/widget/g$d;-><init>(III)V

    .line 58
    .line 59
    .line 60
    return-object v0

    .line 61
    :cond_2
    new-instance v0, Landroidx/recyclerview/widget/g$d;

    .line 62
    .line 63
    iget v1, p0, Landroidx/recyclerview/widget/g$i;->a:I

    .line 64
    .line 65
    iget v2, p0, Landroidx/recyclerview/widget/g$i;->b:I

    .line 66
    .line 67
    iget p0, p0, Landroidx/recyclerview/widget/g$i;->c:I

    .line 68
    .line 69
    sub-int/2addr p0, v1

    .line 70
    invoke-direct {v0, v1, v2, p0}, Landroidx/recyclerview/widget/g$d;-><init>(III)V

    .line 71
    .line 72
    .line 73
    return-object v0
.end method
