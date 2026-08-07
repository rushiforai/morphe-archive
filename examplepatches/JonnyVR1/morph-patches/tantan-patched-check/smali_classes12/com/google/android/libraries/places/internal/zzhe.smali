.class final Lcom/google/android/libraries/places/internal/zzhe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzhh;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzoa;

.field private final zzc:Lcom/google/android/libraries/places/internal/zzoa;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzhh;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/google/android/libraries/places/internal/zznz;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zznz;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaov;->zzb:Lcom/google/android/libraries/places/internal/zzaov;

    .line 10
    .line 11
    sget-object v2, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;->OPERATIONAL:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaov;->zzc:Lcom/google/android/libraries/places/internal/zzaov;

    .line 17
    .line 18
    sget-object v2, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;->CLOSED_TEMPORARILY:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 21
    .line 22
    .line 23
    sget-object v1, Lcom/google/android/libraries/places/internal/zzaov;->zzd:Lcom/google/android/libraries/places/internal/zzaov;

    .line 24
    .line 25
    sget-object v2, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;->CLOSED_PERMANENTLY:Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zznz;->zzc()Lcom/google/android/libraries/places/internal/zzoa;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzhe;->zzb:Lcom/google/android/libraries/places/internal/zzoa;

    .line 35
    .line 36
    new-instance v0, Lcom/google/android/libraries/places/internal/zznz;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/google/android/libraries/places/internal/zznz;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzl:Lcom/google/android/libraries/places/internal/zzapg;

    .line 42
    .line 43
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->ACCESS:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzg:Lcom/google/android/libraries/places/internal/zzapg;

    .line 49
    .line 50
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->BREAKFAST:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 53
    .line 54
    .line 55
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzj:Lcom/google/android/libraries/places/internal/zzapg;

    .line 56
    .line 57
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->BRUNCH:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 60
    .line 61
    .line 62
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzd:Lcom/google/android/libraries/places/internal/zzapg;

    .line 63
    .line 64
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->DELIVERY:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 67
    .line 68
    .line 69
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzi:Lcom/google/android/libraries/places/internal/zzapg;

    .line 70
    .line 71
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->DINNER:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 74
    .line 75
    .line 76
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzb:Lcom/google/android/libraries/places/internal/zzapg;

    .line 77
    .line 78
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->DRIVE_THROUGH:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 81
    .line 82
    .line 83
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzc:Lcom/google/android/libraries/places/internal/zzapg;

    .line 84
    .line 85
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->HAPPY_HOUR:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 88
    .line 89
    .line 90
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzf:Lcom/google/android/libraries/places/internal/zzapg;

    .line 91
    .line 92
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->KITCHEN:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 93
    .line 94
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 95
    .line 96
    .line 97
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzh:Lcom/google/android/libraries/places/internal/zzapg;

    .line 98
    .line 99
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->LUNCH:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 100
    .line 101
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 102
    .line 103
    .line 104
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzn:Lcom/google/android/libraries/places/internal/zzapg;

    .line 105
    .line 106
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->ONLINE_SERVICE_HOURS:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 109
    .line 110
    .line 111
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzk:Lcom/google/android/libraries/places/internal/zzapg;

    .line 112
    .line 113
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->PICKUP:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 116
    .line 117
    .line 118
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zzm:Lcom/google/android/libraries/places/internal/zzapg;

    .line 119
    .line 120
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->SENIOR_HOURS:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 121
    .line 122
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 123
    .line 124
    .line 125
    sget-object v1, Lcom/google/android/libraries/places/internal/zzapg;->zze:Lcom/google/android/libraries/places/internal/zzapg;

    .line 126
    .line 127
    sget-object v2, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;->TAKEOUT:Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 128
    .line 129
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zznz;->zza(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznz;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zznz;->zzc()Lcom/google/android/libraries/places/internal/zzoa;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzhe;->zzc:Lcom/google/android/libraries/places/internal/zzoa;

    .line 137
    .line 138
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzhe;->zza:Lcom/google/android/libraries/places/internal/zzhh;

    .line 139
    .line 140
    return-void
.end method

.method private final zzb(Lcom/google/android/libraries/places/internal/zzapj;)Lcom/google/android/libraries/places/api/model/OpeningHours;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/api/ApiException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/libraries/places/api/model/OpeningHours;->builder()Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzapj;->zze()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/4 v4, 0x0

    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/google/android/libraries/places/internal/zzape;

    .line 30
    .line 31
    invoke-static {}, Lcom/google/android/libraries/places/api/model/Period;->builder()Lcom/google/android/libraries/places/api/model/Period$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzape;->zzf()Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_0

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzape;->zzc()Lcom/google/android/libraries/places/internal/zzapd;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzhe;->zzj(Lcom/google/android/libraries/places/internal/zzapd;)Lcom/google/android/libraries/places/api/model/TimeOfWeek;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    move-object v6, v4

    .line 51
    :goto_1
    invoke-virtual {v5, v6}, Lcom/google/android/libraries/places/api/model/Period$Builder;->setOpen(Lcom/google/android/libraries/places/api/model/TimeOfWeek;)Lcom/google/android/libraries/places/api/model/Period$Builder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzape;->zze()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    if-eqz v6, :cond_1

    .line 59
    .line 60
    invoke-virtual {v3}, Lcom/google/android/libraries/places/internal/zzape;->zza()Lcom/google/android/libraries/places/internal/zzapd;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Lcom/google/android/libraries/places/internal/zzhe;->zzj(Lcom/google/android/libraries/places/internal/zzapd;)Lcom/google/android/libraries/places/api/model/TimeOfWeek;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    :cond_1
    invoke-virtual {v5, v4}, Lcom/google/android/libraries/places/api/model/Period$Builder;->setClose(Lcom/google/android/libraries/places/api/model/TimeOfWeek;)Lcom/google/android/libraries/places/api/model/Period$Builder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Lcom/google/android/libraries/places/api/model/Period$Builder;->build()Lcom/google/android/libraries/places/api/model/Period;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;->setPeriods(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzapj;->zzg()Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;->setWeekdayText(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzapj;->zza()Lcom/google/android/libraries/places/internal/zzapg;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzhe;->zzc:Lcom/google/android/libraries/places/internal/zzoa;

    .line 94
    .line 95
    invoke-virtual {p0, v1, v4}, Lcom/google/android/libraries/places/internal/zzoa;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;->setHoursType(Lcom/google/android/libraries/places/api/model/OpeningHours$HoursType;)Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzapj;->zzf()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance p1, Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_3

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lcom/google/android/libraries/places/internal/zzapi;

    .line 128
    .line 129
    :try_start_0
    invoke-virtual {v1}, Lcom/google/android/libraries/places/internal/zzapi;->zzc()Lcom/google/android/libraries/places/internal/zzaxm;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzhe;->zzg(Lcom/google/android/libraries/places/internal/zzaxm;)Lcom/google/android/libraries/places/api/model/LocalDate;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {v1}, Lcom/google/android/libraries/places/api/model/SpecialDay;->builder(Lcom/google/android/libraries/places/api/model/LocalDate;)Lcom/google/android/libraries/places/api/model/SpecialDay$Builder;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    const/4 v2, 0x1

    .line 142
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/SpecialDay$Builder;->setExceptional(Z)Lcom/google/android/libraries/places/api/model/SpecialDay$Builder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/google/android/libraries/places/api/model/SpecialDay$Builder;->build()Lcom/google/android/libraries/places/api/model/SpecialDay;

    .line 146
    .line 147
    .line 148
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_2

    .line 153
    :catch_0
    move-exception p0

    .line 154
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    const-string p1, "Special day is not properly defined: %s"

    .line 163
    .line 164
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    throw p0

    .line 173
    :cond_3
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;->setSpecialDays(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0}, Lcom/google/android/libraries/places/api/model/OpeningHours$Builder;->build()Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    return-object p0
.end method

.method private static final zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;
    .locals 3

    .line 1
    const-string v0, "Unexpected server error: "

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/google/android/gms/common/api/ApiException;

    .line 12
    .line 13
    new-instance v1, Lcom/google/android/gms/common/api/Status;

    .line 14
    .line 15
    const/16 v2, 0x8

    .line 16
    .line 17
    invoke-direct {v1, v2, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private static final zzd(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    :cond_0
    return-object p0
.end method

.method private static final zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;->UNKNOWN:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    sget-object p0, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;->TRUE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    sget-object p0, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;->FALSE:Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 12
    .line 13
    return-object p0
.end method

.method private static final zzf(Lcom/google/android/libraries/places/internal/zzaxp;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 5

    .line 1
    new-instance v0, Lcom/google/android/gms/maps/model/LatLng;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaxp;->zzc()D

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaxp;->zze()D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private static final zzg(Lcom/google/android/libraries/places/internal/zzaxm;)Lcom/google/android/libraries/places/api/model/LocalDate;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaxm;->zzf()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaxm;->zze()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzaxm;->zzc()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {v0, v1, p0}, Lcom/google/android/libraries/places/api/model/LocalDate;->newInstance(III)Lcom/google/android/libraries/places/api/model/LocalDate;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private static final zzh(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzsa;

    .line 2
    .line 3
    const-string v1, "a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzsa;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/google/android/libraries/places/internal/zzsc;->zza:I

    .line 9
    .line 10
    sget-object v1, Lcom/google/android/libraries/places/internal/zzsb;->zza:Lcom/google/android/libraries/places/internal/zzsb;

    .line 11
    .line 12
    invoke-static {p0, v1}, Lcom/google/android/libraries/places/internal/zzsc;->zza(Ljava/lang/String;Lcom/google/android/libraries/places/internal/zzsb;)Lcom/google/android/libraries/places/internal/zzsb;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/internal/zzsa;->zzc(Lcom/google/android/libraries/places/internal/zzsb;)Lcom/google/android/libraries/places/internal/zzsa;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/google/android/libraries/places/internal/zzsa;->zzb(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzsa;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzsa;->zza()Lcom/google/android/libraries/places/internal/zzrz;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzrz;->zza()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method private static final zzi(Lcom/google/android/libraries/places/internal/zzalr;)Lcom/google/android/libraries/places/api/model/AuthorAttribution;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/api/ApiException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzalr;->zzd()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/android/libraries/places/api/model/AuthorAttribution;->builder(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzalr;->zzf()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;->setUri(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzalr;->zze()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;->setPhotoUri(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/google/android/libraries/places/api/model/AuthorAttribution$Builder;->build()Lcom/google/android/libraries/places/api/model/AuthorAttribution;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_0
    const-string p0, "Author name not provided for an AuthorAttribution result."

    .line 43
    .line 44
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    throw p0
.end method

.method private static final zzj(Lcom/google/android/libraries/places/internal/zzapd;)Lcom/google/android/libraries/places/api/model/TimeOfWeek;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/api/ApiException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zza()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zzc()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zzd()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v1, v2}, Lcom/google/android/libraries/places/api/model/LocalTime;->newInstance(II)Lcom/google/android/libraries/places/api/model/LocalTime;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zzi()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zzg()Lcom/google/android/libraries/places/internal/zzaxm;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzg(Lcom/google/android/libraries/places/internal/zzaxm;)Lcom/google/android/libraries/places/api/model/LocalDate;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v2, 0x0

    .line 33
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    const-string p0, "Day of week must an integer between 0 and 6"

    .line 37
    .line 38
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    throw p0

    .line 43
    :pswitch_0
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->SATURDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :pswitch_1
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->FRIDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :pswitch_2
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->THURSDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :pswitch_3
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->WEDNESDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :pswitch_4
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->TUESDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :pswitch_5
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->MONDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :pswitch_6
    sget-object v0, Lcom/google/android/libraries/places/api/model/DayOfWeek;->SUNDAY:Lcom/google/android/libraries/places/api/model/DayOfWeek;

    .line 62
    .line 63
    :goto_1
    invoke-static {v0, v1}, Lcom/google/android/libraries/places/api/model/TimeOfWeek;->builder(Lcom/google/android/libraries/places/api/model/DayOfWeek;Lcom/google/android/libraries/places/api/model/LocalTime;)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;->setDate(Lcom/google/android/libraries/places/api/model/LocalDate;)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzapd;->zzh()Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;->setTruncated(Z)Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/google/android/libraries/places/api/model/TimeOfWeek$Builder;->build()Lcom/google/android/libraries/places/api/model/TimeOfWeek;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    nop

    .line 83
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzaps;)Lcom/google/android/libraries/places/api/model/Place;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/common/api/ApiException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 1
    invoke-static {}, Lcom/google/android/libraries/places/api/model/Place;->builder()Lcom/google/android/libraries/places/api/model/Place$Builder;

    move-result-object v1

    .line 2
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzq()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setAddress(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzx()Ljava/util/List;

    move-result-object v2

    .line 4
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    move-object v2, v4

    goto :goto_1

    .line 5
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    .line 6
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 7
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzaoo;

    .line 8
    :try_start_0
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaoo;->zzc()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaoo;->zze()Ljava/util/List;

    move-result-object v7

    .line 9
    invoke-static {v6, v7}, Lcom/google/android/libraries/places/api/model/AddressComponent;->builder(Ljava/lang/String;Ljava/util/List;)Lcom/google/android/libraries/places/api/model/AddressComponent$Builder;

    move-result-object v6

    .line 10
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaoo;->zzd()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/google/android/libraries/places/api/model/AddressComponent$Builder;->setShortName(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/AddressComponent$Builder;

    .line 11
    invoke-virtual {v6}, Lcom/google/android/libraries/places/api/model/AddressComponent$Builder;->build()Lcom/google/android/libraries/places/api/model/AddressComponent;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :catch_0
    move-exception v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "AddressComponent is not properly defined: %s."

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    move-result-object v0

    throw v0

    .line 15
    :cond_1
    invoke-static {v3}, Lcom/google/android/libraries/places/api/model/AddressComponents;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/AddressComponents;

    move-result-object v2

    .line 16
    :goto_1
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setAddressComponents(Lcom/google/android/libraries/places/api/model/AddressComponents;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 17
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzy()Ljava/util/List;

    move-result-object v2

    .line 18
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v5, "https:"

    const-string v6, "//"

    if-eqz v3, :cond_2

    move-object v3, v4

    goto :goto_3

    .line 19
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 21
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/libraries/places/internal/zzaos;

    .line 22
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzaos;->zzd()Ljava/lang/String;

    move-result-object v8

    .line 23
    invoke-virtual {v8, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-virtual {v5, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 24
    :cond_3
    invoke-virtual {v7}, Lcom/google/android/libraries/places/internal/zzaos;->zzc()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Lcom/google/android/libraries/places/internal/zzhe;->zzh(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 25
    :cond_4
    :goto_3
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setAttributions(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 26
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzg()Lcom/google/android/libraries/places/internal/zzaov;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/libraries/places/internal/zzhe;->zzb:Lcom/google/android/libraries/places/internal/zzoa;

    .line 27
    invoke-virtual {v3, v2, v4}, Lcom/google/android/libraries/places/internal/zzoa;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 28
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setBusinessStatus(Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 29
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzP()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzD()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setCurbsidePickup(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 31
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzQ()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzh()Lcom/google/android/libraries/places/internal/zzapj;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzb(Lcom/google/android/libraries/places/internal/zzapj;)Lcom/google/android/libraries/places/api/model/OpeningHours;

    move-result-object v2

    goto :goto_4

    :cond_5
    move-object v2, v4

    .line 32
    :goto_4
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setCurrentOpeningHours(Lcom/google/android/libraries/places/api/model/OpeningHours;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 33
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzR()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzE()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setDelivery(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 34
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzS()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzF()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setDineIn(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 35
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzU()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzp()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzaxs;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_5

    :cond_6
    move-object v2, v4

    .line 36
    :goto_5
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setEditorialSummary(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 37
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzU()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 38
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzp()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzaxs;->zzf()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    :cond_7
    move-object v2, v4

    .line 39
    :goto_6
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setEditorialSummaryLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 40
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzr()Ljava/lang/String;

    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    :catch_1
    move-object v2, v4

    goto :goto_7

    .line 42
    :cond_8
    :try_start_1
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    :goto_7
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setIconBackgroundColor(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 44
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzs()Ljava/lang/String;

    move-result-object v2

    .line 45
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    :cond_9
    move-object v2, v4

    .line 46
    :goto_8
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setIconUrl(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 47
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzt()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setId(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 48
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzV()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzn()Lcom/google/android/libraries/places/internal/zzaxp;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzf(Lcom/google/android/libraries/places/internal/zzaxp;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    goto :goto_9

    :cond_a
    move-object v2, v4

    :goto_9
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setLatLng(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 49
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzT()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzo()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzaxs;->zzg()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    :cond_b
    move-object v2, v4

    :goto_a
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setName(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 50
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzT()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzo()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzaxs;->zzf()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    :cond_c
    move-object v2, v4

    .line 51
    :goto_b
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setNameLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 52
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzX()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzi()Lcom/google/android/libraries/places/internal/zzapj;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzb(Lcom/google/android/libraries/places/internal/zzapj;)Lcom/google/android/libraries/places/api/model/OpeningHours;

    move-result-object v2

    goto :goto_c

    :cond_d
    move-object v2, v4

    .line 53
    :goto_c
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setOpeningHours(Lcom/google/android/libraries/places/api/model/OpeningHours;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 54
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzu()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPhoneNumber(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 55
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzz()Ljava/util/List;

    move-result-object v2

    .line 56
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v7, 0x0

    const/4 v8, 0x3

    const/4 v9, 0x4

    if-eqz v3, :cond_e

    move-object v3, v4

    goto/16 :goto_12

    .line 57
    :cond_e
    new-instance v3, Ljava/util/ArrayList;

    .line 58
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/libraries/places/internal/zzaog;

    .line 60
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zze()Ljava/lang/String;

    move-result-object v11

    .line 61
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_16

    const-string v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    array-length v12, v12

    if-ne v12, v9, :cond_16

    const/16 v12, 0x2f

    .line 62
    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzma;->zzb(C)Lcom/google/android/libraries/places/internal/zzma;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzmy;->zzb(Lcom/google/android/libraries/places/internal/zzma;)Lcom/google/android/libraries/places/internal/zzmy;

    move-result-object v12

    .line 63
    invoke-virtual {v12, v11}, Lcom/google/android/libraries/places/internal/zzmy;->zzd(Ljava/lang/CharSequence;)Ljava/lang/Iterable;

    move-result-object v11

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 64
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v12, v7

    :goto_e
    if-ge v12, v8, :cond_f

    .line 65
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_f

    .line 66
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    add-int/lit8 v12, v12, 0x1

    goto :goto_e

    .line 67
    :cond_f
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_15

    .line 68
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 69
    check-cast v11, Ljava/lang/String;

    .line 70
    invoke-static {v11}, Lcom/google/android/libraries/places/api/model/PhotoMetadata;->builder(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    move-result-object v11

    .line 71
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zze()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    .line 72
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zzf()Ljava/util/List;

    move-result-object v12

    new-instance v13, Ljava/util/ArrayList;

    .line 73
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 74
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_10
    :goto_f
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_12

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/libraries/places/internal/zzalr;

    if-eqz v14, :cond_10

    invoke-virtual {v14}, Lcom/google/android/libraries/places/internal/zzalr;->zzf()Ljava/lang/String;

    move-result-object v15

    .line 75
    invoke-virtual {v15, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_11

    invoke-virtual {v5, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    :cond_11
    invoke-virtual {v14}, Lcom/google/android/libraries/places/internal/zzalr;->zzd()Ljava/lang/String;

    move-result-object v14

    .line 76
    invoke-static {v15, v14}, Lcom/google/android/libraries/places/internal/zzhe;->zzh(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_12
    const-string v12, ", "

    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzmh;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzmh;

    move-result-object v12

    .line 77
    invoke-virtual {v12, v13}, Lcom/google/android/libraries/places/internal/zzmh;->zzf(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v12

    .line 78
    invoke-virtual {v11, v12}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->setAttributions(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    .line 79
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zza()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->setHeight(I)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    .line 80
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zzc()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->setWidth(I)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    .line 81
    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaog;->zzf()Ljava/util/List;

    move-result-object v10

    .line 82
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_13

    move-object v10, v4

    goto :goto_11

    .line 83
    :cond_13
    new-instance v12, Lcom/google/android/libraries/places/internal/zznu;

    invoke-direct {v12}, Lcom/google/android/libraries/places/internal/zznu;-><init>()V

    .line 84
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_10
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_14

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/google/android/libraries/places/internal/zzalr;

    .line 85
    invoke-static {v13}, Lcom/google/android/libraries/places/internal/zzhe;->zzi(Lcom/google/android/libraries/places/internal/zzalr;)Lcom/google/android/libraries/places/api/model/AuthorAttribution;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/google/android/libraries/places/internal/zznu;->zze(Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznu;

    goto :goto_10

    .line 86
    :cond_14
    invoke-virtual {v12}, Lcom/google/android/libraries/places/internal/zznu;->zzg()Lcom/google/android/libraries/places/internal/zznx;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/libraries/places/api/model/AuthorAttributions;->newInstance(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/AuthorAttributions;

    move-result-object v10

    .line 87
    :goto_11
    invoke-virtual {v11, v10}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->setAuthorAttributions(Lcom/google/android/libraries/places/api/model/AuthorAttributions;)Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;

    .line 88
    invoke-virtual {v11}, Lcom/google/android/libraries/places/api/model/PhotoMetadata$Builder;->build()Lcom/google/android/libraries/places/api/model/PhotoMetadata;

    move-result-object v10

    .line 89
    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d

    .line 90
    :cond_15
    const-string v0, "position (3) must be less than the number of elements that remained ("

    .line 91
    const-string v1, ")"

    invoke-static {v0, v12, v1}, Ll/bqg0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    return-object v4

    .line 92
    :cond_16
    const-string v0, "Photo reference not provided for a PhotoMetadata result."

    .line 93
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    move-result-object v0

    throw v0

    .line 94
    :cond_17
    :goto_12
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPhotoMetadatas(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 95
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzC()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_18

    move-object v2, v4

    goto :goto_13

    :cond_18
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzC()Ljava/util/List;

    move-result-object v2

    :goto_13
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPlaceTypes(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 96
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzW()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzj()Lcom/google/android/libraries/places/internal/zzapp;

    move-result-object v2

    invoke-static {}, Lcom/google/android/libraries/places/api/model/PlusCode;->builder()Lcom/google/android/libraries/places/api/model/PlusCode$Builder;

    move-result-object v3

    .line 97
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzapp;->zzd()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/google/android/libraries/places/api/model/PlusCode$Builder;->setCompoundCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/PlusCode$Builder;

    .line 98
    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzapp;->zze()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/google/android/libraries/places/api/model/PlusCode$Builder;->setGlobalCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/PlusCode$Builder;

    invoke-virtual {v3}, Lcom/google/android/libraries/places/api/model/PlusCode$Builder;->build()Lcom/google/android/libraries/places/api/model/PlusCode;

    move-result-object v2

    goto :goto_14

    :cond_19
    move-object v2, v4

    .line 99
    :goto_14
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPlusCode(Lcom/google/android/libraries/places/api/model/PlusCode;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 100
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzm()Lcom/google/android/libraries/places/internal/zzaqb;

    move-result-object v2

    .line 101
    sget-object v3, Lcom/google/android/libraries/places/internal/zzaqb;->zza:Lcom/google/android/libraries/places/internal/zzaqb;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1e

    const/4 v5, 0x2

    if-eq v2, v5, :cond_1d

    if-eq v2, v8, :cond_1c

    if-eq v2, v9, :cond_1b

    const/4 v3, 0x5

    if-eq v2, v3, :cond_1a

    move-object v2, v4

    goto :goto_15

    .line 102
    :cond_1a
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_15

    .line 103
    :cond_1b
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_15

    .line 104
    :cond_1c
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_15

    .line 105
    :cond_1d
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_15

    .line 106
    :cond_1e
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 107
    :goto_15
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPriceLevel(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 108
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzv()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setPrimaryType(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 109
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zza()D

    move-result-wide v2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpg-double v5, v2, v5

    if-gez v5, :cond_1f

    move-object v2, v4

    goto :goto_16

    .line 110
    :cond_1f
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 111
    :goto_16
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setRating(Ljava/lang/Double;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 112
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzY()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzG()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setReservable(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 113
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzB()Ljava/util/List;

    move-result-object v2

    .line 114
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_20

    move-object v3, v4

    goto/16 :goto_1d

    .line 115
    :cond_20
    new-instance v3, Ljava/util/ArrayList;

    .line 116
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 117
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzaqh;

    .line 118
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zza()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_27

    .line 119
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzi()Z

    move-result v8

    if-eqz v8, :cond_26

    .line 120
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzk()Z

    move-result v8

    if-eqz v8, :cond_21

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zze()Lcom/google/android/libraries/places/internal/zzawl;

    move-result-object v8

    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzaxg;->zza(Lcom/google/android/libraries/places/internal/zzawl;)Ljava/lang/String;

    move-result-object v8

    goto :goto_18

    :cond_21
    move-object v8, v4

    .line 121
    :goto_18
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzl()Z

    move-result v9

    if-eqz v9, :cond_22

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzg()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/android/libraries/places/internal/zzaxs;->zzg()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_19

    :cond_22
    move-object v9, v4

    .line 122
    :goto_19
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzl()Z

    move-result v10

    if-eqz v10, :cond_23

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzg()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/android/libraries/places/internal/zzaxs;->zzf()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_1a

    :cond_23
    move-object v10, v4

    .line 123
    :goto_1a
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzj()Z

    move-result v11

    if-eqz v11, :cond_24

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzf()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/android/libraries/places/internal/zzaxs;->zzg()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_1b

    :cond_24
    move-object v11, v4

    .line 124
    :goto_1b
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzj()Z

    move-result v12

    if-eqz v12, :cond_25

    .line 125
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzf()Lcom/google/android/libraries/places/internal/zzaxs;

    move-result-object v12

    invoke-virtual {v12}, Lcom/google/android/libraries/places/internal/zzaxs;->zzf()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    goto :goto_1c

    :cond_25
    move-object v12, v4

    .line 126
    :goto_1c
    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzh()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/google/android/libraries/places/internal/zzhe;->zzd(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 127
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v5}, Lcom/google/android/libraries/places/internal/zzaqh;->zzc()Lcom/google/android/libraries/places/internal/zzalr;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzhe;->zzi(Lcom/google/android/libraries/places/internal/zzalr;)Lcom/google/android/libraries/places/api/model/AuthorAttribution;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/google/android/libraries/places/api/model/Review;->builder(Ljava/lang/Double;Lcom/google/android/libraries/places/api/model/AuthorAttribution;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    move-result-object v5

    .line 128
    invoke-virtual {v5, v8}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setPublishTime(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 129
    invoke-virtual {v5, v9}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setText(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 130
    invoke-virtual {v5, v10}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setTextLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 131
    invoke-virtual {v5, v11}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setOriginalText(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 132
    invoke-virtual {v5, v12}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setOriginalTextLanguageCode(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 133
    invoke-virtual {v5, v13}, Lcom/google/android/libraries/places/api/model/Review$Builder;->setRelativePublishTimeDescription(Ljava/lang/String;)Lcom/google/android/libraries/places/api/model/Review$Builder;

    .line 134
    invoke-virtual {v5}, Lcom/google/android/libraries/places/api/model/Review$Builder;->build()Lcom/google/android/libraries/places/api/model/Review;

    move-result-object v5

    .line 135
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_17

    .line 136
    :cond_26
    const-string v0, "Author attribution not provided for a Review result."

    .line 137
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    move-result-object v0

    throw v0

    .line 138
    :cond_27
    const-string v0, "Review rating not provided for a Review result."

    .line 139
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzhe;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/api/ApiException;

    move-result-object v0

    throw v0

    .line 140
    :cond_28
    :goto_1d
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setReviews(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 141
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzA()Ljava/util/List;

    move-result-object v2

    .line 142
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_29

    move-object v3, v4

    goto :goto_1f

    .line 143
    :cond_29
    new-instance v3, Ljava/util/ArrayList;

    .line 144
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 145
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/libraries/places/internal/zzapj;

    .line 146
    invoke-direct {v0, v5}, Lcom/google/android/libraries/places/internal/zzhe;->zzb(Lcom/google/android/libraries/places/internal/zzapj;)Lcom/google/android/libraries/places/api/model/OpeningHours;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 147
    :cond_2a
    :goto_1f
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setSecondaryOpeningHours(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 148
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzZ()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzH()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesBeer(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 149
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzaa()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzI()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesBreakfast(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 151
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzab()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzJ()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 152
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesBrunch(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 153
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzac()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzK()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 154
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesDinner(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 155
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzad()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzL()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 156
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesLunch(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 157
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzae()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzM()Z

    move-result v3

    .line 158
    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    .line 159
    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesVegetarianFood(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 160
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzaf()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzN()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setServesWine(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 161
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzag()Z

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzO()Z

    move-result v3

    invoke-static {v2, v3}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setTakeout(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzhe;->zza:Lcom/google/android/libraries/places/internal/zzhh;

    .line 162
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzC()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/libraries/places/internal/zzhh;->zza(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setTypes(Ljava/util/List;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 163
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzah()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzc()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_20

    :cond_2b
    move-object v0, v4

    :goto_20
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setUserRatingsTotal(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 164
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzai()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzd()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_21

    :cond_2c
    move-object v0, v4

    :goto_21
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setUtcOffsetMinutes(Ljava/lang/Integer;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 165
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzaj()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zze()Lcom/google/android/libraries/places/internal/zzaki;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzaki;->zzf()Lcom/google/android/libraries/places/internal/zzaxp;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzhe;->zzf(Lcom/google/android/libraries/places/internal/zzaxp;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    .line 167
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzaki;->zze()Lcom/google/android/libraries/places/internal/zzaxp;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzhe;->zzf(Lcom/google/android/libraries/places/internal/zzaxp;)Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    .line 168
    new-instance v3, Lcom/google/android/gms/maps/model/LatLngBounds;

    invoke-direct {v3, v2, v0}, Lcom/google/android/gms/maps/model/LatLngBounds;-><init>(Lcom/google/android/gms/maps/model/LatLng;Lcom/google/android/gms/maps/model/LatLng;)V

    goto :goto_22

    :cond_2d
    move-object v3, v4

    .line 169
    :goto_22
    invoke-virtual {v1, v3}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setViewport(Lcom/google/android/gms/maps/model/LatLngBounds;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 170
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzw()Ljava/lang/String;

    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2e

    .line 172
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 173
    :cond_2e
    invoke-virtual {v1, v4}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setWebsiteUri(Landroid/net/Uri;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 174
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzf()Lcom/google/android/libraries/places/internal/zzaom;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzaom;->zze()Z

    move-result v0

    .line 175
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/libraries/places/internal/zzaps;->zzf()Lcom/google/android/libraries/places/internal/zzaom;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/libraries/places/internal/zzaom;->zzd()Z

    move-result v2

    .line 176
    invoke-static {v0, v2}, Lcom/google/android/libraries/places/internal/zzhe;->zze(ZZ)Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    move-result-object v0

    .line 177
    invoke-virtual {v1, v0}, Lcom/google/android/libraries/places/api/model/Place$Builder;->setWheelchairAccessibleEntrance(Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)Lcom/google/android/libraries/places/api/model/Place$Builder;

    .line 178
    invoke-virtual {v1}, Lcom/google/android/libraries/places/api/model/Place$Builder;->build()Lcom/google/android/libraries/places/api/model/Place;

    move-result-object v0

    return-object v0
.end method
