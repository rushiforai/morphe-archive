.class public Ll/oo4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oo4$a;,
        Ll/oo4$b;,
        Ll/oo4$c;,
        Ll/oo4$d;,
        Ll/oo4$e;,
        Ll/oo4$f;,
        Ll/oo4$g;,
        Ll/oo4$h;,
        Ll/oo4$i;,
        Ll/oo4$j;,
        Ll/oo4$k;,
        Ll/oo4$l;,
        Ll/oo4$m;,
        Ll/oo4$n;
    }
.end annotation


# instance fields
.field public a:[B

.field public b:[Ll/oo4$j;


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
    new-array v0, v0, [B

    .line 6
    .line 7
    iput-object v0, p0, Ll/oo4;->a:[B

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/oo4;->b:[Ll/oo4$j;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(IJ)Ll/oo4$j;
    .locals 7

    .line 1
    const/16 v0, 0x7f

    .line 2
    .line 3
    const-wide/32 v1, 0x7fffffff

    .line 4
    .line 5
    .line 6
    const-wide/16 v3, 0x7fff

    .line 7
    .line 8
    const-wide/16 v5, 0x7f

    .line 9
    .line 10
    if-gt p1, v0, :cond_3

    .line 11
    .line 12
    cmp-long v0, p2, v5

    .line 13
    .line 14
    if-gtz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ll/oo4$b;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$b;-><init>(Ll/oo4;IJ)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_0
    cmp-long v0, p2, v3

    .line 23
    .line 24
    if-gtz v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ll/oo4$e;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$e;-><init>(Ll/oo4;IJ)V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    cmp-long v0, p2, v1

    .line 33
    .line 34
    if-gtz v0, :cond_2

    .line 35
    .line 36
    new-instance v0, Ll/oo4$c;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$c;-><init>(Ll/oo4;IJ)V

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :cond_2
    new-instance v0, Ll/oo4$d;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$d;-><init>(Ll/oo4;IJ)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_3
    const/16 v0, 0x7fff

    .line 49
    .line 50
    if-gt p1, v0, :cond_7

    .line 51
    .line 52
    cmp-long v0, p2, v5

    .line 53
    .line 54
    if-gtz v0, :cond_4

    .line 55
    .line 56
    new-instance v0, Ll/oo4$k;

    .line 57
    .line 58
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$k;-><init>(Ll/oo4;IJ)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_4
    cmp-long v0, p2, v3

    .line 63
    .line 64
    if-gtz v0, :cond_5

    .line 65
    .line 66
    new-instance v0, Ll/oo4$n;

    .line 67
    .line 68
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$n;-><init>(Ll/oo4;IJ)V

    .line 69
    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_5
    cmp-long v0, p2, v1

    .line 73
    .line 74
    if-gtz v0, :cond_6

    .line 75
    .line 76
    new-instance v0, Ll/oo4$l;

    .line 77
    .line 78
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$l;-><init>(Ll/oo4;IJ)V

    .line 79
    .line 80
    .line 81
    return-object v0

    .line 82
    :cond_6
    new-instance v0, Ll/oo4$m;

    .line 83
    .line 84
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$m;-><init>(Ll/oo4;IJ)V

    .line 85
    .line 86
    .line 87
    return-object v0

    .line 88
    :cond_7
    cmp-long v0, p2, v5

    .line 89
    .line 90
    if-gtz v0, :cond_8

    .line 91
    .line 92
    new-instance v0, Ll/oo4$f;

    .line 93
    .line 94
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$f;-><init>(Ll/oo4;IJ)V

    .line 95
    .line 96
    .line 97
    return-object v0

    .line 98
    :cond_8
    cmp-long v0, p2, v3

    .line 99
    .line 100
    if-gtz v0, :cond_9

    .line 101
    .line 102
    new-instance v0, Ll/oo4$i;

    .line 103
    .line 104
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$i;-><init>(Ll/oo4;IJ)V

    .line 105
    .line 106
    .line 107
    return-object v0

    .line 108
    :cond_9
    cmp-long v0, p2, v1

    .line 109
    .line 110
    if-gtz v0, :cond_a

    .line 111
    .line 112
    new-instance v0, Ll/oo4$g;

    .line 113
    .line 114
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$g;-><init>(Ll/oo4;IJ)V

    .line 115
    .line 116
    .line 117
    return-object v0

    .line 118
    :cond_a
    new-instance v0, Ll/oo4$h;

    .line 119
    .line 120
    invoke-direct {v0, p0, p1, p2, p3}, Ll/oo4$h;-><init>(Ll/oo4;IJ)V

    .line 121
    .line 122
    .line 123
    return-object v0
.end method

.method public b()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oo4;->a:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget-object p0, p0, Ll/oo4;->b:[Ll/oo4$j;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    array-length v1, p0

    .line 9
    if-lez v1, :cond_0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    array-length p0, p0

    .line 14
    mul-int/lit8 p0, p0, 0x6

    .line 15
    .line 16
    add-int/2addr v0, p0

    .line 17
    :cond_0
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    check-cast p1, Ll/oo4;

    .line 20
    .line 21
    new-instance v2, Ljava/math/BigInteger;

    .line 22
    .line 23
    iget-object v3, p0, Ll/oo4;->a:[B

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/math/BigInteger;-><init>([B)V

    .line 26
    .line 27
    .line 28
    new-instance v3, Ljava/math/BigInteger;

    .line 29
    .line 30
    iget-object v4, p1, Ll/oo4;->a:[B

    .line 31
    .line 32
    invoke-direct {v3, v4}, Ljava/math/BigInteger;-><init>([B)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    return v1

    .line 42
    :cond_2
    iget-object p0, p0, Ll/oo4;->b:[Ll/oo4$j;

    .line 43
    .line 44
    iget-object p1, p1, Ll/oo4;->b:[Ll/oo4$j;

    .line 45
    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_4

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    if-eqz p1, :cond_4

    .line 56
    .line 57
    :goto_0
    return v1

    .line 58
    :cond_4
    return v0

    .line 59
    :cond_5
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oo4;->a:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 13
    .line 14
    iget-object p0, p0, Ll/oo4;->b:[Ll/oo4$j;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :cond_1
    add-int/2addr v0, v1

    .line 23
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Entry{iv="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/oo4;->a:[B

    .line 9
    .line 10
    invoke-static {v1}, Ll/g2l;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", pairs="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/oo4;->b:[Ll/oo4$j;

    .line 23
    .line 24
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/16 p0, 0x7d

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method
