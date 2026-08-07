.class public final synthetic Lcom/google/android/libraries/places/internal/zzew;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/volley/d$b;


# instance fields
.field public final synthetic zza:Lcom/google/android/libraries/places/internal/zzfa;

.field public final synthetic zzb:Ljava/lang/Class;

.field public final synthetic zzc:Ll/sni0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/libraries/places/internal/zzfa;Ljava/lang/Class;Ll/sni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzew;->zza:Lcom/google/android/libraries/places/internal/zzfa;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzew;->zzb:Ljava/lang/Class;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/google/android/libraries/places/internal/zzew;->zzc:Ll/sni0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onResponse(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzew;->zza:Lcom/google/android/libraries/places/internal/zzfa;

    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzew;->zzb:Ljava/lang/Class;

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzew;->zzc:Ll/sni0;

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p0, p1}, Lcom/google/android/libraries/places/internal/zzfa;->zzb(Ljava/lang/Class;Ll/sni0;Lorg/json/JSONObject;)V

    return-void
.end method
