.class public final synthetic Lcom/google/android/libraries/places/internal/zzgz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zdg0;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzhc;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzhc;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzgz;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzgz;->zza:Lcom/google/android/libraries/places/internal/zzhc;

    check-cast p1, Lcom/google/android/libraries/places/internal/zzarc;

    invoke-virtual {p0, p1}, Lcom/google/android/libraries/places/internal/zzhc;->zzd(Lcom/google/android/libraries/places/internal/zzarc;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method
