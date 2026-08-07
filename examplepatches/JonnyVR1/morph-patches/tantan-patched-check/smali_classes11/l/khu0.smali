.class public final synthetic Ll/khu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ccu0;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/khu0;->a:Ll/wit0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/khu0;->a:Ll/wit0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->zzb()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
