.class public final Ll/fy2;
.super Ll/x1j0;
.source "SourceFile"


# instance fields
.field public final c:S

.field public final d:S


# direct methods
.method public constructor <init>(Ll/x1j0;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x1j0;-><init>(Ll/x1j0;)V

    .line 2
    .line 3
    .line 4
    int-to-short p1, p2

    .line 5
    iput-short p1, p0, Ll/fy2;->c:S

    .line 6
    .line 7
    int-to-short p1, p3

    .line 8
    iput-short p1, p0, Ll/fy2;->d:S

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public c(Ll/b13;[B)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-short v1, p0, Ll/fy2;->d:S

    .line 3
    .line 4
    if-ge v0, v1, :cond_4

    .line 5
    .line 6
    const/16 v2, 0x3e

    .line 7
    .line 8
    const/16 v3, 0x1f

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    if-ne v0, v3, :cond_3

    .line 13
    .line 14
    if-gt v1, v2, :cond_3

    .line 15
    .line 16
    :cond_0
    const/4 v1, 0x5

    .line 17
    invoke-virtual {p1, v3, v1}, Ll/b13;->c(II)V

    .line 18
    .line 19
    .line 20
    iget-short v4, p0, Ll/fy2;->d:S

    .line 21
    .line 22
    if-le v4, v2, :cond_1

    .line 23
    .line 24
    add-int/lit8 v4, v4, -0x1f

    .line 25
    .line 26
    const/16 v1, 0x10

    .line 27
    .line 28
    invoke-virtual {p1, v4, v1}, Ll/b13;->c(II)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p1, v2, v1}, Ll/b13;->c(II)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    add-int/lit8 v4, v4, -0x1f

    .line 43
    .line 44
    invoke-virtual {p1, v4, v1}, Ll/b13;->c(II)V

    .line 45
    .line 46
    .line 47
    :cond_3
    :goto_1
    iget-short v1, p0, Ll/fy2;->c:S

    .line 48
    .line 49
    add-int/2addr v1, v0

    .line 50
    aget-byte v1, p2, v1

    .line 51
    .line 52
    const/16 v2, 0x8

    .line 53
    .line 54
    invoke-virtual {p1, v1, v2}, Ll/b13;->c(II)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-short v1, p0, Ll/fy2;->c:S

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "::"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-short v1, p0, Ll/fy2;->c:S

    .line 19
    .line 20
    iget-short p0, p0, Ll/fy2;->d:S

    .line 21
    .line 22
    add-int/2addr v1, p0

    .line 23
    add-int/lit8 v1, v1, -0x1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const/16 p0, 0x3e

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
