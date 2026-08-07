.class public final enum Lcom/google/android/libraries/places/internal/zzbjb;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum zza:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzb:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzc:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzd:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zze:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzf:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzg:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzh:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzi:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzj:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzk:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzl:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzm:Lcom/google/android/libraries/places/internal/zzbjb;

.field public static final enum zzn:Lcom/google/android/libraries/places/internal/zzbjb;

.field private static final zzo:[Lcom/google/android/libraries/places/internal/zzbjb;

.field private static final synthetic zzp:[Lcom/google/android/libraries/places/internal/zzbjb;


# instance fields
.field private final zzq:I

.field private final zzr:Lcom/google/android/libraries/places/internal/zzbdo;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/libraries/places/internal/zzbdo;->zzp:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 4
    .line 5
    const-string v2, "NO_ERROR"

    .line 6
    .line 7
    const/4 v14, 0x0

    .line 8
    invoke-direct {v0, v2, v14, v14, v1}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbjb;->zza:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 12
    .line 13
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 14
    .line 15
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 16
    .line 17
    const-string v4, "PROTOCOL_ERROR"

    .line 18
    .line 19
    const/4 v15, 0x1

    .line 20
    invoke-direct {v2, v4, v15, v15, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 21
    .line 22
    .line 23
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbjb;->zzb:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 24
    .line 25
    move-object v4, v2

    .line 26
    new-instance v2, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 27
    .line 28
    const-string v5, "INTERNAL_ERROR"

    .line 29
    .line 30
    const/4 v6, 0x2

    .line 31
    invoke-direct {v2, v5, v6, v6, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 32
    .line 33
    .line 34
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbjb;->zzc:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 35
    .line 36
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 37
    .line 38
    const-string v6, "FLOW_CONTROL_ERROR"

    .line 39
    .line 40
    const/4 v7, 0x3

    .line 41
    invoke-direct {v5, v6, v7, v7, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 42
    .line 43
    .line 44
    sput-object v5, Lcom/google/android/libraries/places/internal/zzbjb;->zzd:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 45
    .line 46
    move-object v6, v4

    .line 47
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 48
    .line 49
    const-string v7, "SETTINGS_TIMEOUT"

    .line 50
    .line 51
    const/4 v8, 0x4

    .line 52
    invoke-direct {v4, v7, v8, v8, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 53
    .line 54
    .line 55
    sput-object v4, Lcom/google/android/libraries/places/internal/zzbjb;->zze:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 56
    .line 57
    move-object v7, v5

    .line 58
    new-instance v5, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 59
    .line 60
    const-string v8, "STREAM_CLOSED"

    .line 61
    .line 62
    const/4 v9, 0x5

    .line 63
    invoke-direct {v5, v8, v9, v9, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 64
    .line 65
    .line 66
    sput-object v5, Lcom/google/android/libraries/places/internal/zzbjb;->zzf:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 67
    .line 68
    move-object v8, v6

    .line 69
    new-instance v6, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 70
    .line 71
    const-string v9, "FRAME_SIZE_ERROR"

    .line 72
    .line 73
    const/4 v10, 0x6

    .line 74
    invoke-direct {v6, v9, v10, v10, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 75
    .line 76
    .line 77
    sput-object v6, Lcom/google/android/libraries/places/internal/zzbjb;->zzg:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 78
    .line 79
    move-object v9, v7

    .line 80
    new-instance v7, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 81
    .line 82
    const-string v10, "REFUSED_STREAM"

    .line 83
    .line 84
    const/4 v11, 0x7

    .line 85
    invoke-direct {v7, v10, v11, v11, v1}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 86
    .line 87
    .line 88
    sput-object v7, Lcom/google/android/libraries/places/internal/zzbjb;->zzh:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 89
    .line 90
    move-object v1, v8

    .line 91
    new-instance v8, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 92
    .line 93
    const/16 v10, 0x8

    .line 94
    .line 95
    sget-object v11, Lcom/google/android/libraries/places/internal/zzbdo;->zzb:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 96
    .line 97
    const-string v12, "CANCEL"

    .line 98
    .line 99
    invoke-direct {v8, v12, v10, v10, v11}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 100
    .line 101
    .line 102
    sput-object v8, Lcom/google/android/libraries/places/internal/zzbjb;->zzi:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 103
    .line 104
    move-object v10, v9

    .line 105
    new-instance v9, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 106
    .line 107
    const-string v11, "COMPRESSION_ERROR"

    .line 108
    .line 109
    const/16 v12, 0x9

    .line 110
    .line 111
    invoke-direct {v9, v11, v12, v12, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 112
    .line 113
    .line 114
    sput-object v9, Lcom/google/android/libraries/places/internal/zzbjb;->zzj:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 115
    .line 116
    move-object v11, v10

    .line 117
    new-instance v10, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 118
    .line 119
    const-string v12, "CONNECT_ERROR"

    .line 120
    .line 121
    const/16 v13, 0xa

    .line 122
    .line 123
    invoke-direct {v10, v12, v13, v13, v3}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 124
    .line 125
    .line 126
    sput-object v10, Lcom/google/android/libraries/places/internal/zzbjb;->zzk:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 127
    .line 128
    move-object v3, v11

    .line 129
    new-instance v11, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 130
    .line 131
    sget-object v12, Lcom/google/android/libraries/places/internal/zzbdo;->zzj:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 132
    .line 133
    const-string v13, "Bandwidth exhausted"

    .line 134
    .line 135
    invoke-virtual {v12, v13}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 136
    .line 137
    .line 138
    move-result-object v12

    .line 139
    const-string v13, "ENHANCE_YOUR_CALM"

    .line 140
    .line 141
    const/16 v14, 0xb

    .line 142
    .line 143
    invoke-direct {v11, v13, v14, v14, v12}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 144
    .line 145
    .line 146
    sput-object v11, Lcom/google/android/libraries/places/internal/zzbjb;->zzl:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 147
    .line 148
    new-instance v12, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 149
    .line 150
    sget-object v13, Lcom/google/android/libraries/places/internal/zzbdo;->zzh:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 151
    .line 152
    const-string v14, "Permission denied as protocol is not secure enough to call"

    .line 153
    .line 154
    invoke-virtual {v13, v14}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 155
    .line 156
    .line 157
    move-result-object v13

    .line 158
    const-string v14, "INADEQUATE_SECURITY"

    .line 159
    .line 160
    move/from16 v16, v15

    .line 161
    .line 162
    const/16 v15, 0xc

    .line 163
    .line 164
    invoke-direct {v12, v14, v15, v15, v13}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 165
    .line 166
    .line 167
    sput-object v12, Lcom/google/android/libraries/places/internal/zzbjb;->zzm:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 168
    .line 169
    new-instance v13, Lcom/google/android/libraries/places/internal/zzbjb;

    .line 170
    .line 171
    const/16 v14, 0xd

    .line 172
    .line 173
    sget-object v15, Lcom/google/android/libraries/places/internal/zzbdo;->zzc:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 174
    .line 175
    move-object/from16 v17, v0

    .line 176
    .line 177
    const-string v0, "HTTP_1_1_REQUIRED"

    .line 178
    .line 179
    invoke-direct {v13, v0, v14, v14, v15}, Lcom/google/android/libraries/places/internal/zzbjb;-><init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V

    .line 180
    .line 181
    .line 182
    sput-object v13, Lcom/google/android/libraries/places/internal/zzbjb;->zzn:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 183
    .line 184
    move-object/from16 v0, v17

    .line 185
    .line 186
    filled-new-array/range {v0 .. v13}, [Lcom/google/android/libraries/places/internal/zzbjb;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbjb;->zzp:[Lcom/google/android/libraries/places/internal/zzbjb;

    .line 191
    .line 192
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbjb;->values()[Lcom/google/android/libraries/places/internal/zzbjb;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    array-length v1, v0

    .line 197
    add-int/lit8 v2, v1, -0x1

    .line 198
    .line 199
    aget-object v2, v0, v2

    .line 200
    .line 201
    iget v2, v2, Lcom/google/android/libraries/places/internal/zzbjb;->zzq:I

    .line 202
    .line 203
    int-to-long v2, v2

    .line 204
    long-to-int v2, v2

    .line 205
    add-int/lit8 v2, v2, 0x1

    .line 206
    .line 207
    new-array v2, v2, [Lcom/google/android/libraries/places/internal/zzbjb;

    .line 208
    .line 209
    const/4 v14, 0x0

    .line 210
    :goto_0
    if-ge v14, v1, :cond_0

    .line 211
    .line 212
    aget-object v3, v0, v14

    .line 213
    .line 214
    iget v4, v3, Lcom/google/android/libraries/places/internal/zzbjb;->zzq:I

    .line 215
    .line 216
    int-to-long v4, v4

    .line 217
    long-to-int v4, v4

    .line 218
    aput-object v3, v2, v4

    .line 219
    .line 220
    add-int/lit8 v14, v14, 0x1

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_0
    sput-object v2, Lcom/google/android/libraries/places/internal/zzbjb;->zzo:[Lcom/google/android/libraries/places/internal/zzbjb;

    .line 224
    .line 225
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILcom/google/android/libraries/places/internal/zzbdo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/google/android/libraries/places/internal/zzbjb;->zzq:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string p2, "HTTP/2 error code: "

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p4}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p4}, Lcom/google/android/libraries/places/internal/zzbdo;->zzi()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance p3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, " ("

    .line 39
    .line 40
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p1, ")"

    .line 47
    .line 48
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    :cond_0
    invoke-virtual {p4, p1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbjb;->zzr:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 60
    .line 61
    return-void
.end method

.method public static values()[Lcom/google/android/libraries/places/internal/zzbjb;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjb;->zzp:[Lcom/google/android/libraries/places/internal/zzbjb;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/google/android/libraries/places/internal/zzbjb;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/google/android/libraries/places/internal/zzbjb;

    .line 8
    .line 9
    return-object v0
.end method

.method public static zza(J)Lcom/google/android/libraries/places/internal/zzbdo;
    .locals 5

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjb;->zzo:[Lcom/google/android/libraries/places/internal/zzbjb;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    int-to-long v1, v1

    .line 5
    cmp-long v1, p0, v1

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-gez v1, :cond_1

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    cmp-long v1, p0, v3

    .line 13
    .line 14
    if-gez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    long-to-int v1, p0

    .line 18
    aget-object v2, v0, v1

    .line 19
    .line 20
    :cond_1
    :goto_0
    if-nez v2, :cond_2

    .line 21
    .line 22
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbjb;->zzc:Lcom/google/android/libraries/places/internal/zzbjb;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbjb;->zzr:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zza()Lcom/google/android/libraries/places/internal/zzbdj;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbdj;->zza()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzd(I)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "Unrecognized HTTP/2 error code: "

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_2
    iget-object p0, v2, Lcom/google/android/libraries/places/internal/zzbjb;->zzr:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 58
    .line 59
    return-object p0
.end method
