.class public final Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J9\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00082\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0010\u000cJ\u001a\u0010\r\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0007J/\u0010\u0010\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00082\u0006\u0010\u000f\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0010\u0011J\u001a\u0010\u0012\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0007J\u001a\u0010\u0013\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0007J\u001a\u0010\u0014\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0007J7\u0010\u0015\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00082\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0010\u0016J\u001a\u0010\u0017\u001a\u00020\u000e2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0007J-\u0010\u0018\u001a\u00020\u00192\u000e\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\t\u0018\u00010\u00082\u0006\u0010\u000f\u001a\u00020\t2\u0006\u0010\u001a\u001a\u00020\u001bH\u0002\u00a2\u0006\u0002\u0010\u001c\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;",
        "",
        "()V",
        "checkAndTranslateSDKCert",
        "Lcom/bytedance/bpea/basics/CheckResult;",
        "cert",
        "Lcom/bytedance/bpea/basics/Cert;",
        "dataTypes",
        "",
        "",
        "sdkName",
        "methodName",
        "(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/bpea/basics/CheckResult;",
        "checkAudioCert",
        "",
        "entryToken",
        "checkBPEAEntryCert",
        "(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V",
        "checkClipboardCert",
        "checkLocationCert",
        "checkMediaRecorderCert",
        "checkSDKCert",
        "(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "checkVideoCert",
        "createCertContext",
        "Lcom/bytedance/bpea/basics/CertContext;",
        "entryCategory",
        "",
        "([Ljava/lang/String;Ljava/lang/String;I)Lcom/bytedance/bpea/basics/CertContext;",
        "common-entry_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;-><init>()V

    return-void
.end method

.method private final createCertContext([Ljava/lang/String;Ljava/lang/String;I)Lcom/bytedance/bpea/basics/CertContext;
    .locals 0

    .line 1
    new-instance p0, Lcom/bytedance/bpea/basics/CertContext;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/bytedance/bpea/basics/CertContext;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/bytedance/bpea/basics/CertContext;->setEntryDataTypes([Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/bytedance/bpea/basics/CertContext;->setEntryToken(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/bytedance/bpea/basics/CertContext;->setEntryCategory(Ljava/lang/Integer;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method


# virtual methods
.method public final checkAndTranslateSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/bpea/basics/CheckResult;
    .locals 2
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x5f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/bytedance/bpea/basics/EntryCategory;->DIRECT_AUTH:Lcom/bytedance/bpea/basics/EntryCategory;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/bytedance/bpea/basics/EntryCategory;->getType()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-direct {p0, p2, v0, v1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->createCertContext([Ljava/lang/String;Ljava/lang/String;I)Lcom/bytedance/bpea/basics/CertContext;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p2, "sdkName"

    .line 38
    .line 39
    invoke-virtual {p0, p2, p3}, Lcom/bytedance/bpea/basics/CertContext;->addExtraInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p2, "methodName"

    .line 43
    .line 44
    invoke-virtual {p0, p2, p4}, Lcom/bytedance/bpea/basics/CertContext;->addExtraInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sget-object p2, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->INSTANCE:Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

    .line 48
    .line 49
    invoke-virtual {p2, p1, p0}, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->check(Lcom/bytedance/bpea/basics/Cert;Lcom/bytedance/bpea/basics/CertContext;)Lcom/bytedance/bpea/basics/CheckResult;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "audio"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/bytedance/bpea/basics/EntryCategory;->BPEA_ENTRY:Lcom/bytedance/bpea/basics/EntryCategory;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/bytedance/bpea/basics/EntryCategory;->getType()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-direct {p0, p2, p3, v0}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->createCertContext([Ljava/lang/String;Ljava/lang/String;I)Lcom/bytedance/bpea/basics/CertContext;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object p2, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->INSTANCE:Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

    .line 15
    .line 16
    invoke-virtual {p2, p1, p0}, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->check(Lcom/bytedance/bpea/basics/Cert;Lcom/bytedance/bpea/basics/CertContext;)Lcom/bytedance/bpea/basics/CheckResult;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final checkClipboardCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "clipboard"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final checkLocationCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "latitudeAndLongitude"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final checkMediaRecorderCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "audio"

    .line 5
    .line 6
    const-string v1, "video"

    .line 7
    .line 8
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, p1, v0, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final checkSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const/16 v1, 0x5f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/bytedance/bpea/basics/EntryCategory;->DIRECT_AUTH:Lcom/bytedance/bpea/basics/EntryCategory;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/bytedance/bpea/basics/EntryCategory;->getType()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-direct {p0, p2, v0, v1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->createCertContext([Ljava/lang/String;Ljava/lang/String;I)Lcom/bytedance/bpea/basics/CertContext;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p2, "sdkName"

    .line 38
    .line 39
    invoke-virtual {p0, p2, p3}, Lcom/bytedance/bpea/basics/CertContext;->addExtraInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p2, "methodName"

    .line 43
    .line 44
    invoke-virtual {p0, p2, p4}, Lcom/bytedance/bpea/basics/CertContext;->addExtraInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sget-object p2, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->INSTANCE:Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;

    .line 48
    .line 49
    invoke-virtual {p2, p1, p0}, Lcom/bytedance/bpea/entry/common/PrivacyCertCheckerHolder;->check(Lcom/bytedance/bpea/basics/Cert;Lcom/bytedance/bpea/basics/CertContext;)Lcom/bytedance/bpea/basics/CheckResult;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final checkVideoCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bytedance/bpea/basics/BPEAException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "video"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, p1, v0, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
