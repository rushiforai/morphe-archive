.class public final Lcom/google/android/libraries/places/internal/zzbqu;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Ljava/util/logging/Logger;

.field private static final zzb:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Lcom/google/android/libraries/places/internal/zzbqu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbqu;->zza:Ljava/util/logging/Logger;

    .line 12
    .line 13
    const-string v0, "-bin"

    .line 14
    .line 15
    sget-object v1, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbqu;->zzb:[B

    .line 22
    .line 23
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zza(Lcom/google/android/libraries/places/internal/zzbcf;)[[B
    .locals 9

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzbar;->zzd(Lcom/google/android/libraries/places/internal/zzbcf;)[[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    array-length v3, p0

    .line 9
    if-ge v1, v3, :cond_4

    .line 10
    .line 11
    aget-object v3, p0, v1

    .line 12
    .line 13
    add-int/lit8 v4, v1, 0x1

    .line 14
    .line 15
    aget-object v4, p0, v4

    .line 16
    .line 17
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbqu;->zzb:[B

    .line 18
    .line 19
    invoke-static {v3, v5}, Lcom/google/android/libraries/places/internal/zzbqu;->zzc([B[B)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    add-int/lit8 v5, v2, 0x2

    .line 26
    .line 27
    add-int/lit8 v6, v2, 0x1

    .line 28
    .line 29
    aput-object v3, p0, v2

    .line 30
    .line 31
    sget-object v2, Lcom/google/android/libraries/places/internal/zzbar;->zzb:Lcom/google/android/libraries/places/internal/zzsi;

    .line 32
    .line 33
    array-length v3, v4

    .line 34
    invoke-virtual {v2, v4, v0, v3}, Lcom/google/android/libraries/places/internal/zzsi;->zzk([BII)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget-object v3, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    aput-object v2, p0, v6

    .line 45
    .line 46
    :goto_1
    move v2, v5

    .line 47
    goto :goto_4

    .line 48
    :cond_0
    array-length v5, v4

    .line 49
    move v6, v0

    .line 50
    :goto_2
    if-ge v6, v5, :cond_3

    .line 51
    .line 52
    aget-byte v7, v4, v6

    .line 53
    .line 54
    const/16 v8, 0x20

    .line 55
    .line 56
    if-lt v7, v8, :cond_2

    .line 57
    .line 58
    const/16 v8, 0x7e

    .line 59
    .line 60
    if-le v7, v8, :cond_1

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_2
    :goto_3
    new-instance v5, Ljava/lang/String;

    .line 67
    .line 68
    sget-object v6, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 69
    .line 70
    invoke-direct {v5, v3, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 71
    .line 72
    .line 73
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbqu;->zza:Ljava/util/logging/Logger;

    .line 74
    .line 75
    sget-object v6, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 76
    .line 77
    invoke-static {v4}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    new-instance v7, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v8, "Metadata key="

    .line 84
    .line 85
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v5, ", value="

    .line 92
    .line 93
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v4, " contains invalid ASCII characters"

    .line 100
    .line 101
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    const-string v5, "io.grpc.internal.TransportFrameUtil"

    .line 109
    .line 110
    const-string v7, "toHttp2Headers"

    .line 111
    .line 112
    invoke-virtual {v3, v6, v5, v7, v4}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_3
    add-int/lit8 v5, v2, 0x2

    .line 117
    .line 118
    add-int/lit8 v6, v2, 0x1

    .line 119
    .line 120
    aput-object v3, p0, v2

    .line 121
    .line 122
    aput-object v4, p0, v6

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :goto_4
    add-int/lit8 v1, v1, 0x2

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_4
    if-ne v2, v3, :cond_5

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_5
    invoke-static {p0, v0, v2}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    check-cast p0, [[B

    .line 136
    .line 137
    return-object p0
.end method

.method public static zzb([[B)[[B
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    array-length v2, p0

    .line 4
    if-ge v1, v2, :cond_9

    .line 5
    .line 6
    aget-object v2, p0, v1

    .line 7
    .line 8
    add-int/lit8 v3, v1, 0x1

    .line 9
    .line 10
    aget-object v4, p0, v3

    .line 11
    .line 12
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbqu;->zzb:[B

    .line 13
    .line 14
    invoke-static {v2, v5}, Lcom/google/android/libraries/places/internal/zzbqu;->zzc([B[B)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_8

    .line 19
    .line 20
    move v2, v0

    .line 21
    :goto_1
    array-length v5, v4

    .line 22
    if-ge v2, v5, :cond_7

    .line 23
    .line 24
    aget-byte v5, v4, v2

    .line 25
    .line 26
    const/16 v6, 0x2c

    .line 27
    .line 28
    if-ne v5, v6, :cond_6

    .line 29
    .line 30
    array-length v2, p0

    .line 31
    new-instance v3, Ljava/util/ArrayList;

    .line 32
    .line 33
    add-int/lit8 v2, v2, 0xa

    .line 34
    .line 35
    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 36
    .line 37
    .line 38
    move v2, v0

    .line 39
    :goto_2
    if-ge v2, v1, :cond_0

    .line 40
    .line 41
    aget-object v4, p0, v2

    .line 42
    .line 43
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_0
    :goto_3
    array-length v2, p0

    .line 50
    if-ge v1, v2, :cond_5

    .line 51
    .line 52
    aget-object v2, p0, v1

    .line 53
    .line 54
    add-int/lit8 v4, v1, 0x1

    .line 55
    .line 56
    aget-object v4, p0, v4

    .line 57
    .line 58
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbqu;->zzb:[B

    .line 59
    .line 60
    invoke-static {v2, v5}, Lcom/google/android/libraries/places/internal/zzbqu;->zzc([B[B)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-nez v5, :cond_1

    .line 65
    .line 66
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_5

    .line 73
    :cond_1
    move v5, v0

    .line 74
    move v7, v5

    .line 75
    :goto_4
    array-length v8, v4

    .line 76
    if-gt v5, v8, :cond_4

    .line 77
    .line 78
    if-eq v5, v8, :cond_2

    .line 79
    .line 80
    aget-byte v8, v4, v5

    .line 81
    .line 82
    if-ne v8, v6, :cond_3

    .line 83
    .line 84
    :cond_2
    sub-int v8, v5, v7

    .line 85
    .line 86
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzsi;->zzj()Lcom/google/android/libraries/places/internal/zzsi;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    new-instance v10, Ljava/lang/String;

    .line 91
    .line 92
    sget-object v11, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 93
    .line 94
    invoke-direct {v10, v4, v7, v8, v11}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v9, v10}, Lcom/google/android/libraries/places/internal/zzsi;->zzl(Ljava/lang/CharSequence;)[B

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    add-int/lit8 v8, v5, 0x1

    .line 102
    .line 103
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move v7, v8

    .line 110
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_4
    :goto_5
    add-int/lit8 v1, v1, 0x2

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_5
    new-array p0, v0, [[B

    .line 117
    .line 118
    invoke-interface {v3, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, [[B

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_7
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzsi;->zzj()Lcom/google/android/libraries/places/internal/zzsi;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    new-instance v5, Ljava/lang/String;

    .line 133
    .line 134
    sget-object v6, Lcom/google/android/libraries/places/internal/zzmb;->zza:Ljava/nio/charset/Charset;

    .line 135
    .line 136
    invoke-direct {v5, v4, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v5}, Lcom/google/android/libraries/places/internal/zzsi;->zzl(Ljava/lang/CharSequence;)[B

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    aput-object v2, p0, v3

    .line 144
    .line 145
    :cond_8
    add-int/lit8 v1, v1, 0x2

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_9
    return-object p0
.end method

.method private static zzc([B[B)Z
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    array-length v1, p1

    .line 3
    sub-int/2addr v0, v1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-ltz v0, :cond_2

    .line 6
    .line 7
    move v2, v0

    .line 8
    :goto_0
    array-length v3, p0

    .line 9
    if-ge v2, v3, :cond_1

    .line 10
    .line 11
    aget-byte v3, p0, v2

    .line 12
    .line 13
    sub-int v4, v2, v0

    .line 14
    .line 15
    aget-byte v4, p1, v4

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

    .line 25
    :cond_2
    return v1
.end method
