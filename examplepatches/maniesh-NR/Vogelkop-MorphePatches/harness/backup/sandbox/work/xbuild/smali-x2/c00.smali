.class public final Lc00;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "advertising_id"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_1e

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lc00;->a:Ljava/lang/String;

    const-string v0, "limit_ad_tracking"

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lc00;->b:Z

    iput-boolean v3, p0, Lc00;->c:Z

    return-void

    :cond_1e
    iput-object v2, p0, Lc00;->a:Ljava/lang/String;

    iput-boolean v3, p0, Lc00;->b:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lc00;->c:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lc00;->a:Ljava/lang/String;

    .line 40
    iput-boolean p2, p0, Lc00;->b:Z

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lc00;->c:Z

    return-void
.end method

.method public static a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)Lc00;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    new-instance v0, Lc00;

    invoke-virtual {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result p0

    invoke-direct {v0, v1, p0}, Lc00;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method
