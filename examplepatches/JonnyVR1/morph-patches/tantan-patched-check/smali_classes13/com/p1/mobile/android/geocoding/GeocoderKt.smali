.class public final Lcom/p1/mobile/android/geocoding/GeocoderKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\u001a\u001c\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0004H\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "pnpoly",
        "",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
        "lat",
        "",
        "lon",
        "geocoding_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x1,
        0xd
    }
.end annotation


# direct methods
.method public static final pnpoly(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;FF)Z
    .locals 9
    .param p0    # Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeList()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeList()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    sub-int/2addr v1, v2

    .line 18
    const/4 v3, 0x0

    .line 19
    move v4, v1

    .line 20
    move v1, v3

    .line 21
    move v5, v1

    .line 22
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    if-ge v1, v6, :cond_3

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    check-cast v6, Ljava/lang/Number;

    .line 33
    .line 34
    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    cmpl-float v6, v6, p1

    .line 39
    .line 40
    if-lez v6, :cond_0

    .line 41
    .line 42
    move v6, v2

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    move v6, v3

    .line 45
    :goto_1
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v7

    .line 49
    check-cast v7, Ljava/lang/Number;

    .line 50
    .line 51
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    cmpl-float v7, v7, p1

    .line 56
    .line 57
    if-lez v7, :cond_1

    .line 58
    .line 59
    move v7, v2

    .line 60
    goto :goto_2

    .line 61
    :cond_1
    move v7, v3

    .line 62
    :goto_2
    if-eq v6, v7, :cond_2

    .line 63
    .line 64
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    check-cast v6, Ljava/lang/Number;

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v7

    .line 78
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    check-cast v7, Ljava/lang/Number;

    .line 82
    .line 83
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    sub-float/2addr v6, v7

    .line 88
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    check-cast v7, Ljava/lang/Number;

    .line 96
    .line 97
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    sub-float v7, p1, v7

    .line 102
    .line 103
    mul-float/2addr v6, v7

    .line 104
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    check-cast v4, Ljava/lang/Number;

    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    check-cast v7, Ljava/lang/Number;

    .line 122
    .line 123
    invoke-virtual {v7}, Ljava/lang/Number;->floatValue()F

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    sub-float/2addr v4, v7

    .line 128
    div-float/2addr v6, v4

    .line 129
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    check-cast v4, Ljava/lang/Number;

    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    add-float/2addr v6, v4

    .line 143
    cmpg-float v4, p2, v6

    .line 144
    .line 145
    if-gez v4, :cond_2

    .line 146
    .line 147
    xor-int/lit8 v5, v5, 0x1

    .line 148
    .line 149
    :cond_2
    add-int/lit8 v4, v1, 0x1

    .line 150
    .line 151
    move v8, v4

    .line 152
    move v4, v1

    .line 153
    move v1, v8

    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_3
    return v5
.end method
