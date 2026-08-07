.class public final Ll/uat0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ll/tct0;


# direct methods
.method public constructor <init>(Ll/vat0;Landroid/content/Context;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/uat0;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/uat0;->b:Ll/tct0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/uat0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/uat0;->b:Ll/tct0;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/tct0;->b(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/common/GooglePlayServicesRepairableException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :catch_2
    move-exception v0

    .line 18
    goto :goto_0

    .line 19
    :catch_3
    move-exception v0

    .line 20
    :goto_0
    iget-object p0, p0, Ll/uat0;->b:Ll/tct0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 23
    .line 24
    .line 25
    const-string p0, "Exception while getting advertising Id info"

    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
