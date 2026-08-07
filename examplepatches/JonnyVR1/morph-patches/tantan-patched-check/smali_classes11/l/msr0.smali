.class public final Ll/msr0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:[B


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/msr0;->f:[B

    .line 8
    .line 9
    return-void

    .line 10
    nop

    .line 11
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x80

    .line 5
    .line 6
    new-array p1, p1, [B

    .line 7
    .line 8
    iput-object p1, p0, Ll/msr0;->e:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a([BII)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/msr0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sub-int/2addr p3, p2

    .line 7
    iget-object v0, p0, Ll/msr0;->e:[B

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    iget v2, p0, Ll/msr0;->c:I

    .line 11
    .line 12
    add-int/2addr v2, p3

    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    add-int/2addr v2, v2

    .line 16
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/msr0;->e:[B

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/msr0;->e:[B

    .line 23
    .line 24
    iget v1, p0, Ll/msr0;->c:I

    .line 25
    .line 26
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget p1, p0, Ll/msr0;->c:I

    .line 30
    .line 31
    add-int/2addr p1, p3

    .line 32
    iput p1, p0, Ll/msr0;->c:I

    .line 33
    .line 34
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/msr0;->a:Z

    .line 3
    .line 4
    iput v0, p0, Ll/msr0;->c:I

    .line 5
    .line 6
    iput v0, p0, Ll/msr0;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public final c(II)Z
    .locals 8

    .line 1
    iget v0, p0, Ll/msr0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x3

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    const/16 v4, 0xb5

    .line 9
    .line 10
    const/4 v5, 0x2

    .line 11
    const-string v6, "Unexpected start code value"

    .line 12
    .line 13
    const-string v7, "H263Reader"

    .line 14
    .line 15
    if-eq v0, v3, :cond_5

    .line 16
    .line 17
    if-eq v0, v5, :cond_3

    .line 18
    .line 19
    if-eq v0, v2, :cond_1

    .line 20
    .line 21
    const/16 v0, 0xb3

    .line 22
    .line 23
    if-eq p1, v0, :cond_0

    .line 24
    .line 25
    if-ne p1, v4, :cond_8

    .line 26
    .line 27
    :cond_0
    iget p1, p0, Ll/msr0;->c:I

    .line 28
    .line 29
    sub-int/2addr p1, p2

    .line 30
    iput p1, p0, Ll/msr0;->c:I

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/msr0;->a:Z

    .line 33
    .line 34
    return v3

    .line 35
    :cond_1
    and-int/lit16 p1, p1, 0xf0

    .line 36
    .line 37
    const/16 p2, 0x20

    .line 38
    .line 39
    if-eq p1, p2, :cond_2

    .line 40
    .line 41
    invoke-static {v7, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/msr0;->b()V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget p1, p0, Ll/msr0;->c:I

    .line 49
    .line 50
    iput p1, p0, Ll/msr0;->d:I

    .line 51
    .line 52
    const/4 p1, 0x4

    .line 53
    iput p1, p0, Ll/msr0;->b:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/16 p2, 0x1f

    .line 57
    .line 58
    if-le p1, p2, :cond_4

    .line 59
    .line 60
    invoke-static {v7, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/msr0;->b()V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    iput v2, p0, Ll/msr0;->b:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_5
    if-eq p1, v4, :cond_6

    .line 71
    .line 72
    invoke-static {v7, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/msr0;->b()V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_6
    iput v5, p0, Ll/msr0;->b:I

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_7
    const/16 p2, 0xb0

    .line 83
    .line 84
    if-ne p1, p2, :cond_8

    .line 85
    .line 86
    iput v3, p0, Ll/msr0;->b:I

    .line 87
    .line 88
    iput-boolean v3, p0, Ll/msr0;->a:Z

    .line 89
    .line 90
    :cond_8
    :goto_0
    sget-object p1, Ll/msr0;->f:[B

    .line 91
    .line 92
    invoke-virtual {p0, p1, v1, v2}, Ll/msr0;->a([BII)V

    .line 93
    .line 94
    .line 95
    return v1
.end method
