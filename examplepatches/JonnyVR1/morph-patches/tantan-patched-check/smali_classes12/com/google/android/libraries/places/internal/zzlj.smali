.class public final synthetic Lcom/google/android/libraries/places/internal/zzlj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzln;

.field public final synthetic zzb:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzln;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzlj;->zza:Lcom/google/android/libraries/places/internal/zzln;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzlj;->zzb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzlj;->zza:Lcom/google/android/libraries/places/internal/zzln;

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzlj;->zzb:Ljava/lang/String;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzln;->zzb(Ljava/lang/String;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
