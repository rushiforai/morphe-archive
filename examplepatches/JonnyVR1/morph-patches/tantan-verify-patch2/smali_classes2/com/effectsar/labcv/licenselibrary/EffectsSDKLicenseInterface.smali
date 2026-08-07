.class public interface abstract Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface$LICENSE_FUNCTION_NAME;
    }
.end annotation


# virtual methods
.method public abstract clearParams()V
.end method

.method public abstract getLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/effectsar/labcv/licenselibrary/LicenseCallback;",
            ")I"
        }
    .end annotation
.end method

.method public abstract getParam(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract registerHttpProvider(Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;)V
.end method

.method public abstract setParam(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract updateLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/effectsar/labcv/licenselibrary/LicenseCallback;",
            ")I"
        }
    .end annotation
.end method
