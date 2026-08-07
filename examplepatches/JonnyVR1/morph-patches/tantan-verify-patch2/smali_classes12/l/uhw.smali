.class public abstract Ll/uhw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:I

.field private final b:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/uhw;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/uhw;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/uhw;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract b()[B
.end method

.method public abstract c(I[B)[B
.end method

.method public final d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/uhw;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public f()Ll/uhw;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "This luminance source does not support rotation by 90 degrees."

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 7

    .line 1
    iget v0, p0, Ll/uhw;->a:I

    .line 2
    .line 3
    new-array v1, v0, [B

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    iget v3, p0, Ll/uhw;->b:I

    .line 8
    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    mul-int/2addr v3, v0

    .line 12
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    move v3, v0

    .line 17
    :goto_0
    iget v4, p0, Ll/uhw;->b:I

    .line 18
    .line 19
    if-ge v3, v4, :cond_4

    .line 20
    .line 21
    invoke-virtual {p0, v3, v1}, Ll/uhw;->c(I[B)[B

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    move v4, v0

    .line 26
    :goto_1
    iget v5, p0, Ll/uhw;->a:I

    .line 27
    .line 28
    if-ge v4, v5, :cond_3

    .line 29
    .line 30
    aget-byte v5, v1, v4

    .line 31
    .line 32
    and-int/lit16 v5, v5, 0xff

    .line 33
    .line 34
    const/16 v6, 0x40

    .line 35
    .line 36
    if-ge v5, v6, :cond_0

    .line 37
    .line 38
    const/16 v5, 0x23

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_0
    const/16 v6, 0x80

    .line 42
    .line 43
    if-ge v5, v6, :cond_1

    .line 44
    .line 45
    const/16 v5, 0x2b

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    const/16 v6, 0xc0

    .line 49
    .line 50
    if-ge v5, v6, :cond_2

    .line 51
    .line 52
    const/16 v5, 0x2e

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    const/16 v5, 0x20

    .line 56
    .line 57
    :goto_2
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    const/16 v4, 0xa

    .line 64
    .line 65
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    add-int/lit8 v3, v3, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method
