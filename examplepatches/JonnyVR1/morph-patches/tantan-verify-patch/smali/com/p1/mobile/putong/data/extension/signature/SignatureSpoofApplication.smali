.class public Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;
.super Landroid/content/ContentProvider;
.source "SignatureSpoofApplication.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;
    }
.end annotation


# static fields
.field private static final GET_SIGNATURES:I = 0x40

.field private static final GET_SIGNING_CERTIFICATES:I = 0x8000000

.field private static final ORIGINAL_SIGNATURE_BASE64:Ljava/lang/String; = "MIIDazCCAlOgAwIBAgIEXrmQTjANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJjbjEQMA4GA1UECBMHYmVpamluZzEQMA4GA1UEBxMHYmVpamluZzEPMA0GA1UEChMGemhpd2VuMQ8wDQYDVQQLEwZ6aGl3ZW4xEDAOBgNVBAMTB3R0dHJpYmUwIBcNMjQwODE1MDgzNTI1WhgPMjA1MjAxMDEwODM1MjVaMGUxCzAJBgNVBAYTAmNuMRAwDgYDVQQIEwdiZWlqaW5nMRAwDgYDVQQHEwdiZWlqaW5nMQ8wDQYDVQQKEwZ6aGl3ZW4xDzANBgNVBAsTBnpoaXdlbjEQMA4GA1UEAxMHdHR0cmliZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ6EeV5CPv7COn6Gm2HUnBi+8WZShy7FrIV3vJ+nI6xHrDLJ18Gh9vwtpvh+rALBK2JYnj8QJJMIEO1+JGQydBgfv17dbNTkaNv6Vd2RcjY5yRDSGyhzByERoTFq+m23UohzGqa+WNG6tWisEj6ugJKPTxn63EyWDydh8E2e+vBa+9ueraGBXyqo2Ekmze07r4tR5hpZK1aC1E/tjzAxa7du7zchyBsoaq4iXP/wNcebpFXe1hr38VSdpNVwG+kxAX9rhIXS7xy5uI6i9DrdM7/p3lRueIEAQ1srr0F60U9Tr7BdKWXlXTPyFrsV9TwpQz9ZWlrxTPuzSOhM2Swe7DECAwEAAaMhMB8wHQYDVR0OBBYEFMNag9W+nIOM8axzW+BdqHzevHAVMA0GCSqGSIb3DQEBCwUAA4IBAQAdayAZ6iWLFENHngbnFZrHJncwhYTuACIQw+4Uvl0EuaP3wO5gHOjPf83jLCmnDNWpDY+QeC3qIAyorm9xxAkOp2LsL3JVpZPQkLseb1VgtT4kCZWs50FFZ4iQyx4v+uzzTPMXDpV8dwwrkj3p1OvmZKG3R+n+5o0GY5p0mzO+NiYRZcdnaAVQ7YjC7p02GtkuIcFapN0CE3aXOVh89gAo07GxrqHSmQ35RpV6gY05Eij3wIQIQbf+Hg4FQ0g/LsWyidtMTY08DnD+Rwz1JoQ9fqe1bTzMkbRV65R/uNJUYp9Q0ci2NKoPn9ktHpnOZVVpC90Vl4bLiT8Nr/D6uu0s"

.field private static final TAG:Ljava/lang/String; = "SignatureSpoof"

.field private static volatile initialized:Z


# instance fields
.field private originalPackageManager:Ljava/lang/Object;

.field private packageName:Ljava/lang/String;

.field private spoofedSignature:Landroid/content/pm/Signature;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private static clearPackageManagerCachesStatic()V
    .locals 8

    .line 160
    const-string v0, "SignatureSpoof"

    :try_start_0
    const-class v1, Landroid/content/pm/PackageManager;

    const-string v2, "sPackageInfoCache"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v3, 0x0

    .line 162
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 164
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "clear"

    const/4 v6, 0x0

    new-array v7, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 165
    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 169
    :cond_0
    :try_start_1
    const-class v1, Landroid/os/Parcel;

    const-string v4, "mCreators"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 170
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 171
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_1

    .line 172
    invoke-interface {v1}, Ljava/util/Map;->clear()V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 174
    :catch_0
    :try_start_2
    const-string v1, "Parcel.mCreators not found (removed in this Android version)"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 178
    :cond_1
    :goto_0
    :try_start_3
    const-class v1, Landroid/os/Parcel;

    const-string v4, "sPairedCreators"

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 180
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-eqz v1, :cond_2

    .line 181
    invoke-interface {v1}, Ljava/util/Map;->clear()V
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 183
    :catch_1
    :try_start_4
    const-string v1, "Parcel.sPairedCreators not found (removed in this Android version)"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    :cond_2
    :goto_1
    const-string v1, "PackageManager caches cleared (static)"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 188
    const-string v2, "Failed to clear PackageManager caches (static)"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    return-void
.end method

.method private static hookPackageManagerStatic(Landroid/content/Context;Landroid/content/pm/Signature;Ljava/lang/String;)V
    .locals 9

    .line 125
    const-string v0, "SignatureSpoof"

    :try_start_0
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 126
    const-string v2, "currentActivityThread"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x1

    .line 127
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 128
    new-array v5, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 130
    const-string v5, "sPackageManager"

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 131
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 134
    const-string v6, "android.content.pm.IPackageManager"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 136
    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    new-array v8, v4, [Ljava/lang/Class;

    aput-object v6, v8, v3

    new-instance v3, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;

    invoke-direct {v3, v5, p1, p2}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;-><init>(Ljava/lang/Object;Landroid/content/pm/Signature;Ljava/lang/String;)V

    .line 135
    invoke-static {v7, v8, v3}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p1

    .line 141
    invoke-virtual {v1, v2, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 145
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    const-string v1, "mPM"

    invoke-virtual {p2, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p2

    .line 146
    invoke-virtual {p2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 147
    invoke-virtual {p2, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 149
    :catch_0
    :try_start_2
    const-string p0, "mPM field not found (may be OK on this Android version)"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :goto_0
    const-string p0, "PackageManager hooked successfully (static)"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    .line 154
    const-string p1, "Failed to hook PackageManager (static)"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 5

    .line 72
    const-string v0, "SignatureSpoof"

    .line 0
    const-string v1, "Initializing signature spoof for package: "

    .line 72
    sget-boolean v2, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialized:Z

    if-eqz v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x1

    .line 73
    sput-boolean v2, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialized:Z

    .line 76
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    new-instance v1, Landroid/content/pm/Signature;

    const-string v3, "MIIDazCCAlOgAwIBAgIEXrmQTjANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJjbjEQMA4GA1UECBMHYmVpamluZzEQMA4GA1UEBxMHYmVpamluZzEPMA0GA1UEChMGemhpd2VuMQ8wDQYDVQQLEwZ6aGl3ZW4xEDAOBgNVBAMTB3R0dHJpYmUwIBcNMjQwODE1MDgzNTI1WhgPMjA1MjAxMDEwODM1MjVaMGUxCzAJBgNVBAYTAmNuMRAwDgYDVQQIEwdiZWlqaW5nMRAwDgYDVQQHEwdiZWlqaW5nMQ8wDQYDVQQKEwZ6aGl3ZW4xDzANBgNVBAsTBnpoaXdlbjEQMA4GA1UEAxMHdHR0cmliZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ6EeV5CPv7COn6Gm2HUnBi+8WZShy7FrIV3vJ+nI6xHrDLJ18Gh9vwtpvh+rALBK2JYnj8QJJMIEO1+JGQydBgfv17dbNTkaNv6Vd2RcjY5yRDSGyhzByERoTFq+m23UohzGqa+WNG6tWisEj6ugJKPTxn63EyWDydh8E2e+vBa+9ueraGBXyqo2Ekmze07r4tR5hpZK1aC1E/tjzAxa7du7zchyBsoaq4iXP/wNcebpFXe1hr38VSdpNVwG+kxAX9rhIXS7xy5uI6i9DrdM7/p3lRueIEAQ1srr0F60U9Tr7BdKWXlXTPyFrsV9TwpQz9ZWlrxTPuzSOhM2Swe7DECAwEAAaMhMB8wHQYDVR0OBBYEFMNag9W+nIOM8axzW+BdqHzevHAVMA0GCSqGSIb3DQEBCwUAA4IBAQAdayAZ6iWLFENHngbnFZrHJncwhYTuACIQw+4Uvl0EuaP3wO5gHOjPf83jLCmnDNWpDY+QeC3qIAyorm9xxAkOp2LsL3JVpZPQkLseb1VgtT4kCZWs50FFZ4iQyx4v+uzzTPMXDpV8dwwrkj3p1OvmZKG3R+n+5o0GY5p0mzO+NiYRZcdnaAVQ7YjC7p02GtkuIcFapN0CE3aXOVh89gAo07GxrqHSmQ35RpV6gY05Eij3wIQIQbf+Hg4FQ0g/LsWyidtMTY08DnD+Rwz1JoQ9fqe1bTzMkbRV65R/uNJUYp9Q0ci2NKoPn9ktHpnOZVVpC90Vl4bLiT8Nr/D6uu0s"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/content/pm/Signature;-><init>([B)V

    .line 80
    invoke-static {p0, v1, v2}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->hookPackageManagerStatic(Landroid/content/Context;Landroid/content/pm/Signature;Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->clearPackageManagerCachesStatic()V

    .line 83
    const-string p0, "Signature spoof initialized successfully via static method"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 85
    const-string v1, "Failed to initialize signature spoof via static method"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onCreate()Z
    .locals 6

    const-string v0, "Initializing signature spoof via ContentProvider for package: "

    .line 93
    sget-boolean v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialized:Z

    const/4 v2, 0x1

    const-string v3, "SignatureSpoof"

    if-eqz v1, :cond_0

    .line 94
    const-string p0, "Signature spoof already initialized, skipping ContentProvider onCreate"

    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 98
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v4, 0x0

    if-nez v1, :cond_1

    .line 100
    const-string p0, "Context is null, cannot initialize signature spoof"

    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    .line 105
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->packageName:Ljava/lang/String;

    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    new-instance v0, Landroid/content/pm/Signature;

    const-string v5, "MIIDazCCAlOgAwIBAgIEXrmQTjANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJjbjEQMA4GA1UECBMHYmVpamluZzEQMA4GA1UEBxMHYmVpamluZzEPMA0GA1UEChMGemhpd2VuMQ8wDQYDVQQLEwZ6aGl3ZW4xEDAOBgNVBAMTB3R0dHJpYmUwIBcNMjQwODE1MDgzNTI1WhgPMjA1MjAxMDEwODM1MjVaMGUxCzAJBgNVBAYTAmNuMRAwDgYDVQQIEwdiZWlqaW5nMRAwDgYDVQQHEwdiZWlqaW5nMQ8wDQYDVQQKEwZ6aGl3ZW4xDzANBgNVBAsTBnpoaXdlbjEQMA4GA1UEAxMHdHR0cmliZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ6EeV5CPv7COn6Gm2HUnBi+8WZShy7FrIV3vJ+nI6xHrDLJ18Gh9vwtpvh+rALBK2JYnj8QJJMIEO1+JGQydBgfv17dbNTkaNv6Vd2RcjY5yRDSGyhzByERoTFq+m23UohzGqa+WNG6tWisEj6ugJKPTxn63EyWDydh8E2e+vBa+9ueraGBXyqo2Ekmze07r4tR5hpZK1aC1E/tjzAxa7du7zchyBsoaq4iXP/wNcebpFXe1hr38VSdpNVwG+kxAX9rhIXS7xy5uI6i9DrdM7/p3lRueIEAQ1srr0F60U9Tr7BdKWXlXTPyFrsV9TwpQz9ZWlrxTPuzSOhM2Swe7DECAwEAAaMhMB8wHQYDVR0OBBYEFMNag9W+nIOM8axzW+BdqHzevHAVMA0GCSqGSIb3DQEBCwUAA4IBAQAdayAZ6iWLFENHngbnFZrHJncwhYTuACIQw+4Uvl0EuaP3wO5gHOjPf83jLCmnDNWpDY+QeC3qIAyorm9xxAkOp2LsL3JVpZPQkLseb1VgtT4kCZWs50FFZ4iQyx4v+uzzTPMXDpV8dwwrkj3p1OvmZKG3R+n+5o0GY5p0mzO+NiYRZcdnaAVQ7YjC7p02GtkuIcFapN0CE3aXOVh89gAo07GxrqHSmQ35RpV6gY05Eij3wIQIQbf+Hg4FQ0g/LsWyidtMTY08DnD+Rwz1JoQ9fqe1bTzMkbRV65R/uNJUYp9Q0ci2NKoPn9ktHpnOZVVpC90Vl4bLiT8Nr/D6uu0s"

    invoke-static {v5, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v5

    invoke-direct {v0, v5}, Landroid/content/pm/Signature;-><init>([B)V

    iput-object v0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->spoofedSignature:Landroid/content/pm/Signature;

    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->packageName:Ljava/lang/String;

    invoke-static {v1, v0, p0}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->hookPackageManagerStatic(Landroid/content/Context;Landroid/content/pm/Signature;Ljava/lang/String;)V

    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->clearPackageManagerCachesStatic()V

    .line 112
    sput-boolean v2, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;->initialized:Z

    .line 113
    const-string p0, "Signature spoof initialized successfully via ContentProvider"

    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    move-exception p0

    .line 116
    const-string v0, "Failed to initialize signature spoof via ContentProvider"

    invoke-static {v3, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v4
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
