.class public final Ld00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfd2;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lab;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lab;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ld00;->a:Landroid/content/Context;

    iput-object p2, p0, Ld00;->b:Lab;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Ld00;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_c

    return-object v0

    :cond_c
    const/4 p1, 0x0

    :goto_d
    const/4 v1, 0x2

    if-gt p1, v1, :cond_1c

    :try_start_10
    invoke-static {p0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v1

    invoke-static {v1}, Lc00;->a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)Lc00;

    move-result-object v0
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_18} :catch_19
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_10 .. :try_end_18} :catch_1c
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_10 .. :try_end_18} :catch_1c
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_18} :catch_1c

    goto :goto_1c

    :catch_19
    add-int/lit8 p1, p1, 0x1

    goto :goto_d

    :catch_1c
    :cond_1c
    :goto_1c
    return-object v0
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lc00;

    iget-object p0, p0, Ld00;->b:Lab;

    invoke-virtual {p0, p1}, Lab;->run(Ljava/lang/Object;)V

    return-void
.end method
