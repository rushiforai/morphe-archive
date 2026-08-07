.class public final Ll/zoy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll/zoy0;

.field public static final d:Lcom/google/android/gms/internal/ads/zzgaa;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation
.end field

.field public static final e:Lcom/google/android/gms/internal/ads/zzgad;


# instance fields
.field public final a:[I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/zoy0;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    filled-new-array {v1}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    const/16 v3, 0xa

    .line 9
    .line 10
    invoke-direct {v0, v2, v3}, Ll/zoy0;-><init>([II)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/zoy0;->c:Ll/zoy0;

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x5

    .line 20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x6

    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzo(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/zoy0;->d:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 34
    .line 35
    new-instance v0, Lcom/google/android/gms/internal/ads/w2;

    .line 36
    .line 37
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/w2;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 41
    .line 42
    .line 43
    const/16 v1, 0x11

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x7

    .line 53
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 58
    .line 59
    .line 60
    const/16 v1, 0x1e

    .line 61
    .line 62
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 71
    .line 72
    .line 73
    const/16 v1, 0x12

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 80
    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1, v1}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 92
    .line 93
    .line 94
    const/16 v2, 0xe

    .line 95
    .line 96
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/ads/w2;->a(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/w2;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/w2;->c()Lcom/google/android/gms/internal/ads/zzgad;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sput-object v0, Ll/zoy0;->e:Lcom/google/android/gms/internal/ads/zzgad;

    .line 108
    .line 109
    return-void
.end method

.method public constructor <init>([II)V
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    invoke-static {p1, p2}, Ljava/util/Arrays;->copyOf([II)[I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/zoy0;->a:[I

    .line 10
    .line 11
    invoke-static {p1}, Ljava/util/Arrays;->sort([I)V

    .line 12
    .line 13
    .line 14
    const/16 p1, 0xa

    .line 15
    .line 16
    iput p1, p0, Ll/zoy0;->b:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ll/sqr0;Ll/w3y0;)Landroid/util/Pair;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/sqr0;->i:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/a8t0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    sget-object v1, Ll/zoy0;->e:Lcom/google/android/gms/internal/ads/zzgad;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/ads/zzgad;->containsKey(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    goto/16 :goto_6

    .line 25
    .line 26
    :cond_0
    const/4 v2, 0x7

    .line 27
    const/16 v3, 0x8

    .line 28
    .line 29
    const/4 v4, 0x6

    .line 30
    const/16 v5, 0x12

    .line 31
    .line 32
    if-ne v0, v5, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0, v5}, Ll/zoy0;->b(I)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    move v0, v4

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    move v0, v5

    .line 43
    :cond_2
    if-ne v0, v3, :cond_4

    .line 44
    .line 45
    invoke-virtual {p0, v3}, Ll/zoy0;->b(I)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    move v0, v3

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    :goto_0
    move v0, v2

    .line 54
    goto :goto_2

    .line 55
    :cond_4
    :goto_1
    const/16 v6, 0x1e

    .line 56
    .line 57
    if-ne v0, v6, :cond_5

    .line 58
    .line 59
    invoke-virtual {p0, v6}, Ll/zoy0;->b(I)Z

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-nez v6, :cond_5

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_5
    :goto_2
    invoke-virtual {p0, v0}, Ll/zoy0;->b(I)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_10

    .line 71
    .line 72
    iget p0, p1, Ll/sqr0;->y:I

    .line 73
    .line 74
    const/4 v6, -0x1

    .line 75
    if-eq p0, v6, :cond_8

    .line 76
    .line 77
    if-ne v0, v5, :cond_6

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_6
    iget-object p1, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 81
    .line 82
    const-string p2, "audio/vnd.dts.uhd;profile=p2"

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    const/16 p2, 0xa

    .line 89
    .line 90
    if-eqz p1, :cond_7

    .line 91
    .line 92
    if-le p0, p2, :cond_b

    .line 93
    .line 94
    goto/16 :goto_6

    .line 95
    .line 96
    :cond_7
    if-le p0, p2, :cond_b

    .line 97
    .line 98
    goto :goto_6

    .line 99
    :cond_8
    :goto_3
    iget p0, p1, Ll/sqr0;->z:I

    .line 100
    .line 101
    if-ne p0, v6, :cond_9

    .line 102
    .line 103
    const p0, 0xbb80

    .line 104
    .line 105
    .line 106
    :cond_9
    sget p1, Ll/mpw0;->a:I

    .line 107
    .line 108
    const/16 v5, 0x1d

    .line 109
    .line 110
    if-lt p1, v5, :cond_a

    .line 111
    .line 112
    invoke-static {v0, p0, p2}, Ll/xoy0;->a(IILl/w3y0;)I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    goto :goto_4

    .line 117
    :cond_a
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const/4 p1, 0x0

    .line 122
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {v1, p0, p1}, Lcom/google/android/gms/internal/ads/zzgad;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Ljava/lang/Integer;

    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    :cond_b
    :goto_4
    sget p1, Ll/mpw0;->a:I

    .line 140
    .line 141
    const/16 p2, 0x1c

    .line 142
    .line 143
    if-gt p1, p2, :cond_e

    .line 144
    .line 145
    if-ne p0, v2, :cond_c

    .line 146
    .line 147
    goto :goto_5

    .line 148
    :cond_c
    const/4 p2, 0x3

    .line 149
    if-eq p0, p2, :cond_d

    .line 150
    .line 151
    const/4 p2, 0x4

    .line 152
    if-eq p0, p2, :cond_d

    .line 153
    .line 154
    const/4 p2, 0x5

    .line 155
    if-ne p0, p2, :cond_e

    .line 156
    .line 157
    :cond_d
    move v3, v4

    .line 158
    goto :goto_5

    .line 159
    :cond_e
    move v3, p0

    .line 160
    :goto_5
    const/16 p0, 0x1a

    .line 161
    .line 162
    if-gt p1, p0, :cond_f

    .line 163
    .line 164
    const-string p0, "fugu"

    .line 165
    .line 166
    sget-object p1, Ll/mpw0;->b:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-eqz p0, :cond_f

    .line 173
    .line 174
    const/4 p0, 0x1

    .line 175
    if-ne v3, p0, :cond_f

    .line 176
    .line 177
    const/4 v3, 0x2

    .line 178
    :cond_f
    invoke-static {v3}, Ll/mpw0;->v(I)I

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    if-eqz p0, :cond_10

    .line 183
    .line 184
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    invoke-static {p1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :cond_10
    :goto_6
    const/4 p0, 0x0

    .line 198
    return-object p0
.end method

.method public final b(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zoy0;->a:[I

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/util/Arrays;->binarySearch([II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ltz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/zoy0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/zoy0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/zoy0;->a:[I

    .line 14
    .line 15
    iget-object p1, p1, Ll/zoy0;->a:[I

    .line 16
    .line 17
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    return v0

    .line 24
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zoy0;->a:[I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/lit8 p0, p0, 0x1f

    .line 8
    .line 9
    add-int/lit8 p0, p0, 0xa

    .line 10
    .line 11
    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zoy0;->a:[I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "AudioCapabilities[maxChannelCount=10, supportedEncodings="

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "]"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
