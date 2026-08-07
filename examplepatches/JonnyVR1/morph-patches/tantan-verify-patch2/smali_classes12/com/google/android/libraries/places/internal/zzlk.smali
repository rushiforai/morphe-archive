.class public final synthetic Lcom/google/android/libraries/places/internal/zzlk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzln;

.field public final synthetic zzb:Ljava/lang/String;

.field public final synthetic zzc:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzln;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzlk;->zza:Lcom/google/android/libraries/places/internal/zzln;

    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzlk;->zzb:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/libraries/places/internal/zzlk;->zzc:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzlk;->zza:Lcom/google/android/libraries/places/internal/zzln;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzlk;->zzb:Ljava/lang/String;

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzlk;->zzc:I

    invoke-virtual {v0, v1, p0}, Lcom/google/android/libraries/places/internal/zzln;->zzd(Ljava/lang/String;I)V

    return-void
.end method
