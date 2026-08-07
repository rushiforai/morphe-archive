.class public final Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;",
        "",
        "()V",
        "Companion",
        "common-entry_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final checkAndTranslateSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/bpea/basics/CheckResult;
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkAndTranslateSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/bytedance/bpea/basics/CheckResult;

    move-result-object p0

    return-object p0
.end method

.method public static final checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkBPEAEntryCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkClipboardCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkClipboardCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkLocationCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkLocationCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkMediaRecorderCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkMediaRecorderCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # [Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkSDKCert(Lcom/bytedance/bpea/basics/Cert;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static final checkVideoCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
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

    sget-object v0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    invoke-virtual {v0, p0, p1}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkVideoCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    return-void
.end method
