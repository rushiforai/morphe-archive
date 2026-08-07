.class Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;
.super Ljava/lang/Object;
.source "SignatureSpoofApplication.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StaticInvocationHandler"
.end annotation


# instance fields
.field private final originalPackageManager:Ljava/lang/Object;

.field private final packageName:Ljava/lang/String;

.field private final spoofedSignature:Landroid/content/pm/Signature;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/content/pm/Signature;Ljava/lang/String;)V
    .locals 0

    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    iput-object p1, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->originalPackageManager:Ljava/lang/Object;

    .line 202
    iput-object p2, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    .line 203
    iput-object p3, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->packageName:Ljava/lang/String;

    return-void
.end method

.method private createSpoofedSigningCertificateHistory()Ljava/lang/Object;
    .locals 5

    .line 459
    :try_start_0
    const-string v0, "android.content.pm.SigningCertificateHistory"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    .line 460
    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 463
    const-string v3, "signingCerts"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v3, 0x1

    .line 464
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 465
    new-array v4, v3, [Landroid/content/pm/Signature;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object p0, v4, v1

    invoke-virtual {v0, v2, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 468
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 469
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 472
    const-string v0, "android.content.pm.ParceledListSlice"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 473
    new-array v2, v3, [Ljava/lang/Class;

    const-class v3, Ljava/util/List;

    aput-object v3, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 475
    const-string v0, "SignatureSpoof"

    const-string v1, "Failed to create spoofed signing certificate history"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private spoofPackageInfo(Landroid/content/pm/PackageInfo;)V
    .locals 5

    .line 285
    const-string v0, "SignatureSpoof"

    const/4 v1, 0x1

    new-array v2, v1, [Landroid/content/pm/Signature;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object v4, v2, v3

    iput-object v2, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 288
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_4

    .line 290
    :try_start_0
    const-class v2, Landroid/content/pm/PackageInfo;

    const-string v3, "signingInfo"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 291
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 292
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 296
    invoke-direct {p0, p1, v2}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->tryCreateNewSigningInfo(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 302
    :cond_0
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->tryModifySigningInfoFields(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 307
    :cond_1
    invoke-direct {p0, p1, v2}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->tryCreateSigningInfoViaCreator(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 312
    :cond_2
    invoke-direct {p0, p1, v2}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->trySetSigningInfoToNull(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_0

    .line 316
    :cond_3
    const-string p0, "All strategies to spoof SigningInfo failed"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 319
    const-string p1, "Failed to update SigningInfo"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4
    :goto_0
    return-void
.end method

.method private tryCreateNewSigningInfo(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z
    .locals 8

    .line 327
    const-string v0, "SignatureSpoof"

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "android.content.pm.SigningInfo"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 332
    :try_start_1
    new-array v5, v3, [Ljava/lang/Class;

    const-class v6, [Landroid/content/pm/Signature;

    aput-object v6, v5, v1

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 333
    invoke-virtual {v5, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 334
    new-array v6, v3, [Landroid/content/pm/Signature;

    iget-object v7, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object v7, v6, v1

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 335
    const-string v5, "Created new SigningInfo with single-signature constructor"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    :catch_0
    const/4 v5, 0x2

    .line 339
    :try_start_2
    new-array v5, v5, [Ljava/lang/Class;

    const-class v6, [Landroid/content/pm/Signature;

    aput-object v6, v5, v1

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 340
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 341
    new-array v5, v3, [Landroid/content/pm/Signature;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object p0, v5, v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    filled-new-array {v5, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 342
    const-string p0, "Created new SigningInfo with two-arg constructor"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 345
    :catch_1
    :try_start_3
    const-string p0, "No standard SigningInfo constructors found, trying field enumeration"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    if-eqz v4, :cond_0

    .line 350
    invoke-virtual {p2, p1, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    return v3

    :catch_2
    move-exception p0

    .line 354
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Strategy 1 (new SigningInfo) failed: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v1
.end method

.method private tryCreateSigningInfoViaCreator(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z
    .locals 8

    .line 400
    const-string v0, "SignatureSpoof"

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "android.content.pm.SigningInfo"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 403
    const-string v3, "CREATOR"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x1

    .line 404
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v4, 0x0

    .line 405
    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 408
    const-string p0, "Strategy 3: CREATOR field is null"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 413
    :cond_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    :try_start_1
    new-array v5, v3, [Landroid/content/pm/Signature;

    iget-object p0, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object p0, v5, v1

    invoke-virtual {v4, v5}, Landroid/os/Parcel;->writeArray([Ljava/lang/Object;)V

    .line 418
    invoke-virtual {v4, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 420
    invoke-virtual {v4, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 423
    invoke-virtual {v4, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 426
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v5, "createFromParcel"

    new-array v6, v3, [Ljava/lang/Class;

    const-class v7, Landroid/os/Parcel;

    aput-object v7, v6, v1

    invoke-virtual {p0, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    .line 427
    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 430
    invoke-virtual {p2, p1, p0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 431
    const-string p0, "Strategy 3: Created SigningInfo via CREATOR"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 435
    :try_start_2
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    return v3

    :cond_1
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    goto :goto_0

    :catchall_0
    move-exception p0

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 436
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p0

    .line 438
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Strategy 3 (CREATOR) failed: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v1
.end method

.method private tryModifySigningInfoFields(Ljava/lang/Object;)Z
    .locals 10

    .line 362
    const-string v0, "SignatureSpoof"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 366
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "SigningInfo fields: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 367
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    array-length v5, v4

    move v6, v1

    :goto_0
    if-ge v6, v5, :cond_0

    aget-object v7, v4, v6

    .line 368
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ") "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 370
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    array-length v3, v2

    move v4, v1

    move v5, v4

    :goto_1
    if-ge v4, v3, :cond_4

    aget-object v6, v2, v4

    const/4 v7, 0x1

    .line 374
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 376
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    const-class v9, [Landroid/content/pm/Signature;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 377
    new-array v5, v7, [Landroid/content/pm/Signature;

    iget-object v8, p0, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    aput-object v8, v5, v1

    invoke-virtual {v6, p1, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 378
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Set Signature[] field: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    move v5, v7

    goto :goto_3

    .line 380
    :cond_1
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/Boolean;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 382
    :cond_2
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "multiple"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 383
    invoke-virtual {v6, p1, v1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    .line 384
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Set boolean field to false: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_3
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    :cond_4
    return v5

    :catch_0
    move-exception p0

    .line 392
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Strategy 2 (field enumeration) failed: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method private trySetSigningInfoToNull(Landroid/content/pm/PackageInfo;Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 446
    const-string p0, "SignatureSpoof"

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p2, p1, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 447
    const-string p1, "Strategy 4: Set signingInfo to null"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception p1

    .line 450
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Strategy 4 (set to null) failed: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 209
    const-string v4, "SignatureSpoof"

    .line 0
    const-string v0, "Spoofed signature for getPackageArchiveInfo: "

    const-string v5, "Spoofed signing certificate history for: "

    const-string v6, "Spoofed signature for getPackageInfo: "

    .line 209
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    .line 212
    const-string v8, "getPackageInfo"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-wide/32 v9, 0x8000000

    const-wide/16 v11, 0x40

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x1

    if-eqz v8, :cond_1

    .line 213
    aget-object v0, v3, v13

    check-cast v0, Ljava/lang/String;

    .line 214
    aget-object v5, v3, v16

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    and-long/2addr v11, v7

    cmp-long v5, v11, v14

    if-nez v5, :cond_0

    and-long/2addr v9, v7

    cmp-long v5, v9, v14

    if-eqz v5, :cond_5

    .line 216
    :cond_0
    iget-object v5, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->packageName:Ljava/lang/String;

    .line 217
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 218
    iget-object v5, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->originalPackageManager:Ljava/lang/Object;

    invoke-virtual {v2, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    if-eqz v5, :cond_5

    .line 220
    invoke-direct {v1, v5}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofPackageInfo(Landroid/content/pm/PackageInfo;)V

    .line 221
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " (flags=0x"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v7, v8}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ")"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v5

    .line 228
    :cond_1
    const-string v6, "getPackageArchiveInfo"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 230
    aget-object v5, v3, v16

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    and-long v7, v5, v11

    cmp-long v7, v7, v14

    if-nez v7, :cond_2

    and-long/2addr v5, v9

    cmp-long v5, v5, v14

    if-eqz v5, :cond_5

    .line 232
    :cond_2
    iget-object v5, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->originalPackageManager:Ljava/lang/Object;

    invoke-virtual {v2, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/PackageInfo;

    if-eqz v5, :cond_5

    .line 233
    iget-object v6, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->packageName:Ljava/lang/String;

    iget-object v7, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 234
    invoke-direct {v1, v5}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofPackageInfo(Landroid/content/pm/PackageInfo;)V

    .line 235
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v5

    .line 242
    :cond_3
    const-string v0, "getSigningCertificateHistory"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v6, 0x1c

    if-eqz v0, :cond_4

    .line 243
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v6, :cond_5

    .line 244
    aget-object v0, v3, v13

    check-cast v0, Ljava/lang/String;

    .line 245
    iget-object v6, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 247
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->createSpoofedSigningCertificateHistory()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 249
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v6

    .line 257
    :cond_4
    const-string v0, "hasSigningCertificate"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 258
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v6, :cond_5

    .line 259
    aget-object v0, v3, v13

    check-cast v0, Ljava/lang/String;

    .line 260
    aget-object v5, v3, v16

    check-cast v5, [B

    .line 261
    iget-object v6, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v0, :cond_5

    .line 264
    :try_start_1
    iget-object v0, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->spoofedSignature:Landroid/content/pm/Signature;

    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    .line 265
    invoke-static {v5, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 266
    const-string v0, "hasSigningCertificate: returning true for spoofed cert"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 270
    :try_start_2
    const-string v5, "Error comparing certificates"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    .line 276
    const-string v5, "Error in static invocation handler"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 279
    :cond_5
    :goto_0
    iget-object v0, v1, Lcom/p1/mobile/putong/data/extension/signature/SignatureSpoofApplication$StaticInvocationHandler;->originalPackageManager:Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
