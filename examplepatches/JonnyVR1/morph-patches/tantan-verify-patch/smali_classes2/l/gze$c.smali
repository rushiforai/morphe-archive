.class public final Ll/gze$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation


# instance fields
.field public a:I

.field public final b:Ll/ha00$a;

.field public c:Ll/ha00$a;

.field public d:Ll/ha00$a;

.field public e:I

.field public f:I

.field public final g:Z

.field public final h:[I


# direct methods
.method public constructor <init>(Ll/ha00$a;Z[I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/gze$c;->a:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/gze$c;->b:Ll/ha00$a;

    .line 8
    .line 9
    iput-object p1, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 10
    .line 11
    iput-boolean p2, p0, Ll/gze$c;->g:Z

    .line 12
    .line 13
    iput-object p3, p0, Ll/gze$c;->h:[I

    .line 14
    .line 15
    return-void
.end method

.method public static d(I)Z
    .locals 1

    .line 1
    const v0, 0xfe0f

    .line 2
    .line 3
    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static f(I)Z
    .locals 1

    .line 1
    const v0, 0xfe0e

    .line 2
    .line 3
    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method


# virtual methods
.method public a(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ha00$a;->a(I)Ll/ha00$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Ll/gze$c;->a:I

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x2

    .line 11
    if-eq v1, v3, :cond_1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iput v3, p0, Ll/gze$c;->a:I

    .line 21
    .line 22
    iput-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 23
    .line 24
    iput v2, p0, Ll/gze$c;->f:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iput-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 30
    .line 31
    iget v0, p0, Ll/gze$c;->f:I

    .line 32
    .line 33
    add-int/2addr v0, v2

    .line 34
    iput v0, p0, Ll/gze$c;->f:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-static {p1}, Ll/gze$c;->f(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    goto :goto_0

    .line 48
    :cond_3
    invoke-static {p1}, Ll/gze$c;->d(I)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_4
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/ha00$a;->b()Ll/fze;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_7

    .line 62
    .line 63
    iget v0, p0, Ll/gze$c;->f:I

    .line 64
    .line 65
    const/4 v3, 0x3

    .line 66
    if-ne v0, v2, :cond_6

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/gze$c;->h()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 75
    .line 76
    iput-object v0, p0, Ll/gze$c;->d:Ll/ha00$a;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    goto :goto_0

    .line 87
    :cond_6
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 88
    .line 89
    iput-object v0, p0, Ll/gze$c;->d:Ll/ha00$a;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_7
    invoke-virtual {p0}, Ll/gze$c;->g()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    :goto_0
    iput p1, p0, Ll/gze$c;->e:I

    .line 100
    .line 101
    return v3
.end method

.method public b()Ll/fze;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha00$a;->b()Ll/fze;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ll/fze;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gze$c;->d:Ll/ha00$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ha00$a;->b()Ll/fze;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/gze$c;->a:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ha00$a;->b()Ll/fze;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget v0, p0, Ll/gze$c;->f:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-gt v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gze$c;->h()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    :cond_0
    return v1

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final g()I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/gze$c;->a:I

    .line 3
    .line 4
    iget-object v1, p0, Ll/gze$c;->b:Ll/ha00$a;

    .line 5
    .line 6
    iput-object v1, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Ll/gze$c;->f:I

    .line 10
    .line 11
    return v0
.end method

.method public final h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ha00$a;->b()Ll/fze;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/fze;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget v0, p0, Ll/gze$c;->e:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/gze$c;->d(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-boolean v0, p0, Ll/gze$c;->g:Z

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    iget-object v0, p0, Ll/gze$c;->h:[I

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v0, p0, Ll/gze$c;->c:Ll/ha00$a;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/ha00$a;->b()Ll/fze;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, v2}, Ll/fze;->b(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object p0, p0, Ll/gze$c;->h:[I

    .line 45
    .line 46
    invoke-static {p0, v0}, Ljava/util/Arrays;->binarySearch([II)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-gez p0, :cond_3

    .line 51
    .line 52
    return v1

    .line 53
    :cond_3
    return v2
.end method
