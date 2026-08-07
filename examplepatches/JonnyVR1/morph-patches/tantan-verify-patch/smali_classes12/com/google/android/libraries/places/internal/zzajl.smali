.class public final Lcom/google/android/libraries/places/internal/zzajl;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(IILjava/math/RoundingMode;)I
    .locals 5

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_8

    .line 6
    .line 7
    div-int v1, p0, p1

    .line 8
    .line 9
    mul-int v2, p1, v1

    .line 10
    .line 11
    sub-int v2, p0, v2

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    xor-int/2addr p0, p1

    .line 17
    sget-object v3, Lcom/google/android/libraries/places/internal/zzajk;->zza:[I

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    aget v3, v3, v4

    .line 24
    .line 25
    shr-int/lit8 p0, p0, 0x1f

    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    or-int/2addr p0, v4

    .line 29
    packed-switch v3, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/aqg0;->a()V

    .line 33
    .line 34
    .line 35
    return v0

    .line 36
    :pswitch_0
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    sub-int/2addr p1, v2

    .line 45
    sub-int/2addr v2, p1

    .line 46
    if-nez v2, :cond_3

    .line 47
    .line 48
    sget-object p1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 49
    .line 50
    if-eq p2, p1, :cond_6

    .line 51
    .line 52
    sget-object p1, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    .line 53
    .line 54
    if-ne p2, p1, :cond_1

    .line 55
    .line 56
    move v0, v4

    .line 57
    :cond_1
    and-int/lit8 p1, v1, 0x1

    .line 58
    .line 59
    and-int/2addr p1, v0

    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    return v1

    .line 64
    :cond_3
    if-lez v2, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    return v1

    .line 68
    :pswitch_1
    if-lez p0, :cond_5

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_5
    return v1

    .line 72
    :pswitch_2
    if-gez p0, :cond_7

    .line 73
    .line 74
    :cond_6
    :goto_0
    :pswitch_3
    add-int/2addr v1, p0

    .line 75
    :cond_7
    :goto_1
    :pswitch_4
    return v1

    .line 76
    :pswitch_5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzajn;->zza(Z)V

    .line 77
    .line 78
    .line 79
    return v1

    .line 80
    :cond_8
    const-string p0, "/ by zero"

    .line 81
    .line 82
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return v0

    .line 86
    nop

    .line 87
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

.method public static zzb(ILjava/math/RoundingMode;)I
    .locals 1

    .line 1
    if-lez p0, :cond_1

    .line 2
    .line 3
    sget-object v0, Lcom/google/android/libraries/places/internal/zzajk;->zza:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v0, p1

    .line 10
    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :pswitch_0
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const v0, -0x4afb0ccd

    .line 24
    .line 25
    .line 26
    ushr-int/2addr v0, p1

    .line 27
    rsub-int/lit8 p1, p1, 0x1f

    .line 28
    .line 29
    sub-int/2addr v0, p0

    .line 30
    ushr-int/lit8 p0, v0, 0x1f

    .line 31
    .line 32
    add-int/2addr p1, p0

    .line 33
    return p1

    .line 34
    :pswitch_1
    add-int/lit8 p0, p0, -0x1

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    rsub-int/lit8 p0, p0, 0x20

    .line 41
    .line 42
    return p0

    .line 43
    :pswitch_2
    add-int/lit8 p1, p0, -0x1

    .line 44
    .line 45
    and-int/2addr p1, p0

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    const/4 p1, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p1, 0x0

    .line 51
    :goto_0
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzajn;->zza(Z)V

    .line 52
    .line 53
    .line 54
    :pswitch_3
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    rsub-int/lit8 p0, p0, 0x1f

    .line 59
    .line 60
    return p0

    .line 61
    :cond_1
    const-string p0, "x (0) must be > 0"

    .line 62
    .line 63
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    nop

    .line 69
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
