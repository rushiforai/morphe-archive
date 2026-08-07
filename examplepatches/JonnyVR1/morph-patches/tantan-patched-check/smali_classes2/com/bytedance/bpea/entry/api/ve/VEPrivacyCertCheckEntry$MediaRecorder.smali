.class public final Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaRecorder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;
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
        "Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;",
        "",
        "()V",
        "Companion",
        "ve-entry_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

.field public static final RELEASE_MEDIA_RECORDER:Ljava/lang/String; = "mediaRecord_release"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final START_MEDIA_RECORDER:Ljava/lang/String; = "mediaRecord_start"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final STOP_MEDIA_RECORDER:Ljava/lang/String; = "mediaRecord_stop"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;->Companion:Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

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

.method public static final release(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
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

    sget-object v0, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;->Companion:Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

    invoke-virtual {v0, p0}, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;->release(Lcom/bytedance/bpea/basics/Cert;)V

    return-void
.end method

.method public static final start(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
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

    sget-object v0, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;->Companion:Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

    invoke-virtual {v0, p0}, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;->start(Lcom/bytedance/bpea/basics/Cert;)V

    return-void
.end method

.method public static final stop(Lcom/bytedance/bpea/basics/Cert;)V
    .locals 1
    .param p0    # Lcom/bytedance/bpea/basics/Cert;
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

    sget-object v0, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder;->Companion:Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;

    invoke-virtual {v0, p0}, Lcom/bytedance/bpea/entry/api/ve/VEPrivacyCertCheckEntry$MediaRecorder$Companion;->stop(Lcom/bytedance/bpea/basics/Cert;)V

    return-void
.end method
