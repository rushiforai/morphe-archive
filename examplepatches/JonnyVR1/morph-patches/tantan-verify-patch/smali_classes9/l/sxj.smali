.class public final Ll/sxj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\t\u0008\u0086\u0008\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0010\u0010\t\u001a\u00020\u0008H\u00d6\u0001\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0010\u0010\u000c\u001a\u00020\u000bH\u00d6\u0001\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001a\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0012\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0015\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/sxj;",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;",
        "callInfo",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;",
        "voiceCallInfo",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;)V",
        "",
        "toString",
        "()Ljava/lang/String;",
        "",
        "hashCode",
        "()I",
        "other",
        "",
        "equals",
        "(Ljava/lang/Object;)Z",
        "a",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;",
        "b",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 11
    .line 12
    iput-object p2, p0, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/sxj;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/sxj;

    .line 12
    .line 13
    iget-object v1, p0, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 14
    .line 15
    iget-object v3, p1, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    iget-object p0, p0, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 25
    .line 26
    iget-object p1, p1, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 27
    .line 28
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/sxj;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sxj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "GiftRequestCallInfoPair(callInfo="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v0, ", voiceCallInfo="

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ")"

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
