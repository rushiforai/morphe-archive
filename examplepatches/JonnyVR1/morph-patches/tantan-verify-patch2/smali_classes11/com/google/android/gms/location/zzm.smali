.class public final Lcom/google/android/gms/location/zzm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final zza:Lcom/google/android/gms/common/Feature;

.field public static final zzb:Lcom/google/android/gms/common/Feature;

.field public static final zzc:Lcom/google/android/gms/common/Feature;

.field public static final zzd:Lcom/google/android/gms/common/Feature;

.field public static final zze:Lcom/google/android/gms/common/Feature;

.field public static final zzf:Lcom/google/android/gms/common/Feature;

.field public static final zzg:Lcom/google/android/gms/common/Feature;

.field public static final zzh:Lcom/google/android/gms/common/Feature;

.field public static final zzi:Lcom/google/android/gms/common/Feature;

.field public static final zzj:Lcom/google/android/gms/common/Feature;

.field public static final zzk:Lcom/google/android/gms/common/Feature;

.field public static final zzl:[Lcom/google/android/gms/common/Feature;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 2
    .line 3
    const-string v1, "name_ulr_private"

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/google/android/gms/location/zzm;->zza:Lcom/google/android/gms/common/Feature;

    .line 11
    .line 12
    new-instance v1, Lcom/google/android/gms/common/Feature;

    .line 13
    .line 14
    const-string v4, "name_sleep_segment_request"

    .line 15
    .line 16
    invoke-direct {v1, v4, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/google/android/gms/location/zzm;->zzb:Lcom/google/android/gms/common/Feature;

    .line 20
    .line 21
    move-wide v3, v2

    .line 22
    new-instance v2, Lcom/google/android/gms/common/Feature;

    .line 23
    .line 24
    const-string v5, "get_last_activity_feature_id"

    .line 25
    .line 26
    invoke-direct {v2, v5, v3, v4}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/google/android/gms/location/zzm;->zzc:Lcom/google/android/gms/common/Feature;

    .line 30
    .line 31
    move-wide v4, v3

    .line 32
    new-instance v3, Lcom/google/android/gms/common/Feature;

    .line 33
    .line 34
    const-string v6, "support_context_feature_id"

    .line 35
    .line 36
    invoke-direct {v3, v6, v4, v5}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/google/android/gms/location/zzm;->zzd:Lcom/google/android/gms/common/Feature;

    .line 40
    .line 41
    move-wide v5, v4

    .line 42
    new-instance v4, Lcom/google/android/gms/common/Feature;

    .line 43
    .line 44
    const-string v7, "get_current_location"

    .line 45
    .line 46
    const-wide/16 v8, 0x2

    .line 47
    .line 48
    invoke-direct {v4, v7, v8, v9}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 49
    .line 50
    .line 51
    sput-object v4, Lcom/google/android/gms/location/zzm;->zze:Lcom/google/android/gms/common/Feature;

    .line 52
    .line 53
    move-wide v6, v5

    .line 54
    new-instance v5, Lcom/google/android/gms/common/Feature;

    .line 55
    .line 56
    const-string v8, "get_last_location_with_request"

    .line 57
    .line 58
    invoke-direct {v5, v8, v6, v7}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 59
    .line 60
    .line 61
    sput-object v5, Lcom/google/android/gms/location/zzm;->zzf:Lcom/google/android/gms/common/Feature;

    .line 62
    .line 63
    move-wide v7, v6

    .line 64
    new-instance v6, Lcom/google/android/gms/common/Feature;

    .line 65
    .line 66
    const-string v9, "set_mock_mode_with_callback"

    .line 67
    .line 68
    invoke-direct {v6, v9, v7, v8}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lcom/google/android/gms/location/zzm;->zzg:Lcom/google/android/gms/common/Feature;

    .line 72
    .line 73
    move-wide v8, v7

    .line 74
    new-instance v7, Lcom/google/android/gms/common/Feature;

    .line 75
    .line 76
    const-string v10, "set_mock_location_with_callback"

    .line 77
    .line 78
    invoke-direct {v7, v10, v8, v9}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lcom/google/android/gms/location/zzm;->zzh:Lcom/google/android/gms/common/Feature;

    .line 82
    .line 83
    move-wide v9, v8

    .line 84
    new-instance v8, Lcom/google/android/gms/common/Feature;

    .line 85
    .line 86
    const-string v11, "inject_location_with_callback"

    .line 87
    .line 88
    invoke-direct {v8, v11, v9, v10}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 89
    .line 90
    .line 91
    sput-object v8, Lcom/google/android/gms/location/zzm;->zzi:Lcom/google/android/gms/common/Feature;

    .line 92
    .line 93
    move-wide v10, v9

    .line 94
    new-instance v9, Lcom/google/android/gms/common/Feature;

    .line 95
    .line 96
    const-string v12, "location_updates_with_callback"

    .line 97
    .line 98
    invoke-direct {v9, v12, v10, v11}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/google/android/gms/location/zzm;->zzj:Lcom/google/android/gms/common/Feature;

    .line 102
    .line 103
    move-wide v11, v10

    .line 104
    new-instance v10, Lcom/google/android/gms/common/Feature;

    .line 105
    .line 106
    const-string v13, "use_safe_parcelable_in_intents"

    .line 107
    .line 108
    invoke-direct {v10, v13, v11, v12}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    .line 109
    .line 110
    .line 111
    sput-object v10, Lcom/google/android/gms/location/zzm;->zzk:Lcom/google/android/gms/common/Feature;

    .line 112
    .line 113
    filled-new-array/range {v0 .. v10}, [Lcom/google/android/gms/common/Feature;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sput-object v0, Lcom/google/android/gms/location/zzm;->zzl:[Lcom/google/android/gms/common/Feature;

    .line 118
    .line 119
    return-void
.end method
