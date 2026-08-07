.class public final synthetic Lcom/google/android/libraries/places/widget/internal/ui/zzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/widget/internal/ui/zzt;

.field public final synthetic zzb:Lcom/google/android/libraries/places/widget/internal/ui/zzd;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/widget/internal/ui/zzt;Lcom/google/android/libraries/places/widget/internal/ui/zzd;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/widget/internal/ui/zzs;->zza:Lcom/google/android/libraries/places/widget/internal/ui/zzt;

    iput-object p2, p0, Lcom/google/android/libraries/places/widget/internal/ui/zzs;->zzb:Lcom/google/android/libraries/places/widget/internal/ui/zzd;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/libraries/places/widget/internal/ui/zzs;->zza:Lcom/google/android/libraries/places/widget/internal/ui/zzt;

    iget-object p0, p0, Lcom/google/android/libraries/places/widget/internal/ui/zzs;->zzb:Lcom/google/android/libraries/places/widget/internal/ui/zzd;

    invoke-virtual {v0, p0, p1}, Lcom/google/android/libraries/places/widget/internal/ui/zzt;->zzc(Lcom/google/android/libraries/places/widget/internal/ui/zzd;Landroid/view/View;)V

    return-void
.end method
