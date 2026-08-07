.class public final Ll/vpn0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vpn0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000c\u0008\u0086\u0008\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nH\u00d6\u0001\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0010\u0010\u000e\u001a\u00020\rH\u00d6\u0001\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003\u00a2\u0006\u0004\u0008\u0012\u0010\u0013R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0007\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001d"
    }
    d2 = {
        "Ll/vpn0$a;",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;",
        "feedItem",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;",
        "goAction",
        "<init>",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V",
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
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;",
        "a",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;",
        "Lcom/p1/mobile/putong/data/User;",
        "c",
        "()Lcom/p1/mobile/putong/data/User;",
        "Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;",
        "b",
        "()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;",
        "base_intlGmsRelease"
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
.field private final feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final user:Lcom/p1/mobile/putong/data/User;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 11
    .line 12
    iput-object p2, p0, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iput-object p3, p0, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Lcom/p1/mobile/putong/data/User;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

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
    instance-of v1, p1, Ll/vpn0$a;

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
    check-cast p1, Ll/vpn0$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 14
    .line 15
    iget-object v3, p1, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

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
    iget-object v1, p0, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v3, p1, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    return v2

    .line 35
    :cond_3
    iget-object p0, p0, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 36
    .line 37
    iget-object p1, p1, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 38
    .line 39
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_4

    .line 44
    .line 45
    return v2

    .line 46
    :cond_4
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    :goto_0
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x1f

    .line 21
    .line 22
    iget-object p0, p0, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    add-int/2addr v0, p0

    .line 29
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vpn0$a;->feedItem:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveUserFeedList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vpn0$a;->user:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vpn0$a;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "ShipLinkItemData(feedItem="

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, ", user="

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v0, ", goAction="

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ")"

    .line 34
    .line 35
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
