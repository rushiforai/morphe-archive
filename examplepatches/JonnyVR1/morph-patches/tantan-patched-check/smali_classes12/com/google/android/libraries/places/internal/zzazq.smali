.class public final Lcom/google/android/libraries/places/internal/zzazq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final zza:Lcom/google/android/libraries/places/internal/zzmh;

.field private static final zzb:Lcom/google/android/libraries/places/internal/zzazq;


# instance fields
.field private final zzc:Ljava/util/Map;

.field private final zzd:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x2c

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzmh;->zzb(C)Lcom/google/android/libraries/places/internal/zzmh;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/google/android/libraries/places/internal/zzazq;->zza:Lcom/google/android/libraries/places/internal/zzmh;

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/libraries/places/internal/zzazq;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzazq;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lcom/google/android/libraries/places/internal/zzayz;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/google/android/libraries/places/internal/zzayz;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v2, Lcom/google/android/libraries/places/internal/zzazq;

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-direct {v2, v1, v3, v0}, Lcom/google/android/libraries/places/internal/zzazq;-><init>(Lcom/google/android/libraries/places/internal/zzazo;ZLcom/google/android/libraries/places/internal/zzazq;)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/google/android/libraries/places/internal/zzaza;->zza:Lcom/google/android/libraries/places/internal/zzazb;

    .line 26
    .line 27
    new-instance v1, Lcom/google/android/libraries/places/internal/zzazq;

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-direct {v1, v0, v3, v2}, Lcom/google/android/libraries/places/internal/zzazq;-><init>(Lcom/google/android/libraries/places/internal/zzazo;ZLcom/google/android/libraries/places/internal/zzazq;)V

    .line 31
    .line 32
    .line 33
    sput-object v1, Lcom/google/android/libraries/places/internal/zzazq;->zzb:Lcom/google/android/libraries/places/internal/zzazq;

    .line 34
    .line 35
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    new-array v0, v1, [B

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzd:[B

    return-void
.end method

.method private constructor <init>(Lcom/google/android/libraries/places/internal/zzazo;ZLcom/google/android/libraries/places/internal/zzazq;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzazo;->zzb()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, ","

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    xor-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    const-string v2, "Comma is currently not allowed in message encoding"

    .line 17
    .line 18
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p3, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p3, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    .line 28
    .line 29
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzazo;->zzb()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    :cond_0
    new-instance v2, Ljava/util/LinkedHashMap;

    .line 42
    .line 43
    invoke-direct {v2, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 44
    .line 45
    .line 46
    iget-object p3, p3, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    .line 47
    .line 48
    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    :cond_1
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/google/android/libraries/places/internal/zzazp;

    .line 67
    .line 68
    iget-object v3, v1, Lcom/google/android/libraries/places/internal/zzazp;->zza:Lcom/google/android/libraries/places/internal/zzazo;

    .line 69
    .line 70
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzazo;->zzb()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-nez v4, :cond_1

    .line 79
    .line 80
    new-instance v4, Lcom/google/android/libraries/places/internal/zzazp;

    .line 81
    .line 82
    iget-object v5, v1, Lcom/google/android/libraries/places/internal/zzazp;->zza:Lcom/google/android/libraries/places/internal/zzazo;

    .line 83
    .line 84
    iget-boolean v1, v1, Lcom/google/android/libraries/places/internal/zzazp;->zzb:Z

    .line 85
    .line 86
    invoke-direct {v4, v5, v1}, Lcom/google/android/libraries/places/internal/zzazp;-><init>(Lcom/google/android/libraries/places/internal/zzazo;Z)V

    .line 87
    .line 88
    .line 89
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    new-instance p3, Lcom/google/android/libraries/places/internal/zzazp;

    .line 94
    .line 95
    invoke-direct {p3, p1, p2}, Lcom/google/android/libraries/places/internal/zzazp;-><init>(Lcom/google/android/libraries/places/internal/zzazo;Z)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v2, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    .line 106
    .line 107
    sget-object p2, Lcom/google/android/libraries/places/internal/zzazq;->zza:Lcom/google/android/libraries/places/internal/zzmh;

    .line 108
    .line 109
    new-instance p3, Ljava/util/HashSet;

    .line 110
    .line 111
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-direct {p3, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 116
    .line 117
    .line 118
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Ljava/util/Map$Entry;

    .line 137
    .line 138
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Lcom/google/android/libraries/places/internal/zzazp;

    .line 143
    .line 144
    iget-boolean v1, v1, Lcom/google/android/libraries/places/internal/zzazp;->zzb:Z

    .line 145
    .line 146
    if-eqz v1, :cond_3

    .line 147
    .line 148
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    check-cast v0, Ljava/lang/String;

    .line 153
    .line 154
    invoke-interface {p3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    invoke-virtual {p2, p1}, Lcom/google/android/libraries/places/internal/zzmh;->zzf(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const-string p2, "US-ASCII"

    .line 167
    .line 168
    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzd:[B

    .line 177
    .line 178
    return-void
.end method

.method public static zzb()Lcom/google/android/libraries/places/internal/zzazq;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzazq;->zzb:Lcom/google/android/libraries/places/internal/zzazq;

    return-object v0
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzazo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzc:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/android/libraries/places/internal/zzazp;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzazp;->zza:Lcom/google/android/libraries/places/internal/zzazo;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final zzc()[B
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzazq;->zzd:[B

    return-object p0
.end method
