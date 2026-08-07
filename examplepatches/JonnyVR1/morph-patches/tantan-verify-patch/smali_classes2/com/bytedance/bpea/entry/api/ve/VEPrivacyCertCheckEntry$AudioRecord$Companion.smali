.class public final Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$AudioRecord$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$AudioRecord;
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
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0007J\u0012\u0010\u000b\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0007J\u0012\u0010\u000c\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\nH\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$AudioRecord$Companion;",
        "",
        "()V",
        "RELEASE_AUDIO_RECORD",
        "",
        "START_AUDIO_RECORD",
        "STOP_AUDIO_RECORD",
        "release",
        "",
        "cert",
        "Lcom/bytedance/bpea/basics/Cert;",
        "start",
        "stop",
        "ve-entry_release"
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
    invoke-direct {p0}, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$AudioRecord$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final release(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    sget-object p0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    .line 2
    .line 3
    const-string v0, "audio_release"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final start(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    sget-object p0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    .line 2
    .line 3
    const-string v0, "audio_start"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final stop(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p1    # Lcom/bytedance/bpea/basics/Cert;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    sget-object p0, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry;->Companion:Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;

    .line 2
    .line 3
    const-string v0, "audio_stop"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/bytedance/bpea/entry/common/BPEACertAuthEntry$Companion;->checkAudioCert(Lcom/bytedance/bpea/basics/Cert;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
