.class public final Lcom/google/android/libraries/places/internal/zzhc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzapv;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzjw;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzjr;

.field private final zzd:Lcom/google/android/libraries/places/internal/zzdv;

.field private final zze:Lcom/google/android/libraries/places/internal/zzhk;

.field private final zzf:Lcom/google/android/libraries/places/internal/zzhm;

.field private final zzg:Lcom/google/android/libraries/places/internal/zzgk;

.field private final zzh:Lcom/google/android/libraries/places/internal/zzgh;

.field private final zzi:Lcom/google/android/libraries/places/internal/zzgc;

.field private final zzj:Lcom/google/android/libraries/places/internal/zzho;

.field private final zzk:Lcom/google/android/libraries/places/internal/zzhe;

.field private final zzl:Lcom/google/android/libraries/places/internal/zzjs;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzjs;Lcom/google/android/libraries/places/internal/zzapv;Lcom/google/android/libraries/places/internal/zzjr;Lcom/google/android/libraries/places/internal/zzdv;Lcom/google/android/libraries/places/internal/zzhm;Lcom/google/android/libraries/places/internal/zzhk;Lcom/google/android/libraries/places/internal/zzgk;Lcom/google/android/libraries/places/internal/zzgh;Lcom/google/android/libraries/places/internal/zzgc;Lcom/google/android/libraries/places/internal/zzhe;Lcom/google/android/libraries/places/internal/zzho;Lcom/google/android/libraries/places/internal/zzjw;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    iput-object p12, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    iput-object p4, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    iput-object p5, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzf:Lcom/google/android/libraries/places/internal/zzhm;

    iput-object p6, p0, Lcom/google/android/libraries/places/internal/zzhc;->zze:Lcom/google/android/libraries/places/internal/zzhk;

    iput-object p7, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzg:Lcom/google/android/libraries/places/internal/zzgk;

    iput-object p9, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzi:Lcom/google/android/libraries/places/internal/zzgc;

    iput-object p8, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzh:Lcom/google/android/libraries/places/internal/zzgh;

    iput-object p10, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzk:Lcom/google/android/libraries/places/internal/zzhe;

    iput-object p11, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzj:Lcom/google/android/libraries/places/internal/zzho;

    return-void
.end method


# virtual methods
.method public final synthetic zza(Lcom/google/android/libraries/places/internal/zzamn;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sni0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sni0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzamn;->zzd()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/google/android/libraries/places/internal/zzamm;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzj:Lcom/google/android/libraries/places/internal/zzho;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/internal/zzho;->zza(Lcom/google/android/libraries/places/internal/zzamm;)Lcom/google/android/libraries/places/api/model/AutocompletePrediction;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final synthetic zzb(Lcom/google/android/libraries/places/internal/zzaps;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sni0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sni0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzk:Lcom/google/android/libraries/places/internal/zzhe;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzhe;->zza(Lcom/google/android/libraries/places/internal/zzaps;)Lcom/google/android/libraries/places/api/model/Place;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;->newInstance(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/FetchPlaceResponse;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic zzc(Lcom/google/android/libraries/places/internal/zzarr;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sni0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sni0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzarr;->zzd()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/google/android/libraries/places/internal/zzaps;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzk:Lcom/google/android/libraries/places/internal/zzhe;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/internal/zzhe;->zza(Lcom/google/android/libraries/places/internal/zzaps;)Lcom/google/android/libraries/places/api/model/Place;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v1}, Lcom/google/android/libraries/places/api/net/SearchByTextResponse;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/net/SearchByTextResponse;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final synthetic zzd(Lcom/google/android/libraries/places/internal/zzarc;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sni0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sni0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzarc;->zzd()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/google/android/libraries/places/internal/zzaps;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzk:Lcom/google/android/libraries/places/internal/zzhe;

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/internal/zzhe;->zza(Lcom/google/android/libraries/places/internal/zzaps;)Lcom/google/android/libraries/places/api/model/Place;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-static {v1}, Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/net/SearchNearbyResponse;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ll/sni0;->a()Lcom/google/android/gms/tasks/Task;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public final zze(Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getRegionCode()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/16 v0, 0x2334

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 17
    .line 18
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 19
    .line 20
    const-string p2, "Region code must not be an empty string."

    .line 21
    .line 22
    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getQuery()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    if-nez p2, :cond_2

    .line 38
    .line 39
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 40
    .line 41
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 42
    .line 43
    const-string p2, "Query must not be null."

    .line 44
    .line 45
    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_3

    .line 65
    .line 66
    invoke-static {}, Lcom/google/android/libraries/places/internal/zznx;->zzl()Lcom/google/android/libraries/places/internal/zznx;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsResponse;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Ll/toi0;->f(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0

    .line 79
    :cond_3
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 86
    .line 87
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 88
    .line 89
    .line 90
    move-result-wide v3

    .line 91
    const-string p2, ""

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzjs;->zza()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v1, p2, v2}, Lcom/google/android/libraries/places/internal/zzjw;->zza(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbva;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Lcom/google/android/libraries/places/internal/zzayp;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    const/4 v1, 0x1

    .line 106
    new-array v2, v1, [Lcom/google/android/libraries/places/internal/zzayp;

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    aput-object p2, v2, v5

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbur;->zze([Lcom/google/android/libraries/places/internal/zzayp;)Lcom/google/android/libraries/places/internal/zzbur;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaly;->zza()Lcom/google/android/libraries/places/internal/zzalt;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getQuery()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getInputOffset()Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    if-eqz v2, :cond_4

    .line 134
    .line 135
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzd(I)Lcom/google/android/libraries/places/internal/zzalt;

    .line 140
    .line 141
    .line 142
    :cond_4
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getRegionCode()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    if-eqz v2, :cond_5

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzh(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 149
    .line 150
    .line 151
    :cond_5
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getLocationBias()Lcom/google/android/libraries/places/api/model/LocationBias;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    if-eqz v2, :cond_a

    .line 156
    .line 157
    instance-of v6, v2, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 158
    .line 159
    if-nez v6, :cond_6

    .line 160
    .line 161
    instance-of v7, v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 162
    .line 163
    if-eqz v7, :cond_7

    .line 164
    .line 165
    :cond_6
    move v7, v1

    .line 166
    goto :goto_1

    .line 167
    :cond_7
    move v7, v5

    .line 168
    :goto_1
    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzmt;->zze(Z)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzalv;->zza()Lcom/google/android/libraries/places/internal/zzalu;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    if-eqz v6, :cond_8

    .line 176
    .line 177
    move-object v6, v2

    .line 178
    check-cast v6, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 179
    .line 180
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzge;->zza(Lcom/google/android/libraries/places/api/model/CircularBounds;)Lcom/google/android/libraries/places/internal/zzamq;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    invoke-virtual {v7, v6}, Lcom/google/android/libraries/places/internal/zzalu;->zza(Lcom/google/android/libraries/places/internal/zzamq;)Lcom/google/android/libraries/places/internal/zzalu;

    .line 185
    .line 186
    .line 187
    :cond_8
    instance-of v6, v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 188
    .line 189
    if-eqz v6, :cond_9

    .line 190
    .line 191
    check-cast v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 192
    .line 193
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzge;->zzb(Lcom/google/android/libraries/places/api/model/RectangularBounds;)Lcom/google/android/libraries/places/internal/zzaki;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v7, v2}, Lcom/google/android/libraries/places/internal/zzalu;->zzb(Lcom/google/android/libraries/places/internal/zzaki;)Lcom/google/android/libraries/places/internal/zzalu;

    .line 198
    .line 199
    .line 200
    :cond_9
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    check-cast v2, Lcom/google/android/libraries/places/internal/zzalv;

    .line 205
    .line 206
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zze(Lcom/google/android/libraries/places/internal/zzalv;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 207
    .line 208
    .line 209
    :cond_a
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getLocationRestriction()Lcom/google/android/libraries/places/api/model/LocationRestriction;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    if-eqz v2, :cond_f

    .line 214
    .line 215
    instance-of v6, v2, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 216
    .line 217
    if-nez v6, :cond_b

    .line 218
    .line 219
    instance-of v7, v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 220
    .line 221
    if-eqz v7, :cond_c

    .line 222
    .line 223
    :cond_b
    move v5, v1

    .line 224
    :cond_c
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzmt;->zze(Z)V

    .line 225
    .line 226
    .line 227
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzalx;->zza()Lcom/google/android/libraries/places/internal/zzalw;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    if-eqz v6, :cond_d

    .line 232
    .line 233
    move-object v6, v2

    .line 234
    check-cast v6, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 235
    .line 236
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzge;->zza(Lcom/google/android/libraries/places/api/model/CircularBounds;)Lcom/google/android/libraries/places/internal/zzamq;

    .line 237
    .line 238
    .line 239
    move-result-object v6

    .line 240
    invoke-virtual {v5, v6}, Lcom/google/android/libraries/places/internal/zzalw;->zza(Lcom/google/android/libraries/places/internal/zzamq;)Lcom/google/android/libraries/places/internal/zzalw;

    .line 241
    .line 242
    .line 243
    :cond_d
    instance-of v6, v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 244
    .line 245
    if-eqz v6, :cond_e

    .line 246
    .line 247
    check-cast v2, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 248
    .line 249
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzge;->zzb(Lcom/google/android/libraries/places/api/model/RectangularBounds;)Lcom/google/android/libraries/places/internal/zzaki;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v5, v2}, Lcom/google/android/libraries/places/internal/zzalw;->zzb(Lcom/google/android/libraries/places/internal/zzaki;)Lcom/google/android/libraries/places/internal/zzalw;

    .line 254
    .line 255
    .line 256
    :cond_e
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    check-cast v2, Lcom/google/android/libraries/places/internal/zzalx;

    .line 261
    .line 262
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzf(Lcom/google/android/libraries/places/internal/zzalx;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 263
    .line 264
    .line 265
    :cond_f
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getOrigin()Lcom/google/android/gms/maps/model/LatLng;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    if-eqz v2, :cond_10

    .line 270
    .line 271
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaxp;->zzf()Lcom/google/android/libraries/places/internal/zzaxo;

    .line 272
    .line 273
    .line 274
    move-result-object v5

    .line 275
    iget-wide v6, v2, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    .line 276
    .line 277
    invoke-virtual {v5, v6, v7}, Lcom/google/android/libraries/places/internal/zzaxo;->zza(D)Lcom/google/android/libraries/places/internal/zzaxo;

    .line 278
    .line 279
    .line 280
    iget-wide v6, v2, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    .line 281
    .line 282
    invoke-virtual {v5, v6, v7}, Lcom/google/android/libraries/places/internal/zzaxo;->zzb(D)Lcom/google/android/libraries/places/internal/zzaxo;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    check-cast v2, Lcom/google/android/libraries/places/internal/zzaxp;

    .line 290
    .line 291
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzg(Lcom/google/android/libraries/places/internal/zzaxp;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 292
    .line 293
    .line 294
    :cond_10
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getCountries()Ljava/util/List;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 303
    .line 304
    .line 305
    move-result v5

    .line 306
    if-eqz v5, :cond_11

    .line 307
    .line 308
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v5

    .line 312
    check-cast v5, Ljava/lang/String;

    .line 313
    .line 314
    invoke-virtual {v0, v5}, Lcom/google/android/libraries/places/internal/zzalt;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 315
    .line 316
    .line 317
    goto :goto_2

    .line 318
    :cond_11
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getSessionToken()Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 319
    .line 320
    .line 321
    move-result-object v2

    .line 322
    if-eqz v2, :cond_12

    .line 323
    .line 324
    invoke-virtual {v2}, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzalt;->zzi(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 329
    .line 330
    .line 331
    :cond_12
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getTypesFilter()Ljava/util/List;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    if-eqz v5, :cond_13

    .line 344
    .line 345
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    move-result-object v5

    .line 349
    check-cast v5, Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v0, v5}, Lcom/google/android/libraries/places/internal/zzalt;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzalt;

    .line 352
    .line 353
    .line 354
    goto :goto_3

    .line 355
    :cond_13
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaly;

    .line 360
    .line 361
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzd()Lcom/google/android/libraries/places/internal/zzayk;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzapw;->zzb()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 366
    .line 367
    .line 368
    move-result-object v5

    .line 369
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzc()Lcom/google/android/libraries/places/internal/zzayj;

    .line 370
    .line 371
    .line 372
    move-result-object p2

    .line 373
    invoke-virtual {v2, v5, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 374
    .line 375
    .line 376
    move-result-object p2

    .line 377
    invoke-static {p2, v0}, Lcom/google/android/libraries/places/internal/zzbux;->zza(Lcom/google/android/libraries/places/internal/zzayo;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzaka;

    .line 378
    .line 379
    .line 380
    move-result-object p2

    .line 381
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FindAutocompletePredictionsRequest;->getCancellationToken()Ll/gg4;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    if-eqz p1, :cond_14

    .line 386
    .line 387
    new-instance v0, Lcom/google/android/libraries/places/internal/zzgn;

    .line 388
    .line 389
    invoke-direct {v0, p2}, Lcom/google/android/libraries/places/internal/zzgn;-><init>(Lcom/google/android/libraries/places/internal/zzaka;)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {p1, v0}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 393
    .line 394
    .line 395
    :cond_14
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzed;->zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgt;

    .line 400
    .line 401
    invoke-direct {p2, p0}, Lcom/google/android/libraries/places/internal/zzgt;-><init>(Lcom/google/android/libraries/places/internal/zzhc;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgu;

    .line 409
    .line 410
    invoke-direct {p2, p0, v3, v4, v1}, Lcom/google/android/libraries/places/internal/zzgu;-><init>(Lcom/google/android/libraries/places/internal/zzhc;JI)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    return-object p0
.end method

.method public final zzf(Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 6

    .line 1
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 2
    .line 3
    invoke-interface {p2}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    .line 10
    .line 11
    const-string v3, ""

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzjs;->zza()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {v2, v3, p2}, Lcom/google/android/libraries/places/internal/zzjw;->zza(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbva;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Lcom/google/android/libraries/places/internal/zzayp;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const/4 v2, 0x1

    .line 26
    new-array v3, v2, [Lcom/google/android/libraries/places/internal/zzayp;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    aput-object p2, v3, v4

    .line 30
    .line 31
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    .line 32
    .line 33
    invoke-virtual {p2, v3}, Lcom/google/android/libraries/places/internal/zzbur;->zze([Lcom/google/android/libraries/places/internal/zzayp;)Lcom/google/android/libraries/places/internal/zzbur;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzanx;->zza()Lcom/google/android/libraries/places/internal/zzanw;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;->getPhotoMetadata()Lcom/google/android/libraries/places/api/model/PhotoMetadata;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v4}, Lcom/google/android/libraries/places/api/model/PhotoMetadata;->zza()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    const-string v5, "/media"

    .line 53
    .line 54
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzanw;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzanw;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;->getMaxHeight()Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    if-eqz v4, :cond_0

    .line 66
    .line 67
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzanw;->zza(I)Lcom/google/android/libraries/places/internal/zzanw;

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;->getMaxWidth()Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    if-eqz v4, :cond_1

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    invoke-virtual {v3, v4}, Lcom/google/android/libraries/places/internal/zzanw;->zzb(I)Lcom/google/android/libraries/places/internal/zzanw;

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/internal/zzanw;->zzd(Z)Lcom/google/android/libraries/places/internal/zzanw;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lcom/google/android/libraries/places/internal/zzanx;

    .line 95
    .line 96
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzd()Lcom/google/android/libraries/places/internal/zzayk;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzapw;->zzc()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzc()Lcom/google/android/libraries/places/internal/zzayj;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    invoke-virtual {v4, v5, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-static {p2, v3}, Lcom/google/android/libraries/places/internal/zzbux;->zza(Lcom/google/android/libraries/places/internal/zzayo;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzaka;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchResolvedPhotoUriRequest;->getCancellationToken()Ll/gg4;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    if-eqz p1, :cond_2

    .line 121
    .line 122
    new-instance v3, Lcom/google/android/libraries/places/internal/zzgq;

    .line 123
    .line 124
    invoke-direct {v3, p2}, Lcom/google/android/libraries/places/internal/zzgq;-><init>(Lcom/google/android/libraries/places/internal/zzaka;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v3}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 128
    .line 129
    .line 130
    :cond_2
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzed;->zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgr;

    .line 135
    .line 136
    invoke-direct {p2}, Lcom/google/android/libraries/places/internal/zzgr;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgs;

    .line 144
    .line 145
    invoke-direct {p2, p0, v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzgs;-><init>(Lcom/google/android/libraries/places/internal/zzhc;JI)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0
.end method

.method public final zzg(Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getPlaceId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/16 v0, 0x2334

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 16
    .line 17
    const-string p2, "Place id must not be an empty string."

    .line 18
    .line 19
    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getPlaceFields()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 41
    .line 42
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 43
    .line 44
    const-string p2, "Place fields must not be empty."

    .line 45
    .line 46
    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getRegionCode()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 71
    .line 72
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 73
    .line 74
    const-string p2, "Region code must not be an empty string."

    .line 75
    .line 76
    invoke-direct {p1, v0, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 88
    .line 89
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzhg;->zza(Ljava/util/List;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzjv;->zzb(Ljava/util/List;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    .line 104
    .line 105
    iget-object v4, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 106
    .line 107
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzjs;->zza()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v3, p2, v4}, Lcom/google/android/libraries/places/internal/zzjw;->zza(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbva;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Lcom/google/android/libraries/places/internal/zzayp;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    const/4 v3, 0x1

    .line 120
    new-array v4, v3, [Lcom/google/android/libraries/places/internal/zzayp;

    .line 121
    .line 122
    const/4 v5, 0x0

    .line 123
    aput-object p2, v4, v5

    .line 124
    .line 125
    invoke-virtual {v2, v4}, Lcom/google/android/libraries/places/internal/zzbur;->zze([Lcom/google/android/libraries/places/internal/zzayp;)Lcom/google/android/libraries/places/internal/zzbur;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 130
    .line 131
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzjs;->zzb()Ljava/util/Locale;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaoa;->zza()Lcom/google/android/libraries/places/internal/zzanz;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getPlaceId()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    const-string v6, "places/"

    .line 148
    .line 149
    invoke-virtual {v6, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzanz;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzanz;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getRegionCode()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v5

    .line 160
    if-eqz v5, :cond_4

    .line 161
    .line 162
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzanz;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzanz;

    .line 163
    .line 164
    .line 165
    :cond_4
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getSessionToken()Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    if-eqz v5, :cond_5

    .line 170
    .line 171
    invoke-virtual {v5}, Lcom/google/android/libraries/places/api/model/AutocompleteSessionToken;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-virtual {v4, v5}, Lcom/google/android/libraries/places/internal/zzanz;->zzd(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzanz;

    .line 176
    .line 177
    .line 178
    :cond_5
    invoke-virtual {v2}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-virtual {v4, v2}, Lcom/google/android/libraries/places/internal/zzanz;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzanz;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v4}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    check-cast v2, Lcom/google/android/libraries/places/internal/zzaoa;

    .line 190
    .line 191
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzd()Lcom/google/android/libraries/places/internal/zzayk;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzapw;->zzd()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzc()Lcom/google/android/libraries/places/internal/zzayj;

    .line 200
    .line 201
    .line 202
    move-result-object p2

    .line 203
    invoke-virtual {v4, v5, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 204
    .line 205
    .line 206
    move-result-object p2

    .line 207
    invoke-static {p2, v2}, Lcom/google/android/libraries/places/internal/zzbux;->zza(Lcom/google/android/libraries/places/internal/zzayo;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzaka;

    .line 208
    .line 209
    .line 210
    move-result-object p2

    .line 211
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/FetchPlaceRequest;->getCancellationToken()Ll/gg4;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    if-eqz p1, :cond_6

    .line 216
    .line 217
    new-instance v2, Lcom/google/android/libraries/places/internal/zzgv;

    .line 218
    .line 219
    invoke-direct {v2, p2}, Lcom/google/android/libraries/places/internal/zzgv;-><init>(Lcom/google/android/libraries/places/internal/zzaka;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p1, v2}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 223
    .line 224
    .line 225
    :cond_6
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzed;->zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgw;

    .line 230
    .line 231
    invoke-direct {p2, p0}, Lcom/google/android/libraries/places/internal/zzgw;-><init>(Lcom/google/android/libraries/places/internal/zzhc;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    new-instance p2, Lcom/google/android/libraries/places/internal/zzgx;

    .line 239
    .line 240
    invoke-direct {p2, p0, v0, v1, v3}, Lcom/google/android/libraries/places/internal/zzgx;-><init>(Lcom/google/android/libraries/places/internal/zzhc;JI)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    return-object p0
.end method

.method public final synthetic zzh(JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-object p4

    .line 8
    :cond_0
    iget-object p3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    .line 11
    .line 12
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    const/4 v6, 0x3

    .line 17
    const/4 v7, 0x1

    .line 18
    move-wide v2, p1

    .line 19
    move-object v1, p4

    .line 20
    invoke-interface/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzjr;->zzn(Lcom/google/android/gms/tasks/Task;JJII)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method public final synthetic zzi(JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-object p4

    .line 8
    :cond_0
    iget-object p3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    .line 11
    .line 12
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    const/4 v6, 0x1

    .line 17
    move-wide v2, p1

    .line 18
    move-object v1, p4

    .line 19
    invoke-interface/range {v0 .. v6}, Lcom/google/android/libraries/places/internal/zzjr;->zzd(Lcom/google/android/gms/tasks/Task;JJI)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public final synthetic zzj(JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-object p4

    .line 8
    :cond_0
    iget-object p3, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    .line 11
    .line 12
    invoke-interface {p3}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 13
    .line 14
    .line 15
    move-result-wide v4

    .line 16
    const/4 v6, 0x3

    .line 17
    const/4 v7, 0x1

    .line 18
    move-wide v2, p1

    .line 19
    move-object v1, p4

    .line 20
    invoke-interface/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzjr;->zzl(Lcom/google/android/gms/tasks/Task;JJII)V

    .line 21
    .line 22
    .line 23
    return-object v1
.end method

.method public final synthetic zzk(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    iget-object p4, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    .line 11
    .line 12
    invoke-interface {p4}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 13
    .line 14
    .line 15
    move-result-wide v5

    .line 16
    const/4 v7, 0x1

    .line 17
    move-object v1, p1

    .line 18
    move-wide v3, p2

    .line 19
    move-object v2, p5

    .line 20
    invoke-interface/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzjr;->zzh(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;Lcom/google/android/gms/tasks/Task;JJI)V

    .line 21
    .line 22
    .line 23
    return-object v2
.end method

.method public final synthetic zzl(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p5}, Lcom/google/android/gms/tasks/Task;->n()Z

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    return-object p5

    .line 8
    :cond_0
    iget-object p4, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzc:Lcom/google/android/libraries/places/internal/zzjr;

    .line 11
    .line 12
    invoke-interface {p4}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 13
    .line 14
    .line 15
    move-result-wide v5

    .line 16
    const/4 v7, 0x1

    .line 17
    move-object v1, p1

    .line 18
    move-wide v3, p2

    .line 19
    move-object v2, p5

    .line 20
    invoke-interface/range {v0 .. v7}, Lcom/google/android/libraries/places/internal/zzjr;->zzj(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;Lcom/google/android/gms/tasks/Task;JJI)V

    .line 21
    .line 22
    .line 23
    return-object v2
.end method

.method public final zzm(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 11

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getPlaceFields()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x2334

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 16
    .line 17
    const-string p2, "Place fields must not be empty."

    .line 18
    .line 19
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getTextQuery()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 41
    .line 42
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 43
    .line 44
    const-string p2, "Text query must not be an empty string."

    .line 45
    .line 46
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getIncludedType()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 71
    .line 72
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 73
    .line 74
    const-string p2, "Included type must not be an empty string."

    .line 75
    .line 76
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_3
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getRegionCode()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 101
    .line 102
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 103
    .line 104
    const-string p2, "Region code must not be an empty string."

    .line 105
    .line 106
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 118
    .line 119
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 120
    .line 121
    .line 122
    move-result-wide v4

    .line 123
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzhg;->zza(Ljava/util/List;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzjv;->zza(Ljava/util/List;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    .line 132
    .line 133
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    .line 134
    .line 135
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 136
    .line 137
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzjs;->zza()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v1, p2, v2}, Lcom/google/android/libraries/places/internal/zzjw;->zza(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbva;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Lcom/google/android/libraries/places/internal/zzayp;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    const/4 v1, 0x1

    .line 150
    new-array v2, v1, [Lcom/google/android/libraries/places/internal/zzayp;

    .line 151
    .line 152
    const/4 v3, 0x0

    .line 153
    aput-object p2, v2, v3

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzbur;->zze([Lcom/google/android/libraries/places/internal/zzayp;)Lcom/google/android/libraries/places/internal/zzbur;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzjs;->zzb()Ljava/util/Locale;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaro;->zza()Lcom/google/android/libraries/places/internal/zzare;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getIncludedType()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    if-eqz v6, :cond_6

    .line 174
    .line 175
    invoke-virtual {v2, v6}, Lcom/google/android/libraries/places/internal/zzare;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzare;

    .line 176
    .line 177
    .line 178
    :cond_6
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getLocationBias()Lcom/google/android/libraries/places/api/model/LocationBias;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    if-eqz v6, :cond_a

    .line 183
    .line 184
    instance-of v7, v6, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 185
    .line 186
    if-nez v7, :cond_7

    .line 187
    .line 188
    instance-of v8, v6, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 189
    .line 190
    if-eqz v8, :cond_8

    .line 191
    .line 192
    :cond_7
    move v3, v1

    .line 193
    :cond_8
    const-string v8, "LocationBias must be of type RectangularBounds or CircularBounds."

    .line 194
    .line 195
    invoke-static {v3, v8}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzarj;->zza()Lcom/google/android/libraries/places/internal/zzari;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    if-eqz v7, :cond_9

    .line 203
    .line 204
    check-cast v6, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 205
    .line 206
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzge;->zzb(Lcom/google/android/libraries/places/api/model/RectangularBounds;)Lcom/google/android/libraries/places/internal/zzaki;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    invoke-virtual {v3, v6}, Lcom/google/android/libraries/places/internal/zzari;->zzb(Lcom/google/android/libraries/places/internal/zzaki;)Lcom/google/android/libraries/places/internal/zzari;

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :cond_9
    check-cast v6, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 215
    .line 216
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzge;->zza(Lcom/google/android/libraries/places/api/model/CircularBounds;)Lcom/google/android/libraries/places/internal/zzamq;

    .line 217
    .line 218
    .line 219
    move-result-object v6

    .line 220
    invoke-virtual {v3, v6}, Lcom/google/android/libraries/places/internal/zzari;->zza(Lcom/google/android/libraries/places/internal/zzamq;)Lcom/google/android/libraries/places/internal/zzari;

    .line 221
    .line 222
    .line 223
    :goto_2
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    check-cast v3, Lcom/google/android/libraries/places/internal/zzarj;

    .line 228
    .line 229
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzare;->zzd(Lcom/google/android/libraries/places/internal/zzarj;)Lcom/google/android/libraries/places/internal/zzare;

    .line 230
    .line 231
    .line 232
    :cond_a
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getLocationRestriction()Lcom/google/android/libraries/places/api/model/LocationRestriction;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    if-eqz v3, :cond_b

    .line 237
    .line 238
    instance-of v6, v3, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 239
    .line 240
    const-string v7, "LocationRestriction must be of type RectangularBounds."

    .line 241
    .line 242
    invoke-static {v6, v7}, Lcom/google/android/libraries/places/internal/zzmt;->zzf(ZLjava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzarl;->zza()Lcom/google/android/libraries/places/internal/zzark;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    check-cast v3, Lcom/google/android/libraries/places/api/model/RectangularBounds;

    .line 250
    .line 251
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzge;->zzb(Lcom/google/android/libraries/places/api/model/RectangularBounds;)Lcom/google/android/libraries/places/internal/zzaki;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    invoke-virtual {v6, v3}, Lcom/google/android/libraries/places/internal/zzark;->zza(Lcom/google/android/libraries/places/internal/zzaki;)Lcom/google/android/libraries/places/internal/zzark;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v6}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    check-cast v3, Lcom/google/android/libraries/places/internal/zzarl;

    .line 263
    .line 264
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzare;->zze(Lcom/google/android/libraries/places/internal/zzarl;)Lcom/google/android/libraries/places/internal/zzare;

    .line 265
    .line 266
    .line 267
    :cond_b
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getMaxResultCount()Ljava/lang/Integer;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    if-eqz v3, :cond_c

    .line 272
    .line 273
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzare;->zzf(I)Lcom/google/android/libraries/places/internal/zzare;

    .line 278
    .line 279
    .line 280
    :cond_c
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getMinRating()Ljava/lang/Double;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    if-eqz v3, :cond_d

    .line 285
    .line 286
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    .line 287
    .line 288
    .line 289
    move-result-wide v6

    .line 290
    invoke-virtual {v2, v6, v7}, Lcom/google/android/libraries/places/internal/zzare;->zzg(D)Lcom/google/android/libraries/places/internal/zzare;

    .line 291
    .line 292
    .line 293
    :cond_d
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->isOpenNow()Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    invoke-virtual {v2, v3}, Lcom/google/android/libraries/places/internal/zzare;->zzh(Z)Lcom/google/android/libraries/places/internal/zzare;

    .line 298
    .line 299
    .line 300
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getPriceLevels()Ljava/util/List;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    new-instance v6, Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .line 308
    .line 309
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 314
    .line 315
    .line 316
    move-result v7

    .line 317
    const/4 v8, 0x4

    .line 318
    const/4 v9, 0x3

    .line 319
    const/4 v10, 0x2

    .line 320
    if-eqz v7, :cond_13

    .line 321
    .line 322
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    check-cast v7, Ljava/lang/Integer;

    .line 327
    .line 328
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 329
    .line 330
    .line 331
    move-result v7

    .line 332
    if-eqz v7, :cond_12

    .line 333
    .line 334
    if-eq v7, v1, :cond_11

    .line 335
    .line 336
    if-eq v7, v10, :cond_10

    .line 337
    .line 338
    if-eq v7, v9, :cond_f

    .line 339
    .line 340
    if-eq v7, v8, :cond_e

    .line 341
    .line 342
    goto :goto_3

    .line 343
    :cond_e
    sget-object v7, Lcom/google/android/libraries/places/internal/zzaqb;->zzf:Lcom/google/android/libraries/places/internal/zzaqb;

    .line 344
    .line 345
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    goto :goto_3

    .line 349
    :cond_f
    sget-object v7, Lcom/google/android/libraries/places/internal/zzaqb;->zze:Lcom/google/android/libraries/places/internal/zzaqb;

    .line 350
    .line 351
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    goto :goto_3

    .line 355
    :cond_10
    sget-object v7, Lcom/google/android/libraries/places/internal/zzaqb;->zzd:Lcom/google/android/libraries/places/internal/zzaqb;

    .line 356
    .line 357
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    goto :goto_3

    .line 361
    :cond_11
    sget-object v7, Lcom/google/android/libraries/places/internal/zzaqb;->zzc:Lcom/google/android/libraries/places/internal/zzaqb;

    .line 362
    .line 363
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    goto :goto_3

    .line 367
    :cond_12
    sget-object v7, Lcom/google/android/libraries/places/internal/zzaqb;->zzb:Lcom/google/android/libraries/places/internal/zzaqb;

    .line 368
    .line 369
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    goto :goto_3

    .line 373
    :cond_13
    invoke-virtual {v2, v6}, Lcom/google/android/libraries/places/internal/zzare;->zza(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zzare;

    .line 374
    .line 375
    .line 376
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getRankPreference()Lcom/google/android/libraries/places/api/net/SearchByTextRequest$RankPreference;

    .line 377
    .line 378
    .line 379
    move-result-object v1

    .line 380
    if-nez v1, :cond_14

    .line 381
    .line 382
    move v8, v10

    .line 383
    goto :goto_4

    .line 384
    :cond_14
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-eqz v1, :cond_15

    .line 389
    .line 390
    goto :goto_4

    .line 391
    :cond_15
    move v8, v9

    .line 392
    :goto_4
    invoke-virtual {v2, v8}, Lcom/google/android/libraries/places/internal/zzare;->zzl(I)Lcom/google/android/libraries/places/internal/zzare;

    .line 393
    .line 394
    .line 395
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getRegionCode()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    if-eqz v1, :cond_16

    .line 400
    .line 401
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzare;->zzi(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzare;

    .line 402
    .line 403
    .line 404
    :cond_16
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->isStrictTypeFiltering()Z

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzare;->zzj(Z)Lcom/google/android/libraries/places/internal/zzare;

    .line 409
    .line 410
    .line 411
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchByTextRequest;->getTextQuery()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v1

    .line 415
    invoke-virtual {v2, v1}, Lcom/google/android/libraries/places/internal/zzare;->zzk(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzare;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v0}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v0

    .line 422
    invoke-virtual {v2, v0}, Lcom/google/android/libraries/places/internal/zzare;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzare;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaro;

    .line 430
    .line 431
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzd()Lcom/google/android/libraries/places/internal/zzayk;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzapw;->zzf()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzc()Lcom/google/android/libraries/places/internal/zzayj;

    .line 440
    .line 441
    .line 442
    move-result-object p2

    .line 443
    invoke-virtual {v1, v2, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 444
    .line 445
    .line 446
    move-result-object p2

    .line 447
    invoke-static {p2, v0}, Lcom/google/android/libraries/places/internal/zzbux;->zza(Lcom/google/android/libraries/places/internal/zzayo;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzaka;

    .line 448
    .line 449
    .line 450
    move-result-object p2

    .line 451
    invoke-interface {p1}, Lcom/google/android/libraries/places/internal/zzjt;->getCancellationToken()Ll/gg4;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    if-eqz v0, :cond_17

    .line 456
    .line 457
    new-instance v1, Lcom/google/android/libraries/places/internal/zzhb;

    .line 458
    .line 459
    invoke-direct {v1, p2}, Lcom/google/android/libraries/places/internal/zzhb;-><init>(Lcom/google/android/libraries/places/internal/zzaka;)V

    .line 460
    .line 461
    .line 462
    invoke-virtual {v0, v1}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 463
    .line 464
    .line 465
    :cond_17
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzed;->zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;

    .line 466
    .line 467
    .line 468
    move-result-object p2

    .line 469
    new-instance v0, Lcom/google/android/libraries/places/internal/zzgo;

    .line 470
    .line 471
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzgo;-><init>(Lcom/google/android/libraries/places/internal/zzhc;)V

    .line 472
    .line 473
    .line 474
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 475
    .line 476
    .line 477
    move-result-object p2

    .line 478
    new-instance v1, Lcom/google/android/libraries/places/internal/zzgp;

    .line 479
    .line 480
    const/4 v6, 0x1

    .line 481
    move-object v2, p0

    .line 482
    move-object v3, p1

    .line 483
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzgp;-><init>(Lcom/google/android/libraries/places/internal/zzhc;Lcom/google/android/libraries/places/api/net/SearchByTextRequest;JI)V

    .line 484
    .line 485
    .line 486
    invoke-virtual {p2, v1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 487
    .line 488
    .line 489
    move-result-object p0

    .line 490
    return-object p0
.end method

.method public final zzn(Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;I)Lcom/google/android/gms/tasks/Task;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getPlaceFields()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x2334

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 14
    .line 15
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 16
    .line 17
    const-string p2, "Place fields must not be empty."

    .line 18
    .line 19
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getRegionCode()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-instance p0, Lcom/google/android/gms/common/api/ApiException;

    .line 44
    .line 45
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    .line 46
    .line 47
    const-string p2, "Region code must not be an empty string."

    .line 48
    .line 49
    invoke-direct {p1, v1, p2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0}, Ll/toi0;->e(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzd:Lcom/google/android/libraries/places/internal/zzdv;

    .line 61
    .line 62
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzdv;->zza()J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzhg;->zza(Ljava/util/List;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzjv;->zza(Ljava/util/List;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zza:Lcom/google/android/libraries/places/internal/zzapv;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzb:Lcom/google/android/libraries/places/internal/zzjw;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzjs;->zza()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v1, p2, v2}, Lcom/google/android/libraries/places/internal/zzjw;->zza(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbcf;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzbva;->zza(Lcom/google/android/libraries/places/internal/zzbcf;)Lcom/google/android/libraries/places/internal/zzayp;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    const/4 v1, 0x1

    .line 93
    new-array v1, v1, [Lcom/google/android/libraries/places/internal/zzayp;

    .line 94
    .line 95
    const/4 v2, 0x0

    .line 96
    aput-object p2, v1, v2

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzbur;->zze([Lcom/google/android/libraries/places/internal/zzayp;)Lcom/google/android/libraries/places/internal/zzbur;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzhc;->zzl:Lcom/google/android/libraries/places/internal/zzjs;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzjs;->zzb()Ljava/util/Locale;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaqz;->zza()Lcom/google/android/libraries/places/internal/zzaqu;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zze(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getRegionCode()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzh(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getIncludedTypes()Ljava/util/List;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_4

    .line 133
    .line 134
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzd(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 135
    .line 136
    .line 137
    :cond_4
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getExcludedTypes()Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    if-eqz v0, :cond_5

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzb(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 144
    .line 145
    .line 146
    :cond_5
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getIncludedPrimaryTypes()Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    if-eqz v0, :cond_6

    .line 151
    .line 152
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzc(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 153
    .line 154
    .line 155
    :cond_6
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getExcludedPrimaryTypes()Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    if-eqz v0, :cond_7

    .line 160
    .line 161
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zza(Ljava/lang/Iterable;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 162
    .line 163
    .line 164
    :cond_7
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getMaxResultCount()Ljava/lang/Integer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    if-eqz v0, :cond_8

    .line 169
    .line 170
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzg(I)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 175
    .line 176
    .line 177
    :cond_8
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzaqy;->zza()Lcom/google/android/libraries/places/internal/zzaqx;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getLocationRestriction()Lcom/google/android/libraries/places/api/model/LocationRestriction;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    check-cast v2, Lcom/google/android/libraries/places/api/model/CircularBounds;

    .line 186
    .line 187
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzge;->zza(Lcom/google/android/libraries/places/api/model/CircularBounds;)Lcom/google/android/libraries/places/internal/zzamq;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzaqx;->zza(Lcom/google/android/libraries/places/internal/zzamq;)Lcom/google/android/libraries/places/internal/zzaqx;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaqy;

    .line 199
    .line 200
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzf(Lcom/google/android/libraries/places/internal/zzaqy;)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getRankPreference()Lcom/google/android/libraries/places/api/net/SearchNearbyRequest$RankPreference;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    if-nez v0, :cond_9

    .line 208
    .line 209
    const/4 v0, 0x2

    .line 210
    goto :goto_1

    .line 211
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_a

    .line 216
    .line 217
    const/4 v0, 0x4

    .line 218
    goto :goto_1

    .line 219
    :cond_a
    const/4 v0, 0x3

    .line 220
    :goto_1
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/internal/zzaqu;->zzi(I)Lcom/google/android/libraries/places/internal/zzaqu;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzato;->zzr()Lcom/google/android/libraries/places/internal/zzatu;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    check-cast v0, Lcom/google/android/libraries/places/internal/zzaqz;

    .line 228
    .line 229
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzd()Lcom/google/android/libraries/places/internal/zzayk;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzapw;->zze()Lcom/google/android/libraries/places/internal/zzbcl;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {p2}, Lcom/google/android/libraries/places/internal/zzbur;->zzc()Lcom/google/android/libraries/places/internal/zzayj;

    .line 238
    .line 239
    .line 240
    move-result-object p2

    .line 241
    invoke-virtual {v1, v2, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 242
    .line 243
    .line 244
    move-result-object p2

    .line 245
    invoke-static {p2, v0}, Lcom/google/android/libraries/places/internal/zzbux;->zza(Lcom/google/android/libraries/places/internal/zzayo;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zzaka;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    invoke-virtual {p1}, Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;->getCancellationToken()Ll/gg4;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    if-eqz v0, :cond_b

    .line 254
    .line 255
    new-instance v1, Lcom/google/android/libraries/places/internal/zzgy;

    .line 256
    .line 257
    invoke-direct {v1, p2}, Lcom/google/android/libraries/places/internal/zzgy;-><init>(Lcom/google/android/libraries/places/internal/zzaka;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ll/gg4;->b(Ll/yo50;)Ll/gg4;

    .line 261
    .line 262
    .line 263
    :cond_b
    invoke-static {p2}, Lcom/google/android/libraries/places/internal/zzed;->zza(Lcom/google/android/libraries/places/internal/zzaka;)Lcom/google/android/gms/tasks/Task;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    new-instance v0, Lcom/google/android/libraries/places/internal/zzgz;

    .line 268
    .line 269
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzgz;-><init>(Lcom/google/android/libraries/places/internal/zzhc;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/Task;->r(Ll/zdg0;)Lcom/google/android/gms/tasks/Task;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    new-instance v1, Lcom/google/android/libraries/places/internal/zzha;

    .line 277
    .line 278
    const/4 v6, 0x1

    .line 279
    move-object v2, p0

    .line 280
    move-object v3, p1

    .line 281
    invoke-direct/range {v1 .. v6}, Lcom/google/android/libraries/places/internal/zzha;-><init>(Lcom/google/android/libraries/places/internal/zzhc;Lcom/google/android/libraries/places/api/net/SearchNearbyRequest;JI)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p2, v1}, Lcom/google/android/gms/tasks/Task;->j(Ll/s26;)Lcom/google/android/gms/tasks/Task;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    return-object p0
.end method
