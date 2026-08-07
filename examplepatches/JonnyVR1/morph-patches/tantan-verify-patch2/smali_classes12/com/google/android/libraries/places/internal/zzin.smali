.class public final synthetic Lcom/google/android/libraries/places/internal/zzin;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zziu;

.field public final synthetic zzb:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zziu;JI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzin;->zza:Lcom/google/android/libraries/places/internal/zziu;

    iput-wide p2, p0, Lcom/google/android/libraries/places/internal/zzin;->zzb:J

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzin;->zza:Lcom/google/android/libraries/places/internal/zziu;

    iget-wide v1, p0, Lcom/google/android/libraries/places/internal/zzin;->zzb:J

    const/4 p0, 0x1

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/google/android/libraries/places/internal/zziu;->zze(JILcom/google/android/gms/tasks/Task;)Lcom/google/android/libraries/places/api/net/FetchPhotoResponse;

    move-result-object p0

    return-object p0
.end method
