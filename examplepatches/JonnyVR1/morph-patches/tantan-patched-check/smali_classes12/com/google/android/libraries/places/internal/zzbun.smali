.class final Lcom/google/android/libraries/places/internal/zzbun;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzbci;


# static fields
.field private static final zza:Ljava/lang/ThreadLocal;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzavn;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzavf;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbun;->zza:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzavf;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p2, "defaultInstance cannot be null"

    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzc:Lcom/google/android/libraries/places/internal/zzavf;

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzavf;->zzaz()Lcom/google/android/libraries/places/internal/zzavn;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)Ljava/io/InputStream;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbum;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Lcom/google/android/libraries/places/internal/zzbum;-><init>(Lcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavn;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final bridge synthetic zzb(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 7

    .line 1
    instance-of v0, p1, Lcom/google/android/libraries/places/internal/zzbum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/google/android/libraries/places/internal/zzbum;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbum;->zzc()Lcom/google/android/libraries/places/internal/zzavn;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    .line 13
    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbum;->zzb()Lcom/google/android/libraries/places/internal/zzavf;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 22
    :try_start_1
    instance-of v1, p1, Lcom/google/android/libraries/places/internal/zzbav;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_7

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-lez v1, :cond_6

    .line 32
    .line 33
    const/high16 v3, 0x400000

    .line 34
    .line 35
    if-gt v1, v3, :cond_6

    .line 36
    .line 37
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbun;->zza:Ljava/lang/ThreadLocal;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Ljava/lang/ref/Reference;

    .line 44
    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, [B

    .line 52
    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    array-length v5, v4

    .line 56
    if-ge v5, v1, :cond_2

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catch_1
    move-exception p0

    .line 60
    goto/16 :goto_5

    .line 61
    .line 62
    :cond_1
    :goto_0
    new-array v4, v1, [B

    .line 63
    .line 64
    new-instance v5, Ljava/lang/ref/WeakReference;

    .line 65
    .line 66
    invoke-direct {v5, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    move v3, v1

    .line 73
    :goto_1
    if-lez v3, :cond_4

    .line 74
    .line 75
    sub-int v5, v1, v3

    .line 76
    .line 77
    invoke-virtual {p1, v4, v5, v3}, Ljava/io/InputStream;->read([BII)I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    const/4 v6, -0x1

    .line 82
    if-ne v5, v6, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    sub-int/2addr v3, v5

    .line 86
    goto :goto_1

    .line 87
    :cond_4
    :goto_2
    if-nez v3, :cond_5

    .line 88
    .line 89
    invoke-static {v4, v2, v1}, Lcom/google/android/libraries/places/internal/zzasq;->zzJ([BII)Lcom/google/android/libraries/places/internal/zzasq;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    goto :goto_3

    .line 94
    :cond_5
    sub-int p0, v1, v3

    .line 95
    .line 96
    new-instance p1, Ljava/lang/RuntimeException;

    .line 97
    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v3, "size inaccurate: "

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, " != "

    .line 112
    .line 113
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p1

    .line 127
    :cond_6
    if-nez v1, :cond_7

    .line 128
    .line 129
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzc:Lcom/google/android/libraries/places/internal/zzavf;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_7
    move-object v1, v0

    .line 133
    :goto_3
    if-nez v1, :cond_8

    .line 134
    .line 135
    const/16 v1, 0x1000

    .line 136
    .line 137
    invoke-static {p1, v1}, Lcom/google/android/libraries/places/internal/zzasq;->zzI(Ljava/io/InputStream;I)Lcom/google/android/libraries/places/internal/zzasq;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    :cond_8
    const p1, 0x7fffffff

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, p1}, Lcom/google/android/libraries/places/internal/zzasq;->zzG(I)I

    .line 145
    .line 146
    .line 147
    :try_start_2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbun;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    .line 148
    .line 149
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbuo;->zza:Lcom/google/android/libraries/places/internal/zzatf;

    .line 150
    .line 151
    invoke-interface {p0, v1, p1}, Lcom/google/android/libraries/places/internal/zzavn;->zza(Lcom/google/android/libraries/places/internal/zzasq;Lcom/google/android/libraries/places/internal/zzatf;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0
    :try_end_2
    .catch Lcom/google/android/libraries/places/internal/zzauf; {:try_start_2 .. :try_end_2} :catch_3

    .line 155
    :try_start_3
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/internal/zzasq;->zzz(I)V
    :try_end_3
    .catch Lcom/google/android/libraries/places/internal/zzauf; {:try_start_3 .. :try_end_3} :catch_2

    .line 156
    .line 157
    .line 158
    :goto_4
    return-object p0

    .line 159
    :catch_2
    move-exception p1

    .line 160
    :try_start_4
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzauf;->zzh(Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzauf;

    .line 161
    .line 162
    .line 163
    throw p1
    :try_end_4
    .catch Lcom/google/android/libraries/places/internal/zzauf; {:try_start_4 .. :try_end_4} :catch_3

    .line 164
    :catch_3
    move-exception p0

    .line 165
    sget-object p1, Lcom/google/android/libraries/places/internal/zzbdo;->zzo:Lcom/google/android/libraries/places/internal/zzbdo;

    .line 166
    .line 167
    const-string v1, "Invalid protobuf byte sequence"

    .line 168
    .line 169
    invoke-virtual {p1, v1}, Lcom/google/android/libraries/places/internal/zzbdo;->zzg(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzbdo;->zzf(Ljava/lang/Throwable;)Lcom/google/android/libraries/places/internal/zzbdo;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    new-instance p1, Lcom/google/android/libraries/places/internal/zzbdq;

    .line 178
    .line 179
    invoke-direct {p1, p0, v0}, Lcom/google/android/libraries/places/internal/zzbdq;-><init>(Lcom/google/android/libraries/places/internal/zzbdo;Lcom/google/android/libraries/places/internal/zzbcf;)V

    .line 180
    .line 181
    .line 182
    throw p1

    .line 183
    :goto_5
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 184
    .line 185
    .line 186
    return-object v0
.end method
