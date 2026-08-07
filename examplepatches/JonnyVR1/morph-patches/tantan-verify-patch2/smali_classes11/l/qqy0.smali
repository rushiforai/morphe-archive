.class public final synthetic Ll/qqy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/ump/ConsentInformation$a;

.field public final synthetic b:Lcom/google/android/gms/internal/consent_sdk/zzg;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/ump/ConsentInformation$a;Lcom/google/android/gms/internal/consent_sdk/zzg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qqy0;->a:Lcom/google/android/ump/ConsentInformation$a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qqy0;->b:Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qqy0;->a:Lcom/google/android/ump/ConsentInformation$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qqy0;->b:Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Lcom/google/android/ump/ConsentInformation$a;->a(Ll/m1j;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
