.class public Lcom/google/android/gms/ads/internal/client/LiteSdkInfo;
.super Ll/mjt0;
.source "SourceFile"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/mjt0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getAdapterCreator()Ll/uws0;
    .locals 0

    .line 1
    new-instance p0, Ll/qws0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/qws0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getLiteSdkVersion()Lcom/google/android/gms/ads/internal/client/zzen;
    .locals 3

    .line 1
    new-instance p0, Lcom/google/android/gms/ads/internal/client/zzen;

    .line 2
    .line 3
    const v0, 0xe52c23e

    .line 4
    .line 5
    .line 6
    const v1, 0xe52bf80

    .line 7
    .line 8
    .line 9
    const-string v2, "23.0.0"

    .line 10
    .line 11
    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/gms/ads/internal/client/zzen;-><init>(IILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method
