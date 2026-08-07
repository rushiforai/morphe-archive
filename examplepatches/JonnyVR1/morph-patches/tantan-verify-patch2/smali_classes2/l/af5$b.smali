.class public Ll/af5$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/af5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public final synthetic j:Ll/af5;


# direct methods
.method public constructor <init>(Ll/af5;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/af5$b;->j:Ll/af5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/af5$b;->a:I

    .line 7
    .line 8
    iput p3, p0, Ll/af5$b;->b:I

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/af5$b;->c()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/af5$b;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final b()I
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/af5$b;->f()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/af5$b;->j:Ll/af5;

    .line 6
    .line 7
    iget-object v2, v1, Ll/af5;->a:[I

    .line 8
    .line 9
    iget-object v1, v1, Ll/af5;->b:[I

    .line 10
    .line 11
    iget v3, p0, Ll/af5$b;->a:I

    .line 12
    .line 13
    iget v4, p0, Ll/af5$b;->b:I

    .line 14
    .line 15
    invoke-static {v2, v0, v3, v4}, Ll/af5;->e([IIII)V

    .line 16
    .line 17
    .line 18
    iget v3, p0, Ll/af5$b;->a:I

    .line 19
    .line 20
    iget v4, p0, Ll/af5$b;->b:I

    .line 21
    .line 22
    add-int/lit8 v4, v4, 0x1

    .line 23
    .line 24
    invoke-static {v2, v3, v4}, Ljava/util/Arrays;->sort([III)V

    .line 25
    .line 26
    .line 27
    iget v3, p0, Ll/af5$b;->a:I

    .line 28
    .line 29
    iget v4, p0, Ll/af5$b;->b:I

    .line 30
    .line 31
    invoke-static {v2, v0, v3, v4}, Ll/af5;->e([IIII)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Ll/af5$b;->c:I

    .line 35
    .line 36
    div-int/lit8 v0, v0, 0x2

    .line 37
    .line 38
    iget v3, p0, Ll/af5$b;->a:I

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    :goto_0
    iget v5, p0, Ll/af5$b;->b:I

    .line 42
    .line 43
    if-gt v3, v5, :cond_1

    .line 44
    .line 45
    aget v6, v2, v3

    .line 46
    .line 47
    aget v6, v1, v6

    .line 48
    .line 49
    add-int/2addr v4, v6

    .line 50
    if-lt v4, v0, :cond_0

    .line 51
    .line 52
    add-int/lit8 v5, v5, -0x1

    .line 53
    .line 54
    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget p0, p0, Ll/af5$b;->a:I

    .line 63
    .line 64
    return p0
.end method

.method public final c()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/af5$b;->j:Ll/af5;

    .line 2
    .line 3
    iget-object v1, v0, Ll/af5;->a:[I

    .line 4
    .line 5
    iget-object v0, v0, Ll/af5;->b:[I

    .line 6
    .line 7
    iget v2, p0, Ll/af5$b;->a:I

    .line 8
    .line 9
    const v3, 0x7fffffff

    .line 10
    .line 11
    .line 12
    const/high16 v4, -0x80000000

    .line 13
    .line 14
    const/4 v5, 0x0

    .line 15
    move v6, v4

    .line 16
    move v7, v6

    .line 17
    move v8, v7

    .line 18
    move v9, v5

    .line 19
    move v4, v3

    .line 20
    move v5, v4

    .line 21
    :goto_0
    iget v10, p0, Ll/af5$b;->b:I

    .line 22
    .line 23
    if-gt v2, v10, :cond_6

    .line 24
    .line 25
    aget v10, v1, v2

    .line 26
    .line 27
    aget v11, v0, v10

    .line 28
    .line 29
    add-int/2addr v9, v11

    .line 30
    invoke-static {v10}, Ll/af5;->k(I)I

    .line 31
    .line 32
    .line 33
    move-result v11

    .line 34
    invoke-static {v10}, Ll/af5;->j(I)I

    .line 35
    .line 36
    .line 37
    move-result v12

    .line 38
    invoke-static {v10}, Ll/af5;->i(I)I

    .line 39
    .line 40
    .line 41
    move-result v10

    .line 42
    if-le v11, v6, :cond_0

    .line 43
    .line 44
    move v6, v11

    .line 45
    :cond_0
    if-ge v11, v3, :cond_1

    .line 46
    .line 47
    move v3, v11

    .line 48
    :cond_1
    if-le v12, v7, :cond_2

    .line 49
    .line 50
    move v7, v12

    .line 51
    :cond_2
    if-ge v12, v4, :cond_3

    .line 52
    .line 53
    move v4, v12

    .line 54
    :cond_3
    if-le v10, v8, :cond_4

    .line 55
    .line 56
    move v8, v10

    .line 57
    :cond_4
    if-ge v10, v5, :cond_5

    .line 58
    .line 59
    move v5, v10

    .line 60
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_6
    iput v3, p0, Ll/af5$b;->d:I

    .line 64
    .line 65
    iput v6, p0, Ll/af5$b;->e:I

    .line 66
    .line 67
    iput v4, p0, Ll/af5$b;->f:I

    .line 68
    .line 69
    iput v7, p0, Ll/af5$b;->g:I

    .line 70
    .line 71
    iput v5, p0, Ll/af5$b;->h:I

    .line 72
    .line 73
    iput v8, p0, Ll/af5$b;->i:I

    .line 74
    .line 75
    iput v9, p0, Ll/af5$b;->c:I

    .line 76
    .line 77
    return-void
.end method

.method public final d()Ll/qf60$d;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/af5$b;->j:Ll/af5;

    .line 2
    .line 3
    iget-object v1, v0, Ll/af5;->a:[I

    .line 4
    .line 5
    iget-object v0, v0, Ll/af5;->b:[I

    .line 6
    .line 7
    iget v2, p0, Ll/af5$b;->a:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    move v5, v4

    .line 12
    move v6, v5

    .line 13
    :goto_0
    iget v7, p0, Ll/af5$b;->b:I

    .line 14
    .line 15
    if-gt v2, v7, :cond_0

    .line 16
    .line 17
    aget v7, v1, v2

    .line 18
    .line 19
    aget v8, v0, v7

    .line 20
    .line 21
    add-int/2addr v4, v8

    .line 22
    invoke-static {v7}, Ll/af5;->k(I)I

    .line 23
    .line 24
    .line 25
    move-result v9

    .line 26
    mul-int/2addr v9, v8

    .line 27
    add-int/2addr v3, v9

    .line 28
    invoke-static {v7}, Ll/af5;->j(I)I

    .line 29
    .line 30
    .line 31
    move-result v9

    .line 32
    mul-int/2addr v9, v8

    .line 33
    add-int/2addr v5, v9

    .line 34
    invoke-static {v7}, Ll/af5;->i(I)I

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    mul-int/2addr v8, v7

    .line 39
    add-int/2addr v6, v8

    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    int-to-float p0, v3

    .line 44
    int-to-float v0, v4

    .line 45
    div-float/2addr p0, v0

    .line 46
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    int-to-float v1, v5

    .line 51
    div-float/2addr v1, v0

    .line 52
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-float v2, v6

    .line 57
    div-float/2addr v2, v0

    .line 58
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    new-instance v2, Ll/qf60$d;

    .line 63
    .line 64
    invoke-static {p0, v1, v0}, Ll/af5;->b(III)I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-direct {v2, p0, v4}, Ll/qf60$d;-><init>(II)V

    .line 69
    .line 70
    .line 71
    return-object v2
.end method

.method public final e()I
    .locals 1

    .line 1
    iget v0, p0, Ll/af5$b;->b:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget p0, p0, Ll/af5$b;->a:I

    .line 6
    .line 7
    sub-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public final f()I
    .locals 3

    .line 1
    iget v0, p0, Ll/af5$b;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/af5$b;->d:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget v1, p0, Ll/af5$b;->g:I

    .line 7
    .line 8
    iget v2, p0, Ll/af5$b;->f:I

    .line 9
    .line 10
    sub-int/2addr v1, v2

    .line 11
    iget v2, p0, Ll/af5$b;->i:I

    .line 12
    .line 13
    iget p0, p0, Ll/af5$b;->h:I

    .line 14
    .line 15
    sub-int/2addr v2, p0

    .line 16
    if-lt v0, v1, :cond_0

    .line 17
    .line 18
    if-lt v0, v2, :cond_0

    .line 19
    .line 20
    const/4 p0, -0x3

    .line 21
    return p0

    .line 22
    :cond_0
    if-lt v1, v0, :cond_1

    .line 23
    .line 24
    if-lt v1, v2, :cond_1

    .line 25
    .line 26
    const/4 p0, -0x2

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, -0x1

    .line 29
    return p0
.end method

.method public final g()I
    .locals 3

    .line 1
    iget v0, p0, Ll/af5$b;->e:I

    .line 2
    .line 3
    iget v1, p0, Ll/af5$b;->d:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iget v1, p0, Ll/af5$b;->g:I

    .line 9
    .line 10
    iget v2, p0, Ll/af5$b;->f:I

    .line 11
    .line 12
    sub-int/2addr v1, v2

    .line 13
    add-int/lit8 v1, v1, 0x1

    .line 14
    .line 15
    mul-int/2addr v0, v1

    .line 16
    iget v1, p0, Ll/af5$b;->i:I

    .line 17
    .line 18
    iget p0, p0, Ll/af5$b;->h:I

    .line 19
    .line 20
    sub-int/2addr v1, p0

    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    mul-int/2addr v0, v1

    .line 24
    return v0
.end method

.method public final h()Ll/af5$b;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/af5$b;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/af5$b;->b()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ll/af5$b;

    .line 12
    .line 13
    iget-object v2, p0, Ll/af5$b;->j:Ll/af5;

    .line 14
    .line 15
    add-int/lit8 v3, v0, 0x1

    .line 16
    .line 17
    iget v4, p0, Ll/af5$b;->b:I

    .line 18
    .line 19
    invoke-direct {v1, v2, v3, v4}, Ll/af5$b;-><init>(Ll/af5;II)V

    .line 20
    .line 21
    .line 22
    iput v0, p0, Ll/af5$b;->b:I

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/af5$b;->c()V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_0
    const-string p0, "Can not split a box with only 1 color"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method
