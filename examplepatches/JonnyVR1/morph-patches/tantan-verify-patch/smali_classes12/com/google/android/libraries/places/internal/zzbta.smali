.class final Lcom/google/android/libraries/places/internal/zzbta;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:I

.field private zzc:I

.field private zzd:I

.field private zze:I

.field private zzf:I

.field private zzg:[C


# direct methods
.method public constructor <init>(Ljavax/security/auth/x500/X500Principal;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "RFC2253"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljavax/security/auth/x500/X500Principal;->getName(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 17
    .line 18
    return-void
.end method

.method private final zzb()C
    .locals 10

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 6
    .line 7
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eq v0, v2, :cond_8

    .line 11
    .line 12
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 13
    .line 14
    aget-char v2, v2, v0

    .line 15
    .line 16
    const/16 v4, 0x20

    .line 17
    .line 18
    if-eq v2, v4, :cond_7

    .line 19
    .line 20
    const/16 v4, 0x25

    .line 21
    .line 22
    if-eq v2, v4, :cond_7

    .line 23
    .line 24
    const/16 v4, 0x5c

    .line 25
    .line 26
    if-eq v2, v4, :cond_7

    .line 27
    .line 28
    const/16 v5, 0x5f

    .line 29
    .line 30
    if-eq v2, v5, :cond_7

    .line 31
    .line 32
    const/16 v5, 0x22

    .line 33
    .line 34
    if-eq v2, v5, :cond_7

    .line 35
    .line 36
    const/16 v5, 0x23

    .line 37
    .line 38
    if-eq v2, v5, :cond_7

    .line 39
    .line 40
    packed-switch v2, :pswitch_data_0

    .line 41
    .line 42
    .line 43
    packed-switch v2, :pswitch_data_1

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/google/android/libraries/places/internal/zzbta;->zzc(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 51
    .line 52
    add-int/2addr v2, v1

    .line 53
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 54
    .line 55
    const/16 v2, 0x80

    .line 56
    .line 57
    if-ge v0, v2, :cond_0

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_0
    const/16 v5, 0xc0

    .line 61
    .line 62
    const/16 v6, 0x3f

    .line 63
    .line 64
    if-lt v0, v5, :cond_3

    .line 65
    .line 66
    const/16 v5, 0xf7

    .line 67
    .line 68
    if-gt v0, v5, :cond_3

    .line 69
    .line 70
    const/16 v5, 0xdf

    .line 71
    .line 72
    if-gt v0, v5, :cond_1

    .line 73
    .line 74
    and-int/lit8 v0, v0, 0x1f

    .line 75
    .line 76
    move v5, v1

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const/16 v5, 0xef

    .line 79
    .line 80
    if-gt v0, v5, :cond_2

    .line 81
    .line 82
    and-int/lit8 v0, v0, 0xf

    .line 83
    .line 84
    const/4 v5, 0x2

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    and-int/lit8 v0, v0, 0x7

    .line 87
    .line 88
    const/4 v5, 0x3

    .line 89
    :goto_0
    if-ge v3, v5, :cond_6

    .line 90
    .line 91
    iget v7, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 92
    .line 93
    add-int/lit8 v8, v7, 0x1

    .line 94
    .line 95
    iput v8, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 96
    .line 97
    iget v9, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 98
    .line 99
    if-eq v8, v9, :cond_3

    .line 100
    .line 101
    iget-object v9, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 102
    .line 103
    aget-char v8, v9, v8

    .line 104
    .line 105
    if-eq v8, v4, :cond_4

    .line 106
    .line 107
    :cond_3
    :goto_1
    move v0, v6

    .line 108
    goto :goto_2

    .line 109
    :cond_4
    add-int/lit8 v7, v7, 0x2

    .line 110
    .line 111
    iput v7, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 112
    .line 113
    invoke-direct {p0, v7}, Lcom/google/android/libraries/places/internal/zzbta;->zzc(I)I

    .line 114
    .line 115
    .line 116
    move-result v7

    .line 117
    iget v8, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 118
    .line 119
    add-int/2addr v8, v1

    .line 120
    iput v8, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 121
    .line 122
    and-int/lit16 v8, v7, 0xc0

    .line 123
    .line 124
    if-eq v8, v2, :cond_5

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    shl-int/lit8 v0, v0, 0x6

    .line 128
    .line 129
    and-int/lit8 v7, v7, 0x3f

    .line 130
    .line 131
    add-int/2addr v0, v7

    .line 132
    add-int/lit8 v3, v3, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_6
    int-to-char v0, v0

    .line 136
    :goto_2
    int-to-char p0, v0

    .line 137
    return p0

    .line 138
    :cond_7
    :pswitch_0
    return v2

    .line 139
    :cond_8
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 140
    .line 141
    const-string v0, "Unexpected end of DN: "

    .line 142
    .line 143
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return v3

    .line 155
    :pswitch_data_0
    .packed-switch 0x2a
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :pswitch_data_1
    .packed-switch 0x3b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final zzc(I)I
    .locals 10

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "Malformed DN: "

    .line 7
    .line 8
    if-ge v0, v1, :cond_6

    .line 9
    .line 10
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 11
    .line 12
    aget-char p1, v1, p1

    .line 13
    .line 14
    const/16 v4, 0x46

    .line 15
    .line 16
    const/16 v5, 0x41

    .line 17
    .line 18
    const/16 v6, 0x66

    .line 19
    .line 20
    const/16 v7, 0x61

    .line 21
    .line 22
    const/16 v8, 0x39

    .line 23
    .line 24
    const/16 v9, 0x30

    .line 25
    .line 26
    if-lt p1, v9, :cond_0

    .line 27
    .line 28
    if-gt p1, v8, :cond_0

    .line 29
    .line 30
    add-int/lit8 p1, p1, -0x30

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    if-lt p1, v7, :cond_1

    .line 34
    .line 35
    if-gt p1, v6, :cond_1

    .line 36
    .line 37
    add-int/lit8 p1, p1, -0x57

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-lt p1, v5, :cond_5

    .line 41
    .line 42
    if-gt p1, v4, :cond_5

    .line 43
    .line 44
    add-int/lit8 p1, p1, -0x37

    .line 45
    .line 46
    :goto_0
    aget-char v0, v1, v0

    .line 47
    .line 48
    if-lt v0, v9, :cond_2

    .line 49
    .line 50
    if-gt v0, v8, :cond_2

    .line 51
    .line 52
    add-int/lit8 v0, v0, -0x30

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    if-lt v0, v7, :cond_3

    .line 56
    .line 57
    if-gt v0, v6, :cond_3

    .line 58
    .line 59
    add-int/lit8 v0, v0, -0x57

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    if-lt v0, v5, :cond_4

    .line 63
    .line 64
    if-gt v0, v4, :cond_4

    .line 65
    .line 66
    add-int/lit8 v0, v0, -0x37

    .line 67
    .line 68
    :goto_1
    shl-int/lit8 p0, p1, 0x4

    .line 69
    .line 70
    add-int/2addr p0, v0

    .line 71
    return p0

    .line 72
    :cond_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return v2

    .line 86
    :cond_5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return v2

    .line 100
    :cond_6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return v2
.end method

.method private final zzd()Ljava/lang/String;
    .locals 7

    .line 1
    :goto_0
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 4
    .line 5
    const/16 v2, 0x20

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 10
    .line 11
    aget-char v3, v3, v0

    .line 12
    .line 13
    if-ne v3, v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, v0, 0x1

    .line 16
    .line 17
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v3, 0x0

    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    return-object v3

    .line 24
    :cond_1
    add-int/lit8 v1, v0, 0x1

    .line 25
    .line 26
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 27
    .line 28
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 29
    .line 30
    :goto_1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 31
    .line 32
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 33
    .line 34
    const/16 v4, 0x3d

    .line 35
    .line 36
    if-ge v0, v1, :cond_2

    .line 37
    .line 38
    iget-object v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 39
    .line 40
    aget-char v5, v5, v0

    .line 41
    .line 42
    if-eq v5, v4, :cond_2

    .line 43
    .line 44
    if-eq v5, v2, :cond_2

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const-string v5, "Unexpected end of DN: "

    .line 52
    .line 53
    if-ge v0, v1, :cond_b

    .line 54
    .line 55
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 56
    .line 57
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 58
    .line 59
    aget-char v1, v1, v0

    .line 60
    .line 61
    if-ne v1, v2, :cond_5

    .line 62
    .line 63
    :goto_2
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 64
    .line 65
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 66
    .line 67
    if-ge v0, v1, :cond_3

    .line 68
    .line 69
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 70
    .line 71
    aget-char v6, v6, v0

    .line 72
    .line 73
    if-eq v6, v4, :cond_3

    .line 74
    .line 75
    if-ne v6, v2, :cond_3

    .line 76
    .line 77
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    iget-object v6, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 83
    .line 84
    aget-char v6, v6, v0

    .line 85
    .line 86
    if-ne v6, v4, :cond_4

    .line 87
    .line 88
    if-eq v0, v1, :cond_4

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object v3

    .line 105
    :cond_5
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 106
    .line 107
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 108
    .line 109
    :goto_4
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 110
    .line 111
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 112
    .line 113
    if-ge v0, v1, :cond_6

    .line 114
    .line 115
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 116
    .line 117
    aget-char v1, v1, v0

    .line 118
    .line 119
    if-ne v1, v2, :cond_6

    .line 120
    .line 121
    add-int/lit8 v0, v0, 0x1

    .line 122
    .line 123
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_6
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 127
    .line 128
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 129
    .line 130
    sub-int v2, v0, v1

    .line 131
    .line 132
    const/4 v3, 0x4

    .line 133
    if-le v2, v3, :cond_a

    .line 134
    .line 135
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 136
    .line 137
    add-int/lit8 v3, v1, 0x3

    .line 138
    .line 139
    aget-char v3, v2, v3

    .line 140
    .line 141
    const/16 v4, 0x2e

    .line 142
    .line 143
    if-ne v3, v4, :cond_a

    .line 144
    .line 145
    aget-char v3, v2, v1

    .line 146
    .line 147
    const/16 v4, 0x4f

    .line 148
    .line 149
    if-eq v3, v4, :cond_7

    .line 150
    .line 151
    const/16 v4, 0x6f

    .line 152
    .line 153
    if-ne v3, v4, :cond_a

    .line 154
    .line 155
    :cond_7
    add-int/lit8 v3, v1, 0x1

    .line 156
    .line 157
    aget-char v3, v2, v3

    .line 158
    .line 159
    const/16 v4, 0x49

    .line 160
    .line 161
    if-eq v3, v4, :cond_8

    .line 162
    .line 163
    const/16 v4, 0x69

    .line 164
    .line 165
    if-ne v3, v4, :cond_a

    .line 166
    .line 167
    :cond_8
    add-int/lit8 v3, v1, 0x2

    .line 168
    .line 169
    aget-char v2, v2, v3

    .line 170
    .line 171
    const/16 v3, 0x44

    .line 172
    .line 173
    if-eq v2, v3, :cond_9

    .line 174
    .line 175
    const/16 v3, 0x64

    .line 176
    .line 177
    if-ne v2, v3, :cond_a

    .line 178
    .line 179
    :cond_9
    add-int/lit8 v1, v1, 0x4

    .line 180
    .line 181
    iput v1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 182
    .line 183
    :cond_a
    new-instance v2, Ljava/lang/String;

    .line 184
    .line 185
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 186
    .line 187
    sub-int/2addr v0, v1

    .line 188
    invoke-direct {v2, p0, v1, v0}, Ljava/lang/String;-><init>([CII)V

    .line 189
    .line 190
    .line 191
    return-object v2

    .line 192
    :cond_b
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {v5, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    return-object v3
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 12

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 5
    .line 6
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 7
    .line 8
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzf:I

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbta;->zzd()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz v0, :cond_1d

    .line 24
    .line 25
    :goto_0
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 26
    .line 27
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_0
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 33
    .line 34
    aget-char v4, v4, v2

    .line 35
    .line 36
    const/16 v5, 0x5c

    .line 37
    .line 38
    const/16 v6, 0x22

    .line 39
    .line 40
    const-string v7, "Unexpected end of DN: "

    .line 41
    .line 42
    const/16 v8, 0x3b

    .line 43
    .line 44
    const/16 v9, 0x2c

    .line 45
    .line 46
    const/16 v10, 0x2b

    .line 47
    .line 48
    const/16 v11, 0x20

    .line 49
    .line 50
    if-eq v4, v6, :cond_12

    .line 51
    .line 52
    const/16 v6, 0x23

    .line 53
    .line 54
    if-eq v4, v6, :cond_9

    .line 55
    .line 56
    if-eq v4, v10, :cond_8

    .line 57
    .line 58
    if-eq v4, v9, :cond_8

    .line 59
    .line 60
    if-eq v4, v8, :cond_8

    .line 61
    .line 62
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 63
    .line 64
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 65
    .line 66
    :cond_1
    :goto_1
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 67
    .line 68
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 69
    .line 70
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 71
    .line 72
    if-lt v2, v3, :cond_2

    .line 73
    .line 74
    new-instance v2, Ljava/lang/String;

    .line 75
    .line 76
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 77
    .line 78
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 79
    .line 80
    sub-int/2addr v5, v3

    .line 81
    invoke-direct {v2, v4, v3, v5}, Ljava/lang/String;-><init>([CII)V

    .line 82
    .line 83
    .line 84
    goto/16 :goto_9

    .line 85
    .line 86
    :cond_2
    aget-char v3, v4, v2

    .line 87
    .line 88
    if-eq v3, v11, :cond_5

    .line 89
    .line 90
    if-eq v3, v8, :cond_4

    .line 91
    .line 92
    if-eq v3, v5, :cond_3

    .line 93
    .line 94
    if-eq v3, v10, :cond_4

    .line 95
    .line 96
    if-eq v3, v9, :cond_4

    .line 97
    .line 98
    add-int/lit8 v2, v2, 0x1

    .line 99
    .line 100
    iget v6, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 101
    .line 102
    add-int/lit8 v7, v6, 0x1

    .line 103
    .line 104
    iput v7, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 105
    .line 106
    aput-char v3, v4, v6

    .line 107
    .line 108
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 112
    .line 113
    add-int/lit8 v3, v2, 0x1

    .line 114
    .line 115
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 116
    .line 117
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbta;->zzb()C

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    aput-char v3, v4, v2

    .line 122
    .line 123
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 124
    .line 125
    add-int/lit8 v2, v2, 0x1

    .line 126
    .line 127
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_4
    new-instance v2, Ljava/lang/String;

    .line 131
    .line 132
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 133
    .line 134
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 135
    .line 136
    sub-int/2addr v5, v3

    .line 137
    invoke-direct {v2, v4, v3, v5}, Ljava/lang/String;-><init>([CII)V

    .line 138
    .line 139
    .line 140
    goto/16 :goto_9

    .line 141
    .line 142
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 143
    .line 144
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 145
    .line 146
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzf:I

    .line 147
    .line 148
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 149
    .line 150
    add-int/lit8 v2, v3, 0x1

    .line 151
    .line 152
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 153
    .line 154
    aput-char v11, v4, v3

    .line 155
    .line 156
    :goto_2
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 157
    .line 158
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 159
    .line 160
    if-ge v2, v3, :cond_6

    .line 161
    .line 162
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 163
    .line 164
    aget-char v6, v4, v2

    .line 165
    .line 166
    if-ne v6, v11, :cond_6

    .line 167
    .line 168
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 169
    .line 170
    add-int/lit8 v6, v3, 0x1

    .line 171
    .line 172
    iput v6, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 173
    .line 174
    aput-char v11, v4, v3

    .line 175
    .line 176
    add-int/lit8 v2, v2, 0x1

    .line 177
    .line 178
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_6
    if-eq v2, v3, :cond_7

    .line 182
    .line 183
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 184
    .line 185
    aget-char v2, v3, v2

    .line 186
    .line 187
    if-eq v2, v9, :cond_7

    .line 188
    .line 189
    if-eq v2, v10, :cond_7

    .line 190
    .line 191
    if-ne v2, v8, :cond_1

    .line 192
    .line 193
    :cond_7
    new-instance v2, Ljava/lang/String;

    .line 194
    .line 195
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 196
    .line 197
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 198
    .line 199
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzf:I

    .line 200
    .line 201
    sub-int/2addr v5, v4

    .line 202
    invoke-direct {v2, v3, v4, v5}, Ljava/lang/String;-><init>([CII)V

    .line 203
    .line 204
    .line 205
    goto/16 :goto_9

    .line 206
    .line 207
    :cond_8
    const-string v2, ""

    .line 208
    .line 209
    goto/16 :goto_9

    .line 210
    .line 211
    :cond_9
    add-int/lit8 v4, v2, 0x4

    .line 212
    .line 213
    if-ge v4, v3, :cond_11

    .line 214
    .line 215
    add-int/lit8 v3, v2, 0x1

    .line 216
    .line 217
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 218
    .line 219
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 220
    .line 221
    :goto_3
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 222
    .line 223
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 224
    .line 225
    if-eq v2, v3, :cond_d

    .line 226
    .line 227
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 228
    .line 229
    aget-char v4, v3, v2

    .line 230
    .line 231
    if-eq v4, v10, :cond_d

    .line 232
    .line 233
    if-eq v4, v9, :cond_d

    .line 234
    .line 235
    if-ne v4, v8, :cond_a

    .line 236
    .line 237
    goto :goto_5

    .line 238
    :cond_a
    add-int/lit8 v5, v2, 0x1

    .line 239
    .line 240
    if-ne v4, v11, :cond_b

    .line 241
    .line 242
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 243
    .line 244
    iput v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 245
    .line 246
    :goto_4
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 247
    .line 248
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 249
    .line 250
    if-ge v2, v3, :cond_e

    .line 251
    .line 252
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 253
    .line 254
    aget-char v3, v3, v2

    .line 255
    .line 256
    if-ne v3, v11, :cond_e

    .line 257
    .line 258
    add-int/lit8 v2, v2, 0x1

    .line 259
    .line 260
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_b
    const/16 v6, 0x41

    .line 264
    .line 265
    if-lt v4, v6, :cond_c

    .line 266
    .line 267
    const/16 v6, 0x46

    .line 268
    .line 269
    if-gt v4, v6, :cond_c

    .line 270
    .line 271
    add-int/lit8 v4, v4, 0x20

    .line 272
    .line 273
    int-to-char v4, v4

    .line 274
    aput-char v4, v3, v2

    .line 275
    .line 276
    :cond_c
    iput v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_d
    :goto_5
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 280
    .line 281
    :cond_e
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 282
    .line 283
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 284
    .line 285
    sub-int/2addr v2, v3

    .line 286
    const/4 v4, 0x5

    .line 287
    if-lt v2, v4, :cond_10

    .line 288
    .line 289
    and-int/lit8 v4, v2, 0x1

    .line 290
    .line 291
    if-eqz v4, :cond_10

    .line 292
    .line 293
    shr-int/lit8 v4, v2, 0x1

    .line 294
    .line 295
    new-array v5, v4, [B

    .line 296
    .line 297
    add-int/lit8 v3, v3, 0x1

    .line 298
    .line 299
    move v6, p1

    .line 300
    :goto_6
    if-ge v6, v4, :cond_f

    .line 301
    .line 302
    invoke-direct {p0, v3}, Lcom/google/android/libraries/places/internal/zzbta;->zzc(I)I

    .line 303
    .line 304
    .line 305
    move-result v7

    .line 306
    int-to-byte v7, v7

    .line 307
    aput-byte v7, v5, v6

    .line 308
    .line 309
    add-int/lit8 v6, v6, 0x1

    .line 310
    .line 311
    add-int/lit8 v3, v3, 0x2

    .line 312
    .line 313
    goto :goto_6

    .line 314
    :cond_f
    new-instance v3, Ljava/lang/String;

    .line 315
    .line 316
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 317
    .line 318
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 319
    .line 320
    invoke-direct {v3, v4, v5, v2}, Ljava/lang/String;-><init>([CII)V

    .line 321
    .line 322
    .line 323
    move-object v2, v3

    .line 324
    goto :goto_9

    .line 325
    :cond_10
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 326
    .line 327
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-virtual {v7, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    return-object v1

    .line 339
    :cond_11
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 340
    .line 341
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p0

    .line 345
    invoke-virtual {v7, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    return-object v1

    .line 353
    :cond_12
    add-int/lit8 v2, v2, 0x1

    .line 354
    .line 355
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 356
    .line 357
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 358
    .line 359
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 360
    .line 361
    :goto_7
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 362
    .line 363
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 364
    .line 365
    if-eq v2, v3, :cond_1c

    .line 366
    .line 367
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 368
    .line 369
    aget-char v4, v3, v2

    .line 370
    .line 371
    if-ne v4, v6, :cond_1a

    .line 372
    .line 373
    add-int/lit8 v2, v2, 0x1

    .line 374
    .line 375
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 376
    .line 377
    :goto_8
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 378
    .line 379
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 380
    .line 381
    if-ge v2, v3, :cond_13

    .line 382
    .line 383
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 384
    .line 385
    aget-char v3, v3, v2

    .line 386
    .line 387
    if-ne v3, v11, :cond_13

    .line 388
    .line 389
    add-int/lit8 v2, v2, 0x1

    .line 390
    .line 391
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 392
    .line 393
    goto :goto_8

    .line 394
    :cond_13
    new-instance v2, Ljava/lang/String;

    .line 395
    .line 396
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 397
    .line 398
    iget v4, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzd:I

    .line 399
    .line 400
    iget v5, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 401
    .line 402
    sub-int/2addr v5, v4

    .line 403
    invoke-direct {v2, v3, v4, v5}, Ljava/lang/String;-><init>([CII)V

    .line 404
    .line 405
    .line 406
    :goto_9
    const-string v3, "cn"

    .line 407
    .line 408
    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 409
    .line 410
    .line 411
    move-result v0

    .line 412
    if-eqz v0, :cond_14

    .line 413
    .line 414
    return-object v2

    .line 415
    :cond_14
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 416
    .line 417
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzb:I

    .line 418
    .line 419
    if-lt v0, v2, :cond_15

    .line 420
    .line 421
    return-object v1

    .line 422
    :cond_15
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzg:[C

    .line 423
    .line 424
    aget-char v2, v2, v0

    .line 425
    .line 426
    const-string v3, "Malformed DN: "

    .line 427
    .line 428
    if-eq v2, v9, :cond_18

    .line 429
    .line 430
    if-ne v2, v8, :cond_16

    .line 431
    .line 432
    goto :goto_a

    .line 433
    :cond_16
    if-ne v2, v10, :cond_17

    .line 434
    .line 435
    goto :goto_a

    .line 436
    :cond_17
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 437
    .line 438
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object p0

    .line 442
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    return-object v1

    .line 450
    :cond_18
    :goto_a
    add-int/lit8 v0, v0, 0x1

    .line 451
    .line 452
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 453
    .line 454
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbta;->zzd()Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    if-eqz v0, :cond_19

    .line 459
    .line 460
    goto/16 :goto_0

    .line 461
    .line 462
    :cond_19
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 463
    .line 464
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    return-object v1

    .line 476
    :cond_1a
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 477
    .line 478
    if-ne v4, v5, :cond_1b

    .line 479
    .line 480
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbta;->zzb()C

    .line 481
    .line 482
    .line 483
    move-result v4

    .line 484
    aput-char v4, v3, v2

    .line 485
    .line 486
    goto :goto_b

    .line 487
    :cond_1b
    aput-char v4, v3, v2

    .line 488
    .line 489
    :goto_b
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 490
    .line 491
    add-int/lit8 v2, v2, 0x1

    .line 492
    .line 493
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zzc:I

    .line 494
    .line 495
    iget v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 496
    .line 497
    add-int/lit8 v2, v2, 0x1

    .line 498
    .line 499
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzbta;->zze:I

    .line 500
    .line 501
    goto/16 :goto_7

    .line 502
    .line 503
    :cond_1c
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbta;->zza:Ljava/lang/String;

    .line 504
    .line 505
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    invoke-virtual {v7, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    :cond_1d
    return-object v1
.end method
