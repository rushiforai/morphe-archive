.class abstract Lcom/google/android/libraries/places/internal/zzmx;
.super Lcom/google/android/libraries/places/internal/zzlt;
.source "SourceFile"


# instance fields
.field final zzb:Ljava/lang/CharSequence;

.field final zzc:Lcom/google/android/libraries/places/internal/zzma;

.field zzd:I

.field zze:I


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzmy;Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzlt;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 6
    .line 7
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzmy;->zza(Lcom/google/android/libraries/places/internal/zzmy;)Lcom/google/android/libraries/places/internal/zzma;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzc:Lcom/google/android/libraries/places/internal/zzma;

    .line 12
    .line 13
    const p1, 0x7fffffff

    .line 14
    .line 15
    .line 16
    iput p1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zze:I

    .line 17
    .line 18
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 6

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 2
    .line 3
    :cond_0
    :goto_0
    iget v1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eq v1, v2, :cond_7

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzmx;->zzd(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ne v1, v2, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 21
    .line 22
    move v3, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzmx;->zzc(I)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 29
    .line 30
    :goto_1
    if-ne v3, v0, :cond_2

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 35
    .line 36
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-le v3, v1, :cond_0

    .line 43
    .line 44
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    :goto_2
    if-ge v0, v1, :cond_3

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzc:Lcom/google/android/libraries/places/internal/zzma;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 52
    .line 53
    invoke-interface {v4, v0}, Ljava/lang/CharSequence;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzma;->zza(C)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_3

    .line 62
    .line 63
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    :goto_3
    if-le v1, v0, :cond_4

    .line 67
    .line 68
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzc:Lcom/google/android/libraries/places/internal/zzma;

    .line 69
    .line 70
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 71
    .line 72
    add-int/lit8 v5, v1, -0x1

    .line 73
    .line 74
    invoke-interface {v4, v5}, Ljava/lang/CharSequence;->charAt(I)C

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzma;->zza(C)Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_4

    .line 83
    .line 84
    move v1, v5

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    iget v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zze:I

    .line 87
    .line 88
    const/4 v4, 0x1

    .line 89
    if-ne v3, v4, :cond_5

    .line 90
    .line 91
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 92
    .line 93
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    iput v2, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzd:I

    .line 98
    .line 99
    :goto_4
    if-le v1, v0, :cond_6

    .line 100
    .line 101
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzc:Lcom/google/android/libraries/places/internal/zzma;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 104
    .line 105
    add-int/lit8 v4, v1, -0x1

    .line 106
    .line 107
    invoke-interface {v3, v4}, Ljava/lang/CharSequence;->charAt(I)C

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzma;->zza(C)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_6

    .line 116
    .line 117
    move v1, v4

    .line 118
    goto :goto_4

    .line 119
    :cond_5
    add-int/2addr v3, v2

    .line 120
    iput v3, p0, Lcom/google/android/libraries/places/internal/zzmx;->zze:I

    .line 121
    .line 122
    :cond_6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzmx;->zzb:Ljava/lang/CharSequence;

    .line 123
    .line 124
    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzlt;->zzb()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    const/4 p0, 0x0

    .line 137
    return-object p0
.end method

.method public abstract zzc(I)I
.end method

.method public abstract zzd(I)I
.end method
