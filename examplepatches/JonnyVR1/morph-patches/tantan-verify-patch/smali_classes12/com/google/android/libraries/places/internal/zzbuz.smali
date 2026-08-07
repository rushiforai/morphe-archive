.class final Lcom/google/android/libraries/places/internal/zzbuz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzayp;


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzbcf;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzbcf;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbuz;->zza:Lcom/google/android/libraries/places/internal/zzbcf;

    return-void
.end method

.method public static bridge synthetic zzb(Lcom/google/android/libraries/places/internal/zzbuz;)Lcom/google/android/libraries/places/internal/zzbcf;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbuz;->zza:Lcom/google/android/libraries/places/internal/zzbcf;

    return-object p0
.end method


# virtual methods
.method public final zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;Lcom/google/android/libraries/places/internal/zzayk;)Lcom/google/android/libraries/places/internal/zzayo;
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbuy;

    .line 2
    .line 3
    invoke-virtual {p3, p1, p2}, Lcom/google/android/libraries/places/internal/zzayk;->zza(Lcom/google/android/libraries/places/internal/zzbcl;Lcom/google/android/libraries/places/internal/zzayj;)Lcom/google/android/libraries/places/internal/zzayo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzbuy;-><init>(Lcom/google/android/libraries/places/internal/zzbuz;Lcom/google/android/libraries/places/internal/zzayo;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
