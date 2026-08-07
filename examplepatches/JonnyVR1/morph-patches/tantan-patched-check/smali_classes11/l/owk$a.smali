.class public final Ll/owk$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/owk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


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
    sput-object v0, Ll/owk$a;->f:[B

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
    new-array p1, p1, [B

    .line 5
    .line 6
    iput-object p1, p0, Ll/owk$a;->e:[B

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a([BII)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/owk$a;->a:Z

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
    iget-object v0, p0, Ll/owk$a;->e:[B

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    iget v2, p0, Ll/owk$a;->c:I

    .line 11
    .line 12
    add-int v3, v2, p3

    .line 13
    .line 14
    if-ge v1, v3, :cond_1

    .line 15
    .line 16
    add-int/2addr v2, p3

    .line 17
    mul-int/lit8 v2, v2, 0x2

    .line 18
    .line 19
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/owk$a;->e:[B

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/owk$a;->e:[B

    .line 26
    .line 27
    iget v1, p0, Ll/owk$a;->c:I

    .line 28
    .line 29
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iget p1, p0, Ll/owk$a;->c:I

    .line 33
    .line 34
    add-int/2addr p1, p3

    .line 35
    iput p1, p0, Ll/owk$a;->c:I

    .line 36
    .line 37
    return-void
.end method

.method public b(II)Z
    .locals 8

    .line 1
    iget v0, p0, Ll/owk$a;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_8

    .line 6
    .line 7
    const/16 v3, 0xb5

    .line 8
    .line 9
    const/4 v4, 0x2

    .line 10
    const-string v5, "Unexpected start code value"

    .line 11
    .line 12
    const-string v6, "H263Reader"

    .line 13
    .line 14
    if-eq v0, v2, :cond_6

    .line 15
    .line 16
    const/4 v7, 0x3

    .line 17
    if-eq v0, v4, :cond_4

    .line 18
    .line 19
    const/4 v4, 0x4

    .line 20
    if-eq v0, v7, :cond_2

    .line 21
    .line 22
    if-ne v0, v4, :cond_1

    .line 23
    .line 24
    const/16 v0, 0xb3

    .line 25
    .line 26
    if-eq p1, v0, :cond_0

    .line 27
    .line 28
    if-ne p1, v3, :cond_9

    .line 29
    .line 30
    :cond_0
    iget p1, p0, Ll/owk$a;->c:I

    .line 31
    .line 32
    sub-int/2addr p1, p2

    .line 33
    iput p1, p0, Ll/owk$a;->c:I

    .line 34
    .line 35
    iput-boolean v1, p0, Ll/owk$a;->a:Z

    .line 36
    .line 37
    return v2

    .line 38
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_2
    and-int/lit16 p1, p1, 0xf0

    .line 44
    .line 45
    const/16 p2, 0x20

    .line 46
    .line 47
    if-eq p1, p2, :cond_3

    .line 48
    .line 49
    invoke-static {v6, v5}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/owk$a;->c()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    iget p1, p0, Ll/owk$a;->c:I

    .line 57
    .line 58
    iput p1, p0, Ll/owk$a;->d:I

    .line 59
    .line 60
    iput v4, p0, Ll/owk$a;->b:I

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    const/16 p2, 0x1f

    .line 64
    .line 65
    if-le p1, p2, :cond_5

    .line 66
    .line 67
    invoke-static {v6, v5}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/owk$a;->c()V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_5
    iput v7, p0, Ll/owk$a;->b:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_6
    if-eq p1, v3, :cond_7

    .line 78
    .line 79
    invoke-static {v6, v5}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/owk$a;->c()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_7
    iput v4, p0, Ll/owk$a;->b:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_8
    const/16 p2, 0xb0

    .line 90
    .line 91
    if-ne p1, p2, :cond_9

    .line 92
    .line 93
    iput v2, p0, Ll/owk$a;->b:I

    .line 94
    .line 95
    iput-boolean v2, p0, Ll/owk$a;->a:Z

    .line 96
    .line 97
    :cond_9
    :goto_0
    sget-object p1, Ll/owk$a;->f:[B

    .line 98
    .line 99
    array-length p2, p1

    .line 100
    invoke-virtual {p0, p1, v1, p2}, Ll/owk$a;->a([BII)V

    .line 101
    .line 102
    .line 103
    return v1
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/owk$a;->a:Z

    .line 3
    .line 4
    iput v0, p0, Ll/owk$a;->c:I

    .line 5
    .line 6
    iput v0, p0, Ll/owk$a;->b:I

    .line 7
    .line 8
    return-void
.end method
