.class public final synthetic Lcom/google/android/libraries/places/internal/zzgp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzhc;

.field public final synthetic zzb:Lcom/google/android/libraries/places/api/net/SearchByTextRequest;

.field public final synthetic zzc:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzhc;Lcom/google/android/libraries/places/api/net/SearchByTextRequest;JI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzgp;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzgp;->zzb:Lcom/google/android/libraries/places/api/net/SearchByTextRequest;

    iput-wide p3, p0, Lcom/google/android/libraries/places/internal/zzgp;->zzc:J

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 6

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzgp;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzgp;->zzb:Lcom/google/android/libraries/places/api/net/SearchByTextRequest;

    iget-wide v2, p0, Lcom/google/android/libraries/places/internal/zzgp;->zzc:J

    const/4 v4, 0x1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/libraries/places/internal/zzhc;->zzk(Lcom/google/android/libraries/places/api/net/SearchByTextRequest;JILcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    return-object v5
.end method
