.class public final Lcom/google/android/libraries/places/internal/zzakj;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static zza(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    if-ne v1, p1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    add-int/lit8 v2, v1, 0x1

    .line 11
    .line 12
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    const/16 v4, 0x7e

    .line 17
    .line 18
    const v5, 0xd800

    .line 19
    .line 20
    .line 21
    if-gt v3, v4, :cond_1

    .line 22
    .line 23
    const/16 v4, 0x20

    .line 24
    .line 25
    if-lt v3, v4, :cond_2

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    if-ge v3, v5, :cond_2

    .line 29
    .line 30
    const/16 v4, 0xa0

    .line 31
    .line 32
    if-lt v3, v4, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    if-ge v3, v5, :cond_3

    .line 36
    .line 37
    const/16 v1, 0xa

    .line 38
    .line 39
    if-eq v3, v1, :cond_4

    .line 40
    .line 41
    const/16 v1, 0xd

    .line 42
    .line 43
    if-eq v3, v1, :cond_4

    .line 44
    .line 45
    const/16 v1, 0x9

    .line 46
    .line 47
    if-eq v3, v1, :cond_4

    .line 48
    .line 49
    const/16 v1, 0xc

    .line 50
    .line 51
    if-eq v3, v1, :cond_4

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    const v4, 0xdfff

    .line 55
    .line 56
    .line 57
    const v5, 0xfffe

    .line 58
    .line 59
    .line 60
    if-le v3, v4, :cond_5

    .line 61
    .line 62
    const v1, 0xfdd0

    .line 63
    .line 64
    .line 65
    if-lt v3, v1, :cond_4

    .line 66
    .line 67
    const v1, 0xfdef

    .line 68
    .line 69
    .line 70
    if-le v3, v1, :cond_6

    .line 71
    .line 72
    if-ge v3, v5, :cond_6

    .line 73
    .line 74
    :cond_4
    :goto_1
    move v1, v2

    .line 75
    goto :goto_0

    .line 76
    :cond_5
    invoke-static {p0, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    const/high16 v3, 0x10000

    .line 81
    .line 82
    if-lt v2, v3, :cond_6

    .line 83
    .line 84
    and-int/2addr v2, v5

    .line 85
    if-eq v2, v5, :cond_6

    .line 86
    .line 87
    add-int/lit8 v1, v1, 0x2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 97
    .line 98
    .line 99
    :goto_3
    if-ge v0, p1, :cond_9

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzakj;->zzb(I)Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-eqz v3, :cond_7

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    add-int/lit8 v0, v0, 0x1

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_7
    invoke-static {p0, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzakj;->zzb(I)Z

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    const/4 v4, 0x1

    .line 126
    if-eq v4, v3, :cond_8

    .line 127
    .line 128
    const v3, 0xfffd

    .line 129
    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_8
    move v3, v2

    .line 133
    :goto_4
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    add-int/2addr v0, v2

    .line 141
    goto :goto_3

    .line 142
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    return-object p0
.end method

.method public static zzb(I)Z
    .locals 4

    const/16 v0, 0x7e

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gt p0, v0, :cond_2

    const/16 v0, 0x20

    if-ge p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc

    if-ne p0, v0, :cond_0

    return v2

    :cond_0
    return v1

    :cond_1
    return v2

    :cond_2
    const v0, 0xd800

    if-ge p0, v0, :cond_4

    const/16 v0, 0xa0

    if-ge p0, v0, :cond_3

    return v1

    :cond_3
    return v2

    :cond_4
    const v0, 0xfdd0

    if-ge p0, v0, :cond_6

    const v0, 0xdfff

    if-gt p0, v0, :cond_5

    return v1

    :cond_5
    return v2

    :cond_6
    const v0, 0xfdef

    if-le p0, v0, :cond_8

    const v0, 0xfffe

    and-int v3, p0, v0

    if-eq v3, v0, :cond_8

    const v0, 0x10ffff

    if-le p0, v0, :cond_7

    return v1

    :cond_7
    return v2

    :cond_8
    return v1
.end method
