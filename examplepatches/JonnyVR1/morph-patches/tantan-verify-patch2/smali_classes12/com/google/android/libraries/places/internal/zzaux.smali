.class final Lcom/google/android/libraries/places/internal/zzaux;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzavu;


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzavd;


# instance fields
.field private final zzb:Lcom/google/android/libraries/places/internal/zzavd;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/libraries/places/internal/zzauv;

    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zzauv;-><init>()V

    sput-object v0, Lcom/google/android/libraries/places/internal/zzaux;->zza:Lcom/google/android/libraries/places/internal/zzavd;

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzauw;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzatn;->zza()Lcom/google/android/libraries/places/internal/zzatn;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    :try_start_0
    const-string v2, "com.google.protobuf.DescriptorMessageInfoFactory"

    .line 8
    .line 9
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "getInstance"

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v4, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/google/android/libraries/places/internal/zzavd;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    sget-object v2, Lcom/google/android/libraries/places/internal/zzaux;->zza:Lcom/google/android/libraries/places/internal/zzavd;

    .line 28
    .line 29
    :goto_0
    const/4 v3, 0x2

    .line 30
    new-array v3, v3, [Lcom/google/android/libraries/places/internal/zzavd;

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    aput-object v1, v3, v4

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    aput-object v2, v3, v1

    .line 37
    .line 38
    invoke-direct {v0, v3}, Lcom/google/android/libraries/places/internal/zzauw;-><init>([Lcom/google/android/libraries/places/internal/zzavd;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaud;->zzd:[B

    .line 45
    .line 46
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzaux;->zzb:Lcom/google/android/libraries/places/internal/zzavd;

    .line 47
    .line 48
    return-void
.end method

.method private static zzb(Lcom/google/android/libraries/places/internal/zzavc;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Lcom/google/android/libraries/places/internal/zzavc;->zzc()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public final zza(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavt;
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzavv;->zzs(Ljava/lang/Class;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzaux;->zzb:Lcom/google/android/libraries/places/internal/zzavd;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/google/android/libraries/places/internal/zzavd;->zzb(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavc;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzavc;->zzb()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const-class v0, Lcom/google/android/libraries/places/internal/zzatu;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzn()Lcom/google/android/libraries/places/internal/zzawn;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzati;->zzb()Lcom/google/android/libraries/places/internal/zzatg;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzavc;->zza()Lcom/google/android/libraries/places/internal/zzavf;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavj;->zzi(Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzavj;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_0
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzm()Lcom/google/android/libraries/places/internal/zzawn;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzati;->zza()Lcom/google/android/libraries/places/internal/zzatg;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {v1}, Lcom/google/android/libraries/places/internal/zzavc;->zza()Lcom/google/android/libraries/places/internal/zzavf;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {p0, p1, v0}, Lcom/google/android/libraries/places/internal/zzavj;->zzi(Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzavj;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzaux;->zzb(Lcom/google/android/libraries/places/internal/zzavc;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_2

    .line 69
    .line 70
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavm;->zzb()Lcom/google/android/libraries/places/internal/zzavl;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaut;->zze()Lcom/google/android/libraries/places/internal/zzaut;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzn()Lcom/google/android/libraries/places/internal/zzawn;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzati;->zzb()Lcom/google/android/libraries/places/internal/zzatg;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavb;->zzb()Lcom/google/android/libraries/places/internal/zzava;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    move-object v0, p1

    .line 91
    invoke-static/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzi(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzavc;Lcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)Lcom/google/android/libraries/places/internal/zzavi;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_2
    move-object v0, p1

    .line 97
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavm;->zzb()Lcom/google/android/libraries/places/internal/zzavl;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaut;->zze()Lcom/google/android/libraries/places/internal/zzaut;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzn()Lcom/google/android/libraries/places/internal/zzawn;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    const/4 v5, 0x0

    .line 110
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavb;->zzb()Lcom/google/android/libraries/places/internal/zzava;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-static/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzi(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzavc;Lcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)Lcom/google/android/libraries/places/internal/zzavi;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_3
    move-object v0, p1

    .line 120
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzaux;->zzb(Lcom/google/android/libraries/places/internal/zzavc;)Z

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    if-eqz p0, :cond_4

    .line 125
    .line 126
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavm;->zza()Lcom/google/android/libraries/places/internal/zzavl;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaut;->zzd()Lcom/google/android/libraries/places/internal/zzaut;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzm()Lcom/google/android/libraries/places/internal/zzawn;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzati;->zza()Lcom/google/android/libraries/places/internal/zzatg;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavb;->zza()Lcom/google/android/libraries/places/internal/zzava;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    invoke-static/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzi(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzavc;Lcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)Lcom/google/android/libraries/places/internal/zzavi;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    return-object p0

    .line 151
    :cond_4
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavm;->zza()Lcom/google/android/libraries/places/internal/zzavl;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaut;->zzd()Lcom/google/android/libraries/places/internal/zzaut;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavv;->zzm()Lcom/google/android/libraries/places/internal/zzawn;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    const/4 v5, 0x0

    .line 164
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavb;->zza()Lcom/google/android/libraries/places/internal/zzava;

    .line 165
    .line 166
    .line 167
    move-result-object v6

    .line 168
    invoke-static/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzavi;->zzi(Ljava/lang/Class;Lcom/google/android/libraries/places/internal/zzavc;Lcom/google/android/libraries/places/internal/zzavl;Lcom/google/android/libraries/places/internal/zzaut;Lcom/google/android/libraries/places/internal/zzawn;Lcom/google/android/libraries/places/internal/zzatg;Lcom/google/android/libraries/places/internal/zzava;)Lcom/google/android/libraries/places/internal/zzavi;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0
.end method
