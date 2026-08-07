.class public final Ll/yzy0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/android/billingclient/api/y;)Ll/lqv0;
    .locals 3
    .param p0    # Lcom/android/billingclient/api/y;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/play_billing/b1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/gms/internal/play_billing/b1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/dyy0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/dyy0;-><init>(Lcom/google/android/gms/internal/play_billing/b1;)V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/google/android/gms/internal/play_billing/b1;->b:Ll/dyy0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iput-object v2, v0, Lcom/google/android/gms/internal/play_billing/b1;->a:Ljava/lang/Object;

    .line 18
    .line 19
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/billingclient/api/y;->a(Lcom/google/android/gms/internal/play_billing/b1;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, v0, Lcom/google/android/gms/internal/play_billing/b1;->a:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    return-object v1

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-virtual {v1, p0}, Ll/dyy0;->b(Ljava/lang/Throwable;)Z

    .line 28
    .line 29
    .line 30
    return-object v1
.end method
