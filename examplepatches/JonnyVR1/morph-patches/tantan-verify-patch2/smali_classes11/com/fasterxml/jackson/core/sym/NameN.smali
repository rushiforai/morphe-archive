.class public final Lcom/fasterxml/jackson/core/sym/NameN;
.super Lcom/fasterxml/jackson/core/sym/Name;
.source "SourceFile"


# instance fields
.field private final q:[I

.field private final q1:I

.field private final q2:I

.field private final q3:I

.field private final q4:I

.field private final qlen:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIII[II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/Name;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q1:I

    .line 5
    .line 6
    iput p4, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q2:I

    .line 7
    .line 8
    iput p5, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q3:I

    .line 9
    .line 10
    iput p6, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q4:I

    .line 11
    .line 12
    iput-object p7, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 13
    .line 14
    iput p8, p0, Lcom/fasterxml/jackson/core/sym/NameN;->qlen:I

    .line 15
    .line 16
    return-void
.end method

.method private final _equals2([I)Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/NameN;->qlen:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x4

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    add-int/lit8 v3, v2, 0x4

    .line 10
    .line 11
    aget v3, p1, v3

    .line 12
    .line 13
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 14
    .line 15
    aget v4, v4, v2

    .line 16
    .line 17
    if-eq v3, v4, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static construct(Ljava/lang/String;I[II)Lcom/fasterxml/jackson/core/sym/NameN;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-lt p3, v1, :cond_1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget v6, p2, v2

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    aget v7, p2, v2

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget v8, p2, v2

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    aget v9, p2, v2

    .line 16
    .line 17
    add-int/lit8 v2, p3, -0x4

    .line 18
    .line 19
    if-lez v2, :cond_0

    .line 20
    .line 21
    invoke-static {p2, v1, p3}, Ljava/util/Arrays;->copyOfRange([III)[I

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    move-object v10, v0

    .line 26
    new-instance v3, Lcom/fasterxml/jackson/core/sym/NameN;

    .line 27
    .line 28
    move-object v4, p0

    .line 29
    move v5, p1

    .line 30
    move v11, p3

    .line 31
    invoke-direct/range {v3 .. v11}, Lcom/fasterxml/jackson/core/sym/NameN;-><init>(Ljava/lang/String;IIIII[II)V

    .line 32
    .line 33
    .line 34
    return-object v3

    .line 35
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 0

    .line 88
    const/4 p0, 0x0

    return p0
.end method

.method public equals(II)Z
    .locals 0

    .line 87
    const/4 p0, 0x0

    return p0
.end method

.method public equals([II)Z
    .locals 6

    .line 1
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/NameN;->qlen:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p2, v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    aget v0, p1, v1

    .line 8
    .line 9
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q1:I

    .line 10
    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    const/4 v0, 0x1

    .line 15
    aget v2, p1, v0

    .line 16
    .line 17
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q2:I

    .line 18
    .line 19
    if-eq v2, v3, :cond_2

    .line 20
    .line 21
    return v1

    .line 22
    :cond_2
    const/4 v2, 0x2

    .line 23
    aget v3, p1, v2

    .line 24
    .line 25
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q3:I

    .line 26
    .line 27
    if-eq v3, v4, :cond_3

    .line 28
    .line 29
    return v1

    .line 30
    :cond_3
    const/4 v3, 0x3

    .line 31
    aget v4, p1, v3

    .line 32
    .line 33
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q4:I

    .line 34
    .line 35
    if-eq v4, v5, :cond_4

    .line 36
    .line 37
    return v1

    .line 38
    :cond_4
    packed-switch p2, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/sym/NameN;->_equals2([I)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :pswitch_0
    const/4 p2, 0x7

    .line 47
    aget p2, p1, p2

    .line 48
    .line 49
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 50
    .line 51
    aget v3, v4, v3

    .line 52
    .line 53
    if-eq p2, v3, :cond_5

    .line 54
    .line 55
    return v1

    .line 56
    :cond_5
    :pswitch_1
    const/4 p2, 0x6

    .line 57
    aget p2, p1, p2

    .line 58
    .line 59
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 60
    .line 61
    aget v2, v3, v2

    .line 62
    .line 63
    if-eq p2, v2, :cond_6

    .line 64
    .line 65
    return v1

    .line 66
    :cond_6
    :pswitch_2
    const/4 p2, 0x5

    .line 67
    aget p2, p1, p2

    .line 68
    .line 69
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 70
    .line 71
    aget v2, v2, v0

    .line 72
    .line 73
    if-eq p2, v2, :cond_7

    .line 74
    .line 75
    return v1

    .line 76
    :cond_7
    :pswitch_3
    const/4 p2, 0x4

    .line 77
    aget p1, p1, p2

    .line 78
    .line 79
    iget-object p0, p0, Lcom/fasterxml/jackson/core/sym/NameN;->q:[I

    .line 80
    .line 81
    aget p0, p0, v1

    .line 82
    .line 83
    if-eq p1, p0, :cond_8

    .line 84
    .line 85
    return v1

    .line 86
    :cond_8
    :pswitch_4
    return v0

    .line 87
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
