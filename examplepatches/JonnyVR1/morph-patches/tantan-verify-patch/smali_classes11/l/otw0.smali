.class public final Ll/otw0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(IILjava/math/RoundingMode;)I
    .locals 5

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    div-int/lit8 p1, p0, 0x8

    .line 5
    .line 6
    mul-int/lit8 v0, p1, 0x8

    .line 7
    .line 8
    sub-int v0, p0, v0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    const/16 v1, 0x8

    .line 14
    .line 15
    xor-int/2addr p0, v1

    .line 16
    sget-object v2, Ll/ntw0;->a:[I

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    aget v2, v2, v3

    .line 23
    .line 24
    shr-int/lit8 p0, p0, 0x1f

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    or-int/2addr p0, v3

    .line 28
    const/4 v4, 0x0

    .line 29
    packed-switch v2, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/aqg0;->a()V

    .line 33
    .line 34
    .line 35
    return v4

    .line 36
    :pswitch_0
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    sub-int/2addr v1, v0

    .line 45
    sub-int/2addr v0, v1

    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    sget-object v0, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 49
    .line 50
    if-eq p2, v0, :cond_6

    .line 51
    .line 52
    sget-object v0, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    .line 53
    .line 54
    if-ne p2, v0, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    move v3, v4

    .line 58
    :goto_0
    and-int/lit8 p2, p1, 0x1

    .line 59
    .line 60
    and-int/2addr p2, v3

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    return p1

    .line 65
    :cond_3
    if-lez v0, :cond_4

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    return p1

    .line 69
    :pswitch_1
    if-lez p0, :cond_5

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_5
    return p1

    .line 73
    :pswitch_2
    if-gez p0, :cond_7

    .line 74
    .line 75
    :cond_6
    :goto_1
    :pswitch_3
    add-int/2addr p1, p0

    .line 76
    :cond_7
    :goto_2
    :pswitch_4
    return p1

    .line 77
    :pswitch_5
    invoke-static {v4}, Ll/rtw0;->b(Z)V

    .line 78
    .line 79
    .line 80
    return p1

    .line 81
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
