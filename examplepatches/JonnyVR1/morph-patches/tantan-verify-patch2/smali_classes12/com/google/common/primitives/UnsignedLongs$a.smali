.class public final Lcom/google/common/primitives/UnsignedLongs$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/primitives/UnsignedLongs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final a:[J

.field public static final b:[I

.field public static final c:[I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const/16 v0, 0x25

    .line 2
    .line 3
    new-array v1, v0, [J

    .line 4
    .line 5
    sput-object v1, Lcom/google/common/primitives/UnsignedLongs$a;->a:[J

    .line 6
    .line 7
    new-array v1, v0, [I

    .line 8
    .line 9
    sput-object v1, Lcom/google/common/primitives/UnsignedLongs$a;->b:[I

    .line 10
    .line 11
    new-array v0, v0, [I

    .line 12
    .line 13
    sput-object v0, Lcom/google/common/primitives/UnsignedLongs$a;->c:[I

    .line 14
    .line 15
    new-instance v0, Ljava/math/BigInteger;

    .line 16
    .line 17
    const-string v1, "10000000000000000"

    .line 18
    .line 19
    const/16 v2, 0x10

    .line 20
    .line 21
    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    :goto_0
    const/16 v2, 0x24

    .line 26
    .line 27
    if-gt v1, v2, :cond_0

    .line 28
    .line 29
    sget-object v2, Lcom/google/common/primitives/UnsignedLongs$a;->a:[J

    .line 30
    .line 31
    int-to-long v3, v1

    .line 32
    const-wide/16 v5, -0x1

    .line 33
    .line 34
    invoke-static {v5, v6, v3, v4}, Lcom/google/common/primitives/UnsignedLongs;->b(JJ)J

    .line 35
    .line 36
    .line 37
    move-result-wide v7

    .line 38
    aput-wide v7, v2, v1

    .line 39
    .line 40
    sget-object v2, Lcom/google/common/primitives/UnsignedLongs$a;->b:[I

    .line 41
    .line 42
    invoke-static {v5, v6, v3, v4}, Lcom/google/common/primitives/UnsignedLongs;->e(JJ)J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    long-to-int v3, v3

    .line 47
    aput v3, v2, v1

    .line 48
    .line 49
    sget-object v2, Lcom/google/common/primitives/UnsignedLongs$a;->c:[I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    add-int/lit8 v3, v3, -0x1

    .line 60
    .line 61
    aput v3, v2, v1

    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    return-void
.end method

.method public static a(JII)Z
    .locals 5

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ltz v0, :cond_3

    .line 7
    .line 8
    sget-object v0, Lcom/google/common/primitives/UnsignedLongs$a;->a:[J

    .line 9
    .line 10
    aget-wide v2, v0, p3

    .line 11
    .line 12
    cmp-long v0, p0, v2

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    return v4

    .line 18
    :cond_0
    cmp-long p0, p0, v2

    .line 19
    .line 20
    if-lez p0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    sget-object p0, Lcom/google/common/primitives/UnsignedLongs$a;->b:[I

    .line 24
    .line 25
    aget p0, p0, p3

    .line 26
    .line 27
    if-le p2, p0, :cond_2

    .line 28
    .line 29
    return v1

    .line 30
    :cond_2
    return v4

    .line 31
    :cond_3
    return v1
.end method
