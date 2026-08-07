.class public Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface;


# static fields
.field static mLoadLib:Z


# instance fields
.field private _provider:Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;

.field private mNativeWrapperPtr:J


# direct methods
.method public constructor <init>(Ljava/util/HashMap;Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->_provider:Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->mNativeWrapperPtr:J

    .line 10
    .line 11
    sget-boolean v0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->mLoadLib:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->loadLib()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    sput-boolean v0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->mLoadLib:Z

    .line 20
    .line 21
    :cond_0
    iput-object p2, p0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->_provider:Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;

    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeGetInstanceWithParam(Ljava/util/HashMap;)I

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static checkLicense(Ljava/lang/String;Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface$LICENSE_FUNCTION_NAME;Z)I
    .locals 0

    .line 14
    invoke-virtual {p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface$LICENSE_FUNCTION_NAME;->getValue()I

    move-result p1

    invoke-static {p0, p1, p2}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeCheckLicense(Ljava/lang/String;IZ)I

    move-result p0

    return p0
.end method

.method public static checkLicense(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface$LICENSE_FUNCTION_NAME;Z)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseInterface$LICENSE_FUNCTION_NAME;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p0, v0, p1, p2}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeCheckLicense(Ljava/nio/ByteBuffer;IIZ)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static checkLicenseBase(Ljava/lang/String;Z)I
    .locals 0

    .line 10
    invoke-static {p0, p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeCheckLicenseBase(Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public static checkLicenseBase(Ljava/nio/ByteBuffer;Z)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0, p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeCheckLicenseBase(Ljava/nio/ByteBuffer;IZ)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static loadLib()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsatisfiedLinkError;
        }
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 7
    .line 8
    const-string v1, "licenseWrapper_jni: library load!"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception v0

    .line 15
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 16
    .line 17
    const-string v2, "WARNING: licenseWrapper_jni Could not load library in default path!"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private static native nativeCheckLicense(Ljava/lang/String;IZ)I
.end method

.method private static native nativeCheckLicense(Ljava/nio/ByteBuffer;IIZ)I
.end method

.method private static native nativeCheckLicenseBase(Ljava/lang/String;Z)I
.end method

.method private static native nativeCheckLicenseBase(Ljava/nio/ByteBuffer;IZ)I
.end method

.method private native nativeClearParams()V
.end method

.method private native nativeGetInstanceWithParam(Ljava/util/HashMap;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation
.end method

.method private native nativeGetLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
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

.method private native nativeGetParam(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native nativeSetDeviceIdType(I)V
.end method

.method private native nativeSetParam(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method private native nativeUpdateLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
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


# virtual methods
.method public clearParams()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeClearParams()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
    .locals 0
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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeGetLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getParam(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeGetParam(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public registerHttpProvider(Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->_provider:Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;

    .line 2
    .line 3
    return-void
.end method

.method public setParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeSetParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I
    .locals 0
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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/licenselibrary/EffectsSDKLicenseWrapper;->nativeUpdateLicenseWithParams(Ljava/util/HashMap;ZLcom/effectsar/labcv/licenselibrary/LicenseCallback;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
