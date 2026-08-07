.class public final Ll/eyw0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/google/android/gms/internal/ads/e5;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final b:Lcom/google/android/gms/internal/ads/e5;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final c:Lcom/google/android/gms/internal/ads/e5;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/e5;->M()Lcom/google/android/gms/internal/ads/e5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/eyw0;->a:Lcom/google/android/gms/internal/ads/e5;

    .line 6
    .line 7
    sput-object v0, Ll/eyw0;->b:Lcom/google/android/gms/internal/ads/e5;

    .line 8
    .line 9
    sput-object v0, Ll/eyw0;->c:Lcom/google/android/gms/internal/ads/e5;

    .line 10
    .line 11
    :try_start_0
    invoke-static {}, Ll/eyw0;->a()V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    throw v1
.end method

.method public static a()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/jyw0;->b()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/l9x0;->a()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {v0}, Ll/ryw0;->a(Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/j0x0;->a(Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/t4x0;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {v0}, Ll/mzw0;->a(Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/w0x0;->a(Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/p1x0;->a(Z)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/z1x0;->a(Z)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/d2x0;->a(Z)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/m3x0;->a(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
