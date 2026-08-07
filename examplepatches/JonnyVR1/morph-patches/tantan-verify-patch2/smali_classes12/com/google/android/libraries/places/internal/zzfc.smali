.class public final synthetic Lcom/google/android/libraries/places/internal/zzfc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/volley/d$b;


# instance fields
.field public final synthetic zza:Ll/sni0;

.field public final synthetic zzb:Lcom/google/android/libraries/places/internal/zzhs;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzhs;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzfc;->zzb:Lcom/google/android/libraries/places/internal/zzhs;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzfc;->zza:Ll/sni0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onResponse(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzfc;->zzb:Lcom/google/android/libraries/places/internal/zzhs;

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzfc;->zza:Ll/sni0;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Lcom/google/android/libraries/places/internal/zzfg;->zzc(Lcom/google/android/libraries/places/internal/zzhs;Ll/sni0;Landroid/graphics/Bitmap;)V

    return-void
.end method
