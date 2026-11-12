.class public final Lf6f;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lg6f;


# direct methods
.method public constructor <init>(Lg6f;)V
    .registers 4

    const/16 v0, 0x17

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Ln1;-><init>(BZ)V

    iput-object p1, p0, Lf6f;->c:Lg6f;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-object p0, p0, Lf6f;->c:Lg6f;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lg6f;->c:Z

    iget-object p0, p0, Lg6f;->a:Lvw1;

    new-instance v1, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    const-string v2, ""

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {p0, v1}, Lvw1;->a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)V

    return-void
.end method
